create view Vw_Detalle_Factura_Venta_Detalle_Total
as
select ID_Detalle,ID_Factura,p.Nombre,Cant_Producto,('C$' + ' '+CONVERT(VARCHAR(10),Precio)) AS Precio_Unitario , 
('C$' + ' '+CONVERT(VARCHAR(10),(dfv.Cant_Producto * p.Precio))) as Sub_Total from Detalle_Factura_Venta dfv
inner join Producto p on dfv.ID_Producto = p.ID_Producto