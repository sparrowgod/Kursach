use metod

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[point.get] 
@js nvarchar(max),
@rp nvarchar(max) output
as
begin
       declare 
	    @err       nvarchar(100)
	   ,@errdesc   nvarchar(100)

	   ,@point_id uniqueidentifier	 =		json_value(@js, '$.id')
	   ,@point_phone   nvarchar(11)	 =		json_value(@js, '$.phone')
	   ,@point_address nvarchar(200) =		json_value(@js, '$.address')
	   ,@point_coorx	   int	     =		json_value(@js, '$.coordinate_x')
	   ,@point_coory	   int		 =		json_value(@js, '$.coordinate_y')
	   
	   --выводим
	   set @rp = (select * 
	              from [dbo].[point]
				  where ([id] = @point_id or [phone] = @point_phone or [address] = @point_address or (@point_coorx = [coordinate_x] and @point_coory = [coordinate_y])) and [status] = 'Y'
				  for json path, without_array_wrapper)


		    
	   ok: 
	       set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		   return
	   

	   err: 
	       set @rp = (select 'err' [status], lower(@err) [err], @errdesc [errdesc] for json path, without_array_wrapper)
		   return
end