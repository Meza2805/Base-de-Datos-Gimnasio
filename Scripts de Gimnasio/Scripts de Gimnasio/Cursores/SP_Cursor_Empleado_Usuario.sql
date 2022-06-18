create proc SP_Cursor_Empleado_Usuario
as
begin
DECLARE
@Nombre varchar(15),
@Usser varchar(15),
@Observacion varchar(15)
Create Table #Estado_Empleado 
	     (
			Nombre varchar(15),
			Usser varchar(15),
			Observacion varchar(15)
	      )
DECLARE Cursor_Empleado_Usuario Cursor For
		SELECT     [Primer Nombre] + ' ' + [Primer Apellido] AS Nombre_Empleado, Usuario, Contraseña
		FROM      dbo.Empleado
			OPEN Cursor_Empleado_Usuario
FETCH Next FROM	Cursor_Empleado_Usuario	-- Ubicarnos en el Primer Registro
INTO		@Nombre,@Usser,@Observacion
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Estado_Empleado 
		     (Nombre,Usser,Observacion)
	VALUES 
		      (@Nombre,@Usser,@Observacion)

	FETCH Next FROM	 Cursor_Empleado_Usuario	-- Ubicarnos en el Primer Registro
	INTO		@Nombre,@Usser,@Observacion

END	

Close	Cursor_Empleado_Usuario
DEALLOCATE Cursor_Empleado_Usuario

Select * From #Estado_Empleado
Drop Table #Estado_Empleado
end
