CREATE View Vw__Registro_Asistencia_Hoy
as

select c.Cedula as [CEDULA CLIENTE], (c.[Primer Nombre] +' '+ c.[Primer Apellido]) AS CLIENTE, ra.Hora,ra.Fecha, 
m.Descripcion from Cliente c inner join Registo_Asistencia ra on c.Cedula = ra.ID_Cliente 
	inner join suscripcion s on s.ID_Cliente = c.Cedula
	inner join Membresia m on s.ID_Membresia = m.ID_Membresia WHERE 
	( Select CONVERT(varchar,Fecha,103))= ( Select CONVERT(varchar,GETDATE(),103)) and s.Finalizada=0 order by ra.Fecha 




	select * from Registo_Asistencia ra 
	inner join Cliente c on c.Cedula = ra.ID_Cliente  
		inner join suscripcion s on s.ID_Cliente = c.Cedula
	WHERE 

	( Select CONVERT(varchar,Fecha,103))= ( Select CONVERT(varchar,GETDATE(),103)) and s.Finalizada = 0 order by Fecha 













