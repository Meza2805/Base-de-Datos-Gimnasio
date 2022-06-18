alter proc SP_Cursor_Detalle_Factura_Tabla
as
begin
DECLARE
@ID_Detalle int,
@ID_Factura int,
@ID_Producto int,
@Cantidad int
Create Table #Detalle_Factura 
	     (
			ID_Detalle int,
			ID_Factura int,
			ID_Producto int,
			Cantidad int
	      )
DECLARE Cursor_Factura Cursor For
SELECT       ID_Detalle, ID_Factura, ID_Producto, Cant_Producto
FROM            dbo.Detalle_Factura_Venta
		OPEN	Cursor_Factura
FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
INTO	@ID_Detalle,@ID_Factura,@ID_Producto,@Cantidad
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Detalle_Factura
		     (ID_Detalle,ID_Factura,ID_Producto,Cantidad)
	VALUES 
		      (@ID_Detalle,@ID_Factura,@ID_Producto,@Cantidad)

	FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
	INTO		@ID_Detalle,@ID_Factura,@ID_Producto,@Cantidad

END	

Close	Cursor_Factura
DEALLOCATE Cursor_Factura

Select * From #Detalle_Factura
Drop Table #Detalle_Factura
end