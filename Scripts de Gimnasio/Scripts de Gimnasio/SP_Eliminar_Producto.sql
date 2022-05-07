alter proc SP_Eliminar_Producto
@ID_Producto int
as
begin
	 set nocount on
	if not exists (select top 1 ID_Producto from Producto where ID_Producto = @ID_Producto)
	begin
		PRINT 'EL PRODUCTO SOLICITADO NO SE ENCUENTRA EN LA BASE DE DATOS'
	end
	else
	begin
		delete from Producto where ID_Producto = @ID_Producto
		PRINT 'EL PRODUCTO SE HA ELIMINADO DE LA BASE DE DATOS'
	end
end

EXEC SP_Eliminar_Producto 1091
SELECT * FROM Producto