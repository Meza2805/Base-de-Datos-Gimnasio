select * from Cliente

alter proc SP_Busqueda_Cliente
@ID_Cliente int
as
	set nocount on
	begin
		IF not exists (select top 1(ID_Cliente) from Cliente with (nolock) where ID_Cliente = @ID_Cliente )
			begin
				print 'EL CLIENTE NO SE ENCUENTRA EN LA BASE DE DATOS'
			end
		else
			begin
				select C.ID_Cliente as [CODIGO CLIENTE],C.[PRIMER NOMBRE],C.[SEGUNDO NOMBRE],C.[PRIMER APELLIDO],C.[SEGUNDO APELLIDO],C.Sexo AS SEXO, 
				C.Fecha_Nac as [FECHA DE NACIMIENTO], C.Fecha_Registro as [FECHA DE REGISTRO], EC.Descripcion as [ESTADO DE CLIENTE] from Cliente C
				Inner join Estado_Cliente EC  on C.ID_Estado = EC.ID_Estado 
				where ID_Cliente = @ID_Cliente
			end
	end

exec SP_Busqueda_Cliente 9
