create view Vw_Detalle_Factura_Venta_Detalle
as
select dfv.ID_Factura,p.Nombre,('C$' + ' '+CONVERT(VARCHAR(10),Precio)) AS Precio,Cant_Producto from Detalle_Factura_Venta dfv
inner join Producto p on dfv.ID_Producto = p.ID_Producto
inner join Factura_Venta fv on fv.ID_Factura = dfv.ID_Factura 
where
(Select CONVERT(varchar,fv.Fecha,103) )    = (Select CONVERT(varchar,GETDATE(),103) ) 