create proc SP_Actualizar_Categoria
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
			update Categoria set Descripcion= @descripcion
		end
end

