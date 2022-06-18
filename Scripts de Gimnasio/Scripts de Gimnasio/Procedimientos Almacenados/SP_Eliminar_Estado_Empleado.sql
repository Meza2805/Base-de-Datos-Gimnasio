alter proc SP_Eliminar_Estado_Empleado
@id char(1)
as
begin
	if not exists (select ID_ESTADO_EMP from Estado_Empleado where ID_ESTADO_EMP = @id)
	begin
		print 'EL ESTADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
	begin
		delete from Estado_Empleado where ID_ESTADO_EMP = @id
	end
end
 
