create proc SP_Eliminar_Marca
@ID_Marca int
as
begin
	if not exists (select  top 1 ID_Marca from Marca with (nolock) where ID_Marca = @ID_Marca)
		begin
			print 'LA MARCA SOLICITADA NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
	else
		begin
			delete from Marca  where ID_Marca = @ID_Marca
		end
end