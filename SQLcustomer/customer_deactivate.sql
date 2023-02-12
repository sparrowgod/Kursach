use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[customer.deactivate]
	@js nvarchar(max),
	@rp nvarchar(max) output 
as
begin
	declare 
	@err          nvarchar(100)
	,@errdesc      nvarchar(100)

	,@cust_id    uniqueidentifier = json_value(@js, '$.id')

	--�������� �� ������� id
	if (@cust_id is null)
		begin
			set @err = 'err.customer_deactivate.unset_field'
			set @errdesc = '�������� �� ������'

			goto err
		end

	--�������� �� ������������� ���������
	if not exists (select top 1 1 from [dbo].[customer] where [id] = @cust_id and [status] = 'Y')
		begin
			set @err = 'err.customer_deactivate.object_not_found'
			set @errdesc = '�������� �� ������'
			goto err
		end

	--�������� �� ������� ������� � ��������� 
	if exists (select top 1 1 from [dbo].[order] where [id_cust] = @cust_id and [status] = 'on_way') 
		begin 
			set @err = 'err.customer_deactivate.customer_has_orders' 
			set @errdesc = '� ��������� ���� ������' 
 
			goto err 
		end

	--��������  
	begin try

		-- ������ ������ ���������
		update [dbo].[customer]
		set [status] = 'N'
		where  [id] = @cust_id

		-- ������� �� ����� ������ / �������� ������ ������� � id ����� ��������� 
		update [dbo].[order] 
		set [status] = 'cancel' 
		where  [id_cust] = @cust_id and [status] not in('cancel', 'success')

	end try
	begin catch
		set @err = 'err.customer_deactivate.cant_deactive'
		set @errdesc = '�� ������� �������������� ���������'

		goto err
	end catch

	--�������
	set @rp =	(select @cust_id [id]
						,'N' [status]
				for json path, without_array_wrapper)


	goto ok
		  

	err: 
		set @rp = (select 'err' [status], lower(@err) [err], @errdesc [errdesc] for json path, without_array_wrapper)
		return
			  

	  
	ok: 
		set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		return
			   
end