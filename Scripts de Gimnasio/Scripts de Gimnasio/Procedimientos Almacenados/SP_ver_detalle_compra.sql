create proc SP_ver_detalle_compra
@id_factura int
as
begin

select ID_Detalle,p.Nombre,     ('C$' + ' '+CONVERT(VARCHAR(10),  (SELECT FORMAT(costo, 'N1', 'en-us')) ))         as costo, 
('C$' + ' '+CONVERT(VARCHAR(10),  (SELECT FORMAT(P.Precio, 'N1', 'en-us')) )) as Precio ,dfc.Cant_Producto
from Detalle_Factura_Compra dfc 
inner join Producto p on dfc.ID_Producto = p.ID_Producto where dfc.ID_Factura_Compra = @id_factura

end