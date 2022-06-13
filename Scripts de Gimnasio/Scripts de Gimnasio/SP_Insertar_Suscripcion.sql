
----Procedimiento almacenado para registrar suscrpcion------
alter proc SP_Insertar_Suscripcion
@id_cliente char(16),
@id_empleado char(16),
@id_membresia char(1),
@salida int out,
@fecha_convertida varchar(10) out
as
begin
	declare @bandera int
	declare @finalizada bit
	declare @fecha date
	--declare @fecha_expiracion date
	set @bandera =  0
		--La siguiente condicion verifica si existe el cliente tiene o no una membresia activa
	if not exists (select Cedula from Cliente where ID_Estado = 'A' and Cedula = @id_cliente)
		begin --Condicion para asiganar la fecha expiracion de membresia segun el ID de membresia
			set @finalizada = 0
			if (@id_membresia = 'D') --Derecho a Ejercicio por 1 dia
				begin
					insert into suscripcion (Fecha_Contratacion,Fecha_Expiracion,ID_Cliente,ID_Empleado,ID_Membresia,Finalizada)
						values (getdate(),GETDATE(),@id_cliente,@id_empleado,@id_membresia,1)
				end
			if (@id_membresia = 'M') --Membresia de 30 dias
				begin
					insert into suscripcion (Fecha_Contratacion,Fecha_Expiracion,ID_Cliente,ID_Empleado,ID_Membresia,Finalizada)
						values (getdate(),(select DATEADD(day,30,getdate())),@id_cliente,@id_empleado,@id_membresia,@finalizada)
						set @bandera =1
				end
			if (@id_membresia = 'Q') --membresia de 15 dias
				begin
					insert into suscripcion (Fecha_Contratacion,Fecha_Expiracion,ID_Cliente,ID_Empleado,ID_Membresia,Finalizada)
						values (getdate(),(select DATEADD (day,15,getdate())),@id_cliente,@id_empleado,@id_membresia,@finalizada)
						set @bandera =1
				end
			if (@id_membresia = 'S') --membresia de 7 dias
				begin
					insert into suscripcion (Fecha_Contratacion,Fecha_Expiracion,ID_Cliente,ID_Empleado,ID_Membresia,Finalizada)
						values (getdate(),(select DATEADD (day,7,getdate())),@id_cliente,@id_empleado,@id_membresia,@finalizada)
						set @bandera =1
				end
			if @bandera = 1
			--La siguiente linea actuliza el valor del estado de usuario en la tabla cliente
			begin
				update Cliente
					set ID_Estado = 'A' where Cedula = @id_cliente
					--print 'SE HA INGRESADO LA MEMBRESIA'
			end
			--La siguiente linea registra la primera asistencia del cliente el mismo dia que realiza la suscripcion
			insert into Registo_Asistencia (Fecha,Hora,ID_Cliente)
				values (GETDATE(),(cast(datepart (hour, getdate()) as nvarchar(2))+ ' : ' +cast (datepart (mi,getdate()) as nvarchar(2))),@id_cliente)
				set @salida=0
				set @fecha = (select Fecha_Expiracion from suscripcion where ID_Cliente = @id_cliente and Finalizada = 0)
		end
		else
			begin
				--print 'ESTE CLIENTE YA TIENE UNA MEMBRESIA ACTIVA'
				set @salida=1
				set @fecha = GETDATE();
			end
	set @fecha_convertida= (Select CONVERT(varchar,@fecha,103) as [DD/MM/YYYY])
	select @salida,@fecha_convertida
end
---------------------------------------------------------------------
select *  from suscripcion
select * from cliente where ID_Cliente  = 2
select * from Empleado 
select * from Registo_Asistencia


   SELECT ID_Cliente AS [CEDULA CLINETE],C.[Primer Nombre] AS NOMBRE,C.[Primer Apellido] AS 
   APELLIDO,Fecha_Contratacion AS [FECHA DE CONTRATACION], Fecha_Expiracion AS [FECHA DE EXPIRACION],M.Descripcion AS
   [TIPO DE MEMBRESIA] FROM suscripcion S INNER JOIN Cliente C
   ON S.ID_Cliente = C.Cedula INNER JOIN Membresia M ON S.ID_Membresia = M.ID_Membresia WHERE S.Finalizada=0


exec SP_Insertar_Suscripcion '445-270997-0105N','448-200590-0074X','M',0,''

select GETDATE()
Select CONVERT(varchar,GETDATE(),101) as [DD/MM/YYYY]

/*
	@id_cliente char(16),
@id_empleado char(16),
--@fecha_contratacion date,
@id_membresia char(1),
@salida int out,
@fecha date out
*/


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

select * from suscripcion

-- sesion de inssercion de suscripcion de membresia 09/04/2022
exec SP_Insertar_Suscripcion 31,2,'S'
exec SP_Insertar_Suscripcion 32,2,'S'
exec SP_Insertar_Suscripcion 33,2,'Q'
exec SP_Insertar_Suscripcion 34,2,'D'

