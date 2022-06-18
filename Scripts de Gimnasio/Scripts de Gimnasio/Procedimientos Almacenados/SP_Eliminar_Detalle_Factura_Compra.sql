create proc SP_Eliminar_Detalle_Factura_Compra
@id int,
@id_factura int,
@id_producto int,
@costo decimal (12,2),
@cant int
as 
begin
	if not exists (select top 1 ID_Detalle from Detalle_Factura_Compra where ID_Detalle=@id)
	begin
		print 'EL DETALLE NO SE ENCUENTRA EN LA BASE DE DATOS'
	end	
	else
	begin
		delete from Detalle_Factura_Compra
		 where ID_Detalle = @id
	end
end

