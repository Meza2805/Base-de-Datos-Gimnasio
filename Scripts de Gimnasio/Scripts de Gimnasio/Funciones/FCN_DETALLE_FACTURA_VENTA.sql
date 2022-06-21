CREATE FUNCTION FCN_DETALLE_FACTURA_VENTA
(	@Id_Factura int
)
RETURNS TABLE 
AS
RETURN 
(
SELECT       dfv.ID_Detalle, dfv.ID_Factura, p.Nombre, 'C$' + ' ' + CONVERT(VARCHAR(10), p.Precio) AS Precio, dfv.Cant_Producto
FROM            dbo.Detalle_Factura_Venta AS dfv INNER JOIN
                         dbo.Producto AS p ON dfv.ID_Producto = p.ID_Producto where dfv.ID_Factura = @Id_Factura
)
GO
