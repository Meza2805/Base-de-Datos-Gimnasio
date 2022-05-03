
alter proc SP_Busqueda_Factura_Venta
@ID_Factura int
as
begin
	if not exists (select * from Factura_Venta with (nolock) where ID_Factura = @ID_Factura)
		begin
			print 'LA FACTURA SOLICITADA NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
	else
		begin
			select * from Factura_Venta with (nolock) where ID_Factura = @ID_Factura
		end
end

	exec SP_Busqueda_Factura_Venta 8
