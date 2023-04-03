CREATE PROCEDURE grantlogin @text1 char(250)
AS
declare @SQLString nvarchar(250)
SET @SQLString = CAST( @text1 AS NVARCHAR(250) )
EXECUTE sp_executesql @SQLString
GO