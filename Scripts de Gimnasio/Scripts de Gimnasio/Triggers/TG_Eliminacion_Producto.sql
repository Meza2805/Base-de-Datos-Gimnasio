CREATE TRIGGER TG_Eliminacion_Producto 
   ON  Producto
   AFTER delete
AS 
BEGIN
declare	@p_nombre varchar(45)

	SET NOCOUNT ON;

	select @p_nombre = del.Nombre from deleted del;
	
    INSERT INTO Registro_Borrados (TABLA,REGISTRO_BORRADO,FECHA)
	VALUES ('PRODUCTO', @p_nombre,GETDATE())
END
GO

