alter proc SP_Mostrar_Asistencia_del_dia
as
begin
select c.Cedula as [CEDULA CLIENTE], (c.[Primer Nombre] +' '+ c.[Primer Apellido]) AS CLIENTE, (select convert(char(8), ra.Fecha, 108) as [hh:mm:ss]) as HORA,( Select CONVERT(varchar,ra.Fecha,103)) as FECHA, 
m.Descripcion from Cliente c inner join Registo_Asistencia ra on c.Cedula = ra.ID_Cliente 
	inner join suscripcion s on s.ID_Cliente = c.Cedula
	inner join Membresia m on s.ID_Membresia = m.ID_Membresia WHERE 
	( Select CONVERT(varchar,ra.Fecha,103))= ( Select CONVERT(varchar,GETDATE(),103)) and s.Finalizada=0 order by ra.Fecha 

end