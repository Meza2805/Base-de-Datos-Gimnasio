create proc SP_Actualizar_credenciales
@usser varchar(25),
@pass varchar(25),
@salida varchar(35) out
as
begin
		update Empleado set Usuario =@usser , Contraseña = @pass where Privilegio = 'A'
		set @salida = 'CREDENCIALES ACTUALIZADOS'
		SELECT @salida
end

select * from Empleado