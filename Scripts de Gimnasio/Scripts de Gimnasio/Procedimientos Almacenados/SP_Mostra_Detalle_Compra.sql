alter proc SP_Mostra_Detalle_Compra
@id_factura int
as
begin
select p.Nombre AS PRODUCTO,  ('C$' + ' '+CONVERT(VARCHAR(10),     (SELECT FORMAT(d.Costo, 'N1', 'en-us') )  )) AS [COSTO UNITARIO]  , d.Cant_Producto AS CANTIDAD ,
    (d.Costo * d.Cant_Producto)     as TOTAL
from Detalle_Factura_Compra d 
inner join Producto p on p.ID_Producto = d.ID_Producto where d.ID_Factura_Compra = @id_factura
end


(SELECT FORMAT(4515634.6334, 'N1', 'en-us')) AS 'Number'