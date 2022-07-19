alter proc SP_Actualizar_Marca
@id int,
@nombre varchar(40),
@id_categoria int,
@salida varchar(50) out
as 
begin
	if not exists (select top 1 ID_Marca from Marca where ID_Marca= @id)
		begin
			set @salida= 'LA MARCA NO SE ENCUENTRA EN LA BASE DE DATOS'
		end
	else
		begin
			update Marca set Nombre=@nombre, ID_Categoria = @id_categoria where ID_Marca = @id
			set @salida= 'LA MARCA HA SIDO ACTUALIZADA'
		end
end

SELECT * FROM Marca
