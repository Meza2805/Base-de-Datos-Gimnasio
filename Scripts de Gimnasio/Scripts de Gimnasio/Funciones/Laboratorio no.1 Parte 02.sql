
--TABLA ESTADO CLIENTE (TABLA CATALOGO)
SELECT ID_Estado, Descripcion, Observacion FROM Estado_Cliente

--TABLA CLIENTE (TABLA FUERTE) //////////////////////////////////////////////////
SELECT Cedula, [Primer Nombre], [Segundo Nombre], [Primer Apellido], 
[Segundo Apellido], Sexo, Fecha_Nac, Fecha_Registro, ID_Estado FROM Cliente
select * from Wv_Info_Empleados

 --CONSULTA 01 (RETORNA LA LISTA DE CLIENTES ORDENADOS POR FECHA DE REGISTRO EN ORDEN ASCENDENTE)
 SELECT Cedula, [Primer Nombre], [Segundo Nombre], [Primer Apellido], [Segundo Apellido] ,
 Fecha_Registro FROM Cliente ORDER BY Fecha_Registro ASC

  --CONSULTA 02 (RETORNA LA LISTA DE CLIENTES ORDENADOS POR FECHA DE REGISTRO EN ORDEN DESCENDENTE)
 SELECT Cedula, [Primer Nombre], [Segundo Nombre], [Primer Apellido], [Segundo Apellido] 
 , Fecha_Registro FROM Cliente ORDER BY Fecha_Registro DESC

  --CONSULTA 03 (RETORNA LA CANTIDAD DE CLINTES AGRUPOS POR SEXO)
 SELECT  Sexo AS SEXO,COUNT (Cedula)AS CANTIDAD FROM Cliente GROUP BY Sexo

   --CONSULTA 04 (RETORNA LA LISTA DE CLIENTES ORDENADOS POR EDAD DE MAYOR A MENOR)
 SELECT Cedula, [Primer Nombre], [Segundo Nombre], [Primer Apellido], [Segundo Apellido] , 
	floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8),
	Cliente.Fecha_Nac,112) as int) ) / 10000) as EDAD
	from Cliente ORDER By Fecha_Nac

  --CONSULTA 05 (RETORNA LA LISTA DE CLIENTES ORDENADOS POR EDAD DE MENOR A MAYOR)
 SELECT Cedula, [Primer Nombre], [Segundo Nombre], [Primer Apellido], [Segundo Apellido] , 
	floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8),
	Cliente.Fecha_Nac,112) as int) ) / 10000) as EDAD
	from Cliente ORDER By Fecha_Nac desc

 --CONSULTA 06 (RETORNA LA LISTA DE CLIENTES QUE ESTAN ACTIVOS)
 SELECT Cedula, [Primer Nombre], [Segundo Nombre], [Primer Apellido], 
 [Segundo Apellido] , Fecha_Registro , EC.Descripcion FROM Cliente C INNER JOIN Estado_Cliente EC
 ON C.ID_Estado = EC.ID_Estado WHERE C.ID_Estado = 'A'

 --CONSULTA 07 (RETORNA LA LISTA DE CLIENTES QUE ESTAN INACTIVOS)
 SELECT Cedula, [Primer Nombre], [Segundo Nombre], [Primer Apellido], [Segundo Apellido] ,
 Fecha_Registro , EC.Descripcion FROM Cliente C INNER JOIN Estado_Cliente EC
 ON C.ID_Estado = EC.ID_Estado WHERE C.ID_Estado = 'I'

  --CONSULTA 08 (RETORNA LA SUMATORIA DE CLIENTES, TANTO ACTIVOS )
  SELECT COUNT(Cedula) AS [CANTIDAD CLIENTE], EC.Descripcion AS ESTADO FROM 
  Cliente C INNER JOIN Estado_Cliente EC
 ON C.ID_Estado = EC.ID_Estado GROUP BY EC.Descripcion

  --CONSULTA 09 (RETORNA EL TOTAL DE CLIENTES REGISTRADOS )
  SELECT COUNT(Cedula) AS [CANTIDAD CLIENTE] FROM Cliente

