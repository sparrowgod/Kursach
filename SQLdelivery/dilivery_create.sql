use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[dilivery.create]
	@js nvarchar(max),
	@rp nvarchar(max) output 
as
begin
	declare 
	@err          nvarchar(100)
	,@errdesc      nvarchar(100)

	,@diliv_id      uniqueidentifier
	,@diliv_fio     nvarchar(200)    =   json_value(@js, '$.fio')
	,@diliv_birth	  date		       =   json_value(@js, '$.date_of_birth')
	,@diliv_phone   nvarchar(20)     =   json_value(@js, '$.phone')

	--�������� ������������ ���������� �� null
	if (@diliv_fio is null 
		or @diliv_birth is null
		or @diliv_phone is null)
		begin
			set @err = 'err.dilivery_create.unset_field'
			set @errdesc = '������� �� ��� ����������� ���������'

			goto err
		end

	--�������� �� ���������� ������ ��������
	if (@diliv_phone not like '89%' or len(@diliv_phone) <> 11 or @diliv_phone like '%[^0-9]%')
		begin
			set @err = 'err.dilivery_create.invalid_phone'
			set @errdesc = '�������� ������ ��������'

			goto err
		end

	--�������� �� ���������� ������ �������
	if (@diliv_fio like '%[^�-�^a-z^ ]%')
		begin
			set @err = 'err.dilivery_create.invalid_fio'
			set @errdesc = '�������� ������ ���'

			goto err
		end

	--�������� �� �������
	if ((YEAR(getdate()) - YEAR(@diliv_birth)) < 18)
		begin
			set @err = 'err.dilivery_create.age_less_18'
			set @errdesc = '���������� ������ ������������ ���'

			goto err
		end

	--�������� �� ��� ������������� ����������
	if exists (select top 1 1 from [dbo].[delivery] where [phone] = @diliv_phone and [status] = 'Y')
		begin
			set @err = 'err.dilivery_create.not_unique_phone'
			set @errdesc = '��������� c ����� ��������� ��� ����������'

			goto err
		end

	set @diliv_id = newid()
	--��������� �������� � �������
	insert into [dbo].[delivery] 
	values	(
				@diliv_id
				,getdate()
				,@diliv_fio
				,@diliv_birth
				,@diliv_phone
				,'Y'
			)

	--�������
	set @rp =	(select @diliv_id [id]
						,@diliv_birth [date_of_birth]
						,@diliv_fio [fio]
						,@diliv_phone [phone]						   
				for json path, without_array_wrapper)

	goto ok
		  

	err: 
		set @rp = (select 'err' [status], lower(@err) [err], @errdesc [errdesc] for json path, without_array_wrapper)
		return
			  

	  
	ok: 
		set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		return
			   
end
