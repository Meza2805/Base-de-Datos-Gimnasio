CREATE proc SP_Cargar_Productos_03
@Nombre varchar(35)
as 
begin

	select p.ID_Producto CODIGO, p.Nombre AS PRODUCTO,m.Nombre as MARCA, p.Stock as STOCK  from Producto p inner join Categoria c on c.ID_Categoria = p.ID_Categoria 
											inner join Marca m on p.ID_Marca = m.ID_Marca where p.Nombre like @Nombre+'%'  order by p.Nombre
end
