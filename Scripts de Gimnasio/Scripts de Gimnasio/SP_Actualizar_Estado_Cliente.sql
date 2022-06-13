create proc SP_Actualizar_Estado_Cliente
@ID_Estado char(1),
@Descripcion nvarchar(50),
@Observacion nvarchar(200),
@Salida int
as
	begin
		if not exists (select ID_Estado from Estado_Cliente where ID_Estado = @ID_Estado)
		begin
			print 'EL ESTADO NO EXISTE EN LA BASE DE DATOS'
			set @Salida = 0
		end
		update Estado_Cliente SET Descripcion = @Descripcion, Observacion = @Observacion
		set @Salida = 1
	end