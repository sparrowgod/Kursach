USE [metod]
GO
/****** Object:  StoredProcedure [dbo].[ms_api]    Script Date: 17.01.2023 19:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ms_api]
	@action varchar(50),
	@js varchar(max),
	@rp varchar(max) out
as
begin
	set nocount on

	begin try
		declare 
		 @err        nvarchar(100)
	    ,@errdesc    nvarchar(100)
		,@sba        nvarchar(50) = substring(@action, 1, charindex('.', @action) - 1)

		,@rp_        nvarchar(max)
		,@js_        nvarchar(max)

		set dateformat dmy

		--заказчик
		if (@sba in ('customer'))
			begin
				declare
				 @cust_id     uniqueidentifier = json_value(@js, '$.id')
				,@cust_fio   nvarchar(50)     = json_value(@js, '$.fio')
				,@cust_address    nvarchar(200)     = json_value(@js, '$.address')
				,@cust_phone     nvarchar(20)    = json_value(@js, '$.phone')
				,@cust_status char(1)

				--получение данных заказчика
				if (@action in ('customer.get'))
					begin
						set @rp =	(select * 
									from [dbo].[customer] with (nolock)
									where ([id] = @cust_id or [phone] = @cust_phone) and [status] = 'Y'
									for json path, without_array_wrapper)


						goto ok
					end
					 
				--создание заказчика
				if (@action in ('customer.create'))
					begin

						--проверка обязательных параметров на null
						if (@cust_fio is null 
							or @cust_address  is null
							or @cust_phone is null)
							begin
								set @err = 'err.customer_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end

						--проверка на правильный формат фамилии
						if (@cust_fio like '%[^а-я^a-z^ ]%')
							begin
								set @err = 'err.customer_create.invalid_fio'
								set @errdesc = 'Неверный формат ФИО'

								goto err
							end
					
						--проверка на правильный формат телефона
						if (@cust_phone not like '89%' or len(@cust_phone) <> 11 or @cust_phone like '%[^0-9]%')
							begin
								set @err = 'err.customer_create.invalid_phone'
								set @errdesc = 'Неверный формат телефона'

								goto err
							end

						--проверка на уже существующего заказчика
						set @rp_ = null
						set @js_ = (select @cust_phone [phone] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.customer_create.not_unique_phone'
								set @errdesc = 'Заказчик c таким телефоном уже существует'

								goto err
							end
						
						--добавляем значения в таблицу
						set @cust_id = newid()

						insert into [dbo].[customer]
						values (
								@cust_id,
								getdate(),
								@cust_fio,
								@cust_address,
								@cust_phone,
								'Y'
								)

						--выводим
						set @rp =	(select	@cust_id   [id]
											,@cust_fio [fio]
											,@cust_address  [address]
											,@cust_phone   [phone]
									for json path, without_array_wrapper)
									

						goto ok
					end

				--редактирование заказчика
				if (@action in ('customer.edit'))
					begin

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
						set @rp_ = null
						set @js_ = (select @cust_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.customer_edit.object_not_found'
								set @errdesc = 'Заказчик не найден'

								goto err
							end
						
						--проверка на уникальность телефона
						if (@cust_phone is not null)
							begin
								set @rp_ = null
								set @js_ = (select @cust_phone [phone] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.customer_edit.not_unique_phone'
										set @errdesc = 'Заказчик c таким телефоном уже существует'

										goto err
									end
							end
						
						--изменяем
						update [dbo].[customer]
						set	[fio]		= isnull(@cust_fio, [fio]),
							[address]	= isnull(@cust_address, [address]),
							[phone]		= isnull(@cust_phone, [phone])
						where [id] = @cust_id

						--выводим
						set @rp =	(select * from [dbo].[customer] with (nolock)
									where [id] = @cust_id 
									for json path, without_array_wrapper)


						goto ok
					end
								
				--активация заказчика
				if (@action in ('customer.activate'))
					begin

						--проверка на наличие id
						if (@cust_id is null)
							begin
								set @err = 'err.customer_activate.unset_field'
								set @errdesc = 'Заказчик не найден'

								goto err
							end

						select	@cust_phone = [phone],
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

						--проверка на уже существующий номер телефона активного заказчика
						set @rp_ = null
						set @js_ = (select @cust_phone [phone] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.customer_activate.object_phone_is_active'
								set @errdesc = 'Заказчик с таким телефоном уже активен'

								goto err
							end
																								
						--меняем статус заказчика
						update [dbo].[customer]
						   set [status] = 'Y'
						where [id] = @cust_id
												
						--выводим
						set @rp =	(select	@cust_id    [id]
											,'Y'		[status]
									for json path, without_array_wrapper)
								   

						goto ok
					end

			    --деактивация заказчика
				if (@action in ('customer.deactivate'))
					begin

						--проверка на наличие id
						if (@cust_id is null)
							begin
								set @err = 'err.customer_deactivate.unset_field'
								set @errdesc = 'Заказчик не найден'

								goto err
							end

						--проверка на существование заказчика
						set @rp_ = null
						set @js_ = (select @cust_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.customer_deactivate.object_not_found'
								set @errdesc = 'Заказчик не найден'

								goto err
							end
						
						--проверка на то что у брокеров биржи нет клиентов 
						set @rp_ = null
						set @js_ = (select [id] from [dbo].[order] with (nolock) where [id_cust] = @cust_id and [status] = 'on_way' for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.customer_deactivate.customer_has_orders' 
								set @errdesc = 'У заказчика есть заказы' 
 
								goto err 
							end
						
						--Изменяем  
						begin tran

							-- Меняем статус заказчику
							update [dbo].[customer]
							set [status] = 'N'
							where  [id] = @cust_id

							-- Удаляем из связи заказы / заказчик записи заказов с id этого заказчика 
							update [dbo].[order] 
							set [status] = 'cancel' 
							where  [id_cust] = @cust_id and [status] not in('cancel', 'success')

						commit tran

						--Выводим
						set @rp =	(select	@cust_id [id]
											,'N' [status]
									for json path, without_array_wrapper)


						goto ok
					end			
			end


		--пункт
		if (@sba in ('point'))
			begin
				declare 
					@point_id	uniqueidentifier	=	json_value(@js, '$.id')
					,@point_name	nvarchar(200)	=	json_value(@js, '$.name')
					,@point_address nvarchar(200)	=	json_value(@js, '$.address')
					,@point_phone   nvarchar(11)	=	json_value(@js, '$.phone')
					,@point_coorx		int			=	json_value(@js, '$.coordinate_x')
					,@point_coory		int			=	json_value(@js, '$.coordinate_y')
					,@point_status	char(1)	
					,@coordy int
					,@coordx int

				--получение данных пункта
				if (@action in ('point.get'))
					begin
						set @rp =	(select * 
									from [dbo].[point] with (nolock)
									where ([id] = @point_id or [phone] = @point_phone or [address] = @point_address or (@point_coorx = [coordinate_x] and @point_coory = [coordinate_y])) and [status] = 'Y'
									for json path, without_array_wrapper)

						goto ok
					end

				--создание пункта
				if (@action in ('point.create'))
					begin

						--проверка обязательных параметров на null
						if (@point_name is null 
							or @point_address  is null
							or @point_phone is null
							or @point_coorx is null
							or @point_coory is null)
							begin
								set @err = 'err.point_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end

						--проверка на правильный формат телефона
						if (@point_phone not like '89%' or len(@point_phone) <> 11 or @point_phone like '%[^0-9]%')
							begin
								set @err = 'err.point_create.invalid_phone'
								set @errdesc = 'Неверный формат телефона'

								goto err
							end

						--проверка на правильный формат координат
						if (@point_coorx not between 1 and 100) or (@point_coory not between 1 and 100)
							begin
								set @err = 'err.point_create.invalid_coordinate'
								set @errdesc = 'Неверный формат координат'

								goto err
							end

						--проверка на существование пункта
						set @rp_ = null
						set @js_ = (select @point_phone [phone], @point_address [address], @point_coorx [coordinate_x], @point_coory [coordinate_y] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.point_create.not_unique_data'
								set @errdesc = 'Пункт c такими параметрами уже существует'

								goto err							
							end

						--добавляем значения в таблицу
						set @point_id = newid()

						insert into [dbo].[point] 
						values (
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
						set @rp =	(select	@point_id [id]
											,@point_name [fio]
											,@point_address  [address] 
											,@point_phone [phone]
											,@point_coorx [coordinate_x]
											,@point_coory [coordinate_y]
						   
									for json path, without_array_wrapper)


						goto ok	  
					end
							
			    --редактирование пункта
				if (@action in ('point.edit'))
					begin

						--проверка на наличие id
						if (@point_id is null)
							begin
								set @err = 'err.point_edit.unset_field'
								set @errdesc = 'Пункт не найден'

								goto err
							end

						--проверка на наличие редактируемых параметров
						if (@point_name is null and
							@point_address is null and 
							@point_phone is null and
							@point_coorx is null and
							@point_coory is null)
							begin
								set @err = 'err.point_edit.hasnt_data'
								set @errdesc = 'Отсутствуют данные редактирования'

								goto err
							end

						--проверка на правильный формат телефона
						if (@point_phone is not null) and (@point_phone not like '89%' or len(@point_phone) <> 11 or @point_phone like '%[^0-9]%')
							begin
								set @err = 'err.point_edit.invalid_phone'
								set @errdesc = 'Неверный формат телефона'

								goto err
							end

						--проверка на правильный формат координаты x
						if (@point_coorx is not null) and (@point_coorx not between 1 and 100)
							begin
								set @err = 'err.point_edit.invalid_coordinate_x'
								set @errdesc = 'Неверный формат координаты x'

								goto err
							end

						--проверка на правильный формат координаты y
						if (@point_coory is not null) and (@point_coory not between 1 and 100)
							begin
								set @err = 'err.point_edit.invalid_coordinate_y'
								set @errdesc = 'Неверный формат координаты y'

								goto err
							end

						--проверка на существование пункта 
						set @rp_ = null
						set @js_ = (select @point_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.point_edit.object_not_found'
								set @errdesc = 'Пункт не найден'

								goto err
							end

						--проверка на уже существующий номер телефона пункта
						if (@point_phone is not null)
							begin
								set @rp_ = null
								set @js_ = (select @point_phone [phone] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.point_edit.not_unique_phone'
										set @errdesc = 'Пункт c таким телефоном уже существует'

										goto err
									end
							end

						--проверка на уже существующий адрес пункта
						if (@point_address is not null)
							begin
								set @rp_ = null
								set @js_ = (select @point_address [address] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.point_edit.not_unique_address'
										set @errdesc = 'Пункт c таким адресом уже существует'

										goto err
									end
							end


						set @rp_ = null
						set @js_ = (select @point_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

						set @coordx = json_value(@rp_, '$.response.coordinate_x')
						set @coordy = json_value(@rp_, '$.response.coordinate_y')

						--проверка на уже существующий адрес пункта
						if (@point_coorx is not null or @point_coory is not null)
							begin
								set @rp_ = null
								set @js_ = (select ISNULL(@point_coorx, @coordx) [coordinate_x], ISNULL(@point_coory, @coordy) [coordinate_y] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.point_edit.not_unique_coordinates'
										set @errdesc = 'Пункт c такими координатами уже существует'

										goto err
									end
							end

											
						--изменяем
						update [dbo].[point]
						set		[name]			= isnull(@point_name, [name]),
								[address]		= isnull(@point_address, [address]),
								[phone]			= isnull(@point_phone, [phone]),
								[coordinate_x]	= isnull(@point_coorx, [coordinate_x]),
								[coordinate_y]	= isnull(@point_coory, [coordinate_y])
						where [id] = @point_id

						--выводим
						set @rp = (select * from [dbo].[point] with (nolock)
						where [id] = @point_id 
						for json path, without_array_wrapper)


						goto ok
					end	
					
				--активация пункта
				if (@action in ('point.activate'))
					begin

						--проверка на наличие id
						if (@point_id is null)
							begin
								set @err = 'err.point_activate.unset_field'
								set @errdesc = 'Пункт не найден'

								goto err
							end

						select	@point_phone = [phone],
								@point_address = [address],
								@point_coorx = [coordinate_x],
								@point_coory = [coordinate_y],
								@point_status = [status]
						from [dbo].[point] with (nolock)
						where [id] = @point_id

						--проверка на существование пункта
						if (@point_phone is null)
							begin
								set @err = 'err.point_activate.object_not_found'
								set @errdesc = 'Пункт не найден'

								goto err
							end

						--проверка активен ли пункт
						if (@point_status = 'Y')
							begin
								set @err = 'err.point_activate.object_is_active'
								set @errdesc = 'Пункт уже активен'

								goto err
							end

						--проверка на существование активного пункта c такими же данными
						set @rp_ = null
						set @js_ = (select @point_phone [phone], @point_address [address], @point_coorx [coordinate_x], @point_coory [coordinate_y] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.point_activate.object_data_is_active'
								set @errdesc = 'Заказчик с такими данными уже активен'

								goto err
							end

						--обновляем статус
						update [dbo].[point]
						set [status] = 'Y'
						where [id] = @point_id

						--Выводим
						set @rp =	(select	@point_id [id]
											, 'Y'    [status]
									for json path, without_array_wrapper)
		

						goto ok

					end

				--деактивация пункта
				if (@action in ('point.deactivate'))
					begin

						--проверка на наличие id
						if (@point_id is null)
							begin
								set @err = 'err.point_deactivate.unset_field'
								set @errdesc = 'Пункт не найден'

								goto err
							end

						--проверка на существование активного пункта
						set @rp_ = null
						set @js_ = (select @point_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.point_deactivate.object_not_found'
								set @errdesc = 'Пункт не найден'

								goto err
							end

						--проверка на наличие заказов у пункта
						set @rp_ = null
						set @js_ = (select [id] from [dbo].[order] with (nolock) where [id_point] = @point_id and [status] in ('collecting', 'wait', 'on_way') for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin 
								set @err = 'err.point_deactivate.point_has_orders' 
								set @errdesc = 'У пункта есть заказы' 
 
								goto err 
							end

						--Изменяем  
						begin tran

							-- Меняем статус пункту
							update [dbo].[point]
							set [status] = 'N'
							where  [id] = @point_id

							-- Удаляем из связи заказы / пункт записи заказов с id этого пункта
							update [dbo].[order] 
							set [status] = 'cancel' 
							where  [id_point] = @point_id and [status] not in ('cancel', 'success')

						commit tran

						--Выводим
						set @rp =	(select @point_id [id]
											,'N' [status]
									for json path, without_array_wrapper)


						goto ok
					end
			end


		--курьер
		if (@sba in ('delivery'))
			begin
				declare		
				 @deliv_id	uniqueidentifier = json_value(@js, '$.id')
				,@deliv_fio	nvarchar(200)	 = json_value(@js, '$.fio')
				,@deliv_birth	date		 = json_value(@js, '$.date_of_birth')
				,@deliv_phone	nvarchar(20) = json_value(@js, '$.phone')	
				,@deliv_status	char(1)
	
				--получение данных курьера
				if (@action in ('delivery.get'))
					begin
						set @rp =	(select * 
									from [dbo].[delivery] with (nolock)
									where ([id] = @deliv_id or [phone] = @deliv_phone) and [status] = 'Y'
									for json path, without_array_wrapper)


						goto ok
					end

				--создание курьера
				if (@action in ('delivery.create'))
					begin

						--проверка обязательных параметров на null
						if (@deliv_fio is null 
							or @deliv_birth is null
							or @deliv_phone is null)
							begin
								set @err = 'err.delivery_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end

						--проверка на правильный формат телефона
						if (@deliv_phone not like '89%' or len(@deliv_phone) <> 11 or @deliv_phone like '%[^0-9]%')
							begin
								set @err = 'err.delivery_create.invalid_phone'
								set @errdesc = 'Неверный формат телефона'

								goto err
							end

						--проверка на правильный формат фамилии
						if (@deliv_fio like '%[^а-я^a-z^ ]%')
							begin
								set @err = 'err.delivery_create.invalid_fio'
								set @errdesc = 'Неверный формат ФИО'

								goto err
							end

						--проверка на возраст
						if ((YEAR(getdate()) - YEAR(@deliv_birth)) < 18)
							begin
								set @err = 'err.delivery_create.age_less_18'
								set @errdesc = 'Доставщику меньше восемнадцати лет'

								goto err
							end

						--проверка названия на уникальность
						set @rp_ = null
						set @js_ = (select @deliv_phone [phone] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.delivery_create.not_unique_phone'
								set @errdesc = 'Доставщик c таким телефоном уже существует'

								goto err							
							end

						--добавляем значения в таблицу						
						set @deliv_id = newid()
						insert into [dbo].[delivery] 
						values (
								@deliv_id
								,getdate()
								,@deliv_fio
								,@deliv_birth
								,@deliv_phone
								,'Y'
								)

						--выводим
						set @rp =	(select @deliv_id [id]
											,@deliv_birth [date_of_birth]
											,@deliv_fio [fio]
											,@deliv_phone [phone]
						   
									for json path, without_array_wrapper)
									

						goto ok
					end
				
				--редактирование курьера
				if (@action in ('delivery.edit'))
					begin

						--проверка на наличие id
						if (@deliv_id is null)
							begin
								set @err = 'err.delivery_edit.unset_field'
								set @errdesc = 'Доставщик не найден'

								goto err
							end

						--проверка на наличие редактируемых параметров
						if (@deliv_fio is null and @deliv_birth is null and @deliv_phone is null)
							begin
								set @err = 'err.delivery_edit.hasnt_data'
								set @errdesc = 'Отсутствуют данные редактирования'

								goto err
							end
						
						--проверка на правильный формат фамилии
						if (@deliv_fio is not null) and (@deliv_fio like '%[^а-я^a-z^ ]%')
							begin
								set @err = 'err.delivery_edit.invalid_fio'
								set @errdesc = 'Неверный формат ФИО'

								goto err
							end

						--проверка на правильный формат телефона
						if (@deliv_phone is not null) and (@deliv_phone not like '89%' or len(@deliv_phone) <> 11 or @deliv_phone like '%[^0-9]%')
							begin
								set @err = 'err.delivery_edit.invalid_phone'
								set @errdesc = 'Неверный формат телефона'

								goto err 
							end

						--проверка на возраст
						if (@deliv_birth is not null) and ((YEAR(getdate()) - YEAR(@deliv_birth)) < 18)
							begin
								set @err = 'err.delivery_edit.age_less_18'
								set @errdesc = 'Доставщику меньше восемнадцати лет'

								goto err
							end

						--проверка на существование курьера
						set @rp_ = null
						set @js_ = (select @deliv_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.delivery_edit.object_not_found'
								set @errdesc = 'Доставщик не найден'

								goto err
							end

						--проверка на уникальность номера курьера
						if (@deliv_phone is not null)
							begin
								set @rp_ = null
								set @js_ = (select @deliv_phone [phone] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.delivery_edit.not_unique_phone'
										set @errdesc = 'Доставщик c таким телефоном уже существует'

										goto err
									end
							end
						
						--изменяем
						update [dbo].[delivery]
						set	[fio]			= isnull(@deliv_fio, [fio]),
							[date_of_birth]	= isnull(@deliv_birth, [date_of_birth]),
							[phone]			= isnull(@deliv_phone, [phone])
						where  [id]			= @deliv_id

						--выводим
						set @rp =	(select * from [dbo].[delivery] with (nolock)
									where [id] = @deliv_id 
									for json path, without_array_wrapper)


						goto ok
					end
			
				--активация курьера
				if (@action in ('delivery.activate'))
					begin

						--проверка на наличие id
						if (@deliv_id is null)
							begin
								set @err = 'err.delivery_activate.unset_field'
								set @errdesc = 'Доставщик не найден'

								goto err
							end

						select	@deliv_phone = [phone],
								@deliv_status = [status]
						from [dbo].[delivery] with (nolock)
						where [id] = @deliv_id

						--проверка на существование курьера (также внутри неактивных)
						if (@deliv_status is null)
							begin
								set @err = 'err.delivery_activate.object_not_found'
								set @errdesc = 'Доставщик не найден'

								goto err
							end

						--проверка активен ли курьер
						if (@deliv_status = 'Y')
							begin
								set @err = 'err.delivery_activate.object_is_active'
								set @errdesc = 'Доставщик уже активен'

								goto err
							end
			
						--проверка на уже существующий и активный телефон курьера
						set @rp_ = null
						set @js_ = (select @deliv_phone [phone] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.delivery_activate.object_phone_is_active'
								set @errdesc = 'Доставщик с таким телефоном уже активен'

								goto err
							end
																							
						--обновляем статус
						update [dbo].[delivery]
						set [status] = 'Y'
						where [id] = @deliv_id

						--Выводим
						set @rp =	(select @deliv_id	[id]
											, 'Y'		[status]
									for json path, without_array_wrapper)
		

						goto ok
					end

			    --деактивация курьера
				if (@action in ('delivery.deactivate'))
					begin

						--проверка на наличие id
						if (@deliv_id is null)
							begin
								set @err = 'err.delivery_deactivate.unset_field'
								set @errdesc = 'Доставщик не найден'

								goto err
							end

						--проверка на существование курьера
						set @rp_ = null
						set @js_ = (select @deliv_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.delivery_deactivate.object_not_found'
								set @errdesc = 'Доставщик не найден'

								goto err	
							end
						
						--проверка на наличие заказов у курьера
						set @rp_ = null
						set @js_ = (select [id] from [dbo].[order] with (nolock) where [id_deliv] = @deliv_id and [status] in ('on_way') for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin 
								set @err = 'err.delivery_deactivate.delivery_has_orders' 
								set @errdesc = 'У доставщика есть заказы' 
 
								goto err 
							end

						--Изменяем  
						begin tran

							-- Меняем статус курьеру
							update [dbo].[delivery]
							set [status] = 'N'
							where  [id] = @deliv_id

							-- Удаляем из связи заказы / курьер записи заказов с id этого курьера
							update [dbo].[order] 
							set [id_deliv] =	(select top 1 [id] 
												from [delivery] with (nolock)
												where [id] not in (select [id_deliv] from [order] with (nolock)) order by newid()) 
							where  [id_deliv] = @deliv_id and [status] not in ('cancel', 'success')
		
							-- Удаляем из связи смены / доставщик записи заказов с id этого курьера
							update [dbo].[workshift] 
							set [status] = 'N' 
							where  [id_deliv] = @deliv_id and [status] = 'Y'

						commit tran

						--Выводим
						set @rp =	(select @deliv_id [id]
											,'N' [status]
									for json path, without_array_wrapper)


						goto ok
					end				
			end

		
		--смена курьера
		if (@sba in ('workshift'))
			begin
				declare 
				 @work_id		uniqueidentifier	= json_value(@js, '$.id')
				,@work_id_deliv	uniqueidentifier	= json_value(@js, '$.id_deliv')
				,@work_coorx	int					= json_value(@js, '$.coordinate_x')
				,@work_coory	int					= json_value(@js, '$.coordinate_y')
				,@work_status	char(1)
			
				--получение данных смены курьера
				if (@action in ('workshift.get'))
					begin
						set @rp =	(select * 
									from [dbo].[workshift] with (nolock)
									where ([id] = @work_id or [id_deliv] = @work_id_deliv) and [status] = 'Y'
									for json path, without_array_wrapper)


						goto ok
					end

				--создание смены курьера
				if (@action in ('workshift.create'))
					begin

						--проверка обязательных параметров на null
						if (@work_coorx is null 
							or @work_coory  is null
							or @work_id_deliv is null)
							begin
								set @err = 'err.workshift_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end
							
						--проверка на правильный формат координат
						if (@work_coorx not between 1 and 100) or (@work_coory not between 1 and 100)
							begin
								set @err = 'err.workshift_create.invalid_coordinate'
								set @errdesc = 'Неверный формат координат'

								goto err
							end						

						--проверка на существование доставщика
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[delivery] with (nolock) where [id] = @work_id_deliv and [status] = 'Y'  for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.workshift_create.invalid_delivery_id'
								set @errdesc = ' Такого доставщика не существует'

								goto err
							end

						--проверка на существование смены данного доставщика
						set @rp_ = null
						set @js_ = (select @work_id_deliv [id_deliv] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'workshift.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.workshift_create.not_unique_delivery'
								set @errdesc = 'Смена с этим доставщиком уже открыта'

								goto err							
							end
											
						--добавляем значения в таблицу
						set @work_id = newid()
						insert into [dbo].[workshift] 
						values (
								@work_id
								,getdate()
								,@work_id_deliv
								,@work_coorx
								,@work_coory
								, NULL
								,'Y'
								)

						--выводим
						set @rp =	(select @work_id [id]
											,@work_id_deliv [deliv_id]
											,@work_coorx [coordinate_x]
											,@work_coory [coordinate_y]
						   
									for json path, without_array_wrapper)


						goto ok	  
					end
								
			    --редактирование смены
				if (@action in ('workshift.edit'))
					begin

						--проверка на наличие id
						if (@work_id is null)
							begin
								set @err = 'err.workshift_edit.unset_field'
								set @errdesc = 'Пункт не найден'

								goto err
							end
			
						--проверка на наличие редактируемых параметров
						if (@work_id_deliv is null and
							@work_coorx is null and
							@work_coory is null)
							begin
								set @err = 'err.workshift_edit.hasnt_data'
								set @errdesc = 'Отсутствуют данные редактирования'

								goto err
							end

						--проверка на правильный формат координаты x
						if (@work_coorx is not null) and (@work_coorx not between 1 and 100)
							begin
								set @err = 'err.workshift_edit.invalid_coordinate_x'
								set @errdesc = 'Неверный формат координаты x'

								goto err
							end

						--проверка на правильный формат координаты y
						if (@work_coory is not null) and (@work_coory not between 1 and 100)
							begin
								set @err = 'err.workshift_edit.invalid_coordinate_y'
								set @errdesc = 'Неверный формат координаты y'

								goto err
							end

						--проверка на существование смены
						set @rp_ = null
						set @js_ = (select @work_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'workshift.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.workshift_edit.object_not_found'
								set @errdesc = 'Смена не найдена'

								goto err
							end

						--проверка на существование доставщика
						if (@work_id_deliv is not null) and not exists (select top 1 1 from [dbo].[delivery] with (nolock) where [id] = @work_id_deliv and [status] = 'Y')
							begin
								set @err = 'err.workshift_edit.invalid_delivery_id'
								set @errdesc = ' Такого доставщика не существует'

								goto err
							end
																						
						--изменяем
						update [dbo].[workshift]
						set	[id_deliv]		= isnull(@work_id_deliv, [id_deliv]),
							[coordinate_x]	= isnull(@work_coorx, [coordinate_x]),
							[coordinate_y]	= isnull(@work_coory, [coordinate_y])
						where [id] = @work_id

						--выводим
						set @rp = (select * from [dbo].[workshift] with (nolock)
						where [id] = @work_id 
						for json path, without_array_wrapper)


						goto ok
					end
					
			    --обновление местоположения курьера
				if (@action in ('workshift.upd_place'))
					begin
						update [dbo].[workshift]
						set [coordinate_x] = cast(rand()*100 as int)+1,
							[coordinate_y] = cast(rand()*100 as int)+1
						where [id] = (select top 1 [id] from [dbo].[workshift] with (nolock) where [status] = 'Y' order by newid())
					end

			    --открытие смены курьера
				if (@action in ('workshift.open'))
					begin

						--проверка на наличие id
						if (@work_id_deliv is null)
							begin
								set @err = 'err.workshift_activate.unset_field'
								set @errdesc = 'Смена не найдена'

								goto err
							end

						--проверка на существование доставщика
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[delivery] with (nolock) where [id] = @work_id_deliv and [status] = 'Y'  for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'delivery.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.workshift_activate.invalid_delivery_id'
								set @errdesc = ' Такого доставщика не существует'

								goto err
							end

						--проверка на существование смены
						set @rp_ = null
						set @js_ = (select @work_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'workshift.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.workshift_activate.object_is_active'
								set @errdesc = 'Смена уже активна'

								goto err
							end

						--обновляем статус и местоположение
						set @work_id = newid()

						insert into [dbo].[workshift]
						values (@work_id,
								getdate(),
								@work_id_deliv,
								cast(rand()*100 as int),
								cast(rand()*100 as int),
								NULL,
								'Y')

						--Выводим
						set @rp =	(select @work_id [id]
											, 'Y'    [status]
									for json path, without_array_wrapper)
		

						goto ok
					end

				--закрытие смены курьера
				if (@action in ('workshift.close'))
					begin

						--проверка на наличие id
						if (@work_id is null)
							begin
								set @err = 'err.workshift_deactivate.unset_field'
								set @errdesc = 'Смена не найдена'

								goto err
							end

						set @rp_ = null
						set @js_ = (select @work_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'workshift.get', @js_, @rp_ out

						set @work_id_deliv = json_value(@rp_, '$.response.id_deliv')
						set @work_status = json_value(@rp_, '$.response.status')

						--проверка на существование смены
						if (@work_status is null)
							begin
								set @err = 'err.workshift_deactivate.object_not_found'
								set @errdesc = 'Смена не найдена'

								goto err
							end

						--проверка на наличие заказов у доставщика в смене
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[order] with (nolock) where [id_deliv] = @work_id_deliv and [status] in ('collecting', 'wait', 'on_way') for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin 
								set @err = 'err.workshift_deactivate.delivery_in_workshift_has_orders' 
								set @errdesc = 'У доставщика в смене есть заказы' 
 
								goto err 
							end

						--Изменяем  

						update [dbo].[workshift]
						set [status] = 'N',
							[da_end] = getdate()
						where  [id] = @work_id

						--Выводим
						set @rp =	(select @work_id [id]
											,'N' [status]
									for json path, without_array_wrapper)


						goto ok
					end
			end


		--заказ
		if (@sba in ('order'))
			begin
				declare
				 @ord_id        uniqueidentifier	= json_value(@js, '$.id') 
				,@ord_name		nvarchar(200)		= json_value(@js, '$.name')
				,@ord_id_point	uniqueidentifier	= json_value(@js, '$.id_point')
				,@ord_id_cust	uniqueidentifier	= json_value(@js, '$.id_cust')
				,@ord_id_deliv	uniqueidentifier	= json_value(@js, '$.id_deliv')
				,@ord_coorx		int					= json_value(@js, '$.coordinate_x')
				,@ord_coory		int					= json_value(@js, '$.coordinate_y')
				,@krug_pnt		int					= 0
				,@smena_pnt		int					= 0
				,@krug_del		int					= 0
				,@smena_del		int					= 0
				,@per_del_del	int
				,@per_pnt		int
				,@ord_status	char(20)
				,@ord_point_coorx int
				,@ord_point_coory int

				declare @table_pnt table (krug int, x int, y int)

				declare @table_del table (krug int, x int, y int)
				
				--получение данных заказа
				if (@action in ('order.get'))
					begin
						set @rp =	(select * 
									from [dbo].[order] with (nolock)
									where ([id] = @ord_id or [name] = @ord_name) and [status] not in ('success', 'cancel')
									for json path, without_array_wrapper)


						goto ok
					end
					
				--создание заказа
				if (@action in ('order.create'))
					begin

						--проверка обязательных параметров на null
						if (@ord_name is null
							or @ord_id_cust is null
							or @ord_coorx is null  
							or @ord_coory  is null)
							begin
								set @err = 'err.order_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end

						--проверка на правильный формат координат
						if (@ord_coorx not between 1 and 100) or (@ord_coory not between 1 and 100)
							begin
								set @err = 'err.order_create.invalid_coordinate'
								set @errdesc = 'Неверный формат координат'

								goto err
							end

						--проверка на существование заказчика
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[customer] with (nolock) where [id] = @ord_id_cust and [status] = 'Y' for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'customer.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.order_create.invalid_customer_id'
								set @errdesc = 'Такого заказчика не существует'

								goto err
							end

						--проверка на название заказа
						set @rp_ = null
						set @js_ = (select @ord_name [name] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.order_create.not_unique_name'
								set @errdesc = 'Заказ с таким названием уже существует'

								goto err							
							end
		
						--добавляем значения в таблицу
						set @ord_id = newid()

						insert into [dbo].[order] 
						values (
								@ord_id
								,getdate()
								,@ord_name
								,NULL
								,@ord_id_cust
								,NULL
								,@ord_coorx
								,@ord_coory
								,'create'
								)

						--выводим
						set @rp =	(select @ord_id [id]
									,@ord_id_cust [customer_id]
									,@ord_coorx [coordinate_x]
									,@ord_coory [coordinate_y]
						   
									for json path, without_array_wrapper)


						goto ok
					end
					
				--поиск пункта
				if (@action in ('order.search_point'))
					begin

						--проверка на наличие id
						if (@ord_id is null)
							begin
								set @err = 'err.order_search_point.unset_field'
								set @errdesc = 'Заказ не найден'

								goto err
							end

						set @rp_ = null
						set @js_ = (select @ord_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						set @ord_status = json_value(@rp_, '$.response.status')
						set @ord_coorx = json_value(@rp_, '$.response.coordinate_x')
						set @ord_coory = json_value(@rp_, '$.response.coordinate_y')

						--проверка на существование заказа
						if (@ord_status is null)
							begin
								set @err = 'err.order_search_point.object_not_found'
								set @errdesc = 'Заказ не найден'

								goto err
							end

						--проверка на правильный этап заказа
						if (@ord_status not in ('create'))
							begin
								set @err = 'err.order_search_point.object_not_created_or_already_passed'
								set @errdesc = 'Заказ не создан или уже прошёл данный этап'

								goto err
							end

						--проверка на существование пунктов
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[point] with (nolock) where [status] = 'Y' for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'point.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin try
								begin tran			
								set transaction isolation level serializable

									--Изменяем  
									update [dbo].[order]
									set [status] = 'cancel'
									where  [id] = @ord_id
								
								set transaction isolation level read committed
								commit tran

								--Выводим
								set @rp =	(select @ord_id [id]
													,@ord_id_point [point_id]
													,'cancel' [status]
											for json path, without_array_wrapper)


								goto ok

							end try
							begin catch
								set @err = 'err.order_search_point.transaction_failed'
								set @errdesc = 'Не удалось произвести транзакцию'

								if (@@trancount > 0)
									rollback tran
	
								goto err
							end catch

						--составление области поиска
						set @per_pnt = iif (@ord_coorx>@ord_coory, @ord_coory, @ord_coorx)

						while @krug_pnt<= (100-@per_pnt)
							begin
								set @smena_pnt = @krug_pnt*(-1) 

								while @smena_pnt<=@krug_pnt
									begin
										insert into @table_pnt
										select * from(
										select @krug_pnt [krug], @ord_coorx - @krug_pnt [x], @ord_coory + @smena_pnt [y]
										union 
										select @krug_pnt [krug], @ord_coorx + @smena_pnt [x], @ord_coory + @krug_pnt [y]
										union 
										select @krug_pnt [krug], @ord_coorx + @smena_pnt [x], @ord_coory - @krug_pnt [y] 
										union 
										select @krug_pnt [krug], @ord_coorx + @krug_pnt [x], @ord_coory + @smena_pnt [y]) v
										where v.[x] between 1 and 100 and v.[y] between 1 and 100

										set @smena_pnt = @smena_pnt + 1
									end
	
								set @krug_pnt = @krug_pnt +1
							end
	
						--поиск ближайшего пункта
						select top 1 @ord_id_point=pnt.[id] 
						from [dbo].[point] pnt with (nolock)
						join @table_pnt tbl on pnt.[coordinate_x]=tbl.[x] and pnt.[coordinate_y] = tbl.[y]
						where pnt.[status] = 'Y'
						order by tbl.[krug]
	
						if (@ord_id_point is not null)
							begin try
								begin tran
								set transaction isolation level serializable

									--Изменияем
									update [dbo].[order]
									set [status]	= iif([status] in ('create'), 'search_delivery', [status]),
										[id_point]	= iif([status] in ('create'), @ord_id_point, [id_deliv]),
										@ord_status = iif([status] in ('create'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_search_point.object_already_passed'
											set @errdesc = 'Заказ уже прошёл данный этап'

											goto err
										end	
			
								set transaction isolation level read committed
								commit tran
				
								--Выводим
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'search_delivery' [status]
											for json path, without_array_wrapper)
			
	
								goto ok	
							end try
							begin catch
								set @err = 'err.order_search_point.transaction_failed'
								set @errdesc = 'Не удалось произвести транзакцию'

								if (@@trancount > 0)
									rollback tran
	
								goto err	
							end catch
			
						--проверка на найденный пункт
						if (@ord_id_point is null)
							begin try
								begin tran
								set transaction isolation level serializable
	
									--Изменяем  
									update [dbo].[order]
									set [status] = 'cancel'
									where  [id] = @ord_id
	
								set transaction isolation level read committed
								commit tran

								--Выводим
								set @rp =	(select @ord_id [id]
													,@ord_id_point [point_id]
													,'cancel' [status]
											for json path, without_array_wrapper)
	
								goto ok

							end try
							begin catch
								set @err = 'err.order_search_point.transaction_failed'
								set @errdesc = 'Не удалось произвести транзакцию'

								if (@@trancount > 0)
									rollback tran
	
								goto err
							end catch
			
	
						goto ok
					end
	
				--поиск курьера
				if (@action in ('order.searh_delivery'))
					begin

						--проверка на наличие id
						if (@ord_id is null)
							begin
								set @err = 'err.order_search_delivery.unset_field'
								set @errdesc = 'Заказ не найден'
	
								goto err
							end

						select  @ord_point_coorx	= pnt.[coordinate_x],
								@ord_point_coory	= pnt.[coordinate_y],
								@ord_id_point		= ord.[id_point],
								@ord_status			= ord.[status]
						from [dbo].[point] pnt with (nolock)
						join [dbo].[order] ord with (nolock) on pnt.[id] = ord.[id_point]
						where ord.[id] = @ord_id
	
						--проверка на существование заказа
						if (@ord_status is null)
							begin
								set @err = 'err.order_search_delivery.object_not_found'
								set @errdesc = 'Заказ не найден'
	
								goto err
							end

						--проверка на правильный этап заказа
						if (@ord_status not in ('search_delivery'))
							begin
								set @err = 'err.order_search_delivery.object_not_created_or_already_passed'
								set @errdesc = 'Заказ не создан или уже прошёл данный этап'
	
								goto err
							end

						--проверка на существование курьеров c открытой сменой
						set @rp_ = null
						set @js_ = (select top 1 [id] from [dbo].[workshift] with (nolock) where [status] = 'Y' for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'workshift.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin try
								begin tran
								set transaction isolation level serializable

									--Изменяем  
									update [dbo].[order]
									set [status] = 'cancel',
										[id_deliv] = @ord_id_deliv
									where  [id] = @ord_id

								set transaction isolation level read committed
								commit tran

								--Выводим
								set @rp	=	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'cancel' [status]
											for json path, without_array_wrapper)
										
								goto ok
							end try
							begin catch
								set @err = 'err.order_search_delivery.transaction_failed'
								set @errdesc = 'Не удалось произвести транзакцию'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch

						--поиск курьера, направляющегося в этот же пункт
						select top 1 @ord_id_deliv = [id_deliv] 
						from [dbo].[order] with (updlock)
						where [id_point] = @ord_id_point and [status] in ('collecting', 'wait')
						group by [id_deliv]
						order by count([id_deliv])
	
						if (@ord_id_deliv is not null)
							begin try
								begin tran
								set transaction isolation level serializable

									--Изменияем
									update [dbo].[order]
									set [status]	= iif([status] in ('search_delivery'), 'collecting', [status]),
										[id_deliv]	= iif([status] in ('search_delivery'), @ord_id_deliv, [id_deliv]),
										@ord_status = iif([status] in ('search_delivery'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_search_delivery.object_already_passed'
											set @errdesc = 'Заказ уже прошёл данный этап'

											goto err
										end	

								set transaction isolation level read committed
								commit tran

								--Выводим
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'collecting' [status]
											for json path, without_array_wrapper)


								goto ok	
							end try
							begin catch
								set @err = 'err.order_search_delivery.transaction_failed'
								set @errdesc = 'Не удалось произвести транзакцию'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch
	
						--составление области поиска
						set @per_del_del = iif (@ord_point_coorx>@ord_point_coory, @ord_point_coory, @ord_point_coorx)
	
						while @krug_del<= (100-@per_del_del)
							begin
								set @smena_del = @krug_del*(-1) 
			
								while @smena_del<=@krug_del
									begin
										insert into @table_del
										select * from(
										select @krug_del [krug], @ord_point_coorx - @krug_del [x], @ord_point_coory + @smena_del [y]
										union 
										select @krug_del [krug], @ord_point_coorx + @smena_del [x], @ord_point_coory + @krug_del [y]
										union 
										select @krug_del [krug], @ord_point_coorx + @smena_del [x], @ord_point_coory - @krug_del [y]
										union 
										select @krug_del [krug], @ord_point_coorx + @krug_del [x], @ord_point_coory + @smena_del [y]) v
										where v.[x] between 1 and 100 and v.[y] between 1 and 100
										set @smena_del = @smena_del + 1					  
									end
				 	
								set @krug_del = @krug_del +1
							end

						--Поиск свободного курьера
						select top 1 @ord_id_deliv = wsh.[id_deliv] 
						from [dbo].[workshift] wsh with (nolock)
						join @table_del tbl on wsh.[coordinate_x] = tbl.[x] and wsh.[coordinate_y]=tbl.[y] 
						where  wsh.[id_deliv] not in	(select ord.[id_deliv] 
														from [dbo].[order] ord with (nolock)
														where ord.[id_deliv] = wsh.[id_deliv] and ord.[status] not in ('success', 'cancel')) and wsh.[status] in ('Y')
						order by tbl.[krug]

						if (@ord_id_deliv is not null)
							begin try
								begin tran
								set transaction isolation level serializable

									--Изменияем
									update [dbo].[order]
									set [status]	= iif([status] in ('search_delivery'), 'collecting', [status]),
										[id_deliv]	= iif([status] in ('search_delivery'), @ord_id_deliv, [id_deliv]),
										@ord_status = iif([status] in ('search_delivery'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_search_delivery.object_already_passed'
											set @errdesc = 'Заказ уже прошёл данный этап'

											goto err
										end	

								set transaction isolation level read committed
								commit tran

								--Выводим
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'collecting' [status]
											for json path, without_array_wrapper)


								goto ok	
							end try
							begin catch
								set @err = 'err.order_search_delivery.transaction_failed'
								set @errdesc = 'Не удалось произвести транзакцию'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch


						--проверка найденного курьера
						if (@ord_id_deliv is null)
							begin try
								begin tran
								set transaction isolation level serializable
	
									--Изменяем  
									update [dbo].[order]
									set [status] = 'cancel',
										[id_deliv] = @ord_id_deliv
									where  [id] = @ord_id

								set transaction isolation level read committed
								commit tran

								--Выводим
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'cancel' [status]
											for json path, without_array_wrapper)

								goto ok
							end try
							begin catch
								set @err = 'err.order_search_delivery.transaction_failed'
								set @errdesc = 'Не удалось произвести транзакцию'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch
			

						goto ok
					end
					
			    --сбор заказа и ожидание курьера
				if (@action in ('order.wait_delivery'))
					begin

						--проверка на наличие id
						if ( @ord_id is null)
							begin
								set @err = 'err.order_collecting.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end		
						
						set @rp_ = null
						set @js_ = (select @ord_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						set @ord_status = json_value(@rp_, '$.response.status')

						--проверка на существование заказа
						if (@ord_status is null)
							begin
								set @err = 'err.order_collecting.object_not_found'
								set @errdesc = 'Заказ не найден'

								goto err
							end

						--проверка на правильный этап заказа
						if (@ord_status != 'collecting')
							begin
								set @err = 'err.order_collecting.object_not_created_or_already_passed'
								set @errdesc = 'Заказ не создан или уже прошёл данный этап'

								goto err
							end
						
						--Изменяем 
						begin try
							begin tran
								set transaction isolation level serializable

									--Изменияем
									update [dbo].[order]
									set [status]	= iif([status] in ('collecting'), 'wait', [status]),
										@ord_status = iif([status] in ('collecting'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_collecting.object_already_passed'
											set @errdesc = 'Заказ уже прошёл данный этап'

											goto err
										end	

								set transaction isolation level read committed
								commit tran

								--Выводим
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'collecting' [status]
											for json path, without_array_wrapper)


								goto ok	
							end try
							begin catch
								set @err = 'err.order_collecting.transaction_failed'
								set @errdesc = 'Не удалось произвести транзакцию'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch

						--Выводим
						set @rp =	(select @ord_id [id]
											,'wait' [status]
									for json path, without_array_wrapper)


						goto ok
					end

			    --передача заказа курьеру
				if (@action in ('order.on_way'))
					begin

						--проверка на наличие id
						if (@ord_id is null)
							begin
								set @err = 'err.order_on_way.unset_field'
								set @errdesc = 'Заказ не найден'

								goto err
							end

						set @rp_ = null
						set @js_ = (select @ord_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						set @ord_status = json_value(@rp_, '$.response.status')

						--проверка на существование заказа
						if (@ord_status is null)
							begin
								set @err = 'err.order_on_way.object_not_found'
								set @errdesc = 'Заказ не найден'

								goto err
							end

						--проверка на правильный этап заказа
						if (@ord_status != 'wait')
							begin
								set @err = 'err.order_on_way.object_not_created_or_already_passed'
								set @errdesc = 'Заказ не создан или уже прошёл данный этап'

								goto err
							end

						--Изменяем  
						begin try
							begin tran
								set transaction isolation level serializable

									--Изменияем
									update [dbo].[order]
									set [status]	= iif([status] in ('wait'), 'on_way', [status]),
										@ord_status = iif([status] in ('wait'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_on_way.object_already_passed'
											set @errdesc = 'Заказ уже прошёл данный этап'

											goto err
										end	

								set transaction isolation level read committed
								commit tran

								--Выводим
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'on_way' [status]
											for json path, without_array_wrapper)


								goto ok	
							end try
							begin catch
								set @err = 'err.order_on_way.transaction_failed'
								set @errdesc = 'Не удалось произвести транзакцию'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch

						--Выводим
						set @rp =	(select @ord_id [id]
											,'on_way' [status]
									for json path, without_array_wrapper)


						goto ok
					end

			    --Выполнение заказа
				if (@action in ('order.success'))
					begin
						  
						--проверка на наличие id
						if (@ord_id is null)
							begin
								set @err = 'err.order_success.unset_field'
								set @errdesc = 'Заказ не найден'

								goto err
							end

						set @rp_ = null
						set @js_ = (select @ord_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'order.get', @js_, @rp_ out

						set @ord_status = json_value(@rp_, '$.response.status')

						--проверка на существование заказа
						if (@ord_status is null)
							begin
								set @err = 'err.order_success.object_not_found'
								set @errdesc = 'Заказ не найден'

								goto err
							end

						--проверка на правильный этап заказа
						if (@ord_status != 'on_way')
							begin
								set @err = 'err.order_success.object_not_created_or_already_passed'
								set @errdesc = 'Заказ не создан или уже прошёл данный этап'

								goto err
							end

						--Изменяем 
						begin try
							begin tran
								set transaction isolation level serializable

									--Изменияем
									update [dbo].[order]
									set [status]	= iif([status] in ('on_way'), 'success', [status]),
										@ord_status = iif([status] in ('on_way'), 1, 0)
									where  [id] = @ord_id

									if (@ord_status = 0)
										begin
											set @err = 'err.order_success.object_already_passed'
											set @errdesc = 'Заказ уже прошёл данный этап'

											goto err
										end	

								set transaction isolation level read committed
								commit tran

								--Выводим
								set @rp =	(select	@ord_id [id]
													,@ord_id_deliv [deliv_id]
													,'success' [status]
											for json path, without_array_wrapper)


								goto ok	
							end try
							begin catch
								set @err = 'err.order_success.transaction_failed'
								set @errdesc = 'Не удалось произвести транзакцию'

								if (@@trancount > 0)
									rollback tran

								goto err	
							end catch

						--Выводим
						set @rp =	(select @ord_id [id]
											,'success' [status]
									for json path, without_array_wrapper)


						goto ok
					end
			end
			
	end try
	begin catch
		set @err = 'err.sys'
		set @errdesc = error_message()
				
		goto err
	end catch
	
	err:
		set @rp = (select 'err' [status], lower(@err) [err] , @errdesc [errdesc] for json path, without_array_wrapper)
			if (@@trancount > 0)
			rollback tran
		return

	ok:
		set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
			if (@@trancount > 0)
			commit tran
		return

end
