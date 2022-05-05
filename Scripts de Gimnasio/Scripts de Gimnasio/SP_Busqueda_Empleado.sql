select * from Empleado

alter proc SP_Busqueda_Empleado
@ID_Empleado int
as
begin
	if not exists (select ID_Empleado from Empleado with (nolock) where ID_Empleado = @ID_Empleado)
	begin
		print 'EL EMPELADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
	begin
		select E.ID_Empleado as [Codigo Empleado],E.[Primer Nombre] as [PRIMER NOMBRE],E.[Segundo Nombre] AS [SEGUNDO NOMBRE],
		E.[Primer Apellido] AS [PRIMER APELLIDO],E.[Segundo Apellido] AS [SEGUNDO APELLIDO],E.Telefono AS [TELEFONO],Direccion AS [DIRECCION],
		E.[Fecha Contratacion] AS [FECHA DE CONTRATACION], EE.Descripcion AS [ESTADO DE EMPLEADO] 
		from Empleado E with (nolock)
		inner join Estado_Empleado EE on E.ID_Estado_Empleado = EE.ID_ESTADO_EMP
		where ID_Empleado = @ID_Empleado
	end
end
 
 exec SP_Busqueda_Empleado 2

 select * from Empleado
  select * from Estado_Empleado
