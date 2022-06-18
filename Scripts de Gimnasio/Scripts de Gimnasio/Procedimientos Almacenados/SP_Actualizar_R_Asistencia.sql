CREATE PROC SP_Actualizar_R_Asistencia
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
			update Registo_Asistencia set Fecha= @fecha, Hora=@hora,ID_Cliente=@id_cliente
			where ID_Registro = @id
		end
end
