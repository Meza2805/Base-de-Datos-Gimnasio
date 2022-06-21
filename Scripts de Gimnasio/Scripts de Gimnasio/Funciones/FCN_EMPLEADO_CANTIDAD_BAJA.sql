
ALTER FUNCTION FCN_EMPLEADO_CANTIDAD_BAJA
(
	
)
RETURNS varchar(100)
AS
BEGIN
	declare @cantidad int
	declare @mensaje varchar(100)
	SET @cantidad =  (select COUNT(*) from Empleado where  ID_Estado_Empleado = 'B')
	set @mensaje = 'EXISTE UN TOTAL DE: ' +(SELECT CONVERT (VARCHAR(5),@cantidad))+ ' EMPLEADOS DE BAJA'
	RETURN @mensaje
END

select * from Empleado

select dbo.FCN_EMPLEADO_CANTIDAD_BAJA()