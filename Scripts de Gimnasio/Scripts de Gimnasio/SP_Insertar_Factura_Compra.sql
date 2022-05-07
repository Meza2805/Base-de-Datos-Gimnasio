--primera parte para inserta Factura de Compra de Productos
sp_help Factura_Compra
alter proc SP_Insertar_Factura_Compra_01
@Cedula_Empleado char(16),
@id_proveedor int,
@id_Mpago int
as
begin
set nocount on
	insert into Factura_Compra(Fecha,ID_Empleado,ID_Proveedor,ID_MPago)
		values (GETDATE(),@Cedula_Empleado,@id_proveedor,@id_Mpago)
		print 'DATOS GENERALES DE FACTURA DE COMPRA DE PRODCUTOS INSERTADOS'
end
------------------------------------------------------------------------
--------Fin de Procedimiento Almacenado---------------

select * from Factura_Compra with (nolock)

--segunda parte para insertar factura (detalle factura)
alter proc SP_Insertar_Detalle_Factura_Compra
@id_factura int,
@id_producto int,
@Costo money,
@cantidad_producto int
as
begin
	set nocount on
		insert into Detalle_Factura_Compra(ID_Factura_Compra,ID_Producto,Costo,Cant_Producto)
		values (@id_factura,@id_producto,@Costo,@cantidad_producto)
		print 'DETALLE REGISTRADO CORRECTAMENTE'
		update Producto set Stock = Stock + @cantidad_producto,
							Precio = (@Costo * 0.30) + @Costo
				where ID_Producto = @id_producto
end
------------------------------------------------------------------------------------------

--SEGUNDA PARTE PARA INGRESAR LA FACTURA DE COMPRA
alter SP_Insertar_Factura_Compra_02
@id_factura int
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
		select ID_Producto,Cant_Producto,costo,(Costo *  Cant_Producto) FROM Detalle_Factura_Compra 

		--Insertando valores en la tabla factura
		set @subtotal =  (select sum(total) from @detalle)
		set @iva =  @subtotal * 0.15
		set @total = @subtotal + @iva 
			
		update Factura_Compra set SubTotal = @subtotal, IVA = @iva , Total = @total 
			where ID_Factura  = @id_factura
		print 'FACTURA REGISTRADA CORRECTAMENTE'
	end



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


47,49,49

update Producto set Precio = 0, Stock = 0 where ID_Producto <> 47 and ID_Producto <> 48 and ID_Producto <> 49