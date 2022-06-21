CREATE FUNCTION FCN_T_Detalle_Factura_Compra
(	
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT    dfc.ID_Detalle, dfc.ID_Factura_Compra, p.Nombre, 'C$' + ' ' + CONVERT(VARCHAR(10), dfc.Costo) AS costo, 'C$' + ' ' + CONVERT(VARCHAR(10), p.Precio) AS Precio, dfc.Cant_Producto
FROM       dbo.Detalle_Factura_Compra AS dfc INNER JOIN
                         dbo.Producto AS p ON dfc.ID_Producto = p.ID_Producto
)
GO
