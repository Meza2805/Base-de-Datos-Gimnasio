create proc SP_Cursor_Suscripcion_Tabla
as
begin
DECLARE
@ID_Sus int,
@Membresia varchar(15),
@Fecha_contra date,
@Fecha_Venc date,
@Cedula_cliente char(18),
@Nombre_Cliente varchar(15)
Create Table #Suscripcion 
	     (
			ID_Sus int,
			Membresia varchar(15),
			Fecha_contra date,
			Fecha_Venc date,
			Cedula_cliente char(18),
			Nombre_Cliente varchar(15)
	      )
DECLARE Cursor_Suscripcion Cursor For
		select ID_SUBS,m.Descripcion as MEMBRESIA, Fecha_Contratacion, Fecha_Expiracion,c.Cedula,
		(c.[Primer Nombre]+' '+c.[Primer Apellido]) as CLIENTE from  suscripcion s
		inner join  Cliente c on s.ID_Cliente = c.Cedula
		inner join Membresia m on s.ID_Membresia = m.ID_Membresia where Finalizada = 0
		OPEN	Cursor_Suscripcion
FETCH Next FROM	Cursor_Suscripcion	-- Ubicarnos en el Primer Registro
INTO		@ID_Sus,@Membresia,@Fecha_contra,@Fecha_Venc,@Cedula_cliente,@Nombre_Cliente
while (@@FETCH_STATUS = 0) 
Begin
	INSERT INTO #Suscripcion 
		     (ID_Sus,Membresia,Fecha_contra,Fecha_Venc,Cedula_cliente,Nombre_Cliente)
	VALUES 
		      (@ID_Sus,@Membresia,@Fecha_contra,@Fecha_Venc,@Cedula_cliente,@Nombre_Cliente)

	FETCH Next FROM	Cursor_Suscripcion	-- Ubicarnos en el Primer Registro
	INTO		@ID_Sus,@Membresia,@Fecha_contra,@Fecha_Venc,@Cedula_cliente,@Nombre_Cliente

END	

Close	Cursor_Suscripcion
DEALLOCATE Cursor_Suscripcion

Select * From #Suscripcion 
Drop Table #Suscripcion
end
