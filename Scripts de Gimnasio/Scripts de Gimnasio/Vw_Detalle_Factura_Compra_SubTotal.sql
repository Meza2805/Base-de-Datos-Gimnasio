create view Vw_Detalle_Factura_Compra_SubTotal
as
select ID_Detalle,ID_Factura_Compra,p.Nombre, ('C$' + ' '+CONVERT(VARCHAR(10),costo)) as Precio_compra,
('C$' + ' '+CONVERT(VARCHAR(10),p.Precio)) as Precio_venta ,dfc.Cant_Producto, 
('C$' + ' '+CONVERT(VARCHAR(10),(dfc.Costo * dfc.Cant_Producto)))  as Sub_total_Compra
from Detalle_Factura_Compra dfc 
inner join Producto p on dfc.ID_Producto = p.ID_Producto