
CREATE FUNCTION FCN_Factura_venta_Cliente
(	
	@cedula char(16)
)
RETURNS TABLE 
AS
RETURN 
(

SELECT       FV.ID_Factura AS [NUMERO DE FACTURA], FV.ID_Cliente AS [CEDULA CLIENTE], C.[Primer Nombre] + ' ' + C.[Primer Apellido] AS [NOMBRE COMPLETO], E.[Primer Nombre] + ' ' + E.[Primer Apellido] AS EMPLEADO, FV.Fecha, 
                         'C$' + ' ' + CONVERT(VARCHAR(10), FV.SubTotal) AS [SUB TOTAL], 'C$' + ' ' + CONVERT(VARCHAR(10), FV.IVA) AS IVA, 'C$' + ' ' + CONVERT(VARCHAR(10), FV.Total) AS TOTAL, MP.Descripcion AS [MODO DE PAGO]
FROM            dbo.Factura_Venta AS FV INNER JOIN
                         dbo.Cliente AS C ON FV.ID_Cliente = C.Cedula INNER JOIN
                         dbo.Empleado AS E ON E.Cedula = FV.ID_Empleado INNER JOIN
                         dbo.Modo_Pago AS MP ON MP.ID_MPago = FV.ID_MPago
WHERE        (FV.ID_Cliente = @cedula)
)
GO


