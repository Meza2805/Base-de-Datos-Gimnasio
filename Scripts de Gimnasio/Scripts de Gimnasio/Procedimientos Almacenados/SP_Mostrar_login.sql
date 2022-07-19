CREATE proc SP_Mostrar_login
@cedula char(16),
@usser varchar(25) out,
@contra varchar(25) out
as
begin


set @usser = (SELECT Usuario  FROM Empleado 
              WHERE Cedula = @cedula)

set @contra =(select Contraseña FROM Empleado 
			WHERE  Cedula = @cedula)


SELECT @usser, @contra

end

select * from Empleado