--TABLA ASISTENCIA (TABLA DEPENDIENTE DE CLIENTE; DEBIL) /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SELECT ID_Registro,Fecha,Hora,ID_Cliente FROM Registo_Asistencia

  --CONSULTA 01 (RETORNA LA LISTA DE CLIENTES REGISTRADOS DURANTE EL DIA)
SELECT ID_Cliente AS CEDULA, C.[Primer Nombre] AS NOMBRE,[Primer Apellido]AS 
APELLIDO,Hora as HORA FROM Registo_Asistencia RA inner join Cliente C
ON RA.ID_Cliente = C.Cedula 
WHERE Fecha =  ( cast (datepart(year,getdate())as varchar(4))+'-' +cast (datepart(month,getdate())as varchar(2)) +
																	'-' +cast (datepart(day,getdate())as varchar(2))) 

 --CONSULTA 02 (RETORNA LA CANTIDAD TOTAL DE ASISTENCIAS REGISTRADA POR CLIENTE)
 SELECT ID_Cliente, count (ID_Registro) AS [CANTIDAD DE ASISTENCIA]  
 FROM Registo_Asistencia group by ID_Cliente

  --CONSULTA 03 (RETORNA LA CANTIDAD TOTAL DE ASISTENCIAS REGISTRADA POR CLIENTE DE MENOR A MAYOR )
 SELECT ID_Cliente, count (ID_Registro) AS [CANTIDAD DE ASISTENCIA]  
 FROM Registo_Asistencia group by ID_Cliente ORDER BY (count (ID_Registro))

  --CONSULTA 04 (RETORNA LA CANTIDAD TOTAL DE ASISTENCIAS REGISTRADA POR CLIENTE DE MAYOR A MENOR )
 SELECT ID_Cliente, count (ID_Registro) AS [CANTIDAD DE ASISTENCIA]  FROM Registo_Asistencia 
 group by ID_Cliente ORDER BY (count (ID_Registro)) DESC

 --TABLA SUSCRIPCION (TABLA DEPENDIENTE DE CLIENTE; DEBIL) /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 SELECT ID_SUBS,ID_Cliente,Fecha_Contratacion,Fecha_Expiracion,ID_Empleado,
 ID_Membresia,Finalizada FROM suscripcion

  --CONSULTA 01 (RETORNA LA LISTA DE CLIENTES MEMBRESIAS CONTRATADAS ACTIVAS Y SU TIPO DE MEMBRESIA )
   SELECT ID_Cliente AS [CEDULA CLINETE],C.[Primer Nombre] AS NOMBRE,C.[Primer Apellido] AS 
   APELLIDO,Fecha_Contratacion AS [FECHA DE CONTRATACION], Fecha_Expiracion AS [FECHA DE EXPIRACION],M.Descripcion AS
   [TIPO DE MEMBRESIA] FROM suscripcion S INNER JOIN Cliente C
   ON S.ID_Cliente = C.Cedula INNER JOIN Membresia M ON S.ID_Membresia = M.ID_Membresia WHERE S.Finalizada=0

    --CONSULTA 02 (RETORNA LA LISTA DE CLIENTES CON MEMBRESIAS CONTRATADAS Y SU TIPO DE MEMBRESIA ORDENADO POR FECHA DE CONTRATACION ORDENADO POR LA FECHA DE CONTRATACION)
   SELECT ID_Cliente AS [CEDULA CLINETE],C.[Primer Nombre] AS NOMBRE,C.[Primer Apellido] 
   AS APELLIDO,Fecha_Contratacion AS [FECHA DE CONTRATACION],M.Descripcion AS [TIPO DE MEMBRESIA]
   FROM suscripcion S INNER JOIN Cliente C
   ON S.ID_Cliente = C.Cedula INNER JOIN Membresia M ON S.ID_Membresia = M.ID_Membresia 
   WHERE S.Finalizada=0 ORDER BY S.Fecha_Contratacion 

    --CONSULTA 03 (RETORNA LA CANTIDAD DE CLIENTES POR CADA TIPO DE MEMBRESIA CONTRATADA)
  SELECT M.Descripcion AS MEMBRESIA,COUNT(S.ID_Membresia)AS CANTIDAD  FROM suscripcion S 
   INNER JOIN Membresia M ON S.ID_Membresia = M.ID_Membresia WHERE S.Finalizada=0 GROUP BY M.Descripcion

     --CONSULTA 04 (RETORNA EL CLIENTE CON LA MEMBRESIA MAS PRONTA A VENCERSE POR CADA MEMBRESIA)
 SELECT  ID_Cliente AS CEDULA,[Primer Nombre]AS NOMBRE,[Primer Apellido] AS APELLIDO,
 MIN(Fecha_Expiracion) AS [FECHA DE EXPIRACION], M.Descripcion AS MEMBRESIA FROM 
 suscripcion S INNER JOIN Cliente C ON S.ID_Cliente =  C.Cedula 
 inner join Membresia M ON S.ID_Membresia = M.ID_Membresia
 WHERE C.ID_Estado= 'A' and S.Finalizada = 0
 GROUP BY M.Descripcion ,ID_Cliente ,[Primer Nombre],[Primer Apellido],Fecha_Expiracion
 ORDER BY Fecha_Expiracion

  --TABLA MEMBRESIA (TABLA CATALOGO) /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  SELECT ID_Membresia AS [ID MEMBRESIA],Descripcion AS DESCRIPCION,Precio AS PRECIO FROM Membresia

   --CONSULTA 01 (RETORNA LAS MEMBRESIAS ORDENADOS POR PRECIO)
  SELECT ID_Membresia AS [ID MEMBRESIA],Descripcion AS DESCRIPCION,Precio AS PRECIO FROM Membresia
  ORDER BY Precio DESC

  --TABLA EMPLEADO (TABLA FUERTE) /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SELECT Cedula,[Primer Nombre], [Segundo Nombre],[Primer Apellido],[Segundo Apellido],
