--primera parte para inserta Factura
select * from Empleado
select * from Cliente
select * from Modo_Pago

exec SP_Insertar_Factura01 '001-010596-0001Q','445-080991-0002R','EFECTIVO',0 --18


alter proc SP_Insertar_Factura01
@Cedula_Cliente char(16),
@Cedula_Empleado char(16),
@Mpago varchar(35),
@id_factura int out
as
begin
declare @id_Mpago int
set @id_Mpago = (select ID_MPago from Modo_Pago where Descripcion = @Mpago)

set nocount on
	insert into Factura_Venta(Fecha,ID_Cliente,ID_Empleado,ID_MPago)
		values (GETDATE(),@Cedula_Cliente,@Cedula_Empleado,@id_Mpago)
		set @id_factura = @@IDENTITY
		select @id_factura
end

select * from Modo_Pago

-----------------------------------------------------------------------------
select * from Producto
exec SP_Insertar_Detalle_Factura 18,46,2,0

--segunda parte para insertar factura (detalle factura)
ALTER proc SP_Insertar_Detalle_Factura
@id_factura int,
@id_producto int,
@cantidad_producto int,
@salida varchar(50) out
as
begin
	set nocount on
	--Consultamos si el Stock del producto es mayor a la cantidad de productos de la factura
	if ((select top 1 Stock from Producto where ID_Producto = @id_producto)>= @cantidad_producto) 
	begin
		insert into Detalle_Factura_Venta(ID_Factura,ID_Producto,Cant_Producto)
		values (@id_factura,@id_producto,@cantidad_producto)
		set @salida = 'DETALLE REGISTRADO CORRECTAMENTE'
		--Actualizamos el Stock de la tabla producto, restando la cantidad ingresada en detalle_factura
		update Producto set Stock = Stock - @cantidad_producto where ID_Producto = @id_producto
	end
	else
	begin
		set @salida = 'LA CANTIDAD SOLICITADA DE PRODUCTO ES MAYOR QUE EL STOCK DISPONIBLE'
	end
end

---------------------------------------------------------------------------------------
SP_Insertar_Factura02 18,0
--Tercera parte para insertar Factura
alter proc SP_Insertar_Factura02
@id_factura int,
@salida varchar(50) out
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
		select DF.ID_Producto,DF.Cant_Producto, P.Precio,(P.Precio * DF.Cant_Producto) from Detalle_Factura_Venta 
		DF inner join Producto P
		on p.ID_Producto=df.ID_Producto where ID_Factura = @id_factura

		--Insertando valores en la tabla factura
		set @subtotal =  (select sum(total) from @detalle)
		set @iva =  @subtotal * 0.15
		set @total = @subtotal + @iva 
			
		update Factura_Venta set SubTotal = @subtotal, IVA = @iva , Total = @total 
			where ID_Factura  = @id_factura
		set @salida = 'FACTURA REGISTRADA CORRECTAMENTE'
		select @salida 
	end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select * from Registo_Asistencia


select * from Factura_Venta
select * from Detalle_Factura_Venta where ID_Factura = 18
select * from Producto














select * from Factura
--select * from Producto
select * from Detalle_Factura

exec SP_Insertar_Factura02 1

select * from Factura_Venta
select *   from Detalle_Factura_Venta
select * from Producto where Stock <> 0
select * from Cliente with (nolock)
select * from Modo_Pago
select * from Empleado
--Insertando Datos para Facturacion
-------------------------------------------------------
--Insertando datos para la factura parte 01 
exec SP_Insertar_Factura01 '448-150493-0001V','001-180491-8974S',2

--Insertando datos para el detalle de factura
exec SP_Insertar_Detalle_Factura 8,47,1


--Insertando datos de facturacion parte 02
exec SP_Insertar_Factura02 8

--Insertando Datos para Facturacion
-------------------------------------------------------
--Insertando datos para la factura parte 02 
exec SP_Insertar_Factura01 30,2,3

--Insertando datos para el detalle de factura
exec SP_Insertar_Detalle_Factura 5,49,2


--Insertando datos de facturacion parte 02
exec SP_Insertar_Factura02 5


select * from Factura_Venta
select * from Detalle_Factura_Venta
select * from Producto
select * from Cliente
select * from Modo_Pago

--Insertando Datos para Facturacion
-------------------------------------------------------
--Insertando datos para la factura parte 01 
exec SP_Insertar_Factura01 12,1,1

--Insertando datos para el detalle de factura
exec SP_Insertar_Detalle_Factura 4,47,1


--Insertando datos de facturacion parte 02
exec SP_Insertar_Factura02 4

--Insertando Datos para Facturacion
-------------------------------------------------------
--Insertando datos para la factura parte 02 
exec SP_Insertar_Factura01 30,2,3

--Insertando datos para el detalle de factura
exec SP_Insertar_Detalle_Factura 5,49,2


--Insertando datos de facturacion parte 02
exec SP_Insertar_Factura02 5


select * from Cliente
select * from Empleado
select * from Modo_Pago
select * from Producto
select * from Factura_Venta
select * from Detalle_Factura_Venta

exec SP_Insertar_Factura01 '449-010920-0100A','001-180491-8974S',1
exec SP_Insertar_Detalle_Factura 16,88,1
exec SP_Insertar_Detalle_Factura 16,87,2


exec SP_Insertar_Factura02 16