-- sesion de inssercion de suscripcion de membresia 18/04/2022
exec SP_Insertar_Suscripcion 1,1,'Q'
exec SP_Insertar_Suscripcion 3,1,'M'
exec SP_Insertar_Suscripcion 5,1,'Q'
exec SP_Insertar_Suscripcion 6,1,'M'
exec SP_Insertar_Suscripcion 8,1,'Q'
exec SP_Insertar_Suscripcion 11,1,'Q'
exec SP_Insertar_Suscripcion 14,1,'M'
exec SP_Insertar_Suscripcion 15,1,'Q'
exec SP_Insertar_Suscripcion 16,1,'M'
exec SP_Insertar_Suscripcion 18,1,'Q'
exec SP_Insertar_Suscripcion 19,1,'M'




-- sesion de inssercion de suscripcion de membresia 25/04/2022
exec SP_Insertar_Suscripcion 4,1,'M'
exec SP_Insertar_Suscripcion 7,1,'M'
exec SP_Insertar_Suscripcion 10,1,'M'
exec SP_Insertar_Suscripcion 12,1,'M'
exec SP_Insertar_Suscripcion 13,1,'M'
exec SP_Insertar_Suscripcion 17,1,'M'
exec SP_Insertar_Suscripcion 20,1,'M'
exec SP_Insertar_Suscripcion 22,1,'M'
exec SP_Insertar_Suscripcion 23,2,'Q'
exec SP_Insertar_Suscripcion 24,2,'Q'
exec SP_Insertar_Suscripcion 25,2,'Q'
exec SP_Insertar_Suscripcion 26,2,'Q'
exec SP_Insertar_Suscripcion 27,2,'Q'
exec SP_Insertar_Suscripcion 28,2,'Q'
exec SP_Insertar_Suscripcion 29,2,'Q'
exec SP_Insertar_Suscripcion 29,2,'Q'
exec SP_Insertar_Suscripcion 31,2,'Q'
exec SP_Insertar_Suscripcion 32,2,'Q'
exec SP_Insertar_Suscripcion 34,2,'Q'
exec SP_Insertar_Suscripcion 30,2,'Q'
exec SP_Insertar_Suscripcion 33,1,'Q'

select * from Cliente where ID_Estado = 'I'
select count(cedula) from Cliente where ID_Estado = 'I'
select * from suscripcion order by Fecha_Contratacion
select * from Empleado
select * from Registo_Asistencia

exec SP_Insertar_Suscripcion '001-070997-0031X','001-150497-0074S','Q'
exec SP_Insertar_Suscripcion '001-160599-4777L','001-150497-0074S','Q'
exec SP_Insertar_Suscripcion '001-160601-4701F','001-150497-0074S','Q'
exec SP_Insertar_Suscripcion '001-160602-0101K','001-150497-0074S','M'
exec SP_Insertar_Suscripcion '001-160605-01019','001-150497-0074S','M'
exec SP_Insertar_Suscripcion '001-160680-7494Q','001-150497-0074S','M'
exec SP_Insertar_Suscripcion '001-160685-0012Q','001-150497-0074S','M'
exec SP_Insertar_Suscripcion '001-160688-5881A','001-150497-0074S','M'
exec SP_Insertar_Suscripcion '001-160689-0220S','001-150497-0074S','M'
exec SP_Insertar_Suscripcion '001-160698-1000Q','001-150497-0074S','M'
exec SP_Insertar_Suscripcion '001-161098-0405L','001-150497-0074S','Q'
exec SP_Insertar_Suscripcion '001-171290-0110V','001-150497-0074S','S'
exec SP_Insertar_Suscripcion '001-250504-7485Q','001-150497-0074S','S'

exec SP_Insertar_Suscripcion '001-270892-4584V','001-180491-8974S','S'
exec SP_Insertar_Suscripcion '001-270893-0110J','001-180491-8974S','S'
exec SP_Insertar_Suscripcion '448-100490-0012X','001-180491-8974S','S'
exec SP_Insertar_Suscripcion '448-160686-0007W','001-180491-8974S','Q'
exec SP_Insertar_Suscripcion '448-160697-0174J','001-180491-8974S','Q'




select * from Cliente where ID_Estado = 'I'
select count(cedula) from Cliente where ID_Estado = 'I'
select * from suscripcion order by Fecha_Contratacion
select * from Empleado
select * from Registo_Asistencia

exec SP_Insertar_Suscripcion '001-160499-0101V','001-180491-8974S','Q'

exec SP_Insertar_Suscripcion '001-160685-7415Q','001-180491-8974S','M'
exec SP_Insertar_Suscripcion '001-190699-0101O','001-180491-8974S','M'
exec SP_Insertar_Suscripcion '449-160603-0104L','001-180491-8974S','M'
exec SP_Insertar_Suscripcion '449-270997-0105N','001-180491-8974S','Q'
exec SP_Insertar_Suscripcion '449-160693-2301N','001-180491-8974S','Q'

SELECT * from Vw_Clientes_Activos