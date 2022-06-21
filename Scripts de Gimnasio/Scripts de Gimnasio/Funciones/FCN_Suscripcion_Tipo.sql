CREATE FUNCTION FCN_Suscripcion_Tipo 
(	
	@Estado bit
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT       s.ID_SUBS, m.Descripcion AS MEMBRESIA, s.Fecha_Contratacion, s.Fecha_Expiracion, s.ID_Cliente, c.[Primer Nombre] + ' ' + c.[Primer Apellido] AS CLIENTE, s.ID_Empleado, 
                         e.[Primer Nombre] + ' ' + e.[Primer Apellido] AS EMPLEADO_ATIENDE, s.Finalizada
FROM            dbo.suscripcion AS s INNER JOIN
                         dbo.Cliente AS c ON s.ID_Cliente = c.Cedula INNER JOIN
                         dbo.Empleado AS e ON s.ID_Empleado = e.Cedula INNER JOIN
                         dbo.Membresia AS m ON s.ID_Membresia = m.ID_Membresia where s.Finalizada = @Estado
)
GO

select * from FCN_Suscripcion_Tipo(1)