create view Vw_suscripcion_Vencida
as
select ID_SUBS,m.Descripcion as MEMBRESIA, Fecha_Contratacion, Fecha_Expiracion,ID_Cliente, (c.[Primer Nombre]+' '+c.[Primer Apellido]) as CLIENTE,
ID_Empleado,(e.[Primer Nombre]+' '+e.[Primer Apellido]) as EMPLEADO_ATIENDE from  suscripcion s
inner join  Cliente c on s.ID_Cliente = c.Cedula
inner join Empleado e on s.ID_Empleado = e.Cedula
inner join Membresia m on s.ID_Membresia = m.ID_Membresia where Finalizada = 1