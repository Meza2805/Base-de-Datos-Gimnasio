create proc SP_Eliminar_Registro_Asistencia
@id int,
@fecha date,
@hora varchar(7),
@id_cliente char(16)
as
begin
	if not exists (select * from Registo_Asistencia where ID_Registro = @id)
		begin
			print 'EL REGISTRO DE ASISTENCIA NO EXISTE EN LA BASE DE DATOS'
		end
	else
		begin
			delete  from Registo_Asistencia
			where ID_Registro = @id
		end
end
