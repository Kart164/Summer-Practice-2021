USE [master]
GO

/****** Object:  Database [Epam.Shops]    Script Date: 12.07.2021 16:23:53 ******/
CREATE DATABASE [Epam.Shops]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Epam.Shops', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Epam.Shops.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Epam.Shops_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Epam.Shops_log.ldf' , SIZE = 8192KB , MAXSIZE = 4194304KB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Epam.Shops].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Epam.Shops] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Epam.Shops] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Epam.Shops] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Epam.Shops] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Epam.Shops] SET ARITHABORT OFF 
GO

ALTER DATABASE [Epam.Shops] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Epam.Shops] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Epam.Shops] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Epam.Shops] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Epam.Shops] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Epam.Shops] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Epam.Shops] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Epam.Shops] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Epam.Shops] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Epam.Shops] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Epam.Shops] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Epam.Shops] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Epam.Shops] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Epam.Shops] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Epam.Shops] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Epam.Shops] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Epam.Shops] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Epam.Shops] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Epam.Shops] SET  MULTI_USER 
GO

ALTER DATABASE [Epam.Shops] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Epam.Shops] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Epam.Shops] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Epam.Shops] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Epam.Shops] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Epam.Shops] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Epam.Shops] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Epam.Shops] SET  READ_WRITE 
GO



USE [Epam.Shops]
GO

/****** Object:  Table [dbo].[Adresses]    Script Date: 12.07.2021 16:24:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Adresses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[street] [nvarchar](50) NOT NULL,
	[building] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Adresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [Epam.Shops]
GO

/****** Object:  Table [dbo].[Roles]    Script Date: 12.07.2021 16:25:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [Epam.Shops]
GO

/****** Object:  Table [dbo].[Shop_Types]    Script Date: 12.07.2021 16:25:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Shop_Types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Shop_Types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [Epam.Shops]
GO

/****** Object:  Table [dbo].[Store_Chains]    Script Date: 12.07.2021 16:25:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Store_Chains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Store_Chains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [AK_Name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




USE [Epam.Shops]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 12.07.2021 16:26:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[email] [nvarchar](50) NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role])
REFERENCES [dbo].[Roles] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO



USE [Epam.Shops]
GO

/****** Object:  Table [dbo].[Shops]    Script Date: 12.07.2021 16:27:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Shops](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adress] [int] NOT NULL,
	[store_chain] [int] NOT NULL,
	[shop_type] [int] NOT NULL,
	[avg_rating] [float] NOT NULL,
 CONSTRAINT [PK_Shops] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Shops] ADD  CONSTRAINT [DF_Shops_avg_rating]  DEFAULT ((0)) FOR [avg_rating]
GO

ALTER TABLE [dbo].[Shops]  WITH CHECK ADD  CONSTRAINT [FK_Shops_Adresses] FOREIGN KEY([adress])
REFERENCES [dbo].[Adresses] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Shops] CHECK CONSTRAINT [FK_Shops_Adresses]
GO

ALTER TABLE [dbo].[Shops]  WITH CHECK ADD  CONSTRAINT [FK_Shops_Shop_Types] FOREIGN KEY([shop_type])
REFERENCES [dbo].[Shop_Types] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Shops] CHECK CONSTRAINT [FK_Shops_Shop_Types]
GO

ALTER TABLE [dbo].[Shops]  WITH CHECK ADD  CONSTRAINT [FK_Shops_Store_Chains] FOREIGN KEY([store_chain])
REFERENCES [dbo].[Store_Chains] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Shops] CHECK CONSTRAINT [FK_Shops_Store_Chains]
GO



USE [Epam.Shops]
GO

/****** Object:  Table [dbo].[Reviews]    Script Date: 12.07.2021 16:28:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[shop_id] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
	[review_text] [text] NOT NULL,
	[score] [smallint] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Shops] FOREIGN KEY([shop_id])
REFERENCES [dbo].[Shops] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Shops]
GO

ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users] FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
ON UPDATE CASCADE
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users]
GO



insert Roles Values ('admin')
insert Roles Values ('user')
insert Roles Values ('shop admin')

insert Shop_Types Values ('food shop')
insert Shop_Types Values ('household shop')
insert Shop_Types Values ('supermarket')
insert Shop_Types Values ('clothes shop')
insert Shop_Types Values ('hardware store')
insert Shop_Types Values ('drugstore')

insert Adresses Values ('Russia','Saratov','Chernyshevsky N. G. str.','6')
insert Adresses Values ('Russia','Saratov','Chapaev str.','14/26')

insert Store_Chains values ('Apteka64+')
insert Store_Chains values ('Pyaterochka')

insert [Epam.Shops].[dbo].[Shops] values(2,1,6,default)
insert [Epam.Shops].[dbo].[Shops] values(1,2,3,default)

insert Users values ('admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',null,1)

insert Reviews values (1, 'admin', 'fkofgkoeke', 4)
insert Reviews values (2, 'admin', 'fkofgkfdsfeoeke', 5)
exec UpdateShopScore 1
exec UpdateShopScore 2