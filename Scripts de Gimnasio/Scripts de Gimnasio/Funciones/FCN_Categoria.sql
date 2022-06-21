CREATE FUNCTION FCN_Categoria
(	
	
)
RETURNS TABLE 
AS
RETURN 
(
	select ID_Categoria,Descripcion from Categoria
)
GO
