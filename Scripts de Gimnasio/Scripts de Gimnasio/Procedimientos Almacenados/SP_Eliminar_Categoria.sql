ALTER proc SP_Eliminar_Categoria
@id int,
@salida varchar(50) output
as 
begin
	if not exists (select ID_Categoria from Categoria where ID_Categoria = @id)
		begin
			set @salida =  'LA CATEGORIA NO EXISTE EN LA BASE DE DATOS'
		end
	else
		begin
			delete from Categoria where  ID_Categoria = @id
			set @salida = 'CATEGORIA ELIMINADA CORRECTAMENTE'
		end
end

