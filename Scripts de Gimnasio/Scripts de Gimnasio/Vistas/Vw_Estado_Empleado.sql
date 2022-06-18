create view Vw_Estado_Empleado
as
SELECT Cedula,[Primer Nombre], [Segundo Nombre],[Primer Apellido],
[Segundo Apellido], EE.Descripcion AS ESTADO from Empleado E inner join Estado_Empleado EE
ON E.ID_Estado_Empleado = EE.ID_ESTADO_EMP