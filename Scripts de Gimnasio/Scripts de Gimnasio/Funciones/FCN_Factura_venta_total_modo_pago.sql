
CREATE FUNCTION FCN_Factura_venta_total_modo_pago
(
	@modo varchar(25)
)
RETURNS INT
AS
BEGIN
declare @cantidad int
	set @cantidad=(	SELECT   count( MP.Descripcion) AS [MODO DE PAGO]
FROM            dbo.Factura_Venta AS FV INNER JOIN
                         dbo.Cliente AS C ON FV.ID_Cliente = C.Cedula INNER JOIN
                         dbo.Empleado AS E ON E.Cedula = FV.ID_Empleado INNER JOIN
                         dbo.Modo_Pago AS MP ON MP.ID_MPago = FV.ID_MPago
WHERE        (mp.Descripcion = @modo))
return @cantidad
END
GO

