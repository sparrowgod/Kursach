CREATE TABLE [dbo].[Table]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY, 
    [FIO] NCHAR(25) NULL, 
    [Dat_rog] DATE NULL, 
    [adres] NCHAR(25) NULL, 
    [telefon] NCHAR(10) NULL
)
