USE [Gimnasio]
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_Clientes]    Script Date: 16/05/2022 15:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[SP_Mostrar_Clientes]
as
begin
	select Cedula AS [NO. CEDULA] ,[Primer Nombre] AS [PRIMER NOMBRE],[Segundo Nombre] AS [SEGUNDO NOMBRE],
	[Primer Apellido] AS [PRIMER APELLIDO],[Segundo Apellido] AS [SEGUNDO APELLIDO],Sexo AS SEXO,(select convert(varchar,Fecha_Registro,103)) AS [FECHA DE REGISTRO],
	(select convert(varchar,Fecha_Nac,103)) AS [FECHA DE NACIMIENTO],
	EC.Descripcion AS [ESTADO]
	from Cliente C  inner join Estado_Cliente EC on C.ID_Estado = EC.ID_Estado order by Fecha_Registro asc
end


exec SP_Mostrar_Clientes

select convert(varchar,getdate(),103) 