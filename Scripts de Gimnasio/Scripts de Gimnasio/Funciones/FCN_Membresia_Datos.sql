CREATE FUNCTION FCN_Membresia_Datos
(	
	
)
RETURNS TABLE 
AS
RETURN 
(
	select ID_Membresia,Descripcion,Precio from Membresia
)
GO
