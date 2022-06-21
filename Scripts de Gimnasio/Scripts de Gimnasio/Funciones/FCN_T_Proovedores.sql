
CREATE FUNCTION FCN_T_Proovedores
(	

)
RETURNS TABLE 
AS
RETURN 
(
	SELECT       ID_Proveedor AS CODIGO, Nombre AS PROOVEDOR, Telefono, Direccion
FROM            dbo.Proveedor
)
GO
