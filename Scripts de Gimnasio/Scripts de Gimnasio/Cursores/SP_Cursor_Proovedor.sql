create proc SP_Cursor_Proovedor
as
begin
DECLARE
@Codigo int,
@Nombre varchar(30),
@Telefono varchar(15),
@Direccion varchar(50)
Create Table #Detalle_Factura 
	     (
			Codigo int,
			Nombre varchar(30),
			Telefono varchar(15),
			Direccion varchar(50)
	      )
DECLARE Cursor_Factura Cursor For
SELECT       ID_Proveedor AS CODIGO, Nombre AS PROOVEDOR, Telefono, Direccion
FROM            dbo.Proveedor
		OPEN	Cursor_Factura
FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
INTO	@Codigo,@Nombre,@Telefono,@Direccion
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Detalle_Factura
		     (Codigo,Nombre,Telefono,Direccion)
	VALUES 
		      (@Codigo,@Nombre,@Telefono,@Direccion)

	FETCH Next FROM	Cursor_Factura	-- Ubicarnos en el Primer Registro
	INTO		@Codigo,@Nombre,@Telefono,@Direccion

END	

Close	Cursor_Factura
DEALLOCATE Cursor_Factura

Select * From #Detalle_Factura
Drop Table #Detalle_Factura
end