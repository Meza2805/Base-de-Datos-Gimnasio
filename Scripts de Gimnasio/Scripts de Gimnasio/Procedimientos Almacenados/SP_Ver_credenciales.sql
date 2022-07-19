create proc SP_Ver_credenciales
@usser varchar(25) out,
@pass varchar(25) out
as
begin
set @usser =(select Usuario from Empleado where Privilegio = 'A')
set @pass =(select Contraseña from Empleado where Privilegio = 'A')
select @usser,@pass
end