create proc SP_Cursor_Detalle_Factura_Compra_Tabla
as
begin
DECLARE
@ID_Detalle int,
@ID_Factura int,
@ID_Producto int,
@Costo decimal(10,2),
@cantidad int
Create Table #Detalle_Factura 
	     (
			ID_Detalle int,
			ID_Factura int,
			ID_Producto int,
			Costo decimal(10,2),
			cantidad int
	      )
DECLARE Cursor_Factura Cursor For
SELECT   * from Detalle_Factura_Compra
		OPEN	Cursor_Factura
FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
INTO	@ID_Detalle,@ID_Factura,@ID_Producto,@Costo,@cantidad
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Detalle_Factura
		     (ID_Detalle,ID_Factura,ID_Producto,Costo,cantidad)
	VALUES 
		      (@ID_Detalle,@ID_Factura,@ID_Producto,@Costo,@cantidad)

	FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
	INTO		@ID_Detalle,@ID_Factura,@ID_Producto,@Costo,@cantidad

END	

Close	Cursor_Factura
DEALLOCATE Cursor_Factura

Select * From #Detalle_Factura
Drop Table #Detalle_Factura
end