
ALTER FUNCTION FCN_Estado_Cliente_Descicpion
(	
	@descripcion varchar(15)
)
RETURNS TABLE 
AS
RETURN 
(
	select ID_Estado,Descripcion,Observacion from Estado_Cliente where Descripcion = @descripcion
)
