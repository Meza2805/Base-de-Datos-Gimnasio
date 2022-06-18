create proc SP_Cursor_Membresia
as
begin
DECLARE
@Codigo char(1),
@Descripcion varchar(20),
@Precio varchar(10)
Create Table #Membresia 
	     (
			Codigo char(1),
			Descripcion varchar(20),
			Precio varchar(10)
	      )
DECLARE Cursor_Membresia Cursor For
		SELECT       ID_Membresia AS CODIGO, Descripcion, 'C$' + ' ' + CONVERT(VARCHAR(10), Precio) AS PRECIO FROM  dbo.Membresia
		OPEN Cursor_Membresia
FETCH Next FROM	Cursor_Membresia	-- Ubicarnos en el Primer Registro
INTO		@Codigo,@Descripcion,@Precio
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Membresia
		     (Codigo,Descripcion,Precio)
	VALUES 
		      (@Codigo,@Descripcion,@Precio)

	FETCH Next FROM	 Cursor_Membresia	-- Ubicarnos en el Primer Registro
	INTO		@Codigo,@Descripcion,@Precio

END	

Close	Cursor_Membresia
DEALLOCATE Cursor_Membresia

Select * From #Membresia 
Drop Table #Membresia

end