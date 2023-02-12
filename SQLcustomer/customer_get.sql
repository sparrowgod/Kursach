use metod

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[customer.get] 
@js nvarchar(max),
@rp nvarchar(max) output
as
begin
       declare 
	    @err       nvarchar(100)
	   ,@errdesc   nvarchar(100)

	   ,@cust_id uniqueidentifier	=	json_value(@js, '$.id')
	   ,@cust_phone nvarchar(20)	=	json_value(@js, '$.phone')
	   
	   --выводим
	   set @rp = (select * 
	              from [dbo].[customer]
				  where ([id] = @cust_id or [phone] = @cust_phone) and [status] = 'Y'
				  for json path, without_array_wrapper)


		    
	   ok: 
	       set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		   return
	   

	   err: 
	       set @rp = (select 'err' [status], lower(@err) [err], @errdesc [errdesc] for json path, without_array_wrapper)
		   return
end