Telefono,Direccion,[Fecha Contratacion],ID_Estado_Empleado from Empleado

  --CONSULTA 01 (RETORNA LOS DATOS PRINCIPALES DE LOS EMPLEADOS)
SELECT Cedula,[Primer Nombre], [Segundo Nombre],[Primer Apellido],
[Segundo Apellido] ,Telefono AS TELEFONO,Direccion AS DIRECCION from Empleado


  --CONSULTA 02 (RETORNA EL ESTADO DE LOS EMPLEADOS)
SELECT Cedula,[Primer Nombre], [Segundo Nombre],[Primer Apellido],
[Segundo Apellido], EE.Descripcion AS ESTADO from Empleado E inner join Estado_Empleado EE
ON E.ID_Estado_Empleado = EE.ID_ESTADO_EMP

  --TABLA ESTADO_EMPLEADO (TABLA CATALOGO) /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  SELECT ID_ESTADO_EMP,Descripcion as DESCRIPCION FROM Estado_Empleado

  --TABLA FACTURA_VENTA  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SELECT ID_Factura,ID_Cliente,ID_Empleado,Fecha,ID_MPago,SubTotal,IVA,Total from Factura_Venta

 --CONSULTA 01 (RETORNA LA LISTA DE FACTURAS REALIZADAS)
SELECT ID_Factura AS [NUMERO DE FACTURA],ID_Cliente as [CEDULA CLIENTE],(C.[Primer Nombre] 
+' '+ C.[Primer Apellido]) as [NOMBRE COMPLETO],(E.[Primer Nombre]+' '+ E.[Primer Apellido])
AS EMPLEADO,
Fecha AS FECHA,SubTotal AS [SUB TOTAL],IVA,Total AS TOTAL ,MP.Descripcion AS 
[MODO DE PAGO]from Factura_Venta FV INNER JOIN Cliente C ON FV.ID_Cliente = C.Cedula
INNER JOIN Empleado E ON E.Cedula = FV.ID_Empleado
INNER JOIN Modo_Pago MP ON MP.ID_MPago = FV.ID_MPago

 --CONSULTA 02 (RETORNA LA LISTA DE FACTURAS REALIZADAS)
 SELECT MP.Descripcion AS[MODO DE PAGO] , COUNT (ID_Factura) CANTIDAD From Factura_Venta FV
 INNER JOIN Modo_Pago MP ON FV.ID_MPago = MP.ID_MPago
 GROUP BY MP.Descripcion 
 ORDER BY MP.Descripcion DESC

 --CONSULTA 03 (RETORNA LOS DATOS PRINCIPALES DE UNA FACTURA PASANDO COMO PARAMETRO EL ID DE FACTURA)
 SELECT ID_Factura AS [NUMERO DE FACTURA],ID_Cliente as [CEDULA CLIENTE],(C.[Primer Nombre]
 +' '+ C.[Primer Apellido]) as [NOMBRE COMPLETO],(E.[Primer Nombre]+' '+ E.[Primer Apellido])
 AS EMPLEADO,
