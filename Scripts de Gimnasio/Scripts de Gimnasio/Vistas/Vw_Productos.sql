  alter view Vw_Producto
  as
  SELECT ID_Producto AS [CODIGO],P.Nombre AS [PRODUCTO],('C$' + ' '+CONVERT(VARCHAR(10),Precio))as PRECIO,Stock AS STOCK,C.Descripcion AS CATEGORIA,M.Nombre AS MARCA FROM Producto P 
  INNER JOIN Categoria C ON P.ID_Categoria = C.ID_Categoria
  INNER JOIN Marca M ON P.ID_Marca = M.ID_Marca where p.Stock > 0 order by p.Stock

