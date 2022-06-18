create proc SP_Cursor_Detalle_Factura_Venta_Total
as
begin
DECLARE
@ID_Detalle int,
@ID_Factura int,
@Nombre varchar(30),
@Precio varchar(20),
@Sub_total varchar(20),
@Cantidad int
Create Table #Detalle_Factura 
	     (
			ID_Detalle int,
			ID_Factura int,
			Nombre varchar(30),
			Cantidad int,
			Precio varchar (20),
			Sub_Total varchar (20),
	      )
DECLARE Cursor_Factura Cursor For
SELECT       dfv.ID_Detalle, dfv.ID_Factura, p.Nombre, dfv.Cant_Producto, 'C$' + ' ' + CONVERT(VARCHAR(10), p.Precio) AS Precio_Unitario, 'C$' + ' ' + CONVERT(VARCHAR(10), dfv.Cant_Producto * p.Precio) AS Sub_Total 
FROM            dbo.Detalle_Factura_Venta AS dfv INNER JOIN
                         dbo.Producto AS p ON dfv.ID_Producto = p.ID_Producto order by p.Precio
		OPEN	Cursor_Factura
FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
INTO	@ID_Detalle,@ID_Factura,@Nombre,@Cantidad,@Precio,@Sub_Total
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Detalle_Factura
		     (ID_Detalle,ID_Factura,Nombre,Cantidad,Precio,Sub_Total)
	VALUES 
		      (@ID_Detalle,@ID_Factura,@Nombre,@Cantidad,@Precio,@Sub_Total)

	FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
	INTO		@ID_Detalle,@ID_Factura,@Nombre,@Cantidad,@Precio,@Sub_Total

END	

Close	Cursor_Factura
DEALLOCATE Cursor_Factura

Select * From #Detalle_Factura
Drop Table #Detalle_Factura
end