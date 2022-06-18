create proc SP_Insertar_Categoria
@id int,
@descripcion varchar(50)
as
	begin
		if not exists (select ID_Categoria from Categoria where ID_Categoria = @id)
			begin
				insert into Categoria (ID_Categoria,Descripcion) values (@id,@descripcion)
			end
		else
			begin
				print 'EL ESTADO YA SE ENCUENTRA EN LA BASE DE DATOS'
			end
	end