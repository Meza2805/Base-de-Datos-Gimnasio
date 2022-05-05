alter proc SP_Eliminar_Cliente
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
				DELETE from Cliente where ID_Cliente = @ID_Cliente
				print 'EL CLIENTE HA SIDO ELIMINADO DE LA BASE DE DATOS'
			end
	end

EXEC SP_Insertar_Cliente 'Karen','elvirA','pineda','arvizu','f','16/06/1980'
select * from Cliente
select * from Estado_Cliente

exec SP_Eliminar_Cliente 39