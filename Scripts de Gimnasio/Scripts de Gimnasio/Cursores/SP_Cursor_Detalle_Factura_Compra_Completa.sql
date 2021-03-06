create proc SP_Cursor_Detalle_Factura_Compra_Completa
as
begin
DECLARE
@ID_Detalle int,
@ID_Factura int,
@Nombre varchar (35),
@cantidad int,
@precio varchar(10),
@sub varchar(10)
Create Table #Detalle_Factura 
	     (
			ID_Detalle int,
			ID_Factura int,
			Nombre varchar (35),
			cantidad int,
			precio varchar(10),
			sub varchar(10)
	      )
DECLARE Cursor_Factura Cursor For
SELECT       dfv.ID_Detalle, dfv.ID_Factura, p.Nombre, dfv.Cant_Producto, 'C$' + ' ' + CONVERT(VARCHAR(10), p.Precio) AS Precio_Unitario, 'C$' + ' ' + CONVERT(VARCHAR(10), dfv.Cant_Producto * p.Precio) AS Sub_Total
FROM            dbo.Detalle_Factura_Venta AS dfv INNER JOIN
                         dbo.Producto AS p ON dfv.ID_Producto = p.ID_Producto order by (dfv.Cant_Producto * p.Precio)
		OPEN	Cursor_Factura
FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
INTO	@ID_Detalle,@ID_Factura,@Nombre,@cantidad,@precio,@sub
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Detalle_Factura
		     (ID_Detalle,ID_Factura,Nombre,cantidad,precio,sub)
	VALUES 
		      (@ID_Detalle,@ID_Factura,@Nombre,@cantidad,@precio,@sub)

	FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
	INTO		@ID_Detalle,@ID_Factura,@Nombre,@cantidad,@precio,@sub

END	

Close	Cursor_Factura
DEALLOCATE Cursor_Factura

Select * From #Detalle_Factura
Drop Table #Detalle_Factura
end