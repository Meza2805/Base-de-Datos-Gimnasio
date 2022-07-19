create proc SP_Mostra_Detalle_Venta
@id_factura int
as
begin
SELECT P.Nombre AS PRODUCTO,    ('C$' + ' '+CONVERT(VARCHAR(10),      (SELECT FORMAT(P.Precio, 'N1', 'en-us')) ))     AS [PRECIO UNITARIO], DFV.Cant_Producto AS CANTIDAD,  (PRECIO * Cant_Producto) AS TOTAL 
FROM Detalle_Factura_Venta DFV
	INNER JOIN Producto P ON DFV.ID_Producto = P.ID_Producto WHERE ID_Factura = @id_factura

end