USE [metod]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 06.04.2023 15:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [uniqueidentifier] NOT NULL,
	[dadd] [datetime] NOT NULL,
	[fio] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [nvarchar](20) NULL,
	[status] [char](1) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[dadd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delivery]    Script Date: 06.04.2023 15:50:45 ******/
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
/****** Object:  Table [dbo].[log_table]    Script Date: 06.04.2023 15:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log_table](
	[dadd] [datetime] NULL,
	[text_error] [nvarchar](max) NULL,
	[status] [nvarchar](3) NULL,
	[session] [smallint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 06.04.2023 15:50:45 ******/
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
/****** Object:  Table [dbo].[point]    Script Date: 06.04.2023 15:50:45 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 06.04.2023 15:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [uniqueidentifier] NULL,
	[login] [nvarchar](200) NULL,
	[password] [nvarchar](200) NULL,
	[role] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workshift]    Script Date: 06.04.2023 15:50:45 ******/
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
ALTER TABLE [dbo].[log_table] ADD  DEFAULT (@@spid) FOR [session]
GO
ALTER TABLE [dbo].[log_table]  WITH CHECK ADD  CONSTRAINT [CHK_log_table_session] CHECK  (([session]=@@spid))
GO
ALTER TABLE [dbo].[log_table] CHECK CONSTRAINT [CHK_log_table_session]
GO
