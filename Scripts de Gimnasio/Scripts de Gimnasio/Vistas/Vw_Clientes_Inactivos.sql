CREATE view Vw_Clientes_Inactivos
as
 SELECT Cedula AS CEDULA, [Primer Nombre] AS [PRIMER NOMBRE], [Segundo Nombre] AS [SEGUNDO NOMBRE], [Primer Apellido] AS [PRIMER APELLIDO],
 [Segundo Apellido] AS [SEGUNDO APELLIDO],
 Fecha_Registro [FECHA DE REGISTRO], EC.Descripcion AS ESTADO FROM Cliente C INNER JOIN Estado_Cliente EC
 ON C.ID_Estado = EC.ID_Estado WHERE C.ID_Estado = 'I'