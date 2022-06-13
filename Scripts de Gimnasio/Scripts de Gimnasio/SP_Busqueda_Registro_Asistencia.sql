alter PROC SP_Busqueda_Registro_Asistencia
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
			select ID_Registro,Fecha,Hora,ID_Cliente from Registo_Asistencia
			where ID_Registro = @id
		end
end
