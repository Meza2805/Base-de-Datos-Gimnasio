CREATE FUNCTION FCN_Factura_venta_detalle_subtotal
(
	@Id_Factura int
)
RETURNS int
AS
BEGIN
	declare @total int
	set @total = (SELECT   sum(dfv.Cant_Producto * p.Precio)
FROM            dbo.Detalle_Factura_Venta AS dfv INNER JOIN
                         dbo.Producto AS p ON dfv.ID_Producto = p.ID_Producto   
						 group by dfv.ID_Factura having dfv.ID_Factura = @Id_Factura)
	return @total
END
GO

