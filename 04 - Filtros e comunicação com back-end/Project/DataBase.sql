USE [master]
GO
/****** Object:  Database [AngularJs_Course]    Script Date: 6/28/2019 3:01:17 PM ******/
CREATE DATABASE [AngularJs_Course]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AngularJs_Course', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\AngularJs_Course.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AngularJs_Course_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\AngularJs_Course_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AngularJs_Course] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AngularJs_Course].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AngularJs_Course] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AngularJs_Course] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AngularJs_Course] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AngularJs_Course] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AngularJs_Course] SET ARITHABORT OFF 
GO
ALTER DATABASE [AngularJs_Course] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AngularJs_Course] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AngularJs_Course] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AngularJs_Course] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AngularJs_Course] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AngularJs_Course] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AngularJs_Course] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AngularJs_Course] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AngularJs_Course] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AngularJs_Course] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AngularJs_Course] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AngularJs_Course] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AngularJs_Course] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AngularJs_Course] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AngularJs_Course] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AngularJs_Course] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AngularJs_Course] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AngularJs_Course] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AngularJs_Course] SET  MULTI_USER 
GO
ALTER DATABASE [AngularJs_Course] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AngularJs_Course] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AngularJs_Course] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AngularJs_Course] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AngularJs_Course] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AngularJs_Course] SET QUERY_STORE = OFF
GO
USE [AngularJs_Course]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 6/28/2019 3:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Nome] [varchar](100) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pais] [varchar](5) NULL,
	[DataInscricao] [datetime] NULL,
	[Mensalidade] [decimal](18, 2) NULL,
	[Idade] [int] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 6/28/2019 3:01:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[Nome] [varchar](100) NULL,
	[Sigla] [varchar](5) NULL,
	[Regiao] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([Nome], [Id], [Pais], [DataInscricao], [Mensalidade], [Idade]) VALUES (N'Jane Doe', 1, N'BR', CAST(N'2017-06-15T00:00:00.000' AS DateTime), CAST(16.00 AS Decimal(18, 2)), 28)
GO
INSERT [dbo].[Clientes] ([Nome], [Id], [Pais], [DataInscricao], [Mensalidade], [Idade]) VALUES (N'James Blunt', 2, N'CA', CAST(N'2018-08-11T00:00:00.000' AS DateTime), CAST(180.00 AS Decimal(18, 2)), 37)
GO
INSERT [dbo].[Clientes] ([Nome], [Id], [Pais], [DataInscricao], [Mensalidade], [Idade]) VALUES (N'Leonardo', 4, N'PE', CAST(N'2019-06-28T16:58:17.380' AS DateTime), CAST(50.15 AS Decimal(18, 2)), 25)
GO
INSERT [dbo].[Clientes] ([Nome], [Id], [Pais], [DataInscricao], [Mensalidade], [Idade]) VALUES (N'Vitor', 5, N'USA', CAST(N'2019-06-28T17:17:35.137' AS DateTime), CAST(50.15 AS Decimal(18, 2)), 20)
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
INSERT [dbo].[Paises] ([Nome], [Sigla], [Regiao]) VALUES (N'Brasil', N'BR', N'América do Sul')
GO
INSERT [dbo].[Paises] ([Nome], [Sigla], [Regiao]) VALUES (N'Peru', N'PE', N'América do Sul')
GO
INSERT [dbo].[Paises] ([Nome], [Sigla], [Regiao]) VALUES (N'Chile', N'CL', N'América do Sul')
GO
INSERT [dbo].[Paises] ([Nome], [Sigla], [Regiao]) VALUES (N'Estados Unidos da América', N'USA', N'América do Norte')
GO
INSERT [dbo].[Paises] ([Nome], [Sigla], [Regiao]) VALUES (N'Canada', N'CA', N'América do Norte')
GO
USE [master]
GO
ALTER DATABASE [AngularJs_Course] SET  READ_WRITE 
GO
