CREATE FUNCTION FCN_Modo_Pago
(	
	
)
RETURNS TABLE 
AS
RETURN 
(
	select ID_MPago,Descripcion from Modo_Pago
)
GO
