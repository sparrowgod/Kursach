use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[point.deactivate]
	@js nvarchar(max),
	@rp nvarchar(max) output 
as
begin
	declare 
	@err          nvarchar(100)
	,@errdesc      nvarchar(100)

	,@point_id    uniqueidentifier = json_value(@js, '$.id')
	  
	--�������� �� ������� id
	if (@point_id is null)
		begin
			set @err = 'err.point_deactivate.unset_field'
			set @errdesc = '����� �� ������'

			goto err
		end

	--�������� �� ������������� ������
	if not exists (select top 1 1 from [dbo].[point] where [id] = @point_id and [status] = 'Y')
		begin
			set @err = 'err.point_deactivate.object_not_found'
			set @errdesc = '����� �� ������'
			goto err
		end

	--�������� �� ������� ������� � ������
	if exists (select top 1 1 from [dbo].[order] where [id_point] = @point_id and [status] in ('collecting', 'wait', 'on_way')) 
		begin 
			set @err = 'err.point_deactivate.point_has_orders' 
			set @errdesc = '� ������ ���� ������' 
 
			goto err 
		end

	--��������  
	begin try

	-- ������ ������ ������
		update [dbo].[point]
		set [status] = 'N'
		where  [id] = @point_id

	-- ������� �� ����� ������ / ����� ������ ������� � id ����� ������
		update [dbo].[order] 
		set [status] = 'cancel' 
		where  [id_point] = @point_id and [status] not in ('cancel', 'success')

	end try
	begin catch
		set @err = 'err.point_deactivate.cant_deactive'
		set @errdesc = '�� ������� �������������� �����'

		goto err
		end catch

	--�������
	set @rp =	(select @point_id [id]
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