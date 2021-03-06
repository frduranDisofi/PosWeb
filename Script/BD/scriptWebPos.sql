USE [master]
GO
/****** Object:  Database [PosWeb]    Script Date: 22-12-2019 21:52:55 ******/
CREATE DATABASE [PosWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PosWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PosWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PosWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PosWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PosWeb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PosWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PosWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PosWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PosWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PosWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PosWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [PosWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PosWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PosWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PosWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PosWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PosWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PosWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PosWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PosWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PosWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PosWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PosWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PosWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PosWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PosWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PosWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PosWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PosWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [PosWeb] SET  MULTI_USER 
GO
ALTER DATABASE [PosWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PosWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PosWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PosWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PosWeb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PosWeb', N'ON'
GO
ALTER DATABASE [PosWeb] SET QUERY_STORE = OFF
GO
USE [PosWeb]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 22-12-2019 21:52:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Clase] [varchar](250) NULL,
	[PieMenu] [varchar](250) NULL,
	[Titulo] [varchar](250) NULL,
	[Action] [varchar](250) NULL,
	[Controller] [varchar](250) NULL,
	[Perfil] [int] NULL,
	[Activo] [int] NULL,
	[Orden] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 22-12-2019 21:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22-12-2019 21:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Email] [varchar](250) NULL,
	[Perfil] [int] NULL,
	[Nombre] [varchar](250) NULL,
	[Estado] [int] NOT NULL,
	[Contrasena] [varchar](max) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [Clase], [PieMenu], [Titulo], [Action], [Controller], [Perfil], [Activo], [Orden]) VALUES (1, N'fa fa-cutlery', N'Productos', N'Agregar Producto', N'Productos', N'AgregarProducto', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Perfil] ON 

INSERT [dbo].[Perfil] ([Id], [Descripcion]) VALUES (1, N'Administrador')
SET IDENTITY_INSERT [dbo].[Perfil] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Usuario], [Email], [Perfil], [Nombre], [Estado], [Contrasena]) VALUES (1, N'Admin', N'demo@demo.cl', 1, N'Administrador', 1, N'81dc9bdb52d04dc20036dbd8313ed055')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Estado]  DEFAULT ((1)) FOR [Estado]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_LOGIN]    Script Date: 22-12-2019 21:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GET_LOGIN]
(
	@Usuario VARCHAR(200)
,	@Contrasena VARCHAR(200)
)
AS
BEGIN
	DECLARE	@lb_Verificador BIT
	DECLARE	@li_Id INT
	DECLARE	@lv_Mensaje VARCHAR(MAX)

	DECLARE	@lb_Estado BIT
	DECLARE	@lv_Contrasena VARCHAR(MAX)
	DECLARE	@lv_Usuario VARCHAR(MAX)
	DECLARE @lv_Perfil int

	SELECT	@lb_Verificador = 0
	,		@lv_Mensaje = 'Error de usuario y/o contrasena'
	
	SELECT	@li_Id = Id
	,		@lb_Estado = Estado
	,		@lv_Contrasena = Contrasena
	,       @lv_Usuario = Usuario
	,       @lv_Perfil = Perfil
	FROM	Usuarios
	WHERE	Usuario = @Usuario

	IF @lb_Estado IS NOT NULL BEGIN
		IF @lb_Estado = 1 BEGIN
			IF @lv_Contrasena = @Contrasena BEGIN
				SELECT	@lb_Verificador = 1
				,		@lv_Mensaje = 'Usuario autorizado'
			END
			ELSE BEGIN
				SELECT	@lb_Verificador = 0
				,		@lv_Mensaje = 'Error de usuario y/o contrasena'
			END
		END
		ELSE BEGIN
			SELECT	@lb_Verificador = 0
			,		@lv_Mensaje = 'Usuario desactivado'
		END
	END
	ELSE BEGIN
		SELECT	@lb_Verificador = 0
		,		@lv_Mensaje = 'Error de usuario y/o contrasena'
	END
	
	SELECT	Id = @li_Id
	,		Verificador = @lb_Verificador
	,		Mensaje = @lv_Mensaje
	,		Usuario = @lv_Usuario	
	,		Perfil = @lv_Perfil
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_Menu]    Script Date: 22-12-2019 21:52:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GET_Menu]
@Perfil INT
as  
SELECT m.Id,m.Clase,m.PieMenu,m.Titulo,m.[Action],m.Controller
from Menu m 
where m.Perfil = @Perfil and m.Activo = 1 order by m.Orden 
GO
USE [master]
GO
ALTER DATABASE [PosWeb] SET  READ_WRITE 
GO
