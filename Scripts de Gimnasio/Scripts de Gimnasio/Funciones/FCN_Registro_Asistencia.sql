CREATE FUNCTION FCN_Registro_Asistencia
(	

)
RETURNS TABLE 
AS
RETURN 
(
	SELECT       ra.ID_Registro, ra.Fecha, ra.Hora, c.Cedula, c.[Primer Nombre] + ' ' + c.[Primer Apellido] AS Nombre
FROM            dbo.Registo_Asistencia AS ra INNER JOIN
                         dbo.Cliente AS c ON c.Cedula = ra.ID_Cliente 
)
GO
