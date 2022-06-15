CREATE view Vw_Facturas_Ventas_Hoy
as
SELECT ID_Factura AS [NUMERO DE FACTURA],ID_Cliente as [CEDULA CLIENTE],(C.[Primer Nombre] 
+' '+ C.[Primer Apellido]) as [NOMBRE COMPLETO],(E.[Primer Nombre]+' '+ E.[Primer Apellido])
AS EMPLEADO,
Fecha AS FECHA,('C$' + ' '+CONVERT(VARCHAR(10),SubTotal)) AS [SUB TOTAL],('C$' + ' '+CONVERT(VARCHAR(10),IVA))AS IVA,('C$' + ' '+CONVERT(VARCHAR(10),
Total)) AS TOTAL ,MP.Descripcion AS 
[MODO DE PAGO]from Factura_Venta FV INNER JOIN Cliente C ON FV.ID_Cliente = C.Cedula
INNER JOIN Empleado E ON E.Cedula = FV.ID_Empleado
INNER JOIN Modo_Pago MP ON MP.ID_MPago = FV.ID_MPago where FV.Fecha = GETDATE()