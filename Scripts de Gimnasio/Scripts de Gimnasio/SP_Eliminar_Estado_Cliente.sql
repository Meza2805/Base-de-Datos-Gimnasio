create proc SP_Eliminar_Estado_Cliente
@id char(1)
as
begin
	if not exists (select ID_Estado from Estado_Cliente where ID_Estado = @id)
	begin
		print 'EL ESTADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
	begin
		delete from Estado_Cliente where ID_Estado = @id
	end
end
 
