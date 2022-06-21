CREATE FUNCTION FCN_Detalle_venta_total
(	
	@Id_Factura int
)
RETURNS TABLE 
AS
RETURN 
(
SELECT       dfv.ID_Detalle, dfv.ID_Factura, p.Nombre, dfv.Cant_Producto, 'C$' + ' ' + CONVERT(VARCHAR(10), p.Precio) AS Precio_Unitario, 'C$' + ' ' + CONVERT(VARCHAR(10), dfv.Cant_Producto * p.Precio) AS Sub_Total
FROM            dbo.Detalle_Factura_Venta AS dfv INNER JOIN
                         dbo.Producto AS p ON dfv.ID_Producto = p.ID_Producto where dfv.ID_Factura = @Id_Factura
)
GO
