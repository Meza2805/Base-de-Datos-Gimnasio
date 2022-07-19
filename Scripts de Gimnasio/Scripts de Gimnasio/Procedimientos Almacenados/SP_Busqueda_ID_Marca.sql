alter proc SP_Busqueda_ID_Marca
@des varchar(35),
@salida int out
as
begin
	set @salida = (select ID_Marca from Marca where Nombre = @des)
	select @salida
end
EXEC SP_BUS
select * from Marca
select * from Categoria


select * from Producto 