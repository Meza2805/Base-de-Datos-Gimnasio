create proc Buscar_ID_Membresia
@descripcion varchar(50),
@id_membresia char(1) out
as 
begin
	if exists (select ID_Membresia from Membresia where Descripcion= @descripcion)
		begin
			set @id_membresia =  (select ID_Membresia from Membresia where Descripcion= @descripcion)
		end
end
