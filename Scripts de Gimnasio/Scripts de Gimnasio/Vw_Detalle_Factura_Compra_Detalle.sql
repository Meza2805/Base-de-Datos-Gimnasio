create view Vw_Detalle_Factura_Compra_Detalle
as
select ID_Detalle,ID_Factura_Compra,p.Nombre, ('C$' + ' '+CONVERT(VARCHAR(10),costo)) as costo, ('C$' + ' '+CONVERT(VARCHAR(10),p.Precio)) as Precio ,dfc.Cant_Producto
from Detalle_Factura_Compra dfc 
inner join Producto p on dfc.ID_Producto = p.ID_Producto


