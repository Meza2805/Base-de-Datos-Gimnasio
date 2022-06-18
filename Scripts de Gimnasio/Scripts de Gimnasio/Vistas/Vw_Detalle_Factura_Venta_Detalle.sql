create view Vw_Detalle_Factura_Venta_Detalle
as
select ID_Detalle,ID_Factura,p.Nombre,('C$' + ' '+CONVERT(VARCHAR(10),Precio)) AS Precio,Cant_Producto from Detalle_Factura_Venta dfv
inner join Producto p on dfv.ID_Producto = p.ID_Producto