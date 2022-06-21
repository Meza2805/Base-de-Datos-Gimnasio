CREATE FUNCTION FCN_Factura_Venta_Total
(
	@Id int
)
RETURNS decimal(10,2)
AS
BEGIN
declare @total decimal(10,2)
set @total=(select Total from Factura_Venta where ID_Factura = @Id)
return @total
	

END
GO

