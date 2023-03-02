use [metod] --используемая БД
go
declare
@rp nvarchar(max),

--прописать входные данные для нужного метода
@js nvarchar(max) = '{
						"fio": "testovoethree",
						"date_of_birth": "01-03-2001",
						"phone": "89339820823"
					 }'

--прописать название используемого метода(процедуры)
exec [dbo].[dilivery.create] @js, @rp out		

select @rp