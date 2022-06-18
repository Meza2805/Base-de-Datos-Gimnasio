create proc SP_Cursor_Producto
as
begin
DECLARE
@ID int,
@Producto varchar(25),
@Precio varchar(15),
@stock int,
@descripcion varchar(100),
@categoria varchar(30),
@marca varchar(20)
Create Table #Producto 
	     (
			ID int,
			Producto varchar(25),
			Precio varchar(15),
			stock int,
			descripcion varchar(100),
			categoria varchar(30),
			marca varchar(20)
	      )
DECLARE Cursor_Producto Cursor For
		SELECT       P.ID_Producto AS [CODIGO PRODUCTO], P.Nombre AS PRODUCTO, 'C$' + ' ' + CONVERT(VARCHAR(10), P.Precio) AS PRECIO, P.Stock, P.Descripcion_Producto AS [DESCRIPCION PRODUCTO], C.Descripcion AS CATEGORIA, 
                         M.Nombre AS MARCA
FROM            dbo.Producto AS P INNER JOIN
                         dbo.Categoria AS C ON P.ID_Categoria = C.ID_Categoria INNER JOIN
                         dbo.Marca AS M ON P.ID_Marca = M.ID_Marca
		OPEN	Cursor_Producto
FETCH Next FROM	Cursor_Producto	-- Ubicarnos en el Primer Registro
INTO	@ID,@Producto,@Precio,@stock,@descripcion,@categoria,@marca
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Producto
		     (ID,Producto,Precio,stock,descripcion,categoria,marca)
	VALUES 
		      (@ID,@Producto,@Precio,@stock,@descripcion,@categoria,@marca)

	FETCH Next FROM	Cursor_Producto	-- Ubicarnos en el Primer Registro
	INTO		@ID,@Producto,@Precio,@stock,@descripcion,@categoria,@marca

END	

Close	Cursor_Producto
DEALLOCATE Cursor_Producto

Select * From #Producto
Drop Table #Producto
end