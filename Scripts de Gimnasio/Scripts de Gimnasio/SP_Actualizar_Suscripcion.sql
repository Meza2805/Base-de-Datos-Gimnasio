create proc SP_Actualizar_Suscripcion
@id int,
@fecha_c date,
@fecha_exp date,
@id_cliente varchar(16),
@id_empleado varchar(16),
@id_membresia char(1),
@finalizada bit
as
begin
	set nocount on
	if not exists (select top 1 ID_SUBS from suscripcion where ID_SUBS =  @id)
		begin
			print 'EL REGISTRO NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
	else
		begin
			update suscripcion set Fecha_Contratacion=@fecha_c, Fecha_Expiracion=@fecha_exp, ID_Cliente=@id_cliente,
			ID_Empleado = @id_empleado, ID_Membresia = @id_membresia,Finalizada=@finalizada where  ID_SUBS = @id
		end
end
