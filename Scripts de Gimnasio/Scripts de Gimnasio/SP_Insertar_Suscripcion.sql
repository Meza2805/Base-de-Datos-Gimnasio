
select * from Cliente
select * from Membresia
select * from suscripcion
select * from Empleado
select * from Estado_Cliente



--Buscando el cliente con fecha de registro mas antigua
select  top 1 [ID_Cliente], [Segundo Nombre],Fecha_Registro from Cliente order b
alter proc SP_Insertar_Suscripcion
@id_cliente int,
@id_empleado int,
@fecha_contratacion date,
@id_membresia char(1)
as
begin
	if not exists (select ID_Cliente from Cliente where ID_Estado = 'A' and ID_Cliente = @id_cliente)
		begin --Condicion para asiganar la fecha expiracion de membresia segun el ID de membresia
			if (@id_membresia = 'M') --Membresia de 30 dias
				begin
					insert into suscripcion (Fecha_Contratacion,Fecha_Expiracion,ID_Cliente,ID_Empleado,ID_Membresia)
						values (@fecha_contratacion,(select DATEADD (day,30,@fecha_contratacion)),@id_cliente,@id_empleado,@id_membresia)
				end
			if (@id_membresia = 'Q') --membresia de 15 dias
				begin
					insert into suscripcion (Fecha_Contratacion,Fecha_Expiracion,ID_Cliente,ID_Empleado,ID_Membresia)
						values (@fecha_contratacion,(select DATEADD (day,15,@fecha_contratacion)),@id_cliente,@id_empleado,@id_membresia)
				end
			if (@id_membresia = 'S') --membresia de 7 dias
				begin
					insert into suscripcion (Fecha_Contratacion,Fecha_Expiracion,ID_Cliente,ID_Empleado,ID_Membresia)
						values (@fecha_contratacion,(select DATEADD (day,7,@fecha_contratacion)),@id_cliente,@id_empleado,@id_membresia)
				end
			--La siguiente linea actuliza el valor del estado de usuario en la tabla cliente
			update Cliente
				set ID_Estado = 'A' where ID_Cliente = @id_cliente
				print 'SE HA INGRESADO LA MEMBRESIA'
		end
	else
		begin
		print 'ESTE CLIENTE YA TIENE UNA MEMBRESIA ACTIVA'
		end
endy ID_Cliente

select * from Cliente order by Fecha_Registro asc


--select * from Estado_Cliente
select * from Cliente
select * from suscripcion
/*
declare @fecha_contratacion date
declare @fecha_expiracion date

set @fecha_contratacion = '14/01/2021'
set @fecha_expiracion = (select DATEADD (day,30,@fecha_contratacion))

print @fecha_expiracion 
print @fecha_contratacion

@id_cliente int,
@id_empleado int,
@fecha_contratacion date,
@id_membresia char(1),
@fecha_expiracion date
*/

select * from Cliente
select * from Membresia
select * from suscripcion
select * from Empleado

exec SP_Insertar_Suscripcion 12,1,'14/01/2021','M' 
