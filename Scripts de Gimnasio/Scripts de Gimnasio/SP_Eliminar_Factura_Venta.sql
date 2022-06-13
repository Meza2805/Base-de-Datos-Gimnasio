create proc SP_Eliminar_Factura_Venta
@ID_Factura int
as
begin
	if not exists (select  top 1 ID_Factura from Factura_Venta with (nolock) where ID_Factura = @ID_Factura)
		begin
			print 'LA FACTURA SOLICITADA NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
	else
		begin
			delete from Factura_Venta
			where ID_Factura = @ID_Factura
		end
end
