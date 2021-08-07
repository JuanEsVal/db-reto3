--Obtener el nombre de la constructora, la fecha de inicio y la clasificación para la ciudad de “Armenia”.
SELECT p.Constructora, p.Fecha_Inicio, p.Clasificacion
FROM Proyecto p
WHERE p.ciudad = 'Armenia';


--Obtener el proveedor, la cantidad y el valor pagado de la tabla Compra, el nombre 
--del material de construcción sea igual a “Cemento” y se encuentre pago.
SELECT c.Proveedor, c.Cantidad, c.Pagado , mc.Nombre_Material 
FROM Compra c, MaterialConstruccion mc
WHERE c.ID_MaterialConstruccion = mc.ID_MaterialConstruccion AND mc.Nombre_Material = 'Cemento' AND c.Pagado = 'Si';


--Sumar las cantidades de la tabla Compra que se le han comprado al proveedor “Cementos El Dorado”.
SELECT SUM(c.Cantidad)
FROM Compra c
WHERE c.Proveedor = 'Cementos El Dorado';

--Mostrar de la tabla Líder el nombre, el primer apellido y segundo apellido en una sola columna separado por 
--espacios en blanco, utilice el alias "Nombre Líder" de los que tengan como ciudad de residencia "Paris”.
--SELECT CONCAT(l.Nombre, ' ', l.Primer_Apellido, ' ', l.Segundo_Apellido) as "Nombre Líder" 
SELECT (l.Nombre ||' ' || l.Primer_Apellido ||' ' || l.Segundo_Apellido) AS "Nombre Líder"
FROM Lider l 
WHERE l.Ciudad_Residencia = 'Paris';


--Obtener de la tabla Proyecto, cuántos acabados (Asigne el alias "Acabado") ha construido cada constructora, 
--el nombre de la constructora y adicionalmente de esos acabados construidos cuántos están por encima de 80.
SELECT COUNT(p.Acabados) AS Acabado, p.Constructora
from Proyecto p
GROUP BY p.Constructora
HAVING Acabado > 80;
