/* Consulta que define el número de mudanzas que ha hecho un cliente */)

SELECT cliente.ID_CLIENTE AS cliente, cliente.NOMBRE_CLIENTE AS nombre, cliente.APELL_CLIENTE as APELLIDO,
       COUNT(factura.ID_CLIENTE) AS numero_mudanzas
	   FROM cliente
	   INNER JOIN factura ON cliente.ID_CLIENTE = factura.ID_CLIENTE
	   GROUP BY 1, 2, 3
	   ORDER BY numero_mudanzas DESC
	   
/* La función actualizar_mudanzas */
	   
CREATE FUNCTION ACTUALIZAR_MUDANZAS() RETURNS TRIGGER AS $$

BEGIN
	UPDATE SERVICIO_MUDANZAS SET NUMERO_MUDANZAS = (NUMERO_MUDANZAS + 1)
	WHERE ID_MUDANZA = NEW.ID_MUDANZA;
	RETURN NULL;
END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER ACTUALIZAR_MUDANZAS 
AFTER INSERT ON SERVICIO_MUDANZA FOR EACH ROW
EXECUTE PROCEDURE ACTUALIZAR_MUDANZAS();

/* Ejemplo de inserción */

insert into factura values ('659', '1019', '415.21', '49.85', '461.82')