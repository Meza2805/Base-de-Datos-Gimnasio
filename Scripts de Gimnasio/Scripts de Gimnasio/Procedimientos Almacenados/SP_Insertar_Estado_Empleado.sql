alter proc SP_Insertar_Estado_Empleado
@id char(1),
@Descripcion varchar(50)
as
	begin
		if not exists (select ID_ESTADO_EMP from Estado_Empleado where ID_ESTADO_EMP = @id)
			begin
				INSERT INTO Estado_Empleado(ID_ESTADO_EMP,Descripcion) VALUES (@id,@Descripcion)
			end
		ELSE
			BEGIN
				print 'EL ESTADO YA SE ENCUENTRA EN LA BASE DE DATOS'
			END
	end
