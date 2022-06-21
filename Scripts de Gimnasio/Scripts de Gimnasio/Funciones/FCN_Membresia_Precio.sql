CREATE FUNCTION FCN_Membresia_Precio
(	
	@precio decimal(10,2)
)
RETURNS TABLE 
AS
RETURN 
(
	select ID_Membresia,Descripcion,Precio from Membresia where Precio = @precio
)
GO
select * from FCN_Membresia_Precio(70)