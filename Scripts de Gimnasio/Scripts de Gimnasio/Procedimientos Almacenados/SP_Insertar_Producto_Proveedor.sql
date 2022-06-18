select * from Producto
select * from Proveedor
select * from Producto_Proveedor


ALTER proc SP_Insertar_Producto_Proovedor
@id_producto int,
@id_proovedor int
as
	set nocount on
	begin
		IF not exists (select top 1 ID_Producto from Producto_Proveedor where ID_Producto = @id_producto)
			begin
				insert into Producto_Proveedor (ID_Producto,ID_Proveedor)
				values (@id_producto,@id_proovedor)
				print 'RELACION PRODUCTO-PROVEEDOR ESTABLECIDA'
			end
		else
			begin
				print 'YA SE HA ESTABLECIDO UNA RELACION PARA ESE PRODUCTO'
			end
	end



---Procedimiento almacenado para insertar producto_proveedor
exec SP_Insertar_Producto_Proovedor 78,1003



exec SP_Insertar_Producto_Proovedor 46,1003
exec SP_Insertar_Producto_Proovedor 47,2
exec SP_Insertar_Producto_Proovedor 48,2
exec SP_Insertar_Producto_Proovedor 49,2
exec SP_Insertar_Producto_Proovedor 50,2
exec SP_Insertar_Producto_Proovedor 51,2

exec SP_Insertar_Producto_Proovedor 52,3
exec SP_Insertar_Producto_Proovedor 53,3
exec SP_Insertar_Producto_Proovedor 54,4

exec SP_Insertar_Producto_Proovedor 55,5
exec SP_Insertar_Producto_Proovedor 56,5
exec SP_Insertar_Producto_Proovedor 57,5
exec SP_Insertar_Producto_Proovedor 58,5
exec SP_Insertar_Producto_Proovedor 59,5
exec SP_Insertar_Producto_Proovedor 60,5
exec SP_Insertar_Producto_Proovedor 61,5
exec SP_Insertar_Producto_Proovedor 62,5
exec SP_Insertar_Producto_Proovedor 63,5
exec SP_Insertar_Producto_Proovedor 64,5
exec SP_Insertar_Producto_Proovedor 65,5
exec SP_Insertar_Producto_Proovedor 66,5
exec SP_Insertar_Producto_Proovedor 67,5
exec SP_Insertar_Producto_Proovedor 68,5
exec SP_Insertar_Producto_Proovedor 69,5
exec SP_Insertar_Producto_Proovedor 70,5
exec SP_Insertar_Producto_Proovedor 71,5
exec SP_Insertar_Producto_Proovedor 72,5
exec SP_Insertar_Producto_Proovedor 73,5
exec SP_Insertar_Producto_Proovedor 74,5
exec SP_Insertar_Producto_Proovedor 75,5
exec SP_Insertar_Producto_Proovedor 76,5
exec SP_Insertar_Producto_Proovedor 77,4
exec SP_Insertar_Producto_Proovedor 79,1003
exec SP_Insertar_Producto_Proovedor 80,1003
exec SP_Insertar_Producto_Proovedor 81,1003
exec SP_Insertar_Producto_Proovedor 82,1003
exec SP_Insertar_Producto_Proovedor 83,1002
exec SP_Insertar_Producto_Proovedor 84,1002
exec SP_Insertar_Producto_Proovedor 85,1002
exec SP_Insertar_Producto_Proovedor 86,1002
exec SP_Insertar_Producto_Proovedor 87,1003
exec SP_Insertar_Producto_Proovedor 88,1003
exec SP_Insertar_Producto_Proovedor 89,1003


select * from Producto
select * from Proveedor
select * from Producto_Proveedor
