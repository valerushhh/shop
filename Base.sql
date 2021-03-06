USE [master]
GO
/****** Object:  Database [shop]    Script Date: 23.04.2018 21:53:25 ******/
CREATE DATABASE [shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\shop.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\shop_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [shop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shop] SET  MULTI_USER 
GO
ALTER DATABASE [shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [shop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [shop]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id_comment] [int] IDENTITY(0,1) NOT NULL,
	[id_user] [int] NULL,
	[id_productCatalog] [int] NULL,
	[textComment] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[featureName]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[featureName](
	[id_featureName] [int] IDENTITY(0,1) NOT NULL,
	[id_typeOfGoods] [int] NOT NULL,
	[name] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[featureValue]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[featureValue](
	[id_featureValue] [int] IDENTITY(0,1) NOT NULL,
	[id_featureName] [int] NOT NULL,
	[id_productCatalog] [int] NOT NULL,
	[value] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id_order] [int] IDENTITY(0,1) NOT NULL,
	[id_orderStatus] [int] NULL,
	[id_user] [int] NULL,
	[id_productCatalog] [int] NULL,
	[countProducts] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderStatus]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orderStatus](
	[id_orderStatus] [int] IDENTITY(0,1) NOT NULL,
	[nameOrderStatus] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productCatalog]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[productCatalog](
	[id_productCatalog] [int] IDENTITY(0,1) NOT NULL,
	[id_typeOfGoods] [int] NOT NULL,
	[id_productStatus] [int] NULL,
	[name] [varchar](100) NULL,
	[description] [text] NULL,
	[price] [int] NULL,
	[img] [varchar](300) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productStatus]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[productStatus](
	[id_productStatus] [int] IDENTITY(0,1) NOT NULL,
	[productStatus] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[typeOfGoods]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[typeOfGoods](
	[id_typeOfGoods] [int] IDENTITY(0,1) NOT NULL,
	[nameTypeOfGoods] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id_user] [int] IDENTITY(0,1) NOT NULL,
	[id_userStatus] [int] NULL,
	[fullname] [varchar](100) NULL,
	[mail] [varchar](100) NULL,
	[telephone] [varchar](20) NULL,
	[address] [varchar](200) NULL,
	[password] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userStatus]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userStatus](
	[id_userStatus] [int] IDENTITY(0,1) NOT NULL,
	[nameUserStatus] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[featureName] ON 

INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (0, 0, N'HDD ROM')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (1, 0, N'RAM')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (2, 0, N'processor')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (3, 0, N'video card')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (4, 0, N'screen resolution')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (5, 0, N'screen type')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (6, 0, N'SSD ROM')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (7, 0, N'weight')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (8, 1, N'color')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (9, 1, N'resistance')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (10, 1, N'cable length')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (11, 1, N'Frequency range')
INSERT [dbo].[featureName] ([id_featureName], [id_typeOfGoods], [name]) VALUES (12, 1, N'Speaker diameter')
SET IDENTITY_INSERT [dbo].[featureName] OFF
SET IDENTITY_INSERT [dbo].[featureValue] ON 

INSERT [dbo].[featureValue] ([id_featureValue], [id_featureName], [id_productCatalog], [value]) VALUES (0, 0, 0, N'500')
INSERT [dbo].[featureValue] ([id_featureValue], [id_featureName], [id_productCatalog], [value]) VALUES (1, 1, 0, N'6')
INSERT [dbo].[featureValue] ([id_featureValue], [id_featureName], [id_productCatalog], [value]) VALUES (2, 2, 0, N'i3 6100u')
INSERT [dbo].[featureValue] ([id_featureValue], [id_featureName], [id_productCatalog], [value]) VALUES (3, 3, 0, N'intel hd6000')
INSERT [dbo].[featureValue] ([id_featureValue], [id_featureName], [id_productCatalog], [value]) VALUES (4, 4, 0, N'1366*768')
INSERT [dbo].[featureValue] ([id_featureValue], [id_featureName], [id_productCatalog], [value]) VALUES (5, 5, 0, N'TN')
INSERT [dbo].[featureValue] ([id_featureValue], [id_featureName], [id_productCatalog], [value]) VALUES (6, 6, 0, N'0')
INSERT [dbo].[featureValue] ([id_featureValue], [id_featureName], [id_productCatalog], [value]) VALUES (7, 7, 0, N'2.5')
SET IDENTITY_INSERT [dbo].[featureValue] OFF
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id_order], [id_orderStatus], [id_user], [id_productCatalog], [countProducts]) VALUES (0, 0, 0, 0, 2)
INSERT [dbo].[order] ([id_order], [id_orderStatus], [id_user], [id_productCatalog], [countProducts]) VALUES (1, 0, 0, 4, 1)
SET IDENTITY_INSERT [dbo].[order] OFF
SET IDENTITY_INSERT [dbo].[orderStatus] ON 

