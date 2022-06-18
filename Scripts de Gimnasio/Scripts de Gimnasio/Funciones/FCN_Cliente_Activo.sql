
CREATE FUNCTION FCN_Cliente_Activo
(	

)
RETURNS TABLE 
AS
RETURN 
(
	select * from Cliente where ID_Estado = 'A'
)
GO


