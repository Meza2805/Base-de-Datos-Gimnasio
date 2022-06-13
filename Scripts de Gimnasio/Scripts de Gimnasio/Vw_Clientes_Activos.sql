CREATE VIEW Vw_Clientes_Activos
as
 SELECT Cedula as CEDULA, [Primer Nombre] as [PRIMER NOMBRE], [Segundo Nombre] AS [SEGUNDO NOMBRE], [Primer Apellido] AS [PRIMER APELLIDO], 
 [Segundo Apellido] AS [SEGUNDO APELLIDO] , Fecha_Registro AS [FECHA DE REGISTRO] , EC.Descripcion AS DESCRIPCION FROM Cliente C INNER JOIN Estado_Cliente EC
 ON C.ID_Estado = EC.ID_Estado WHERE C.ID_Estado = 'A'