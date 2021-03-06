
ALTER proc SP_Insertar_Empleado
	@Cedula char(16),
	@Pnombre nvarchar(50),
	@Snombre nvarchar(50),
	@Papellido nvarchar(50),
	@Sapellido nvarchar(50),
	@telefono varchar(8),
	@direccion varchar(200),
	@salida varchar(50) out
	as
	begin
	set nocount on
	if not exists (select top 1 Cedula from Empleado with (nolock) where Cedula =  @Cedula)
		begin
				insert into Empleado (Cedula,[Primer Nombre],[Segundo Nombre],[Primer Apellido],
				[Segundo Apellido],Telefono,Direccion,[Fecha Contratacion],Usuario,Contraseña,Estado,Privilegio)
				values (@Cedula,ltrim(rtrim(upper(@Pnombre))),ltrim(rtrim(upper(@Snombre))),
				ltrim(rtrim(upper(@Papellido))),ltrim(rtrim(upper(@Sapellido))),
				@telefono,@direccion,GETDATE(),(@Pnombre+'default'),'123','BAJA','E')
				set @salida='EL EMPLEADO HA SIDO REGISTRADO'
		end
	else
		begin
			set @salida='EL EMPLEADO YA SE ENCUENTRA EN LA BASE DE DATOS'
		end
		
	end
	------------------------------------------------------------------------------



	select * from Empleado
	sp_help Empleado

	SELECT Cedula AS CEDULA, [Primer Nombre] AS [PRIMER NOMBRE], [Segundo Nombre] AS [SEGUNDO NOMBRE],
	[Primer Apellido] AS [PRIMER APELLIDO], [Segundo Apellido] AS [SEGUNDO APELLIDO], Telefono AS TELEFONO, 
	Direccion AS DIRECCION, [Fecha Contratacion] AS [FECHA CONTRATACION] from Empleado
	


	exec SP_Insertar_Empleado 'jose','ramon','perez','pichardo','87213410','Villa Libertad de la chelita 4 cuadras al norte','12/02/2021'
	exec SP_Insertar_Empleado 'Adrian','jose','medina','jerez','89021234','Sabana grande, urbanizacion rios de agua viva casa no.234','04/04/2021'

	exec SP_Insertar_Empleado '001-120998-0012S','CARMEN','ELVIRA','PINEDA','ARVIZU','85749632','TIPITAPA','15/04/2021'


	SELECT * FROM Registro_Insercion


	