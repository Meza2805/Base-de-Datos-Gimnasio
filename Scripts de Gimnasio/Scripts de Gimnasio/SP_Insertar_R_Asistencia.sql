select * from Registo_Asistencia

alter proc SP_Insertar_Registro_Asistencia
@ID_Cliente int
as
	begin
	declare @Fecha_Actual date
	set @Fecha_Actual = cast (datepart(year,getdate())as varchar(4))+
						'-' +cast (datepart(month,getdate())as varchar(2)) +
						'-' +cast (datepart(day,getdate())as varchar(2))
	set nocount on
	if not exists (select top 1 ID_Cliente from Registo_Asistencia where ID_Cliente =  @ID_Cliente and Fecha = @Fecha_Actual)
		begin
		if @Fecha_Actual > (select Fecha_Expiracion from suscripcion where ID_Cliente = @ID_Cliente)
			begin
				update Cliente set ID_Estado ='I' where ID_Cliente =  @ID_Cliente  
				print 'MEMBRESIA EXPIRADA'
				print 'EL CLIENTE HA PASADO A ESTADO INACTIVO'
				print 'HASTA QUE CONTRATE UNA NUEVA MEMBRESIA'
			end
		else
		begin
			insert into Registo_Asistencia (Fecha,Hora,ID_Cliente)
			values (GETDATE(),(cast(datepart (hour, getdate()) as char(2))+ ' : ' +cast (datepart (mi,getdate()) as char(2))),@id_cliente)
			print 'ASISTENCIA REGISTRADA'
		end
	end
	else
		begin
			print 'CLIENTE YA REGISTRADO EL DIA DE HOY'
		end
	end
---Fin de proceso almacenado

	--Insertando asistencia de los clientes el dia  07/04/2022
	exec SP_Insertar_Registro_Asistencia 23

--Buscando la manera de comparar la fecha usando el cast y el datepart
select * from Registo_Asistencia
print cast (datepart(year,getdate())as varchar(4))+
'-' +cast (datepart(month,getdate())as varchar(2)) +
'-' +cast (datepart(day,getdate())as varchar(2))

--realizando prueba a con condicional
declare @fecha01 date
declare @fecha02 date

set @fecha01 = cast (datepart(year,getdate())as varchar(4))+
'-' +cast (datepart(month,getdate())as varchar(2)) +
'-' +cast (datepart(day,getdate())as varchar(2))
set @fecha02 =  '2022-04-07'
if @fecha01 = @fecha02 
	begin
	print 'SON IGUALES'
	end


select * from Registo_Asistencia


--realizando comparacion de fechas
declare @fecha03 date
declare @fecha04 date
set @fecha03='2022-04-07'
set @fecha04='2022-04-08' 
if @fecha04 > @fecha03
	begin
	print 'LA FECHA ES MAYOR'
	end


select * from Cliente where ID_Estado = 'A'

--Insertando asistencia de los clientes el dia  08/04/2022
	exec SP_Insertar_Registro_Asistencia 1
	exec SP_Insertar_Registro_Asistencia 2
	exec SP_Insertar_Registro_Asistencia 3
	exec SP_Insertar_Registro_Asistencia 4
	exec SP_Insertar_Registro_Asistencia 7
	exec SP_Insertar_Registro_Asistencia 9
	exec SP_Insertar_Registro_Asistencia 10
	exec SP_Insertar_Registro_Asistencia 18
	exec SP_Insertar_Registro_Asistencia 13
	exec SP_Insertar_Registro_Asistencia 12
	exec SP_Insertar_Registro_Asistencia 17
	exec SP_Insertar_Registro_Asistencia 11
	exec SP_Insertar_Registro_Asistencia 20

select * from Registo_Asistencia

	--Insertando asistencia de los clientes el dia  09/04/2022
	exec SP_Insertar_Registro_Asistencia 1
	exec SP_Insertar_Registro_Asistencia 2
	exec SP_Insertar_Registro_Asistencia 3
	exec SP_Insertar_Registro_Asistencia 4
	exec SP_Insertar_Registro_Asistencia 7

	exec SP_Insertar_Registro_Asistencia 9
	exec SP_Insertar_Registro_Asistencia 10
	exec SP_Insertar_Registro_Asistencia 18

	exec SP_Insertar_Registro_Asistencia 13
	exec SP_Insertar_Registro_Asistencia 12
	exec SP_Insertar_Registro_Asistencia 17

	exec SP_Insertar_Registro_Asistencia 11
	exec SP_Insertar_Registro_Asistencia 20


