use [metod] --������������ ��
go
declare
@rp nvarchar(max),

--��������� ������� ������ ��� ������� ������
@js nvarchar(max) = '{
						"fio": "testovoethree",
						"date_of_birth": "01-03-2001",
						"phone": "89339820823"
					 }'

--��������� �������� ������������� ������(���������)
exec [dbo].[dilivery.create] @js, @rp out		

select @rp