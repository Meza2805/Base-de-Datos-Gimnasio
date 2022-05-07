
alter proc SP_Insertar_Registro_Asistencia
@Cedula_Cliente char(16)
as
	begin
	declare @Fecha_Actual date
	set @Fecha_Actual = cast (datepart(year,getdate())as varchar(4))+
						'-' +cast (datepart(month,getdate())as varchar(2)) +
						'-' +cast (datepart(day,getdate())as varchar(2))
	set nocount on
	if not exists (select top 1 ID_Cliente from Registo_Asistencia where ID_Cliente =  @Cedula_Cliente and Fecha = @Fecha_Actual)
		begin --la subconsulta para el siguiente if utiliza el top1 para encontrar la fecha de vencimiento de membresia mas reciente
		      --Ordenandolo desde la fecha mayor hasta la fecha menor, pues un cliente puede tener una o varias fechas de vencimiento de membresia
			  --Debido a que puede renovar membresia, lo que a su vez generara siempre una nueva fecha de vencimiento
		if @Fecha_Actual > (select top 1 Fecha_Expiracion from suscripcion where ID_Cliente = @Cedula_Cliente order by Fecha_Expiracion desc)
			begin
				update Cliente set ID_Estado ='I' where Cedula =  @Cedula_Cliente  
				print 'MEMBRESIA EXPIRADA'
				print 'EL CLIENTE HA PASADO A ESTADO INACTIVO'
				print 'HASTA QUE CONTRATE UNA NUEVA MEMBRESIA'
			end
		else
		begin
			insert into Registo_Asistencia (Fecha,Hora,ID_Cliente)
			values (GETDATE(),(cast(datepart (hour, getdate()) as char(2))+ ' : ' +cast (datepart (mi,getdate()) as char(2))),@Cedula_Cliente)
			print 'ASISTENCIA REGISTRADA'
		end
	end
	else
		begin
			print 'CLIENTE YA REGISTRADO EL DIA DE HOY'
		end
	end
---Fin de proceso almacenado
---------------------------------------------------------------------------
select * from suscripcion order by ID_Cliente

