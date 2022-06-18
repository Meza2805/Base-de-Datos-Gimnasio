select * from Empleado

alter proc SP_Busqueda_Empleado
@Cedula char(16)
as
begin
	if not exists (select top 1 Cedula from Empleado with (nolock) where Cedula = @Cedula)
	begin
		print 'EL EMPELADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
	begin
		select E.Cedula as [Codigo Empleado],E.[Primer Nombre] as [PRIMER NOMBRE],E.[Segundo Nombre] AS [SEGUNDO NOMBRE],
		E.[Primer Apellido] AS [PRIMER APELLIDO],E.[Segundo Apellido] AS [SEGUNDO APELLIDO],E.Telefono AS [TELEFONO],Direccion AS [DIRECCION],
		E.[Fecha Contratacion] AS [FECHA DE CONTRATACION], EE.Descripcion AS [ESTADO DE EMPLEADO] 
		from Empleado E with (nolock)
		inner join Estado_Empleado EE on E.ID_Estado_Empleado = EE.ID_ESTADO_EMP
		where Cedula = @Cedula
	end
end
 
 exec SP_Busqueda_Empleado '448-150493-0001V'

 select * from Empleado
  select * from Estado_Empleado
