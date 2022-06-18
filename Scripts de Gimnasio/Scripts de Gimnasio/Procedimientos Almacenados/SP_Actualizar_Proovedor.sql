create proc SP_Actualizar_Proovedor
@id int,
@nombre varchar(100),
@telefono char(8),
@direccion varchar(300)
as
begin
	if not exists (select top 1 ID_Proveedor from Proveedor where ID_Proveedor=@id)
	begin
		print 'EL PROOVEDOR NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
	begin
		update Proveedor set Nombre=@nombre, Telefono=@telefono,
		Direccion=@direccion where ID_Proveedor=@id
	end
end
