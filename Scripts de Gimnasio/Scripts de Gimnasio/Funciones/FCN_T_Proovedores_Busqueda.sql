CREATE FUNCTION FCN_T_Proovedores_Busqueda
(	
	@nombre varchar(35)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT       ID_Proveedor AS CODIGO, Nombre AS PROOVEDOR, Telefono, Direccion
FROM            dbo.Proveedor where Nombre = @nombre
)
GO