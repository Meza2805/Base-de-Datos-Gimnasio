ALTER proc SP_Mostrar_Empleados_T
as begin

	SELECT Cedula AS CEDULA, [Primer Nombre] AS [PRIMER NOMBRE], [Segundo Nombre] AS [SEGUNDO NOMBRE],
	[Primer Apellido] AS [PRIMER APELLIDO], [Segundo Apellido] AS [SEGUNDO APELLIDO], Telefono AS TELEFONO, 
	Direccion AS DIRECCION,   (Select CONVERT(varchar,[Fecha Contratacion],103))   AS [FECHA CONTRATACION] , Estado as ESTADO from Empleado
	WHERE privilegio = 'E' ORDER BY [Primer Nombre]
end

select * from Empleado

