--primera parte para inserta Factura de Compra de Productos
create proc SP_Insertar_Factura_Compra_01
@id_cliente int,
@id_empleado int,
@id_Mpago int
as
begin
set nocount on
	insert into Factura_Compra(Fecha,ID_Empleado,ID_Proveedor,ID_MPago)
		values (GETDATE(),@id_cliente,@id_empleado,@id_Mpago)
		print 'INSERTADOS DATOS GENERALES DE FACTURA DE COMPRA DE PRODCUTOS'
end
------------------------------------------------------------------------
--------Fin de Procedimiento Almacenado---------------


--segunda parte para insertar factura (detalle factura)
create proc SP_Insertar_Detalle_Factura_Compra
@id_factura int,
@id_producto int,
@cantidad_producto int
as
begin
	set nocount on
		insert into Detalle_Factura_Compra(ID_Factura_Compra,ID_Producto,Cant_Producto)
		values (@id_factura,@id_producto,@cantidad_producto)
		print 'DETALLE REGISTRADO CORRECTAMENTE'
		update Producto set Stock = Stock + @cantidad_producto,
							[Precio Venta] = 
				where ID_Producto = @id_producto
end



select * from Detalle_Factura_Compra
select * from Producto