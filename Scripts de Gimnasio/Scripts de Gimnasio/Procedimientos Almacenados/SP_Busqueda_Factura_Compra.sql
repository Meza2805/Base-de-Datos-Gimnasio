alter proc SP_Busqueda_Factura_Compra
	@ID_Factura int
	as 
	begin
		if not exists(select top 1 ID_Factura from Factura_Venta with (nolock) where ID_Factura = @ID_Factura) 
		begin
			print 'LA FACTURA SOLICITADA NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
		ELSE
		BEGIN
			SELECT FC.ID_Factura AS [CODIGO DE FACTURA] , FC.Fecha AS FECHA, (E.[Primer Nombre] +' '+E.[Primer Apellido])AS EMPLEADO, P.Nombre AS PROOVEDOR, MP.Descripcion AS [MODO DE PAGO],FC.SubTotal AS [SUB TOTAL], FC.IVA AS IVA, FC.Total AS TOTAL
											FROM Factura_Compra FC
											INNER JOIN Empleado E ON FC.ID_Empleado = E.Cedula
											INNER JOIN Proveedor P ON FC.ID_Proveedor =  P.ID_Proveedor
											INNER JOIN Modo_Pago MP ON FC.ID_MPago = MP.ID_MPago
			where ID_Factura = @ID_Factura
		END
	end
