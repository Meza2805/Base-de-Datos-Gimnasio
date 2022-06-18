create proc SP_Eliminar_Factura_Compra
	@ID_Factura int
	as 
	begin
		if not exists(select top 1 ID_Factura from Factura_Venta with (nolock) where ID_Factura = @ID_Factura) 
		begin
			print 'LA FACTURA SOLICITADA NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
		ELSE
		BEGIN
			delete from Factura_Compra
			where ID_Factura = @ID_Factura
		END
	end