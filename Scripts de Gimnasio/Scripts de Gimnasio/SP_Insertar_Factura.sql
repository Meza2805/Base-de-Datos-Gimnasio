

--primera parte para inserta Factura
alter proc SP_Insertar_Factura01
@id_cliente int,
@id_empleado int,
@id_Mpago int
as
begin
set nocount on
	insert into Factura_Venta(Fecha,ID_Cliente,ID_Empleado,ID_MPago)
		values (GETDATE(),@id_cliente,@id_empleado,@id_Mpago)
		print 'INSERTADOS DATOS GENERALES DE FACTURA'
end

-----------------------------------------------------------------------------

segunda parte para insertar factura (detalle factura)
ALTER proc SP_Insertar_Detalle_Factura
@id_factura int,
@id_producto int,
@cantidad_producto int
as
begin
	set nocount on
	Consultamos si el Stock del producto es mayor a la cantidad de productos de la factura
	if ((select Stock from Producto where ID_Producto = @id_producto)>= @cantidad_producto) 
	begin
		insert into Detalle_Factura_Venta(ID_Factura,ID_Producto,Cant_Producto)
		values (@id_factura,@id_producto,@cantidad_producto)
		print 'DETALLE REGISTRADO CORRECTAMENTE'
		update Producto set Stock = Stock - @cantidad_producto where ID_Producto = @id_producto
	end
	else
	begin
		print 'LA CANTIDAD SOLICITADA DE PRODUCTO ES MAYOR QUE EL STOCK DISPONIBLE'
	end
end

---------------------------------------------------------------------------------------
--Tercera parte para insertar Factura
alter proc SP_Insertar_Factura02
@id_factura int
as
	begin
		--declaracion de variables locales
		declare @subtotal money
		declare @iva money
		declare @total money
		set nocount on
		--uso de variable tipo tabla para calcular el precio y el total
		declare @detalle table (id int identity (1,1), codigo_producto int,cantidad int,precio_producto money,total money)
		insert into @detalle (codigo_producto,DF.cantidad,precio_producto,total)
		select DF.ID_Producto,DF.Cant_Producto, P.[Precio Venta],(P.[Precio Venta] * DF.Cant_Producto) from Detalle_Factura_Venta DF inner join Producto P
		on p.ID_Producto=df.ID_Producto where ID_Factura = @id_factura

		--Insertando valores en la tabla factura
		set @subtotal =  (select sum(total) from @detalle)
		set @iva =  @subtotal * 0.15
		set @total = @subtotal + @iva 
			
		update Factura_Venta set SubTotal = @subtotal, IVA = @iva , Total = @total 
			where ID_Factura  = @id_factura
		print 'FACTURA REGISTRADA CORRECTAMENTE'
	end


select * from Factura
--select * from Producto
select * from Detalle_Factura

exec SP_Insertar_Factura02 1

select * from Factura_Compra
drop table Factura_Compra
select * from Factura
select * from Detalle_Factura
select * from Producto
select * from Cliente
select * from Modo_Pago

--Insertando Datos para Facturacion
-------------------------------------------------------
--Insertando datos para la factura parte 01 
exec SP_Insertar_Factura01 12,1,1

--Insertando datos para el detalle de factura
exec SP_Insertar_Detalle_Factura 2,53,1
exec SP_Insertar_Detalle_Factura 2,54,1
exec SP_Insertar_Detalle_Factura 2,83,2
exec SP_Insertar_Detalle_Factura 2,88,2

--Insertando datos de facturacion parte 02
exec SP_Insertar_Factura02 2


--Insertando Datos para  de prueba numero 2
-------------------------------------------------------
--Insertando datos para la factura parte 01 
exec SP_Insertar_Factura01 20,2,1

--Insertando datos para el detalle de factura
exec SP_Insertar_Detalle_Factura 3,50,1
exec SP_Insertar_Detalle_Factura 3,76,1

--Insertando datos de facturacion parte 02
exec SP_Insertar_Factura02 3


select * from Factura_Venta
select * from Detalle_Factura_Venta
select * from Producto
select * from Cliente
select * from Modo_Pago