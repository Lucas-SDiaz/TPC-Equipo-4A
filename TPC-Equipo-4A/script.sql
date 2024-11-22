USE [master]
GO
/****** Object:  Database [DB_Clinica]    Script Date: 21/11/2024 21:52:20 ******/
CREATE DATABASE [DB_Clinica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Clinica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_Clinica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Clinica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DB_Clinica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_Clinica] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Clinica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Clinica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Clinica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Clinica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Clinica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Clinica] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Clinica] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_Clinica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Clinica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Clinica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Clinica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Clinica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Clinica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Clinica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Clinica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Clinica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_Clinica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Clinica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Clinica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Clinica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Clinica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Clinica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Clinica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Clinica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_Clinica] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Clinica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Clinica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Clinica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Clinica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Clinica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Clinica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_Clinica] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_Clinica] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_Clinica]
GO
/****** Object:  Table [dbo].[AdministradorSistema]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministradorSistema](
	[ID_AdministradorSistema] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_AdministradorSistema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administrativos]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrativos](
	[ID_Administrativo] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[DNI] [varchar](20) NOT NULL,
	[Legajo]  AS ('A'+CONVERT([varchar],[ID_Administrativo])) PERSISTED,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Administrativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultas]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultas](
	[ID_Consulta] [bigint] IDENTITY(1,1) NOT NULL,
	[FechaConsulta] [date] NOT NULL,
	[ID_Medico] [bigint] NOT NULL,
	[ID_Paciente] [bigint] NOT NULL,
	[Diagnostico] [varchar](500) NULL,
	[Tratamiento] [varchar](500) NULL,
	[Comentarios] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Consulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Domicilios]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domicilios](
	[ID_Domicilio] [int] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[Calle] [varchar](255) NOT NULL,
	[Numero] [varchar](10) NOT NULL,
	[Piso] [varchar](10) NULL,
	[Depto] [varchar](10) NULL,
	[Ciudad] [varchar](100) NOT NULL,
	[Provincia] [varchar](100) NOT NULL,
	[CodigoPostal] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Domicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[ID_Especialidad] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre_E] [varchar](1000) NOT NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoTurno]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoTurno](
	[ID_EstadoTurno] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_EstadoTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FechaRegistro]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FechaRegistro](
	[ID_FechaRegistro] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[FechaRegistro] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_FechaRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JornadasMedicos]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JornadasMedicos](
	[ID_Jornada] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Medico] [bigint] NOT NULL,
	[DiaSemana] [tinyint] NOT NULL,
	[HoraEntrada] [time](7) NOT NULL,
	[HoraSalida] [time](7) NOT NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Jornada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[ID_Medico] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Legajo]  AS ('M'+CONVERT([varchar],[ID_Medico])) PERSISTED,
	[DNI] [varchar](20) NOT NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicosEspecialidades]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicosEspecialidades](
	[ID_Medico] [bigint] NOT NULL,
	[ID_Especialidad] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Medico] ASC,
	[ID_Especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[ID_Paciente] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[DNI] [varchar](20) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[ID_Perfil] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefonos]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefonos](
	[ID_Tel] [bigint] IDENTITY(1,1) NOT NULL,
	[Numero] [varchar](50) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turnos]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turnos](
	[ID_Turno] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Paciente] [bigint] NOT NULL,
	[ID_Medico] [bigint] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 21/11/2024 21:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_Usuario] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Perfil] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Contraseña] [varchar](100) NOT NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdministradorSistema] ON 

INSERT [dbo].[AdministradorSistema] ([ID_AdministradorSistema], [ID_Usuario], [Estado]) VALUES (1, 4, 1)
SET IDENTITY_INSERT [dbo].[AdministradorSistema] OFF
GO
SET IDENTITY_INSERT [dbo].[Administrativos] ON 

INSERT [dbo].[Administrativos] ([ID_Administrativo], [ID_Usuario], [Nombre], [Apellido], [DNI], [Estado]) VALUES (1, 3, N'Pablo', N'Pérez', N'28777666', 1)
SET IDENTITY_INSERT [dbo].[Administrativos] OFF
GO
SET IDENTITY_INSERT [dbo].[Consultas] ON 

INSERT [dbo].[Consultas] ([ID_Consulta], [FechaConsulta], [ID_Medico], [ID_Paciente], [Diagnostico], [Tratamiento], [Comentarios]) VALUES (1, CAST(N'2024-11-19' AS Date), 1, 1, N'faringitis', N'antibiotico', N'volver semana proxima')
INSERT [dbo].[Consultas] ([ID_Consulta], [FechaConsulta], [ID_Medico], [ID_Paciente], [Diagnostico], [Tratamiento], [Comentarios]) VALUES (2, CAST(N'2024-11-19' AS Date), 1, 1, N'Faringitis', N'alta medica', N'Concluyo tratamiento')
INSERT [dbo].[Consultas] ([ID_Consulta], [FechaConsulta], [ID_Medico], [ID_Paciente], [Diagnostico], [Tratamiento], [Comentarios]) VALUES (3, CAST(N'2024-11-19' AS Date), 36, 1, N'Sobrepeso', N'dieta X', N'volver en 2 semanas')
SET IDENTITY_INSERT [dbo].[Consultas] OFF
GO
SET IDENTITY_INSERT [dbo].[Domicilios] ON 

INSERT [dbo].[Domicilios] ([ID_Domicilio], [ID_Usuario], [Calle], [Numero], [Piso], [Depto], [Ciudad], [Provincia], [CodigoPostal]) VALUES (1, 2, N'Buenos Aires', N'2242', N'10', N'F', N'Mar Del Plata', N'Buenos Aires', N'7600')
INSERT [dbo].[Domicilios] ([ID_Domicilio], [ID_Usuario], [Calle], [Numero], [Piso], [Depto], [Ciudad], [Provincia], [CodigoPostal]) VALUES (7, 10051, N'La Rioja', N'233', N'4', N'A', N'Mar Del Plata', N'Buenos Aires', N'7600')
INSERT [dbo].[Domicilios] ([ID_Domicilio], [ID_Usuario], [Calle], [Numero], [Piso], [Depto], [Ciudad], [Provincia], [CodigoPostal]) VALUES (8, 10049, N'Vuelta de Obligado', N'2342', N'11', N'A', N'Ciudad autónoma de Buenos Aires', N'CABA', N'7600')
INSERT [dbo].[Domicilios] ([ID_Domicilio], [ID_Usuario], [Calle], [Numero], [Piso], [Depto], [Ciudad], [Provincia], [CodigoPostal]) VALUES (9, 10050, N'Av Santa Fe', N'3782', N'3', N'D', N'Ciudad autónoma de Buenos Aires', N'CABA', N'1104')
SET IDENTITY_INSERT [dbo].[Domicilios] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidades] ON 

INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (1, N'Psicología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (2, N'Pediatría', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (3, N'Cardiología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (4, N'Nutrición', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (5, N'Neurología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (6, N'Dermatología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (7, N'Ginecología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (8, N'Oftalmología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (9, N'Otorrinolaringología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (10, N'Urología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (11, N'Kinesiología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (12, N'Endocrinología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (13, N'Reumatología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (14, N'Oncología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (15, N'Gastroenterología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (16, N'Traumatología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (17, N'Odontología', 1)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (18, N'Radiología', 0)
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E], [Estado]) VALUES (20, N'Radiología', 1)
SET IDENTITY_INSERT [dbo].[Especialidades] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoTurno] ON 

INSERT [dbo].[EstadoTurno] ([ID_EstadoTurno], [Nombre]) VALUES (1, N'Pendiente')
INSERT [dbo].[EstadoTurno] ([ID_EstadoTurno], [Nombre]) VALUES (2, N'Cancelado')
INSERT [dbo].[EstadoTurno] ([ID_EstadoTurno], [Nombre]) VALUES (3, N'Reprogramado')
INSERT [dbo].[EstadoTurno] ([ID_EstadoTurno], [Nombre]) VALUES (4, N'Asistió')
INSERT [dbo].[EstadoTurno] ([ID_EstadoTurno], [Nombre]) VALUES (5, N'No Asistió')
SET IDENTITY_INSERT [dbo].[EstadoTurno] OFF
GO
SET IDENTITY_INSERT [dbo].[FechaRegistro] ON 

INSERT [dbo].[FechaRegistro] ([ID_FechaRegistro], [ID_Usuario], [FechaRegistro]) VALUES (1, 1, CAST(N'2024-01-11' AS Date))
INSERT [dbo].[FechaRegistro] ([ID_FechaRegistro], [ID_Usuario], [FechaRegistro]) VALUES (2, 2, CAST(N'2024-01-11' AS Date))
INSERT [dbo].[FechaRegistro] ([ID_FechaRegistro], [ID_Usuario], [FechaRegistro]) VALUES (3, 3, CAST(N'2024-01-11' AS Date))
INSERT [dbo].[FechaRegistro] ([ID_FechaRegistro], [ID_Usuario], [FechaRegistro]) VALUES (4, 4, CAST(N'2024-03-11' AS Date))
INSERT [dbo].[FechaRegistro] ([ID_FechaRegistro], [ID_Usuario], [FechaRegistro]) VALUES (5, 5, CAST(N'2024-03-11' AS Date))
INSERT [dbo].[FechaRegistro] ([ID_FechaRegistro], [ID_Usuario], [FechaRegistro]) VALUES (6, 12, CAST(N'2024-07-11' AS Date))
INSERT [dbo].[FechaRegistro] ([ID_FechaRegistro], [ID_Usuario], [FechaRegistro]) VALUES (13, 10049, CAST(N'2024-11-11' AS Date))
INSERT [dbo].[FechaRegistro] ([ID_FechaRegistro], [ID_Usuario], [FechaRegistro]) VALUES (14, 10051, CAST(N'2024-02-09' AS Date))
INSERT [dbo].[FechaRegistro] ([ID_FechaRegistro], [ID_Usuario], [FechaRegistro]) VALUES (15, 10051, CAST(N'2024-02-09' AS Date))
INSERT [dbo].[FechaRegistro] ([ID_FechaRegistro], [ID_Usuario], [FechaRegistro]) VALUES (16, 10051, CAST(N'2024-02-09' AS Date))
INSERT [dbo].[FechaRegistro] ([ID_FechaRegistro], [ID_Usuario], [FechaRegistro]) VALUES (17, 10050, CAST(N'2024-03-11' AS Date))
SET IDENTITY_INSERT [dbo].[FechaRegistro] OFF
GO
SET IDENTITY_INSERT [dbo].[JornadasMedicos] ON 

INSERT [dbo].[JornadasMedicos] ([ID_Jornada], [ID_Medico], [DiaSemana], [HoraEntrada], [HoraSalida], [Estado]) VALUES (3, 1, 2, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[JornadasMedicos] ([ID_Jornada], [ID_Medico], [DiaSemana], [HoraEntrada], [HoraSalida], [Estado]) VALUES (4, 1, 4, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[JornadasMedicos] ([ID_Jornada], [ID_Medico], [DiaSemana], [HoraEntrada], [HoraSalida], [Estado]) VALUES (12, 36, 3, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[JornadasMedicos] ([ID_Jornada], [ID_Medico], [DiaSemana], [HoraEntrada], [HoraSalida], [Estado]) VALUES (13, 36, 5, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[JornadasMedicos] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicos] ON 

INSERT [dbo].[Medicos] ([ID_Medico], [ID_Usuario], [Nombre], [Apellido], [DNI], [Estado]) VALUES (1, 1, N'Claudia Silvina', N'Gómez', N'32113454', 1)
INSERT [dbo].[Medicos] ([ID_Medico], [ID_Usuario], [Nombre], [Apellido], [DNI], [Estado]) VALUES (2, 5, N'Héctor Amilcar', N'Rodríguez', N'16554888', 1)
INSERT [dbo].[Medicos] ([ID_Medico], [ID_Usuario], [Nombre], [Apellido], [DNI], [Estado]) VALUES (9, 12, N'René', N'Favaloro', N'2222222', 1)
INSERT [dbo].[Medicos] ([ID_Medico], [ID_Usuario], [Nombre], [Apellido], [DNI], [Estado]) VALUES (10, 14, N'Marcelo', N'Monzón', N'12345678', 1)
INSERT [dbo].[Medicos] ([ID_Medico], [ID_Usuario], [Nombre], [Apellido], [DNI], [Estado]) VALUES (36, 10046, N'Roberto Javier', N'Galati', N'29123333', 1)
SET IDENTITY_INSERT [dbo].[Medicos] OFF
GO
INSERT [dbo].[MedicosEspecialidades] ([ID_Medico], [ID_Especialidad]) VALUES (1, 1)
INSERT [dbo].[MedicosEspecialidades] ([ID_Medico], [ID_Especialidad]) VALUES (2, 3)
INSERT [dbo].[MedicosEspecialidades] ([ID_Medico], [ID_Especialidad]) VALUES (9, 3)
INSERT [dbo].[MedicosEspecialidades] ([ID_Medico], [ID_Especialidad]) VALUES (10, 15)
INSERT [dbo].[MedicosEspecialidades] ([ID_Medico], [ID_Especialidad]) VALUES (36, 4)
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON 

INSERT [dbo].[Pacientes] ([ID_Paciente], [ID_Usuario], [Nombre], [Apellido], [DNI], [FechaNacimiento], [Estado]) VALUES (1, 2, N'Luciana', N'Rotela Cabral', N'39108221', CAST(N'1995-09-27' AS Date), 1)
INSERT [dbo].[Pacientes] ([ID_Paciente], [ID_Usuario], [Nombre], [Apellido], [DNI], [FechaNacimiento], [Estado]) VALUES (3, 10049, N'Carlos', N'Diaz', N'93123123', CAST(N'1960-11-20' AS Date), 1)
INSERT [dbo].[Pacientes] ([ID_Paciente], [ID_Usuario], [Nombre], [Apellido], [DNI], [FechaNacimiento], [Estado]) VALUES (4, 10050, N'Norma', N'Gimenez', N'14322867', CAST(N'1961-11-13' AS Date), 1)
INSERT [dbo].[Pacientes] ([ID_Paciente], [ID_Usuario], [Nombre], [Apellido], [DNI], [FechaNacimiento], [Estado]) VALUES (5, 10051, N'Micaela', N'Jara', N'39123345', CAST(N'1997-01-15' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON 

INSERT [dbo].[Perfil] ([ID_Perfil], [Descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[Perfil] ([ID_Perfil], [Descripcion]) VALUES (2, N'Médico')
INSERT [dbo].[Perfil] ([ID_Perfil], [Descripcion]) VALUES (3, N'Personal administrativo')
INSERT [dbo].[Perfil] ([ID_Perfil], [Descripcion]) VALUES (4, N'Paciente')
SET IDENTITY_INSERT [dbo].[Perfil] OFF
GO
SET IDENTITY_INSERT [dbo].[Telefonos] ON 

INSERT [dbo].[Telefonos] ([ID_Tel], [Numero], [ID_Usuario]) VALUES (1, N'2257343434', 2)
INSERT [dbo].[Telefonos] ([ID_Tel], [Numero], [ID_Usuario]) VALUES (2, N'1122446688', 1)
INSERT [dbo].[Telefonos] ([ID_Tel], [Numero], [ID_Usuario]) VALUES (3, N'2246555774', 5)
INSERT [dbo].[Telefonos] ([ID_Tel], [Numero], [ID_Usuario]) VALUES (10, N'2245123123', 12)
INSERT [dbo].[Telefonos] ([ID_Tel], [Numero], [ID_Usuario]) VALUES (11, N'1199887766', 14)
INSERT [dbo].[Telefonos] ([ID_Tel], [Numero], [ID_Usuario]) VALUES (37, N'22323423423', 10046)
INSERT [dbo].[Telefonos] ([ID_Tel], [Numero], [ID_Usuario]) VALUES (45, N'1144234987', 10049)
INSERT [dbo].[Telefonos] ([ID_Tel], [Numero], [ID_Usuario]) VALUES (46, N'1144217287', 10050)
INSERT [dbo].[Telefonos] ([ID_Tel], [Numero], [ID_Usuario]) VALUES (47, N'2231230985', 10051)
SET IDENTITY_INSERT [dbo].[Telefonos] OFF
GO
SET IDENTITY_INSERT [dbo].[Turnos] ON 

INSERT [dbo].[Turnos] ([ID_Turno], [ID_Paciente], [ID_Medico], [Fecha], [Hora], [Estado]) VALUES (7, 3, 1, CAST(N'2024-11-25' AS Date), CAST(N'09:00:00' AS Time), 2)
INSERT [dbo].[Turnos] ([ID_Turno], [ID_Paciente], [ID_Medico], [Fecha], [Hora], [Estado]) VALUES (8, 1, 1, CAST(N'2024-11-25' AS Date), CAST(N'11:00:00' AS Time), 2)
INSERT [dbo].[Turnos] ([ID_Turno], [ID_Paciente], [ID_Medico], [Fecha], [Hora], [Estado]) VALUES (9, 1, 1, CAST(N'2024-11-25' AS Date), CAST(N'14:00:00' AS Time), 2)
INSERT [dbo].[Turnos] ([ID_Turno], [ID_Paciente], [ID_Medico], [Fecha], [Hora], [Estado]) VALUES (10, 1, 36, CAST(N'2024-11-26' AS Date), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[Turnos] ([ID_Turno], [ID_Paciente], [ID_Medico], [Fecha], [Hora], [Estado]) VALUES (11, 3, 36, CAST(N'2024-11-28' AS Date), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[Turnos] ([ID_Turno], [ID_Paciente], [ID_Medico], [Fecha], [Hora], [Estado]) VALUES (12, 1, 36, CAST(N'2024-12-05' AS Date), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[Turnos] ([ID_Turno], [ID_Paciente], [ID_Medico], [Fecha], [Hora], [Estado]) VALUES (13, 1, 1, CAST(N'2024-12-03' AS Date), CAST(N'09:00:00' AS Time), 3)
INSERT [dbo].[Turnos] ([ID_Turno], [ID_Paciente], [ID_Medico], [Fecha], [Hora], [Estado]) VALUES (14, 1, 1, CAST(N'2024-11-26' AS Date), CAST(N'12:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[Turnos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (1, 2, N'psigomez@gmail.com', N'psico123', 0)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (2, 4, N'cardenalthompson@hotmail.com', N'Lucia27', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (3, 3, N'administrativoclinica@gmail.com', N'turnos123', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (4, 1, N'admin@clinica.com.ar', N'123', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (5, 2, N'hrcardio@gmail.com', N'racing', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (12, 2, N'rfavaloro@gmail.com', N'12312311', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (14, 2, N'mm@gmail.com', N'12345678', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (10046, 2, N'rg@gmail.com', N'29123333', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (10049, 4, N'jcd@gmail.com', N'93123123', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (10050, 4, N'norma@gmail.com', N'14322867', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (10051, 4, N'mj@gmail.com', N'39123345', 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Administ__C035B8DDE59ABD5B]    Script Date: 21/11/2024 21:52:21 ******/
ALTER TABLE [dbo].[Administrativos] ADD UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Paciente__C035B8DD34CF1DA4]    Script Date: 21/11/2024 21:52:21 ******/
ALTER TABLE [dbo].[Pacientes] ADD UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__A9D105348725EB91]    Script Date: 21/11/2024 21:52:21 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdministradorSistema] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Administrativos] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Especialidades] ADD  CONSTRAINT [DF_Especialidades_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[JornadasMedicos] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Medicos] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Pacientes] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[AdministradorSistema]  WITH CHECK ADD FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Administrativos]  WITH CHECK ADD FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[Medicos] ([ID_Medico])
GO
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Pacientes] ([ID_Paciente])
GO
ALTER TABLE [dbo].[Domicilios]  WITH CHECK ADD FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[FechaRegistro]  WITH CHECK ADD FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[JornadasMedicos]  WITH CHECK ADD FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[Medicos] ([ID_Medico])
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[MedicosEspecialidades]  WITH CHECK ADD FOREIGN KEY([ID_Especialidad])
REFERENCES [dbo].[Especialidades] ([ID_Especialidad])
GO
ALTER TABLE [dbo].[MedicosEspecialidades]  WITH CHECK ADD FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[Medicos] ([ID_Medico])
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Telefonos]  WITH CHECK ADD FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD FOREIGN KEY([Estado])
REFERENCES [dbo].[EstadoTurno] ([ID_EstadoTurno])
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[Medicos] ([ID_Medico])
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Pacientes] ([ID_Paciente])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([ID_Perfil])
REFERENCES [dbo].[Perfil] ([ID_Perfil])
GO
/****** Object:  StoredProcedure [dbo].[GuardarTurnoSP]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[GuardarTurnoSP]
    @idPaciente INT,
	@idMedico INT,
    @fechaTurno DATETIME,
	@horaTurno TIME
AS
BEGIN
	INSERT INTO Turnos (ID_Paciente, ID_Medico, Fecha, Hora, Estado)
	VALUES (@idPaciente, @idMedico, @fechaTurno, @horaTurno,1)
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerEspecialidad]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[obtenerEspecialidad] 
    @ID_Medico BIGINT
AS
BEGIN
    SELECT top 1 ID_Especialidad FROM MedicosEspecialidades
    WHERE ID_Medico = @ID_Medico
END
GO
/****** Object:  StoredProcedure [dbo].[ReprogramarTurnoSP]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ReprogramarTurnoSP] 
@idTurno BIGINT,
@idPaciente BIGINT,
@idMedico BIGINT,
@fechaTurno DATE,
@horaTurno TIME
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY


        -- Actualizar la tabla Turnos
        UPDATE Turnos
        SET ID_Paciente = @idPaciente, ID_Medico = @idMedico,Fecha = @fechaTurno, Hora = @horaTurno, Estado = 3
        WHERE ID_Turno = @idTurno


        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        DECLARE @mensaje VARCHAR(4000) = error_message()
        RAISERROR(@mensaje, 16, 1)
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPAgregarConsulta]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPAgregarConsulta]
    @FechaConsulta DATE,
    @ID_Medico BIGINT,
    @ID_Paciente BIGINT,
    @Diagnostico VARCHAR(500),
    @Tratamiento VARCHAR(500),
    @Comentarios VARCHAR(200)
AS
BEGIN
    INSERT INTO Consultas(FechaConsulta, ID_Medico, ID_Paciente, Diagnostico, Tratamiento, Comentarios)
    VALUES(@FechaConsulta, @ID_Medico, @ID_Paciente, @Diagnostico, @Tratamiento, @Comentarios)
END
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarIDMedicoPorIDUsuario]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SPBuscarIDMedicoPorIDUsuario]
    @ID_Usuario BIGINT
AS
BEGIN
    SELECT M.ID_Medico FROM Medicos M
    WHERE M.ID_Usuario = @ID_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarUsuarioPorEmail]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPBuscarUsuarioPorEmail]
    @Email NVARCHAR(100)
AS
BEGIN
    SELECT Email, Contraseña
    FROM Usuarios
    WHERE Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[SpCancelarTurno]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpCancelarTurno] 
    @ID_Turno BIGINT
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY

        UPDATE Turnos
        SET Estado = 2
        WHERE ID_Turno = @ID_Turno

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        DECLARE @mensaje VARCHAR(4000) = error_message()
        RAISERROR(@mensaje, 16, 1)
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SPListarConsultasPorPaciente]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPListarConsultasPorPaciente]
    @ID_Paciente BIGINT
AS
BEGIN
    SELECT C.ID_Consulta, C.ID_Medico, C.FechaConsulta, P.Nombre, p.Apellido, C.Diagnostico, C.Tratamiento, C.Comentarios FROM Consultas C
    INNER JOIN Pacientes P ON P.ID_Paciente = C.ID_Paciente
    WHERE C.ID_Paciente = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SPlistarEspecialidadID]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPlistarEspecialidadID] 
    @ID_Especialidad BIGINT
AS
BEGIN
    SELECT ID_Especialidad, Nombre_E FROM Especialidades
    WHERE ID_Especialidad = @ID_Especialidad
END
GO
/****** Object:  StoredProcedure [dbo].[SPListarHorariosPorID]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPListarHorariosPorID]
    @ID_Medico BIGINT
AS
BEGIN
    SELECT J.ID_Jornada, J.ID_Medico, J.DiaSemana, J.HoraEntrada, J.HoraSalida, J.Estado FROM JornadasMedicos J
    WHERE J.ID_Medico = @ID_Medico 
END
GO
/****** Object:  StoredProcedure [dbo].[SPListarPacientesPorMedico]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPListarPacientesPorMedico] 
    @ID_Medico BIGINT
AS
BEGIN
SELECT DISTINCT P.ID_Paciente, P.ID_Usuario, P.FechaNacimiento AS 'Fecha de nacimiento', P.Apellido,  P.Nombre, P.DNI, U.Email, TE.Numero AS 'Celular' FROM Turnos T
INNER JOIN Pacientes P ON P.ID_Paciente = T.ID_Paciente
INNER JOIN Usuarios U ON U.ID_Usuario = P.ID_Usuario
INNER JOIN Telefonos TE ON TE.ID_Usuario = P.ID_Usuario
WHERE @ID_Medico = T.ID_Medico
END
GO
/****** Object:  StoredProcedure [dbo].[SPlistarTurnoPorID]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SPlistarTurnoPorID] 
    @ID_Turno BIGINT
AS
BEGIN
    SELECT T.ID_Turno, P.ID_Paciente, M.ID_Medico, P.Apellido AS 'AP PAC', P.Nombre AS 'NOM PAC', M.Apellido AS 'AP MED', M.Nombre AS 'NOM MED', T.Fecha, T.Hora, T.Estado FROM Turnos T
    INNER JOIN Medicos M ON M.ID_Medico = T.ID_Medico
    INNER JOIN Pacientes P ON P.ID_Paciente = T.ID_Paciente
    WHERE T.ID_Turno = @ID_Turno
END
GO
/****** Object:  StoredProcedure [dbo].[SPlistarTurnos]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPlistarTurnos] AS
SELECT T.ID_Turno, P.Apellido as 'ap pac' ,P.Nombre as 'nom pac', M.Apellido as 'ap med', M.Nombre as 'nom med', T.Fecha, T.Hora, T.Estado FROM Turnos T
INNER JOIN Pacientes P ON P.ID_Paciente = T.ID_Paciente
INNER JOIN Medicos M ON M.ID_Medico = T.ID_Medico  
GO
/****** Object:  StoredProcedure [dbo].[SPlistarTurnosMedico]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPlistarTurnosMedico] 
    @ID_Usuario BIGINT
AS
BEGIN
    SELECT T.ID_Turno, P.ID_Paciente, P.Apellido AS 'AP PAC', P.Nombre AS 'NOM PAC', M.Apellido AS 'AP MED', M.Nombre AS 'NOM MED', T.Fecha, T.Hora, T.Estado FROM Turnos T
    INNER JOIN Medicos M ON M.ID_Medico = T.ID_Medico
    INNER JOIN Pacientes P ON P.ID_Paciente = T.ID_Paciente
    WHERE M.ID_Usuario = @ID_Usuario
    ORDER BY T.Fecha ASC, T.Hora ASC
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureBajaEspecialidad]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[storedProcedureBajaEspecialidad]
    @ID_Especialidad BIGINT
AS
BEGIN
    UPDATE Especialidades
    SET Estado = 0
    WHERE ID_Especialidad = @ID_Especialidad
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureBuscarEmpleadoID]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedureBuscarEmpleadoID]
    @ID_Administrativo BIGINT
AS
BEGIN
        SELECT A.ID_Usuario, A.ID_Administrativo, A.Apellido, A.Nombre,A.DNI, A.Legajo, U.Email, A.Estado FROM Administrativos A
        INNER JOIN Usuarios U ON U.ID_Usuario = A.ID_Usuario
        WHERE A.ID_Administrativo = @ID_Administrativo
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureBuscarMedicoID]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[storedProcedureBuscarMedicoID]
    @ID_Medico BIGINT
AS
BEGIN
select M.ID_Usuario, M.Apellido, M.Nombre, ME.ID_Especialidad, U.Email, M.DNI, T.Numero from Medicos M
INNER JOIN Usuarios U ON U.ID_Usuario = M.ID_Usuario
INNER JOIN Telefonos T ON T.ID_Usuario = M.ID_Usuario
INNER JOIN MedicosEspecialidades ME ON ME.ID_Medico = M.ID_Medico
WHERE M.ID_Medico = @ID_Medico
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureBuscarPacienteID]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedureBuscarPacienteID]
    @ID_Paciente BIGINT 
AS
BEGIN
SELECT DISTINCT P.ID_Paciente, P.ID_Usuario, P.FechaNacimiento, P.Apellido, P.Nombre, P.DNI, U.Email, U.Contraseña, T.Numero AS 'Celular', P.Estado, F.FechaRegistro, D.Calle + ' ' + d.Numero + ', ' + D.Ciudad + ', ' + D.Provincia + ' ' + D.CodigoPostal AS 'Domicilio' FROM Pacientes P
INNER JOIN Usuarios U ON U.ID_Usuario = P.ID_Usuario
INNER JOIN Telefonos T ON T.ID_Usuario = P.ID_Usuario
INNER JOIN FechaRegistro F ON F.ID_Usuario = P.ID_Usuario
INNER JOIN Domicilios D ON D.ID_Usuario = P.ID_Usuario
WHERE P.ID_Paciente = @ID_Paciente
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureBuscarPacienteID2]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedureBuscarPacienteID2]
    @ID_Paciente BIGINT 
AS
BEGIN
    SELECT 
        P.ID_Paciente, 
        P.ID_Usuario, 
        P.FechaNacimiento AS 'FechaNacimiento', 
        P.Apellido, 
        P.Nombre, 
        P.DNI, 
        U.Email, 
        U.Contraseña,
        T.Numero AS 'Celular', 
        P.Estado, 
        F.FechaRegistro,
        D.Calle, 
        D.Numero, 
        D.Ciudad, 
        D.Provincia, 
        D.CodigoPostal,
        D.Piso,
        D.Depto
    FROM Pacientes P
    INNER JOIN Usuarios U ON U.ID_Usuario = P.ID_Usuario
    INNER JOIN Telefonos T ON T.ID_Usuario = P.ID_Usuario
    INNER JOIN FechaRegistro F ON F.ID_Usuario = P.ID_Usuario
    INNER JOIN Domicilios D ON D.ID_Usuario = P.ID_Usuario
    WHERE P.ID_Paciente = @ID_Paciente
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureCargarHorarios]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedureCargarHorarios]
    @ID_Medico BIGINT,
    @DiaSemana TINYINT,
    @HoraEntrada TIME,
    @HoraSalida TIME,
    @Estado BIT
AS 
BEGIN
    INSERT INTO JornadasMedicos(ID_Medico, DiaSemana, HoraEntrada, HoraSalida, Estado)
    VALUES(@ID_Medico, @DiaSemana, @HoraEntrada, @HoraSalida, @Estado)
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureEditarEmpleado]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedureEditarEmpleado]
    @ID_Usuario BIGINT,
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @Email VARCHAR(100),
    @DNI VARCHAR(20), 
    @Estado BIT     
AS
BEGIN
   BEGIN TRANSACTION
    BEGIN TRY
        -- Actualizar la tabla Usuarios
        UPDATE Usuarios
        SET Email = @Email, Estado = @Estado
        WHERE ID_Usuario = @ID_Usuario

        --Actualizar tabla administrativos 
        UPDATE Administrativos
        SET Nombre = @Nombre, Apellido = @Apellido, DNI = @DNI, Estado = @Estado
        WHERE ID_Usuario = @ID_Usuario
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        DECLARE @mensaje VARCHAR(4000) = error_message()
        RAISERROR(@mensaje, 16, 1)
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureEditarMedico]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[storedProcedureEditarMedico]
    @ID_Usuario BIGINT,
    @ID_Medico BIGINT,
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @Email VARCHAR(100),
    @DNI VARCHAR(20), 
    @Numero VARCHAR(50),
    @ID_Especialidad BIGINT,
    @Estado BIT     
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY


        -- Actualizar la tabla Usuarios
        UPDATE Usuarios
        SET Email = @Email, Estado = @Estado
        WHERE ID_Usuario = @ID_Usuario

        --Actualizar tabla medicos 
        UPDATE Medicos
        SET Nombre = @Nombre, Apellido = @Apellido, DNI = @DNI, Estado = @Estado
        WHERE ID_Medico = @ID_Medico

        -- Actualizar la tabla Telefonos
        UPDATE Telefonos
        SET Numero = @Numero
        WHERE ID_Usuario = @ID_Usuario

        UPDATE MedicosEspecialidades
        SET ID_Especialidad = @ID_Especialidad
        WHERE ID_Medico =  @ID_Medico

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        DECLARE @mensaje VARCHAR(4000) = error_message()
        RAISERROR(@mensaje, 16, 1)
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureEditarPaciente]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[storedProcedureEditarPaciente]
    @ID_Usuario BIGINT,
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @Email VARCHAR(100),
    @Contraseña  VARCHAR (100),
    @DNI VARCHAR(20), 
    @Numero VARCHAR(50),
    @FechaNacimiento DATE,    
    @Calle VARCHAR (50),
    @NumeroCalle VARCHAR (10),
    @Piso VARCHAR (10),
    @Depto VARCHAR (10),
    @Ciudad VARCHAR (100),
    @Provincia VARCHAR (100),
    @CodigoPostal VARCHAR (10),
    @Estado BIT
 AS
 BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        DECLARE @ID_Paciente BIGINT
        DECLARE @PacienteOutput TABLE (ID_Paciente BIGINT) 


        --Usuarios
        UPDATE Usuarios
        SET Email = @Email, Estado = @Estado, Contraseña =@Contraseña
        WHERE ID_Usuario = @ID_Usuario
        --Pacientes 
        UPDATE Pacientes
        SET Nombre = @Nombre, Apellido = @Apellido, DNI = @DNI, FechaNacimiento = @FechaNacimiento,  Estado = @Estado
        OUTPUT INSERTED.ID_Paciente INTO @PacienteOutput 
        WHERE ID_Usuario = @ID_Usuario

        SELECT @ID_Paciente = ID_Paciente FROM @PacienteOutput

        --Telefonos
        UPDATE Telefonos
        SET Numero = @Numero
        WHERE ID_Usuario = @ID_Usuario

        UPDATE Domicilios
        SET Calle = @Calle, Numero = @NumeroCalle, Piso = @Piso, Depto = @Depto, Ciudad = @Ciudad, Provincia = @Provincia, CodigoPostal = @CodigoPostal
        WHERE ID_Usuario =  @ID_Usuario

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        DECLARE @mensaje VARCHAR(4000) = error_message()
        RAISERROR(@mensaje, 16, 1)
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureEliminarEmpleado]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedureEliminarEmpleado] 
    @ID_Usuario BIGINT
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY

        -- Actualizar la tabla Usuarios
        UPDATE Usuarios
        SET Estado = 0
        WHERE ID_Usuario = @ID_Usuario

        --Actualizar tabla administrativos 
        UPDATE Administrativos
        SET Estado = 0
        WHERE ID_Usuario = @ID_Usuario
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        DECLARE @mensaje VARCHAR(4000) = error_message()
        RAISERROR(@mensaje, 16, 1)
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[storedProcedureEliminarMedico]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedureEliminarMedico] 
    @ID_Usuario BIGINT
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY

        -- Actualizar la tabla Usuarios
        UPDATE Usuarios
        SET Estado = 0
        WHERE ID_Usuario = @ID_Usuario

        --Actualizar tabla medicos 
        UPDATE Medicos
        SET Estado = 0
        WHERE ID_Usuario = @ID_Usuario

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        DECLARE @mensaje VARCHAR(4000) = error_message()
        RAISERROR(@mensaje, 16, 1)
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[storedProcedureEliminarPaciente]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[storedProcedureEliminarPaciente] 
    @ID_Usuario BIGINT
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY

        -- Actualizar la tabla Usuarios
        UPDATE Usuarios
        SET Estado = 0
        WHERE ID_Usuario = @ID_Usuario

        --Actualizar tabla pacientes 
        UPDATE Pacientes
        SET Estado = 0
        WHERE ID_Usuario = @ID_Usuario

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        DECLARE @mensaje VARCHAR(4000) = error_message()
        RAISERROR(@mensaje, 16, 1)
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureIngresarEmpleado]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedureIngresarEmpleado]
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @Email VARCHAR(100),
    @DNI VARCHAR(20)
AS 
BEGIN
    BEGIN TRANSACTION
        BEGIN TRY
            DECLARE @ID_Usuario BIGINT
            DECLARE @ID_Administrativo BIGINT

            -- Insertar en la tabla Usuarios y obtener el ID generado
            INSERT INTO Usuarios (ID_Perfil, Email, Contraseña, Estado)
            VALUES (3, @Email, @DNI, 1)
            SET @ID_Usuario = SCOPE_IDENTITY()

            -- Insertar en la tabla Empleados administrativos
            INSERT INTO Administrativos (ID_Usuario, Nombre, Apellido, DNI, Estado)
            VALUES (@ID_Usuario, @Nombre, @Apellido, @DNI, 1)
        COMMIT TRANSACTION
        END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        DECLARE @mensaje VARCHAR(4000) = error_message()
        RAISERROR(@mensaje, 16, 1)
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureInsertarEspecialidad]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[storedProcedureInsertarEspecialidad]
    @Descripcion VARCHAR(1000)
AS
BEGIN
    INSERT INTO Especialidades(Nombre_E)
    VALUES(@Descripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureInsertarMedico]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[storedProcedureInsertarMedico]
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @Email VARCHAR(100),
    @DNI VARCHAR(20), 
    @Numero VARCHAR(50),
    @ID_Especialidad BIGINT
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        DECLARE @ID_Usuario BIGINT
        DECLARE @ID_Medico BIGINT

        -- Insertar en la tabla Usuarios y obtener el ID generado
        INSERT INTO Usuarios (ID_Perfil, Email, Contraseña, Estado)
        VALUES (2, @Email, @DNI, 1)
        SET @ID_Usuario = SCOPE_IDENTITY()

        -- Insertar en la tabla medicos
        INSERT INTO Medicos (ID_Usuario, Nombre, Apellido, DNI, Estado)
        VALUES (@ID_Usuario, @Nombre, @Apellido, @DNI, 1)
        SET @ID_Medico = SCOPE_IDENTITY()

        -- Insertar en la tabla telefonos
        INSERT INTO Telefonos (Numero, ID_Usuario)
        VALUES (@Numero, @ID_Usuario)


        --Insertar en tabla medicos-especialidaeas
        INSERT INTO MedicosEspecialidades(ID_Medico, ID_Especialidad)
        VALUES(@ID_Medico, @ID_Especialidad)


        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        DECLARE @mensaje VARCHAR(4000) = error_message()
        RAISERROR(@mensaje, 16, 1)
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureListarEspecialidad]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedureListarEspecialidad]
AS
BEGIN
SELECT ID_Especialidad, Nombre_E, Estado FROM Especialidades
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureListarMedicos]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[storedProcedureListarMedicos] AS
BEGIN
SELECT M.ID_Usuario, M.ID_Medico, M.Apellido, M.Nombre, U.Email, E.Nombre_E FROM Usuarios U
INNER JOIN Medicos M ON U.ID_Usuario = M.ID_Usuario
INNER JOIN MedicosEspecialidades ME ON ME.ID_Medico = M.ID_Medico
INNER JOIN Especialidades E ON E.ID_Especialidad = ME.ID_Especialidad
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureListarMedicosParaPersAdmin]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedProcedureListarMedicosParaPersAdmin] AS
BEGIN
Select M.ID_Usuario, M.ID_Medico, M.Legajo, M.Apellido, M.Nombre, U.Email, T.Numero AS 'Celular', M.DNI, E.Nombre_E AS 'Especialidad', E.ID_Especialidad, M.Estado from Medicos M
INNER JOIN Usuarios U ON U.ID_Usuario = M.ID_Usuario
INNER JOIN MedicosEspecialidades ME ON ME.ID_Medico = M.ID_Medico
INNER JOIN Especialidades E ON E.ID_Especialidad = ME.ID_Especialidad
INNER JOIN Telefonos T ON T.ID_Usuario = M.ID_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureListarPacientes]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[storedProcedureListarPacientes] AS
BEGIN
SELECT P.ID_Paciente, P.ID_Usuario, P.FechaNacimiento AS 'Fecha de nacimiento', P.Apellido, P.Nombre, P.DNI, U.Email, T.Numero AS 'Celular' FROM Pacientes P
INNER JOIN Usuarios U ON U.ID_Usuario = P.ID_Usuario
INNER JOIN Telefonos T ON T.ID_Usuario = P.ID_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedurelistarPAdministrativoSP]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedurelistarPAdministrativoSP]
AS
BEGIN
    SELECT A.ID_Usuario, A.ID_Administrativo, A.Apellido, A.Nombre,A.DNI, A.Legajo, U.Email, A.Estado FROM Administrativos A
    INNER JOIN Usuarios U ON U.ID_Usuario = A.ID_Usuario
END

GO
/****** Object:  StoredProcedure [dbo].[storedProcedureObtenerJornadaDeMedicoSegunFecha]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedProcedureObtenerJornadaDeMedicoSegunFecha]
    @idMedico INT,
    @fechaTurno NVARCHAR(100)
AS
BEGIN
	SELECT 
		* 
	FROM 
		JornadasMedicos
	LEFT JOIN
		Turnos ON Turnos.Fecha = CAST(@fechaTurno as date) AND Turnos.ID_Medico = @idMedico
	WHERE JornadasMedicos.ID_Medico = @idMedico
		AND DATEPART(dw, CAST(@fechaTurno as date)) = DiaSemana 
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureObtenerJornadasDeMedicos]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[storedProcedureObtenerJornadasDeMedicos] AS
BEGIN
    SELECT
        ID_Jornada, ID_Medico, DiaSemana, HoraEntrada, HoraSalida
    FROM
        JornadasMedicos
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureObtenerMedicos]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedProcedureObtenerMedicos] AS
BEGIN
    SELECT 
        Medicos.ID_Medico, Nombre, Apellido, MedicosEspecialidades.ID_Especialidad
    FROM
        Medicos
    INNER JOIN
        MedicosEspecialidades ON MedicosEspecialidades.ID_Medico = Medicos.ID_Medico
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureTraerUltimoIDMedico]    Script Date: 21/11/2024 21:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedureTraerUltimoIDMedico]
AS
BEGIN
SELECT TOP 1 ID_Medico
FROM Medicos
ORDER BY ID_Medico DESC;
END
GO
USE [master]
GO
ALTER DATABASE [DB_Clinica] SET  READ_WRITE 
GO
