
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
	set nocount on
	if not exists (select top 1 Nombre from Producto where Nombre = @nombre)
		begin
			insert into Producto (Nombre,[Precio Venta],[Precio Compra],[Fecha Vencimiento],Stock,ID_Categoria,Fecha_Compra,Descripcion_Producto)
			values (ltrim(rtrim(upper(@nombre))),(@precio_compra + (@precio_compra*0.20)),@precio_compra,@fecha_vencimiento,@stock,@id_categoria,@fecha_compra,ltrim(rtrim(upper(@descp))))
			PRINT 'PRODUCTO REGISTRADO'
		end
	else
		begin
			print 'EL PRODUCTO YA EXISTE'
		end
	end
select * from Producto
select * from Categoria

---Insertando valores a la tabla producto
exec SP_Insertar_Producto 'hammer gel',300,'15/09/2022',25,1,'10/03/2021'
exec SP_Insertar_Producto 'hammer gel con cafeina',350,'15/09/2022',20,1,'10/03/2021','hidratos de carbono complejos y los ingredientes naturales. El resultado es una fuente de energía de diferentes sabores, que digiere más fácil que cualquier otro gel energizante.'

exec SP_Insertar_Producto 'Hammer Vegan Protein',400,'15/09/2022',15,1,'10/03/2021',
'Con cinco fuentes de proteína 100% de origen vegetal, incluyendo proteínas de guisante, proteína de arroz integral orgánico, espirulina orgánica, Chlorella orgánica, y alfalfa'

exec SP_Insertar_Producto 'Hammer bar',150,'15/12/2022',15,1,'11/03/2021',
'Las Barras nutritivas de Hammer están compuestas con ingrediente sanos, libres de modificaciones genéticas produciendo ingredientes orgánicos sin azúcares refinados añadidos. Además, están aprobadas por la USDA, son productos sin lácteos y certificadas como alimentos vegetarianos.'

exec SP_Insertar_Producto 'Premium Insurance Caps',560,'15/09/2023',5,1,'10/04/2021',
'Multivitamínico fuerte/suplemento mineral
Apoya una salud óptima
Aumenta la energía durante el día
Apoya la función inmune'

exec SP_Insertar_Producto 'Race Caps Supreme',500,'15/09/2023',10,1,'12/03/2021',
'Fuerte potenciador muscular
Prolonga la resistencia
Aumenta la energía
Apoya la salud cognitiva y cardiovascular'

exec SP_Insertar_Producto 'Anti-Fatigue Caps',530,'15/12/2022',12,1,'11/05/2021',
'Combina dos nutrientes de captación del amoniaco
Prolonga la resistencia en los entrenamientos y las carreras de larga distancia
Ayuda a la producción de energía
Ayuda a prevenir los calambres musculares
Contrarresta la fatiga cotidiana'

exec SP_Insertar_Producto 'Fully Charged',430,'15/12/2022',25,1,'11/05/2021',
'Aumenta la energía y el rendimiento
Focalización mental
Minimiza el dolor muscular'


select * from Producto
select * from Proveedor

update Producto set Marca = 'HAMMER' where ID_Categoria = 1



update Producto
	set Descripcion_Producto = Upper('hidratos de carbono complejos y los ingredientes naturales. El resultado es una fuente de energía de diferentes sabores, que digiere más fácil que cualquier otro gel energizante.')
	where ID_Producto = 3

/*


declare @fecha date
set @fecha = null
print @fecha
*/