
ALTER proc SP_Insertar_Empleado
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
	set nocount on
		insert into Empleado ([Primer Nombre],[Segundo Nombre],[Primer Apellido],[Segundo Apellido],Telefono,Direccion,[Fecha Contratacion],ID_Estado_Empleado)
			values (ltrim(rtrim(upper(@Pnombre))),ltrim(rtrim(upper(@Snombre))),ltrim(rtrim(upper(@Papellido))),ltrim(rtrim(upper(@Sapellido))),@telefono,@direccion,@fecha_Contratacion,@Estado_Empleado)

	end
	------------------------------------------------------------------------------



	select * from Empleado
	sp_help Empleado



	exec SP_Insertar_Empleado 'jose','ramon','perez','pichardo','87213410','Villa Libertad de la chelita 4 cuadras al norte','12/02/2021'
	exec SP_Insertar_Empleado 'Adrian','jose','medina','jerez','89021234','Sabana grande, urbanizacion rios de agua viva casa no.234','04/04/2021'


	