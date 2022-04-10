select *  from suscripcion
select * from cliente where ID_Cliente  = 2
select * from Empleado 
select * from Registo_Asistencia



----Procedimiento almacenado para registrar suscrpcion------
alter proc SP_Insertar_Suscripcion
@id_cliente int,
@id_empleado int,
--@fecha_contratacion date,
@id_membresia char(1)
as
begin
set nocount on
	if not exists (select ID_Cliente from Cliente where ID_Estado = 'A' and ID_Cliente = @id_cliente)
		begin --Condicion para asiganar la fecha expiracion de membresia segun el ID de membresia
			if (@id_membresia = 'M') --Membresia de 30 dias
				begin
					insert into suscripcion (Fecha_Contratacion,Fecha_Expiracion,ID_Cliente,ID_Empleado,ID_Membresia)
						values (getdate(),(select DATEADD(day,30,getdate())),@id_cliente,@id_empleado,@id_membresia)
				end
			if (@id_membresia = 'Q') --membresia de 15 dias
				begin
					insert into suscripcion (Fecha_Contratacion,Fecha_Expiracion,ID_Cliente,ID_Empleado,ID_Membresia)
						values (getdate(),(select DATEADD (day,15,getdate())),@id_cliente,@id_empleado,@id_membresia)
				end
			if (@id_membresia = 'S') --membresia de 7 dias
				begin
					insert into suscripcion (Fecha_Contratacion,Fecha_Expiracion,ID_Cliente,ID_Empleado,ID_Membresia)
						values (getdate(),(select DATEADD (day,7,getdate())),@id_cliente,@id_empleado,@id_membresia)
				end
			--La siguiente linea actuliza el valor del estado de usuario en la tabla cliente
			update Cliente
				set ID_Estado = 'A' where ID_Cliente = @id_cliente
				print 'SE HA INGRESADO LA MEMBRESIA'
			--La siguiente linea registra la primera asistencia del cliente el mismo dia que realiza la suscripcion
			insert into Registo_Asistencia (Fecha,Hora,ID_Cliente)
				values (GETDATE(),cast(datepart (hour, getdate()) as char(2))+ ' : ' +cast (datepart (mi,getdate()) as char(2)),@id_cliente)
		end
	else
		begin
		print 'ESTE CLIENTE YA TIENE UNA MEMBRESIA ACTIVA'
		end
end


--Insertando valores a la tabla Membresia

exec SP_Insertar_Suscripcion 2,1,'M'
exec SP_Insertar_Suscripcion 3,1,'S'
exec SP_Insertar_Suscripcion 7,1,'Q'
exec SP_Insertar_Suscripcion 12,1,'Q'
exec SP_Insertar_Suscripcion 11,1,'S'
exec SP_Insertar_Suscripcion 20,1,'S'
exec SP_Insertar_Suscripcion 9,1,'M'
exec SP_Insertar_Suscripcion 18,1,'S'
exec SP_Insertar_Suscripcion 13,1,'Q'
select * from Registo_Asistencia
select * from Cliente

--segunda sesion de inssercion de suscripcion de membresia
exec SP_Insertar_Suscripcion 26,1,'Q'
exec SP_Insertar_Suscripcion 23,1,'S'

exec SP_Insertar_Suscripcion 1,2,'S'
exec SP_Insertar_Suscripcion 4,2,'Q'
exec SP_Insertar_Suscripcion 7,2,'S'
exec SP_Insertar_Suscripcion 10,2,'Q'
exec SP_Insertar_Suscripcion 17,2,'Q'


select * from Cliente
-- sesion de inssercion de suscripcion de membresia 09/04/2022
exec SP_Insertar_Suscripcion 27,1,'S'
exec SP_Insertar_Suscripcion 28,1,'S'
exec SP_Insertar_Suscripcion 29,2,'S'
exec SP_Insertar_Suscripcion 30,1,'S'