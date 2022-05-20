alter proc SP_Insertar_Cliente
@Cedula_Cliente char(16),
@Primer_Nombre varchar(50),
@Segundo_Nombre varchar(50),
@Primer_Apellido varchar(50),
@Segundo_Apellido varchar(50),
@Sexo char(1),
@Fecha_Nac date,
@salida int out
--@Fecha_Registro date,
--Al registrar un cliente su estado por defecto es Inactivo
--Esto mientras se le asigna o contrara una membresia
as
set nocount on
BEGIN
if not exists (select top 1 Cedula from Cliente where Cedula =  @Cedula_Cliente)
	begin
		--se usa las funciones Ltrim y Rtrim para eliminar los espacios en blanco
		--se usa la funcion Upper para convertir en mayuscula toda la cadena de caracteres
		/*
		insert into Cliente (Cedula,[Primer Nombre],[Segundo Nombre],[Primer Apellido],[Segundo Apellido],Sexo,Fecha_Nac,Fecha_Registro,ID_Estado)
		values (ltrim(rtrim(upper(@Cedula_Cliente))),LTRIM(RTRIM(UPPER(@Primer_Nombre))),LTRIM(RTRIM(UPPER(@Segundo_Nombre))),LTRIM(RTRIM(UPPER(@Primer_Apellido))),
			LTRIM(RTRIM(UPPER(@Segundo_Apellido))),UPPER(@Sexo),@Fecha_Nac,getdate(),@ID_Estado)*/
			--select 'EL CLIENTE REGISTRADO' as MENSAJE

			update Cliente set [Primer Nombre]= [Primer Nombre], [Segundo Nombre] =  @Segundo_Nombre, [Primer Apellido]= @Primer_Apellido,
			[Segundo Apellido]= @Segundo_Apellido, Sexo= @Sexo, Fecha_Nac= @Fecha_Nac where Cedula =  @Cedula_Cliente
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
