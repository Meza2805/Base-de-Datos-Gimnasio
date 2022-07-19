CREATE PROC SP_Registro_Membresias
as begin
select C.Cedula AS CEDULA,c.[Primer Nombre] AS NOMBRE ,c.[Primer Apellido] AS APELLIDO,m.Descripcion as [MEMBRESIA CONTRADA], 
 (Select CONVERT(varchar,Fecha_Contratacion,103)) as   [FECHA CONTRATACION] ,
(Select CONVERT(varchar,Fecha_Expiracion,103)) AS [FECHA EXPIRACION] from  suscripcion s
inner join  Cliente c on s.ID_Cliente = c.Cedula
inner join Membresia m on s.ID_Membresia = m.ID_Membresia where Finalizada = 0 order by Fecha_Contratacion desc
end

---Select CONVERT(varchar,@Existingdate,103)

SELECT * FROM Cliente ORDER BY Fecha_Registro DESC




SELECT Fecha_Contratacion, Fecha_Expiracion, ID_Cliente,[Primer Nombre] FROM suscripcion
INNER JOIN Cliente ON suscripcioN.ID_Cliente = Cliente.Cedula ORDER BY Fecha_Contratacion DESC

select * from Cliente order by Fecha_Registro  desc

EXEC SP_Insertar_Cliente '442-010520-0001Q','camilo','esau','castro','flores','m','01/05/2000',0

exec SP_Insertar_Suscripcion '369-010520-0001Q','448-200590-0074X','M',0,''