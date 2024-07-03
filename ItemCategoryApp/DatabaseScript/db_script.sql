USE [master]
GO
/****** Object:  Database [CategoryItemDB]    Script Date: 7/3/2024 5:05:52 PM ******/
CREATE DATABASE [CategoryItemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CategoryItemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\CategoryItemDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CategoryItemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\CategoryItemDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CategoryItemDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CategoryItemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CategoryItemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CategoryItemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CategoryItemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CategoryItemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CategoryItemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CategoryItemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CategoryItemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CategoryItemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CategoryItemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CategoryItemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CategoryItemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CategoryItemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CategoryItemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CategoryItemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CategoryItemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CategoryItemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CategoryItemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CategoryItemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CategoryItemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CategoryItemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CategoryItemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CategoryItemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CategoryItemDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CategoryItemDB] SET  MULTI_USER 
GO
ALTER DATABASE [CategoryItemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CategoryItemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CategoryItemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CategoryItemDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CategoryItemDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CategoryItemDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CategoryItemDB', N'ON'
GO
ALTER DATABASE [CategoryItemDB] SET QUERY_STORE = OFF
GO
USE [CategoryItemDB]
GO
/****** Object:  Table [dbo].[ApplicationUser]    Script Date: 7/3/2024 5:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUser](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](35) NOT NULL,
	[UserFullName] [varchar](100) NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordSalt] [nvarchar](128) NULL,
	[EmployeeID] [nvarchar](128) NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[Email] [varchar](50) NULL,
	[ContactNo] [varchar](50) NULL,
	[SetDate] [datetime] NOT NULL,
	[EntryUserName] [varchar](35) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/3/2024 5:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 7/3/2024 5:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[ItemUnit] [nvarchar](50) NULL,
	[ItemQuantity] [int] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleWiseScreenPermission]    Script Date: 7/3/2024 5:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleWiseScreenPermission](
	[SL] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ScreenCode] [char](5) NOT NULL,
	[AccessRightCode] [char](4) NULL,
	[IsCreate] [bit] NULL,
	[IsRead] [bit] NULL,
	[IsUpdate] [bit] NULL,
	[IsDelete] [bit] NULL,
	[EntryDate] [datetime] NOT NULL,
	[EntryUser] [varchar](35) NOT NULL,
 CONSTRAINT [PK_RoleWiseScreenPermission] PRIMARY KEY CLUSTERED 
(
	[SL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Screen]    Script Date: 7/3/2024 5:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Screen](
	[ScreenCode] [char](5) NOT NULL,
	[ScreenName] [varchar](100) NOT NULL,
	[ModuleId] [char](2) NULL,
	[Scope] [tinyint] NOT NULL,
	[URL] [varchar](512) NOT NULL,
	[ParentScreenCode] [char](5) NOT NULL,
	[Description] [varchar](512) NULL,
	[IsRequiredForApproval] [bit] NOT NULL,
	[IsFinancialScreen] [bit] NOT NULL,
	[IsEmailNotificationSend] [bit] NULL,
	[Manager] [varchar](max) NULL,
	[MenuIcon] [varchar](50) NULL,
	[SetDate] [datetime] NOT NULL,
	[UserName] [varchar](35) NOT NULL,
 CONSTRAINT [PK_Screen] PRIMARY KEY CLUSTERED 
(
	[ScreenCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoleList]    Script Date: 7/3/2024 5:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleList](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[RoleFlag] [varchar](3) NOT NULL,
	[RoleDescription] [varchar](500) NULL,
	[SetDate] [datetime] NOT NULL,
	[UserName] [varchar](35) NOT NULL,
 CONSTRAINT [PK_UserRoleList] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApplicationUser] ON 
GO
INSERT [dbo].[ApplicationUser] ([UserId], [UserName], [UserFullName], [Password], [PasswordSalt], [EmployeeID], [RoleId], [IsActive], [IsLockedOut], [Email], [ContactNo], [SetDate], [EntryUserName]) VALUES (1, N'admin', N'Admin', N'123456', NULL, N'0', 1, 1, 0, N'mahabub@email.com', N'00', CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'sa')
GO
INSERT [dbo].[ApplicationUser] ([UserId], [UserName], [UserFullName], [Password], [PasswordSalt], [EmployeeID], [RoleId], [IsActive], [IsLockedOut], [Email], [ContactNo], [SetDate], [EntryUserName]) VALUES (8, N'general', N'General', N'123456', NULL, N'0', 2, 1, 0, N'mahabub@email.com', N'00', CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'sa')
GO
SET IDENTITY_INSERT [dbo].[ApplicationUser] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleWiseScreenPermission] ON 
GO
INSERT [dbo].[RoleWiseScreenPermission] ([SL], [RoleId], [ScreenCode], [AccessRightCode], [IsCreate], [IsRead], [IsUpdate], [IsDelete], [EntryDate], [EntryUser]) VALUES (2020, 1, N'01001', N'1111', 0, 0, 0, 0, CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'sa')
GO
INSERT [dbo].[RoleWiseScreenPermission] ([SL], [RoleId], [ScreenCode], [AccessRightCode], [IsCreate], [IsRead], [IsUpdate], [IsDelete], [EntryDate], [EntryUser]) VALUES (2021, 1, N'01002', N'1111', 0, 0, 0, 0, CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'sa')
GO
INSERT [dbo].[RoleWiseScreenPermission] ([SL], [RoleId], [ScreenCode], [AccessRightCode], [IsCreate], [IsRead], [IsUpdate], [IsDelete], [EntryDate], [EntryUser]) VALUES (2022, 2, N'01002', N'1111', 0, 0, 0, 0, CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'sa')
GO
SET IDENTITY_INSERT [dbo].[RoleWiseScreenPermission] OFF
GO
INSERT [dbo].[Screen] ([ScreenCode], [ScreenName], [ModuleId], [Scope], [URL], [ParentScreenCode], [Description], [IsRequiredForApproval], [IsFinancialScreen], [IsEmailNotificationSend], [Manager], [MenuIcon], [SetDate], [UserName]) VALUES (N'01001', N'Category', N'01', 1, N'/User/CreateUser', N'01001', NULL, 0, 0, 0, N'0', N'far fa-circle nav-icon', CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'sa')
GO
INSERT [dbo].[Screen] ([ScreenCode], [ScreenName], [ModuleId], [Scope], [URL], [ParentScreenCode], [Description], [IsRequiredForApproval], [IsFinancialScreen], [IsEmailNotificationSend], [Manager], [MenuIcon], [SetDate], [UserName]) VALUES (N'01002', N'Items', N'01', 1, N'/User/Users', N'01002', NULL, 0, 0, 0, N'0', N'far fa-circle nav-icon', CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'sa')
GO
SET IDENTITY_INSERT [dbo].[UserRoleList] ON 
GO
INSERT [dbo].[UserRoleList] ([RoleID], [RoleName], [RoleFlag], [RoleDescription], [SetDate], [UserName]) VALUES (1, N'Admin', N'A', N'Admin', CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'sa')
GO
INSERT [dbo].[UserRoleList] ([RoleID], [RoleName], [RoleFlag], [RoleDescription], [SetDate], [UserName]) VALUES (2, N'General', N'G', N'General role', CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'sa')
GO
SET IDENTITY_INSERT [dbo].[UserRoleList] OFF
GO
/****** Object:  Index [PK_UserList]    Script Date: 7/3/2024 5:05:52 PM ******/
ALTER TABLE [dbo].[ApplicationUser] ADD  CONSTRAINT [PK_UserList] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserList]    Script Date: 7/3/2024 5:05:52 PM ******/
ALTER TABLE [dbo].[ApplicationUser] ADD  CONSTRAINT [IX_UserList] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Screen] ADD  CONSTRAINT [DF_Screen_ScreenCode]  DEFAULT ('false') FOR [ScreenCode]
GO
ALTER TABLE [dbo].[Screen] ADD  CONSTRAINT [DF_Screen_IsRequiredForApproval]  DEFAULT ((0)) FOR [IsRequiredForApproval]
GO
ALTER TABLE [dbo].[Screen] ADD  CONSTRAINT [DF_Screen_IsFinancialScreen_1]  DEFAULT ((0)) FOR [IsFinancialScreen]
GO
ALTER TABLE [dbo].[Screen] ADD  CONSTRAINT [DF_Screen_Manager]  DEFAULT ((0)) FOR [Manager]
GO
ALTER TABLE [dbo].[ApplicationUser]  WITH CHECK ADD  CONSTRAINT [FK_UserList_UserRoleList] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRoleList] ([RoleID])
GO
ALTER TABLE [dbo].[ApplicationUser] CHECK CONSTRAINT [FK_UserList_UserRoleList]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A= Admin ; C=Customer ; O=other user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserRoleList', @level2type=N'COLUMN',@level2name=N'RoleFlag'
GO
USE [master]
GO
ALTER DATABASE [CategoryItemDB] SET  READ_WRITE 
GO
