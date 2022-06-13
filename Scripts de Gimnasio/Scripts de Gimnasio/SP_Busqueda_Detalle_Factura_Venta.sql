create proc SP_Busqueda_Detalle_Factura_Venta
@id_detalle int,
@id_factura int,
@id_producto int,
@cantidad int
as
begin
	if not exists (select top 1 ID_Detalle from Detalle_Factura_Venta where ID_Detalle = @id_detalle)
		begin
			print 'EL DETALLE DE FACTURA NO EXISTE EN LA BASE DE DATOS'
		end
	else
		begin
			select ID_Detalle,ID_Factura,ID_Producto,Cant_Producto from Detalle_Factura_Venta
			where ID_Detalle = @id_detalle
		end
end
