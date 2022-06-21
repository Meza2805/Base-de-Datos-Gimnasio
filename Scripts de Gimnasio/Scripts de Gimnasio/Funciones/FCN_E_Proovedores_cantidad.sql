
CREATE FUNCTION FCN_E_Proovedores_cantidad
(
	
)
RETURNS int
AS
BEGIN
	declare @cantidad int
	set @cantidad = (select count(*) from Proveedor)
	return @cantidad
END
GO

