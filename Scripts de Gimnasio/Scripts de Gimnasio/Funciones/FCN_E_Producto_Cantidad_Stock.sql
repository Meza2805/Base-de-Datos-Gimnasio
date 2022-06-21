CREATE FUNCTION FCN_E_Producto_Cantidad_Stock
(
)
RETURNS int
AS
BEGIN
	declare @salida int
	set @salida=( select  count (Nombre) from Producto where Stock <> 0)
	return @salida
END
GO
