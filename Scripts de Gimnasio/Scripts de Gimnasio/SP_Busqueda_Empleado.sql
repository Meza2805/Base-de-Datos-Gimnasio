select * from Empleado

alter proc SP_Busqueda_Empleado
@ID_Empleado int
as
begin
	if not exists (select * from Empleado with (nolock) where ID_Empleado = @ID_Empleado)
	begin
		print 'EL EMPELADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
	begin
		select * from Empleado with (nolock) where ID_Empleado = @ID_Empleado
	end
end
 
 exec SP_Busqueda_Empleado 1002