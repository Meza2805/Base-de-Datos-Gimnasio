
ALTER PROC [dbo].[SP_Mostrar_Marca]
as begin
SELECT m.ID_Marca as CODIGO,m.Nombre AS MARCA,c.Descripcion AS CATEGORIA FROM Marca m 
inner join Categoria c on m.ID_Categoria = c.ID_Categoria order by m.Nombre 
end
