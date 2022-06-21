CREATE FUNCTION FCN_E_Detalle_Factura_Total
(
	@id_factura int
)
RETURNS int
AS
BEGIN
	declare @cantidad int
	set @cantidad = (select count(*) from Detalle_Factura_Compra where ID_Factura_Compra = 4)
	return @cantidad
END
GO

