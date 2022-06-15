 create view Vw_Factura_Compra_Tarjeta
 as
 SELECT ID_Factura AS [CODIGO FACTURA]  ,Fecha AS FECHA,(E.[Primer Nombre] +' '+ E.[Primer Apellido]) 
 AS EMPLEADO ,P.Nombre AS PROOVEDOR,('C$' + ' '+CONVERT(VARCHAR(10),SubTotal)) AS SUBTOTAL ,('C$' + ' '+CONVERT(VARCHAR(10),IVA))as IVA,
 ('C$' + ' '+CONVERT(VARCHAR(10),Total)) AS TOTAL,MP.Descripcion AS [MODO DE PAGO] FROM Factura_Compra FC 
 INNER JOIN Proveedor P ON FC.ID_Proveedor = P.ID_Proveedor
 INNER JOIN Modo_Pago MP ON FC.ID_MPago = MP.ID_MPago
 INNER JOIN Empleado E ON FC.ID_Empleado = E.Cedula where mp.Descripcion ='TARJETA'