use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[point.activate]
	@js nvarchar(max),
	@rp nvarchar(max) output 
as
begin
	declare 
	@err          nvarchar(100)
	,@errdesc      nvarchar(100)

	,@point_id    uniqueidentifier = json_value(@js, '$.id')
	,@point_phone nvarchar(11)
	,@point_status nvarchar(1)
	,@point_coorx int
	,@point_coory int
	,@point_address nvarchar(200)

	--�������� �� ������� id
	if (@point_id is null)
		begin
			set @err = 'err.point_activate.unset_field'
			set @errdesc = '����� �� ������'

			goto err
		end

	select	@point_phone = [phone],
			@point_status = [status],
			@point_coorx = [coordinate_x],
			@point_address = [address]
	from [dbo].[point]
	where [id] = @point_id

	--�������� �� ������������� ������ (����� ������ ����������)
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

	--�������� �� ������������� ������ ��������� ������
	if exists (select top 1 1 from [dbo].[point] where [phone] = @point_phone and [status] = 'Y')
		begin
			set @err = 'err.point_activate.object_phone_is_active'
			set @errdesc = '����� � ����� ��������� ��� �������'

			goto err
		end

	--�������� �� ������������� ������ ��������� ������
	if exists (select top 1 1 from [dbo].[point] where [address] = @point_address and [status] = 'Y')
		begin
			set @err = 'err.point_activate.object_address_is_active'
			set @errdesc = '����� � ����� ������� ��� �������'

			goto err
		end

	--�������� �� ������������� ��������� ��������� ������
	if exists (select top 1 1 from [dbo].[point] where [coordinate_x] = @point_coorx and [coordinate_y] = @point_coory and [status] = 'Y')
		begin
			set @err = 'err.point_activate.object_coordinate_is_active'
			set @errdesc = '����� � ������ ������������ ��� �������'

			goto err
		end

	--��������� ������
	update [dbo].[point]
	set [status] = 'Y'
	where [id] = @point_id

	--�������
	set @rp =	(select @point_id [id]
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