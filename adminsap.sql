USE [master]
GO
/****** Object:  Database [adminasp]    Script Date: 2/27/2018 7:33:18 PM ******/
CREATE DATABASE [adminasp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'adminasp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\adminasp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'adminasp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\adminasp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [adminasp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [adminasp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [adminasp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [adminasp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [adminasp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [adminasp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [adminasp] SET ARITHABORT OFF 
GO
ALTER DATABASE [adminasp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [adminasp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [adminasp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [adminasp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [adminasp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [adminasp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [adminasp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [adminasp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [adminasp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [adminasp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [adminasp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [adminasp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [adminasp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [adminasp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [adminasp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [adminasp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [adminasp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [adminasp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [adminasp] SET  MULTI_USER 
GO
ALTER DATABASE [adminasp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [adminasp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [adminasp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [adminasp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [adminasp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [adminasp] SET QUERY_STORE = OFF
GO
USE [adminasp]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [adminasp]
GO
/****** Object:  Table [dbo].[tbl_campania]    Script Date: 2/27/2018 7:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_campania](
	[idcampania] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[idpais] [int] NOT NULL,
	[idlocalidad] [int] NOT NULL,
	[tipo] [varchar](250) NOT NULL,
	[own] [varchar](250) NULL,
	[bannerdesktop] [varchar](250) NULL,
	[bannermobile] [varchar](250) NULL,
	[resumen] [text] NULL,
	[preguntasf] [text] NULL,
	[video] [text] NULL,
	[sorteoganadores] [text] NULL,
	[sorteofechas] [text] NULL,
	[mensaje] [text] NULL,
	[terminoscond] [text] NULL,
	[politicasuso] [text] NULL,
	[politicasprivacidad] [text] NULL,
	[politicatratdatos] [text] NULL,
	[productos] [text] NULL,
	[fregistro] [datetime] NULL,
	[fupdate] [datetime] NULL,
	[fini] [datetime] NULL,
	[ffin] [datetime] NULL,
	[estatus] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcampania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_canjes]    Script Date: 2/27/2018 7:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_canjes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idcampana] [int] NOT NULL,
	[idpremio] [int] NOT NULL,
	[puntos] [int] NOT NULL,
	[registro] [datetime] NOT NULL,
 CONSTRAINT [PK__tbl_canj__3213E83F2591F870] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_codigos]    Script Date: 2/27/2018 7:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_codigos](
	[idcodigo] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](250) NOT NULL,
	[puntos] [int] NOT NULL,
	[registro] [datetime] NULL,
 CONSTRAINT [PK_tbl_codigos] PRIMARY KEY CLUSTERED 
(
	[idcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_localidad]    Script Date: 2/27/2018 7:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_localidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idpais] [int] NOT NULL,
	[localidad] [varchar](250) NOT NULL,
 CONSTRAINT [PK__tbl_loca__3213E83FE88BCBAF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_paises]    Script Date: 2/27/2018 7:33:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_paises](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](250) NOT NULL,
	[estatus] [varchar](250) NOT NULL,
 CONSTRAINT [PK__tbl_pais__3213E83FEC8DACC7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_participantes]    Script Date: 2/27/2018 7:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_participantes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[apellidos] [varchar](250) NOT NULL,
	[dni] [varchar](250) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[clave] [varchar](250) NOT NULL,
	[imagen] [varchar](250) NOT NULL,
	[pais] [varchar](250) NOT NULL,
	[localidad] [varchar](250) NOT NULL,
	[puntos] [varchar](250) NOT NULL,
	[registro] [datetime] NOT NULL,
	[estatus] [varchar](250) NOT NULL,
 CONSTRAINT [PK__tbl_part__3213E83F0737F9FA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_premios]    Script Date: 2/27/2018 7:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_premios](
	[idpremios] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[idcampania] [int] NOT NULL,
	[imagen] [text] NULL,
	[detalle] [text] NULL,
	[puntaje] [int] NULL,
	[stock] [int] NULL,
	[registro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idpremios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_productos]    Script Date: 2/27/2018 7:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_productos](
	[idprod] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [varchar](250) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[imagen] [text] NULL,
	[detalles] [text] NULL,
	[registro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idprod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_puntos]    Script Date: 2/27/2018 7:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_puntos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idcampana] [int] NOT NULL,
	[idusr] [int] NOT NULL,
	[idcodigo] [int] NOT NULL,
	[puntos] [varchar](250) NOT NULL,
	[ownr] [varchar](250) NULL,
	[registro] [datetime] NOT NULL,
 CONSTRAINT [PK__tbl_punt__3213E83F5C262BF8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 2/27/2018 7:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[idusr] [bigint] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](250) NOT NULL,
	[clave] [varchar](250) NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[apellido] [varchar](250) NOT NULL,
	[rol] [varchar](250) NOT NULL,
	[fechaderegistro] [datetime] NOT NULL,
	[LoginErrorMessage] [text] NULL,
	[imagen] [varchar](250) NULL,
	[pais] [int] NULL,
	[estatus] [varchar](250) NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[idusr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_usuarios]    Script Date: 2/27/2018 7:33:20 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_usuarios] ON [dbo].[usuarios]
(
	[idusr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_canjes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_canjes_tbl_campania] FOREIGN KEY([idcampana])
REFERENCES [dbo].[tbl_campania] ([idcampania])
GO
ALTER TABLE [dbo].[tbl_canjes] CHECK CONSTRAINT [FK_tbl_canjes_tbl_campania]
GO
ALTER TABLE [dbo].[tbl_canjes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_canjes_tbl_premios] FOREIGN KEY([idpremio])
REFERENCES [dbo].[tbl_premios] ([idpremios])
GO
ALTER TABLE [dbo].[tbl_canjes] CHECK CONSTRAINT [FK_tbl_canjes_tbl_premios]
GO
ALTER TABLE [dbo].[tbl_localidad]  WITH CHECK ADD  CONSTRAINT [FK_tbl_localidad_tbl_paises] FOREIGN KEY([idpais])
REFERENCES [dbo].[tbl_paises] ([id])
GO
ALTER TABLE [dbo].[tbl_localidad] CHECK CONSTRAINT [FK_tbl_localidad_tbl_paises]
GO
ALTER TABLE [dbo].[tbl_premios]  WITH CHECK ADD  CONSTRAINT [FK_tbl_premios_tbl_premios] FOREIGN KEY([idcampania])
REFERENCES [dbo].[tbl_campania] ([idcampania])
GO
ALTER TABLE [dbo].[tbl_premios] CHECK CONSTRAINT [FK_tbl_premios_tbl_premios]
GO
ALTER TABLE [dbo].[tbl_puntos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_puntos_tbl_codigos] FOREIGN KEY([idcampana])
REFERENCES [dbo].[tbl_campania] ([idcampania])
GO
ALTER TABLE [dbo].[tbl_puntos] CHECK CONSTRAINT [FK_tbl_puntos_tbl_codigos]
GO
ALTER TABLE [dbo].[tbl_puntos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_puntos_tbl_codigos1] FOREIGN KEY([idcodigo])
REFERENCES [dbo].[tbl_codigos] ([idcodigo])
GO
ALTER TABLE [dbo].[tbl_puntos] CHECK CONSTRAINT [FK_tbl_puntos_tbl_codigos1]
GO
ALTER TABLE [dbo].[tbl_puntos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_puntos_tbl_participantes] FOREIGN KEY([idusr])
REFERENCES [dbo].[tbl_participantes] ([id])
GO
ALTER TABLE [dbo].[tbl_puntos] CHECK CONSTRAINT [FK_tbl_puntos_tbl_participantes]
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_usuario]    Script Date: 2/27/2018 7:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- insert into usuarios values('user@brainred.com','124','usuario','brainred','usuario',SYSDATETIME(),'')

CREATE PROCEDURE [dbo].[sp_insert_usuario](
	@usuario VARCHAR(250),
	@clave VARCHAR(250),
	@nombre VARCHAR(250),
	@apellido VARCHAR(250),
	@r VARCHAR(250) out
)
AS
BEGIN
IF NOT EXISTS (SELECT * FROM usuarios WHERE usuario=@usuario)
   BEGIN
       INSERT INTO usuarios VALUES(@usuario,@clave,@nombre,@apellido,'usuario',SYSDATETIME(),'','default.jpg',0,0)
	   SELECT @r = 'Usuario registrado'
   END
Else
	SELECT @r = 'Usuario ya existe'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_registro_participantes]    Script Date: 2/27/2018 7:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_registro_participantes](
	@nombre varchar(250),
	@apellidos  varchar(250),
	@dni varchar(250),
	@email varchar(250),
	@pais int,
	@localidad int,
	@clave varchar(250),
	@r VARCHAR(250) out
)
AS
BEGIN
IF NOT EXISTS (SELECT * FROM tbl_participantes WHERE dni=@dni and email=@email)
   BEGIN
       INSERT INTO tbl_participantes VALUES(@nombre,@apellidos,@dni,@email,@clave,'default.jpg',@pais,@localidad,0,SYSDATETIME(),'pendiente')
	   SELECT @r = 'Participante registrado'
   END
Else
	SELECT @r = 'Participante ya se encuentra registrado'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_select_usuarios]    Script Date: 2/27/2018 7:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_select_usuarios]
AS
BEGIN
	SELECT * FROM usuarios
END
GO
USE [master]
GO
ALTER DATABASE [adminasp] SET  READ_WRITE 
GO