INSERT [dbo].[orderStatus] ([id_orderStatus], [nameOrderStatus]) VALUES (0, N'wait confirm')
INSERT [dbo].[orderStatus] ([id_orderStatus], [nameOrderStatus]) VALUES (1, N'
ready to ship')
INSERT [dbo].[orderStatus] ([id_orderStatus], [nameOrderStatus]) VALUES (2, N'in the way')
INSERT [dbo].[orderStatus] ([id_orderStatus], [nameOrderStatus]) VALUES (3, N'arrived at the destination')
INSERT [dbo].[orderStatus] ([id_orderStatus], [nameOrderStatus]) VALUES (4, N'canceled')
SET IDENTITY_INSERT [dbo].[orderStatus] OFF
SET IDENTITY_INSERT [dbo].[productCatalog] ON 

INSERT [dbo].[productCatalog] ([id_productCatalog], [id_typeOfGoods], [id_productStatus], [name], [description], [price], [img]) VALUES (0, 0, 0, N'Acer Aspire E 15 E5-575-33BM', N'Acer Aspire E5-575-33BM comes with these high level specs: 7th Generation Intel Core i3-7100U Processor (2.4GHz, 3MB L3 cache), Windows 10 Home, 15.6" Full HD Widescreen LED-backlit Display, Intel HD Graphics 620, 4GB DDR4 Memory, 1TB SATA Hard Drive (5400RPM), 8X DVD-Super Multi Double-Layer Drive (M-DISC enabled), Secure Digital (SD) card reader, High Definition Audio Support, 802.11ac Wi-Fi featuring MU-MIMO technology (Dual-Band 2.4GHz and 5GHz), Bluetooth 4.1, Gigabit Ethernet, Built-In HD Webcam (1280 x 720) supporting High Dynamic Range (HDR), 1 - USB 3.1 (Type C) port, 2 - USB 3.0 Ports (One with Power-off Charging), 1 - USB 2.0 Port, 1 - HDMI Port with HDCP support, 6-cell Li-ion Battery (2800 mAh), Up to 12-hours Battery Life, 5.27 lbs. | 2.39 kg (system unit only) (NX.GG5AA.005)', 30000, NULL)
INSERT [dbo].[productCatalog] ([id_productCatalog], [id_typeOfGoods], [id_productStatus], [name], [description], [price], [img]) VALUES (1, 0, 0, N'Lenovo Ideapad 15.6', N'15.6" display
Typical 1366 x 768 HD resolution. Energy-efficient LED backlight.

8GB system memory for advanced multitasking', 25000, NULL)
INSERT [dbo].[productCatalog] ([id_productCatalog], [id_typeOfGoods], [id_productStatus], [name], [description], [price], [img]) VALUES (2, 0, 0, N'Lenovo Ideapad 210s', N'Lenovo Ideapad 210s', 13000, NULL)
INSERT [dbo].[productCatalog] ([id_productCatalog], [id_typeOfGoods], [id_productStatus], [name], [description], [price], [img]) VALUES (3, 0, 0, N'ASUS FX503VM', N'ASUS FX503 is the compact and powerful Windows 10 laptop that packs the latest Standard Voltage Intel Core processor and NVIDIA GeForce GTX 10 Series graphics. A high capacity battery ensures you stay productive and entertained throughout the day, while the intelligent cooling system enables graphically-intense gaming sessions without throttling. And with its lightweight design, it''s easy to carry all the power and performance you need to play or produce, wherever you go!.', 70000, NULL)
INSERT [dbo].[productCatalog] ([id_productCatalog], [id_typeOfGoods], [id_productStatus], [name], [description], [price], [img]) VALUES (4, 0, 0, N'ASUS VivoBook F510UA', N'The ASUS VivoBook F510UA is the perfect combination of performance and function. The F510UA is a Windows 10 laptop powered by an 8th Generation Intel Core i5-8250U processor, 8GB DDR4 RAM, and ASUS NanoEdge display technology. It''s the ideal laptop for daily computing and entertainment.', 40000, NULL)
INSERT [dbo].[productCatalog] ([id_productCatalog], [id_typeOfGoods], [id_productStatus], [name], [description], [price], [img]) VALUES (5, 0, 0, N'Lenovo Thinkpad T430', NULL, 25000, NULL)
INSERT [dbo].[productCatalog] ([id_productCatalog], [id_typeOfGoods], [id_productStatus], [name], [description], [price], [img]) VALUES (6, 0, 0, N'Lenovo ideaPad Y700', N'This item Newest Lenovo ideaPad Y700 15.6" Anti-Glare FHD (1920x1080) IPS Gaming Laptop PC, Intel Quad Core i5-6300HQ 2.3GHz, 8GB DDR4, 1TB HDD + 128GB SSD, NVIDIA GeForce GTX 960M GDDR5 4GB, Windows 10', 59000, NULL)
SET IDENTITY_INSERT [dbo].[productCatalog] OFF
SET IDENTITY_INSERT [dbo].[productStatus] ON 

INSERT [dbo].[productStatus] ([id_productStatus], [productStatus]) VALUES (0, N'in stock')
INSERT [dbo].[productStatus] ([id_productStatus], [productStatus]) VALUES (1, N'not available')
INSERT [dbo].[productStatus] ([id_productStatus], [productStatus]) VALUES (2, N'on request')
SET IDENTITY_INSERT [dbo].[productStatus] OFF
SET IDENTITY_INSERT [dbo].[typeOfGoods] ON 

INSERT [dbo].[typeOfGoods] ([id_typeOfGoods], [nameTypeOfGoods]) VALUES (0, N'computer')
INSERT [dbo].[typeOfGoods] ([id_typeOfGoods], [nameTypeOfGoods]) VALUES (1, N'headphones')
SET IDENTITY_INSERT [dbo].[typeOfGoods] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id_user], [id_userStatus], [fullname], [mail], [telephone], [address], [password]) VALUES (0, 0, N'ADMIN', N'admin@mail.ru', N'89109109192', N'adminskaya d.5', N'admin')
SET IDENTITY_INSERT [dbo].[users] OFF
SET IDENTITY_INSERT [dbo].[userStatus] ON 

