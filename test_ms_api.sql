use [metod]

go
set ansi_nulls on
go
set quoted_identifier on
go



--customer
--
--


----get----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null
--по id и номеру телефона 
set @js = ( 
			select '9bf28218-3804-4393-b3f3-8b152e713dd6'	[id]
				   , '89109820880'							[phone]
			for json path, without_array_wrapper 
		   ) 
exec [dbo].[ms_api] 'customer.get', @js, @rp out

select @rp as 'customer.get'
select * from [dbo].[customer] 
go


----create----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--для создания заказчика необходимо ввести фио, адрес и телефон
set @js = ( 
			 select  'Афанасьев Игорь Николаевич'		[fio]
					,'г.Владимир, проспект строителей'	[address]
					,'89109822294'						[phone]				
			 for json path, without_array_wrapper
		   ) 
exec [dbo].[ms_api] 'customer.create', @js, @rp out

select @rp as 'customer.create'
select * from [dbo].[customer] 
go


----edit----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--изменение по id, можно изменить адрес и телефон
set @js = ( 
			select   '9bf28218-3804-4393-b3f3-8b152e713dd6'	[id]				  
				   , 'Получается новый адрес'				[address]
				   , '89159873582'							[phone]
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'customer.edit', @js, @rp out

select @rp as 'customer.edit'
select * from [dbo].[customer] 
go


----deactivate----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--деактивация по id
set @js =	(
			select '9bf28218-3804-4393-b3f3-8b152e713dd6' [id] 
			for json path, without_array_wrapper
			)
exec [dbo].[ms_api] 'customer.deactivate', @js, @rp out

select @rp as 'customer.deactivate'
select * from [dbo].[customer] 
go


----activate----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--активация по id
set @js =	(
			select '9bf28218-3804-4393-b3f3-8b152e713dd6' [id] 
			for json path, without_array_wrapper
			)
exec [dbo].[ms_api] 'customer.activate', @js, @rp out

select @rp as 'customer.activate'
select * from [dbo].[customer] 
go




--
--point
--


----get----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null
--по id, телефону, адресу и координатам
set @js = ( 
			select   '5ee78691-3bf9-4a53-885c-5a4a24ef72ea' [id]
				   , '89109822408'							[phone]
				   , 'blablaaaa'							[address]
				   , '53'									[coordinate_x]
				   , '50'									[coordinate_y]
			for json path, without_array_wrapper 
		   ) 
exec [dbo].[ms_api] 'point.get', @js, @rp out

select @rp as 'point.get'
select * from [dbo].[point] 
go


----create----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null
--для создания пункта необходимо написать название, адрес, телефон и координаты
set @js = ( 
			 select  'testovoe'								[name]
				   , '89209873821'							[phone]
				   , 'blablakaa'							[address]
				   , '58'									[coordinate_x]
				   , '31'									[coordinate_y]
			 for json path, without_array_wrapper
		   ) 
exec [dbo].[ms_api] 'point.create', @js, @rp out

select @rp as 'point.create'
select * from [dbo].[point] 
go


----edit----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--изменение по id, можно изменить название, адрес, телефон и координаты
set @js = ( 
			select	 '5ee78691-3bf9-4a53-885c-5a4a24ef72ea' [id]
				   , 'testovoe'								[name]
				   , '89209873821'							[phone]
				   , 'blablakaa'							[address]
				   , '58'									[coordinate_x]
				   , '31'									[coordinate_y]
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'point.edit', @js, @rp out

select @rp as 'point.edit'
select * from [dbo].[point] 
go


----deactivate----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--деактивация проходит по id
set @js =	(
			select '5ee78691-3bf9-4a53-885c-5a4a24ef72ea' [id]
			for json path, without_array_wrapper
			)
exec [dbo].[ms_api] 'point.deactivate', @js, @rp out

select @rp as 'point.deactivate'
select * from [dbo].[point] 
go


----activate----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--деактивация проходит по id
set @js =	(
			select '5ee78691-3bf9-4a53-885c-5a4a24ef72ea' [id]
			for json path, without_array_wrapper
			)
exec [dbo].[ms_api] 'point.activate', @js, @rp out

select @rp as 'point.activate'
select * from [dbo].[point] 
go




--
--delivery
--


----get----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--по id и телефону
set @js = (
			select   '5e3db10a-c18b-4a34-b1e3-5ca72c9ea1e2' [id]
				    ,'89009823532' [phone]			   
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'delivery.get', @js, @rp out

select @rp as 'delivery.get'
select * from [dbo].[delivery] 
go


----create----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null
--для создания необходимы фио, телефон и дата рождения
set @js = ( 
			select  'testovoefio' [fio]
				   ,'89158883399' [phone]
				   ,'2001-07-04' [date_of_birth]
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'delivery.create', @js, @rp out

select @rp as 'delivery.create'
select * from [dbo].[delivery]
go


----edit----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null
--изменение по id, можно изменить фио, телефон и дату рождения
set @js = ( 
			select  '5e3db10a-c18b-4a34-b1e3-5ca72c9ea1e2'	[id]
				   ,'newfio'								[fio]
				   ,'89152898476'							[phone]
				   ,'2000-03-07'							[date_of_birth]
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'delivery.edit', @js, @rp out

select @rp as 'delivery.edit'
select * from [dbo].[delivery]
go


----deactivate----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--деактивация проходит по id
set @js =	(
			select '5e3db10a-c18b-4a34-b1e3-5ca72c9ea1e2' [id] 
			for json path, without_array_wrapper
			)
exec [dbo].[ms_api] 'delivery.deactivate', @js, @rp out

select @rp as 'delivery.deactivate'
select * from [dbo].[delivery]
go


----activate----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--активация проходит по id
set @js =	(
			select '5e3db10a-c18b-4a34-b1e3-5ca72c9ea1e2' [id] 
			for json path, without_array_wrapper
			)
exec [dbo].[ms_api] 'delivery.activate', @js, @rp out

select @rp as 'delivery.activate'
select * from [dbo].[delivery]
go




--
--workshift
--

----get----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--по id смены или id курьера
set @js = ( 
			select   'A80E8419-77C9-4560-98E7-A07C7E8E6F20'      [id]
				   , 'ABCC456A-E4AF-4A4A-BDC0-CD74F2AD6A8D'      [id_deliv]
			for json path, without_array_wrapper 
		   ) 
exec [dbo].[ms_api] 'workshift.get', @js, @rp out

select @rp as 'workshift.get'
select * from [dbo].[workshift] 
go


----create----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--для создания смены необходимо ввести id курьера и его новые координаты
set @js = ( 
			 select  '980ac225-41a6-44e4-a8fd-559afb53745a' [id_deliv]
					,'32'									[coordinate_x]
					,'39'									[coordinate_y]						
			 for json path, without_array_wrapper
		   ) 
exec [dbo].[ms_api] 'workshift.create', @js, @rp out

select @rp as 'workshift.create'
select * from [dbo].[workshift]
go


----edit----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--изменение по id, можно изменить id курьера или его новые координаты
set @js = ( 
			select  'A80E8419-77C9-4560-98E7-A07C7E8E6F20'	[id]
				   ,'21484670-5c4b-4b28-9071-a833cb7b0624'	[id_deliv]
				   ,'54'									[coordinate_x]
				   ,'48'									[coordinate_y]
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'workshift.edit', @js, @rp out

select @rp as 'workshift.edit'
select * from [dbo].[workshift] 
go


----upd_place----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null
set @js = null

exec [dbo].[ms_api] 'workshift.upd_place', @js, @rp out

select * from [dbo].[workshift] 
go


----close----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--закрытие проходит по id
set @js =	(
			select 'a80e8419-77c9-4560-98e7-a07c7e8e6f20' [id] 
			for json path, without_array_wrapper
			)
exec [dbo].[ms_api] 'workshift.close', @js, @rp out

select @rp as 'workshift.close'
select * from [dbo].[workshift]
go


----open----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--активация проходит по id
set @js =	(
			select '5e3db10a-c18b-4a34-b1e3-5ca72c9ea1e2' [id] 
			for json path, without_array_wrapper
			)
exec [dbo].[ms_api] 'workshift.open', @js, @rp out

select @rp as 'workshift.open'
select * from [dbo].[workshift]
go




--
--order
--

----get----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--по id или названию
set @js = ( 
			select  '19F28218-3804-4393-B3F3-8B152E713DD6'	[id]
				   ,'dsadw'									[name] 
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'order.get', @js, @rp out

select @rp as 'order.get'
select * from [dbo].[order] 
go


----create----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--для создания необходимы название заказа, id заказчика и его координаты
set @js = ( 
			select  'prostotest' [name]
				   ,'944f695a-f5a4-4422-80b8-8e9d2655d188' [id_cust] 
				   ,'64' [coordinate_x]
				   ,'71' [coordinate_y]
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'order.create', @js, @rp out


select @rp as 'order.create'
select * from [dbo].[order] 
go


----search_point----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--для поиска пункта необходимо задать id заказа
set @js = ( 
			select  '10d26a37-1efa-4e59-b285-340703b5ac6d'  [id]
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'order.search_point', @js, @rp out

select @rp as 'order.search_point'
select * from [dbo].[order] 
go


----search_delivery----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--для поиска курьера необходимо задать id заказа
set @js = ( 
			select  '10d26a37-1efa-4e59-b285-340703b5ac6d'  [id]
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'order.searh_delivery', @js, @rp out

select @rp as 'order.searh_delivery'
select * from [dbo].[order] 
go


----wait_delivery----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--для принятия ожидания курьера нужно задать id этого заказа
set @js = ( 
			select  '10d26a37-1efa-4e59-b285-340703b5ac6d'  [id]
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'order.wait_delivery', @js, @rp out

select @rp as 'order.wait_delivery'
select * from [dbo].[order] 
go


----on_way----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--для отправления курьера нужно задать id этого заказа
set @js = ( 
			select  '10d26a37-1efa-4e59-b285-340703b5ac6d'  [id]
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'order.on_way', @js, @rp out

select @rp as 'order.on_way'
select * from [dbo].[order] 
go


----success----
declare
	@js nvarchar(max),
	@rp nvarchar(max)

set @rp = null

--для принятия заказа нужно задать его id
set @js = ( 
			select  '10d26a37-1efa-4e59-b285-340703b5ac6d'  [id]
			for json path, without_array_wrapper
		  ) 
exec [dbo].[ms_api] 'order.success', @js, @rp out

select @rp as 'order.success'
select * from [dbo].[order] 
go

