select * from Producto
create proc SP_Buscar_Producto
@ID_Producto int
as
begin
	if not exists (select * from Producto where ID_Producto = @ID_Producto)
	begin
		PRINT 'EL PRODUCTO SOLICITADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
	begin
		select P.ID_Producto, P.Nombre,P.[Precio Compra],P.[Precio Venta],P.Fecha_Compra,P.Stock,M.Nombre as MARCA,C.Descripcion as CATEGORIA from Producto P inner join Categoria C
			on P.ID_Categoria = C.ID_Categoria
			inner join Marca M on P.ID_Marca = M.ID_Marca where p.ID_Producto =  @ID_Producto
	end
end

exec SP_Buscar_Producto 47


