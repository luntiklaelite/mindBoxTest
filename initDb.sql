USE [master]
GO
/****** Object:  Database [mindbox]    Script Date: 03.09.2023 14:21:53 ******/
CREATE DATABASE [mindbox]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mindbox', FILENAME = N'D:\MSSQLServer\MSSQL15.SQLEXPRESS\MSSQL\DATA\mindbox.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mindbox_log', FILENAME = N'D:\MSSQLServer\MSSQL15.SQLEXPRESS\MSSQL\DATA\mindbox_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mindbox] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mindbox].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mindbox] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mindbox] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mindbox] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mindbox] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mindbox] SET ARITHABORT OFF 
GO
ALTER DATABASE [mindbox] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mindbox] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mindbox] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mindbox] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mindbox] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mindbox] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mindbox] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mindbox] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mindbox] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mindbox] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mindbox] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mindbox] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mindbox] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mindbox] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mindbox] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mindbox] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mindbox] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mindbox] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mindbox] SET  MULTI_USER 
GO
ALTER DATABASE [mindbox] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mindbox] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mindbox] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mindbox] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mindbox] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mindbox] SET QUERY_STORE = OFF
GO
USE [mindbox]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 03.09.2023 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id_category] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 03.09.2023 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_With_Categories]    Script Date: 03.09.2023 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_With_Categories](
	[id_product] [int] NOT NULL,
	[id_category] [int] NOT NULL,
 CONSTRAINT [PK_Products_With_Categories] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC,
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([id_category], [name]) VALUES (1, N'Фрукты')
GO
INSERT [dbo].[Categories] ([id_category], [name]) VALUES (2, N'Овощи')
GO
INSERT [dbo].[Categories] ([id_category], [name]) VALUES (3, N'Специи')
GO
INSERT [dbo].[Categories] ([id_category], [name]) VALUES (4, N'Напитки')
GO
INSERT [dbo].[Categories] ([id_category], [name]) VALUES (5, N'Энергетики')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([id_product], [name]) VALUES (1, N'Яблоко')
GO
INSERT [dbo].[Products] ([id_product], [name]) VALUES (2, N'Морковь')
GO
INSERT [dbo].[Products] ([id_product], [name]) VALUES (3, N'Авокадо')
GO
INSERT [dbo].[Products] ([id_product], [name]) VALUES (4, N'Спрайт')
GO
INSERT [dbo].[Products] ([id_product], [name]) VALUES (5, N'Оп оп оп адриналайн')
GO
INSERT [dbo].[Products] ([id_product], [name]) VALUES (6, N'Маска "Валакас"')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Products_With_Categories] ([id_product], [id_category]) VALUES (1, 1)
GO
INSERT [dbo].[Products_With_Categories] ([id_product], [id_category]) VALUES (2, 2)
GO
INSERT [dbo].[Products_With_Categories] ([id_product], [id_category]) VALUES (3, 1)
GO
INSERT [dbo].[Products_With_Categories] ([id_product], [id_category]) VALUES (3, 2)
GO
INSERT [dbo].[Products_With_Categories] ([id_product], [id_category]) VALUES (4, 4)
GO
INSERT [dbo].[Products_With_Categories] ([id_product], [id_category]) VALUES (5, 4)
GO
INSERT [dbo].[Products_With_Categories] ([id_product], [id_category]) VALUES (5, 5)
GO
ALTER TABLE [dbo].[Products_With_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Products_With_Categories_Categories] FOREIGN KEY([id_category])
REFERENCES [dbo].[Categories] ([id_category])
GO
ALTER TABLE [dbo].[Products_With_Categories] CHECK CONSTRAINT [FK_Products_With_Categories_Categories]
GO
ALTER TABLE [dbo].[Products_With_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Products_With_Categories_Products] FOREIGN KEY([id_product])
REFERENCES [dbo].[Products] ([id_product])
GO
ALTER TABLE [dbo].[Products_With_Categories] CHECK CONSTRAINT [FK_Products_With_Categories_Products]
GO
USE [master]
GO
ALTER DATABASE [mindbox] SET  READ_WRITE 
GO
