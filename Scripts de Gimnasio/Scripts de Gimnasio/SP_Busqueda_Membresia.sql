select * from Membresia

alter proc SP_Busqueda_Membresia
@ID_Membresia char(1)
as
begin
	if not exists (select  top 1 ID_Membresia from Membresia with (nolock) where ID_Membresia =  @ID_Membresia)
	begin
		print 'LA MEMBRESIA SOLICITADA NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
		begin
			select ID_Membresia as CODIGO, Descripcion MEMBRESIA,Precio AS PRECIO from Membresia with (nolock) where ID_Membresia =  @ID_Membresia
		end
end


exec SP_Busqueda_Membresia 'M'