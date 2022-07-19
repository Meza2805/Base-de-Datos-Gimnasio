ALTER proc SP_Insertar_Membresia
@id char(1),
@descripcion varchar(50),
@precio decimal(10,2),
@salida varchar(35) out
as
begin
	if not exists (select ID_Membresia from Membresia where ID_Membresia=@id)
		begin
			insert into Membresia (ID_Membresia,Descripcion,Precio)
			values(@id,@descripcion,@precio)
			set @salida = 'MEMBRESIA INSERTADA'
		end
	else
		begin
			set @salida = 'LA MEMBRESIA YA EXISTE EN LA BASE DE DATOS'
		end
		select @salida
end

