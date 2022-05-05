alter proc SP_Busqueda_Proovedor
@ID_Proovedor int
as
begin
	if not exists (select ID_Proveedor from Proveedor with (nolock) where ID_Proveedor = @ID_Proovedor)
	begin
		print 'EL PROVEDOR SOLICITADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	ELSE
	BEGIN
		select ID_Proveedor,Nombre,Telefono,Direccion from Proveedor with (nolock) where ID_Proveedor = @ID_Proovedor
	END
end

EXEC SP_Busqueda_Proovedor 2
select * from Proveedor