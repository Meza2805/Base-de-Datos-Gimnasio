create proc SP_Insertar_Estado_Cliente
@id char(1),
@Descripcion varchar(50),
@Observacion varchar(200)
as
	begin
		if not exists (select ID_Estado from Estado_Cliente where ID_Estado = @id)
			begin
				INSERT INTO Estado_Cliente (ID_Estado,Descripcion,Observacion) values (@id,@Descripcion,@Observacion) 
			end
		ELSE
			BEGIN
				print 'EL ESTADO YA SE ENCUENTRA EN LA BASE DE DATOS'
			END
	end

	select * from Estado_Cliente