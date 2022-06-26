CREATE TRIGGER TG_Eliminacion_Suscripcion 
   ON  suscripcion
   AFTER delete
AS 
BEGIN
declare	@suscripcion int

	SET NOCOUNT ON;

	select @suscripcion = del.ID_SUBS from deleted del;
	
    INSERT INTO Registro_Borrados (TABLA,REGISTRO_BORRADO,FECHA)
	VALUES ('PRODUCTO', (select convert (varchar(30),@suscripcion)) ,GETDATE())
END

