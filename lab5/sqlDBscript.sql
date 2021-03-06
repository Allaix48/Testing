USE [master]
GO
/****** Object:  Database [TestingBase]    Script Date: 24.05.2021 14:43:25 ******/
CREATE DATABASE [TestingBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestingBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestingBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestingBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestingBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestingBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestingBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestingBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestingBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestingBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestingBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestingBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestingBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestingBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestingBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestingBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestingBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestingBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestingBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestingBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestingBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestingBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestingBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestingBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestingBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestingBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestingBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestingBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestingBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestingBase] SET RECOVERY FULL 
GO
ALTER DATABASE [TestingBase] SET  MULTI_USER 
GO
ALTER DATABASE [TestingBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestingBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestingBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestingBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestingBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestingBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestingBase', N'ON'
GO
ALTER DATABASE [TestingBase] SET QUERY_STORE = OFF
GO
USE [TestingBase]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 24.05.2021 14:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Number] [nvarchar](50) NOT NULL,
	[Brand] [nvarchar](50) NOT NULL,
	[Cost] [int] NOT NULL,
	[CostPerDay] [int] NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 24.05.2021 14:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[FirstName] [nvarchar](50) NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [TestingBase] SET  READ_WRITE 
GO
