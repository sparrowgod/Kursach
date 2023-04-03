CREATE PROCEDURE addlogin1 @login_ char(15), @password1 char(15)
AS
exec sp_addlogin @login_,@password1, 'DB_Books'
exec sp_adduser @login_,@login_
GO