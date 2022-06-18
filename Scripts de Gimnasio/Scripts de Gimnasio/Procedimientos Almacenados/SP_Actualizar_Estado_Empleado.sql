create proc SP_Actualizar_Estado_Empleado
@ID_Estado char(1),
@Descripcion nvarchar(50),
@Salida int
as
	begin
		if not exists (select top 1 ID_ESTADO_EMP from Estado_Empleado where ID_ESTADO_EMP = @ID_Estado )
		begin
			print 'EL EMPLEADO NO EXISTE EN LA BASE DE DATOS'
			set @Salida = 0
		end
		update Estado_Empleado set Descripcion = @Descripcion where ID_ESTADO_EMP = @ID_Estado
		set @Salida = 1
	end

