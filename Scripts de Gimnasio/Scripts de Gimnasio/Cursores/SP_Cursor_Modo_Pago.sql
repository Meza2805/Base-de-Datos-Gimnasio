create proc SP_Cursor_Modo_Pago
as
begin
DECLARE
@Codigo int,
@Descripcion varchar(15)
Create Table #Pago 
	     (
			Codigo int,
			Descripcion varchar(15)
	      )
DECLARE Cursor_Pago Cursor For
	SELECT       ID_MPago AS CODIGO, Descripcion as DESCRIPCION
FROM            dbo.Modo_Pago

		OPEN Cursor_Pago
FETCH Next FROM	Cursor_Pago	-- Ubicarnos en el Primer Registro
INTO		@Codigo, @Descripcion
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Pago
		     (Codigo, Descripcion)
	VALUES 
		      (@Codigo, @Descripcion)

	FETCH Next FROM	 Cursor_Pago	-- Ubicarnos en el Primer Registro
	INTO		@Codigo, @Descripcion

END	

Close	Cursor_Pago
DEALLOCATE Cursor_Pago

Select * From #Pago 
Drop Table #Pago
end