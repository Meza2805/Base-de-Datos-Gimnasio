alter proc SP_Eliminar_Proovedor
@ID_Proovedor int
as
begin
	if not exists (select top 1 ID_Proveedor from Proveedor with (nolock) where ID_Proveedor = @ID_Proovedor)
	begin
		print 'EL PROVEDOR SOLICITADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	ELSE
	BEGIN
		delete from Proveedor where ID_Proveedor = @ID_Proovedor
	END
end
