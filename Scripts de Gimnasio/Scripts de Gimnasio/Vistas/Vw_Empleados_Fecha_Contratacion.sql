
create view Vw_Empleados_Fecha_Contratacion
as
select Cedula,[Primer Nombre],[Segundo Nombre],[Primer Apellido],[Segundo Apellido], 
(Select CONVERT(varchar,[Fecha Contratacion],103)) as Fecha_contratacion  from Empleado