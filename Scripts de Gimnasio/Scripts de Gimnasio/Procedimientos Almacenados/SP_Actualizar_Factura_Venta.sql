create proc SP_Actualizar_Factura_Venta
@id int,
@fecha date,
@id_cliente char(16),
@id_empleado char(16),
@id_m_pago int
as
begin
	if not exists (select top 1 ID_Factura from Factura_Venta where ID_Factura = @id)
	begin
		print 'LA FACTURA NO EXISTE EN LA BASE DE DATOS'
	end
	ELSE
	BEGIN
		UPDATE Factura_Venta SET Fecha=@fecha,ID_Cliente=@id_cliente,ID_Empleado=@id_empleado,ID_MPago=@id_m_pago
		where ID_Factura = @id
	END
end