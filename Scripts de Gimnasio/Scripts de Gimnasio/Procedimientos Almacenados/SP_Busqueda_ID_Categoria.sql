create proc SP_Busqueda_ID_Categoria
@des varchar(35),
@salida int out
as
begin
	set @salida = (select ID_Categoria from Categoria where Descripcion = @des)
	select @salida
end



select * from Categoria
exec SP_Busqueda_ID_Categoria 'BEBIDAS',0