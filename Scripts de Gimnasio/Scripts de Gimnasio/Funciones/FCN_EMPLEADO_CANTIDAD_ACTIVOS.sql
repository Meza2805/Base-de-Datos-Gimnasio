
alter FUNCTION FCN_EMPLEADO_CANTIDAD_ACTIVOS
(
	
)
RETURNS varchar(100)
AS
BEGIN
	declare @cantidad int
	declare @mensaje varchar(100)
	SET @cantidad =  (select COUNT(*) from Empleado where  ID_Estado_Empleado = 'A')
	set @mensaje = 'EXISTE UN TOTAL DE: ' +(SELECT CONVERT (VARCHAR(5),@cantidad))+ ' EMPLEADOS ACTIVOS'
	RETURN @mensaje
END


select dbo.FCN_EMPLEADO_CANTIDAD_ACTIVOS()

