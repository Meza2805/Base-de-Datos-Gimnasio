create proc SP_Cursor_Empleado_Tabla
as
begin
DECLARE
@Cedula char(16),
@P_Nombre varchar(20),
@S_Nombre varchar(20),
@P_Apellido varchar(20),
@S_Apellido varchar(20),
@telefono char(8),
@Direccion varchar(100),
@Fecha date,
@Usser varchar(15),
@Contra varchar(15)
Create Table #Empleado 
	     (
			Cedula char(16),
			P_Nombre varchar(20),
			S_Nombre varchar(20),
			P_Apellido varchar(20),
			S_Apellido varchar(20),
			telefono char(8),
			Direccion varchar(100),
			Fecha date,
			Usser varchar(15),
			Contra varchar(15)
	      )
DECLARE Cursor_Empleado Cursor For
		SELECT   Cedula,[Primer Nombre],[Segundo Nombre],[Primer Apellido],[Segundo Apellido],
		Telefono,Direccion,[Fecha Contratacion],Usuario,Contraseña	FROM dbo.Empleado order by [Fecha Contratacion]

		OPEN Cursor_Empleado
FETCH Next FROM	Cursor_Empleado	-- Ubicarnos en el Primer Registro
INTO		@Cedula,@P_Nombre,@S_Nombre,@P_Apellido,@S_Apellido,@telefono,@Direccion,@Fecha,
@Usser,@Contra
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Empleado 
		     (Cedula,P_Nombre,S_Nombre,P_Apellido,S_Apellido,telefono,Direccion,Fecha,
Usser,Contra)
	VALUES 
		      (@Cedula,@P_Nombre,@S_Nombre,@P_Apellido,@S_Apellido,@telefono,@Direccion,@Fecha,
@Usser,@Contra)

	FETCH Next FROM	 Cursor_Empleado	-- Ubicarnos en el Primer Registro
	INTO		@Cedula,@P_Nombre,@S_Nombre,@P_Apellido,@S_Apellido,@telefono,@Direccion,@Fecha,
@Usser,@Contra

END	

Close	Cursor_Empleado
DEALLOCATE Cursor_Empleado

Select * From #Empleado 
Drop Table #Empleado

end
