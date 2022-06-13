create proc SP_Busqueda_Estado_Empleado
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
		select ID_ESTADO_EMP,Descripcion from Estado_Empleado
		set @Salida = 1
	end
