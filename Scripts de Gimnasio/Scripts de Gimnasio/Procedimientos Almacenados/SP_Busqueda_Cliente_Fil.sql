create proc SP_Busqueda_Cliente_Fil
@nombre varchar(35)
as
begin
	select Cedula AS [NO. CEDULA] ,[Primer Nombre] AS [PRIMER NOMBRE],[Segundo Nombre] AS [SEGUNDO NOMBRE],
	[Primer Apellido] AS [PRIMER APELLIDO],[Segundo Apellido] AS [SEGUNDO APELLIDO],Sexo AS SEXO,(select convert(varchar,Fecha_Registro,103)) AS [FECHA DE REGISTRO],
	(select convert(varchar,Fecha_Nac,103)) AS [FECHA DE NACIMIENTO],
	EC.Descripcion AS [ESTADO]
	from Cliente C  inner join Estado_Cliente EC on C.ID_Estado = EC.ID_Estado where c.Cedula != '000-000000-00000' and [Primer Nombre] like @Nombre+'%' order by [Primer Nombre] asc
end
