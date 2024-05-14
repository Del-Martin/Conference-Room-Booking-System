USE BookingSystem;

INSERT INTO Usuario (nombre, apellidos, correo, telefono, contrasena, fechaNacimiento, direccion, isAdmin)
VALUES
('María', 'Garcia', 'mgarcia@example.com', 5551234, 12345, STR_TO_DATE('15-08-1990', '%d-%m-%Y'), 'Calle Principal, 123', null),
('Juan', 'Rodríguez', 'jrodriguez@example.com', 5555678, 34567, STR_TO_DATE('22-04-1985', '%d-%m-%Y'), 'Avenida Central, 456', null),
('Ana', 'Lopez', 'alopez@example.com', 5559012, 09217, STR_TO_DATE('10-11-1995', '%d-%m-%Y'), 'Plaza Mayor, 789', null),
('Luis', 'Martínez', 'lmartinez@example.com', 5553456, 15623, STR_TO_DATE('03-07-1982', '%d-%m-%Y'), 'Paseo del Sol, 101', null),
('Sofía', 'González', 'sgonzalez@example.com', 5557890, 81234, STR_TO_DATE('18-09-1993', '%d-%m-%Y'), 'Callejón Estrecho, 202', TRUE),
('Pablo', 'Hernández', 'phernandez@example.com', 5552345, 23463, STR_TO_DATE('15-08-1990', '%d-%m-%Y'), 'Avenida del Parque, 303', null),
('Marta', 'Díaz', 'mdiaz@example.com', 5006789, 09458, STR_TO_DATE('12-12-1998', '%d-%m-%Y'), 'Camino Real, 404', null),
('Carlos', 'Sánchez', 'csanchez@example.com', 5551200, 42837, STR_TO_DATE('05-06-1980', '%d-%m-%Y'), 'Ronda Norte, 505', null),
('Laura', 'Pérez', 'lperez@example.com', 5555008, 21543, STR_TO_DATE('20-02-1991', '%d-%m-%Y'), 'Paseo del Río, 606', null),
('Diego', 'Castro', 'dcastro@example.com', 5522012, 12345, STR_TO_DATE('08-04-1987', '%d-%m-%Y'), 'Carrera Central, 707', TRUE);


INSERT INTO Reservas (id_usuario, codigoReserva, fechaReservaInicio, fechaReservaFinal, precio, estadoReserva, pago)
VALUES
(1, 'ABC123', STR_TO_DATE('2024-05-10 10:00', '%Y-%m-%d %H:%i'), STR_TO_DATE('2024-05-11 18:30', '%Y-%m-%d %H:%i'), 100.50, 'Confirmada', TRUE),
(3, 'DEF456', STR_TO_DATE('2024-05-11 09:00', '%Y-%m-%d %H:%i'), STR_TO_DATE('2024-05-11 19:00', '%Y-%m-%d %H:%i'), 120.75, 'Pendiente', FALSE),
(3, 'GHI789', STR_TO_DATE('2024-05-12 08:00', '%Y-%m-%d %H:%i'), STR_TO_DATE('2024-05-14 08:00', '%Y-%m-%d %H:%i'), 80.25, 'Cancelada', FALSE),
(7, 'JKL012', STR_TO_DATE('2024-05-13 07:00', '%Y-%m-%d %H:%i'), STR_TO_DATE('2024-05-15 07:00', '%Y-%m-%d %H:%i'), 90.00, 'Confirmada', TRUE),
(7, 'MNO345', STR_TO_DATE('2024-05-20 06:00', '%Y-%m-%d %H:%i'), STR_TO_DATE('2024-05-26 12:30', '%Y-%m-%d %H:%i'), 210.00, 'Pendiente', FALSE),
(7, 'PQR678', STR_TO_DATE('2024-05-15 05:00', '%Y-%m-%d %H:%i'), STR_TO_DATE('2024-05-17 21:00', '%Y-%m-%d %H:%i'), 95.75, 'Confirmada', TRUE),
(8, 'STU901', STR_TO_DATE('2024-05-16 04:00', '%Y-%m-%d %H:%i'), STR_TO_DATE('2024-05-18 04:00', '%Y-%m-%d %H:%i'), 85.50, 'Pendiente', FALSE),
(4, 'VWX234', STR_TO_DATE('2024-05-17 03:00', '%Y-%m-%d %H:%i'), STR_TO_DATE('2024-05-19 03:00', '%Y-%m-%d %H:%i'), 100.00, 'Cancelada', FALSE),
(9, 'YZA567', STR_TO_DATE('2024-05-18 02:00', '%Y-%m-%d %H:%i'), STR_TO_DATE('2024-05-20 02:00', '%Y-%m-%d %H:%i'), 115.25, 'Confirmada', TRUE),
(6, 'BCD890', STR_TO_DATE('2024-05-19 01:00', '%Y-%m-%d %H:%i'), STR_TO_DATE('2024-05-21 01:00', '%Y-%m-%d %H:%i'), 105.00, 'Pendiente', FALSE);


INSERT INTO Recordatorios (id_usuario, id_reserva, tipoRecordatorio)
VALUES
(1,1, 'email'),
(1,1, 'SMS'),
(3,2, 'email'),
(3,3, 'email'),
(7, 4, 'email'),
(7, 4, 'SMS'),
(7, 5, 'email'),
(7, 5, 'SMS'),
(7, 6, 'email'),
(7, 6, 'SMS'),
(8, 7, 'email'),
(4, 8, 'email'),
(9, 9, 'email'),
(9, 9, 'SMS'),
(6, 10, 'email');
SELECT * FROM Recordatorios;

