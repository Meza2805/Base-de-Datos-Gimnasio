create proc SP_Actualizar_Empleado
@Cedula char(16),
@Primer_Nombre varchar(50) out,
@Segundo_Nombre varchar(50) out,
@Primer_Apellido varchar(50) out,
@Segundo_Apellido varchar(50) out,
@Telefono char(8) out,
@direccion nvarchar(200) out,
@fecha_Contratacion date out 
as
begin
	if not exists (select top 1 Cedula from Empleado with (nolock) where Cedula = @Cedula)
	begin
		print 'EL EMPELADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
	begin
		update Empleado set [Primer Nombre] = @Primer_Nombre, [Segundo Nombre] = [Segundo Nombre],
		[Primer Apellido] =  [Primer Apellido], [Segundo Apellido] = @Segundo_Apellido, Telefono = @Telefono,
		Direccion= @direccion, [Fecha Contratacion] = @fecha_Contratacion where Cedula = @Cedula
	end
end
 

