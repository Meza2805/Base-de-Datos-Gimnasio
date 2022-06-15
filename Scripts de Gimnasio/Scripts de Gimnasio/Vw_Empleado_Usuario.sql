create view Vw_Empleado_Usuario
as
select ([Primer Nombre]+ ' '+ [Primer Apellido])as Nombre_Empleado, Usuario, Contraseña from Empleado