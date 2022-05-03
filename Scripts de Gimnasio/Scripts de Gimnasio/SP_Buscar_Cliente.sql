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
				select * from Cliente where ID_Cliente = @ID_Cliente
			end
	end

exec SP_Busqueda_Cliente 9
