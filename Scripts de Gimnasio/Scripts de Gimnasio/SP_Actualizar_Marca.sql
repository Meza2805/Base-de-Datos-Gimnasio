create proc SP_Actualizar_Marca
@id int,
@nombre varchar(40)
as 
begin
	if not exists (select top 1 ID_Marca from Marca where ID_Marca= @id)
		begin
			print 'LA MARCA NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
	else
		begin
			update Marca set Nombre=@nombre where ID_Marca = @id
		end
end