Fecha AS FECHA,MP.Descripcion AS [MODO DE PAGO]from Factura_Venta FV INNER JOIN Cliente C ON FV.ID_Cliente = C.Cedula
INNER JOIN Empleado E ON E.Cedula = FV.ID_Empleado
INNER JOIN Modo_Pago MP ON MP.ID_MPago = FV.ID_MPago WHERE ID_Factura=15

--CONSULTA 04 (RETORNA EL DETALLE DE UNA FACTURA PASANDO COMO PARAMETRO EL ID DE FACTURA)
SELECT P.Nombre AS PRODUCTO, DFV.Cant_Producto AS CANTIDAD, P.Precio AS PRECIO, 
(PRECIO * Cant_Producto) AS TOTAL FROM Detalle_Factura_Venta DFV
INNER JOIN Producto P ON DFV.ID_Producto = P.ID_Producto WHERE ID_Factura = 15

--CONSULTA 05 (RETORNA LOS VALORES TOTALES DE UNA FACTURA PASANDO COMO PARAMETRO EL ID DE FACTURA)
SELECT SubTotal, IVA, TOTAL FROM Factura_Venta WHERE ID_Factura= 15

  --TABLA DETALLE_FACTURA_VENTA  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  SELECT ID_Detalle,ID_Detalle, P.Nombre,Cant_Producto FROM Detalle_Factura_Venta DFV  
  INNER JOIN Producto P ON DFV.ID_Producto = P.ID_Producto

  --CONSULTA 01 (RETORNA LOS 10 PRODUCTOS MAS VENDIDOS)
    SELECT TOP 10  MAX(Cant_Producto) AS CANTIDAD, P.Nombre AS PRODUCTO FROM Detalle_Factura_Venta  DFC
  INNER JOIN Producto P ON DFC.ID_Producto = P.ID_Producto GROUP BY P.Nombre
  ORDER BY CANTIDAD DESC 

  --TABLA FACTURA_COMPRA  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
SELECT ID_Factura,Fecha,ID_Empleado,ID_Proveedor,ID_MPago,SubTotal,IVA,Total FROM Factura_Compra

 --CONSULTA 01 (RETORNA LOS DATOS PRINCIPALES DE UNA FACTURA PASANDO COMO PARAMETRO EL ID DE FACTURA)
SELECT ID_Factura,ID_Empleado AS CEDULA, (E.[Primer Nombre]+' '+[Primer Apellido]) 
AS EMPLEADO, FC.Fecha AS FECHA, MP.Descripcion AS [MODO DE PAGO], Total as TOTAL from Factura_Compra FC
INNER JOIN Empleado E ON FC.ID_Empleado = E.Cedula
INNER JOIN Modo_Pago MP ON FC.ID_MPago = MP.ID_MPago WHERE ID_Factura = 4


--CONSULTA 02 (RETORNA EL DETALLE DE UNA FACTURA PASANDO COMO PARAMETRO EL ID DE FACTURA)
SELECT P.Nombre AS PRODUCTO,P.Precio AS [PRECIO UNITARIO], DFC.Cant_Producto AS CANTIDAD, (DFC.Cant_Producto * P.Precio)
AS TOTAL FROM Detalle_Factura_Compra DFC 
INNER JOIN Producto P ON DFC.ID_Producto = P.ID_Producto WHERE ID_Factura_Compra = 4

