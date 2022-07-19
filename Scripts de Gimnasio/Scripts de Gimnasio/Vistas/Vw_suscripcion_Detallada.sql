create view Vw_suscripcion_Detallada
as
select ID_SUBS,m.Descripcion as MEMBRESIA, (Select CONVERT(varchar,[Fecha Contratacion],103)) as [FECHA CONTRATACION], Fecha_Expiracion,ID_Cliente, (c.[Primer Nombre]+' '+c.[Primer Apellido]) as CLIENTE,
ID_Empleado,(e.[Primer Nombre]+' '+e.[Primer Apellido]) as EMPLEADO_ATIENDE , Finalizada from  suscripcion s
inner join  Cliente c on s.ID_Cliente = c.Cedula
inner join Empleado e on s.ID_Empleado = e.Cedula
inner join Membresia m on s.ID_Membresia = m.ID_Membresia order by [Fecha Contratacion] desc