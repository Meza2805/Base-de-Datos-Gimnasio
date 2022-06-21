CREATE FUNCTION FCN_Empleado_Login
(	
	@cedula char(16)
)

RETURNS TABLE 
AS

RETURN 
(
	select ([Primer Nombre] +' '+ [Primer Apellido])as EMPLEADO, Usuario,Contraseña from Empleado where Cedula = @cedula
)
GO
