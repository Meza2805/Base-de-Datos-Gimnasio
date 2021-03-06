create proc SP_Cursor_Detalle_Factura_Compra
as
begin
DECLARE
@ID_Detalle int,
@ID_Factura int,
@ID_Producto int,
@Costo varchar (25)
Create Table #Detalle_Factura 
	     (
			ID_Detalle int,
			ID_Factura int,
			ID_Producto int,
			Costo varchar(25)
	      )
DECLARE Cursor_Factura Cursor For
SELECT       ID_Detalle, ID_Factura_Compra, ID_Producto, 'C$' + ' ' + CONVERT(VARCHAR(10), Costo) AS costo
FROM            dbo.Detalle_Factura_Compra
		OPEN	Cursor_Factura
FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
INTO	@ID_Detalle,@ID_Factura,@ID_Producto,@Costo
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Detalle_Factura
		     (ID_Detalle,ID_Factura,ID_Producto,Costo)
	VALUES 
		      (@ID_Detalle,@ID_Factura,@ID_Producto,@Costo)

	FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
	INTO		@ID_Detalle,@ID_Factura,@ID_Producto,@Costo

END	

Close	Cursor_Factura
DEALLOCATE Cursor_Factura

Select * From #Detalle_Factura
Drop Table #Detalle_Factura
end