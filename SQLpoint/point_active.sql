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

	--проверка на наличие id
	if (@point_id is null)
		begin
			set @err = 'err.point_activate.unset_field'
			set @errdesc = 'ѕункт не найден'

			goto err
		end

	select	@point_phone = [phone],
			@point_status = [status],
			@point_coorx = [coordinate_x],
			@point_address = [address]
	from [dbo].[point]
	where [id] = @point_id

	--проверка на существование пункта (также внутри неактивных)
	if (@point_phone is null)
		begin
			set @err = 'err.point_activate.object_not_found'
			set @errdesc = 'ѕункт не найден'

			goto err
		end

	--проверка активен ли пункт
	if (@point_status = 'Y')
		begin
			set @err = 'err.point_activate.object_is_active'
			set @errdesc = 'ѕункт уже активен'

			goto err
		end

	--проверка на существование номера активного пункта
	if exists (select top 1 1 from [dbo].[point] where [phone] = @point_phone and [status] = 'Y')
		begin
			set @err = 'err.point_activate.object_phone_is_active'
			set @errdesc = 'ѕункт с таким телефоном уже активен'

			goto err
		end

	--проверка на существование адреса активного пункта
	if exists (select top 1 1 from [dbo].[point] where [address] = @point_address and [status] = 'Y')
		begin
			set @err = 'err.point_activate.object_address_is_active'
			set @errdesc = 'ѕункт с таким адресом уже активен'

			goto err
		end

	--проверка на существование координат активного пункта
	if exists (select top 1 1 from [dbo].[point] where [coordinate_x] = @point_coorx and [coordinate_y] = @point_coory and [status] = 'Y')
		begin
			set @err = 'err.point_activate.object_coordinate_is_active'
			set @errdesc = 'ѕункт с такими координатами уже активен'

			goto err
		end

	--обновл€ем статус
	update [dbo].[point]
	set [status] = 'Y'
	where [id] = @point_id

	--¬ыводим
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