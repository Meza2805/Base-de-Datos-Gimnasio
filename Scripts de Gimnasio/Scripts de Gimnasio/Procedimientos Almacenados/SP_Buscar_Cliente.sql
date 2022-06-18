select * from Cliente

alter proc SP_Busqueda_Cliente
@Cedula_Cliente char(16),
@salida int out,
@Primer_Nombre varchar(50) out,
@Segundo_Nombre varchar(50) out,
@Primer_Apellido varchar(50) out,
@Segundo_Apellido varchar(50) out,
@Sexo char(1) out,
@Fecha_Nac date out,
@Fecha_Registro date out,
@Estado char(1) out
as
	begin
		IF not exists (select top 1(Cedula) from Cliente with (nolock) where Cedula = @Cedula_Cliente )
			begin
				--print 'EL CLIENTE NO SE ENCUENTRA EN LA BASE DE DATOS'
				set @salida =  0
			end
		else
			begin
			set @salida=1
			set @Primer_Nombre =  (select [Primer Nombre] from Cliente where Cedula =  @Cedula_Cliente)

				select C.Cedula as [CEDULA],C.[PRIMER NOMBRE],C.[SEGUNDO NOMBRE],C.[PRIMER APELLIDO],C.[SEGUNDO APELLIDO],C.Sexo AS SEXO, 
				C.Fecha_Nac as [FECHA DE NACIMIENTO], C.Fecha_Registro as [FECHA DE REGISTRO], EC.Descripcion as [ESTADO DE CLIENTE] from Cliente C
				Inner join Estado_Cliente EC  on C.ID_Estado = EC.ID_Estado 
				where Cedula = @Cedula_Cliente
			end
	end

exec SP_Busqueda_Cliente '448-150493-0001V'


select * from Cliente
sp_help Cliente
SELECT * FROM Registo_Asistencia