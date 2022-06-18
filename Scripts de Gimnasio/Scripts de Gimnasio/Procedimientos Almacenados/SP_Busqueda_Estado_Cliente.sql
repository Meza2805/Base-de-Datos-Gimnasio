create proc SP_Busqueda_Estado_Cliente
@id char(1)
as
	begin
		if not exists (select ID_Estado from Estado_Cliente where ID_Estado = @id)
			begin
				print 'EL ESTADO NO SE ENCUENTRA EN LA BASE DE DATOS'
			end
		ELSE
			BEGIN
				SELECT ID_Estado, Descripcion,Observacion FROM Estado_Cliente WHERE ID_Estado = @id
			END
	end