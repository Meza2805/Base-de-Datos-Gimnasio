select * from Empleado
sp_help Empleado


Create proc SP_Insertar_Empleado
	@Pnombre nvarchar(50),
	@Snombre nvarchar(50),
	@Papellido nvarchar(50),
	@Sapellido nvarchar(50),
	@telefono varchar(8),
	@direccion nvarchar(200),
	@fecha_Contratacion date,
	@Estado_Empleado char(1)= 'A'
	as
	begin
		insert into Empleado ([Primer Nombre],[Segundo Nombre],[Primer Apellido],[Segundo Apellido],Telefono,Direccion,[Fecha Contratacion],ID_Empleado)
			values (@Pnombre,@Snombre,@Papellido,@Sapellido,@telefono,@direccion,@fecha_Contratacion,@Estado_Empleado)
	end

	select * from Estado_Cliente
	UPDATE Estado_Cliente set Observacion=''

	sp_help Estado_CLiente 'CLIENTE BANEADO'