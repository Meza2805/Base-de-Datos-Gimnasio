select * from Cliente
alter proc SP_Insertar_Cliente
@Cedula_Cliente char(16),
@Primer_Nombre varchar(50),
@Segundo_Nombre varchar(50),
@Primer_Apellido varchar(50),
@Segundo_Apellido varchar(50),
@Sexo char(1),
@Fecha_Nac date,
@salida int out,
--@Fecha_Registro date,
--Al registrar un cliente su estado por defecto es Inactivo
--Esto mientras se le asigna o contrara una membresia
@ID_Estado char(1) = I
as
set nocount on
BEGIN
if not exists (select top 1 Cedula from Cliente where Cedula =  @Cedula_Cliente)
	begin
		--se usa las funciones Ltrim y Rtrim para eliminar los espacios en blanco
		--se usa la funcion Upper para convertir en mayuscula toda la cadena de caracteres
		insert into Cliente (Cedula,[Primer Nombre],[Segundo Nombre],[Primer Apellido],
		[Segundo Apellido],Sexo,Fecha_Nac,Fecha_Registro,ID_Estado)
		values (ltrim(rtrim(upper(@Cedula_Cliente))),LTRIM(RTRIM(UPPER(@Primer_Nombre))),
		LTRIM(RTRIM(UPPER(@Segundo_Nombre))),LTRIM(RTRIM(UPPER(@Primer_Apellido))),
			LTRIM(RTRIM(UPPER(@Segundo_Apellido))),UPPER(@Sexo),@Fecha_Nac,getdate(),@ID_Estado)
			--select 'EL CLIENTE REGISTRADO' as MENSAJE
			set @salida = 0
	end
else
	begin
		--select 'EL CLIENTE YA SE ENCUENTRA EN LA BASE DE DATOS' as MENSAJE
		--return 3
		set @salida = 1
	end
	select @salida
END
------------------------------------------------------------------------------------------------------------





			select * from Cliente
sp_help Cliente
select * from Cliente

update cliente set ID_Estado= 'I' where ID_Estado = 'A'
delete  from suscripcion


EXEC SP_Insertar_Cliente '448-150493-0001V','MARVIN','rafael','meza','pineda','m','15/04/93',0
select * from Registo_Asistencia
sp_help Registo_Asistencia

select * from suscripcion
sp_help suscripcion

Select * from Empleado
sp_help Empleado






--Insertando valores a la tabla cliente

EXEC SP_Insertar_Cliente 'Carmen','elvirA','pineda','arvizu','f','16/06/1980','01/03/2021'
EXEC SP_Insertar_Cliente 'Xiomara','TAtiana','perez','pereira','f','16/06/1995','14/04/2021'
EXEC SP_Insertar_Cliente 'Adrian','josue','rivera','ruiz','m','16/06/1993','14/02/2021'
EXEC SP_Insertar_Cliente 'Carlos','marco','ramirez','martinez','m','16/06/1999','4/02/2021'
EXEC SP_Insertar_Cliente 'Jose','ramon','pichardo','perez','m','16/06/2001','25/07/2021'
EXEC SP_Insertar_Cliente 'reyna','isabel','velasquez','moreno','f','17/12/1990','10/08/2021'
EXEC SP_Insertar_Cliente 'meyling','estefania','mejia','urroz','f','16/06/2001','18/05/2021'
EXEC SP_Insertar_Cliente 'Cristopher','emilio','saenz','flores','m','16/06/1998','10/11/2021'
EXEC SP_Insertar_Cliente 'jose','mercedes','bustillo','valerio','m','25/05/2004','15/05/2021'
EXEC SP_Insertar_Cliente 'ingrid ','maria','ruiz','pineda','f','16/04/1999','14/04/2021'
EXEC SP_Insertar_Cliente 'flor','de maria','pineda','arvizu','f','16/06/1989','10/12/2021'
EXEC SP_Insertar_Cliente 'carmen','elvira','portobanco','marenco','f','16/06/1985','14/01/2021'
EXEC SP_Insertar_Cliente 'ronald','josue','soza','zamora','m','01/09/2000','27/02/2021'
EXEC SP_Insertar_Cliente 'sebastian','jose','meza','orozco','m','16/06/2001','15/09/2021'
EXEC SP_Insertar_Cliente 'abisai','mercedes','velasquez','vasquez','f','16/06/1995','28/03/2021'
EXEC SP_Insertar_Cliente 'martha','lorena','arvizu','picado','f','16/06/1998','25/06/2021'
EXEC SP_Insertar_Cliente 'pablo','josue','arvizu','picado','m','16/06/1990','25/06/2021'
EXEC SP_Insertar_Cliente 'rene','','arvizu','picado','m','16/06/1998','25/06/2021'
EXEC SP_Insertar_Cliente 'uriel','','arauz','treminio','m','16/06/2001','27/12/2021'
EXEC SP_Insertar_Cliente 'luis','manuel','genet','gomez','m','16/06/2005','25/10/2021'
EXEC SP_Insertar_Cliente 'maria','lourdes','silva','guido','f','16/10/1998','26/08/2021'
EXEC SP_Insertar_Cliente 'dina','sarai','castro','flores','f','19/06/1999','30/06/2021'
EXEC SP_Insertar_Cliente 'marlon','alcides','gonzalez','lopez','m','16/06/2003','25/11/2021'
EXEC SP_Insertar_Cliente 'jose','manuel','aleman','rizo','m','27/09/1997','30/11/2021'
EXEC SP_Insertar_Cliente 'daniel','','saavedra','melendez','m','28/06/2000','25/03/2021'
EXEC SP_Insertar_Cliente 'ramiro','ruben','martinez','martinez','m','16/06/1998','25/06/2021'


--Insertando valores a la tabla cliente 09/04/2022

EXEC SP_Insertar_Cliente 'raul','','morales','matuz','m','16/06/1998'
EXEC SP_Insertar_Cliente 'reyna','isabel','velasquez','venancio','f','16/05/1999'
EXEC SP_Insertar_Cliente 'francisco','george','lopez','lopez','m','16/06/2002'
EXEC SP_Insertar_Cliente 'melvin','uriel','urbina','lara','m','16/06/1990'

select * from Cliente

--Insertando valores a la tabla cliente 12/04/2022

EXEC SP_Insertar_Cliente 'meyling','estefania','perez','velasquez','f','16/06/1997'
EXEC SP_Insertar_Cliente 'isabel','','perez','velasquez','f','27/08/1992'

EXEC SP_Insertar_Cliente 'adolfo','yamil','hernandez','lopez','m','27/08/1993'
EXEC SP_Insertar_Cliente 'eduardo','francisco','romero','venancio','m','24/09/1990'