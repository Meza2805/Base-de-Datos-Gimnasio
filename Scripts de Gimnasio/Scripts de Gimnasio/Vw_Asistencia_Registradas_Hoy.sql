CREATE View Vw_Asistencias_Registradas_Hoy
as
SELECT ID_Cliente AS CEDULA, C.[Primer Nombre] AS NOMBRE,[Primer Apellido]AS 
APELLIDO,Hora as HORA FROM Registo_Asistencia RA inner join Cliente C
ON RA.ID_Cliente = C.Cedula 
WHERE Fecha =  ( cast (datepart(year,getdate())as varchar(4))+'-' +cast (datepart(month,getdate())as varchar(2)) +
																	'-' +cast (datepart(day,getdate())as varchar(2))) 