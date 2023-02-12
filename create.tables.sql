USE [metod]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 12.02.2023 15:23:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NULL,
	[fio] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [nvarchar](20) NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delivery]    Script Date: 12.02.2023 15:23:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delivery](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NULL,
	[fio] [nvarchar](200) NULL,
	[date_of_birth] [date] NULL,
	[phone] [nvarchar](20) NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 12.02.2023 15:23:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NULL,
	[name] [nvarchar](200) NULL,
	[id_point] [uniqueidentifier] NULL,
	[id_cust] [uniqueidentifier] NULL,
	[id_deliv] [uniqueidentifier] NULL,
	[coordinate_x] [int] NULL,
	[coordinate_y] [int] NULL,
	[status] [char](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 12.02.2023 15:23:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NULL,
	[name] [nvarchar](200) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [nvarchar](20) NULL,
	[coordinate_x] [int] NULL,
	[coordinate_y] [int] NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workshift]    Script Date: 12.02.2023 15:23:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workshift](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NULL,
	[id_deliv] [uniqueidentifier] NULL,
	[coordinate_x] [int] NULL,
	[coordinate_y] [int] NULL,
	[da_end] [datetime] NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
