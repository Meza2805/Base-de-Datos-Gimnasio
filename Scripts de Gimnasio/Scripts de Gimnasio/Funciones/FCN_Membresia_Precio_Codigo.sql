CREATE FUNCTION FCN_Membresia_Precio_Codigo
(
	@codigo char(1)
)
RETURNS varchar(100)
AS
BEGIN
	declare @mensaje varchar(100) 
	if exists( select ID_Membresia from Membresia where ID_Membresia = @codigo )
		begin
			set @mensaje = 'LA MEMBRESIA DE ESE PRECIO CORRESPONE A '  + (select Descripcion from Membresia where ID_Membresia = @codigo)
		end
	else
		begin
			set @mensaje = 'EL ID INTRODUCIDO NO PERTENECE A NINGUNA MEMBRESIA' 
		end
	return @mensaje
END
GO