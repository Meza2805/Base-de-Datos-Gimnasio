alter view Lista_Cliente
as
	select Cedula AS [NO. CEDULA] ,[Primer Nombre] AS [PRIMER NOMBRE],[Segundo Nombre] AS [SEGUNDO NOMBRE],
	[Primer Apellido] AS [PRIMER APELLIDO],[Segundo Apellido] AS [SEGUNDO APELLIDO],Sexo AS SEXO,(select convert(varchar,Fecha_Registro,101)) AS [FECHA DE REGISTRO],
	(select convert(varchar,Fecha_Nac,101)) AS [FECHA DE NACIMIENTO],
	EC.Descripcion AS [ESTADO]
	from Cliente C  inner join Estado_Cliente EC on C.ID_Estado = EC.ID_Estado 


	select * from Lista_Cliente
