--primera parte para inserta Factura de Compra de Productos
sp_help Factura_Compra
select * from Empleado
select * from Proveedor
select * from Modo_Pago
exec SP_Insertar_Factura_Compra_01 '001-120998-0012S','COCA-COLA FEMSA','EFECTIVO',0

alter proc SP_Insertar_Factura_Compra_01
@Cedula_Empleado char(16),
@proveedor varchar(35),
@Mpago varchar(35),
@id_factura int out
as
begin

declare @id_proveedor int 
declare @id_Mpago int
set @id_proveedor = (select ID_Proveedor from Proveedor where Nombre = @proveedor)
set @id_Mpago = (select ID_MPago from Modo_Pago  where Descripcion =  @Mpago )

set nocount on
	insert into Factura_Compra(Fecha,ID_Empleado,ID_Proveedor,ID_MPago)
		values (GETDATE(),@Cedula_Empleado,@id_proveedor,@id_Mpago)
		set @id_factura = @@IDENTITY
		select @id_factura
end
------------------------------------------------------------------------
--------Fin de Procedimiento Almacenado---------------

select * from Factura_Compra with (nolock)
select * from Empleado
select * from Proveedor
select * from Modo_Pago
select * from Factura_Compra 
select * from Producto


SP_Insertar_Detalle_Factura_Compra 17,47,1000,2
SP_Insertar_Detalle_Factura_Compra 17,48,1500,3
--segunda parte para insertar factura (detalle factura)
alter proc SP_Insertar_Detalle_Factura_Compra
@id_factura int,
@id_producto int,
@Costo money,
@cantidad_producto int,
@salida varchar(50) out
as
begin
	set nocount on
		insert into Detalle_Factura_Compra(ID_Factura_Compra,ID_Producto,Costo,Cant_Producto)
		values (@id_factura,@id_producto,@Costo,@cantidad_producto)
		set @salida = 'DETALLE REGISTRADO CORRECTAMENTE'
		update Producto set Stock = Stock + @cantidad_producto,
							Precio = (@Costo * 0.30) + @Costo
				where ID_Producto = @id_producto
		select @salida
end
------------------------------------------------------------------------------------------

--SEGUNDA PARTE PARA INGRESAR LA FACTURA DE COMPRA
exec SP_Insertar_Factura_Compra_02 17
alter proc SP_Insertar_Factura_Compra_02
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
		declare @detalle table (id int identity (1,1), codigo_producto int,cantidad int,costo money,total money)
		insert into @detalle (codigo_producto,cantidad,costo,total)
		select ID_Producto,Cant_Producto,costo,(Costo *  Cant_Producto) FROM Detalle_Factura_Compra where ID_Factura_Compra =@id_factura

		--Insertando valores en la tabla factura
		set @subtotal =  (select sum(total) from @detalle)
		set @iva =  @subtotal * 0.15
		set @total = @subtotal + @iva 
			
		update Factura_Compra set SubTotal = @subtotal, IVA = @iva , Total = @total 
			where ID_Factura  = @id_factura
	set @salida = 'FACTURA REGISTRADA CORRECTAMENTE'
	select @salida
	end

---------------------------------------------------------------------------------------------------------------------------------------------------------




select * from Factura_Compra
select * from Detalle_Factura_Compra


delete from Factura_Compra
select *from Detalle_Factura_Compra
















select * from Producto

--Insertando Datos en las tablas de Facturacion de Compra
select * from Empleado with (nolock)
select * from Proveedor with (nolock)
select * from Modo_Pago with (nolock)
select * from Producto with (nolock)
select * from Factura_Compra with (nolock)
select * from Detalle_Factura_Compra with (nolock)




exec SP_Insertar_Factura_Compra_01 2,2,3

exec SP_Insertar_Detalle_Factura_Compra 4,47,25,2
exec SP_Insertar_Detalle_Factura_Compra 4,49,20,3

exec SP_Insertar_Factura_Compra_02 4



--Vista para saber la relacion entre producto y proveedor
select P.ID_Producto, P.Nombre,PP.ID_Proveedor, PP.Nombre as PROOVEDOR from Producto P inner join Detalle_Factura_Compra DFC
		on P.ID_Producto = DFC.ID_Producto INNER JOIN Factura_Compra FC
		on DFC.ID_Factura_Compra =  FC.ID_Factura INNER JOIN Proveedor PP 
		ON FC.ID_Proveedor =  PP.ID_Proveedor group by P.ID_Producto, P.Nombre,PP.ID_Proveedor, PP.Nombre

select * from Factura_Compra
select * from Empleado
select * from Modo_Pago
select * from Proveedor
select * from Producto 
select * from Detalle_Factura_Compra

--Insertando datos de facturacion de compra de productos
--Datos Generales
exec SP_Insertar_Factura_Compra_01 '001-150497-0074S',4,3
--Detalle de Facturacion
exec SP_Insertar_Detalle_Factura_Compra 6,50,32,25
exec SP_Insertar_Detalle_Factura_Compra 6,51,20,25
exec SP_Insertar_Detalle_Factura_Compra 6,52,25,15
exec SP_Insertar_Detalle_Factura_Compra 6,54,26,25

