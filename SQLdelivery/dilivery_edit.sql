use metod

go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[dilivery.edit]
	@js nvarchar(max),
	@rp nvarchar(max) output 
as
begin
	declare 
	@err          nvarchar(100)
	,@errdesc      nvarchar(100)

	,@diliv_id	uniqueidentifier   =   json_value(@js, '$.id')
	,@diliv_fio		nvarchar(200)  =   json_value(@js, '$.fio')
	,@diliv_birth   date		   =   json_value(@js, '$.date_of_birth')
	,@diliv_phone   nvarchar(20)   =   json_value(@js, '$.phone')
		
	--�������� �� ������� id
	if (@diliv_id is null)
		begin
			set @err = 'err.dilivery_edit.unset_field'
			set @errdesc = '��������� �� ������'

			goto err
		end

	--�������� �� ������� ������������� ����������
	if (@diliv_fio is null and @diliv_birth is null and @diliv_phone is null)
		begin
			set @err = 'err.dilivery_edit.hasnt_data'
			set @errdesc = '����������� ������ ��������������'

			goto err
		end

	--�������� �� ���������� ������ �������
	if (@diliv_fio is not null) and (@diliv_fio like '%[^�-�^a-z^ ]%')
		begin
			set @err = 'err.dilivery_edit.invalid_fio'
			set @errdesc = '�������� ������ ���'

			goto err
		end

	--�������� �� ���������� ������ ��������
	if (@diliv_phone is not null) and (@diliv_phone not like '89%' or len(@diliv_phone) <> 11 or @diliv_phone like '%[^0-9]%')
		begin
			set @err = 'err.dilivery_edit.invalid_phone'
			set @errdesc = '�������� ������ ��������'

			goto err
		end

	--�������� �� �������
	if ((YEAR(getdate()) - YEAR(@diliv_birth)) < 18)
		begin
			set @err = 'err.dilivery_edit.age_less_18'
			set @errdesc = '���������� ������ ������������ ���'

			goto err
		end

	--�������� �� ������������� ����������
	if not exists (select top 1 1 from [dbo].[delivery] where [id] = @diliv_id and [status] = 'Y')
	begin
	set @err = 'err.dilivery_edit.object_not_found'
	set @errdesc = '��������� �� ������'

	goto err
	end

	--�������� �� ��� ������������ ����� �������� ����������
	if (@diliv_phone is not null) and exists (select top 1 1 from [dbo].[delivery] where [phone] = @diliv_phone and [status] = 'Y')
		begin
			set @err = 'err.dilivery_edit.not_unique_phone'
			set @errdesc = '��������� c ����� ��������� ��� ����������'

			goto err
		end

	--��������
	update [dbo].[delivery]
	set	[fio]			=	isnull(@diliv_fio, [fio]),
		[date_of_birth] =	isnull(@diliv_birth, [date_of_birth]),
		[phone]			=	isnull(@diliv_phone, [phone])
	where [id] = @diliv_id

	--�������
	set @rp =	(select * from [dbo].[delivery]
				where [id] = @diliv_id 
				for json path, without_array_wrapper)


	goto ok
		  

	err: 
		set @rp = (select 'err' [status], lower(@err) [err], @errdesc [errdesc] for json path, without_array_wrapper)
		return
			  

	  
	ok: 
		set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		return
			   
end