use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[customer.create]
	@js nvarchar(max),
	@rp nvarchar(max) output 
as
begin
	declare 
	@err          nvarchar(100)
	,@errdesc      nvarchar(100)

	,@cust_id    uniqueidentifier
	,@cust_fio  nvarchar(200)       =   json_value(@js, '$.fio')
	,@cust_address   nvarchar(200)     =   json_value(@js, '$.address')
	,@cust_phone   nvarchar(20)     =   json_value(@js, '$.phone')
       
	--�������� ������������ ���������� �� null
	if (@cust_fio is null 
		or @cust_address  is null
		or @cust_phone is null)
		begin
			set @err = 'err.customer_create.unset_field'
			set @errdesc = '������� �� ��� ����������� ���������'

			goto err
		end

	--�������� �� ���������� ������ �������
	if (@cust_fio like '%[^�-�^a-z^ ]%')
		begin
			set @err = 'err.customer_create.invalid_fio'
			set @errdesc = '�������� ������ ���'

			goto err
		end

	--�������� �� ���������� ������ ��������
	if (@cust_phone not like '89%' or len(@cust_phone) <> 11 or @cust_phone like '%[^0-9]%')
		begin
			set @err = 'err.customer_create.invalid_phone'
			set @errdesc = '�������� ������ ��������'

			goto err
		end

	--�������� �� ��� ������������� ���������
	if exists (select top 1 1 from [dbo].[customer] where [phone] = @cust_phone and [status] = 'Y')
		begin
			set @err = 'err.customer_create.not_unique_phone'
			set @errdesc = '�������� c ����� ��������� ��� ����������'

			goto err
		end

	set @cust_id = newid()
	--��������� �������� � �������
	insert into [dbo].[customer] 
	values	(
			@cust_id
			,getdate()
			,@cust_fio
			,@cust_address
			,@cust_phone
			,'Y'
			)

	--�������
	set @rp =	(select @cust_id [id]
						,@cust_fio [fio]
						,@cust_address  [address] 
						,@cust_phone [phone]
						   
				for json path, without_array_wrapper)

	goto ok
		  

	err: 
		set @rp = (select 'err' [status], lower(@err) [err], @errdesc [errdesc] for json path, without_array_wrapper)
		return
			  

	  
	ok: 
		set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		return
			   
end
