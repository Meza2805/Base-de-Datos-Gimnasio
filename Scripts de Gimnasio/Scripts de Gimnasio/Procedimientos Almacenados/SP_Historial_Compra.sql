alter PROC SP_Historial_Compra
as
begin
 SELECT FC.ID_Factura AS [CODIGO]  , ('C$' + ' '+CONVERT(VARCHAR(10),  (SELECT FORMAT(FC.SubTotal, 'N1', 'en-us')) )) AS SUBTOTAL ,
 ('C$' + ' '+CONVERT(VARCHAR(10),     (SELECT FORMAT(IVA , 'N1', 'en-us')) ))as IVA,
 ('C$' + ' '+CONVERT(VARCHAR(10),        (SELECT FORMAT(Total, 'N1', 'en-us'))         )) AS TOTAL,(Select CONVERT(varchar,Fecha,103))   AS FECHA,(E.[Primer Nombre] +' '+ E.[Primer Apellido]) 
 AS EMPLEADO ,P.Nombre AS PROOVEDOR,MP.Descripcion as [MODO DE PAGO] FROM Factura_Compra FC 
 INNER JOIN Proveedor P ON FC.ID_Proveedor = P.ID_Proveedor
 INNER JOIN Modo_Pago MP ON FC.ID_MPago = MP.ID_MPago
 INNER JOIN Empleado E ON FC.ID_Empleado = E.Cedula order by FC.Fecha desc
end


SELECT FORMAT(4515634.6334, 'N1', 'en-us')



SP_Historial_Compra