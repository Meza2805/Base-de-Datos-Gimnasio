
alter proc SP_Busqueda_Factura_Venta
@ID_Factura int
as
begin
	if not exists (select  top 1 ID_Factura from Factura_Venta with (nolock) where ID_Factura = @ID_Factura)
		begin
			print 'LA FACTURA SOLICITADA NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
	else
		begin
			select FV.ID_Factura as [CODIGO DE FACTURA], FV.Fecha AS [FECHA],(E.[Primer Nombre] +' '+ E.[Primer Apellido]) AS EMPLEADO,(C.[Primer Nombre]+' '+C.[Primer Apellido] )AS CLIENTE,FV.SubTotal AS [SUB TOTAL],FV.IVA AS [IVA],FV.Total AS [TOTAL], M.Descripcion AS [MODO DE PAGO] from Factura_Venta FV with (nolock) 
			inner join Modo_Pago M on FV.ID_MPago = M.ID_MPago
			INNER JOIN Empleado E on FV.ID_Empleado= E.ID_Empleado
			INNER JOIN Cliente C ON FV.ID_Cliente = C.ID_Cliente
			where ID_Factura = @ID_Factura
		end
end

	exec SP_Busqueda_Factura_Venta 4
