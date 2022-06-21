CREATE FUNCTION FCN_T_Marca_Busqueda
(	
	@nombre varchar(20)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * FROM Marca where Nombre =  @nombre
)
GO