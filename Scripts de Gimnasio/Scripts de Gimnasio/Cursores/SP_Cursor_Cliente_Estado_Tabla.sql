create proc SP_Cursor_Cliente_Estado_Tabla
as
begin
DECLARE 
@Cedula	char(16),
@Primer_Nombre varchar(35),
@Segundo_Nombre varchar(35),
@Primer_Apellido varchar(35),
@Segundo_Apellido varchar(35),
@Estado varchar(15)
Create Table #Estado_Cliente 
	     (
			Cedula	char(16),
			Primer_Nombre varchar(35),
			Segundo_Nombre varchar(35),
			Primer_Apellido varchar(35),
			Segundo_Apellido varchar(35),
			Estado varchar(15)
	      )

DECLARE Cursor_Cliente Cursor For
		SELECT Cedula,[Primer Nombre], [Segundo Nombre],[Primer Apellido],
		[Segundo Apellido], EE.Descripcion AS ESTADO from Empleado E inner join Estado_Empleado EE
		ON E.ID_Estado_Empleado = EE.ID_ESTADO_EMP

		OPEN	Cursor_Cliente
FETCH Next FROM	Cursor_Cliente	-- Ubicarnos en el Primer Registro
INTO		@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,@Estado
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Estado_Cliente
		     (Cedula,Primer_Nombre,Segundo_Nombre,Primer_Apellido,
				Segundo_Apellido,Estado)
	VALUES 
		      (@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,@Estado)

	FETCH Next FROM	Cursor_Cliente	-- Ubicarnos en el Primer Registro
	INTO		@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,@Estado

END	

Close	Cursor_Cliente
DEALLOCATE Cursor_Cliente

Select * From #Estado_Cliente 
Drop Table #Estado_Cliente
end