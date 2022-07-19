alter proc SP_Actualizar_Membresia
@id char(1),
@descripcion varchar(50),
@precio decimal(10,2),
@salida varchar(35) out
as
begin
	if not exists (select ID_Membresia from Membresia where ID_Membresia=@id)
		begin
		set @salida	='LA MEMBRESIA NO EXISTE EN LA BASE DE DATOS'
		end
	else
		begin
			update Membresia set Descripcion = @descripcion, Precio=@precio
			where ID_Membresia=@id
				set @salida	='LA ACTUALIZADA'
		end
		select @salida;
end


