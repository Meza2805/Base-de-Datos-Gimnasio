    create view Vw_Productos_Ropa
  as
  SELECT ID_Producto AS [CODIGO PRODUCTO],P.Nombre AS [PRODUCTO],('C$' + ' '+CONVERT(VARCHAR(10),Precio))as PRECIO,Stock AS STOCK,
  Descripcion_Producto AS [DESCRIPCION PRODUCTO],C.Descripcion AS CATEGORIA,M.Nombre AS MARCA FROM Producto P 
  INNER JOIN Categoria C ON P.ID_Categoria = C.ID_Categoria
  INNER JOIN Marca M ON P.ID_Marca = M.ID_Marca where c.Descripcion = 'ROPA DE FITNESS'