USE [broker]
GO
/****** Object:  Table [dbo].[broker]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[broker](
	[id] [uniqueidentifier] NULL,
	[dadd] [datetime] NULL,
	[name] [nvarchar](30) NULL,
	[commission] [numeric](15, 2) NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[broker_client]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[broker_client](
	[id] [uniqueidentifier] NULL,
	[dadd] [datetime] NULL,
	[broker_id] [uniqueidentifier] NULL,
	[client_id] [uniqueidentifier] NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id] [uniqueidentifier] NULL,
	[dadd] [datetime] NULL,
	[fio] [nvarchar](200) NULL,
	[date_of_birthday] [date] NULL,
	[passport] [bigint] NULL,
	[balance] [numeric](15, 2) NULL,
	[sub_id] [uniqueidentifier] NULL,
	[d_close] [datetime] NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[id] [uniqueidentifier] NULL,
	[dadd] [datetime] NULL,
	[name] [nvarchar](30) NULL,
	[industry] [nvarchar](max) NULL,
	[status] [char](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exchange]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exchange](
	[id] [uniqueidentifier] NULL,
	[dadd] [datetime] NULL,
	[name] [nvarchar](30) NULL,
	[currency] [nvarchar](20) NULL,
	[address] [nvarchar](200) NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exchange_broker]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exchange_broker](
	[id] [uniqueidentifier] NULL,
	[dadd] [datetime] NULL,
	[exch_id] [uniqueidentifier] NULL,
	[broker_id] [uniqueidentifier] NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[log]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log](
	[dadd] [datetime] NULL,
	[text_error] [nvarchar](max) NULL,
	[status] [nvarchar](3) NULL,
	[session] [smallint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[port_company]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[port_company](
	[id] [uniqueidentifier] NULL,
	[dadd] [datetime] NULL,
	[port_id] [uniqueidentifier] NULL,
	[comp_id] [uniqueidentifier] NULL,
	[price_of_buy] [numeric](15, 2) NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[portfolio]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[portfolio](
	[id] [uniqueidentifier] NULL,
	[dadd] [datetime] NULL,
	[client_id] [uniqueidentifier] NULL,
	[name] [nvarchar](30) NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[id] [uniqueidentifier] NULL,
	[dadd] [datetime] NULL,
	[comp_id] [uniqueidentifier] NULL,
	[price] [numeric](15, 2) NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sub_data]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sub_data](
	[id] [uniqueidentifier] NULL,
	[dadd] [datetime] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[auto_sub] [char](1) NULL,
	[status] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp](
	[date] [date] NULL,
	[price] [numeric](30, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transaction]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[id] [uniqueidentifier] NULL,
	[dadd] [datetime] NULL,
	[client_id] [uniqueidentifier] NULL,
	[type] [nvarchar](20) NULL,
	[sum] [numeric](15, 2) NULL,
	[status] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 23.05.2023 22:35:10 ******/
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
INSERT [dbo].[broker] ([id], [dadd], [name], [commission], [status]) VALUES (N'3daf2780-308e-4478-88ae-5be1f0f1d033', CAST(N'2023-05-13T17:39:23.307' AS DateTime), N'testbroker', CAST(1.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[broker] ([id], [dadd], [name], [commission], [status]) VALUES (N'33629132-c4a7-4d7c-ab49-256ebda5da6f', CAST(N'2023-05-14T12:05:14.103' AS DateTime), N'newtest', CAST(2.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[broker_client] ([id], [dadd], [broker_id], [client_id], [status]) VALUES (N'9259b4a7-f6ba-4ca7-b6d6-7bcd6be2cecb', CAST(N'2023-05-14T12:56:39.133' AS DateTime), N'3daf2780-308e-4478-88ae-5be1f0f1d033', N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'Y')
GO
INSERT [dbo].[client] ([id], [dadd], [fio], [date_of_birthday], [passport], [balance], [sub_id], [d_close], [status]) VALUES (N'd8f53927-cbba-4883-9379-fa0dab180e8c', CAST(N'2023-05-14T12:46:29.843' AS DateTime), N'????????', CAST(N'2002-02-19' AS Date), 1234567890, CAST(951.00 AS Numeric(15, 2)), N'd6d353e4-1ad9-46d4-9179-93cd70da5a94', NULL, N'Y')
GO
INSERT [dbo].[company] ([id], [dadd], [name], [industry], [status]) VALUES (N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(N'2023-05-14T18:32:39.070' AS DateTime), N'broker', N'["trade", "finance"]', N'Y')
GO
INSERT [dbo].[log] ([dadd], [text_error], [status], [session]) VALUES (CAST(N'2023-05-13T17:39:27.950' AS DateTime), N' id: 3DAF2780-308E-4478-88AE-5BE1F0F1D033,
 ???????? ???????: testbroker,
 ?????????: 1', N'ok', 54)
GO
INSERT [dbo].[log] ([dadd], [text_error], [status], [session]) VALUES (CAST(N'2023-05-14T12:05:15.793' AS DateTime), N' id: 33629132-C4A7-4D7C-AB49-256EBDA5DA6F,
 ???????? ???????: newtest,
 ?????????: 2', N'ok', 70)
GO
INSERT [dbo].[log] ([dadd], [text_error], [status], [session]) VALUES (CAST(N'2023-05-14T12:46:32.760' AS DateTime), N' id: D8F53927-CBBA-4883-9379-FA0DAB180E8C,
 ???: ????????,
 ???? ????????: , 
 ???????: 1234567890, 
 id ????????: 39228757-8A5D-4213-B50F-6622917ED68A', N'ok', 70)
GO
INSERT [dbo].[log] ([dadd], [text_error], [status], [session]) VALUES (CAST(N'2023-05-14T12:56:40.803' AS DateTime), N' id ?????: 9259B4A7-F6BA-4CA7-B6D6-7BCD6BE2CECB, 
 id ???????: D8F53927-CBBA-4883-9379-FA0DAB180E8C, 
 id ???????: D8F53927-CBBA-4883-9379-FA0DAB180E8C', N'ok', 69)
GO
INSERT [dbo].[log] ([dadd], [text_error], [status], [session]) VALUES (CAST(N'2023-05-14T19:27:48.397' AS DateTime), N' id ????????: 39228757-8A5D-4213-B50F-6622917ED68A, 
 id ????????: 06B28120-A8BD-4E7A-870A-3915FD5D72C3, 
 ???? ?????: 50, 
 ?????????? ????????? ?????: , 
 ?????? ???????: ', N'ok', 86)
GO
INSERT [dbo].[log] ([dadd], [text_error], [status], [session]) VALUES (CAST(N'2023-05-14T19:29:38.683' AS DateTime), N' id ????????: 39228757-8A5D-4213-B50F-6622917ED68A, 
 id ????????: 06B28120-A8BD-4E7A-870A-3915FD5D72C3, 
 ???? ?????: 50, 
 ?????????? ????????? ?????: 4, 
 ?????? ???????: 1701', N'ok', 70)
GO
INSERT [dbo].[log] ([dadd], [text_error], [status], [session]) VALUES (CAST(N'2023-05-14T19:29:40.837' AS DateTime), N' id ????????: 39228757-8A5D-4213-B50F-6622917ED68A, 
 id ????????: 06B28120-A8BD-4E7A-870A-3915FD5D72C3, 
 ???? ?????: 50, 
 ?????????? ????????? ?????: 4, 
 ?????? ???????: 1501', N'ok', 70)
GO
INSERT [dbo].[log] ([dadd], [text_error], [status], [session]) VALUES (CAST(N'2023-05-14T19:30:34.443' AS DateTime), N' id ????????: 39228757-8A5D-4213-B50F-6622917ED68A, 
 id ????????: 06B28120-A8BD-4E7A-870A-3915FD5D72C3, 
 ???? ?????: 50, 
 ?????????? ????????? ?????: 3, 
 ?????? ???????: 1301', N'ok', 76)
GO
INSERT [dbo].[log] ([dadd], [text_error], [status], [session]) VALUES (CAST(N'2023-05-14T19:30:59.010' AS DateTime), N' id ????????: 39228757-8A5D-4213-B50F-6622917ED68A, 
 id ????????: 06B28120-A8BD-4E7A-870A-3915FD5D72C3, 
 ???? ?????: 50, 
 ?????????? ????????? ?????: 3, 
 ?????? ???????: 1151', N'ok', 76)
GO
INSERT [dbo].[log] ([dadd], [text_error], [status], [session]) VALUES (CAST(N'2023-05-14T20:21:30.110' AS DateTime), N' id ????????: 39228757-8A5D-4213-B50F-6622917ED68A, 
 id ????????: 06B28120-A8BD-4E7A-870A-3915FD5D72C3, 
 ???? ?????: 50, 
 ?????????? ????????? ?????: 3, 
 ?????? ???????: 1001', N'ok', 85)
GO
INSERT [dbo].[log] ([dadd], [text_error], [status], [session]) VALUES (CAST(N'2023-05-15T10:06:02.427' AS DateTime), N' ???????: 50', N'ok', 72)
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'5948cdac-8a3b-4f41-9b4e-0af825cd2a65', CAST(N'2023-05-14T19:01:23.347' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'N')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'a75c66ab-acae-400f-9825-d0d69abddda4', CAST(N'2023-05-14T19:01:23.347' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'c2638c7b-a149-43c0-8595-4b9a01041d8c', CAST(N'2023-05-14T19:01:23.347' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'eb0ae802-df79-4246-aa6a-a4f1de5f84bd', CAST(N'2023-05-14T19:01:23.347' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'78b193ed-2baa-42ef-bf13-953e5f3efe0c', CAST(N'2023-05-14T19:01:23.347' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'00b07d2c-ec66-49e5-a66d-109bd3d8dc65', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'1bec2288-09cf-4479-bce2-887109f79910', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'4ec5d4b6-4f4f-4089-8d3d-35bc124458b9', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'b2449c68-496d-4873-b8dc-af0a54cf598c', CAST(N'2023-05-14T19:14:13.123' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'06843a06-778e-489c-b438-7c24d0f678cc', CAST(N'2023-05-14T19:14:13.123' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'd6699db9-c6d8-41a5-907b-a39b11dd87b2', CAST(N'2023-05-14T19:27:34.077' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'a3206cba-e824-46ba-9b12-912151a7f580', CAST(N'2023-05-14T19:27:34.077' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'e5a41db7-270c-4149-8449-d526f6e696cf', CAST(N'2023-05-14T19:27:34.077' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'390f0885-86b7-4ef4-9a68-d5b5c07f13c8', CAST(N'2023-05-14T19:29:34.790' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'04d295d7-f585-4ce4-91da-f1dc1d42a87e', CAST(N'2023-05-14T19:29:34.793' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'06aed021-6856-464e-b16a-d683f9e65631', CAST(N'2023-05-14T19:29:34.793' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'158cfcf0-37ac-4aa8-912e-77672b772914', CAST(N'2023-05-14T19:29:34.793' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'5607553d-0a9c-43a8-ac82-a01b737df9e3', CAST(N'2023-05-14T19:29:39.253' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'a387f140-cd33-40a7-be8a-42762ecdb9e3', CAST(N'2023-05-14T19:29:39.253' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'89e1705b-6652-485b-870a-e78311188fac', CAST(N'2023-05-14T19:29:39.253' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'bff2eb6a-960d-429f-a387-70194c1d64f9', CAST(N'2023-05-14T19:29:39.257' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'48c84728-67ad-487b-9119-ea6cd6d11dff', CAST(N'2023-05-14T19:30:26.273' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'47e946a4-a6e0-45ca-bc93-b9ec7410fba4', CAST(N'2023-05-14T19:30:26.273' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'2af722a0-d634-4aec-bf8f-9ccbd615a514', CAST(N'2023-05-14T19:30:26.273' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'9f7f64b1-5af9-4db3-8a19-04ce7254563f', CAST(N'2023-05-14T19:30:35.623' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'3fdb19ee-be8e-41d1-81d4-68c0c0ce2d90', CAST(N'2023-05-14T19:30:35.623' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'2a33ff86-494e-4da6-ac6d-f05f1841f0f4', CAST(N'2023-05-14T19:30:35.627' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'6d0dd9cb-56c7-480a-966b-feed0d12dcf7', CAST(N'2023-05-14T20:21:19.303' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'4e62e411-bf24-41e6-94e6-a2c8684944e5', CAST(N'2023-05-14T20:21:19.303' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'08886f74-ef88-46b6-ae22-c1e66067a25c', CAST(N'2023-05-14T20:21:19.303' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'65de3e73-662f-42f4-ad90-d5216a5b53e5', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'38529a70-482f-4836-9606-27b48dddc784', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'12f2c635-b28d-402e-ac91-a16dd4c78845', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'29e9d5c6-d7bc-4297-a8df-c17ad6934777', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'7055b4f5-8f8e-4696-959c-4ac58b647393', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'8d1fffb4-f81a-4bb9-8d46-0a9876f9eb21', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'389c6efb-b4c9-4805-b48b-4460baac6d3b', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'f0da74b4-a883-4731-99aa-ace4ba54172c', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'eab9a881-93fe-47ba-869c-8458912b5775', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'1384d8ee-0c62-4a1c-b1b4-fa8b597697db', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'd8628660-8ed9-46fa-a45a-bc0976a00a3e', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'876148f5-6e3c-4e8a-afca-4da912eee58b', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'caa5d730-135b-445c-a259-02fdd5674b7a', CAST(N'2023-05-14T19:07:31.630' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'9c043b9b-42a9-4593-bca7-a1255e778f08', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'bb49d604-6dcd-4dfa-8855-91a1708d47b6', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'cc9a77f6-42ee-45db-bbe3-ee691e98f0b9', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'82e6fb22-9f47-4038-9704-3306de3ae3d5', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'b7d390e3-2fdf-49c6-9ab0-541a848bfbf8', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'0a76f536-d8dc-4a18-8136-f920e1fd05dc', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'2d866b11-9448-43d5-9714-d871bfb105fc', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'7b4e651d-1107-4b37-91cf-b117c5a7fc25', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'2a817fdf-2973-43c7-bc16-4f216f44d81d', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'c80f415e-d916-442b-bf20-db8f20ced3b4', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'6fd6fbbc-827f-4ad7-bb75-746a001695ae', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'04796a83-f7b2-4446-823f-2467a950e4c4', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'32c5932b-0488-4306-85c7-9debf3160e21', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'9cd205af-13f3-4093-ab07-ea62d2da1b5a', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'1a6b928c-f10a-4b79-9d70-398f2d6b0c33', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'70cb385b-514a-478f-8960-088f34e0bd69', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'316100d1-3c3f-4ad8-a78a-0d1044746f3d', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'17924e6a-d310-4022-87a7-6e4ad2f1a825', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'd399791e-4f59-4364-904d-b74c7628fee5', CAST(N'2023-05-14T19:07:31.633' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'1f224bc0-5034-46da-9c49-c4ac68db2599', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'7818520e-648c-49ba-9b9c-aa3f45776c62', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'f9ba8d21-ca91-4ff1-a4c7-57974379e2d4', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'0013feec-e509-48c0-992d-bf0897d3b250', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'648e096b-f5fa-472a-ad0e-73b9a1547b45', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'50ed1479-bc3c-4ede-8ea4-6dd95bb0c7a8', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'dfc82d3e-e625-4d22-b844-b1aa19b6f011', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'a4003c81-e476-4fd2-b7c7-9fab5459fdd4', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'f6a4de2b-e2f8-40b2-aa65-0918419e483f', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'ec90f1e2-717c-4341-8ec3-703ebd0669bc', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'94f774d2-68a1-4da5-8766-bbd6b8e1485f', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'2dec8a9f-2a3a-4241-a0a3-fbd7c7f3de91', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'299c96d5-9dd5-4f0c-a666-d48ac70386ab', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'fe91f5b0-5161-4a0f-987b-009e9287fffa', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'7e7f0798-e56d-4296-89fa-00edbe3cafea', CAST(N'2023-05-14T19:07:31.637' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'N')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'782d21ae-22cf-41f2-aab6-7f0d860e6da1', CAST(N'2023-05-14T19:13:47.287' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'4f0bb93f-3cae-4bc9-820a-fcc29a2da653', CAST(N'2023-05-14T19:13:47.287' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'2f7269ad-536c-4eae-969e-ab4b59c4da34', CAST(N'2023-05-14T19:13:47.287' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'0f73cb0c-c41e-4620-8976-3f56fb7db759', CAST(N'2023-05-14T19:13:47.287' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'4ac10b14-0fdd-4dc6-a96b-b0066b5a4955', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'0aaec704-5819-4ff6-a101-c3603a4049b8', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'191dcd5f-4795-4859-b963-4b71a15262b5', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'b5cc5875-f27b-44f3-80fc-045f3fbfd8f3', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'922fa9d1-16f5-472f-9d79-35cd754fb071', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'4a144e01-9ac9-42cd-8fd7-73efbdd01636', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'579081c6-01e3-4077-802a-6e7f41e5a29c', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'e1e3217e-db1a-4a7a-9529-91cb8600b968', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'3867fc89-48eb-4f98-80fe-6b45197e7519', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'3f0a4a82-38ad-4a37-84a8-874e7aab5959', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'41db8bb5-e3a0-4238-b4bc-ad70de0cc376', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'81bfaaa8-c8ff-43b1-b846-02a087211441', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'24556166-0472-4d6d-916d-46a100d62968', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'1284eeb1-2e3d-47ae-abc1-772c02e2edfe', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'040b3df7-ec5b-4c2c-9b25-6bd410aa9c64', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'e920cffb-a40a-4083-bbf3-9c063b3e95dc', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'3d81041e-3ede-4284-8919-2a3a1f74b0a7', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'aee4e28e-4d9c-4271-8b63-3a245c1444ff', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'12148f77-be4f-4a0e-b818-5cf9c6e4e8d0', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'c592c092-02a7-4673-a2f9-feb5962bdcb0', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'159bd5d5-59c0-47a3-9a3f-186e6fa5d619', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'ac1261fb-844a-49ac-b36b-f94e8eb00784', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'7ef70353-da23-4c96-8ce9-87112e2714db', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'c843c998-cbaa-48e6-b435-a8a28b5ec755', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'8228fe21-e7e1-41c0-8c91-c9c53c0c5923', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'd825ec66-ec61-450c-9596-2c3f7683c39c', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'be76b209-4798-42fe-9337-c900f37eaf2b', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'5e3c83d1-6264-45e4-a08b-d6759bc37a88', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'85f47d8c-91d0-4a66-9fb7-ef049ca23a1d', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'de829293-c9fc-4c0a-ab00-abb74e161105', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'c7dbb49e-11ae-4682-be34-7862c54fb540', CAST(N'2023-05-14T19:13:47.290' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'a7ff729b-07a6-4191-91d8-ab7772ef25ac', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'eeeccf5d-526a-4e70-b840-5a0d056c4549', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'0b39a484-f6a6-49f7-a215-6d01a253874c', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'0cff73aa-23b5-4dab-b372-67ea68677b32', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'9fcbaea7-93f1-4b32-8af4-fed7da17aec6', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'8669f92c-7ec2-435e-b4d6-c113a398d005', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'084ab60b-c107-4423-a51a-1f249dacdc92', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'1c5092cb-a828-4b57-b36f-588d39c141a4', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'05233f82-1b08-4f20-aee3-6c795776d5cd', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'f1610464-b4d0-43d5-a745-74e7ea78aafd', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'd37fea7c-acf0-44fb-8128-5d3268a41721', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'a620c422-b9b6-45b0-96bb-8e9bed4715e8', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'f741521e-dcc4-4527-af86-0c91c8c994cb', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'709b0a7b-58d1-4f85-83d4-cb0bda2028bb', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'd515fd01-2532-4eb0-9300-41101e003eaa', CAST(N'2023-05-14T19:13:47.293' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'd1bb42cd-7d6e-4923-af55-719b2f199562', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'ee94683a-4cbb-410b-bcb0-0ce552efac5d', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'35e439bc-67a5-4160-bb07-f612f9739ff3', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'edf1b9c1-688e-472b-9fc2-a0eb46d74a0b', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'9c704f7f-bf2f-45bc-9348-82a01c16269e', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'f1c1e2d9-c951-420c-b409-283b43f08d58', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'6177ab7b-cc4e-4e9b-9fe7-a52dff2b890a', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'b7a54fb1-dd56-42d0-ae4c-6bd5e69b78a0', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'c8c50667-f8df-4445-bce4-453b0283dbe3', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'2d107741-6b39-4ebf-b7e0-daa06295c1ae', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'55124522-fb65-4a50-ae70-d0d3b0b30f04', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'c8946db8-43e2-489e-bb90-5b8c27ec730e', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'd3792af2-f611-4a75-bad6-43af9d0b1bad', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'ee98c060-88c5-4804-ab52-f2bac9769d07', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'c62f7433-6b8d-400d-ac2c-05dd427a39ca', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'a4ec50e6-95d8-47e5-a719-c0dea1aedea6', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'921f3617-42b5-40f1-95ae-680ed81bd909', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'f3b4f53d-ede5-4d4f-9996-5516b4e38347', CAST(N'2023-05-14T19:28:12.080' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'850a9555-d38f-466c-8786-9a3503faa99b', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'65837809-639c-466b-90c3-4c42628aaecd', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'74f02c13-f207-4cba-b9d1-5075846a9b4d', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'30512c71-71c9-47cd-a745-90b2f4f44179', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'6ccaa09c-cffb-4ef5-90f5-946869819f1d', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'7dd6f29a-4b8c-48ce-b4b2-79143dbdad1a', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'3d00b526-ed67-4a19-905a-f31beeb02c60', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'7bbe00fe-0f38-4810-95e7-deed4b546f9f', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'96d9193f-3565-4f29-a538-a23ee929169e', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'53917939-de88-4e1e-9cd4-b8252841a1e9', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'16a3d024-5cef-4e9e-aba1-5d7b19ed8029', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'b9f4e226-26fd-46c1-9ce4-d3ecbed6bb7d', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'0795d4a9-e1bf-4f26-9cd6-0db00a2dbd14', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'9316fa62-1689-4800-9f41-0ed3a3f5d2c0', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'a1afa2e6-84e4-4ced-a10e-2ff60374cf1b', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'e5f010bd-75db-4507-b497-0dbe4c95424a', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'6c1f8b71-f7fe-40fd-ad1b-7868299bc586', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'fc97ed78-7a63-41eb-bf6a-a30743c3148d', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'65cb0971-d07b-47d5-873d-56dd3bb0033c', CAST(N'2023-05-14T19:28:12.083' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'686b4ee2-d00d-41a2-b678-a5af816664fb', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'444ef3bd-98e4-45e6-9cf8-f4c690787459', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'657de384-8943-431c-af69-f65e209c1ae2', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'1d7a192a-91d5-4661-91d8-e7f7594e1c7e', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'8014d787-58cc-4913-9bd5-08e15c8c71e8', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'f36dcbe0-f491-4a45-80e3-237546eec074', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'8f13718b-64c3-47fc-bf28-194e710131e7', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'bc90db99-70b5-4605-8a85-83e4fb40d228', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'66009d77-53f4-4686-88f4-ec15437abfa6', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'af2d530c-ab76-408b-813f-1c023a798898', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'73f5ffeb-723e-44d2-80af-2eba24abe3b7', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'cc4cbe29-3099-4529-bcea-31a3b4f264b6', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[port_company] ([id], [dadd], [port_id], [comp_id], [price_of_buy], [status]) VALUES (N'26f5cd02-f940-4934-b6ae-b581c407396e', CAST(N'2023-05-14T19:28:12.087' AS DateTime), N'39228757-8a5d-4213-b50f-6622917ed68a', N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[portfolio] ([id], [dadd], [client_id], [name], [status]) VALUES (N'39228757-8a5d-4213-b50f-6622917ed68a', CAST(N'2023-05-14T12:46:29.857' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'name', N'Y')
GO
INSERT [dbo].[stock] ([id], [dadd], [comp_id], [price], [status]) VALUES (N'1feeb501-b1d4-4f7a-9660-2562e9974ab7', CAST(N'2023-05-14T18:55:36.320' AS DateTime), N'06b28120-a8bd-4e7a-870a-3915fd5d72c3', CAST(50.00 AS Numeric(15, 2)), N'Y')
GO
INSERT [dbo].[sub_data] ([id], [dadd], [start_date], [end_date], [auto_sub], [status]) VALUES (N'd6d353e4-1ad9-46d4-9179-93cd70da5a94', CAST(N'2023-05-14T15:24:15.233' AS DateTime), CAST(N'2023-05-14' AS Date), CAST(N'2023-06-14' AS Date), N'N', N'Y')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'b0edd80b-2cb2-47cf-9c01-2a66212db801', CAST(N'2023-05-14T15:24:15.230' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'subscribe', CAST(299.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'a0ad9cb5-bf8d-4e10-a894-8427327959bd', CAST(N'2023-05-14T19:01:23.340' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'buy_stock', CAST(250.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'9feb7eb7-9f55-4b9a-9d22-eebcc44960e7', CAST(N'2023-05-14T19:07:31.623' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'buy_stock', CAST(2500.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'c543af02-5d85-41a4-9d1b-c2f2a8c93965', CAST(N'2023-05-14T19:13:47.270' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'buy_stock', CAST(2500.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'46be71d0-b77f-4d57-a0c6-30af7b0d83b5', CAST(N'2023-05-14T19:14:13.107' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'buy_stock', CAST(100.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'34a985bd-d547-45fe-83d7-0551faeb5857', CAST(N'2023-05-14T19:28:12.063' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'buy_stock', CAST(2500.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'90772a3f-f1a8-4bdd-b538-2c97af27442f', CAST(N'2023-05-14T19:30:26.210' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'buy_stock', CAST(150.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'7d3e8238-64b1-43af-aa1d-a1c6a61b55a4', CAST(N'2023-05-14T19:30:35.580' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'buy_stock', CAST(150.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'16a0be60-004e-4d7e-a171-162934acd2be', CAST(N'2023-05-14T20:21:19.290' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'buy_stock', CAST(150.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'33bda085-79b0-4f75-bdd9-6c1ca633eb5e', CAST(N'2023-05-14T19:27:34.060' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'buy_stock', CAST(150.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'9013a78c-cae5-43ca-859e-85567c968b1d', CAST(N'2023-05-14T19:29:34.787' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'buy_stock', CAST(200.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'14a286ee-d0ef-4d62-bc78-1fa2e481c775', CAST(N'2023-05-14T19:29:39.243' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'buy_stock', CAST(200.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'7f13565e-8ef3-4ba8-992a-e087ccf4bf90', CAST(N'2023-05-15T10:06:00.723' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'sell_stock', CAST(50.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[transaction] ([id], [dadd], [client_id], [type], [sum], [status]) VALUES (N'6d46d4fb-1987-4de0-ab6b-00c56dbd6c3e', CAST(N'2023-05-15T10:02:51.173' AS DateTime), N'd8f53927-cbba-4883-9379-fa0dab180e8c', N'sell_stock', CAST(50.00 AS Numeric(15, 2)), N'success   ')
GO
INSERT [dbo].[users] ([id], [login], [password], [role]) VALUES (N'5049aa80-e1bf-410a-9e84-ff8cb6ae027b', N'user', N'123', N'broker')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nc-name]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-name] ON [dbo].[broker]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ncUniq-id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ncUniq-id] ON [dbo].[broker]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nc-br_clnt_id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-br_clnt_id] ON [dbo].[broker_client]
(
	[broker_id] ASC,
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nc-br_id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-br_id] ON [dbo].[broker_client]
(
	[broker_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ncUniq-id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ncUniq-id] ON [dbo].[broker_client]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nc-pssprt]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-pssprt] ON [dbo].[client]
(
	[passport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nc-sub_id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-sub_id] ON [dbo].[client]
(
	[sub_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ncUniq-id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ncUniq-id] ON [dbo].[client]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nc-name]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-name] ON [dbo].[company]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ncUniq-id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ncUniq-id] ON [dbo].[company]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nc-adrs]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-adrs] ON [dbo].[exchange]
(
	[address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [nc-name]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-name] ON [dbo].[exchange]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ncUniq-id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ncUniq-id] ON [dbo].[exchange]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nc-br_id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-br_id] ON [dbo].[exchange_broker]
(
	[broker_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nc-exch_br_id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-exch_br_id] ON [dbo].[exchange_broker]
(
	[exch_id] ASC,
	[broker_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nc-exch_id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-exch_id] ON [dbo].[exchange_broker]
(
	[exch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ncUniq-id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ncUniq-id] ON [dbo].[exchange_broker]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nc-comp_id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-comp_id] ON [dbo].[port_company]
(
	[comp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nc-port_id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-port_id] ON [dbo].[port_company]
(
	[port_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ncUniq-id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ncUniq-id] ON [dbo].[port_company]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nc-clnt_id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-clnt_id] ON [dbo].[portfolio]
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ncUniq-id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ncUniq-id] ON [dbo].[portfolio]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nc-comp_id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE NONCLUSTERED INDEX [nc-comp_id] ON [dbo].[stock]
(
	[comp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ncUniq-id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ncUniq-id] ON [dbo].[stock]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ncUniq-id]    Script Date: 23.05.2023 22:35:10 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ncUniq-id] ON [dbo].[sub_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[client.transaction]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[client.transaction]
	@js nvarchar(max),
	@rp nvarchar(max) output 
as
begin
	begin try
		declare 
		 @err       nvarchar(100)
		,@errdesc   nvarchar(100)

		,@client_id uniqueidentifier = json_value(@js, '$.id')
		,@type      nvarchar(20)     = json_value(@js, '$.type')
	    ,@sum       numeric(15, 2)   = json_value(@js, '$.sum')
		,@tr_id     uniqueidentifier = json_value(@js, '$.tr_id')
		,@balance   numeric(15, 2)  
		,@change    int

				create table #balace(
										[balance] numeric(15,2) NOT NULL,
									) 

		begin tran
			set tran isolation level serializable
			insert into #balace
				select [balance] from [dbo].[client] with (updlock) where [id] = @client_id

			if (@type in ('refill', 'sell_stock'))
				begin
					update [dbo].[client] 
					   set [balance] = [balance] + @sum
						  ,@balance  = [balance] + @sum
					where [id] = @client_id
				end
			
			if (@type in ('buy_stock', 'subscribe', 'withdrawal'))
				begin
					update [dbo].[client] 
					   set [balance] = iif([balance] >= @sum, [balance] - @sum, [balance])
						  ,@balance  = iif([balance] >= @sum, [balance] - @sum, [balance])
						  ,@change   = iif([balance] >= @sum, 1, 0)
					where [id] = @client_id

					if (@change = 0)
						begin
							set @err = 'err.client_transaction.not_enough_money'
							set @errdesc = 'Недостаточно средств на балансе' 

							goto err
						end
				end

			set tran isolation level read committed

			commit tran

			set @rp = (select @client_id [id], @balance [balance], @sum [sum], @type [type] 
					   for json path, without_array_wrapper)

			goto ok			 	  
	end try

	begin catch
		set @err = 'err.client_transaction.transaction_failed'
		set @errdesc = 'Не удалось произвести транзакцию'

		if (@@trancount > 0)
			rollback tran

		goto err	
	end catch


	err: 
	       set @rp = (select 'err' [status], lower(@err) [err], @errdesc [errdesc] for json path, without_array_wrapper)
		 
		   if (@@trancount > 0)
				rollback tran

		   update [transaction] 
			  set [status] = 'error'
		   where [id] = @tr_id

		   return
	  

	ok: 
	       set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		   		  
		   update [transaction] 
			  set [status] = 'success'
		   where [id] = @tr_id
		  
		   return
end	
GO
/****** Object:  StoredProcedure [dbo].[ExchangeMessageGet]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ExchangeMessageGet] as
begin
	declare @h uniqueidentifier, @msg varchar(max)

	while (1 = 1)
		begin
			begin tran
				begin try
					waitfor (receive top (1) @h = [conversation_handle], @msg = cast([message_body] as varchar)
						from [ExchangeQueue]),
					timeout 1000

					if (@@rowcount = 0)
						begin						
							rollback tran
							break
						end 
				
					insert into [dbo].[ExchangeMessage] 
					values (
							newid(),
							getdate(),
							@msg
						   )
					end conversation @h
				end try

				begin catch
					rollback tran
					break
				end catch
			commit tran
		end
end	

GO
/****** Object:  StoredProcedure [dbo].[ms_api]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ms_api]
	@action varchar(50),
	@js varchar(max),
	@rp varchar(max) out
as
begin
	set nocount on

	begin try
		declare 
		 @err        nvarchar(100)
	    ,@errdesc    nvarchar(100)
		,@sba        nvarchar(50) = substring(@action, 1, charindex('.', @action) - 1)

		,@rp_        nvarchar(max)
		,@js_        nvarchar(max)

		set dateformat dmy

		--биржа
		if (@sba in ('exchange'))
			begin
				declare
				 @exch_id     uniqueidentifier = json_value(@js, '$.id')
				,@exch_name   nvarchar(30)     = json_value(@js, '$.name')
				,@currency    nvarchar(20)     = json_value(@js, '$.currency')
				,@address     nvarchar(200)    = json_value(@js, '$.address')
				,@exch_status char(1)

				--получение данных биржи
				if (@action in ('exchange.get'))
					begin
						set @rp = (select * 
							from [dbo].[exchange] with (nolock)
						where ([id] = @exch_id or [address] = @address or [name] = @exch_name) and [status] = 'Y'
						for json path, without_array_wrapper)

						goto ok
					end

				--создание биржи
				if (@action in ('exchange.create'))
					begin
						--проверка обязательных параметров на null
						if (  @exch_name is null
						   or @currency  is null
						   or @address   is null )
							begin
								set @err = 'err.exchange_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end

						--проверка названия и адреса на уникальность
						set @rp_ = null
						set @js_ = (select @address [address], @exch_name [name] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'exchange.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.exchange_create.not_unique_name_or_address'
								set @errdesc = 'Биржа с таким названием или адрессом уже существует'

								goto err							
							end
						
						--добавляем значения в таблицу
						set @exch_id = newid()

						insert into [dbo].[exchange]
						values (
								@exch_id,
								getdate(),
								@exch_name,
								@currency,
								@address,
								'Y'
							   )

						--выводим
						set @rp = (select @exch_id   [id]
										 ,@exch_name [name]
										 ,@currency  [currency]
										 ,@address   [address]
								   for json path, without_array_wrapper)

						goto ok
					end

				--редактирование биржи
				if (@action in ('exchange.edit'))
					begin
						--проверка обязательных параметров на null
						if (   @exch_id is null
						   or (@address is null and @currency is null)  )
							begin
								set @err = 'err.exchange_edit.unset_field'
								set @errdesc = 'Не передан обязательный параметр'

								goto err
							end

						--проверка на существование биржи 
						set @rp_ = null
						set @js_ = (select @exch_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'exchange.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.exchange_edit.exchange_not_found'
								set @errdesc = 'Биржа не найдена'

								goto err
							end
						
						--проверка на уникальность адреса
						if (@address is not null)
							begin
								set @rp_ = null
								set @js_ = (select @address [address] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'exchange.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.exchange_edit.not_unique_address'
										set @errdesc = 'Такой адрес уже существует'

										goto err
									end
							end
						
						--обновляем
						update [dbo].[exchange]
						   set [currency] = isnull(@currency, [currency])
							  ,[address]  = isnull(@address, [address])
						where [id] = @exch_id

						--выводим
						set @rp = (select * 
										from [dbo].[exchange]
								   where [id] = @exch_id
								   for json path, without_array_wrapper)

						goto ok
					end
								
				--активация биржи
				if (@action in ('exchange.active'))
					begin
						--проверка id на null 
						if (@exch_id is null)
							begin
								set @err = 'err.exchange_active.exchange_not_found'
								set @errdesc = 'Биржа не найдена'
								
								goto err
							end
                        																		
						select @exch_name   = [name]
							  ,@address     = [address]
						      ,@exch_status = [status]
							from [dbo].[exchange] with (nolock)
						where [id] = @exch_id
						
						--проверка на существование биржи 
						if (isnull(@exch_status, 'Y') = 'Y')
							begin
								set @err = 'err.exchange_active.exchange_not_found'
								set @errdesc = 'Биржа не найдена'

								goto err
							end
						
						--проверка на уже существующее название и адрес биржи
						set @rp_ = null
						set @js_ = (select @exch_name [name], @address [address] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'exchange.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.exchange_active.not_unique_name_or_address'
								set @errdesc = 'Биржа с таким названием или адресом уже существует'

								goto err
							end
																								
						--меняем статус биржи
						update [dbo].[exchange]
						   set [status] = 'Y'
						where [id] = @exch_id
												
						--выводим
						set @rp = (select @exch_id    [id]
										 ,'Y'		  [status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end

			    --деактивация биржи
				if (@action in ('exchange.deactive'))
					begin
						--проверка id на null
						if (@exch_id is null)
							begin
								set @err = 'err.exchange_deactive.exchange_not_found'
								set @errdesc = 'Биржа не найдена'

								goto err
							end

						--проверка на существование биржи 
						set @rp_ = null
						set @js_ = (select @exch_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'exchange.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.exchange_deactive.exchange_not_found'
								set @errdesc = 'Биржа не найдена'

								goto err
							end
						
						--проверка на то что у брокеров биржи нет клиентов 
						if exists (select top 1 1 
									from [dbo].[broker_client] bc with (nolock)
									join [dbo].[exchange_broker] eb with (nolock) on bc.[broker_id] = eb.[broker_id]  
								   where [exch_id] = @exch_id and bc.[status] = 'Y' and eb.[status] = 'Y')
							begin
								set @err = 'err.exchange_deactive.broker_has_clients'
								set @errdesc = 'У брокера биржи есть клиенты'

								goto err
							end
						
						begin tran
							--меняем статус бирже
							update [dbo].[exchange]
							   set [status] = 'N'
							where [id] = @exch_id

							--меняем статус связи биржа/брокер
							update [dbo].[exchange_broker]
							   set [status] = 'N'
							where [exch_id] = @exch_id and [status] = 'Y'
						commit tran

						--выводим
						set @rp = (select @exch_id  [id]
										 ,'N'		[status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end				
			end


		--биржа - брокер
		if (@sba in ('exchange_broker'))
			begin
				declare 
				 @exch_broker_id  uniqueidentifier = json_value(@js, '$.id')
				,@exch_id_br      uniqueidentifier = json_value(@js, '$.exch_id')
				,@broker_id_exch  uniqueidentifier = json_value(@js, '$.broker_id')

				--получение данных связи биржа - брокер
				if (@action in ('exchange_broker.get'))
					begin
						set @rp = (select * 
										from [dbo].[exchange_broker] with (nolock)
								   where ([id] = @exch_broker_id or ([exch_id] = @exch_id_br and [broker_id] = @broker_id_exch)) and [status] = 'Y'
								   for json path, without_array_wrapper)

						goto ok
					end

				--создание связи биржа - брокер
				if (@action in ('exchange_broker.create'))
					begin
						--проверка обязательных параметров на null
						if (  @exch_id_br      is null
						   or @broker_id_exch  is null )
							begin
								set @err = 'err.exchange_broker_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end

						--проверка на существование биржи
						set @rp_ = null
						set @js_ = (select @exch_id_br [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'exchange.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin					
								set @err = 'err.exchange_broker_create.exchange_not_found'
								set @errdesc = 'Биржа не найдена'

								goto err							
							end
						
						--проверка на существование брокера
						set @rp_ = null
						set @js_ = (select @broker_id_exch [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin					
								set @err = 'err.exchange_broker_create.broker_not_found'
								set @errdesc = 'Брокер не найден'

								goto err							
							end
						
						--проверка на уже существующую связь 
						set @rp_ = null
						set @js_ = (select @broker_id_exch [broker_id], @exch_id_br [exch_id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'exchange_broker.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.exchange_broker_create.already_exists'
								set @errdesc = 'Связь уже существует'

								goto err							
							end

						--добавляем значения в таблицу
						set @exch_broker_id = newid()

						insert into [dbo].[exchange_broker]
						values (
								@exch_broker_id,
								getdate(),
								@exch_id_br,
								@broker_id_exch,
								'Y'
							   )

						--выводим
						set @rp = (select @exch_broker_id   [id]
										 ,@exch_id_br       [exch_id]
										 ,@broker_id_exch   [broker_id]
								   for json path, without_array_wrapper)

						goto ok
					end
							
			    --деактивация связи биржа брокер
				if (@action in ('exchange_broker.deactive'))
					begin
						--проверка id на null
						if (@exch_broker_id is null)
							begin
								set @err = 'err.exchange_broker_deactive.object_not_found'
								set @errdesc = 'Связь биржи и брокера не найдена'

								goto err
							end

						--проверка на существование связи 
						set @rp_ = null
						set @js_ = (select @exch_broker_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'exchange_broker.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.exchange_broker_deactive.object_not_found'
								set @errdesc = 'Связь биржи и брокера не найдена'

								goto err
							end
						
						--проверка на то что у брокера биржи нет клиентов 
						if exists (select top 1 1 
									from [dbo].[broker_client] bc with (nolock)
									join [dbo].[exchange_broker] eb with (nolock) on bc.[broker_id] = eb.[broker_id] 
								   where eb.[id] = @exch_broker_id and bc.[status] = 'Y' and eb.[status] = 'Y')
							begin
								set @err = 'err.exchange_broker_deactive.broker_has_clients'
								set @errdesc = 'У брокера есть клиенты'

								goto err
							end
											
						--меняем статус связи биржа/брокер
						update [dbo].[exchange_broker]
						   set [status] = 'N'
						where [id] = @exch_broker_id
						
						--выводим
						set @rp = (select @exch_broker_id  [id]
										 ,'N'		       [status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end				
			end


		--брокер
		if (@sba in ('broker'))
			begin
				declare		
				 @broker_id      uniqueidentifier = json_value(@js, '$.id')
				,@broker_name    nvarchar(30)	  = json_value(@js, '$.name')
				,@commission     numeric(15, 2)   = json_value(@js, '$.commission')
				,@broker_status  char(1)		
	
				--получение данных брокера
				if (@action in ('broker.get'))
					begin
						set @rp = (select * 
										from [dbo].[broker] with (nolock)
								   where ([id] = @broker_id or [name] = @broker_name) and [status] = 'Y'
								   for json path, without_array_wrapper)

						goto ok
					end

				--создание брокера
				if (@action in ('broker.create'))
					begin
						--проверка обязательных параметров на null
						if (  @broker_name is null
						   or @commission  is null )
							begin
								set @err = 'err.broker_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end

						--проверка на правильный формат коммиссии
						if (@commission > 100 or @commission < 0)
							begin 
								set @err = 'err.broker_create.invalid_commission'
								set @errdesc = 'Неверный формат коммиссии'

								goto err
							end

						--проверка названия на уникальность
						set @rp_ = null
						set @js_ = (select @broker_name [name] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.broker_create.not_unique_name'
								set @errdesc = 'Брокер с таким названием уже существует'

								goto err							
							end
						
						--добавляем значения в таблицу
						set @broker_id = newid()

						insert into [dbo].[broker]
						values (
								@broker_id,
								getdate(),
								@broker_name,
								@commission,
								'Y'
							   )

						--выводим
						set @rp = (select @broker_id    [id]
										 ,@broker_name  [name]
										 ,@commission   [commission]
								   for json path, without_array_wrapper)

						goto ok
					end
				
				--редактирование брокера
				if (@action in ('broker.edit'))
					begin
						--проверка обязательных параметров на null
						if (   @broker_id   is null
						   or (@broker_name is null and @commission is null)  )
							begin
								set @err = 'err.broker_edit.unset_field'
								set @errdesc = 'Не передан обязательный параметр'

								goto err
							end
						
						--проверка на правильный формат коммиссии
						if (@commission is not null and (@commission > 100 or @commission < 0))
							begin 
								set @err = 'err.broker_edit.invalid_commission'
								set @errdesc = 'Неверный формат коммиссии'

								goto err
							end

						--проверка на существование брокера 
						set @rp_ = null
						set @js_ = (select @broker_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.broker_edit.broker_not_found'
								set @errdesc = 'Брокер не найден'

								goto err
							end

						--проверка на уникальность названия
						if (@broker_name is not null)
							begin
								set @rp_ = null
								set @js_ = (select @broker_name [name] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'broker.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.broker_edit.not_unique_name'
										set @errdesc = 'Такое название уже существует'

										goto err
									end
							end
						
						--обновляем
						update [dbo].[broker]
						   set [name]		= isnull(@broker_name, [name])
							  ,[commission] = isnull(@commission, [commission])
						where [id] = @broker_id

						--выводим
						set @rp = (select * 
										from [dbo].[broker]
								   where [id] = @broker_id
								   for json path, without_array_wrapper)

						goto ok
					end
			
				--активация брокера
				if (@action in ('broker.active'))
					begin
						--проверка id на null 
						if (@broker_id is null)
							begin
								set @err = 'err.broker_active.broker_not_found'
								set @errdesc = 'Брокер не найден'
								
								goto err
							end
                        																		
						select @broker_name   = [name]
						      ,@broker_status = [status]
							from [dbo].[broker] with (nolock) 
						where [id] = @broker_id
						
						--проверка на существование компании 
						if (isnull(@broker_status, 'Y') = 'Y')
							begin
								set @err = 'err.broker_active.broker_not_found'
								set @errdesc = 'Брокер не найден'

								goto err
							end
						
						--проверка на уже существующее название брокера
						set @rp_ = null
						set @js_ = (select @broker_name [name] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.broker_active.not_unique_name'
								set @errdesc = 'Брокер с таким названием уже существует'

								goto err
							end
																							
						--меняем статус брокера
						update [dbo].[broker]
						   set [status] = 'Y'
						where [id] = @broker_id
						
						--выводим
						set @rp = (select @broker_id  [id]
										 ,'Y'		  [status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end

			    --деактивация брокера
				if (@action in ('broker.deactive'))
					begin
						--проверка id на null
						if (@broker_id is null)
							begin
								set @err = 'err.broker_deactive.broker_not_found'
								set @errdesc = 'Брокер не найден'

								goto err
							end

						--проверка на существование брокера 
						set @rp_ = null
						set @js_ = (select @broker_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.broker_deactive.broker_not_found'
								set @errdesc = 'Брокер не найден'

								goto err
							end
						
						--проверка на наличие клиентов у брокера
						if exists (select top 1 1 from [dbo].[broker_client] with (nolock) where [broker_id] = @broker_id and [status] = 'Y')
							begin
								set @err = 'err.broker_deactive.broker_has_clients'
								set @errdesc = 'У брокера есть клиенты'

								goto err
							end

						begin tran
							--меняем статус брокера
							update [dbo].[broker]
							   set [status] = 'N'
							where [id] = @broker_id

							--меняем статус связи биржа/брокер
							update [dbo].[exchange_broker]
							   set [status] = 'N'
							where [broker_id] = @broker_id and [status] = 'Y'
						commit tran 

						--выводим
						set @rp = (select @broker_id  [id]
										 ,'N'		  [status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end				
			end

		
		--брокер - клиент
		if (@sba in ('broker_client'))
			begin
				declare 
				 @broker_client_id uniqueidentifier = json_value(@js, '$.id')
				,@broker_id_cl     uniqueidentifier = json_value(@js, '$.broker_id')
				,@client_id_br     uniqueidentifier = json_value(@js, '$.client_id')
			
				--получение данных связи брокер - клиент
				if (@action in ('broker_client.get'))
					begin
						set @rp = (select * 
										from [dbo].[broker_client] with (nolock)
								   where ([id] = @broker_client_id or ([broker_id] = @broker_id_cl and [client_id] = @client_id_br)) and [status] = 'Y'
								   for json path, without_array_wrapper)

						goto ok
					end

				--создание связи брокер - клиент
				if (@action in ('broker_client.create'))
					begin
						--проверка обязательных параметров на null
						if (  @broker_id_cl  is null
						   or @client_id_br  is null )
							begin
								set @err = 'err.broker_client_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end
										
						--проверка на существование брокера
						set @rp_ = null
						set @js_ = (select @broker_id_cl [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin					
								set @err = 'err.broker_client_create.broker_not_found'
								set @errdesc = 'Брокер не найден'

								goto err							
							end
						
						--проверка на существование клиента
						set @rp_ = null
						set @js_ = (select @client_id_br [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'client.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin					
								set @err = 'err.broker_client_create.client_not_found'
								set @errdesc = 'Клиент не найден'

								goto err							
							end

						--проверка на уже существующую связь 
						set @rp_ = null
						set @js_ = (select @broker_id_cl [broker_id], @client_id_br [client_id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker_client.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.broker_client_create.alreadу_exists'
								set @errdesc = 'Связь уже существует'

								goto err							
							end

						--добавляем значения в таблицу
						set @broker_client_id = newid()

						insert into [dbo].[broker_client]
						values (
								@broker_client_id,
								getdate(),
								@broker_id_cl,
								@client_id_br,
								'Y'
							   )

						--выводим
						set @rp = (select @broker_client_id  [id]
										 ,@broker_id_cl      [broker_id]
										 ,@client_id_br      [client_id]
								   for json path, without_array_wrapper)

						goto ok
					end
								
			    --деактивация связи брокер - клиент
				if (@action in ('broker_client.deactive'))
					begin
						--проверка id на null
						if (@broker_client_id is null)
							begin
								set @err = 'err.broker_client_deactive.object_not_found'
								set @errdesc = 'Связь брокера и клиента не найдена'

								goto err
							end

						--проверка на существование связи 
						set @rp_ = null
						set @js_ = (select @broker_client_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker_client.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.broker_client_deactive.object_not_found'
								set @errdesc = 'Связь брокера и клиента не найдена'

								goto err
							end
																						
						--меняем статус связи брокер / клиент
						update [dbo].[broker_client]
						   set [status] = 'N'
						where [id] = @broker_client_id
						
						--выводим
						set @rp = (select @broker_client_id  [id]
										 ,'N'		         [status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end				
			end


		--client
		if (@sba in ('client'))
			begin
				declare
				 @client_id        uniqueidentifier = json_value(@js, '$.id') 
				,@fio			   nvarchar(200)    = json_value(@js, '$.fio')
				,@date_of_birthday date             = json_value(@js, '$.date_of_birthday')
				,@passport         bigint           = json_value(@js, '$.passport')
				,@sum              numeric(15, 2)   = json_value(@js, '$.sum')
				,@type             nvarchar(20)     = json_value(@js, '$.type')
				,@change           int
				,@balance          numeric(15, 2)
				,@tr_id			   uniqueidentifier
				,@sub_id_cl		   uniqueidentifier
				
				--получение данных клиента
				if (@action in ('client.get'))
					begin
						set @rp = (select * 
										from [dbo].[client] with (nolock)
								   where ([id] = @client_id or [passport] = @passport) and [status] = 'Y'
								   for json path, without_array_wrapper)

						goto ok
					end

				--создание клиента	
				if (@action in ('client.create'))
					begin
						--проверка обязательных параметров на null
						if (  @fio			    is null
						   or @date_of_birthday is null 
						   or @passport         is null  )
							begin
								set @err = 'err.client_create.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end
                        
						--проверка на правильный формат фамилии
						if (@fio not like '%[А-Яа-я]%')
							begin
								set @err = 'err.client_create.invalid_fio'
								set @errdesc = 'Неверный формат ФИО'

								goto err
							end

						--проверка на совершеннолетие
						if (datediff(month, @date_of_birthday, getdate()) < 216)
							begin
								set @err = 'err.client_create.invalid_date_of_birthday'
								set @errdesc = 'Человеку меньше восемнадцати лет'

								goto err
							end

						--проверка на формат паспорта
						if (len(@passport) != 10)
							begin
								set @err = 'err.client_create.invalid_passport'
								set @errdesc = 'Неверный формат паспорта'

								goto err
							end

						--проверка паспорта на уникальность
						set @rp_ = null
						set @js_ = (select @passport [passport] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'client.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is not null)
							begin					
								set @err = 'err.client_create.not_unique_passport'
								set @errdesc = 'Клиент с таким паспортом уже существует'

								goto err							
							end
						
						--добавляем значения в таблицу
						set @client_id = newid()

						insert into [dbo].[client]
						values (
								@client_id,
								getdate(),
								@fio,
								@date_of_birthday,
								@passport,
								0.00,
								null,
								null,
								'Y'
							   )
                        
						--создаем портфель клиенту
						set @rp_ = null
						set @js_ = (select @client_id [client_id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'portfolio.create', @js_, @rp_ out

						--выводим
						set @rp = (select @client_id         [id]
										 ,@fio               [fio]
										 ,@date_of_birthday  [date_of_birthday]
										 ,@passport			 [passport]
										 ,isnull(json_value(@rp_, '$.response.id'), 'Портфель не создан') [port_id]
								   for json path, without_array_wrapper)

						goto ok
					end
				
				--проведение транзакций клиента
				if (@action in ('client.transaction'))
					begin
						--проверка обязательных параметров на null
						if (   @client_id   is null
						   or  @sum         is null )
							begin
								set @err = 'err.client_transaction.unset_field'
								set @errdesc = 'Не передан обязательный параметр'

								goto err
							end

						--создаем транзакцию						
					    set @tr_id = newid()

					    insert into [dbo].[transaction] 
						  values
						   (
						     @tr_id
						    ,getdate()
						    ,@client_id
						    ,@type
						    ,@sum
						    ,'create'
						   )
						
						--проверка клиента на null
					    if (@client_id is null)
						    begin
							    set @err = 'err.client_transaction.client_not_found'
							    set @errdesc = 'Клиент не найден'

							    --обновляем транзакцию
							    update [dbo].[transaction]
								set [status] = 'error'
							    where  [id] = @tr_id	

							    goto err
						    end

						--проверка формата суммы
					    if (@sum is null or @sum <= 0)
						    begin
							    set @err = 'err.client_transaction.invalid_sum'
							    set @errdesc = 'Неверный формат суммы'

							    --обновляем транзакцию
							    update [dbo].[transaction]
								   set [status] = 'error'
							    where  [id] = @tr_id

							    goto err
						    end
						
						--проверка типа транзакции 
					    if (@type is null) or (@type not in ('refill', 'withdrawal', 'subscribe', 'buy_stock', 'sell_stock'))
						    begin
							    set @err = 'err.client_transaction.invalid_type'
							    set @errdesc = 'Неверный формат типа транзакции'

							    --обновляем транзакцию
							    update [dbo].[transaction]
								   set [status] = 'error'
							    where  [id] = @tr_id

							    goto err
						    end
												
						--проверка на существование клиента 
						set @rp_ = null
						set @js_ = (select @client_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'client.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.client_transaction.client_not_found'
								set @errdesc = 'Клиент не найден'

								--обновляем транзакцию
								update [dbo].[transaction]
								   set [status] = 'error'
							    where  [id] = @tr_id
							    
								goto err
							end
						
						set @js_ = (select @client_id [id], @sum [sum], @tr_id [tr_id], @type [type]
									for json path, without_array_wrapper)

						exec [dbo].[client.transaction] @js_, @rp_ out

						--проверка результата транзакции
						if (json_value(@rp_, '$.status') != 'ok')
							begin
								set @err = json_value(@rp_, '$.err')
								set @errdesc = json_value(@rp_, '$.errdesc')
							
								goto err
							end

						--выводим 
						set @rp = @rp_

						goto ok
					end

				--редактирование клиента
				if (@action in ('client.edit'))
					begin
						--проверка обязательных параметров на null
						if (   @client_id   is null
						   or (@passport    is null and @fio is null)  )
							begin
								set @err = 'err.client_edit.unset_field'
								set @errdesc = 'Не передан обязательный параметр'

								goto err
							end

						--проверка на правильный формат фамилии
						if (@fio is not null and @fio not like '%[А-Яа-я]%')
							begin
								set @err = 'err.client_edit.invalid_fio'
								set @errdesc = 'Неверный формат ФИО'

								goto err
							end

						--проверка на формат паспорта
						if (@passport is not null and len(@passport) != 10)
							begin
								set @err = 'err.client_edit.invalid_passport'
								set @errdesc = 'Неверный формат паспорта'

								goto err					
							end
						
						--проверка на существование клиента 
						set @rp_ = null
						set @js_ = (select @client_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'client.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.client_edit.client_not_found'
								set @errdesc = 'Клиент не найден'

								goto err
							end

						--проверка на уникальность паспорта 
						if (@passport is not null)
							begin
								set @rp_ = null
								set @js_ = (select @passport [passport] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'client.get', @js_, @rp_ out

								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.client_edit.not_unique_passport'
										set @errdesc = 'Такой паспорт уже существует'

										goto err
									end
							end
						
						--обновляем
						update [dbo].[client]
						   set [fio]	  = isnull(@fio, [fio])
							  ,[passport] = isnull(@passport, [passport])
						where [id] = @client_id

						--выводим
						set @rp = (select * 
										from [dbo].[client]
								   where [id] = @client_id 
								   for json path, without_array_wrapper)

						goto ok
					end
				
			    --закрытие счета у клиента
				if (@action in ('client.close'))
					begin
						--проверка id на null 
						if (@client_id is null)
							begin
								set @err = 'err.client_close.client_not_found'
								set @errdesc = 'Клиент не найден'

								goto err
							end
                        						
						--проверка на существование клиента 
						set @rp_ = null
						set @js_ = (select @client_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'client.get', @js_, @rp_ out

						set @balance = json_value(@rp_, '$.response.balance')

						if (@balance is null)
							begin
								set @err = 'err.client_close.client_not_found'
								set @errdesc = 'Клиент не найден'
								
								goto err
							end
						
						--проверка на нулевой баланс 
						if (@balance != 0)
							begin
								set @err = 'err.client_close.client_has_money'
								set @errdesc = 'У клиента есть денежные средства на счету'
								
								goto err
							end
						
						--проверка на отсутствие акций в портфеле
						if exists (select top 1 1 
										from [dbo].[portfolio] p with (nolock)
										join [dbo].[port_company] pc with (nolock) on p.[id] = pc.[port_id]
								   where p.[client_id] = @client_id and p.[status] = 'Y' and pc.[status] = 'Y')
							begin
								set @err = 'err.client_close.client_has_stock'
								set @errdesc = 'У клиента есть акции в портфеле'
								
								goto err
							end
						
						begin tran
							--меняем статус клиенту
							update [dbo].[client]
							   set [status] = 'N'
								  ,[d_close] = getdate()
								  ,@sub_id_cl = [sub_id]
							where [id] = @client_id

							--меняем статус подписки у клиента если она есть
							if (@sub_id_cl is not null)
								begin 
									update [dbo].[sub_data]
									   set [status] = 'N'
									where [id] = @sub_id_cl
								end

							--меняем статус связи брокер / клиент
							update [dbo].[broker_client]
							   set [status] = 'N'
							where [client_id] = @client_id and [status] = 'Y'

							--меняем статус портфелям клиента
							update [dbo].[portfolio]
							   set [status] = 'N'
							where [client_id] = @client_id and [status] = 'Y'
						commit tran

						--выводим
						set @rp = (select @client_id  [id]
										 ,'N'		  [status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end
			end

		
		--sub_data		
		if (@sba in ('sub_data'))
			begin								 
				declare 
				 @sub_id		uniqueidentifier = json_value(@js, '$.id')
			    ,@client_id_sub uniqueidentifier = json_value(@js, '$.client_id')

				--получение данных подписки
				if (@action in ('sub_data.get'))
					begin
						set @rp = (select * 
										from [dbo].[sub_data] with (nolock)
								   where [id] = @sub_id  and [status] = 'Y'
								   for json path, without_array_wrapper)

						goto ok
					end	

				--оформление подписки 	
				if (@action in ('sub_data.create'))
					begin
						--проверка id клиента на null
						if (@client_id_sub is null)
							begin
								set @err = 'err.sub_data_create.client_not_found'
								set @errdesc = 'Клиент не найден'

								goto err
							end
                        
						--проверка на существование клиента
						set @rp_ = null
						set @js_ = (select @client_id_sub [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'client.get', @js_, @rp_ out
						
						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.sub_data_create.client_not_found'
								set @errdesc = 'Клиент не найден'

								goto err
							end
						
						--проверка на уже оформленную подписку
						set @sub_id = json_value(@rp_, '$.response.sub_id')

						if (@sub_id is not null)
							begin
								set @err = 'err.sub_data.create.client_has_sub'
								set @errdesc = 'У клиента есть подписка'

								goto err
							end
						
						--производим оплату		
						set @js_ = (select @client_id_sub   [id]
										  ,'299'            [sum]
										  ,'subscribe'		[type] 
									for json path, without_array_wrapper)

						set @rp_ = null
						exec [dbo].[ms_api] 'client.transaction', @js_, @rp_ out

						--проверяем результат оплаты
						if (json_value(@rp_, '$.status') != 'ok')
							begin
								set @err = 'err.sub_data_create.payment_failed'
								set @errdesc = 'Не удалось оплатить подписку'

								goto err
							end

						--добавляем значения в таблицу
						set @sub_id = newid()

						insert into [dbo].[sub_data]
						values (
								@sub_id,
								getdate(),
								getdate(),
								dateadd(month, 1, getdate()),
								'N',
								'Y'
							   )
						
						--добавляем id подписки клиенту
						update [dbo].[client]
						   set [sub_id] = @sub_id
						where [id] = @client_id_sub

						--выводим
						set @rp = (select @sub_id         [id]
										 ,@client_id_sub  [client_id]										 										 										
								   for json path, without_array_wrapper)
									  
						goto ok
					end									    
			end


		--portfolio
		if (@sba in ('portfolio'))
			begin
				declare
				 @port_id        uniqueidentifier = json_value(@js, '$.id')
				,@client_id_port uniqueidentifier = json_value(@js, '$.client_id')
			    ,@port_name      nvarchar(30)     = json_value(@js, '$.name')				
				
				--получение данных портфеля
				if (@action in ('portfolio.get'))
					begin
						set @rp = (select * 
										from [dbo].[portfolio] with (nolock)
								   where ([id] = @port_id or [client_id] = @client_id_port) and [status] = 'Y'
								   for json path)

						goto ok
					end

				--создание портфеля 	
				if (@action in ('portfolio.create'))
					begin
						--проверка id клиента на null
						if (@client_id_port is null)
							begin
								set @err = 'err.portfolio_create.client_not_found'
								set @errdesc = 'Клиент не найден'

								goto err
							end
                        
						--проверка на существование клиента
						set @rp_ = null
						set @js_ = (select @client_id_port [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'client.get', @js_, @rp_ out
						
						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.portfolio_create.client_not_found'
								set @errdesc = 'Клиент не найден'

								goto err
							end
						
						--добавляем значения в таблицу
						set @port_id = newid()

						insert into [dbo].[portfolio]
						values (
								@port_id,
								getdate(),
								@client_id_port,
								@port_name,								
								'Y'
							   )
                     
						--выводим
						set @rp = (select @port_id         [id]
										 ,@client_id_port  [client_id]
										 ,@port_name       [name]										 										
								   for json path, without_array_wrapper)

						goto ok
					end

				--редактирование портфеля 
				if (@action in ('portfolio.edit'))
					begin
						--проверка обязательных параметров на null
						if (   @port_id   is null
						   or  @port_name is null )
							begin
								set @err = 'err.portfolio_edit.unset_field'
								set @errdesc = 'Не передан обязательный параметр'

								goto err
							end

						--проверка на существование портфеля
						set @rp_ = null
						set @js_ = (select @port_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'portfolio.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response[0].id') is null)
							begin
								set @err = 'err.portfolio_edit.potrfolio_not_found'
								set @errdesc = 'Портфель не найден'

								goto err
							end
																											
						--обновляем
						update [dbo].[portfolio]
						   set [name] = @port_name							  
						where [id] = @port_id

						--выводим
						set @rp = (select * 
										from [dbo].[portfolio]
								   where [id] = @port_id 
								   for json path, without_array_wrapper)

						goto ok
					end
								
			    --закрытие портфеля
				if (@action in ('portfolio.close'))
					begin
						--проверка id на null 
						if (@port_id is null)
							begin
								set @err = 'err.portfolio_close.portfolio_not_found'
								set @errdesc = 'Портфель не найден'

								goto err
							end
                        						
						--проверка на существование портфеля 
						set @rp_ = null
						set @js_ = (select @port_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'portfolio.get', @js_, @rp_ out

						set @client_id_port = json_value(@rp_, '$.response[0].client_id')

						if (@client_id_port is null)
							begin
								set @err = 'err.portfolio_close.portfolio_not_found'
								set @errdesc = 'Портфель не найден'
								
								goto err
							end
																		
						--проверка на то что это единственный портфель клиента 
						set @rp_ = null
						set @js_ = (select @client_id_port [client_id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'portfolio.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response[1].id') is null)
							begin
								set @err = 'err.portfolio_close.client_has_only_one_port'
								set @errdesc = 'У клиента только один портфель'

								goto err
							end
						
						--проверка на отсутствие акций в портфеле 
						set @rp_ = null
						set @js_ = (select @port_id [port_id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'port_company.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response[0].id') is not null)
							begin
								set @err = 'err.portfolio_close.portfolio_not_empty'
								set @errdesc = 'Портфель не пустой'

								goto err
							end
													
						--меняем статус портфелю
						update [dbo].[portfolio]
						   set [status] = 'N'
						where [id] = @port_id
						
						--выводим
						set @rp = (select @port_id  [id]
										 ,'N'		[status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end
			end
		

		--портфель - компания
		if (@sba in ('port_company'))
			begin
				declare 
				 @port_company_id uniqueidentifier = json_value(@js, '$.id')
				,@port_id_comp	  uniqueidentifier = json_value(@js, '$.port_id')
				,@comp_id_port	  uniqueidentifier = json_value(@js, '$.comp_id')
				,@broker_id_pc	  uniqueidentifier = json_value(@js, '$.broker_id')
				,@client_id_pc	  uniqueidentifier = json_value(@js, '$.client_id')
				,@quantity		  int              = json_value(@js, '$.quantity')
				,@price_of_buy    numeric(15, 2)
				,@price_total     numeric(15, 2)
				,@price_now		  numeric(15, 2)
				,@sub_id_pc		  uniqueidentifier
				,@commission_pc	  numeric(15, 2)

				--получение данных связи портфель - компания
				if (@action in ('port_company.get'))
					begin
						set @rp = (select * 
										from [dbo].[port_company] with (nolock)
								   where ([id] = @port_company_id or [port_id] = @port_id_comp) and [status] = 'Y'
								   for json path)

						goto ok
					end

				--покупка акций
				if (@action in ('port_company.buy_stock'))
					begin
						--проверка обязательных параметров на null
						if (  @broker_id_pc  is null
						   or @client_id_pc  is null 
						   or @comp_id_port  is null
						   or @port_id_comp  is null
						   or @quantity		 is null  )
							begin
								set @err = 'err.port_company_buy_stock.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end
						
						--проверка формата количества акций
						if (@quantity < 1)
							begin
								set @err = 'err.port_company_buy_stock.invalid_quantity'
								set @errdesc = 'Неверный формат количества акций'

								goto err
							end
						
						--проверка на существование клиента
						set @rp_ = null
						set @js_ = (select @client_id_pc [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'client.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin					
								set @err = 'err.port_company_buy_stock.client_not_found'
								set @errdesc = 'Клиент не найден'

								goto err							
							end
						
						set @sub_id_pc = json_value(@rp_, '$.response.sub_id')
						set @balance = json_value (@rp_, '$.response.balance')
						--проверка на существование портфеля
						set @rp_ = null
						set @js_ = (select @port_id_comp [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'portfolio.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response[0].id') is null)
							begin					
								set @err = 'err.port_company_buy_stock.portfolio_not_found'
								set @errdesc = 'Портфель не найден'

								goto err							
							end
						
						--проверка на существование связи портфеля и клиента 
						if (@client_id_pc != json_value(@rp_, '$.response[0].client_id'))
							begin
								set @err = 'err.port_company_buy_stock.portfolio_client_not_found'
								set @errdesc = 'Связь портфеля и клиента не найдена'

								goto err
							end

						--проверка на существование компании
						set @rp_ = null
						set @js_ = (select @comp_id_port [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'company.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin					
								set @err = 'err.port_company_buy_stock.company_not_found'
								set @errdesc = 'Компания не найдена'

								goto err							
							end
						
						--проверка на существование брокера
						set @rp_ = null
						set @js_ = (select @broker_id_pc [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker.get', @js_, @rp_ out 
												
						set @commission_pc = json_value(@rp_, '$.response.commission')

						if (@commission_pc is null)
							begin
								set @err = 'err.port_company_buy_stock.broker_not_found'
								set @errdesc = 'Брокер не найден'

								goto err
							end
																		
						--проверка на существование связи между брокером и клиентом
						set @rp_ = null
						set @js_ = (select @broker_id_pc [broker_id], @client_id_pc [client_id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker_client.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin					
								set @err = 'err.port_company_buy_stock.broker_client_not_found'
								set @errdesc = 'Связь брокера и клиента не найдена'

								goto err							
							end

						--проверка на существование акции
						set @rp_ = null
						set @js_ = (select @comp_id_port [comp_id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'stock.get', @js_, @rp_ out 
					
						set @price_of_buy = json_value(@rp_, '$.response.price')

						if (@price_of_buy is null)
							begin
								set @err = 'err.port_company_buy_stock.stock_not_found'
								set @errdesc = 'Акция не найдена'

								goto err
							end

						--производим оплату в зависимости от подписки		  
						set @price_total = iif(@sub_id_pc is not null, @price_of_buy * @quantity, (@price_of_buy + (@price_of_buy * @commission_pc / 100)) * @quantity)
						set @js_ = (select @client_id_pc [id], 'buy_stock' [type], @price_total [sum]
									for json path, without_array_wrapper)
						
						set @rp_ = null
						exec [dbo].[ms_api] 'client.transaction', @js_, @rp_ out

						--проверяем результат оплаты 
					    if (json_value(@rp_, '$.status') != 'ok')
							begin
								set @err = 'err.port_company_buy_stock.failed_payment'
								set @errdesc = 'Не удалось произвести оплату'

								goto err
							end

						set @rp = (select @port_id_comp      [port_id]
										 ,@comp_id_port      [comp_id]
										 ,@price_of_buy [price_of_buy]
										 ,@quantity [quantity]
										 ,@balance [balance]
								   for json path, without_array_wrapper)

						--добавляем значения в таблицу
						while @quantity >= 1
							begin
								set @port_company_id = newid()

								insert into [dbo].[port_company]
								values (
										@port_company_id,
										getdate(),
										@port_id_comp,
										@comp_id_port,
										@price_of_buy,
										'Y'
									   )

								set @quantity -= 1

								--добавляем id в массив
								set @rp = json_modify(@rp, 'append $.id', cast(@port_company_id as nvarchar(100)))
							end

						goto ok
					end
							
			    --продажа акций
				if (@action in ('port_company.sell_stock'))
					begin
						--проверка обязательных параметров на null
						if (   @port_company_id is null
							or @broker_id_pc    is null
							or @client_id_pc    is null )
							begin
								set @err = 'err.port_company_sell_stock.unset_field'
								set @errdesc = 'Указаны не все необходимые параметры'

								goto err
							end

						--проверка на существование связи 
						set @rp_ = null
						set @js_ = (select @port_company_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'port_company.get', @js_, @rp_ out

						set @price_of_buy = json_value(@rp_, '$.response[0].price_of_buy')
						set @comp_id_port = json_value(@rp_, '$.response[0].comp_id')
						set @port_id_comp = json_value(@rp_, '$.response[0].port_id')

						if (@price_of_buy is null)
							begin
								set @err = 'err.port_company_sell_stock.object_not_found'
								set @errdesc = 'Сделка не найдена'

								goto err
							end
						
						--проверка на существование клиента
						set @rp_ = null
						set @js_ = (select @client_id_pc [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'client.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin					
								set @err = 'err.port_company_sell_stock.client_not_found'
								set @errdesc = 'Клиент не найден'

								goto err							
							end
						
						set @sub_id_pc = json_value(@rp_, '$.response.sub_id')

						--проверка на существование связи клиента и портфеля
						set @rp_ = null
						set @js_ = (select @port_id_comp [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'portfolio.get', @js_, @rp_ out 

						if (@client_id_pc != json_value(@rp_, '$.response[0].client_id'))
							begin					
								set @err = 'err.port_company_sell_stock.client_portfolio_not_found'
								set @errdesc = 'Связь клиента и портфеля не найдена'

								goto err							
							end
						
						--проверка на существование брокера
						set @rp_ = null
						set @js_ = (select @broker_id_pc [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker.get', @js_, @rp_ out 
												
						set @commission_pc = json_value(@rp_, '$.response.commission')

						if (@commission_pc is null)
							begin
								set @err = 'err.port_company_sell_stock.broker_not_found'
								set @errdesc = 'Брокер не найден'

								goto err
							end

						--проверка на существование связи между брокером и клиентом
						set @rp_ = null
						set @js_ = (select @broker_id_pc [broker_id], @client_id_pc [client_id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'broker_client.get', @js_, @rp_ out 

						if (json_value(@rp_, '$.response.id') is null)
							begin					
								set @err = 'err.port_company_sell_stock.broker_client_not_found'
								set @errdesc = 'Связь брокера и клиента не найдена'

								goto err							
							end
						
						--проверка на существование акции 						
						set @rp_ = null
						set @js_ = (select @comp_id_port [comp_id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'stock.get', @js_, @rp_ out 
												
						set @price_now = json_value(@rp_, '$.response.price')

						if (@price_now is null)
							begin
								set @err = 'err.port_company_sell_stock.stock_not_found'
								set @errdesc = 'Акция не найдена'

								goto err
							end
						
						--производим продажу акции если настоящая цена больше цены покупки (отнимаем налог за прибыль)
					    if (@price_now > @price_of_buy)
							begin
							    --расчитывается прибыль в засимости от подписки			 
							    set @price_now = iif(@sub_id is not null, @price_now - (@price_now - @price_of_buy) * 0.13,
																		  @price_now - (@price_now - @price_of_buy) * 0.13 - (@price_now * @commission / 100))
							    set @js_ = (select @client_id   [id]
												  ,@price_now   [sum]
												  ,'sell_stock' [type]
										    for json path, without_array_wrapper)								 
							end

						--производим продажу акции если настоящая цена меньше или равна цене покупки
					    if (@price_now <= @price_of_buy)
							begin
								--расчитывается прибыль в засимости от подписки
								set @price_now = iif(@sub_id_pc is not null, @price_now, @price_now - (@price_now * @commission_pc / 100))				                                         
								set @js_ = (select @client_id_pc [id]
												  ,@price_now    [sum]
												  ,'sell_stock'  [type]
											for json path, without_array_wrapper)
							end

						set @rp_ = null
						exec [dbo].[ms_api] 'client.transaction', @js_, @rp_ out

						--проверяем результат операции
					    if (json_value(@rp_, '$.status') != 'ok')
							begin
								set @err = 'err.port_company_sell_stock.failed_sell'
								set @errdesc = 'Не удалось продать акцию'

								goto err
							end
											
						--меняем статус сделки
						update [dbo].[port_company]
						   set [status] = 'N'
						where [id] = @port_company_id
											
						--выводим
						set @rp = (select @port_company_id   [id]
										 ,@price_now		 [price_now]
										 ,'N'		         [status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end				
			end


		--company
		if (@sba in ('company'))
			begin
				declare
				 @comp_id	  uniqueidentifier = json_value(@js, '$.id')
				,@comp_name   nvarchar(30)     = json_value(@js, '$.name')
				,@industry    nvarchar(max)    = json_query(@js, '$.industry')
				,@comp_status char(1)
						
				--получение данных компании
				if (@action in ('company.get'))
					begin
						set @rp = (select * 
										from [dbo].[company] with (nolock)
								   where ([id] = @comp_id or [name] = @comp_name) and [status] = 'Y'
								   for json path, without_array_wrapper)

						goto ok
					end

				--создание компании
				if (@action in ('company.create'))
					begin
						--проверка на наличие обязательных параметров
						if (   @comp_name is null
							or @industry  is null  )
							begin
								set @err = 'err.company_create.unset_field'
								set @errdesc = 'Не передан обязательный параметр'

								goto err
							end
						
						--проверка на уже существующее название компании
						set @rp_ = null
						set @js_ = (select @comp_name [name] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'company.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.company_create.not_unique_name'
								set @errdesc = 'Такое название компании уже существует'

								goto err
							end

						--проверка на наличие элементов в массиве industry
						if (json_value(@industry, '$[0]') is null)
							begin
								set @err = 'err.company_create.hasnt_data_of_industry'
								set @errdesc = 'Отсутствуют данные отрасли экономики'

								goto err
							end
						
						--проверка формата отрасли экономики
						if exists (select top 1 1 from openjson(@industry)  
								   where [value] not in ('finance', 'it', 'raw_materials', 'mechanical_engineering', 'trade', 'construction', 'agriculture'))
							begin
								set @err = 'err.company_create.invalid_industry'
								set @errdesc = 'Неверный формат отрасли экономики'

								goto err
							end

						--добавляем значения в таблицу
						set @comp_id = newid()

						insert into [dbo].[company]
						values (
								@comp_id,
								getdate(),
								@comp_name,
								@industry,								
								'Y'
							   )
                     
						--выводим
						set @rp = (select @comp_id              [id]
										 ,@comp_name            [name]
										 ,json_query(@industry) [industry]										 										
								   for json path, without_array_wrapper)

						goto ok
					end

				--редактирование компании 
				if (@action in ('company.edit'))
					begin
						--проверка обязательных параметров на null
						if (   @comp_id   is null
						   or (@comp_name is null 
						   and @industry  is null) )
							begin
								set @err = 'err.company_edit.unset_field'
								set @errdesc = 'Не передан обязательный параметр'

								goto err
							end

						--проверка на существование компании
						set @rp_ = null
						set @js_ = (select @comp_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'company.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.company_edit.company_not_found'
								set @errdesc = 'Компания не найдена'

								goto err
							end
						
						--проверка на уникальность названия компании 
						if (@comp_name is not null)
							begin
								set @rp_ = null
								set @js_ = (select @comp_name [name] for json path, without_array_wrapper)
								exec [dbo].[ms_api] 'company.get', @js_, @rp_ out
								
								if (json_value(@rp_, '$.response.id') is not null)
									begin
										set @err = 'err.company_edit.not_unique_name'
										set @errdesc = 'Такое название уже существует'

										goto err
									end
							end

						--проверка формата industry
						if (@industry is not null)
							begin
								if (json_value(@industry, '$[0]') is null)
									begin
										set @err = 'err.company_edit.hasnt_data_of_industry'
										set @errdesc = 'Отсутствуют данные отрасли экономики'

										goto err
									end

								if exists (select top 1 1 from openjson(@industry)  
										   where [value] not in ('finance', 'it', 'raw_materials', 'mechanical_engineering', 'trade', 'construction', 'agriculture'))
									begin
										set @err = 'err.company_edit.invalid_industry'
										set @errdesc = 'Неверный формат отрасли экономики'

										goto err
									end								
							end

						--обновляем
						update [dbo].[company]
						   set [name]     = isnull(@port_name, [name]),
							   [industry] = isnull(@industry, [industry])
						where [id] = @comp_id

						--выводим
						set @rp = (select [id], [dadd], [name], json_query(@industry) [industry], [status]
										from [company] 
								   where [id] = @comp_id 
								   for json path, without_array_wrapper)

						goto ok
					end
			
				--активация компании
				if (@action in ('company.active'))
					begin
						--проверка id на null 
						if (@comp_id is null)
							begin
								set @err = 'err.company_active.company_not_found'
								set @errdesc = 'Компания не найдена'

								goto err
							end
                        																		
						select @comp_name    = [name]
						      ,@comp_status  = [status]
							from [dbo].[company] with (nolock)
						where [id] = @comp_id
						
						--проверка на существование компании 
						if (isnull(@comp_status, 'Y') = 'Y')
							begin
								set @err = 'err.company_active.company_not_found'
								set @errdesc = 'Компания не найдена'

								goto err
							end
						
						--проверка на уже существующее название компании
						set @rp_ = null
						set @js_ = (select @comp_name [name] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'company.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.stock_active.not_unique_name'
								set @errdesc = 'Компания с таким название уже существует'

								goto err
							end
																								
						--меняем статус компании
						update [dbo].[company]
						   set [status] = 'Y'
						where [id] = @comp_id
						
						--выводим
						set @rp = (select @comp_id  [id]
										 ,'Y'		[status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end

			    --деактивация компании
				if (@action in ('company.deactive'))
					begin
						--проверка id на null 
						if (@comp_id is null)
							begin
								set @err = 'err.company_deactive.company_not_found'
								set @errdesc = 'Компания не найдена'

								goto err
							end
                        						
						--проверка на существование компании 
						set @rp_ = null
						set @js_ = (select @comp_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'company.get', @js_, @rp_ out
					
						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.company_deactive.company_not_found'
								set @errdesc = 'Компания не найдена'
								
								goto err
							end
																		
						--проверка на наличие непроданных акций компании
						if exists (select top 1 1 from [dbo].[port_company] with (nolock) where [comp_id] = @comp_id and [status] = 'Y')
							begin
								set @err = 'err.company_deactive.clients_have_stocks'
								set @errdesc = 'У клиентов есть непроданные акции компании' 

								goto err
							end
						
						begin tran
							--меняем статус компании
							update [dbo].[company]
							   set [status] = 'N'
							where [id] = @comp_id

							--меняем статус акции компании
							update [dbo].[stock]
							   set [status] = 'N'
							where [comp_id] = @comp_id and [status] = 'Y'
						commit tran

						--выводим
						set @rp = (select @comp_id  [id]
										 ,'N'		[status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end
			end


		--stock
		if (@sba in ('stock'))
			begin	
				declare
				 @stock_id   uniqueidentifier = json_value(@js, '$.id')				
				,@price      numeric(15, 2)   = json_value(@js, '$.price')
				,@comp_id_s  uniqueidentifier = json_value(@js, '$.comp_id') 
												
				--получение данных акции
				if (@action in ('stock.get'))
					begin
						set @rp = (select * 
										from [dbo].[stock] with (nolock)
								   where ([id] = @stock_id or [comp_id] = @comp_id_s) and [status] = 'Y'
								   for json path, without_array_wrapper)

						goto ok
					end

				--создание акции
				if (@action in ('stock.create'))
					begin
						--проверка на наличие обязательных параметров
						if (   @comp_id_s is null
							or @price     is null  )
							begin
								set @err = 'err.stock_create.unset_field'
								set @errdesc = 'Не передан обязательный параметр'

								goto err
							end
						
						--проверка формата цены
						if (@price <= 0)
							begin
								set @err = 'err.stock_create.invalid_price'
								set @errdesc = 'Неверный формат цены акции'

								goto err
							end

						--проверка на существование компании
						set @rp_ = null
						set @js_ = (select @comp_id_s [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'company.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.stock_create.company_not_found'
								set @errdesc = 'Компания не найдена'

								goto err
							end
																
						--проверка на уже существующую акцию компании 
						set @rp_ = null
						set @js_ = (select @comp_id_s [comp_id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'stock.get', @js_, @rp_ out

						if (json_value(@rp_, '$.response.id') is not null)
							begin
								set @err = 'err.stock_create.company_has_stock'
								set @errdesc = 'У компании уже есть акция'

								goto err
							end

						--добавляем значения в таблицу
						set @stock_id = newid()

						insert into [dbo].[stock]
						values (
								@stock_id,
								getdate(),
								@comp_id_s,
								@price,								
								'Y'
							   )
                     
						--выводим
						set @rp = (select @stock_id   [id]
										 ,@comp_id_s  [comp_id]
										 ,@price      [industry]										 										
								   for json path, without_array_wrapper)

						goto ok
					end
									
			    --деактивация акции
				if (@action in ('stock.deactive'))
					begin
						--проверка id на null 
						if (@stock_id is null)
							begin
								set @err = 'err.stock_deactive.stock_not_found'
								set @errdesc = 'Акция не найдена'

								goto err
							end
                        						
						--проверка на существование акции 
						set @rp_ = null
						set @js_ = (select @stock_id [id] for json path, without_array_wrapper)
						exec [dbo].[ms_api] 'stock.get', @js_, @rp_ out
					
						if (json_value(@rp_, '$.response.id') is null)
							begin
								set @err = 'err.stock_deactive.stock_not_found'
								set @errdesc = 'Акция не найдена'
								
								goto err
							end
																																																																	
						--меняем статус акции
						update [dbo].[stock]
						   set [status] = 'N'
						where [id] = @stock_id
						

						--выводим
						set @rp = (select @stock_id [id]
										 ,'N'		[status]
								   for json path, without_array_wrapper)
								   
						goto ok
					end
			end
		
	end try

	begin catch
		set @err = 'err.sys'
		set @errdesc = error_message()
				
		goto err
	end catch
	
	err:
		set @rp = (select 'err' [status], lower(@err) [err] , @errdesc [errdesc] for json path, without_array_wrapper)
		return

		insert into [log]
			select getdate(), @errdesc, 'err', @@SPID

	ok:
		set @rp = (select 'ok' [status], json_query(@rp) [response] for json path, without_array_wrapper)
		return
end
GO
/****** Object:  StoredProcedure [dbo].[stock.update_price]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[stock.update_price] 
as
begin
		 update [stock]
			set [price] = rand() * (([price] + 5) - ([price] - 5)) + ([price] - 5)
		 where  [status] = 'Y'
end
GO
/****** Object:  StoredProcedure [dbo].[sub_data.update_sub]    Script Date: 23.05.2023 22:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sub_data.update_sub] 
as
begin
	     declare @client_id uniqueidentifier = newid()
		        ,@js_       nvarchar(max)
				,@rp_       nvarchar(max)
				,@sub_id    uniqueidentifier
         
		 declare @sub_client table
								 (
								  [client_id] uniqueidentifier,
								  [sub_id]    uniqueidentifier
								 )

		 --добавляем в таблицу клиентов и айди их подписки где закончился срок действия 
		 insert into @sub_client
		 select c.[id], c.[sub_id] 
			from [sub_data] sd 
			join [client] c on c.[sub_id] = sd.[id]
		 where sd.[end_date] <= getdate() and c.[status] = 'Y' and sd.[status] = 'Y' 
		 
		 --создаем таблицу клиентов с включенным автосписанием
		 declare @sub_client_on table 
									 (
									  [client_id] uniqueidentifier,
									  [sub_id]    uniqueidentifier
									 )
		 
		 --создаем таблицу клиентов с отключенным автосписанием
		 declare @sub_client_off table 
									  (
									   [client_id] uniqueidentifier,
									   [sub_id]    uniqueidentifier
									  )
         
		 --добавляем значения в таблицу
		 insert into @sub_client_on
		 select sc.[client_id], sc.[sub_id] 
			from @sub_client sc
			join [sub_data] sd on sc.[sub_id] = sd.[id]
		 where sd.[auto_sub] = 'Y'

		 insert into @sub_client_off
		 select sc.[client_id], sc.[sub_id] 
			from @sub_client sc
			join [sub_data] sd on sc.[sub_id] = sd.[id]
		 where sd.[auto_sub] = 'N'

		 --обновляем статус подписки где нет автосписания
		 update [sub_data]
		    set [status] = 'N'		
		 where [id] in (select [sub_id] from @sub_client_off)

		 --удаляем подписку клиентам у которых нет автосписания 
		 update [client]
			set [sub_id] = null
		 where [id] in (select [client_id] from @sub_client_off)
	
		 --продливаем подписку клиентам у которых есть автосписания
		 declare @i int = 0

		 while 1 = 1
			begin
				 --находим клиента с автосписанием, у которого закончилась подписка в день проверки
				 select @client_id = [client_id], @sub_id = [sub_id]
					from @sub_client_on
				 order by [client_id] offset @i rows fetch next 1 rows only
				 
				 if (@@rowcount = 0) break;

				 --производим оплату				 
				 set @js_ = (select @client_id [id], 'subscribe' [type], '299' [sum]
							 for json path, without_array_wrapper)
				 set @rp_ = null
				 exec [dbo].[client.transaction] @js_, @rp_ out
			
				 --если оплата прошла успешно
				 if (json_value(@rp_, '$.status') = 'ok')
					begin
						update [sub_data]
						   set [start_date] = getdate()
							  ,[end_date]   = dateadd(month, 1, getdate())
						where  [id] = @sub_id
					end						
				 --если оплата не прошла 
				 else
					begin
						--удаляем id подписки у клиента 
						update [client]
						   set [sub_id] = null
						where  [id] = @client_id 

						--меняем статус подписки
						update [sub_data]
						   set [status] = 'N'
						where  [id] = @sub_id
					end
				 
				 set @i += 1
			end
end
GO
