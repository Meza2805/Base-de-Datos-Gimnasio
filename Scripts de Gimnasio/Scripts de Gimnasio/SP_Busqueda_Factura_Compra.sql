alter proc SP_Busqueda_Factura_Producto
	@ID_Factura int
	as 
	begin
		if not exists(select * from Factura_Venta with (nolock) where ID_Factura = @ID_Factura) 
		begin
			print 'LA FACTURA SOLICITADA NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
		ELSE
		BEGIN
			select * from Factura_Venta with (nolock) where ID_Factura = @ID_Factura
		END
	end

SP_Busqueda_Factura_Producto 900
select * from Factura_Compra
