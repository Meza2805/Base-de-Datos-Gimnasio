--Consulta para obtener el historial de asistencia de un cliente
select Cliente.[Primer Nombre], Registo_Asistencia.Fecha, Registo_Asistencia.Hora from  Registo_Asistencia inner join Cliente
	on Registo_Asistencia.ID_Cliente = Cliente.ID_Cliente where Registo_Asistencia.ID_Cliente= 1