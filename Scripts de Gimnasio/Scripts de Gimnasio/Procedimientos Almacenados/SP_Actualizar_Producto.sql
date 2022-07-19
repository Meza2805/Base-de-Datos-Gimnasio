alter proc SP_Actualizar_Producto
@id_producto int,
@nombre varchar(50),
@id_categoria int,
@id_marca int,
@salida varchar(100) output
as
begin
	if not exists (select top 1 ID_Producto from Producto where ID_Producto = @id_producto)
	begin
		set @salida = 'EL PRODUCTO NO EXISTE EN LA BASE DE DATOS'
	end	
	else
	begin
		update Producto set Nombre = @nombre,ID_Categoria= @id_categoria,
		ID_Marca= @id_marca where ID_Producto = @id_producto
		set @salida = 'PRODUCTO ACTUALIZADO CORRECTAMENTE'
	end
	select @salida
end


select * from Producto 

exec SP_Actualizar_Producto 46 ,'COCA-COLA 12 ONZ',15,3,''