create proc SP_Cursor_Empleado_Datos
as
begin
DECLARE
@Cedula char(16),
@P_Nombre varchar(20),
@S_Nombre varchar(20),
@P_Apellido varchar(20),
@S_Apellido varchar(20),
@Fecha date
Create Table #Empleado 
	     (
			Cedula char(16),
			P_Nombre varchar(20),
			S_Nombre varchar(20),
			P_Apellido varchar(20),
			S_Apellido varchar(20),
			Fecha date
	      )
DECLARE Cursor_Empleado Cursor For
		SELECT   Cedula,[Primer Nombre],[Segundo Nombre],[Primer Apellido],[Segundo Apellido],[Fecha Contratacion]
		FROM dbo.Empleado order by [Fecha Contratacion] 

		OPEN Cursor_Empleado
FETCH Next FROM	Cursor_Empleado	-- Ubicarnos en el Primer Registro
INTO		@Cedula,@P_Nombre,@S_Nombre,@P_Apellido,@S_Apellido,@Fecha
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Empleado 
		     (Cedula,P_Nombre,S_Nombre,P_Apellido,S_Apellido,Fecha)
	VALUES 
		      (@Cedula,@P_Nombre,@S_Nombre,@P_Apellido,@S_Apellido,@Fecha)

	FETCH Next FROM	 Cursor_Empleado	-- Ubicarnos en el Primer Registro
	INTO		@Cedula,@P_Nombre,@S_Nombre,@P_Apellido,@S_Apellido,@Fecha

END	

Close	Cursor_Empleado
DEALLOCATE Cursor_Empleado

Select * From #Empleado 
Drop Table #Empleado

end
