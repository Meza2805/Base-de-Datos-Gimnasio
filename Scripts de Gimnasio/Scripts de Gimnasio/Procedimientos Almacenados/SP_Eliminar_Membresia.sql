alter proc SP_Eliminar_Membresia
@ID_Membresia char(1),
@salida varchar(35) out
as
begin
	if not exists (select  top 1 ID_Membresia from Membresia with (nolock) where ID_Membresia =  @ID_Membresia)
	begin
		set @salida= 'LA MEMBRESIA SOLICITADA NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
		begin
			delete from Membresia  where ID_Membresia =  @ID_Membresia
			set @salida= 'MEMBRESIA ELIMINADA'
		end
		SELECT @salida
end

