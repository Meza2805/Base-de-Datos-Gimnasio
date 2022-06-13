create proc SP_Actualizar_Factura_Compra
@id int,
@fecha date,
@id_emplado char(16),
@id_proovedor int,
@id_mpago int 
as 
begin
	if not exists (select top 1 ID_Factura from Factura_Venta where ID_Factura = @id)
	begin
		print'LA FACTURA NO EXISTE EN LA BASE DE DATOS'
	end
	else
	begin
		update Factura_Compra set Fecha=@fecha, ID_Empleado=@id_emplado,ID_Proveedor=@id_proovedor,ID_MPago=@id_mpago
		where ID_Factura=@id
	end
end




select * from Factura_Compra
sp_help Factura_Compra