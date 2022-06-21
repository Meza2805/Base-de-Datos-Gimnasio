CREATE FUNCTION FCN_E_Factura_Compra_Fecha
(
	@fecha date
)
RETURNS varchar(100)
AS
BEGIN
	declare @mensaje varchar(100)
	IF EXISTS (select * from Factura_Compra where Fecha = @fecha)
		BEGIN
		set @mensaje = 'LA FACTURA EXISTE'
		END
	ELSE
		BEGIN
		set @mensaje = 'LA FACTURA NO EXISTE'
		END
	RETURN @mensaje
END
GO

