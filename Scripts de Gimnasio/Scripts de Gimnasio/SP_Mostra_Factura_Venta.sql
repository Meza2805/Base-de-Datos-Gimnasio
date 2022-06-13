ALTER PROC SP_MOSTRAR_FACTURA_VENTA
@ID_FACTURA INT
AS BEGIN
	IF NOT EXISTS (SELECT ID_Factura FROM Factura_Venta WHERE ID_Factura = @ID_FACTURA)
	BEGIN
		PRINT 'LA FACTURA NO EXISTE EN LA BASE DE DATOS'
	END
	ELSE
	BEGIN
		SELECT ID_Factura AS [NUMERO DE FACTURA],ID_Cliente as [CEDULA CLIENTE],(C.[Primer Nombre] +' '+ C.[Primer Apellido]) as [NOMBRE COMPLETO],(E.[Primer Nombre]+' '+ E.[Primer Apellido]) AS EMPLEADO,
	Fecha AS FECHA,MP.Descripcion AS [MODO DE PAGO]from Factura_Venta FV INNER JOIN Cliente C ON FV.ID_Cliente = C.Cedula
	INNER JOIN Empleado E ON E.Cedula = FV.ID_Empleado
	INNER JOIN Modo_Pago MP ON MP.ID_MPago = FV.ID_MPago WHERE ID_Factura=@ID_FACTURA

	SELECT P.Nombre AS PRODUCTO, DFV.Cant_Producto AS CANTIDAD, P.Precio AS PRECIO, (PRECIO * Cant_Producto) AS TOTAL FROM Detalle_Factura_Venta DFV
	INNER JOIN Producto P ON DFV.ID_Producto = P.ID_Producto WHERE ID_Factura = @ID_FACTURA

	SELECT SubTotal, IVA, TOTAL FROM Factura_Venta WHERE ID_Factura= @ID_FACTURA
	END
END


EXEC SP_MOSTRAR_FACTURA_VENTA 16