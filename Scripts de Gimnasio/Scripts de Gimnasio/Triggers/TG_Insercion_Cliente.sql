ALTER TRIGGER TG_Insercion_Cliente 
   ON  Cliente
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Registro(ID_TABLA)
    SELECT Cedula FROM INSERTED

	update Registro set TABLA = 'CLIENTE' ,FECHA = GETDATE(), ACCION = 'INSERCION' where ID_REGISTRO = @@IDENTITY
END
GO

