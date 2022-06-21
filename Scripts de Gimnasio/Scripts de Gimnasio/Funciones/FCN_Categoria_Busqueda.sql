CREATE FUNCTION FCN_Categoria_Busqueda
(	
	@id int
)
RETURNS TABLE 
AS
RETURN 
(
	select ID_Categoria,Descripcion from Categoria where ID_Categoria = @id
)
GO