select * from Producto
alter proc SP_Buscar_Producto
@ID_Producto int
as
begin
	if not exists (select * from Producto where ID_Producto = @ID_Producto)
	begin
		PRINT 'EL PRODUCTO SOLICITADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
	begin
		select P.ID_Producto AS CODIGO,P.Nombre AS NOMBRE,P.Descripcion_Producto AS DESCRIPCION, C.Descripcion AS CATEGORIA, M.Nombre AS MARCA from Producto P with (nolock) 
		inner join Categoria C on P.ID_Categoria =  C.ID_Categoria
		INNER JOIN Marca M ON P.ID_Marca = M.ID_Marca
		where P.ID_Producto = @ID_Producto 
	end
end

exec SP_Buscar_Producto 59


