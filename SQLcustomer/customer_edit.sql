use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[customer.edit]
		 @js nvarchar(max),
	     @rp nvarchar(max) output 
as
begin
	     declare 
	     @err          nvarchar(100)
	    ,@errdesc      nvarchar(100)

	    ,@cust_id    uniqueidentifier  =	json_value(@js, '$.id')
	    ,@cust_fio  nvarchar(200)       =   json_value(@js, '$.fio')
        ,@cust_address   nvarchar(200) =   json_value(@js, '$.address')
	    ,@cust_phone   nvarchar(20)   =   json_value(@js, '$.phone')

			--проверка на наличие id
		if (@cust_id is null)
	        begin
		      set @err = 'err.customer_edit.unset_field'
			  set @errdesc = 'Заказчик не найден'

			  goto err
		    end

		  --проверка на наличие редактируемых параметров
		if (@cust_fio is null and @cust_address is null and @cust_phone is null)
	        begin
			  set @err = 'err.customer_edit.hasnt_data'
			  set @errdesc = 'Отсутствуют данные редактирования'

			  goto err
		    end

			--проверка на правильный формат фамилии
		if (@cust_fio is not null) and (@cust_fio like '%[^а-я^a-z^ ]%')
		    begin
		      set @err = 'err.customer_edit.invalid_fio'
		      set @errdesc = 'Неверный формат ФИО'

		      goto err
		    end

			--проверка на правильный формат телефона
		if (@cust_phone is not null) and (@cust_phone not like '89%' or len(@cust_phone) <> 11 or @cust_phone like '%[^0-9]%')
		    begin
		      set @err = 'err.customer_edit.invalid_phone'
			  set @errdesc = 'Неверный формат телефона'

			  goto err
			end

			--проверка на существование заказчика
		if not exists (select top 1 1 from [dbo].[customer] where [id] = @cust_id and [status] = 'Y')
			begin
			  set @err = 'err.customer_edit.object_not_found'
			  set @errdesc = 'Заказчик не найден'

			  goto err
			end

			--проверка на уже существующий номер телефона заказчика
		if (@cust_phone is not null) and exists (select top 1 1 from [dbo].[customer] where [phone] = @cust_phone and [status] = 'Y')
		    begin
			  set @err = 'err.customer_edit.not_unique_phone'
			  set @errdesc = 'Заказчик c таким телефоном уже существует'

			  goto err
			end

		    --изменяем
		update [dbo].[customer]
		set  [fio] =     isnull(@cust_fio, [fio]),
			 [address] = isnull(@cust_address, [address]),
			 [phone] =   isnull(@cust_phone, [phone])
		where [id] = @cust_id

			--выводим
		set @rp = (select * from [dbo].[customer]
				   where [id] = @cust_id 
				   for json path, without_array_wrapper)


	    goto ok
		  

		   err: 
			   set @rp = (select 'err' [status], lower(@err) [err], @errdesc [errdesc] for json path, without_array_wrapper)
		       return
			  

	  
		   ok: 
			   set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		       return
			   
end
