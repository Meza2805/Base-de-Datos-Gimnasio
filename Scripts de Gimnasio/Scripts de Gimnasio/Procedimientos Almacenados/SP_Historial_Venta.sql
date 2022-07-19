CREATE PROC SP_Historial_Venta
as
begin


SELECT  FV.ID_Factura as [CODIGO] ,('C$' + ' '+CONVERT(VARCHAR(10), (SELECT FORMAT( SubTotal , 'N1', 'en-us'))  )) AS [SUB TOTAL],
('C$' + ' '+CONVERT(VARCHAR(10),   (SELECT FORMAT( IVA , 'N1', 'en-us')  )  ))AS IVA,('C$' + ' '+CONVERT(VARCHAR(10),
     (SELECT FORMAT( Total , 'N1', 'en-us'))        )) AS TOTAL,(C.[Primer Nombre] 
+' '+ C.[Primer Apellido]) as CLIENTE,(E.[Primer Nombre]+' '+ E.[Primer Apellido])
AS EMPLEADO,
(Select CONVERT(varchar,Fecha,103))    AS FECHA ,MP.Descripcion AS 
[MODO DE PAGO]from Factura_Venta FV INNER JOIN Cliente C ON FV.ID_Cliente = C.Cedula
INNER JOIN Empleado E ON E.Cedula = FV.ID_Empleado
INNER JOIN Modo_Pago MP ON MP.ID_MPago = FV.ID_MPago order by fv.Fecha desc


end

(Select CONVERT(varchar,@Existingdate,103))

SELECT FORMAT(  , 'N1', 'en-us')