create proc SP_Cursor_Cliente_Activos
as
begin
DECLARE 
@Cedula	char(16),
@Primer_Nombre varchar(35),
@Segundo_Nombre varchar(35),
@Primer_Apellido varchar(35),
@Segundo_Apellido varchar(35),
@Fecha_registro date,
@Descripcion varchar(15)
Create Table #Clientes 
	     (
			Cedula	char(16),
			Primer_Nombre varchar(35),
			Segundo_Nombre varchar(35),
			Primer_Apellido varchar(35),
			Segundo_Apellido varchar(35),
			Fecha_registro date,
			Descripcion varchar(15)
	      )

DECLARE Cursor_Cliente Cursor For
		 SELECT Cedula as CEDULA, [Primer Nombre] as [PRIMER NOMBRE], [Segundo Nombre] AS [SEGUNDO NOMBRE], [Primer Apellido] AS [PRIMER APELLIDO], 
 [Segundo Apellido] AS [SEGUNDO APELLIDO] , Fecha_Registro AS [FECHA DE REGISTRO] , EC.Descripcion AS DESCRIPCION FROM Cliente C INNER JOIN Estado_Cliente EC
 ON C.ID_Estado = EC.ID_Estado WHERE C.ID_Estado = 'A' order by [FECHA DE REGISTRO] desc

		OPEN	Cursor_Cliente
FETCH Next FROM	Cursor_Cliente	-- Ubicarnos en el Primer Registro
INTO		@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,
			@Fecha_registro,@Descripcion
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Clientes 
		     (Cedula,Primer_Nombre,Segundo_Nombre,Primer_Apellido,
				Segundo_Apellido,Fecha_registro,Descripcion)
	VALUES 
		      (@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,
				@Fecha_registro,@Descripcion)

	FETCH Next FROM	Cursor_Cliente	-- Ubicarnos en el Primer Registro
	INTO		@Cedula, @Primer_Nombre,@Segundo_Nombre,@Primer_Apellido,@Segundo_Apellido,
				@Fecha_registro,@Descripcion

END	

Close	Cursor_Cliente
DEALLOCATE Cursor_Cliente

Select * From #Clientes 
Drop Table #Clientes 
end