ALTER proc SP_Actualizar_Empleado
	@Cedula char(16),
	@Pnombre nvarchar(50),
	@Snombre nvarchar(50),
	@Papellido nvarchar(50),
	@Sapellido nvarchar(50),
	@telefono varchar(8),
	@direccion nvarchar(200),
	@estado varchar (35),
	@salida varchar(50) out
	as
	begin
	set nocount on
	if exists (select top 1 Cedula from Empleado with (nolock) where Cedula =  @Cedula)
		begin
				update Empleado set [Primer Nombre] = @Pnombre, [Segundo Nombre] = @Snombre, [Primer Apellido] = @Papellido, [Segundo Apellido]= @Sapellido,
				Telefono = @telefono, Direccion = @direccion, Estado = @estado where Cedula = @Cedula
				set @salida='EL EMPLEADO HA SIDO ACTUALIZADO'
		end
	else
		begin
			set @salida='EL EMPLEADO NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
		
	end

	select * from Empleado