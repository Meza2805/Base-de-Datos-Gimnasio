  create view Vw_Productos_Accesorios_Fecha
  as
  SELECT p.ID_Producto AS [CODIGO PRODUCTO],P.Nombre AS [PRODUCTO],('C$' + ' '+CONVERT(VARCHAR(10),Precio))as PRECIO
  ,Stock AS STOCK, fc.Fecha as [Fecha de Compra]
   FROM Producto P 
  INNER JOIN Categoria C ON P.ID_Categoria = C.ID_Categoria
  INNER JOIN Marca M ON P.ID_Marca = M.ID_Marca
  INNER JOIN Detalle_Factura_Compra dfc on p.ID_Producto = dfc.ID_Producto
  INNER JOIN Factura_Compra FC ON DFC.ID_Factura_Compra = FC.ID_Factura
