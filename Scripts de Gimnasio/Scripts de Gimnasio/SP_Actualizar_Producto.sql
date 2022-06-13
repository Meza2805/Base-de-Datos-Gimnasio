create proc SP_Actualizar_Producto
@id int,
@nombre varchar(100),
@precio decimal (12,2),
@stock int,
@descripcion varchar(100),
@id_categoria int,
@id_marca int
as
begin
	if not exists (select top 1 ID_Producto from Producto where ID_Producto = @id)
	begin
		print 'EL PRODUCTO NO EXISTE EN LA BASE DE DATOS'
	end	
	else
	begin
		update Producto set Nombre = @nombre, Precio = @precio, Stock = @stock, Descripcion_Producto = @descripcion,
		ID_Categoria= @id_categoria, ID_Marca= @id_marca where ID_Producto = @id
	end
end
