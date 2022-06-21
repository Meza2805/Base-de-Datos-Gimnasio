CREATE FUNCTION FCN_T_Producto_por_Categoria
(	
	@categoria varchar(30)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT       P.ID_Producto AS [CODIGO PRODUCTO], P.Nombre AS PRODUCTO, 'C$' + ' ' + CONVERT(VARCHAR(10), P.Precio) AS PRECIO, P.Stock, P.Descripcion_Producto AS [DESCRIPCION PRODUCTO], C.Descripcion AS CATEGORIA, 
                         M.Nombre AS MARCA
FROM            dbo.Producto AS P INNER JOIN
                         dbo.Categoria AS C ON P.ID_Categoria = C.ID_Categoria INNER JOIN
                         dbo.Marca AS M ON P.ID_Marca = M.ID_Marca
WHERE        (C.Descripcion = @categoria)
)
GO
