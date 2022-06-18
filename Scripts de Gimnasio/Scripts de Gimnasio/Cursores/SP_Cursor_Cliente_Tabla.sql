create proc SP_Cursor_Cliente_Tabla
as
begin
DECLARE 
@Cedula	char(16),
@Primer_Nombre varchar(35),
@Segundo_Nombre varchar(35),
@Primer_Apellido varchar(35),
@Segundo_Apellido varchar(35),
@sexo char(1),
@Fecha_Nac date,
@Fecha_Registro date,
@Id_Estado char(1)
Create Table #Clientes 
	     (
			Cedula	char(16),
			Primer_Nombre varchar(35),
			Segundo_Nombre varchar(35),
			Primer_Apellido varchar(35),
			Segundo_Apellido varchar(35),
			sexo char(1),
			Fecha_Nac date,
			Fecha_Registro date,
			Id_Estado char(1)
	      )

DECLARE Cursor_Cliente Cursor For
		SELECT Cedula,[Primer Nombre],[Segundo Nombre],[Primer Apellido],[Segundo Apellido],
		Sexo,Fecha_Nac,Fecha_Registro,ID_Estado	FROM Cliente

		OPEN	Cursor_Cliente
FETCH Next FROM	Cursor_Cliente	-- Ubicarnos en el Primer Registro
INTO		@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,
			@sexo,@Fecha_Nac,@Fecha_Registro,@Id_Estado
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Clientes 
		     (Cedula,Primer_Nombre,Segundo_Nombre,Primer_Apellido,
				Segundo_Apellido,sexo,Fecha_Nac,Fecha_Registro,Id_Estado)
	VALUES 
		      (@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,
				@sexo,@Fecha_Nac,@Fecha_Registro,@Id_Estado)

	FETCH Next FROM	Cursor_Cliente	-- Ubicarnos en el Primer Registro
	INTO		@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,
				@sexo,@Fecha_Nac,@Fecha_Registro,@Id_Estado

END	

Close	Cursor_Cliente
DEALLOCATE Cursor_Cliente

Select * From #Clientes 
Drop Table #Clientes 
end