select * from vista.Categoria



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

	--Insertando asistencia de los clientes el dia  15/04/2022
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


	
	--Insertando asistencia de los clientes el dia  18/04/2022
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

	--para conocer la cantidad de clientes activados
	select count (ID_Cliente) as Activo from Cliente where ID_Estado = 'A' 
	select count (ID_Cliente) as Inactivo from Cliente where ID_Estado = 'I'
	select count (ID_Cliente) as Inactivo from Cliente where ID_Estado = 'B'

	select * from Cliente where ID_Estado = 'I'

		
	--Insertando asistencia de los clientes el dia  20/04/2022
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

	select * from Cliente where ID_Estado = 'A'
	SELECT * FROM Registo_Asistencia


	--Insertando asistencia de los clientes el dia  25/04/2022
	exec SP_Insertar_Registro_Asistencia 1
	exec SP_Insertar_Registro_Asistencia 2
	exec SP_Insertar_Registro_Asistencia 3
	exec SP_Insertar_Registro_Asistencia 4
	exec SP_Insertar_Registro_Asistencia 5
	exec SP_Insertar_Registro_Asistencia 6
	exec SP_Insertar_Registro_Asistencia 7
	exec SP_Insertar_Registro_Asistencia 8
	exec SP_Insertar_Registro_Asistencia 9
	exec SP_Insertar_Registro_Asistencia 10
	exec SP_Insertar_Registro_Asistencia 11
	exec SP_Insertar_Registro_Asistencia 12
	exec SP_Insertar_Registro_Asistencia 13
	exec SP_Insertar_Registro_Asistencia 14
	exec SP_Insertar_Registro_Asistencia 15
	exec SP_Insertar_Registro_Asistencia 16
	exec SP_Insertar_Registro_Asistencia 17
	exec SP_Insertar_Registro_Asistencia 18
	exec SP_Insertar_Registro_Asistencia 19
	exec SP_Insertar_Registro_Asistencia 26
	exec SP_Insertar_Registro_Asistencia 33

	select * from Cliente where ID_Estado = 'A'
	SELECT * FROM Registo_Asistencia

		--Insertando asistencia de los clientes el dia  28/04/2022
	exec SP_Insertar_Registro_Asistencia 1
	exec SP_Insertar_Registro_Asistencia 2
	exec SP_Insertar_Registro_Asistencia 3
	exec SP_Insertar_Registro_Asistencia 4
	exec SP_Insertar_Registro_Asistencia 5
	exec SP_Insertar_Registro_Asistencia 6
	exec SP_Insertar_Registro_Asistencia 7
	exec SP_Insertar_Registro_Asistencia 8
	exec SP_Insertar_Registro_Asistencia 9
	exec SP_Insertar_Registro_Asistencia 10
	exec SP_Insertar_Registro_Asistencia 11
	exec SP_Insertar_Registro_Asistencia 12
	exec SP_Insertar_Registro_Asistencia 13
	exec SP_Insertar_Registro_Asistencia 14
	exec SP_Insertar_Registro_Asistencia 15
	exec SP_Insertar_Registro_Asistencia 16
	exec SP_Insertar_Registro_Asistencia 17
	exec SP_Insertar_Registro_Asistencia 18
	exec SP_Insertar_Registro_Asistencia 19
	exec SP_Insertar_Registro_Asistencia 26
	exec SP_Insertar_Registro_Asistencia 33

	select * from Cliente where ID_Estado = 'A'
	SELECT * FROM Registo_Asistencia


		--Insertando asistencia de los clientes el dia  29/04/2022
	exec SP_Insertar_Registro_Asistencia 1
	exec SP_Insertar_Registro_Asistencia 2
	exec SP_Insertar_Registro_Asistencia 3
	exec SP_Insertar_Registro_Asistencia 4
	exec SP_Insertar_Registro_Asistencia 5
	exec SP_Insertar_Registro_Asistencia 6
	exec SP_Insertar_Registro_Asistencia 7
	exec SP_Insertar_Registro_Asistencia 8
	exec SP_Insertar_Registro_Asistencia 9
	exec SP_Insertar_Registro_Asistencia 10
	exec SP_Insertar_Registro_Asistencia 11
	exec SP_Insertar_Registro_Asistencia 12
	exec SP_Insertar_Registro_Asistencia 13
	exec SP_Insertar_Registro_Asistencia 14
	exec SP_Insertar_Registro_Asistencia 15
	exec SP_Insertar_Registro_Asistencia 16
	exec SP_Insertar_Registro_Asistencia 17
	exec SP_Insertar_Registro_Asistencia 18
	exec SP_Insertar_Registro_Asistencia 19
	exec SP_Insertar_Registro_Asistencia 26
	exec SP_Insertar_Registro_Asistencia 33

	select * from Cliente where ID_Estado = 'A'
	SELECT * FROM Registo_Asistencia


			--Insertando asistencia de los clientes el dia  30/04/2022
	exec SP_Insertar_Registro_Asistencia 1
	exec SP_Insertar_Registro_Asistencia 2
	exec SP_Insertar_Registro_Asistencia 3
	exec SP_Insertar_Registro_Asistencia 4
	exec SP_Insertar_Registro_Asistencia 5
	exec SP_Insertar_Registro_Asistencia 6
	exec SP_Insertar_Registro_Asistencia 7
	exec SP_Insertar_Registro_Asistencia 8
	exec SP_Insertar_Registro_Asistencia 9
	exec SP_Insertar_Registro_Asistencia 10
	exec SP_Insertar_Registro_Asistencia 11
	exec SP_Insertar_Registro_Asistencia 12
	exec SP_Insertar_Registro_Asistencia 13
	exec SP_Insertar_Registro_Asistencia 14
	exec SP_Insertar_Registro_Asistencia 15
	exec SP_Insertar_Registro_Asistencia 16
	exec SP_Insertar_Registro_Asistencia 17
	exec SP_Insertar_Registro_Asistencia 18
	exec SP_Insertar_Registro_Asistencia 19
	exec SP_Insertar_Registro_Asistencia 26
	exec SP_Insertar_Registro_Asistencia 33

	select * from Cliente where ID_Estado = 'A'
	SELECT * FROM Registo_Asistencia



--Insertando asistencia de los clientes el dia  02/05/2022
	exec SP_Insertar_Registro_Asistencia 1
	exec SP_Insertar_Registro_Asistencia 2
	exec SP_Insertar_Registro_Asistencia 3
	exec SP_Insertar_Registro_Asistencia 4
	exec SP_Insertar_Registro_Asistencia 5
	exec SP_Insertar_Registro_Asistencia 6
	exec SP_Insertar_Registro_Asistencia 7
	exec SP_Insertar_Registro_Asistencia 8
	exec SP_Insertar_Registro_Asistencia 9
	exec SP_Insertar_Registro_Asistencia 10
	exec SP_Insertar_Registro_Asistencia 11
	exec SP_Insertar_Registro_Asistencia 12
	exec SP_Insertar_Registro_Asistencia 13
	exec SP_Insertar_Registro_Asistencia 14
	exec SP_Insertar_Registro_Asistencia 15
	exec SP_Insertar_Registro_Asistencia 16
	exec SP_Insertar_Registro_Asistencia 17
	exec SP_Insertar_Registro_Asistencia 18
	exec SP_Insertar_Registro_Asistencia 19
	exec SP_Insertar_Registro_Asistencia 26
	exec SP_Insertar_Registro_Asistencia 33

	select * from Cliente where ID_Estado = 'A'
	SELECT * FROM Registo_Asistencia