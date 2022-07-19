create proc SP_Mostrar_Asistencia_Diaria
as
begin

SELECT r.ID_Cliente  AS [CEDULA CLIENTE],(c.[Primer Nombre]+' '+c.[Primer Apellido]) as [NOMBRE CLIENTE], R.Hora AS HORA, M.Descripcion AS MEMBRESIA 
, (Select CONVERT(varchar,s.Fecha_Expiracion,103)) as [FECHA VENCIMIENTO] FROM 
Registo_Asistencia r inner join  Cliente c on c.Cedula = r.ID_Cliente
inner join suscripcion s on c.Cedula = s.ID_Cliente 
inner join Membresia m on s.ID_Membresia = m.ID_Membresia where s.Finalizada = 0 and  
(Select CONVERT(varchar,(r.Fecha),103)) =(Select CONVERT(varchar,GETDATE(),103))
order by r.Fecha desc 

end 


SELECT * from Registo_Asistencia order by Fecha desc
select * from suscripcion

select * from suscripcion order by Fecha_Contratacion desc