DROP DATABASE IF EXISTS BookingSystem;
CREATE DATABASE BookingSystem;
USE BookingSystem;

CREATE TABLE Usuario (
id_usuario INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR  (50),
apellidos VARCHAR (100),
correo VARCHAR (50) UNIQUE,
telefono INT UNIQUE,
contrasena VARCHAR (50),
fechaNacimiento DATE,
direccion VARCHAR (100),
fechaCreacionUsuario TIMESTAMP NOT NULL DEFAULT (NOW()),
isAdmin BOOLEAN DEFAULT FALSE,
PRIMARY KEY (id_usuario)
);

CREATE TABLE Reservas (
id_reserva INT NOT NULL AUTO_INCREMENT,
id_usuario INT NOT NULL,
codigoReserva VARCHAR (20) NOT NULL,
fechaReservaInicio DATETIME NOT NULL,
fechaReservaFinal DATETIME NOT NULL,
precio FLOAT NOT NULL,
estadoReserva VARCHAR (50),
pago BOOLEAN,
PRIMARY KEY (id_reserva, id_usuario),
FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario)
);

DROP TABLE IF EXISTS Recordatorios;
CREATE TABLE Recordatorios (
id_recordatorio INT NOT NULL AUTO_INCREMENT,
id_usuario INT NOT NULL,
id_reserva INT NOT NULL,
fechaRecordatorio TIMESTAMP NOT NULL DEFAULT (NOW()),
tipoRecordatorio VARCHAR (50),
PRIMARY KEY (id_recordatorio),
FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
FOREIGN KEY (id_reserva) REFERENCES Reservas (id_reserva)
);

DROP TABLE IF EXISTS Reportes;
CREATE TABLE Reportes (
id_reportes INT NOT NULL AUTO_INCREMENT,
fechaReporte TIMESTAMP NOT NULL DEFAULT (NOW()),
descripcion VARCHAR (255),
PRIMARY KEY (id_reportes)
);

CREATE TABLE Salas (
id_sala INT NOT NULL AUTO_INCREMENT,
superficie INT NOT NULL,
capacidad INT NOT NULL,
disponibilidad BOOLEAN NOT NULL DEFAULT TRUE,
ubicacion VARCHAR (50),
descripcion VARCHAR (1000),
PRIMARY KEY (id_sala)
);

DROP TABLE IF EXISTS Equipamiento;
CREATE TABLE Equipamiento (
id_equipamiento INT NOT NULL,
tipoEquipamiento VARCHAR (50) NOT NULL,
estado ENUM('disponible', 'en alquiler') NOT NULL,
fechaRecepcion DATETIME,
cantidad INT NOT NULL,
PRIMARY KEY (id_equipamiento)
);

CREATE TABLE Admin_reporte (
id_admin INT NOT NULL,
id_reporte INT NOT NULL,
PRIMARY KEY (id_admin, id_reporte),
FOREIGN KEY (id_admin) REFERENCES Usuario (id_usuario),
FOREIGN KEY (id_reporte) REFERENCES Reportes (id_reportes)
);

CREATE TABLE Reserva_reporte (
id_reserva INT NOT NULL,
id_reporte INT NOT NULL,
PRIMARY KEY (id_reserva, id_reporte),
FOREIGN KEY (id_reserva) REFERENCES Reservas (id_reserva),
FOREIGN KEY (id_reporte) REFERENCES Reportes (id_reportes)
);

CREATE TABLE Reserva_sala (
id_reserva INT NOT NULL,
id_sala INT NOT NULL,
PRIMARY KEY (id_reserva, id_sala),
FOREIGN KEY (id_reserva) REFERENCES Reservas (id_reserva),
FOREIGN KEY (id_sala) REFERENCES Salas (id_sala)
);

DROP TABLE IF EXISTS Sala_equipamiento;
CREATE TABLE Sala_equipamiento (
id_sala INT NOT NULL,
id_equipamiento INT NOT NULL,
fechaVinculacion DATETIME NOT NULL,
fechaDesvinculacion DATETIME NOT NULL,
cantidad INT NOT NULL,
PRIMARY KEY (id_sala, id_equipamiento),
FOREIGN KEY (id_sala) REFERENCES Salas (id_sala),
FOREIGN KEY (id_equipamiento) REFERENCES Equipamiento (id_equipamiento)
);
