/* Consulta para realizar el diagrama de barras (ingresos anuales
                       de la empresa) */
					 
SELECT 
EXTRACT (year from servicio_mudanza.FECHAINICIO_MUDANZA) AS fecha, SUM(factura.TOTAL) 
FROM servicio_mudanza
INNER JOIN detalle_factura ON detalle_factura.ID_MUDANZA = servicio_mudanza.ID_MUDANZA
INNER JOIN factura ON factura.ID_FACTURA = detalle_factura.ID_FACTURA
GROUP BY 1
ORDER BY 1 ASC