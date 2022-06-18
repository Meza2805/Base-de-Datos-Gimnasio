create proc SP_Cursor_Estado_Cliente
as
begin
DECLARE
@ID_Estado char(1),
@Descripcion varchar(15),
@Observacion varchar(15)
Create Table #Estado_Cliente 
	     (
			ID_Estado char(1),
			Descripcion varchar(15),
			Observacion varchar(15)
	      )
DECLARE Cursor_Estado_Cliente Cursor For
		SELECT       ID_Estado, Descripcion, Observacion
			FROM  dbo.Estado_Cliente
			OPEN Cursor_Estado_Cliente
FETCH Next FROM	Cursor_Estado_Cliente	-- Ubicarnos en el Primer Registro
INTO		@ID_Estado,@Descripcion,@Observacion
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Estado_Cliente 
		     (ID_Estado,Descripcion,Observacion)
	VALUES 
		      (@ID_Estado,@Descripcion,@Observacion)

	FETCH Next FROM	Cursor_Estado_Cliente	-- Ubicarnos en el Primer Registro
	INTO		@ID_Estado,@Descripcion,@Observacion

END	

Close	Cursor_Estado_Cliente
DEALLOCATE Cursor_Estado_Cliente

Select * From #Estado_Cliente
Drop Table #Estado_Cliente
end
