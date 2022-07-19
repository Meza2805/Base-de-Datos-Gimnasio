create proc SP_Cargar_Clientes_ALL
@Nombre varchar(35)
as 
begin
	select Cedula as CEDULA, [Primer Nombre] AS [PRIMER NOMBRE], [Segundo Nombre] AS [SEGUNDO NOMBRE],[Primer Apellido]as [PRIMER APELLIDO],
	 [Segundo Apellido] AS [SEGUNDO APELLIDO] from Cliente where [Primer Nombre] like @Nombre+'%' and Cedula!='000-000000-00000'
end

select * from Cliente