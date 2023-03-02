use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[point.edit]
	@js nvarchar(max),
	@rp nvarchar(max) output 
as
begin
	declare 
	@err          nvarchar(100)
	,@errdesc      nvarchar(100)

	,@point_id    uniqueidentifier  =	json_value(@js, '$.id')
	,@point_name  nvarchar(200)       =   json_value(@js, '$.name')
	,@point_address   nvarchar(200) =   json_value(@js, '$.address')
	,@point_phone   nvarchar(11)   =   json_value(@js, '$.phone')
	,@point_coorx   int   =   json_value(@js, '$.coordinate_x')
	,@point_coory   int   =   json_value(@js, '$.coordinate_y')
	,@coordx int
	,@coordy int
	,@status nvarchar(1)

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

	select	@coordx = [coordinate_x],
			@coordy = [coordinate_y],
			@status = [status]
	from [dbo].[point] 
	where [id] = @point_id and [status] = 'Y'

	--�������� �� ������������� ������
	if (@status is null)
		begin
			set @err = 'err.point_edit.object_not_found'
			set @errdesc = '����� �� ������'

			goto err
		end

	--�������� �� ��� ������������ ����� �������� ������
	if (@point_phone is not null) and exists (select top 1 1 from [dbo].[point] where [phone] = @point_phone and [status] = 'Y')
		begin
			set @err = 'err.point_edit.not_unique_phone'
			set @errdesc = '����� c ����� ��������� ��� ����������'

			goto err
		end

	--�������� �� ��� ������������ ����� ������
	if (@point_address is not null) and exists (select top 1 1 from [dbo].[point] where [address] = @point_address and [status] = 'Y')
		begin
			set @err = 'err.point_edit.not_unique_address'
			set @errdesc = '����� c ����� ������� ��� ����������'

			goto err
		end

	--�������� �� ��� ������������ ���������� ������
	if (@point_coorx is not null or @point_coory is not null) and exists (select top 1 1 from [dbo].[point] where [coordinate_x] = ISNULL(@point_coorx, @coordx) and [coordinate_y] = ISNULL(@point_coory, @coordy) and [status] = 'Y')
		begin
			set @err = 'err.point_edit.not_unique_coordinates'
			set @errdesc = '����� c ������ ������������ ��� ����������'

			goto err
		end

	--��������
	update [dbo].[point]
	set		[name]		=	 isnull(@point_name, [name]),
			[address]	=	 isnull(@point_address, [address]),
			[phone]		=	 isnull(@point_phone, [phone]),
			[coordinate_x] = isnull(@point_coorx, [coordinate_x]),
			[coordinate_y] = isnull(@point_coory, [coordinate_y])
	where [id] = @point_id

	--�������
	set @rp =	(select * from [dbo].[point]
				where [id] = @point_id 
				for json path, without_array_wrapper)


	goto ok
		  

	err: 
		set @rp = (select 'err' [status], lower(@err) [err], @errdesc [errdesc] for json path, without_array_wrapper)
		return
			  

	  
	ok: 
		set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		return
			   
end