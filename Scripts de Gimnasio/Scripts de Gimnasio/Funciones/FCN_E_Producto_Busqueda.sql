CREATE FUNCTION FCN_E_Producto_Busqueda
(
	@Nombre varchar(30)
)
RETURNS varchar(50)
AS
BEGIN
	declare @salida varchar(50)
	set @salida=( select Nombre from Producto where Nombre like @Nombre+'%')
	return @salida
END
GO

