alter proc SP_Eliminar_Producto
@des varchar(50),
@salida varchar(100) out
as
begin
	 set nocount on
	if not exists (select top 1 Nombre from Producto where Nombre = @des)
	begin
		set @salida =  'EL PRODUCTO SOLICITADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
	begin
		delete from Producto where Nombre = @des
	 set @salida =  'EL PRODUCTO SE HA ELIMINADO DE LA BASE DE DATOS'
	end
	select @salida
end

EXEC SP_Eliminar_Producto 1091
SELECT * FROM Producto