INSERT INTO Reportes (descripcion)
VALUES
('Reporte de reservas realizadas por ubicación y fecha para análisis de demanda.'),
('Informe de cancelaciones de reservas con detalles de usuarios y salas afectadas.'),
('Análisis de uso de salas por capacidad y equipamiento para optimización de recursos.'),
('Reporte de disponibilidad de salas por hora y día para planificación de eventos.'),
('Informe de recordatorios enviados por correo electrónico y SMS para seguimiento de comunicaciones.'),
('Análisis de autenticaciones fallidas y medidas de seguridad implementadas.'),
('Reporte de cumplimiento de normativas de protección de datos y medidas de seguridad.'),
('Informe de tiempo de actividad del sistema y tiempos de respuesta para evaluación de rendimiento.'),
('Análisis de errores y degradación del rendimiento durante períodos de alta demanda.'),
('Informe de satisfacción del usuario y retroalimentación del sistema para mejora continua.');
SELECT * FROM Reportes;

INSERT INTO Salas (superficie, capacidad, disponibilidad, ubicacion, descripcion)
VALUES
(50, 20, TRUE, 'Planta baja', 'Sala de conferencias equipada con proyector y pizarra.'),
(80, 30, TRUE, 'Segundo piso', 'Sala de reuniones con capacidad para 30 personas.'),
(100, 50, TRUE, 'Tercer piso', 'Amplia sala para presentaciones con sistema de sonido.'),
(70, 25, TRUE, 'Cuarto piso', 'Sala de juntas con acceso a internet y videoconferencia.'),
(60, 15, TRUE, 'Quinto piso', 'Espacio para talleres y capacitaciones con mesas y sillas móviles.'),
(90, 40, TRUE, 'Sexto piso', 'Sala de eventos con iluminación ajustable y pantalla LED.'),
(120, 60, TRUE, 'Séptimo piso', 'Gran sala multiusos para conferencias y seminarios.'),
(40, 10, FALSE, 'Octavo piso', 'Espacio íntimo para reuniones pequeñas y entrevistas.'),
(150, 70, TRUE, 'Noveno piso', 'Sala principal para eventos corporativos con catering disponible.'),
(110, 55, TRUE, 'Décimo piso', 'Sala de trabajo en equipo con mobiliario moderno y acceso Wi-Fi.');
SELECT * FROM Salas;

INSERT INTO Equipamiento (id_equipamiento, tipoEquipamiento, estado, fechaRecepcion, cantidad)
VALUES -- aquí se podría crear un check en el que no se pueda poner fecha de recepcion si el estado es "disponible"
(1, 'Proyector', 'disponible', null , 5),
(2, 'Pizarra', 'en alquiler', '2024-05-11 09:00:00', 10),
(3, 'Micrófono', 'disponible', null, 8),
(4, 'Altavoces', 'disponible', null, 6),
(5, 'Sillas', 'en alquiler', '2024-05-14 12:00:00', 50),
(6, 'Mesas', 'disponible', null, 20),
(7, 'Cámara', 'en alquiler', '2024-05-16 14:00:00', 3),
(8, 'Atril', 'disponible', null, 2),
(9, 'Monitor', 'en alquiler', '2024-05-18 16:00:00', 4),
(10, 'Luces', 'disponible', null, 12);


INSERT INTO Admin_reporte (id_admin, id_reporte)
VALUES
(5,1),
(10,2),
(10,3),
(5,4),
(10,5),
(5,6),
(5,7),
(5,8),
(5,9),
(10,10);

INSERT INTO Reserva_reporte (id_reserva, id_reporte)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

INSERT INTO Reserva_sala (id_reserva, id_sala)
VALUES
(1,3),
(2,4),
(3,10),
(4,3),
(5,4),
(6,9),
(7,4),
(8,2),
(9,1),
(10,2);

INSERT INTO Sala_equipamiento (id_sala, id_equipamiento, fechaVinculacion, fechaDesvinculacion, cantidad)
VALUES 
(4, 1, '2024-05-13 10:00:00', '2024-05-15 18:00:00', 2),
(2, 2, '2024-05-14 09:30:00', '2024-05-15 17:30:00', 1),
(3, 3, '2024-05-15 14:00:00', '2024-05-17 14:00:00', 3),
(4, 4, '2024-05-16 11:00:00', '2024-05-17 18:00:00', 2),
(4, 5, '2024-05-17 10:30:00', '2024-05-19 12:00:00', 5),
(3, 6, '2024-05-18 09:00:00', '2024-05-19 09:00:00', 1),
(10, 7, '2024-05-19 10:00:00', '2024-05-20 18:00:00', 2),
(8, 8, '2024-05-20 08:30:00', '2024-05-20 19:30:00', 1),
(9, 9, '2024-05-21 13:00:00', '2024-05-22 15:00:00', 3),
(1, 10, '2024-05-22 09:00:00', '2024-05-23 17:00:00', 2),
(9, 2, '2024-05-20 08:30:00', '2024-05-20 20:30:00', 1),
(1, 2, '2024-05-24 13:00:00', '2024-05-25 15:00:00', 3),
(10, 1, '2024-05-28 09:00:00', '2024-05-28 17:00:00', 2);
SELECT * FROM Sala_equipamiento;

