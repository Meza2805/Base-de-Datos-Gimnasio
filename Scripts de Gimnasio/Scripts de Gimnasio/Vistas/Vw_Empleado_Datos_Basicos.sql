create view Vw_Empleado_Datos_Basicos
as
select Cedula, [Primer Nombre], [Segundo Nombre], [Primer Apellido], [Segundo Apellido],
Telefono,Direccion,[Fecha Contratacion] from Empleado
