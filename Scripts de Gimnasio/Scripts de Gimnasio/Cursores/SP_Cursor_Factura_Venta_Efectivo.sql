create proc SP_Cursor_Factura_Venta_Efectivo
as
begin
DECLARE
@Num_factura int,
@Cedula char(18),
@Nombre varchar (35),
@Empleado varchar (25),
@Fecha date,
@Sub_Total varchar(15),
@IVA varchar(15),
@Total varchar(15),
@Modo varchar(15)
Create Table #Factura 
	     (
			Num_factura int,
			Cedula char(18),
			Nombre varchar (35),
			Empleado varchar (25),
			Fecha date,
			Sub_Total varchar(15),
			IVA varchar(15),
			Total varchar(15),
			Modo varchar(15)
	      )
DECLARE Cursor_Factura Cursor For
		SELECT       FV.ID_Factura AS [NUMERO DE FACTURA], FV.ID_Cliente AS [CEDULA CLIENTE], C.[Primer Nombre] + ' ' + C.[Primer Apellido] AS [NOMBRE COMPLETO], E.[Primer Nombre] + ' ' + E.[Primer Apellido] AS EMPLEADO, FV.Fecha, 
                         'C$' + ' ' + CONVERT(VARCHAR(10), FV.SubTotal) AS [SUB TOTAL], 'C$' + ' ' + CONVERT(VARCHAR(10), FV.IVA) AS IVA, 'C$' + ' ' + CONVERT(VARCHAR(10), FV.Total) AS TOTAL, MP.Descripcion AS [MODO DE PAGO]
FROM            dbo.Factura_Venta AS FV INNER JOIN
                         dbo.Cliente AS C ON FV.ID_Cliente = C.Cedula INNER JOIN
                         dbo.Empleado AS E ON E.Cedula = FV.ID_Empleado INNER JOIN
                         dbo.Modo_Pago AS MP ON MP.ID_MPago = FV.ID_MPago
WHERE        (MP.Descripcion = 'EFECTIVO') order by Fecha

		OPEN Cursor_Factura
FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
INTO		@Num_factura,@Cedula,@Nombre,@Empleado,@Fecha,@Sub_Total,@IVA,@Total,@Modo
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Factura
		     (Num_factura,Cedula,Nombre,Empleado,Fecha,Sub_Total,IVA,Total,Modo)
	VALUES 
		      (@Num_factura,@Cedula,@Nombre,@Empleado,@Fecha,@Sub_Total,@IVA,@Total,@Modo)

	FETCH Next FROM	 Cursor_Factura	-- Ubicarnos en el Primer Registro
	INTO		@Num_factura,@Cedula,@Nombre,@Empleado,@Fecha,@Sub_Total,@IVA,@Total,@Modo

END	

Close	Cursor_Factura
DEALLOCATE Cursor_Factura

Select * From #Factura 
Drop Table #Factura
end