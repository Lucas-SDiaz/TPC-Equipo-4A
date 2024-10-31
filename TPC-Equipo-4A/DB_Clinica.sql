CREATE DATABASE DB_Clinica
GO
USE DB_Clinica
go
CREATE TABLE Perfil (
    ID_Perfil INT PRIMARY KEY IDENTITY(1, 1),
    Descripcion VARCHAR(100) NOT NULL,
)
CREATE TABLE Usuarios (
    ID_Usuario BIGINT PRIMARY KEY IDENTITY(1,1),
    ID_Perfil INT NOT NULL FOREIGN KEY REFERENCES Perfil(ID_Perfil), 
    Email VARCHAR(100) UNIQUE NOT NULL,
    Contraseña VARCHAR(100) NOT NULL,
    Estado BIT DEFAULT 1 -- 1 = Activo, 0 = Inactivo
)
CREATE TABLE AdministradorSistema(
    ID_AdministradorSistema BIGINT PRIMARY KEY IDENTITY(1,1),
    ID_Usuario BIGINT FOREIGN KEY REFERENCES Usuarios(ID_Usuario),
    Estado BIT DEFAULT 1 -- 1 = Activo, 0 = Inactivo
)
create table Especialidades (
    ID_Especialidad bigint primary key identity(1, 1),
    Nombre_E varchar(1000) not null
)
CREATE TABLE Medicos (
    ID_Medico BIGINT PRIMARY KEY IDENTITY(1, 1),
    ID_Usuario BIGINT NOT NULL FOREIGN KEY REFERENCES Usuarios(ID_Usuario),
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Legajo AS ('M' + CAST(ID_Medico AS VARCHAR)) PERSISTED,
    DNI VARCHAR(20) NOT NULL,
    Estado BIT DEFAULT 1 -- 1 = Activo, 0 = Inactivo
)
CREATE TABLE MedicosEspecialidades (
    ID_Medico BIGINT NOT NULL FOREIGN KEY REFERENCES Medicos(ID_Medico),
    ID_Especialidad BIGINT NOT NULL FOREIGN KEY REFERENCES Especialidades(ID_Especialidad),
    PRIMARY KEY (ID_Medico, ID_Especialidad) -- Combinación única
)
CREATE TABLE Administrativos (
    ID_Administrativo BIGINT PRIMARY KEY IDENTITY(1, 1),
    ID_Usuario BIGINT NOT NULL FOREIGN KEY REFERENCES Usuarios(ID_Usuario),
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    DNI VARCHAR(20) UNIQUE NOT NULL,
    Legajo AS ('A' + CAST(ID_Administrativo AS VARCHAR)) PERSISTED, -- Calcula el legajo
    Estado BIT DEFAULT 1 -- 1 = Activo, 0 = Inactivo
);
CREATE TABLE Pacientes(
    ID_Paciente BIGINT PRIMARY KEY IDENTITY(1,1),
    ID_Usuario BIGINT NOT NULL FOREIGN KEY REFERENCES Usuarios(ID_Usuario),
    Nombre VARCHAR(100) NOT NULL, 
    Apellido VARCHAR(100) NOT NULL,
    DNI VARCHAR(20) UNIQUE NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Estado BIT DEFAULT 1 -- 1 = Activo, 0 = Inactivo
)
CREATE TABLE Telefonos(
    ID_Tel BIGINT PRIMARY KEY IDENTITY(1,1),
    Numero VARCHAR(50) NOT NULL,
    ID_Usuario BIGINT NOT NULL FOREIGN KEY REFERENCES Usuarios(ID_Usuario),
)
CREATE TABLE Turnos(
    ID_Turno BIGINT PRIMARY KEY IDENTITY(1, 1),
    ID_Paciente BIGINT NOT NULL FOREIGN KEY REFERENCES Pacientes(ID_Paciente),
    ID_Medico BIGINT NOT NULL FOREIGN KEY REFERENCES Medicos(ID_Medico),
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL, 
    Estado VARCHAR(100) NOT NULL, 
)
CREATE TABLE Consultas(
    ID_Consulta BIGINT PRIMARY KEY IDENTITY(1, 1),
    FechaConsulta DATE NOT NULL,
    ID_Medico BIGINT NOT NULL FOREIGN KEY REFERENCES Medicos(ID_Medico),
    ID_Paciente BIGINT NOT NULL FOREIGN KEY REFERENCES Pacientes(ID_Paciente),
    Diagnostico VARCHAR(500),
    Tratamiento VARCHAR(500),
    Comentarios Varchar(200) 
)
CREATE TABLE JornadasMedicos(
    ID_Jornada BIGINT PRIMARY KEY IDENTITY(1, 1),
    ID_Medico BIGINT NOT NULL FOREIGN KEY REFERENCES Medicos(ID_Medico),
    DiaSemana TINYINT NOT NULL, --1 LUNES, 2 MARTES, 3 MIERCOLES....
    HoraEntrada TIME NOT NULL,
    HoraSalida TIME NOT NULL,
    Estado BIT DEFAULT 1
)

