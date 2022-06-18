alter FUNCTION FCN_Cliente_Primera_Letra_Nombre
(	
	@nombre varchar(10)
)
RETURNS TABLE 
AS
RETURN 
(
	select * from Cliente where [Primer Nombre] like  @nombre+'%'
)
GO

