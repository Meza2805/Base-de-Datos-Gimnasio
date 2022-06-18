create proc SP_Cursor_Cliente_Datos_Personales_Ordenados_Edad
as
begin
DECLARE 
@Cedula	char(16),
@Primer_Nombre varchar(35),
@Segundo_Nombre varchar(35),
@Primer_Apellido varchar(35),
@Segundo_Apellido varchar(35),
@sexo char(1),
@Edad varchar(5)
Create Table #Clientes 
	     (
			Cedula	char(16),
			Primer_Nombre varchar(35),
			Segundo_Nombre varchar(35),
			Primer_Apellido varchar(35),
			Segundo_Apellido varchar(35),
			sexo char(1),
			Edad varchar(5)
	      )

DECLARE Cursor_Cliente Cursor For
		 SELECT Cedula, [Primer Nombre], [Segundo Nombre], [Primer Apellido], [Segundo Apellido] , Sexo,
		floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8),
		Cliente.Fecha_Nac,112) as int) ) / 10000) as Edad
		from Cliente where Cedula != '000-000000-00000' order by Edad desc

		OPEN	Cursor_Cliente
FETCH Next FROM	Cursor_Cliente	-- Ubicarnos en el Primer Registro
INTO		@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,
			@sexo,@Edad
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Clientes 
		     (Cedula,Primer_Nombre,Segundo_Nombre,Primer_Apellido,
				Segundo_Apellido,sexo,Edad)
	VALUES 
		      (@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,
				@sexo,@Edad)

	FETCH Next FROM	Cursor_Cliente	-- Ubicarnos en el Primer Registro
	INTO		@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,
				@sexo,@Edad

END	

Close	Cursor_Cliente
DEALLOCATE Cursor_Cliente

Select * From #Clientes 
Drop Table #Clientes 
end