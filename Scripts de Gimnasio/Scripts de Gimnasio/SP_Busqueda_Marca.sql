select * from Marca
alter proc SP_Busqueda_Marca
@ID_Marca int
as
begin
	if not exists (select * from Marca with (nolock) where ID_Marca = @ID_Marca)
		begin
			print 'LA MARCA SOLICITADA NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
	else
		begin
			select * from Marca with (nolock) where ID_Marca = @ID_Marca
		end
end


exec SP_Busqueda_Marca 100