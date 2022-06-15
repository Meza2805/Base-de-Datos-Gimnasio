create view Vw_Clientes_Edades
as
 SELECT Cedula, [Primer Nombre], [Segundo Nombre], [Primer Apellido], [Segundo Apellido] , 
	floor((cast(convert(varchar(8),getdate(),112) as int) - cast(convert(varchar(8),
	Cliente.Fecha_Nac,112) as int) ) / 10000) as EDAD
	from Cliente where Cedula != '000-000000-00000'