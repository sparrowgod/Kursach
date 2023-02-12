use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[customer.activate]
@js nvarchar(max),
@rp nvarchar(max) output 
as
begin
	declare 
	@err          nvarchar(100)
	,@errdesc      nvarchar(100)

	,@cust_id    uniqueidentifier = json_value(@js, '$.id')
	,@cust_phone nvarchar(20)
	,@cust_status nvarchar(1)

	--проверка на наличие id
	if (@cust_id is null)
		begin
			set @err = 'err.customer_activate.unset_field'
			set @errdesc = 'Заказчик не найден'

			goto err
		end

	select @cust_phone = [phone],
	@cust_status = [status]
	from [dbo].[customer]
	where [id] = @cust_id

	--проверка на существование заказчика (также внутри неактивных)
	if (@cust_phone is null)
		begin
			set @err = 'err.customer_activate.object_not_found'
			set @errdesc = 'Заказчик не найден'

			goto err
		end

	--проверка активен ли заказчик
	if (@cust_status = 'Y')
		begin
			set @err = 'err.customer_activate.object_is_active'
			set @errdesc = 'Заказчик уже активен'

			goto err
		end

	--проверка на существование номера активного заказчика
	if exists (select top 1 1 from [dbo].[customer] where [phone] = @cust_phone and [status] = 'Y')
		begin
			set @err = 'err.customer_activate.object_phone_is_active'
			set @errdesc = 'Заказчик с таким телефоном уже активен'

			goto err
		end

	--обновляем статус
	update [dbo].[customer]
	set [status] = 'Y'
	where [id] = @cust_id

	--Выводим
	set @rp =	(select @cust_id [id]
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