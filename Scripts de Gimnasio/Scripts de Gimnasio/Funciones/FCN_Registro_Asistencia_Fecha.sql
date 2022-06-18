CREATE FUNCTION fCN_Registro_Asistencia_Fecha
(
	@Fecha date,
	@Cedula char(18)
)
RETURNS varchar(100)
AS
BEGIN
	declare @mensaje varchar(100)
	if exists (SELECT       ra.ID_Registro, ra.Fecha, ra.Hora, c.Cedula, c.[Primer Nombre] + ' ' + c.[Primer Apellido] AS Nombre
FROM            dbo.Registo_Asistencia AS ra INNER JOIN
                         dbo.Cliente AS c ON c.Cedula = ra.ID_Cliente where Fecha = @Fecha and Cedula = @Cedula)
		begin
			set @mensaje ='EL CLIENTE TIENE REGISTRO DE ESE DIA A LAS ' + (SELECT Hora FROM Registo_Asistencia WHERE Fecha =@Fecha AND ID_Cliente = @Cedula)
		end
	ELSE
		BEGIN
			set @mensaje ='EL CLIENTE NO TIENE REGISTRO '
		END
	return @mensaje
END
GO

select dbo.fCN_Registro_Asistencia_Fecha ('2022-04-07','001-160680-7494Q')