USE [DB_Clinica]
GO
/****** Object:  Table [dbo].[AdministradorSistema]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  Table [dbo].[Administrativos]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  Table [dbo].[Consultas]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  Table [dbo].[Domicilios]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  Table [dbo].[Especialidades]    Script Date: 6/11/2024 22:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[ID_Especialidad] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre_E] [varchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JornadasMedicos]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  Table [dbo].[Medicos]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  Table [dbo].[MedicosEspecialidades]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  Table [dbo].[Pacientes]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  Table [dbo].[Perfil]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  Table [dbo].[Telefonos]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  Table [dbo].[Turnos]    Script Date: 6/11/2024 22:55:30 ******/
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
	[Estado] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 6/11/2024 22:55:30 ******/
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
SET IDENTITY_INSERT [dbo].[Administrativos] ON 

INSERT [dbo].[Administrativos] ([ID_Administrativo], [ID_Usuario], [Nombre], [Apellido], [DNI], [Estado]) VALUES (1, 3, N'Pablo', N'Pérez', N'28777666', 1)
SET IDENTITY_INSERT [dbo].[Administrativos] OFF
GO
SET IDENTITY_INSERT [dbo].[Domicilios] ON 

INSERT [dbo].[Domicilios] ([ID_Domicilio], [ID_Usuario], [Calle], [Numero], [Piso], [Depto], [Ciudad], [Provincia], [CodigoPostal]) VALUES (1, 2, N'Buenos Aires', N'2242', N'10', N'F', N'Mar Del Plata', N'Buenos Aires', N'7600')
INSERT [dbo].[Domicilios] ([ID_Domicilio], [ID_Usuario], [Calle], [Numero], [Piso], [Depto], [Ciudad], [Provincia], [CodigoPostal]) VALUES (2, 13, N'Buenos Aires', N'2242', N'10', N'F', N'Mar del Plata', N'Buenos Aires', N'7600')
SET IDENTITY_INSERT [dbo].[Domicilios] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidades] ON 

INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (1, N'Psicología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (2, N'Pediatría')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (3, N'Cardiología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (4, N'Nutrición')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (5, N'Neurología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (6, N'Dermatología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (7, N'Ginecología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (8, N'Oftalmología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (9, N'Otorrinolaringología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (10, N'Urología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (11, N'Kinesiología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (12, N'Endocrinología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (13, N'Reumatología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (14, N'Oncología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (15, N'Gastroenterología')
INSERT [dbo].[Especialidades] ([ID_Especialidad], [Nombre_E]) VALUES (16, N'Traumatología')
SET IDENTITY_INSERT [dbo].[Especialidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicos] ON 

INSERT [dbo].[Medicos] ([ID_Medico], [ID_Usuario], [Nombre], [Apellido], [DNI], [Estado]) VALUES (1, 1, N'Claudia', N'Gómez', N'32113454', 1)
INSERT [dbo].[Medicos] ([ID_Medico], [ID_Usuario], [Nombre], [Apellido], [DNI], [Estado]) VALUES (2, 5, N'Héctor Juan', N'Rodríguez', N'16554888', 1)
INSERT [dbo].[Medicos] ([ID_Medico], [ID_Usuario], [Nombre], [Apellido], [DNI], [Estado]) VALUES (9, 12, N'René', N'Favaloro', N'12312311', 1)
SET IDENTITY_INSERT [dbo].[Medicos] OFF
GO
INSERT [dbo].[MedicosEspecialidades] ([ID_Medico], [ID_Especialidad]) VALUES (1, 1)
INSERT [dbo].[MedicosEspecialidades] ([ID_Medico], [ID_Especialidad]) VALUES (2, 3)
INSERT [dbo].[MedicosEspecialidades] ([ID_Medico], [ID_Especialidad]) VALUES (9, 3)
GO
SET IDENTITY_INSERT [dbo].[Pacientes] ON 

INSERT [dbo].[Pacientes] ([ID_Paciente], [ID_Usuario], [Nombre], [Apellido], [DNI], [FechaNacimiento], [Estado]) VALUES (1, 2, N'Lucia', N'Rotela Cabral', N'39108221', CAST(N'1995-09-27' AS Date), 1)
INSERT [dbo].[Pacientes] ([ID_Paciente], [ID_Usuario], [Nombre], [Apellido], [DNI], [FechaNacimiento], [Estado]) VALUES (2, 13, N'Lucas Santiago', N'Diaz', N'38677310', CAST(N'1995-04-11' AS Date), 1)
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
SET IDENTITY_INSERT [dbo].[Telefonos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (1, 2, N'psigomez@gmail.com', N'psico123', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (2, 4, N'lurot@gmail.com', N'luli', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (3, 3, N'administrativoclinica@gmail.com', N'turnos123', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (4, 1, N'admin@clinica.com.ar', N'123', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (5, 2, N'hrcardio@gmail.com', N'racing', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (12, 2, N'rfavaloro@gmail.com', N'12312311', 1)
INSERT [dbo].[Usuarios] ([ID_Usuario], [ID_Perfil], [Email], [Contraseña], [Estado]) VALUES (13, 4, N'ldiaz@gmail.copm', N'123', 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Administ__C035B8DD0802CA9F]    Script Date: 6/11/2024 22:55:30 ******/
ALTER TABLE [dbo].[Administrativos] ADD UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Paciente__C035B8DDE3237167]    Script Date: 6/11/2024 22:55:30 ******/
ALTER TABLE [dbo].[Pacientes] ADD UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__A9D105349C0CEA8C]    Script Date: 6/11/2024 22:55:30 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdministradorSistema] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Administrativos] ADD  DEFAULT ((1)) FOR [Estado]
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
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[Medicos] ([ID_Medico])
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Pacientes] ([ID_Paciente])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([ID_Perfil])
REFERENCES [dbo].[Perfil] ([ID_Perfil])
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureBuscarMedicoID]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  StoredProcedure [dbo].[storedProcedureEditarMedico]    Script Date: 6/11/2024 22:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[storedProcedureEditarMedico]
    @ID_Usuario BIGINT,
    
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
        DECLARE @ID_Medico BIGINT
        DECLARE @MedicoOutput TABLE (ID_Medico BIGINT) 


        -- Actualizar la tabla Usuarios
        UPDATE Usuarios
        SET Email = @Email
        WHERE ID_Usuario = @ID_Usuario

        --Actualizar tabla medicos 
        UPDATE Medicos
        SET Nombre = @Nombre, Apellido = @Apellido, DNI = @DNI
        OUTPUT INSERTED.ID_Medico INTO @MedicoOutput 
        WHERE ID_Usuario = @ID_Usuario

        SELECT @ID_Medico = ID_Medico FROM @MedicoOutput

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
/****** Object:  StoredProcedure [dbo].[storedProcedureEliminarMedico]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  StoredProcedure [dbo].[storedProcedureInsertarMedico]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  StoredProcedure [dbo].[storedProcedureListarEspecialidad]    Script Date: 6/11/2024 22:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[storedProcedureListarEspecialidad]
AS
BEGIN
SELECT ID_Especialidad, Nombre_E FROM Especialidades
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureListarMedicos]    Script Date: 6/11/2024 22:55:30 ******/
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
/****** Object:  StoredProcedure [dbo].[storedProcedureListarMedicosParaPersAdmin]    Script Date: 6/11/2024 22:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedProcedureListarMedicosParaPersAdmin] AS
BEGIN
Select M.ID_Usuario, M.ID_Medico, M.Legajo, M.Apellido, M.Nombre, U.Email, T.Numero AS 'Celular', E.Nombre_E AS 'Especialidad', M.Estado from Medicos M
INNER JOIN Usuarios U ON U.ID_Usuario = M.ID_Usuario
INNER JOIN MedicosEspecialidades ME ON ME.ID_Medico = M.ID_Medico
INNER JOIN Especialidades E ON E.ID_Especialidad = ME.ID_Especialidad
INNER JOIN Telefonos T ON T.ID_Usuario = M.ID_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[storedProcedureListarPacientes]    Script Date: 6/11/2024 22:55:30 ******/
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
