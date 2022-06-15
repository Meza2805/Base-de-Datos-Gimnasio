create view Vw_Detalle_Factura_Compra_Ganancia
as
select ID_Detalle,ID_Factura_Compra,p.Nombre, ('C$' + ' '+CONVERT(VARCHAR(10),costo)) as Precio_compra,
('C$' + ' '+CONVERT(VARCHAR(10),p.Precio)) as Precio_venta, dfc.Cant_Producto,
('C$' + ' '+CONVERT(VARCHAR(10),(p.Precio - dfc.Costo))) as Ganancia_Total
from Detalle_Factura_Compra dfc 
inner join Producto p on dfc.ID_Producto = p.ID_Producto