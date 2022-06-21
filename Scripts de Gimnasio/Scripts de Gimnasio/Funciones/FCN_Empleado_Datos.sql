CREATE FUNCTION FCN_Empleado_Datos
(	
	@cedula char(16)
)

RETURNS TABLE 
AS

RETURN 
(
	select ([Primer Nombre] +' '+ [Primer Apellido])as EMPLEADO, Telefono,UPPER( Direccion) as DIRECCION from Empleado where Cedula = @cedula
)
GO
