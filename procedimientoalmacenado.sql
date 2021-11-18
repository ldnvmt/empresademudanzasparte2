/*  Procedimiento almacenado para devolver los artículos de la empresa (vehículo) */

CREATE OR REPLACE FUNCTION NOMB_ASESOR(VARCHAR) RETURNS SETOF "record"
AS
$BODY$
SELECT 
	asesor.nombre_asesor as Asesor, 
	vehiculo.MARCA_VEHICULO as Marca, 
	vehiculo.MODELO_VEHICULO as Modelo
FROM asesor 
	INNER JOIN vehiculo ON vehiculo.ID_ASESOR = asesor.ID_ASESOR
	WHERE ASESOR.NOMBRE_ASESOR = $1
$BODY$
LANGUAGE SQL;

/*  Verificación */

SELECT * FROM NOMB_ASESOR('Lionel')
AS ("nomb_asesor" text, "marca" text, "modelo" text)
			