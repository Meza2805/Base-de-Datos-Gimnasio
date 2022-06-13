alter proc SP_Eliminar_Empleado
@Cedula char(16)
as
	set nocount on
	begin
		IF not exists (select top 1(Cedula) from Empleado with (nolock) where Cedula =@Cedula )
			begin
				print 'EL EMPLEADO NO SE ENCUENTRA EN LA BASE DE DATOS'
			end
		else
			begin
				DELETE from Empleado where Cedula = @Cedula
				print 'EL EMPLEADO HA SIDO ELIMINADO DE LA BASE DE DATOS'
			end
	end

