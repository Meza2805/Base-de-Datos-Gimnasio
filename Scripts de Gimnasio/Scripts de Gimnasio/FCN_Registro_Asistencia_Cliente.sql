
CREATE FUNCTION FCN_Registro_Asistencia_Cliente
(	
	@cedula char(18)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT       ra.ID_Registro, ra.Fecha, ra.Hora, c.Cedula, c.[Primer Nombre] + ' ' + c.[Primer Apellido] AS Nombre
FROM            dbo.Registo_Asistencia AS ra INNER JOIN
                         dbo.Cliente AS c ON c.Cedula = ra.ID_Cliente where Cedula = @cedula
)
GO

