ALTER proc SP_Actualizar_Login
@Cedula char(16),
@usser varchar(25),
@contra varchar(25),
@salida varchar(50) out
as begin
if exists (select top 1 Cedula from Empleado with (nolock) where Cedula =  @Cedula)
		begin
			update Empleado set Usuario = @usser, Contraseña = @contra where Cedula = @Cedula
			set @salida = 'LAS CREDENCIALES DEL USUARIO HAN SIDO MODIFICADAS'
		end
		SELECT @salida
end