INSERT [dbo].[userStatus] ([id_userStatus], [nameUserStatus]) VALUES (0, N'Admin')
INSERT [dbo].[userStatus] ([id_userStatus], [nameUserStatus]) VALUES (1, N'User')
INSERT [dbo].[userStatus] ([id_userStatus], [nameUserStatus]) VALUES (2, N'Moderator')
SET IDENTITY_INSERT [dbo].[userStatus] OFF
/****** Object:  Index [PK_COMMENT]    Script Date: 23.04.2018 21:53:25 ******/
ALTER TABLE [dbo].[comment] ADD  CONSTRAINT [PK_COMMENT] PRIMARY KEY NONCLUSTERED 
(
	[id_comment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_FEATURENAME]    Script Date: 23.04.2018 21:53:25 ******/
ALTER TABLE [dbo].[featureName] ADD  CONSTRAINT [PK_FEATURENAME] PRIMARY KEY NONCLUSTERED 
(
	[id_featureName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_FEATUREVALUE]    Script Date: 23.04.2018 21:53:25 ******/
ALTER TABLE [dbo].[featureValue] ADD  CONSTRAINT [PK_FEATUREVALUE] PRIMARY KEY NONCLUSTERED 
(
	[id_featureValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ORDER]    Script Date: 23.04.2018 21:53:25 ******/
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [PK_ORDER] PRIMARY KEY NONCLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ORDERSTATUS]    Script Date: 23.04.2018 21:53:25 ******/
ALTER TABLE [dbo].[orderStatus] ADD  CONSTRAINT [PK_ORDERSTATUS] PRIMARY KEY NONCLUSTERED 
(
	[id_orderStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PRODUCTCATALOG]    Script Date: 23.04.2018 21:53:25 ******/
ALTER TABLE [dbo].[productCatalog] ADD  CONSTRAINT [PK_PRODUCTCATALOG] PRIMARY KEY NONCLUSTERED 
(
	[id_productCatalog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_PRODUCTSTATUS]    Script Date: 23.04.2018 21:53:25 ******/
ALTER TABLE [dbo].[productStatus] ADD  CONSTRAINT [PK_PRODUCTSTATUS] PRIMARY KEY NONCLUSTERED 
(
	[id_productStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_TYPEOFGOODS]    Script Date: 23.04.2018 21:53:25 ******/
ALTER TABLE [dbo].[typeOfGoods] ADD  CONSTRAINT [PK_TYPEOFGOODS] PRIMARY KEY NONCLUSTERED 
(
	[id_typeOfGoods] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_USERS]    Script Date: 23.04.2018 21:53:25 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [PK_USERS] PRIMARY KEY NONCLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_USERS_UNIQUE]    Script Date: 23.04.2018 21:53:25 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [PK_USERS_UNIQUE] UNIQUE NONCLUSTERED 
(
	[mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_USERSTATUS]    Script Date: 23.04.2018 21:53:25 ******/
ALTER TABLE [dbo].[userStatus] ADD  CONSTRAINT [PK_USERSTATUS] PRIMARY KEY NONCLUSTERED 
(
	[id_userStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_productCatalog] FOREIGN KEY([id_productCatalog])
REFERENCES [dbo].[productCatalog] ([id_productCatalog])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_productCatalog]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_users]
GO
ALTER TABLE [dbo].[featureName]  WITH CHECK ADD  CONSTRAINT [FK_featureName_typeOfGoods] FOREIGN KEY([id_typeOfGoods])
REFERENCES [dbo].[typeOfGoods] ([id_typeOfGoods])
GO
ALTER TABLE [dbo].[featureName] CHECK CONSTRAINT [FK_featureName_typeOfGoods]
GO
ALTER TABLE [dbo].[featureValue]  WITH CHECK ADD  CONSTRAINT [FK_featureValue_featureName] FOREIGN KEY([id_featureName])
REFERENCES [dbo].[featureName] ([id_featureName])
GO
ALTER TABLE [dbo].[featureValue] CHECK CONSTRAINT [FK_featureValue_featureName]
GO
ALTER TABLE [dbo].[featureValue]  WITH CHECK ADD  CONSTRAINT [FK_featureValue_productCatalog] FOREIGN KEY([id_productCatalog])
REFERENCES [dbo].[productCatalog] ([id_productCatalog])
GO
ALTER TABLE [dbo].[featureValue] CHECK CONSTRAINT [FK_featureValue_productCatalog]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_orderStatus1] FOREIGN KEY([id_orderStatus])
REFERENCES [dbo].[orderStatus] ([id_orderStatus])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_orderStatus1]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_productCatalog] FOREIGN KEY([id_productCatalog])
REFERENCES [dbo].[productCatalog] ([id_productCatalog])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_productCatalog]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_users]
GO
ALTER TABLE [dbo].[productCatalog]  WITH CHECK ADD  CONSTRAINT [FK_productCatalog_productStatus1] FOREIGN KEY([id_productStatus])
REFERENCES [dbo].[productStatus] ([id_productStatus])
GO
ALTER TABLE [dbo].[productCatalog] CHECK CONSTRAINT [FK_productCatalog_productStatus1]
GO
ALTER TABLE [dbo].[productCatalog]  WITH CHECK ADD  CONSTRAINT [FK_productCatalog_typeOfGoods] FOREIGN KEY([id_typeOfGoods])
REFERENCES [dbo].[typeOfGoods] ([id_typeOfGoods])
GO
ALTER TABLE [dbo].[productCatalog] CHECK CONSTRAINT [FK_productCatalog_typeOfGoods]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_userStatus] FOREIGN KEY([id_userStatus])
REFERENCES [dbo].[userStatus] ([id_userStatus])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_userStatus]
GO
/****** Object:  StoredProcedure [dbo].[AddComment]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddComment]
@user INT,
@product INT,
@comment TEXT
AS
INSERT INTO [comment]
           ([id_user]
           ,[id_productCatalog]
           ,[textComment])
     VALUES (@user,@product,@comment)

GO
/****** Object:  StoredProcedure [dbo].[AddNewOrder]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewOrder] --Добавить заказ
	@status INT,
	@user INT,
	@product INT,
	@count int
	AS
INSERT INTO [order]
           ([id_orderStatus]
           ,[id_user]
           ,[id_productCatalog]
           ,[countProducts])
     VALUES (@status,@user,@product,@count)
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewUser]
	@status INT,
	@fullname varchar(100),
	@mail varchar(100),
	@telephone varchar(20),
	@address varchar(200),
	@password varchar(100)
	AS
INSERT INTO [users]
           ([id_userStatus]
           ,[fullname]
           ,[mail]
           ,[telephone]
           ,[address]
           ,[password])
     VALUES (@status,@fullname,@mail,@telephone,@address,@password)

GO
/****** Object:  StoredProcedure [dbo].[SelectCommentForProduct]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCommentForProduct]
@idProd INT
AS
SELECT [users].mail,[comment].textComment
FROM [comment] INNER JOIN [users]
ON [comment].id_user = [users].id_user
WHERE [comment].id_productCatalog = @idProd

GO
/****** Object:  StoredProcedure [dbo].[SelectOrdersForAdmin]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectOrdersForAdmin]
AS
SELECT [users].mail,[users].telephone,[productCatalog].name,[productCatalog].price,[order].countProducts,([productCatalog].price * [order].countProducts) AS 'total cost', [orderStatus].nameOrderStatus
FROM (([order] INNER JOIN [orderStatus] 
ON [order].id_orderStatus = [orderStatus].id_orderStatus) INNER JOIN [users]
ON [users].id_user = [order].id_user) INNER JOIN [productCatalog]
ON [productCatalog].id_productCatalog = [order].id_productCatalog
GO
/****** Object:  StoredProcedure [dbo].[SelectOrdersForUser]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectOrdersForUser] --Все заказы пользователя
@user INT
AS
SELECT [productCatalog].name,[productCatalog].price,[order].countProducts,([productCatalog].price * [order].countProducts) AS 'total cost', [orderStatus].nameOrderStatus
FROM ([order] INNER JOIN [orderStatus] 
ON [order].id_orderStatus = [orderStatus].id_orderStatus) INNER JOIN [productCatalog]
ON [productCatalog].id_productCatalog = [order].id_productCatalog
WHERE [order].id_user = @user

GO
/****** Object:  StoredProcedure [dbo].[SelectProduct]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectProduct]
	@IdProd INT
	AS
SELECT productCatalog.name, featureName.name, featureValue.value
FROM (featureValue INNER JOIN productCatalog 
ON featureValue.id_productCatalog = productCatalog.id_productCatalog) INNER JOIN featureName 
ON featureName.id_featureName = featureValue.id_featureName
WHERE productCatalog.id_productCatalog = @IdProd
GO
/****** Object:  StoredProcedure [dbo].[SelectProductList]    Script Date: 23.04.2018 21:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectProductList]
	AS
	SELECT productCatalog.name,productCatalog.description,productCatalog.img,productCatalog.price
	FROM productCatalog

GO
USE [master]
GO
ALTER DATABASE [shop] SET  READ_WRITE 
GO
