USE [metod]
GO

/****** Object:  StoredProcedure [dbo].[ms_api]    Script Date: 06.04.2023 22:57:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[ms_api]
	@action varchar(50),
	@js varchar(max),
	@rp varchar(max) out
as
begin
	set nocount on

	begin try
		declare 
		 @err        nvarchar(100)
	    ,@errdesc    nvarchar(100)
		,@sba        nvarchar(50) = substring(@action, 1, charindex('.', @action) - 1)

		,@rp_        nvarchar(max)
		,@js_        nvarchar(max)

		set dateformat dmy

		--��������
		if (@sba in ('customer'))
			begin
				declare
				 @cust_id     uniqueidentifier = json_value(@js, '$.id')
				,@cust_fio   nvarchar(50)     = json_value(@js, '$.fio')
				,@cust_address    nvarchar(200)     = json_value(@js, '$.address')
				,@cust_phone     nvarchar(20)    = json_value(@js, '$.phone')
				,@cust_status char(1)

				--��������� ������ ���������
				if (@action in ('customer.get'))
					begin
						set @rp =	(select * 
									from [dbo].[customer] with (nolock)
									where ([id] = @cust_id or [phone] = @cust_phone) and [status] = 'Y'
									for json path, without_array_wrapper)


						goto ok
					end
					 
				--�������� ���������
				if (@action in ('customer.create'))
					begin

						--�������� ������������ ���������� �� null
						if (@cust_fio is null 
							or @cust_address  is null
							or @cust_phone is null)
							begin
								set @err = 'err.customer_create.unset_field'
								set @errdesc = '������� �� ��� ����������� ���������'

								goto err
							end

						--�������� �� ���������� ������ �������
						if (@cust_fio like '%[^�-�^a-z^ ]%')
							begin
								set @err = 'err.customer_create.invalid_fio'
								set @errdesc = '�������� ������ ���'

								goto err
							end
					
						--�������� �� ���������� ������ ��������
						if (@cust_phone not like '89%' or len(@cust_phone) <> 11 or @cust_phone like '%[^0-9]%')
							begin
								set @err = 'err.customer_create.invalid_phone'
								set @errdesc = '�������� ������ ��������'

								goto err
							end

						--�������� �� ��� ������������� ���������
						set @rp_ = null
						set @js_ = (select @cust_phone [phone] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.customer_create.not_unique_phone'
								set @errdesc = '�������� c ����� ��������� ��� ����������'

								goto err
							end
						
						--��������� �������� � �������
						set @cust_id = newid()

						insert into [dbo].[customer]
						values (
								@cust_id,
								getdate(),
								@cust_fio,
								@cust_address,
								@cust_phone,
								'Y'
								)

						--�������
						set @rp =	(select	@cust_id   [id]
											,@cust_fio [fio]
											,@cust_address  [address]
											,@cust_phone   [phone]
									for json path, without_array_wrapper)
									

						goto ok
					end

				--�������������� ���������
				if (@action in ('customer.edit'))
					begin

						--�������� �� ������� id
						if (@cust_id is null)
							begin
								set @err = 'err.customer_edit.unset_field'
								set @errdesc = '�������� �� ������'

								goto err
							end

						--�������� �� ������� ������������� ����������
						if (@cust_fio is null and @cust_address is null and @cust_phone is null)
							begin
								set @err = 'err.customer_edit.hasnt_data'
								set @errdesc = '����������� ������ ��������������'

								goto err
							end

						--�������� �� ���������� ������ �������
						if (@cust_fio is not null) and (@cust_fio like '%[^�-�^a-z^ ]%')
							begin
								set @err = 'err.customer_edit.invalid_fio'
								set @errdesc = '�������� ������ ���'

								goto err
							end

						--�������� �� ���������� ������ ��������
						if (@cust_phone is not null) and (@cust_phone not like '89%' or len(@cust_phone) <> 11 or @cust_phone like '%[^0-9]%')
							begin
								set @err = 'err.customer_edit.invalid_phone'
								set @errdesc = '�������� ������ ��������'

								goto err
							end

						--�������� �� ������������� ���������
						set @rp_ = null
						set @js_ = (select @cust_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.customer_edit.object_not_found'
								set @errdesc = '�������� �� ������'

								goto err
							end
						
						--�������� �� ������������ ��������
						if (@cust_phone is not null)
							begin
								set @rp_ = null
								set @js_ = (select @cust_phone [phone] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.customer_edit.not_unique_phone'
										set @errdesc = '�������� c ����� ��������� ��� ����������'

										goto err
									end
							end
						
						--��������
						update [dbo].[customer]
						set	[fio]		= isnull(@cust_fio, [fio]),
							[address]	= isnull(@cust_address, [address]),
							[phone]		= isnull(@cust_phone, [phone])
						where [id] = @cust_id

						--�������
						set @rp =	(select * from [dbo].[customer] with (nolock)
									where [id] = @cust_id 
									for json path, without_array_wrapper)


						goto ok
					end
								
				--��������� ���������
				if (@action in ('customer.activate'))
					begin

						--�������� �� ������� id
						if (@cust_id is null)
							begin
								set @err = 'err.customer_activate.unset_field'
								set @errdesc = '�������� �� ������'

								goto err
							end

						select	@cust_phone = [phone],
								@cust_status = [status]
						from [dbo].[customer]
						where [id] = @cust_id
						
						--�������� �� ������������� ��������� (����� ������ ����������)
						if (@cust_phone is null)
							begin
								set @err = 'err.customer_activate.object_not_found'
								set @errdesc = '�������� �� ������'

								goto err
							end
						
						--�������� ������� �� ��������
						if (@cust_status = 'Y')
							begin
								set @err = 'err.customer_activate.object_is_active'
								set @errdesc = '�������� ��� �������'

								goto err
							end

						--�������� �� ��� ������������ ����� �������� ��������� ���������
						set @rp_ = null
						set @js_ = (select @cust_phone [phone] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.customer_activate.object_phone_is_active'
								set @errdesc = '�������� � ����� ��������� ��� �������'

								goto err
							end
																								
						--������ ������ ���������
						update [dbo].[customer]
						   set [status] = 'Y'
						where [id] = @cust_id
												
						--�������
						set @rp =	(select	@cust_id    [id]
											,'Y'		[status]
									for json path, without_array_wrapper)
								   

						goto ok
					end

			    --����������� ���������
				if (@action in ('customer.deactivate'))
					begin

						--�������� �� ������� id
						if (@cust_id is null)
							begin
								set @err = 'err.customer_deactivate.unset_field'
								set @errdesc = '�������� �� ������'

								goto err
							end

						--�������� �� ������������� ���������
						set @rp_ = null
						set @js_ = (select @cust_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.customer_deactivate.object_not_found'
								set @errdesc = '�������� �� ������'

								goto err
							end
						
						--�������� �� �� ��� � �������� ����� ��� �������� 
						set @rp_ = null
						set @js_ = (select [id] from [dbo].[order] with (nolock) where [id_cust] = @cust_id and [status] = 'on_way' for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.customer_deactivate.customer_has_orders' 
								set @errdesc = '� ��������� ���� ������' 
 
								goto err 
							end
						
						--��������  
						begin tran

							-- ������ ������ ���������
							update [dbo].[customer]
							set [status] = 'N'
							where  [id] = @cust_id

							-- ������� �� ����� ������ / �������� ������ ������� � id ����� ��������� 
							update [dbo].[order] 
							set [status] = 'cancel' 
							where  [id_cust] = @cust_id and [status] not in('cancel', 'success')

						commit tran

						--�������
						set @rp =	(select	@cust_id [id]
											,'N' [status]
									for json path, without_array_wrapper)


						goto ok
					end			
			end


		--�����
		if (@sba in ('point'))
			begin
				declare 
					@point_id	uniqueidentifier	=	json_value(@js, '$.id')
					,@point_name	nvarchar(200)	=	json_value(@js, '$.name')
					,@point_address nvarchar(200)	=	json_value(@js, '$.address')
					,@point_phone   nvarchar(11)	=	json_value(@js, '$.phone')
					,@point_coorx		int			=	json_value(@js, '$.coordinate_x')
					,@point_coory		int			=	json_value(@js, '$.coordinate_y')
					,@point_status	char(1)	
					,@coordy int
					,@coordx int

				--��������� ������ ������
				if (@action in ('point.get'))
					begin
						set @rp =	(select * 
									from [dbo].[point] with (nolock)
									where ([id] = @point_id or [phone] = @point_phone or [address] = @point_address or (@point_coorx = [coordinate_x] and @point_coory = [coordinate_y])) and [status] = 'Y'
									for json path, without_array_wrapper)

						goto ok
					end

				--�������� ������
				if (@action in ('point.create'))
					begin

						--�������� ������������ ���������� �� null
						if (@point_name is null 
							or @point_address  is null
							or @point_phone is null
							or @point_coorx is null
							or @point_coory is null)
							begin
								set @err = 'err.point_create.unset_field'
								set @errdesc = '������� �� ��� ����������� ���������'

								goto err
							end

						--�������� �� ���������� ������ ��������
						if (@point_phone not like '89%' or len(@point_phone) <> 11 or @point_phone like '%[^0-9]%')
							begin
								set @err = 'err.point_create.invalid_phone'
								set @errdesc = '�������� ������ ��������'

								goto err
							end

						--�������� �� ���������� ������ ���������
						if (@point_coorx not between 1 and 100) or (@point_coory not between 1 and 100)
							begin
								set @err = 'err.point_create.invalid_coordinate'
								set @errdesc = '�������� ������ ���������'

								goto err
							end

						--�������� �� ������������� ������
						set @rp_ = null
						set @js_ = (select @point_phone [phone], @point_address [address], @point_coorx [coordinate_x], @point_coory [coordinate_y] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.point_create.not_unique_data'
								set @errdesc = '����� c ������ ����������� ��� ����������'

								goto err							
							end

						--��������� �������� � �������
						set @point_id = newid()

						insert into [dbo].[point] 
						values (
								@point_id
								,getdate()
								,@point_name
								,@point_address
								,@point_phone
								,@point_coorx
								,@point_coory
								,'Y'
								)

						--�������
						set @rp =	(select	@point_id [id]
											,@point_name [fio]
											,@point_address  [address] 
											,@point_phone [phone]
											,@point_coorx [coordinate_x]
											,@point_coory [coordinate_y]
						   
									for json path, without_array_wrapper)


						goto ok	  
					end
							
			    --�������������� ������
				if (@action in ('point.edit'))
					begin

						--�������� �� ������� id
						if (@point_id is null)
							begin
								set @err = 'err.point_edit.unset_field'
								set @errdesc = '����� �� ������'

								goto err
							end

						--�������� �� ������� ������������� ����������
						if (@point_name is null and
							@point_address is null and 
							@point_phone is null and
							@point_coorx is null and
							@point_coory is null)
							begin
								set @err = 'err.point_edit.hasnt_data'
								set @errdesc = '����������� ������ ��������������'

								goto err
							end

						--�������� �� ���������� ������ ��������
						if (@point_phone is not null) and (@point_phone not like '89%' or len(@point_phone) <> 11 or @point_phone like '%[^0-9]%')
							begin
								set @err = 'err.point_edit.invalid_phone'
								set @errdesc = '�������� ������ ��������'

								goto err
							end

						--�������� �� ���������� ������ ���������� x
						if (@point_coorx is not null) and (@point_coorx not between 1 and 100)
							begin
								set @err = 'err.point_edit.invalid_coordinate_x'
								set @errdesc = '�������� ������ ���������� x'

								goto err
							end

						--�������� �� ���������� ������ ���������� y
						if (@point_coory is not null) and (@point_coory not between 1 and 100)
							begin
								set @err = 'err.point_edit.invalid_coordinate_y'
								set @errdesc = '�������� ������ ���������� y'

								goto err
							end

						--�������� �� ������������� ������ 
						set @rp_ = null
						set @js_ = (select @point_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.point_edit.object_not_found'
								set @errdesc = '����� �� ������'

								goto err
							end

						--�������� �� ��� ������������ ����� �������� ������
						if (@point_phone is not null)
							begin
								set @rp_ = null
								set @js_ = (select @point_phone [phone] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.point_edit.not_unique_phone'
										set @errdesc = '����� c ����� ��������� ��� ����������'

										goto err
									end
							end

						--�������� �� ��� ������������ ����� ������
						if (@point_address is not null)
							begin
								set @rp_ = null
								set @js_ = (select @point_address [address] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.point_edit.not_unique_address'
										set @errdesc = '����� c ����� ������� ��� ����������'

										goto err
									end
							end


						set @rp_ = null
						set @js_ = (select @point_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

						set @coordx = json_value(@rp_, '$.response.coordinate_x')
						set @coordy = json_value(@rp_, '$.response.coordinate_y')

						--�������� �� ��� ������������ ����� ������
						if (@point_coorx is not null or @point_coory is not null)
							begin
								set @rp_ = null
								set @js_ = (select ISNULL(@point_coorx, @coordx) [coordinate_x], ISNULL(@point_coory, @coordy) [coordinate_y] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.point_edit.not_unique_coordinates'
										set @errdesc = '����� c ������ ������������ ��� ����������'

										goto err
									end
							end

											
						--��������
						update [dbo].[point]
						set		[name]			= isnull(@point_name, [name]),
								[address]		= isnull(@point_address, [address]),
								[phone]			= isnull(@point_phone, [phone]),
								[coordinate_x]	= isnull(@point_coorx, [coordinate_x]),
								[coordinate_y]	= isnull(@point_coory, [coordinate_y])
						where [id] = @point_id

						--�������
						set @rp = (select * from [dbo].[point] with (nolock)
						where [id] = @point_id 
						for json path, without_array_wrapper)


						goto ok
					end	
					
				--��������� ������
				if (@action in ('point.activate'))
					begin

						--�������� �� ������� id
						if (@point_id is null)
							begin
								set @err = 'err.point_activate.unset_field'
								set @errdesc = '����� �� ������'

								goto err
							end

						select	@point_phone = [phone],
								@point_address = [address],
								@point_coorx = [coordinate_x],
								@point_coory = [coordinate_y],
								@point_status = [status]
						from [dbo].[point] with (nolock)
						where [id] = @point_id

						--�������� �� ������������� ������
						if (@point_phone is null)
							begin
								set @err = 'err.point_activate.object_not_found'
								set @errdesc = '����� �� ������'

								goto err
							end

						--�������� ������� �� �����
						if (@point_status = 'Y')
							begin
								set @err = 'err.point_activate.object_is_active'
								set @errdesc = '����� ��� �������'

								goto err
							end

						--�������� �� ������������� ��������� ������ c ������ �� �������
						set @rp_ = null
						set @js_ = (select @point_phone [phone], @point_address [address], @point_coorx [coordinate_x], @point_coory [coordinate_y] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.point_activate.object_data_is_active'
								set @errdesc = '�������� � ������ ������� ��� �������'

								goto err
							end

						--��������� ������
						update [dbo].[point]
						set [status] = 'Y'
						where [id] = @point_id

						--�������
						set @rp =	(select	@point_id [id]
											, 'Y'    [status]
									for json path, without_array_wrapper)
		

						goto ok

					end

				--����������� ������
				if (@action in ('point.deactivate'))
					begin

						--�������� �� ������� id
						if (@point_id is null)
							begin
								set @err = 'err.point_deactivate.unset_field'
								set @errdesc = '����� �� ������'

								goto err
							end

						--�������� �� ������������� ��������� ������
						set @rp_ = null
						set @js_ = (select @point_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.point_deactivate.object_not_found'
								set @errdesc = '����� �� ������'

								goto err
							end

						--�������� �� ������� ������� � ������
						set @rp_ = null
						set @js_ = (select [id] from [dbo].[order] with (nolock) where [id_point] = @point_id and [status] in ('collecting', 'wait', 'on_way') for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin 
								set @err = 'err.point_deactivate.point_has_orders' 
								set @errdesc = '� ������ ���� ������' 
 
								goto err 
							end

						--��������  
						begin tran

							-- ������ ������ ������
							update [dbo].[point]
							set [status] = 'N'
							where  [id] = @point_id

							-- ������� �� ����� ������ / ����� ������ ������� � id ����� ������
							update [dbo].[order] 
							set [status] = 'cancel' 
							where  [id_point] = @point_id and [status] not in ('cancel', 'success')

						commit tran

						--�������
						set @rp =	(select @point_id [id]
											,'N' [status]
									for json path, without_array_wrapper)


						goto ok
					end
			end


		--������
		if (@sba in ('delivery'))
			begin
				declare		
				 @deliv_id	uniqueidentifier = json_value(@js, '$.id')
				,@deliv_fio	nvarchar(200)	 = json_value(@js, '$.fio')
				,@deliv_birth	date		 = json_value(@js, '$.date_of_birth')
				,@deliv_phone	nvarchar(20) = json_value(@js, '$.phone')	
				,@deliv_status	char(1)
	
				--��������� ������ �������
				if (@action in ('delivery.get'))
					begin
						set @rp =	(select * 
									from [dbo].[delivery] with (nolock)
									where ([id] = @deliv_id or [phone] = @deliv_phone) and [status] = 'Y'
									for json path, without_array_wrapper)


						goto ok
					end

				--�������� �������
				if (@action in ('delivery.create'))
					begin

						--�������� ������������ ���������� �� null
						if (@deliv_fio is null 
							or @deliv_birth is null
							or @deliv_phone is null)
							begin
								set @err = 'err.delivery_create.unset_field'
								set @errdesc = '������� �� ��� ����������� ���������'

								goto err
							end

						--�������� �� ���������� ������ ��������
						if (@deliv_phone not like '89%' or len(@deliv_phone) <> 11 or @deliv_phone like '%[^0-9]%')
							begin
								set @err = 'err.delivery_create.invalid_phone'
								set @errdesc = '�������� ������ ��������'

								goto err
							end

						--�������� �� ���������� ������ �������
						if (@deliv_fio like '%[^�-�^a-z^ ]%')
							begin
								set @err = 'err.delivery_create.invalid_fio'
								set @errdesc = '�������� ������ ���'

								goto err
							end

						--�������� �� �������
						if ((YEAR(getdate()) - YEAR(@deliv_birth)) < 18)
							begin
								set @err = 'err.delivery_create.age_less_18'
								set @errdesc = '���������� ������ ������������ ���'

								goto err
							end

						--�������� �������� �� ������������
						set @rp_ = null
						set @js_ = (select @deliv_phone [phone] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.delivery_create.not_unique_phone'
								set @errdesc = '��������� c ����� ��������� ��� ����������'

								goto err							
							end

						--��������� �������� � �������						
						set @deliv_id = newid()
						insert into [dbo].[delivery] 
						values (
								@deliv_id
								,getdate()
								,@deliv_fio
								,@deliv_birth
								,@deliv_phone
								,'Y'
								)

						--�������
						set @rp =	(select @deliv_id [id]
											,@deliv_birth [date_of_birth]
											,@deliv_fio [fio]
											,@deliv_phone [phone]
						   
									for json path, without_array_wrapper)
									

						goto ok
					end
				
				--�������������� �������
				if (@action in ('delivery.edit'))
					begin

						--�������� �� ������� id
						if (@deliv_id is null)
							begin
								set @err = 'err.delivery_edit.unset_field'
								set @errdesc = '��������� �� ������'

								goto err
							end

						--�������� �� ������� ������������� ����������
						if (@deliv_fio is null and @deliv_birth is null and @deliv_phone is null)
							begin
								set @err = 'err.delivery_edit.hasnt_data'
								set @errdesc = '����������� ������ ��������������'

								goto err
							end
						
						--�������� �� ���������� ������ �������
						if (@deliv_fio is not null) and (@deliv_fio like '%[^�-�^a-z^ ]%')
							begin
								set @err = 'err.delivery_edit.invalid_fio'
								set @errdesc = '�������� ������ ���'

								goto err
							end

						--�������� �� ���������� ������ ��������
						if (@deliv_phone is not null) and (@deliv_phone not like '89%' or len(@deliv_phone) <> 11 or @deliv_phone like '%[^0-9]%')
							begin
								set @err = 'err.delivery_edit.invalid_phone'
								set @errdesc = '�������� ������ ��������'

								goto err 
							end

						--�������� �� �������
						if (@deliv_birth is not null) and ((YEAR(getdate()) - YEAR(@deliv_birth)) < 18)
							begin
								set @err = 'err.delivery_edit.age_less_18'
								set @errdesc = '���������� ������ ������������ ���'

								goto err
							end

						--�������� �� ������������� �������
						set @rp_ = null
						set @js_ = (select @deliv_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.delivery_edit.object_not_found'
								set @errdesc = '��������� �� ������'

								goto err
							end

						--�������� �� ������������ ������ �������
						if (@deliv_phone is not null)
							begin
								set @rp_ = null
								set @js_ = (select @deliv_phone [phone] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.delivery_edit.not_unique_phone'
										set @errdesc = '��������� c ����� ��������� ��� ����������'

										goto err
									end
							end
						
						--��������
						update [dbo].[delivery]
						set	[fio]			= isnull(@deliv_fio, [fio]),
							[date_of_birth]	= isnull(@deliv_birth, [date_of_birth]),
							[phone]			= isnull(@deliv_phone, [phone])
						where  [id]			= @deliv_id

						--�������
						set @rp =	(select * from [dbo].[delivery] with (nolock)
									where [id] = @deliv_id 
									for json path, without_array_wrapper)


						goto ok
					end
			
				--��������� �������
				if (@action in ('delivery.activate'))
					begin

						--�������� �� ������� id
						if (@deliv_id is null)
							begin
								set @err = 'err.delivery_activate.unset_field'
								set @errdesc = '��������� �� ������'

								goto err
							end

						select	@deliv_phone = [phone],
								@deliv_status = [status]
						from [dbo].[delivery] with (nolock)
						where [id] = @deliv_id

						--�������� �� ������������� ������� (����� ������ ����������)
						if (@deliv_status is null)
							begin
								set @err = 'err.delivery_activate.object_not_found'
								set @errdesc = '��������� �� ������'

								goto err
							end

						--�������� ������� �� ������
						if (@deliv_status = 'Y')
							begin
								set @err = 'err.delivery_activate.object_is_active'
								set @errdesc = '��������� ��� �������'

								goto err
							end
			
						--�������� �� ��� ������������ � �������� ������� �������
						set @rp_ = null
						set @js_ = (select @deliv_phone [phone] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.delivery_activate.object_phone_is_active'
								set @errdesc = '��������� � ����� ��������� ��� �������'

								goto err
							end
																							
						--��������� ������
						update [dbo].[delivery]
						set [status] = 'Y'
						where [id] = @deliv_id

						--�������
						set @rp =	(select @deliv_id	[id]
											, 'Y'		[status]
									for json path, without_array_wrapper)
		

						goto ok
					end

			    --����������� �������
				if (@action in ('delivery.deactivate'))
					begin

						--�������� �� ������� id
						if (@deliv_id is null)
							begin
								set @err = 'err.delivery_deactivate.unset_field'
								set @errdesc = '��������� �� ������'

								goto err
							end

						--�������� �� ������������� �������
						set @rp_ = null
						set @js_ = (select @deliv_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.delivery_deactivate.object_not_found'
								set @errdesc = '��������� �� ������'

								goto err	
							end
						
						--�������� �� ������� ������� � �������
						set @rp_ = null
						set @js_ = (select [id] from [dbo].[order] with (nolock) where [id_deliv] = @deliv_id and [status] in ('on_way') for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin 
								set @err = 'err.delivery_deactivate.delivery_has_orders' 
								set @errdesc = '� ���������� ���� ������' 
 
								goto err 
							end

						--��������  
						begin tran

							-- ������ ������ �������
							update [dbo].[delivery]
							set [status] = 'N'
							where  [id] = @deliv_id

							-- ������� �� ����� ������ / ������ ������ ������� � id ����� �������
							update [dbo].[order] 
							set [id_deliv] =	(select top 1 [id] 
												from [delivery] with (nolock)
												where [id] not in (select [id_deliv] from [order] with (nolock)) order by newid()) 
							where  [id_deliv] = @deliv_id and [status] not in ('cancel', 'success')
		
							-- ������� �� ����� ����� / ��������� ������ ������� � id ����� �������
							update [dbo].[workshift] 
							set [status] = 'N' 
							where  [id_deliv] = @deliv_id and [status] = 'Y'

						commit tran

						--�������
						set @rp =	(select @deliv_id [id]
											,'N' [status]
									for json path, without_array_wrapper)


						goto ok
					end				
			end

		
		--����� �������
		if (@sba in ('workshift'))
			begin
				declare 
				 @work_id		uniqueidentifier	= json_value(@js, '$.id')
				,@work_id_deliv	uniqueidentifier	= json_value(@js, '$.id_deliv')
				,@work_coorx	int					= json_value(@js, '$.coordinate_x')
				,@work_coory	int					= json_value(@js, '$.coordinate_y')
				,@work_status	char(1)
			
				--��������� ������ ����� �������
				if (@action in ('workshift.get'))
					begin
						set @rp =	(select * 
									from [dbo].[workshift] with (nolock)
									where ([id] = @work_id or [id_deliv] = @work_id_deliv) and [status] = 'Y'
									for json path, without_array_wrapper)


						goto ok
					end

				--�������� ����� �������
				if (@action in ('workshift.create'))
					begin

						--�������� ������������ ���������� �� null
						if (@work_coorx is null 
							or @work_coory  is null
							or @work_id_deliv is null)
							begin
								set @err = 'err.workshift_create.unset_field'
								set @errdesc = '������� �� ��� ����������� ���������'

								goto err
							end
							
						--�������� �� ���������� ������ ���������
						if (@work_coorx not between 1 and 100) or (@work_coory not between 1 and 100)
							begin
								set @err = 'err.workshift_create.invalid_coordinate'
								set @errdesc = '�������� ������ ���������'

								goto err
							end						

						--�������� �� ������������� ����������
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[delivery] with (nolock) where [id] = @work_id_deliv and [status] = 'Y'  for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.workshift_create.invalid_delivery_id'
								set @errdesc = ' ������ ���������� �� ����������'

								goto err
							end

						--�������� �� ������������� ����� ������� ����������
						set @rp_ = null
						set @js_ = (select @work_id_deliv [id_deliv] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'workshift.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.workshift_create.not_unique_delivery'
								set @errdesc = '����� � ���� ����������� ��� �������'

								goto err							
							end
											
						--��������� �������� � �������
						set @work_id = newid()
						insert into [dbo].[workshift] 
						values (
								@work_id
								,getdate()
								,@work_id_deliv
								,@work_coorx
								,@work_coory
								, NULL
								,'Y'
								)

						--�������
						set @rp =	(select @work_id [id]
											,@work_id_deliv [deliv_id]
											,@work_coorx [coordinate_x]
											,@work_coory [coordinate_y]
						   
									for json path, without_array_wrapper)


						goto ok	  
					end
								
			    --�������������� �����
				if (@action in ('workshift.edit'))
					begin

						--�������� �� ������� id
						if (@work_id is null)
							begin
								set @err = 'err.workshift_edit.unset_field'
								set @errdesc = '����� �� ������'

								goto err
							end
			
						--�������� �� ������� ������������� ����������
						if (@work_id_deliv is null and
							@work_coorx is null and
							@work_coory is null)
							begin
								set @err = 'err.workshift_edit.hasnt_data'
								set @errdesc = '����������� ������ ��������������'

								goto err
							end

						--�������� �� ���������� ������ ���������� x
						if (@work_coorx is not null) and (@work_coorx not between 1 and 100)
							begin
								set @err = 'err.workshift_edit.invalid_coordinate_x'
								set @errdesc = '�������� ������ ���������� x'

								goto err
							end

						--�������� �� ���������� ������ ���������� y
						if (@work_coory is not null) and (@work_coory not between 1 and 100)
							begin
								set @err = 'err.workshift_edit.invalid_coordinate_y'
								set @errdesc = '�������� ������ ���������� y'

								goto err
							end

						--�������� �� ������������� �����
						set @rp_ = null
						set @js_ = (select @work_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'workshift.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.workshift_edit.object_not_found'
								set @errdesc = '����� �� �������'

								goto err
							end

						--�������� �� ������������� ����������
						if (@work_id_deliv is not null) and not exists (select top 1 1 from [dbo].[delivery] with (nolock) where [id] = @work_id_deliv and [status] = 'Y')
							begin
								set @err = 'err.workshift_edit.invalid_delivery_id'
								set @errdesc = ' ������ ���������� �� ����������'

								goto err
							end
																						
						--��������
						update [dbo].[workshift]
						set	[id_deliv]		= isnull(@work_id_deliv, [id_deliv]),
							[coordinate_x]	= isnull(@work_coorx, [coordinate_x]),
							[coordinate_y]	= isnull(@work_coory, [coordinate_y])
						where [id] = @work_id

						--�������
						set @rp = (select * from [dbo].[workshift] with (nolock)
						where [id] = @work_id 
						for json path, without_array_wrapper)


						goto ok
					end
					
			    --���������� �������������� �������
				if (@action in ('workshift.upd_place'))
					begin
						update [dbo].[workshift]
						set [coordinate_x] = cast(rand()*100 as int)+1,
							[coordinate_y] = cast(rand()*100 as int)+1
						where [id] = (select top 1 [id] from [dbo].[workshift] with (nolock) where [status] = 'Y' order by newid())
					end

			    --�������� ����� �������
				if (@action in ('workshift.open'))
					begin

						--�������� �� ������� id
						if (@work_id_deliv is null)
							begin
								set @err = 'err.workshift_activate.unset_field'
								set @errdesc = '����� �� �������'

								goto err
							end

						--�������� �� ������������� ����������
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[delivery] with (nolock) where [id] = @work_id_deliv and [status] = 'Y'  for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.workshift_activate.invalid_delivery_id'
								set @errdesc = ' ������ ���������� �� ����������'

								goto err
							end

						--�������� �� ������������� �����
						set @rp_ = null
						set @js_ = (select @work_id_deliv [id_deliv] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'workshift.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.workshift_activate.object_is_active'
								set @errdesc = '����� ��� �������'

								goto err
							end

						--��������� ������ � ��������������
						set @work_id = newid()

						insert into [dbo].[workshift]
						values (@work_id,
								getdate(),
								@work_id_deliv,
								cast(rand()*100 as int),
								cast(rand()*100 as int),
								NULL,
								'Y')

						--�������
						set @rp =	(select @work_id_deliv [id]
											, 'Y'    [status]
									for json path, without_array_wrapper)
		

						goto ok
					end

				--�������� ����� �������
				if (@action in ('workshift.close'))
					begin

						--�������� �� ������� id
						if (@work_id_deliv is null)
							begin
								set @err = 'err.workshift_deactivate.unset_field'
								set @errdesc = '����� �� �������'

								goto err
							end

						set @rp_ = null
						set @js_ = (select @work_id_deliv [id_deliv] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'workshift.get', @js_, @rp_ out

						set @work_status = json_value(@rp_, '$.response.status')
						set @work_id = json_value(@rp_, '$.response.id')

						--�������� �� ������������� �����
						if (@work_status is null)
							begin
								set @err = 'err.workshift_deactivate.object_not_found'
								set @errdesc = '����� �� �������'

								goto err
							end

						--�������� �� ������� ������� � ���������� � �����
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[order] with (nolock) where [id_deliv] = @work_id_deliv and [status] in ('collecting', 'wait', 'on_way') for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin 
								set @err = 'err.workshift_deactivate.delivery_in_workshift_has_orders' 
								set @errdesc = '� ���������� � ����� ���� ������' 
 
								goto err 
							end

						--��������  

						update [dbo].[workshift]
						set [status] = 'N',
							[da_end] = getdate()
						where  [id_deliv] = @work_id_deliv and [status] = 'Y'

						--�������
						set @rp =	(select @work_id_deliv [id]
											,'N' [status]
									for json path, without_array_wrapper)


						goto ok
					end
			end


		--�����
		if (@sba in ('order'))
			begin
				declare
				 @ord_id        uniqueidentifier	= json_value(@js, '$.id') 
				,@ord_name		nvarchar(200)		= json_value(@js, '$.name')
				,@ord_id_point	uniqueidentifier	= json_value(@js, '$.id_point')
				,@ord_id_cust	uniqueidentifier	= json_value(@js, '$.id_cust')
				,@ord_id_deliv	uniqueidentifier	= json_value(@js, '$.id_deliv')
				,@ord_coorx		int					= json_value(@js, '$.coordinate_x')
				,@ord_coory		int					= json_value(@js, '$.coordinate_y')
				,@krug_pnt		int					= 0
				,@smena_pnt		int					= 0
				,@krug_del		int					= 0
				,@smena_del		int					= 0
				,@per_del_del	int
				,@per_pnt		int
				,@ord_status	char(20)
				,@ord_point_coorx int
				,@ord_point_coory int

				declare @table_pnt table (krug int, x int, y int)

				declare @table_del table (krug int, x int, y int)
				
				--��������� ������ ������
				if (@action in ('order.get'))
					begin
						set @rp =	(select * 
									from [dbo].[order] with (nolock)
									where ([id] = @ord_id or [name] = @ord_name) and [status] not in ('success', 'cancel')
									for json path, without_array_wrapper)


						goto ok
					end
					
				--�������� ������
				if (@action in ('order.create'))
					begin

						--�������� ������������ ���������� �� null
						if (@ord_name is null
							or @ord_id_cust is null
							or @ord_coorx is null  
							or @ord_coory  is null)
							begin
								set @err = 'err.order_create.unset_field'
								set @errdesc = '������� �� ��� ����������� ���������'

								goto err
							end

						--�������� �� ���������� ������ ���������
						if (@ord_coorx not between 1 and 100) or (@ord_coory not between 1 and 100)
							begin
								set @err = 'err.order_create.invalid_coordinate'
								set @errdesc = '�������� ������ ���������'

								goto err
							end

						--�������� �� ������������� ���������
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[customer] with (nolock) where [id] = @ord_id_cust and [status] = 'Y' for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.order_create.invalid_customer_id'
								set @errdesc = '������ ��������� �� ����������'

								goto err
							end

						--�������� �� �������� ������
						set @rp_ = null
						set @js_ = (select @ord_name [name] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.order_create.not_unique_name'
								set @errdesc = '����� � ����� ��������� ��� ����������'

								goto err							
							end
		
						--��������� �������� � �������
						set @ord_id = newid()

						insert into [dbo].[order] 
						values (
								@ord_id
								,getdate()
								,@ord_name
								,NULL
								,@ord_id_cust
								,NULL
								,@ord_coorx
								,@ord_coory
								,'create'
								)

						--�������
						set @rp =	(select @ord_id [id]
									,@ord_id_cust [customer_id]
									,@ord_coorx [coordinate_x]
									,@ord_coory [coordinate_y]
						   
									for json path, without_array_wrapper)


						goto ok
					end
					
				--����� ������
				if (@action in ('order.search_point'))
					begin

						--�������� �� ������� id
						if (@ord_id is null)
							begin
								set @err = 'err.order_search_point.unset_field'
								set @errdesc = '����� �� ������'

								goto err
							end

						set @rp_ = null
						set @js_ = (select @ord_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						set @ord_status = json_value(@rp_, '$.response.status')
						set @ord_coorx = json_value(@rp_, '$.response.coordinate_x')
						set @ord_coory = json_value(@rp_, '$.response.coordinate_y')

						--�������� �� ������������� ������
						if (@ord_status is null)
							begin
								set @err = 'err.order_search_point.object_not_found'
								set @errdesc = '����� �� ������'

								goto err
							end

						--�������� �� ���������� ���� ������
						if (@ord_status not in ('create'))
							begin
								set @err = 'err.order_search_point.object_not_created_or_already_passed'
								set @errdesc = '����� �� ������ ��� ��� ������ ������ ����'

								goto err
							end

						--�������� �� ������������� �������
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[point] with (nolock) where [status] = 'Y' for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin try
								begin tran			
								set transaction isolation level serializable

									--��������  
									update [dbo].[order]
									set [status] = 'cancel'
									where  [id] = @ord_id
								
								set transaction isolation level read committed
								commit tran

								--�������
								set @rp =	(select @ord_id [id]
													,@ord_id_point [point_id]
													,'cancel' [status]
											for json path, without_array_wrapper)


								goto ok

							end try
							begin catch
								set @err = 'err.order_search_point.transaction_failed'
								set @errdesc = '�� ������� ���������� ����������'

								if (@@trancount > 0)
									rollback tran
	
								goto err
							end catch

						--����������� ������� ������
						set @per_pnt = iif (@ord_coorx>@ord_coory, @ord_coory, @ord_coorx)

						while @krug_pnt<= (100-@per_pnt)
							begin
								set @smena_pnt = @krug_pnt*(-1) 

								while @smena_pnt<=@krug_pnt
									begin
										insert into @table_pnt
										select * from(
										select @krug_pnt [krug], @ord_coorx - @krug_pnt [x], @ord_coory + @smena_pnt [y]
										union 
										select @krug_pnt [krug], @ord_coorx + @smena_pnt [x], @ord_coory + @krug_pnt [y]
										union 
										select @krug_pnt [krug], @ord_coorx + @smena_pnt [x], @ord_coory - @krug_pnt [y] 
										union 
										select @krug_pnt [krug], @ord_coorx + @krug_pnt [x], @ord_coory + @smena_pnt [y]) v
										where v.[x] between 1 and 100 and v.[y] between 1 and 100

										set @smena_pnt = @smena_pnt + 1
									end
	
								set @krug_pnt = @krug_pnt +1
							end
	
						--����� ���������� ������
						select top 1 @ord_id_point=pnt.[id] 
						from [dbo].[point] pnt with (nolock)
						join @table_pnt tbl on pnt.[coordinate_x]=tbl.[x] and pnt.[coordinate_y] = tbl.[y]
						where pnt.[status] = 'Y'
						order by tbl.[krug]
	
						if (@ord_id_point is not null)
							begin try
								begin tran
								set transaction isolation level serializable

									--���������
									update [dbo].[order]
									set [status]	= iif([status] in ('create'), 'search_delivery', [status]),
										[id_point]	= iif([status] in ('create'), @ord_id_point, [id_deliv]),
										@ord_status = iif([status] in ('create'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_search_point.object_already_passed'
											set @errdesc = '����� ��� ������ ������ ����'

											goto err
										end	
			
								set transaction isolation level read committed
								commit tran
				
								--�������
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'search_delivery' [status]
											for json path, without_array_wrapper)
			
	
								goto ok	
							end try
							begin catch
								set @err = 'err.order_search_point.transaction_failed'
								set @errdesc = '�� ������� ���������� ����������'

								if (@@trancount > 0)
									rollback tran
	
								goto err	
							end catch
			
						--�������� �� ��������� �����
						if (@ord_id_point is null)
							begin try
								begin tran
								set transaction isolation level serializable
	
									--��������  
									update [dbo].[order]
									set [status] = 'cancel'
									where  [id] = @ord_id
	
								set transaction isolation level read committed
								commit tran

								--�������
								set @rp =	(select @ord_id [id]
													,@ord_id_point [point_id]
													,'cancel' [status]
											for json path, without_array_wrapper)
	
								goto ok

							end try
							begin catch
								set @err = 'err.order_search_point.transaction_failed'
								set @errdesc = '�� ������� ���������� ����������'

								if (@@trancount > 0)
									rollback tran
	
								goto err
							end catch
			
	
						goto ok
					end
	
				--����� �������
				if (@action in ('order.searh_delivery'))
					begin

						--�������� �� ������� id
						if (@ord_id is null)
							begin
								set @err = 'err.order_search_delivery.unset_field'
								set @errdesc = '����� �� ������'
	
								goto err
							end

						select  @ord_point_coorx	= pnt.[coordinate_x],
								@ord_point_coory	= pnt.[coordinate_y],
								@ord_id_point		= ord.[id_point],
								@ord_status			= ord.[status]
						from [dbo].[point] pnt with (nolock)
						join [dbo].[order] ord with (nolock) on pnt.[id] = ord.[id_point]
						where ord.[id] = @ord_id
	
						--�������� �� ������������� ������
						if (@ord_status is null)
							begin
								set @err = 'err.order_search_delivery.object_not_found'
								set @errdesc = '����� �� ������'
	
								goto err
							end

						--�������� �� ���������� ���� ������
						if (@ord_status not in ('search_delivery'))
							begin
								set @err = 'err.order_search_delivery.object_not_created_or_already_passed'
								set @errdesc = '����� �� ������ ��� ��� ������ ������ ����'
	
								goto err
							end

						--�������� �� ������������� �������� c �������� ������
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[workshift] with (nolock) where [status] = 'Y' for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'workshift.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin try
								begin tran
								set transaction isolation level serializable

									--��������  
									update [dbo].[order]
									set [status] = 'cancel',
										[id_deliv] = @ord_id_deliv
									where  [id] = @ord_id

								set transaction isolation level read committed
								commit tran

								--�������
								set @rp	=	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'cancel' [status]
											for json path, without_array_wrapper)
										
								goto ok
							end try
							begin catch
								set @err = 'err.order_search_delivery.transaction_failed'
								set @errdesc = '�� ������� ���������� ����������'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch

						--����� �������, ��������������� � ���� �� �����
						select top 1 @ord_id_deliv = [id_deliv] 
						from [dbo].[order] with (updlock)
						where [id_point] = @ord_id_point and [status] in ('collecting', 'wait')
						group by [id_deliv]
						order by count([id_deliv])
	
						if (@ord_id_deliv is not null)
							begin try
								begin tran
								set transaction isolation level serializable

									--���������
									update [dbo].[order]
									set [status]	= iif([status] in ('search_delivery'), 'collecting', [status]),
										[id_deliv]	= iif([status] in ('search_delivery'), @ord_id_deliv, [id_deliv]),
										@ord_status = iif([status] in ('search_delivery'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_search_delivery.object_already_passed'
											set @errdesc = '����� ��� ������ ������ ����'

											goto err
										end	

								set transaction isolation level read committed
								commit tran

								--�������
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'collecting' [status]
											for json path, without_array_wrapper)


								goto ok	
							end try
							begin catch
								set @err = 'err.order_search_delivery.transaction_failed'
								set @errdesc = '�� ������� ���������� ����������'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch
	
						--����������� ������� ������
						set @per_del_del = iif (@ord_point_coorx>@ord_point_coory, @ord_point_coory, @ord_point_coorx)
	
						while @krug_del<= (100-@per_del_del)
							begin
								set @smena_del = @krug_del*(-1) 
			
								while @smena_del<=@krug_del
									begin
										insert into @table_del
										select * from(
										select @krug_del [krug], @ord_point_coorx - @krug_del [x], @ord_point_coory + @smena_del [y]
										union 
										select @krug_del [krug], @ord_point_coorx + @smena_del [x], @ord_point_coory + @krug_del [y]
										union 
										select @krug_del [krug], @ord_point_coorx + @smena_del [x], @ord_point_coory - @krug_del [y]
										union 
										select @krug_del [krug], @ord_point_coorx + @krug_del [x], @ord_point_coory + @smena_del [y]) v
										where v.[x] between 1 and 100 and v.[y] between 1 and 100
										set @smena_del = @smena_del + 1					  
									end
				 	
								set @krug_del = @krug_del +1
							end

						--����� ���������� �������
						select top 1 @ord_id_deliv = wsh.[id_deliv] 
						from [dbo].[workshift] wsh with (nolock)
						join @table_del tbl on wsh.[coordinate_x] = tbl.[x] and wsh.[coordinate_y]=tbl.[y] 
						where  wsh.[id_deliv] not in	(select ord.[id_deliv] 
														from [dbo].[order] ord with (nolock)
														where ord.[id_deliv] = wsh.[id_deliv] and ord.[status] not in ('success', 'cancel')) and wsh.[status] in ('Y')
						order by tbl.[krug]

						if (@ord_id_deliv is not null)
							begin try
								begin tran
								set transaction isolation level serializable

									--���������
									update [dbo].[order]
									set [status]	= iif([status] in ('search_delivery'), 'collecting', [status]),
										[id_deliv]	= iif([status] in ('search_delivery'), @ord_id_deliv, [id_deliv]),
										@ord_status = iif([status] in ('search_delivery'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_search_delivery.object_already_passed'
											set @errdesc = '����� ��� ������ ������ ����'

											goto err
										end	

								set transaction isolation level read committed
								commit tran

								--�������
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'collecting' [status]
											for json path, without_array_wrapper)


								goto ok	
							end try
							begin catch
								set @err = 'err.order_search_delivery.transaction_failed'
								set @errdesc = '�� ������� ���������� ����������'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch


						--�������� ���������� �������
						if (@ord_id_deliv is null)
							begin try
								begin tran
								set transaction isolation level serializable
	
									--��������  
									update [dbo].[order]
									set [status] = 'cancel',
										[id_deliv] = @ord_id_deliv
									where  [id] = @ord_id

								set transaction isolation level read committed
								commit tran

								--�������
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'cancel' [status]
											for json path, without_array_wrapper)

								goto ok
							end try
							begin catch
								set @err = 'err.order_search_delivery.transaction_failed'
								set @errdesc = '�� ������� ���������� ����������'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch
			

						goto ok
					end
					
			    --���� ������ � �������� �������
				if (@action in ('order.wait_delivery'))
					begin

						--�������� �� ������� id
						if ( @ord_id is null)
							begin
								set @err = 'err.order_collecting.unset_field'
								set @errdesc = '������� �� ��� ����������� ���������'

								goto err
							end		
						
						set @rp_ = null
						set @js_ = (select @ord_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						set @ord_status = json_value(@rp_, '$.response.status')

						--�������� �� ������������� ������
						if (@ord_status is null)
							begin
								set @err = 'err.order_collecting.object_not_found'
								set @errdesc = '����� �� ������'

								goto err
							end

						--�������� �� ���������� ���� ������
						if (@ord_status != 'collecting')
							begin
								set @err = 'err.order_collecting.object_not_created_or_already_passed'
								set @errdesc = '����� �� ������ ��� ��� ������ ������ ����'

								goto err
							end
						
						--�������� 
						begin try
							begin tran
								set transaction isolation level serializable

									--���������
									update [dbo].[order]
									set [status]	= iif([status] in ('collecting'), 'wait', [status]),
										@ord_status = iif([status] in ('collecting'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_collecting.object_already_passed'
											set @errdesc = '����� ��� ������ ������ ����'

											goto err
										end	

								set transaction isolation level read committed
								commit tran

								--�������
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'collecting' [status]
											for json path, without_array_wrapper)


								goto ok	
							end try
							begin catch
								set @err = 'err.order_collecting.transaction_failed'
								set @errdesc = '�� ������� ���������� ����������'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch

						--�������
						set @rp =	(select @ord_id [id]
											,'wait' [status]
									for json path, without_array_wrapper)


						goto ok
					end

			    --�������� ������ �������
				if (@action in ('order.on_way'))
					begin

						--�������� �� ������� id
						if (@ord_id is null)
							begin
								set @err = 'err.order_on_way.unset_field'
								set @errdesc = '����� �� ������'

								goto err
							end

						set @rp_ = null
						set @js_ = (select @ord_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						set @ord_status = json_value(@rp_, '$.response.status')

						--�������� �� ������������� ������
						if (@ord_status is null)
							begin
								set @err = 'err.order_on_way.object_not_found'
								set @errdesc = '����� �� ������'

								goto err
							end

						--�������� �� ���������� ���� ������
						if (@ord_status != 'wait')
							begin
								set @err = 'err.order_on_way.object_not_created_or_already_passed'
								set @errdesc = '����� �� ������ ��� ��� ������ ������ ����'

								goto err
							end

						--��������  
						begin try
							begin tran
								set transaction isolation level serializable

									--���������
									update [dbo].[order]
									set [status]	= iif([status] in ('wait'), 'on_way', [status]),
										@ord_status = iif([status] in ('wait'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_on_way.object_already_passed'
											set @errdesc = '����� ��� ������ ������ ����'

											goto err
										end	

								set transaction isolation level read committed
								commit tran

								--�������
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'on_way' [status]
											for json path, without_array_wrapper)


								goto ok	
							end try
							begin catch
								set @err = 'err.order_on_way.transaction_failed'
								set @errdesc = '�� ������� ���������� ����������'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch

						--�������
						set @rp =	(select @ord_id [id]
											,'on_way' [status]
									for json path, without_array_wrapper)


						goto ok
					end

			    --���������� ������
				if (@action in ('order.success'))
					begin
						  
						--�������� �� ������� id
						if (@ord_id is null)
							begin
								set @err = 'err.order_success.unset_field'
								set @errdesc = '����� �� ������'

								goto err
							end

						set @rp_ = null
						set @js_ = (select @ord_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						set @ord_status = json_value(@rp_, '$.response.status')

						--�������� �� ������������� ������
						if (@ord_status is null)
							begin
								set @err = 'err.order_success.object_not_found'
								set @errdesc = '����� �� ������'

								goto err
							end

						--�������� �� ���������� ���� ������
						if (@ord_status != 'on_way')
							begin
								set @err = 'err.order_success.object_not_created_or_already_passed'
								set @errdesc = '����� �� ������ ��� ��� ������ ������ ����'

								goto err
							end

						--�������� 
						begin try
							begin tran
								set transaction isolation level serializable

									--���������
									update [dbo].[order]
									set [status]	= iif([status] in ('on_way'), 'success', [status]),
										@ord_status = iif([status] in ('on_way'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_success.object_already_passed'
											set @errdesc = '����� ��� ������ ������ ����'

											goto err
										end	

								set transaction isolation level read committed
								commit tran

								--�������
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'success' [status]
											for json path, without_array_wrapper)


								goto ok	
							end try
							begin catch
								set @err = 'err.order_success.transaction_failed'
								set @errdesc = '�� ������� ���������� ����������'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch

						--�������
						set @rp =	(select @ord_id [id]
											,'success' [status]
									for json path, without_array_wrapper)


						goto ok
					end
			end
			
	end try
	begin catch
		set @err = 'err.sys'
		set @errdesc = error_message()
				
		goto err
	end catch
	
	err:
		set @rp = (select 'err' [status], lower(@err) [err] , @errdesc [errdesc] for json path, without_array_wrapper)
			if (@@trancount > 0)
			rollback tran
			insert into [log_table]
			values (getdate(), json_value(@rp, '$.err'), json_value(@rp, '$.status'), @@SPID)
		return

	ok:
		set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
			if (@@trancount > 0)
			commit tran
		return

end
GO


