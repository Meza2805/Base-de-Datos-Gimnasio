alter proc SP_ver_productos
  as
  begin

  select p.ID_Producto CODIGO, p.Nombre AS PRODUCTO, ('C$' + ' '+CONVERT(VARCHAR(10),Precio)) AS PRECIO, p.Stock AS STOCK,
c.Descripcion AS CATEGORIA ,M.Nombre AS MARCA  from Producto p inner join Categoria c on c.ID_Categoria = p.ID_Categoria 
											inner join Marca m on p.ID_Marca = m.ID_Marca
order by p.ID_Producto desc
  end




select p.ID_Producto CODIGO, p.Nombre AS PRODUCTO, ('C$' + ' '+CONVERT(VARCHAR(10),Precio)) AS PRECIO, p.Stock AS STOCK,
c.Descripcion AS CATEGORIA, m.Nombre AS MARCA  from Producto p inner join Marca m  on p.ID_Marca = m.ID_Marca 
inner join Categoria c on c.ID_Categoria = m.ID_Categoria order by p.ID_Producto desc

  
select p.ID_Producto CODIGO,p.ID_Categoria, p.Nombre AS PRODUCTO,c.ID_Categoria,
c.Descripcion AS CATEGORIA, m.Nombre AS MARCA  from Producto p inner join Marca m  on p.ID_Marca = m.ID_Marca 
inner join Categoria c on c.ID_Categoria = m.ID_Categoria


select c.ID_Categoria
 from Producto p inner join Marca m  on p.ID_Marca = m.ID_Marca 
inner join Categoria c on c.ID_Categoria = m.ID_Categoria

update Producto set ID_Categoria = (select c.ID_Categoria
 from Producto p inner join Marca m  on p.ID_Marca = m.ID_Marca 
inner join Categoria c on c.ID_Categoria = m.ID_Categoria) 