--Total
exec SP_Insertar_Factura_Compra_02 6


--Insertando datos de facturacion de compra de productos
--Datos Generales
exec SP_Insertar_Factura_Compra_01 '001-150497-0074S',2,1
--Detalle de Facturacion
exec SP_Insertar_Detalle_Factura_Compra 5,47,32,25
exec SP_Insertar_Detalle_Factura_Compra 5,48,20,25
exec SP_Insertar_Detalle_Factura_Compra 5,49,25,15
exec SP_Insertar_Detalle_Factura_Compra 5,50,26,25
exec SP_Insertar_Detalle_Factura_Compra 5,48,20,25
--Total
exec SP_Insertar_Factura_Compra_02 5


--Insertando datos de facturacion de compra de productos
--Datos Generales
exec SP_Insertar_Factura_Compra_01 '001-150497-0074S',3,1
--Detalle de Facturacion
exec SP_Insertar_Detalle_Factura_Compra 7,53,25,10
--Total
exec SP_Insertar_Factura_Compra_02 7



--Insertando datos de facturacion de compra de productos
--Datos Generales
exec SP_Insertar_Factura_Compra_01 '001-150497-0074S',4,1
--Detalle de Facturacion
exec SP_Insertar_Detalle_Factura_Compra 8,77,15,18
--Total
exec SP_Insertar_Factura_Compra_02 8

--Insertando datos de facturacion de compra de productos
--Datos Generales
exec SP_Insertar_Factura_Compra_01 '001-180491-8974S',4,1
--Detalle de Facturacion
exec SP_Insertar_Detalle_Factura_Compra 9,55,10,18
exec SP_Insertar_Detalle_Factura_Compra 9,56,15,10
exec SP_Insertar_Detalle_Factura_Compra 9,57,15,10
exec SP_Insertar_Detalle_Factura_Compra 9,58,10,10
exec SP_Insertar_Detalle_Factura_Compra 9,59,15,5
exec SP_Insertar_Detalle_Factura_Compra 9,60,10,10
exec SP_Insertar_Detalle_Factura_Compra 9,61,12,10
exec SP_Insertar_Detalle_Factura_Compra 9,62,15,10
--Total
exec SP_Insertar_Factura_Compra_02 9


--Insertando datos de facturacion de compra de productos
--Datos Generales
exec SP_Insertar_Factura_Compra_01 '001-150497-0074S',4,1
--Detalle de Facturacion
exec SP_Insertar_Detalle_Factura_Compra 8,77,15,18
--Total
exec SP_Insertar_Factura_Compra_02 8

--Insertando datos de facturacion de compra de productos
--Datos Generales
exec SP_Insertar_Factura_Compra_01 '001-180491-8974S',4,1
--Detalle de Facturacion
exec SP_Insertar_Detalle_Factura_Compra 10,63,10,18
exec SP_Insertar_Detalle_Factura_Compra 10,64,10,10
exec SP_Insertar_Detalle_Factura_Compra 10,65,10,10
exec SP_Insertar_Detalle_Factura_Compra 10,66,10,6
exec SP_Insertar_Detalle_Factura_Compra 10,67,10,5
exec SP_Insertar_Detalle_Factura_Compra 10,68,10,10
exec SP_Insertar_Detalle_Factura_Compra 10,69,12,8
exec SP_Insertar_Detalle_Factura_Compra 10,70,15,10
exec SP_Insertar_Detalle_Factura_Compra 10,71,15,4
exec SP_Insertar_Detalle_Factura_Compra 10,72,15,10
exec SP_Insertar_Detalle_Factura_Compra 10,73,10,3
exec SP_Insertar_Detalle_Factura_Compra 10,74,15,9

--Total
exec SP_Insertar_Factura_Compra_02 10


--Insertando datos de facturacion de compra de productos
--Datos Generales
exec SP_Insertar_Factura_Compra_01 '001-150497-0074S',4,1
--Detalle de Facturacion
exec SP_Insertar_Detalle_Factura_Compra 11,75,15,6
exec SP_Insertar_Detalle_Factura_Compra 11,76,15,6
--Total
exec SP_Insertar_Factura_Compra_02 11

--Insertando datos de facturacion de compra de productos
--Datos Generales
exec SP_Insertar_Factura_Compra_01 '001-150497-0074S',1002,1
--Detalle de Facturacion
exec SP_Insertar_Detalle_Factura_Compra 14,83,0.5,12
exec SP_Insertar_Detalle_Factura_Compra 14,84,0.5,12
exec SP_Insertar_Detalle_Factura_Compra 14,85,0.5,12
exec SP_Insertar_Detalle_Factura_Compra 14,86,0.5,12
exec SP_Insertar_Detalle_Factura_Compra 14,87,0.5,12
exec SP_Insertar_Detalle_Factura_Compra 14,88,0.5,12



--Total
exec SP_Insertar_Factura_Compra_02 14


select * from Proveedor
select * from Producto 