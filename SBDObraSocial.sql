USE [master]
GO
/****** Object:  Database [SBDObraSocial]    Script Date: 7/5/2020 19:22:29 ******/
CREATE DATABASE [SBDObraSocial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SBDObraSocial', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SBDObraSocial.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'SBDObraSocial_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SBDObraSocial_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SBDObraSocial] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SBDObraSocial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SBDObraSocial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SBDObraSocial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SBDObraSocial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SBDObraSocial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SBDObraSocial] SET ARITHABORT OFF 
GO
ALTER DATABASE [SBDObraSocial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SBDObraSocial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SBDObraSocial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SBDObraSocial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SBDObraSocial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SBDObraSocial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SBDObraSocial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SBDObraSocial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SBDObraSocial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SBDObraSocial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SBDObraSocial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SBDObraSocial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SBDObraSocial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SBDObraSocial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SBDObraSocial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SBDObraSocial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SBDObraSocial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SBDObraSocial] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SBDObraSocial] SET  MULTI_USER 
GO
ALTER DATABASE [SBDObraSocial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SBDObraSocial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SBDObraSocial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SBDObraSocial] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SBDObraSocial] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SBDObraSocial] SET QUERY_STORE = OFF
GO
USE [SBDObraSocial]
GO
/****** Object:  Table [dbo].[socios]    Script Date: 7/5/2020 19:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[socios](
	[nro_socios] [int] NOT NULL,
	[apellido] [varchar](40) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[tipo_documento] [char](3) NOT NULL,
	[nro_documento] [char](10) NOT NULL,
	[fecha_nac] [datetime] NOT NULL,
	[sexo] [char](1) NOT NULL,
	[nro_socio] [char](8) NOT NULL,
	[nro_socio_titular] [char](8) NOT NULL,
	[parentesco] [char](3) NOT NULL,
	[plan_os] [char](4) NOT NULL,
	[direccion] [varchar](80) NOT NULL,
	[cp] [char](4) NOT NULL,
	[telefonos] [char](40) NOT NULL,
	[mail] [char](60) NOT NULL,
	[estado] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_socios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_formularios]    Script Date: 7/5/2020 19:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_formularios](
	[formulario] [char](4) NULL,
	[pagina] [char](50) NULL,
	[nombre_menu] [char](15) NULL,
	[descripcion] [char](255) NULL,
	[estado] [char](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_usuarios]    Script Date: 7/5/2020 19:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_usuarios](
	[nro_usuario] [numeric](4, 0) NOT NULL,
	[usuario] [char](10) NOT NULL,
	[apellido] [char](20) NOT NULL,
	[nombre] [char](20) NOT NULL,
	[clave] [char](10) NOT NULL,
	[fecha_cambio] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tramites_cambio_plan]    Script Date: 7/5/2020 19:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tramites_cambio_plan](
	[nro_tramite] [numeric](6, 0) NOT NULL,
	[nro_socio] [char](8) NOT NULL,
	[plan_actual] [char](4) NOT NULL,
	[plan_nuevo] [char](4) NOT NULL,
	[estado] [char](3) NOT NULL,
	[fecha_resolucion] [datetime] NOT NULL,
	[usuario_ult_modif] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nro_tramite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[socios] ([nro_socios], [apellido], [nombre], [tipo_documento], [nro_documento], [fecha_nac], [sexo], [nro_socio], [nro_socio_titular], [parentesco], [plan_os], [direccion], [cp], [telefonos], [mail], [estado]) VALUES (1, N'ARJONA ', N'JOHN', N'DNI', N'16185222  ', CAST(N'1956-05-23T00:00:00.000' AS DateTime), N'M', N'1       ', N'1       ', N'TIT', N'2000', N'PICAPIEDRA 123', N'2900', N'1415221541                              ', N'john1g@gmail.com                                            ', N'ACT')
INSERT [dbo].[socios] ([nro_socios], [apellido], [nombre], [tipo_documento], [nro_documento], [fecha_nac], [sexo], [nro_socio], [nro_socio_titular], [parentesco], [plan_os], [direccion], [cp], [telefonos], [mail], [estado]) VALUES (2, N'ARJONA', N'JOHANA', N'DNI', N'39851616  ', CAST(N'1997-10-28T00:00:00.000' AS DateTime), N'F', N'2       ', N'1       ', N'HIJ', N'2000', N'PICAPIEDRA 123', N'2900', N'1567884511                              ', N'john1g@gmail.com                                            ', N'ACT')
INSERT [dbo].[socios] ([nro_socios], [apellido], [nombre], [tipo_documento], [nro_documento], [fecha_nac], [sexo], [nro_socio], [nro_socio_titular], [parentesco], [plan_os], [direccion], [cp], [telefonos], [mail], [estado]) VALUES (3, N'PIMPE', N'ANUEL', N'DNI', N'41578421  ', CAST(N'1987-04-28T00:00:00.000' AS DateTime), N'M', N'3       ', N'2       ', N'TIT', N'5000', N'SAN MARTIN 262', N'2900', N'8976212345                              ', N'smith@smith.com                                             ', N'ACT')
INSERT [dbo].[socios] ([nro_socios], [apellido], [nombre], [tipo_documento], [nro_documento], [fecha_nac], [sexo], [nro_socio], [nro_socio_titular], [parentesco], [plan_os], [direccion], [cp], [telefonos], [mail], [estado]) VALUES (4, N'PIMPE', N'MARIA', N'DNI', N'78745151  ', CAST(N'2000-01-23T00:00:00.000' AS DateTime), N'F', N'4       ', N'2       ', N'HIJ', N'5000', N'SAN MARTIN 262', N'2900', N'1111213123                              ', N'smith@smith.com                                             ', N'ACT')
INSERT [dbo].[socios] ([nro_socios], [apellido], [nombre], [tipo_documento], [nro_documento], [fecha_nac], [sexo], [nro_socio], [nro_socio_titular], [parentesco], [plan_os], [direccion], [cp], [telefonos], [mail], [estado]) VALUES (5, N'PATRA', N'JESICA', N'DNI', N'789412315 ', CAST(N'1986-01-14T00:00:00.000' AS DateTime), N'F', N'5       ', N'3       ', N'CON', N'3000', N'SAN MARTIN 262', N'2900', N'8974542754                              ', N'smith@smith.com                                             ', N'ACT')
INSERT [dbo].[socios] ([nro_socios], [apellido], [nombre], [tipo_documento], [nro_documento], [fecha_nac], [sexo], [nro_socio], [nro_socio_titular], [parentesco], [plan_os], [direccion], [cp], [telefonos], [mail], [estado]) VALUES (6, N'ZAME', N'JORGE', N'DNI', N'16196525  ', CAST(N'1985-01-20T00:00:00.000' AS DateTime), N'M', N'6       ', N'4       ', N'TIT', N'5000', N'CEPEDA 223', N'2900', N'5461564564                              ', N'jorge@outlook.com                                           ', N'ACT')
INSERT [dbo].[sys_formularios] ([formulario], [pagina], [nombre_menu], [descripcion], [estado]) VALUES (N'2   ', N'Tramites.aspx                                     ', N'Tramites       ', N'tramites                                                                                                                                                                                                                                                       ', N'ACT')
INSERT [dbo].[sys_formularios] ([formulario], [pagina], [nombre_menu], [descripcion], [estado]) VALUES (N'1   ', N'home.aspx                                         ', N'Inicio         ', N'home                                                                                                                                                                                                                                                           ', N'ACT')
INSERT [dbo].[sys_formularios] ([formulario], [pagina], [nombre_menu], [descripcion], [estado]) VALUES (N'3   ', N'Autorizaciones.aspx                               ', N'Autorizaciones ', N'autorizaciones                                                                                                                                                                                                                                                 ', N'ACT')
INSERT [dbo].[sys_usuarios] ([nro_usuario], [usuario], [apellido], [nombre], [clave], [fecha_cambio]) VALUES (CAST(1 AS Numeric(4, 0)), N'gabra     ', N'brasas              ', N'gabriel             ', N'753357    ', CAST(N'2019-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[sys_usuarios] ([nro_usuario], [usuario], [apellido], [nombre], [clave], [fecha_cambio]) VALUES (CAST(2 AS Numeric(4, 0)), N'beba      ', N'be                  ', N'bastan              ', N'357753    ', CAST(N'2019-10-26T00:00:00.000' AS DateTime))
INSERT [dbo].[sys_usuarios] ([nro_usuario], [usuario], [apellido], [nombre], [clave], [fecha_cambio]) VALUES (CAST(3 AS Numeric(4, 0)), N'admin     ', N'admin               ', N'admin               ', N'1474111   ', CAST(N'2015-12-16T00:00:00.000' AS DateTime))
INSERT [dbo].[tramites_cambio_plan] ([nro_tramite], [nro_socio], [plan_actual], [plan_nuevo], [estado], [fecha_resolucion], [usuario_ult_modif]) VALUES (CAST(1 AS Numeric(6, 0)), N'1       ', N'1000', N'3000', N'APL', CAST(N'2020-04-21T16:28:23.737' AS DateTime), N'admin     ')
INSERT [dbo].[tramites_cambio_plan] ([nro_tramite], [nro_socio], [plan_actual], [plan_nuevo], [estado], [fecha_resolucion], [usuario_ult_modif]) VALUES (CAST(2 AS Numeric(6, 0)), N'6       ', N'5000', N'1000', N'APL', CAST(N'2020-04-21T16:28:23.737' AS DateTime), N'admin     ')
INSERT [dbo].[tramites_cambio_plan] ([nro_tramite], [nro_socio], [plan_actual], [plan_nuevo], [estado], [fecha_resolucion], [usuario_ult_modif]) VALUES (CAST(3 AS Numeric(6, 0)), N'3       ', N'5000', N'1000', N'APL', CAST(N'2020-04-21T16:28:23.737' AS DateTime), N'gabra     ')
INSERT [dbo].[tramites_cambio_plan] ([nro_tramite], [nro_socio], [plan_actual], [plan_nuevo], [estado], [fecha_resolucion], [usuario_ult_modif]) VALUES (CAST(4 AS Numeric(6, 0)), N'1       ', N'3000', N'2000', N'APL', CAST(N'2020-04-21T16:32:53.300' AS DateTime), N'gabra     ')
INSERT [dbo].[tramites_cambio_plan] ([nro_tramite], [nro_socio], [plan_actual], [plan_nuevo], [estado], [fecha_resolucion], [usuario_ult_modif]) VALUES (CAST(5 AS Numeric(6, 0)), N'3       ', N'5000', N'3000', N'APL', CAST(N'2020-04-21T16:37:18.453' AS DateTime), N'          ')
ALTER TABLE [dbo].[socios]  WITH CHECK ADD  CONSTRAINT [ck_estado] CHECK  (([estado]='BAJ' OR [estado]='ACT'))
GO
ALTER TABLE [dbo].[socios] CHECK CONSTRAINT [ck_estado]
GO
ALTER TABLE [dbo].[socios]  WITH CHECK ADD  CONSTRAINT [ck_parentesco] CHECK  (([parentesco]='PAD' OR [parentesco]='TIT' OR [parentesco]='CON' OR [parentesco]='HIJ'))
GO
ALTER TABLE [dbo].[socios] CHECK CONSTRAINT [ck_parentesco]
GO
ALTER TABLE [dbo].[socios]  WITH CHECK ADD  CONSTRAINT [ck_planos] CHECK  (([plan_os]='5000' OR [plan_os]='3000' OR [plan_os]='2000' OR [plan_os]='1000'))
GO
ALTER TABLE [dbo].[socios] CHECK CONSTRAINT [ck_planos]
GO
ALTER TABLE [dbo].[socios]  WITH CHECK ADD  CONSTRAINT [ck_sexo] CHECK  (([sexo]='F' OR [sexo]='M'))
GO
ALTER TABLE [dbo].[socios] CHECK CONSTRAINT [ck_sexo]
GO
ALTER TABLE [dbo].[tramites_cambio_plan]  WITH CHECK ADD  CONSTRAINT [ck_tramites_estado] CHECK  (([estado]='REC' OR [estado]='APL' OR [estado]='PEN'))
GO
ALTER TABLE [dbo].[tramites_cambio_plan] CHECK CONSTRAINT [ck_tramites_estado]
GO
USE [master]
GO
ALTER DATABASE [SBDObraSocial] SET  READ_WRITE 
GO