CREATE TABLE Domicilios(
    ID_Domicilio INT PRIMARY KEY IDENTITY(1,1),
    ID_Usuario BIGINT NOT NULL FOREIGN KEY REFERENCES Usuarios(ID_Usuario),
    Calle VARCHAR(255) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Piso varchar(10),
    Depto VARCHAR(10), 
    Ciudad VARCHAR(100) NOT NULL,
    Provincia VARCHAR(100) NOT NULL,
    CodigoPostal VARCHAR(10) NOT NULL
)
GO

-- PROCEDIMIENTOS ALMACENADOS
CREATE OR ALTER PROCEDURE storedProcedureListarPacientes AS
BEGIN
SELECT P.ID_Paciente, P.ID_Usuario, P.FechaNacimiento AS 'Fecha de nacimiento', P.Apellido + ', ' + P.Nombre AS 'Nombre y apellido', P.DNI, U.Email, T.Numero AS 'Celular' FROM Pacientes P
INNER JOIN Usuarios U ON U.ID_Usuario = P.ID_Usuario
INNER JOIN Telefonos T ON T.ID_Usuario = P.ID_Usuario
END
GO

CREATE OR ALTER PROCEDURE storedProcedureListarMedicos AS
BEGIN
SELECT M.ID_Usuario, M.ID_Medico, M.Apellido + ', ' + M.Nombre AS 'Nombre y apellido', U.Email, E.Nombre_E FROM Usuarios U
INNER JOIN Medicos M ON U.ID_Usuario = M.ID_Usuario
INNER JOIN MedicosEspecialidades ME ON ME.ID_Medico = M.ID_Medico
INNER JOIN Especialidades E ON E.ID_Especialidad = ME.ID_Especialidad
END
GO


INSERT INTO Perfil(Descripcion)
VALUES ('Administrador'), ('Médico'), ('Personal administrativo'), ('Paciente')

GO

-- INSERT USUARIO-MEDICO
INSERT INTO Usuarios(ID_Perfil, Email, Contraseña, Estado)
VALUES(2, 'psigomez@gmail.com', 'psico123', 1)
INSERT INTO Medicos(ID_Usuario, Nombre, Apellido, DNI, Estado)
VALUES(1, 'Claudia', 'Gómez', '32113454', 1)
GO
-- INSERT USUARIO-ADMINISTRATIVO
INSERT INTO Usuarios(ID_Perfil, Email, Contraseña, Estado)
VALUES(3, 'administrativoclinica@gmail.com', 'turnos123', 1)
INSERT INTO Administrativos(ID_Usuario, Nombre, Apellido, DNI, Estado)
values(3, 'Pablo', 'Pérez', '28777666', 1)

-- INSERT USUARIO-PACIENTE
INSERT INTO Usuarios(ID_Perfil, Email, Contraseña, Estado)
VALUES(4, 'lurot@gmail.com', 'luli', 1)
INSERT INTO Pacientes(ID_Usuario, Nombre, Apellido, DNI, FechaNacimiento)
VALUES(2, 'Lucia', 'Rotela Cabral', '39108221', '1995-09-27')
INSERT INTO Telefonos(Numero, ID_Usuario)
VALUES('2257343434', 2)
INSERT INTO Domicilios(ID_Usuario, Calle, Numero, Piso, Depto, Ciudad, Provincia, CodigoPostal)
VALUES(2, 'Buenos Aires', '2000', '4', 'F', 'Mar Del Plata', 'Buenos Aires', '7600')


INSERT INTO Especialidades(Nombre_E)
VALUES('Psicología')
INSERT INTO Especialidades(Nombre_E)
VALUES('Pediatría')
INSERT INTO Especialidades(Nombre_E)
VALUES('Cardiología')
INSERT INTO Especialidades(Nombre_E)
VALUES('Nutrición')

INSERT INTO MedicosEspecialidades(ID_Medico, ID_Especialidad)
values(1, 1)
