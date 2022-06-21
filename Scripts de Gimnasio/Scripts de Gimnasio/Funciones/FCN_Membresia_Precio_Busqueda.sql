CREATE FUNCTION FCN_Membresia_Precio_Busqueda 
(
	@precio decimal(10,2)
)
RETURNS varchar(100)
AS
BEGIN
	declare @mensaje varchar(100) 
	if exists( select Descripcion from Membresia where Precio = @precio )
		begin
			set @mensaje = 'LA MEMBRESIA DE ESE PRECIO CORRESPONE A '  + (select Descripcion from Membresia where Precio = @precio)
		end
	else
		begin
			set @mensaje = 'EL PRECIO INTRODUCIDO NO PERTENECE A NINGUNA MEMBRESIA' 
		end
	return @mensaje
END
GO
