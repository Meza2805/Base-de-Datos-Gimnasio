ALTER TRIGGER TG_Actualizacion_Productos 
   ON  Producto
   AFTER update
AS 
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Registro(ID_TABLA)
    SELECT (SELECT CONVERT(varchar(10),ID_Producto)) FROM INSERTED
	update Registro set TABLA = 'PRODUCTO' ,FECHA = GETDATE(), ACCION = 'ACTUALIZACION' where ID_REGISTRO = @@IDENTITY
END


