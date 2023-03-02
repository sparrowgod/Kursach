use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[point.create]
	@js nvarchar(max),
	@rp nvarchar(max) output 
	as
begin
	declare 
	@err          nvarchar(100)
	,@errdesc      nvarchar(100)

	,@point_id    uniqueidentifier
	,@point_name  nvarchar(200)      =   json_value(@js, '$.name')
	,@point_address   nvarchar(200)  =   json_value(@js, '$.address')
	,@point_phone   nvarchar(11)     =   json_value(@js, '$.phone')
	,@point_coorx   int     =   json_value(@js, '$.coordinate_x')
	,@point_coory   int     =   json_value(@js, '$.coordinate_y')

	--проверка об€зательных параметров на null
	if (@point_name is null 
		or @point_address  is null
		or @point_phone is null
		or @point_coorx is null
		or @point_coory is null)
		begin
			set @err = 'err.point_create.unset_field'
			set @errdesc = '”казаны не все необходимые параметры'

			goto err
		end

	--проверка на правильный формат телефона
	if (@point_phone not like '89%' or len(@point_phone) <> 11 or @point_phone like '%[^0-9]%')
		begin
			set @err = 'err.point_create.invalid_phone'
			set @errdesc = 'Ќеверный формат телефона'

			goto err
		end

	--проверка на правильный формат координат
	if (@point_coorx not between 1 and 100) or (@point_coory not between 1 and 100)
		begin
			set @err = 'err.point_create.invalid_coordinate'
			set @errdesc = 'Ќеверный формат координат'

			goto err
		end

	--проверка на уже существующий пункт по телефону 
	if exists (select top 1 1 from [dbo].[point] where [phone] = @point_phone and [status] = 'Y')
		begin
			set @err = 'err.point_create.not_unique_phone'
			set @errdesc = 'ѕункт c таким телефоном уже существует'

			goto err
		end

	--проверка на уже существующий пункт по адресу
	if exists (select top 1 1 from [dbo].[point] where [address] = @point_address and [status] = 'Y')
		begin
			set @err = 'err.point_create.not_unique_address'
			set @errdesc = 'ѕункт c таким адрессом уже существует'

			goto err
		end

	--проверка на уже существующий пункт по координатам
	if exists (select top 1 1 from [dbo].[point] where [coordinate_x] = @point_coorx and [coordinate_y] = @point_coory  and [status] = 'Y')
		begin
			set @err = 'err.point_create.not_unique_coordinate'
			set @errdesc = 'ѕункт c такими координатами уже существует'

			goto err
		end
		  
	set @point_id = newid()
	--добавл€ем значени€ в таблицу
	insert into [dbo].[point] 
	values	(
				@point_id
				,getdate()
				,@point_name
				,@point_address
				,@point_phone
				,@point_coorx
				,@point_coory
				,'Y'
			)

	--выводим
	set @rp =	(select @point_id [id]
						,@point_name [fio]
						,@point_address  [address] 
						,@point_phone [phone]
						,@point_coorx [coordinate_x]
						,@point_coory [coordinate_y]   
				for json path, without_array_wrapper)

	goto ok
		  

	err: 
		set @rp = (select 'err' [status], lower(@err) [err], @errdesc [errdesc] for json path, without_array_wrapper)
		return
			  

	  
	ok: 
		set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		return
			   
end
