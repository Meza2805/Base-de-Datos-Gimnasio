CREATE FUNCTION FCN_E_Marca_Total
(
	
)
RETURNS int
AS
BEGIN
 declare @cantidad int
 set @cantidad = (select count(*) from Marca)
 return @cantidad
END


