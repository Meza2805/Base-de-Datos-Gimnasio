create view Vw_Registro_Asistencia_Detallado_Todos_Clientes
as
select ra.ID_Registro, Fecha,Hora,c.Cedula, (c.[Primer Nombre]+ ' '+ c.[Primer Apellido])as Nombre 
from Registo_Asistencia ra inner join  Cliente c on c.Cedula = ra.ID_Cliente
