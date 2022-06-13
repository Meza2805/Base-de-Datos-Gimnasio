create proc SP_Busqueda_Categoria
@id int,
@descripcion varchar(50)
as 
begin
	if not exists (select ID_Categoria from Categoria where ID_Categoria = @id)
		begin
			print 'LA CATEGORIA NO EXISTE EN LA BASE DE DATOS'
		end
	else
		begin
			select ID_Categoria,Descripcion from Categoria where  Descripcion= @descripcion
		end
end

