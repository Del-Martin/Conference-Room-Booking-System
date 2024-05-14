USE BookingSystem;

-- 1. ¿Qué salas se encuentran disponibles para alquilar actualmente? Josebeth
SELECT id_sala, superficie, capacidad, ubicacion, descripcion FROM Salas WHERE disponibilidad = true;

-- 2. ¿Hay salas ocupadas en la actualidad? Josebeth
SELECT * FROM Reservas WHERE fechaReservaInicio <= NOW() AND fechaReservaFinal >= NOW();

-- 3. ¿Cuántos administradores tiene la plataforma? Josebeth
SELECT COUNT(isAdmin) AS cantidad_admin FROM Usuario WHERE isAdmin = TRUE;

-- 4. ¿Cuáles son los datos de los administradores? Josebeth
SELECT * FROM Usuario WHERE isAdmin = TRUE;

-- 5. Datos de los usuarios que han realizado reservas y las fechas en que tiene las reservas. Josebeth
SELECT nombre, apellidos, telefono, codigoReserva, fechaReservaInicio, fechaReservaFinal FROM Reservas
INNER JOIN Usuario ON Usuario.id_usuario = Reservas.id_usuario;

-- 6. Equipos en alquiler y en qué sala se están utilizando. Josebeth
SELECT Salas.id_sala, descripcion, tipoEquipamiento, estado, Sala_equipamiento.cantidad FROM Equipamiento
INNER JOIN Sala_equipamiento ON Sala_equipamiento.id_equipamiento = Equipamiento.id_equipamiento
INNER JOIN Salas ON Salas.id_sala = Sala_equipamiento.id_sala
WHERE Equipamiento.estado = 'en alquiler'
ORDER BY id_sala asc;

-- 7. ¿Cuántas reservas tiene la sala 4? Antonella
SELECT id_sala, COUNT(id_reserva) AS total_reservas FROM Reserva_sala
WHERE Reserva_sala.id_sala = 4
GROUP BY id_sala;


-- 8. ¿Qué recordatorios tiene el usuario con el email 'csanchez@example.com'? Antonella
SELECT * FROM Recordatorios
INNER JOIN Usuario ON Usuario.id_usuario = Recordatorios.id_usuario
WHERE Usuario.correo = 'csanchez@example.com';


-- 9. Agrupa las reservas según el precio en 2 categorías, precio alto y precio bajo. Antonella
SELECT *, CASE WHEN Reservas.precio > (SELECT AVG(precio) FROM Reservas AS AVGPrecio) THEN 'Alto' ELSE 'Bajo' 
END AS Nivel_Reserva 
FROM Reservas;

SELECT AVG(precio) FROM Reservas AS AVGPrecio; -- 110


-- 10. Salas que han tenido más de 1 reserva y ordenar descendientemente. Antonella
SELECT id_sala, COUNT(id_sala) AS Total_Reservas_Sala FROM Reserva_sala
WHERE id_sala > 0
GROUP BY id_sala
ORDER BY Total_Reservas_Sala desc;


-- 11. Cambiar la superficie de 3 salas. Mostrar antes y después. Antonella
SELECT id_sala, superficie, REPLACE (
	superficie,
    CASE id_sala
		WHEN 1 THEN 50
        WHEN 2 THEN 80
        WHEN 3 THEN 100
        ELSE descripcion
	END,
    CASE id_sala
		WHEN 1 THEN 90
        WHEN 2 THEN 60
        WHEN 3 THEN 120
        ELSE descripcion
	END
) AS Superficie_modificada
FROM Salas;
        

-- 12. Mostrar el tipo de equipamiento utilizado más frecuentemente. Antonella
SELECT tipoEquipamiento, COUNT(se.id_equipamiento) AS Nº_veces_alquilado, SUM(se.cantidad) AS cantidad 
FROM Sala_equipamiento se
INNER JOIN Equipamiento e ON e.id_equipamiento = se.id_equipamiento
GROUP BY tipoEquipamiento
ORDER BY Nº_veces_alquilado desc
LIMIT 1;


-- 13. Mostrar total ingresos. Josebeth
SELECT SUM(precio) AS Total_ingresos FROM Reservas WHERE pago = TRUE;


-- 14. ¿Cuánto tiempo hay de diferencia entre las 2 últimas reservas? Antonella
WITH Ultimas_reservas AS (SELECT * FROM Reservas -- Probando WITH aunque no es necesario
ORDER BY fechaReservaFinal desc
LIMIT 2)
SELECT DATEDIFF(
(SELECT fechaReservaInicio FROM Ultimas_reservas ORDER BY fechaReservaFinal DESC LIMIT 1),
(SELECT fechaReservaInicio FROM Ultimas_reservas ORDER BY fechaReservaFinal DESC LIMIT 1 OFFSET 1)
) AS diferencia_días;

SELECT DATEDIFF( -- forma más optima
(SELECT fechaReservaInicio FROM Reservas ORDER BY fechaReservaFinal DESC LIMIT 1),
(SELECT fechaReservaInicio FROM Reservas ORDER BY fechaReservaFinal DESC LIMIT 1 OFFSET 1)
) AS diferencia_días;

-- 15. Muestra el recordatorio hecho de la última reserva hecha y la información asociada. Antonella
SELECT id_recordatorio, fechaRecordatorio, tipoRecordatorio, u.nombre, u.apellidos, re.fechaReservaInicio 
FROM Recordatorios r
INNER JOIN Usuario u ON u.id_usuario = r.id_usuario
INNER JOIN Reservas re ON re.id_usuario = r.id_usuario
ORDER BY re.fechaReservaInicio DESC
LIMIT 1;
