create proc SP_Cursor_Producto_Fecha
as
begin
DECLARE
@ID int,
@Producto varchar(25),
@Precio varchar(15),
@stock int,
@fecha date
Create Table #Producto 
	     (
			ID int,
			Producto varchar(25),
			Precio varchar(15),
			stock int,
			fecha date
	      )
DECLARE Cursor_Producto Cursor For
		SELECT       P.ID_Producto AS [CODIGO PRODUCTO], P.Nombre AS PRODUCTO, 'C$' + ' ' + CONVERT(VARCHAR(10), P.Precio) AS PRECIO, P.Stock, FC.Fecha AS [Fecha de Compra]
FROM            dbo.Producto AS P INNER JOIN
                         dbo.Categoria AS C ON P.ID_Categoria = C.ID_Categoria INNER JOIN
                         dbo.Marca AS M ON P.ID_Marca = M.ID_Marca INNER JOIN
                         dbo.Detalle_Factura_Compra AS dfc ON P.ID_Producto = dfc.ID_Producto INNER JOIN
                         dbo.Factura_Compra AS FC ON dfc.ID_Factura_Compra = FC.ID_Factura
		OPEN	Cursor_Producto
FETCH Next FROM	Cursor_Producto	-- Ubicarnos en el Primer Registro
INTO	@ID,@Producto,@Precio,@stock,@fecha
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Producto
		     (ID,Producto,Precio,stock,fecha)
	VALUES 
		      (@ID,@Producto,@Precio,@stock,@fecha)

	FETCH Next FROM	Cursor_Producto	-- Ubicarnos en el Primer Registro
	INTO		@ID,@Producto,@Precio,@stock,@fecha

END	

Close	Cursor_Producto
DEALLOCATE Cursor_Producto

Select * From #Producto
Drop Table #Producto
end