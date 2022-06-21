CREATE FUNCTION FCN_T_Factura_compra_fecha
(	
	@fecha date
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT       FC.ID_Factura AS [CODIGO FACTURA], FC.Fecha, E.[Primer Nombre] + ' ' + E.[Primer Apellido] AS EMPLEADO, P.Nombre AS PROOVEDOR, 'C$' + ' ' + CONVERT(VARCHAR(10), FC.SubTotal) AS SUBTOTAL, 
                         'C$' + ' ' + CONVERT(VARCHAR(10), FC.IVA) AS IVA, 'C$' + ' ' + CONVERT(VARCHAR(10), FC.Total) AS TOTAL, MP.Descripcion AS [MODO DE PAGO]
FROM            dbo.Factura_Compra AS FC INNER JOIN
                         dbo.Proveedor AS P ON FC.ID_Proveedor = P.ID_Proveedor INNER JOIN
                         dbo.Modo_Pago AS MP ON FC.ID_MPago = MP.ID_MPago INNER JOIN
                         dbo.Empleado AS E ON FC.ID_Empleado = E.Cedula
WHERE        (FC.Fecha = @fecha)
)
GO
