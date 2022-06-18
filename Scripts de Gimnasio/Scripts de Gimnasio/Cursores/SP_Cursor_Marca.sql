create proc SP_Cursor_Marca
as
begin
DECLARE
@ID int,
@Nombre varchar(25)
Create Table #Marca 
	     (
			ID int,
			Nombre varchar(25)
	      )
DECLARE Cursor_Marca Cursor For
		SELECT ID_Marca, Nombre from Marca 
		OPEN	Cursor_Marca
FETCH Next FROM	Cursor_Marca	-- Ubicarnos en el Primer Registro
INTO	@ID,@Nombre
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Marca
		     (ID,Nombre)
	VALUES 
		      (@ID,@Nombre)

	FETCH Next FROM	Cursor_Marca	-- Ubicarnos en el Primer Registro
	INTO		@ID,@Nombre

END	

Close	Cursor_Marca
DEALLOCATE Cursor_Marca

Select * From #Marca
Drop Table #Marca
end