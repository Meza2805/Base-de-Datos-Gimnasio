create proc SP_Cursor_Estado_Empleado_Activo
as
begin
DECLARE
@Cedula char(16),
@P_Nombre varchar(20),
@S_Nombre varchar(20),
@P_Apellido varchar(20),
@S_Apellido varchar(20),
@Estado varchar(15)
Create Table #Empleado 
	     (
			Cedula char(16),
			P_Nombre varchar(20),
			S_Nombre varchar(20),
			P_Apellido varchar(20),
			S_Apellido varchar(20),
			Estado varchar(15)
	      )
DECLARE Cursor_Empleado Cursor For
		SELECT       E.Cedula, E.[Primer Nombre], E.[Segundo Nombre], E.[Primer Apellido], E.[Segundo Apellido], EE.Descripcion AS ESTADO
FROM            dbo.Empleado AS E INNER JOIN
                         dbo.Estado_Empleado AS EE ON E.ID_Estado_Empleado = EE.ID_ESTADO_EMP where EE.Descripcion = 'ACTIVO'

		OPEN Cursor_Empleado
FETCH Next FROM	Cursor_Empleado	-- Ubicarnos en el Primer Registro
INTO		@Cedula,@P_Nombre,@S_Nombre,@P_Apellido,@S_Apellido,@Estado
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Empleado 
		     (Cedula,P_Nombre,S_Nombre,P_Apellido,S_Apellido,Estado)
	VALUES 
		      (@Cedula,@P_Nombre,@S_Nombre,@P_Apellido,@S_Apellido,@Estado)

	FETCH Next FROM	 Cursor_Empleado	-- Ubicarnos en el Primer Registro
	INTO		@Cedula,@P_Nombre,@S_Nombre,@P_Apellido,@S_Apellido,@Estado

END	

Close	Cursor_Empleado
DEALLOCATE Cursor_Empleado

Select * From #Empleado 
Drop Table #Empleado

end
