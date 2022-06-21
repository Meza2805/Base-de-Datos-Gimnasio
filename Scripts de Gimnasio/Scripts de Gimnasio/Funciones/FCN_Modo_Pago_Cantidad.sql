CREATE FUNCTION FCN_Modo_Pago_Cantidad 
(
	
)
RETURNS int
AS
BEGIN
	
	declare @cantidad int 
	set @cantidad = (select count( *) from Modo_Pago)
	return @cantidad
END
GO

