USE [Gimnasio]
GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 09/06/2022 21:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
ALTER proc [dbo].[SP_Login] 
@usser varchar(20),
@contra varchar(20),
@validacion int out,
@cedula char(16) out,
@nombre varchar(30) out,
@apellido varchar(30) out,
@privilegio char(1) out
as
begin
	
	if exists (select Usuario from Empleado where Usuario = @usser)
	begin
		if (@contra =(select Contraseña from Empleado where Usuario = @usser) )
			begin
				set @validacion = 3--Usuario y contraseña correctos!
				set @cedula = (select Cedula from Empleado where Usuario = @usser)
				set @nombre = (select [Primer Nombre] from Empleado where Usuario = @usser)
				set @apellido = (select [Primer Apellido] from Empleado where Usuario = @usser)
				set @privilegio = (select Privilegio from Empleado where Usuario = @usser)
			end
		else
		begin
			set @validacion = 2 --Usuario encontrado pero contraseña incorrecta
			set @privilegio = 'E'
		end
	end
	else
	begin
		set @validacion = 0 --Usuario no enocntrado
		set @privilegio = 'N'
	end
	select @validacion,@cedula,@nombre,@apellido,@privilegio
end
SP_Login 'meza93','123',0,'','','',''
select  * from Empleado