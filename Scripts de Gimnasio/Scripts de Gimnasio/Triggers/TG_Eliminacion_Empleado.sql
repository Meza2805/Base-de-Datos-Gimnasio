CREATE TRIGGER TG_Eliminacion_Empleado 
   ON  Empleado
   AFTER delete
AS 
BEGIN
declare	@cedula varchar(16),
		@p_nombre varchar(25),
		@s_nombre varchar(25),
		@p_apellido varchar(25),
		@s_apellido varchar(25)

	SET NOCOUNT ON;

	select @cedula = del.Cedula from deleted del;
	select @p_nombre = del.[Primer Nombre] from deleted del;
	select @s_nombre = del.[Segundo Nombre] from deleted del;
	select @p_apellido = del.[Primer Apellido] from deleted del;
	select @s_apellido = del.[Segundo Apellido]from deleted del;

    INSERT INTO Registro_Borrados (TABLA,REGISTRO_BORRADO,FECHA)
	VALUES ('CLIENTE', (@cedula + ' '+@p_nombre+' '+@s_nombre +@p_apellido+' '+@s_apellido),GETDATE())
END
GO
