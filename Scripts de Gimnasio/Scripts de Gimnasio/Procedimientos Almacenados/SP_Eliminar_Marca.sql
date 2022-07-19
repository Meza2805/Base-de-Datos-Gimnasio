ALTER proc SP_Eliminar_Marca
@ID_Marca int,
@salida varchar(50) out
as
begin
	if not exists (select  top 1 ID_Marca from Marca with (nolock) where ID_Marca = @ID_Marca)
		begin
			set @salida ='LA MARCA SOLICITADA NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
	else
		begin
			delete from Marca  where ID_Marca = @ID_Marca
			set @salida ='LA MARCA HA SIDO ELIMINADA'
		end
		select @salida
end

select * from Marca




exec SP_Eliminar_Marca 29, ''