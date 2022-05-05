alter proc SP_Eliminar_Empleado
@ID_Empleado int
as
	set nocount on
	begin
		IF not exists (select top 1(ID_Empleado) from Empleado with (nolock) where ID_Empleado =@ID_Empleado )
			begin
				print 'EL EMPLEADO NO SE ENCUENTRA EN LA BASE DE DATOS'
			end
		else
			begin
				DELETE from Empleado where ID_Empleado = @ID_Empleado
				print 'EL EMPLEADO HA SIDO ELIMINADO DE LA BASE DE DATOS'
			end
	end


select * from Empleado
exec SP_Insertar_Empleado 'josue','ramon','perez','pichardo','87213410','Villa Libertad de la chelita 4 cuadras al norte','12/02/2021'
exec SP_Eliminar_Empleado 3