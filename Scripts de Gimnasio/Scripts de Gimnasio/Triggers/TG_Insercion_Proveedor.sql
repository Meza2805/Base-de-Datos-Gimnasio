ALTER TRIGGER TG_Actualizacion_Proveedor
   ON  Proveedor
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
    INSERT INTO Registro(ID_TABLA)
    SELECT (SELECT CONVERT(varchar(10),ID_Proveedor)) FROM INSERTED
	update Registro set TABLA = 'PROVEEDOR' ,FECHA = GETDATE() , ACCION = 'ACTUALIZACION' where ID_REGISTRO = @@IDENTITY
END

select * from Registro