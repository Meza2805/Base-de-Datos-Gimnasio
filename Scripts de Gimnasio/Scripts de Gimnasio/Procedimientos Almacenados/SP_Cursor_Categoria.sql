create proc SP_Cursor_Categoria
as
begin
DECLARE
@ID int,
@Descripcion varchar(25)
Create Table #Categoria 
	     (
			ID int,
			Descripcion varchar(25)
	      )
DECLARE Cursor_Categoria Cursor For
		SELECT  * from Categoria
		OPEN	Cursor_Categoria
FETCH Next FROM	Cursor_Categoria	-- Ubicarnos en el Primer Registro
INTO		@ID,@Descripcion
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Categoria
		     (ID,Descripcion)
	VALUES 
		      (@ID,@Descripcion)

	FETCH Next FROM	Cursor_Categoria	-- Ubicarnos en el Primer Registro
	INTO		@ID,@Descripcion

END	

Close	Cursor_Categoria
DEALLOCATE Cursor_Categoria

Select * From #Categoria 
Drop Table #Categoria
end