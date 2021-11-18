/* Cursor que muestra los datos del cliente con los artículos o bienes (cantidad) que se han trasladado de un lugar a otro */

DO $$

DECLARE 
	datos_cliente Record;
	Cur_datos Cursor for select
	(CLIENTE.NOMBRE_CLIENTE ||' '|| CLIENTE.APELL_CLIENTE) AS NOMBRES,
	DETALLE_FACTURA.CANTIDAD_ART AS CANTIDAD,
	SERVICIO_MUDANZA.CIUDAD_MUDANZA AS CIUDAD
FROM SERVICIO_MUDANZA
	INNER JOIN DETALLE_FACTURA ON SERVICIO_MUDANZA.ID_MUDANZA = DETALLE_FACTURA.ID_MUDANZA
	INNER JOIN FACTURA ON DETALLE_FACTURA.ID_FACTURA = FACTURA.ID_FACTURA
	INNER JOIN CLIENTE ON FACTURA.ID_CLIENTE = CLIENTE.ID_CLIENTE;
BEGIN
	OPEN Cur_datos;
	FETCH Cur_datos INTO datos_cliente;
	WHILE (found) Loop
	RAISE NOTICE
	'	Cliente: %
		Cantidad de artículos trasladados: %
		Ciudad de mudanza: %    ',
		datos_cliente.NOMBRES, datos_cliente.CANTIDAD, datos_cliente.CIUDAD;
	FETCH Cur_Datos INTO datos_cliente;
end Loop;

end $$

language 'plpgsql';