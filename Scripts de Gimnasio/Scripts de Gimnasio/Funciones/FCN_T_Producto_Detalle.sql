CREATE FUNCTION FCN_T_Producto_Detalle
(	
)
RETURNS TABLE 
AS
RETURN 
(
SELECT       P.ID_Producto AS [CODIGO PRODUCTO], P.Nombre AS PRODUCTO, 'C$' + ' ' + CONVERT(VARCHAR(10), P.Precio) AS PRECIO, P.Stock, FC.Fecha AS [Fecha de Compra]
FROM            dbo.Producto AS P INNER JOIN
                         dbo.Categoria AS C ON P.ID_Categoria = C.ID_Categoria INNER JOIN
                         dbo.Marca AS M ON P.ID_Marca = M.ID_Marca INNER JOIN
                         dbo.Detalle_Factura_Compra AS dfc ON P.ID_Producto = dfc.ID_Producto INNER JOIN
                         dbo.Factura_Compra AS FC ON dfc.ID_Factura_Compra = FC.ID_Factura
)
GO
