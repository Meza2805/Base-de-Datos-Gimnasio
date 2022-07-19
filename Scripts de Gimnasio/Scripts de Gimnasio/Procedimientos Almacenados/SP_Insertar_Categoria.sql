ALTER proc SP_Insertar_Categoria
@descripcion varchar(50),
@salida varchar(50) out
as
	begin
		if not exists (select Descripcion from Categoria where Descripcion = @descripcion)
			begin
				insert into Categoria (Descripcion) values (@descripcion)
				set @salida =  'CATEGORIA INSERTADA'
			end
		else
			begin
				set @salida= 'LA CATEGORIA YA ENCUENTRA EN LA BASE DE DATOS'
			end
	end


