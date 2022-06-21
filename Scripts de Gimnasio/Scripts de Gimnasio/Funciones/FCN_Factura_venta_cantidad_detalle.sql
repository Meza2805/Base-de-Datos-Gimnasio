CREATE FUNCTION FCN_Factura_venta_cantidad_detalle
(
	@Factura int
)
RETURNS int
AS
BEGIN
	declare @cantidad int
	set @cantidad =(SELECT  count( ID_Factura)  FROM       dbo.Detalle_Factura_Venta where ID_Factura = 9)
	return @cantidad
END
GO

