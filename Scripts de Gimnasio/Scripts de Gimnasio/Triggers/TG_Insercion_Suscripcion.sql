ALTER TRIGGER TG_Insercion_Suscripcion
   ON  suscripcion
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Registro(ID_TABLA)
    SELECT (SELECT CONVERT(varchar(10),ID_SUBS)) FROM INSERTED
	update Registro set TABLA = 'SUSCRIPCION' ,FECHA = GETDATE(),ACCION = 'INSERCION' where ID_REGISTRO = @@IDENTITY
END


