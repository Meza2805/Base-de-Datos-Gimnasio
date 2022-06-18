create proc SP_Cursor_Registro_Asistencia
as
begin
DECLARE 
@Id_Registro int,
@Fecha date,
@Hora varchar(10),
@cedula varchar(18),
@Nombre varchar(15)
Create Table #Asistencia 
	     (
			Id_Registro int,
			Fecha date,
			Hora varchar(10),
			cedula varchar(18),
			Nombre varchar(15)
	      )

DECLARE Cursor_Asistencia Cursor For
		select ra.ID_Registro, Fecha,Hora,c.Cedula, (c.[Primer Nombre]+ ' '+ c.[Primer Apellido])as Nombre 
		from Registo_Asistencia ra inner join  Cliente c on c.Cedula = ra.ID_Cliente

		OPEN	Cursor_Asistencia
FETCH Next FROM	Cursor_Asistencia	-- Ubicarnos en el Primer Registro
INTO		@Id_Registro,@Fecha,@Hora,@cedula,@Nombre
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Asistencia 
		     (Id_Registro,Fecha,Hora,cedula,Nombre)
	VALUES 
		      (@Id_Registro,@Fecha,@Hora,@cedula,@Nombre)

	FETCH Next FROM	Cursor_Asistencia	-- Ubicarnos en el Primer Registro
	INTO		@Id_Registro,@Fecha,@Hora,@cedula,@Nombre

END	

Close	Cursor_Asistencia
DEALLOCATE Cursor_Asistencia

Select * From #Asistencia 
Drop Table #Asistencia 
end