use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[dilivery.activate]
	@js nvarchar(max),
	@rp nvarchar(max) output 
as
begin
	declare 
	@err          nvarchar(100)
	,@errdesc      nvarchar(100)

	,@diliv_id    uniqueidentifier = json_value(@js, '$.id')
	,@diliv_phone nvarchar(20)
	,@diliv_status nvarchar(1)

	--�������� �� ������� id
	if (@diliv_id is null)
		begin
			set @err = 'err.dilivery_activate.unset_field'
			set @errdesc = '��������� �� ������'

			goto err
		end

	select	@diliv_phone = [phone],
			@diliv_status = [status]
	from [dbo].[delivery]
	where [id] = @diliv_id

	--�������� �� ������������� ���������� (����� ������ ����������)
	if (@diliv_status is null)
		begin
			set @err = 'err.dilivery_activate.object_not_found'
			set @errdesc = '��������� �� ������'

			goto err
		end

	--�������� ������� �� ���������
	if (@diliv_status = 'Y')
		begin
			set @err = 'err.dilivery_activate.object_is_active'
			set @errdesc = '��������� ��� �������'

			goto err
		end

	--�������� �� ������������� ������ ��������� ����������
	if exists (select top 1 1 from [dbo].[delivery] where [phone] = @diliv_phone and [status] = 'Y')
		begin
			set @err = 'err.dilivery_activate.object_phone_is_active'
			set @errdesc = '��������� � ����� ��������� ��� �������'

			goto err
		end

	--��������� ������
	update [dbo].[delivery]
	set [status] = 'Y'
	where [id] = @diliv_id

	--�������
	set @rp =	(select @diliv_id [id]
						, 'Y'    [status]
				for json path, without_array_wrapper)
		

	goto ok
		  

	err: 
		set @rp = (select 'err' [status], lower(@err) [err], @errdesc [errdesc] for json path, without_array_wrapper)
		return
			  

	  
	ok: 
		set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		return
			   
end