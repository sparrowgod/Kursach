use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[dilivery.deactivate]
@js nvarchar(max),
@rp nvarchar(max) output 
as
begin
	declare 
	@err          nvarchar(100)
	,@errdesc      nvarchar(100)

	,@diliv_id    uniqueidentifier = json_value(@js, '$.id')
	  	  
	--проверка на наличие id
	if (@diliv_id is null)
		begin
			set @err = 'err.delivery_deactivate.unset_field'
			set @errdesc = 'Доставщик не найден'

			goto err
		end

	--проверка на существование доставщика
	if not exists (select top 1 1 from [dbo].[delivery] where [id] = @diliv_id and [status] = 'Y')
		begin
			set @err = 'err.delivery_deactivate.object_not_found'
			set @errdesc = 'Доставщик не найден'

			goto err
		end

	--проверка на наличие заказов у доставщика
	if exists (select top 1 1 from [dbo].[order] where [id_diliv] = @diliv_id and [status] in ('on_way')) 
		begin 
			set @err = 'err.delivery_deactivate.delivery_has_orders' 
			set @errdesc = 'У доставщика есть заказы' 
 
			goto err 
		end

	--Изменяем  
	begin try

	-- Меняем статус доставщику
		update [dbo].[delivery]
		set [status] = 'N'
		where  [id] = @diliv_id

	-- Удаляем из связи заказы / доставщик записи заказов с id этого пункта
		update [dbo].[order] 
		set [id_deliv] = (select [id] from [delivery] where [id] not in	(select [id_deliv] from [order]) order by newid()) 
																		where  [id_deliv] = @diliv_id and [status] not in ('cancel', 'success')
		
	-- Удаляем из связи смены / доставщик записи заказов с id этого пункта
		update [dbo].[workshift] 
		set [status] = 'N' 
		where  [id_deliv] = @diliv_id and [status] = 'Y'

	end try
	begin catch
		set @err = 'err.delivery_deactivate.cant_deactive'
		set @errdesc = 'Не удалось деактивировать доставщика'

		goto err
	end catch

	--Выводим
	set @rp =	(select @diliv_id [id]
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