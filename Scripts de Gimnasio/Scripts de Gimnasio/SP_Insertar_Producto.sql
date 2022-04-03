
select * from Categoria
select * from Producto
SP_Help Producto

alter proc SP_Insertar_Producto
@nombre nvarchar(100),
@precio_compra money,
@fecha_vencimiento date,
@stock int,
@id_categoria int,
@fecha_compra date,
@descp varchar(200)
as
	begin
	if not exists (select top 1 Nombre from Producto where Nombre = @nombre)
		begin
			insert into Producto (Nombre,[Precio Venta],[Precio Compra],[Fecha Vencimiento],Stock,ID_Categoria,Fecha_Compra,Descripcion_Producto)
			values (ltrim(rtrim(upper(@nombre))),(@precio_compra + (@precio_compra*0.20)),@precio_compra,@fecha_vencimiento,@stock,@id_categoria,@fecha_compra,ltrim(rtrim(upper(@descp))))
		end
	else
		begin
			print 'EL PRODUCTO YA EXISTE'
		end
	end


select * from Producto
select * from Categoria
exec SP_Insertar_Producto 'hammer gel',300,'15/09/2022',25,1,'10/03/2021'
exec SP_Insertar_Producto 'hammer gel con cafeina',350,'15/09/2022',20,1,'10/03/2021','hidratos de carbono complejos y los ingredientes naturales. El resultado es una fuente de energía de diferentes sabores, que digiere más fácil que cualquier otro gel energizante.'

exec SP_Insertar_Producto 'Hammer Vegan Protein',400,'15/09/2022',15,1,'10/03/2021',
'Con cinco fuentes de proteína 100% de origen vegetal, incluyendo proteínas de guisante, proteína de arroz integral orgánico, espirulina orgánica, Chlorella orgánica, y alfalfa'








select * from Producto
select * from Proveedor



update Producto
	set Descripcion_Producto = Upper('hidratos de carbono complejos y los ingredientes naturales. El resultado es una fuente de energía de diferentes sabores, que digiere más fácil que cualquier otro gel energizante.')
	where ID_Producto = 3

/*


declare @fecha date
set @fecha = null
print @fecha
*/