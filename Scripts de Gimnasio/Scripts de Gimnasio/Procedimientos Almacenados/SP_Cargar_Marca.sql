create proc SP_Cargar_Marca
@Nombre varchar(35)
as 
begin

	SELECT m.ID_Marca as CODIGO,m.Nombre AS MARCA,c.Descripcion AS CATEGORIA FROM Marca m 
inner join Categoria c on m.ID_Categoria = c.ID_Categoria   where m.Nombre like @Nombre+'%' order by m.Nombre
end
