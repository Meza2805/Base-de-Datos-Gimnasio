create proc SP_Cursor_Detalle_Factura_Venta
as
begin
DECLARE
@ID_Detalle int,
@ID_Factura int,
@Nombre varchar(30),
@Precio varchar(20),
@Cantidad int
Create Table #Detalle_Factura 
	     (
			ID_Detalle int,
			ID_Factura int,
			Nombre varchar(30),
			Precio varchar (20),
			Cantidad int
	      )
DECLARE Cursor_Factura Cursor For
		SELECT       dfv.ID_Detalle, dfv.ID_Factura, p.Nombre, 'C$' + ' ' + CONVERT(VARCHAR(10), p.Precio) AS Precio, dfv.Cant_Producto
FROM            dbo.Detalle_Factura_Venta AS dfv INNER JOIN
                         dbo.Producto AS p ON dfv.ID_Producto = p.ID_Producto
		OPEN	Cursor_Factura
FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
INTO	@ID_Detalle,@ID_Factura,@Nombre,@Precio,@Cantidad
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Detalle_Factura
		     (ID_Detalle,ID_Factura,Nombre,Precio,Cantidad)
	VALUES 
		      (@ID_Detalle,@ID_Factura,@Nombre,@Precio,@Cantidad)

	FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
	INTO		@ID_Detalle,@ID_Factura,@Nombre,@Precio,@Cantidad

END	

Close	Cursor_Factura
DEALLOCATE Cursor_Factura

Select * From #Detalle_Factura
Drop Table #Detalle_Factura
end