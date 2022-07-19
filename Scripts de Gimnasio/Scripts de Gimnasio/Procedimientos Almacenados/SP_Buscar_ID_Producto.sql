alter proc SP_Buscar_ID_Producto
@nombre varchar(50),
@salida int out
as
begin
if exists (select ID_Producto from Producto where Nombre = @nombre)
	begin
			set @salida = (select ID_Producto from Producto where Nombre = @nombre)
	end
	
	select @salida
end
select * from Producto

exec  SP_Buscar_ID_Producto 'YET',0