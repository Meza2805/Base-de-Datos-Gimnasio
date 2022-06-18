
ALTER FUNCTION FCN_Cliente_Estado
(	
	@estado varchar(10)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT       C.Cedula, C.[Primer Nombre], C.[Segundo Nombre], C.[Primer Apellido], C.[Segundo Apellido], C.Fecha_Registro AS [FECHA DE REGISTRO], EC.Descripcion AS ESTADO
FROM            dbo.Cliente AS C INNER JOIN
                         dbo.Estado_Cliente AS EC ON C.ID_Estado = EC.ID_Estado
WHERE        (ec.Descripcion =@estado) AND (Cedula!= '000-000000-00000')
)
GO
