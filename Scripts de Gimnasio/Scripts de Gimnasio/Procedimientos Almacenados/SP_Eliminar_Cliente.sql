alter proc SP_Eliminar_Cliente
@Cedula char(16),
@salida int out
as
	set nocount on
	begin
		IF not exists (select top 1(Cedula) from Cliente with (nolock) where Cedula = @Cedula )
			begin
				--print 'EL CLIENTE NO SE ENCUENTRA EN LA BASE DE DATOS'
				set @salida=0
			end
		else
			begin
				DELETE from Cliente where Cedula = @Cedula
				--print 'EL CLIENTE HA SIDO ELIMINADO DE LA BASE DE DATOS'
				set @salida=1
			end
		select @salida
	end

EXEC SP_Insertar_Cliente 'Karen','elvirA','pineda','arvizu','f','16/06/1980'
select * from Cliente
select * from Estado_Cliente

exec SP_Eliminar_Cliente 39