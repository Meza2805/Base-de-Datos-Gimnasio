create proc SP_Actualizar_Cliente
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
			set @salida = 1
	end
else
	begin
		update Cliente set [Primer Nombre]= [Primer Nombre], [Segundo Nombre] =  @Segundo_Nombre, [Primer Apellido]= @Primer_Apellido,
			[Segundo Apellido]= @Segundo_Apellido, Sexo= @Sexo, Fecha_Nac= @Fecha_Nac where Cedula =  @Cedula_Cliente
	set @salida = 0
	end
	select @salida
END
------------------------------------------------------------------------------------------------------------
select * from cliente
exec SP_Actualizar_Cliente '448-150493-0001V','MARVIN','RAFAEL','MESA','PINEDA','M','1993-04-15',0