--Insertando asistencia de los clientes el dia  11/04/2022
	exec SP_Insertar_Registro_Asistencia 1
	exec SP_Insertar_Registro_Asistencia 2
	exec SP_Insertar_Registro_Asistencia 3
	exec SP_Insertar_Registro_Asistencia 7
	exec SP_Insertar_Registro_Asistencia 9
	exec SP_Insertar_Registro_Asistencia 10
	exec SP_Insertar_Registro_Asistencia 18
	exec SP_Insertar_Registro_Asistencia 13
	exec SP_Insertar_Registro_Asistencia 12
	exec SP_Insertar_Registro_Asistencia 17
	exec SP_Insertar_Registro_Asistencia 20

	--Insertando asistencia de los clientes el dia  12/04/2022
	exec SP_Insertar_Registro_Asistencia 1
	exec SP_Insertar_Registro_Asistencia 2
	exec SP_Insertar_Registro_Asistencia 3
	exec SP_Insertar_Registro_Asistencia 4
	exec SP_Insertar_Registro_Asistencia 7
	exec SP_Insertar_Registro_Asistencia 9
	exec SP_Insertar_Registro_Asistencia 10
	exec SP_Insertar_Registro_Asistencia 18
	exec SP_Insertar_Registro_Asistencia 13
	exec SP_Insertar_Registro_Asistencia 12
	exec SP_Insertar_Registro_Asistencia 17
	exec SP_Insertar_Registro_Asistencia 11
	exec SP_Insertar_Registro_Asistencia 20

	--Insertando asistencia de los clientes el dia  13/04/2022
	exec SP_Insertar_Registro_Asistencia 1
	exec SP_Insertar_Registro_Asistencia 2
	exec SP_Insertar_Registro_Asistencia 3
	exec SP_Insertar_Registro_Asistencia 4
	exec SP_Insertar_Registro_Asistencia 7
	exec SP_Insertar_Registro_Asistencia 9
	exec SP_Insertar_Registro_Asistencia 10
	exec SP_Insertar_Registro_Asistencia 18
	exec SP_Insertar_Registro_Asistencia 13
	exec SP_Insertar_Registro_Asistencia 12
	exec SP_Insertar_Registro_Asistencia 17
	exec SP_Insertar_Registro_Asistencia 11
	exec SP_Insertar_Registro_Asistencia 20
	exec SP_Insertar_Registro_Asistencia 23
	exec SP_Insertar_Registro_Asistencia 26
	exec SP_Insertar_Registro_Asistencia 27
	exec SP_Insertar_Registro_Asistencia 28
	exec SP_Insertar_Registro_Asistencia 29
	exec SP_Insertar_Registro_Asistencia 30
	exec SP_Insertar_Registro_Asistencia 31
	exec SP_Insertar_Registro_Asistencia 32
	exec SP_Insertar_Registro_Asistencia 33

	select * from Cliente where ID_Estado =  'A'

--Insertando asistencia de los clientes el dia  14/04/2022
	exec SP_Insertar_Registro_Asistencia 1
	exec SP_Insertar_Registro_Asistencia 2
	--exec SP_Insertar_Registro_Asistencia 3
	exec SP_Insertar_Registro_Asistencia 4
	exec SP_Insertar_Registro_Asistencia 7
	exec SP_Insertar_Registro_Asistencia 9
	exec SP_Insertar_Registro_Asistencia 10
	exec SP_Insertar_Registro_Asistencia 18
	exec SP_Insertar_Registro_Asistencia 13
	exec SP_Insertar_Registro_Asistencia 12
	exec SP_Insertar_Registro_Asistencia 17
	exec SP_Insertar_Registro_Asistencia 11
	--exec SP_Insertar_Registro_Asistencia 20
	exec SP_Insertar_Registro_Asistencia 23
	exec SP_Insertar_Registro_Asistencia 26
	exec SP_Insertar_Registro_Asistencia 27
	exec SP_Insertar_Registro_Asistencia 28
	exec SP_Insertar_Registro_Asistencia 29
	--exec SP_Insertar_Registro_Asistencia 30
	exec SP_Insertar_Registro_Asistencia 31
	exec SP_Insertar_Registro_Asistencia 32
	exec SP_Insertar_Registro_Asistencia 33