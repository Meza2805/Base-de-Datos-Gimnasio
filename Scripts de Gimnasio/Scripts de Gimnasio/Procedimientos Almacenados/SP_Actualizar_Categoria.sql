alter proc SP_Actualizar_Categoria
@id int,
@descripcion varchar(50),
@salida varchar(100) out
as 
begin
	if not exists (select ID_Categoria from Categoria where ID_Categoria = @id)
		begin
			set @salida = 'LA CATEGORIA NO EXISTE EN LA BASE DE DATOS'
		end
	else
		begin
			update Categoria set Descripcion= @descripcion where ID_Categoria = @id
			set @salida = 'LA CATEGORIA SE HA ACTUALIZADO CORRECTAMENTE'
		end
		select @salida
end


select * from Registro_Borrados

select * from Categoria
select * from Producto