--CONSULTA 03 (RETORNA LOS VALORES TOTALES DE UNA FACTURA DE COMPRA PASANDO COMO PARAMETRO EL ID DE FACTURA)
SELECT SubTotal, IVA, TOTAL FROM Factura_Compra WHERE ID_Factura = 4

 --CONSULTA 04 (RETORNA LA LISTA DE FACTURAS DE COMPRA REALIZADAS)
 SELECT ID_Factura AS [CODIGO FACTURA]  ,Fecha AS FECHA,(E.[Primer Nombre] +' '+ E.[Primer Apellido]) 
 AS EMPLEADO ,P.Nombre AS PROOVEDOR ,SubTotal AS SUBTOTAL,IVA,Total AS TOTAL,MP.Descripcion AS [MODO DE PAGO] FROM Factura_Compra FC 
 INNER JOIN Proveedor P ON FC.ID_Proveedor = P.ID_Proveedor
 INNER JOIN Modo_Pago MP ON FC.ID_MPago = MP.ID_MPago
 INNER JOIN Empleado E ON FC.ID_Empleado = E.Cedula
 


  --TABLA DETALLE FACTURA COMPRA  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  SELECT ID_Detalle,ID_Factura_Compra,P.Nombre,Costo,Cant_Producto FROM Detalle_Factura_Compra  DFC
  INNER JOIN Producto P ON DFC.ID_Producto = P.ID_Producto 
 
  --CONSULTA 01 (RETORNA LOS 10 PRODUCTO MAS COMPRADOS)
  SELECT TOP 10  MAX(Cant_Producto) AS CANTIDAD, P.Nombre AS PRODUCTO FROM Detalle_Factura_Compra  DFC
  INNER JOIN Producto P ON DFC.ID_Producto = P.ID_Producto GROUP BY P.Nombre
  ORDER BY CANTIDAD DESC 

  --TABLA PRODUCTO  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  SELECT ID_Producto,P.Nombre,Precio,Stock,Descripcion_Producto,C.Descripcion AS CATEGORIA,M.Nombre AS MARCA FROM Producto P 
  INNER JOIN Categoria C ON P.ID_Categoria = C.ID_Categoria
  INNER JOIN Marca M ON P.ID_Marca = M.ID_Marca

--CONSULTA 01 (RETORNA LA LISTA DE PRODUCTOS ORDERNADOS POR CATEGORIA)
  SELECT ID_Producto,P.Nombre,Precio,Stock,Descripcion_Producto,C.Descripcion AS CATEGORIA,M.Nombre AS MARCA FROM Producto P 
  INNER JOIN Categoria C ON P.ID_Categoria = C.ID_Categoria
  INNER JOIN Marca M ON P.ID_Marca = M.ID_Marca
  ORDER BY C.Descripcion

  --CONSULTA 02 (RETORNA LA LISTA DE PRODUCTOS ORDERNADOS POR STOCK)
  SELECT ID_Producto,P.Nombre,Precio,Stock,Descripcion_Producto,C.Descripcion AS CATEGORIA,M.Nombre AS MARCA FROM Producto P 
  INNER JOIN Categoria C ON P.ID_Categoria = C.ID_Categoria
  INNER JOIN Marca M ON P.ID_Marca = M.ID_Marca
  ORDER BY P.Stock

  --TABLA MODO_PAGO (TABLA CATALOGO) /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  SELECT ID_MPago, Descripcion FROM Modo_Pago

  
  --TABLA CATEGORIA (TABLA CATALOGO) /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  SELECT ID_Categoria AS [ID CATEGORIA], Descripcion AS DESCRIPCION FROM Categoria

    
  --TABLA MARCA (TABLA CATALOGO) /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	SELECT ID_Marca AS [ID MARCA], Nombre AS MARCA FROM Marca

  --TABLA PROOVEDOR (TABLA FUERTE) /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  SELECT ID_Proveedor AS [ID PROOVEDOR],Nombre AS NOMBRE,Telefono AS TELEFONO,Direccion AS DIRECCION FROM Proveedor

  select * from Vw_Membresia