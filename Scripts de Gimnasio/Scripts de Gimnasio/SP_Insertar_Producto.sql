
select * from Categoria
select * from Producto
SP_Help Producto

alter proc SP_Insertar_Producto
@nombre nvarchar(100),
@precio_compra money,
@fecha_vencimiento date,
@stock int,
@id_categoria int,
--@fecha_compra date,
@descp varchar(200),
@marca varchar(50)
as
	begin
	set nocount on
	if @id_categoria = 2 or @id_categoria = 4
		begin
			set @fecha_vencimiento =  NULL
		end
	if not exists (select top 1 Nombre from Producto where Nombre = @nombre and Marca = @marca)
		begin
			insert into Producto (Nombre,[Precio Venta],[Precio Compra],[Fecha Vencimiento],Stock,ID_Categoria,Fecha_Compra,Descripcion_Producto,Marca)
			values (ltrim(rtrim(upper(@nombre))),(@precio_compra + (@precio_compra*0.20)),@precio_compra,@fecha_vencimiento,@stock,@id_categoria,GETDATE(),ltrim(rtrim(upper(@descp))),LTRIM(rtrim(
					upper(@marca))))
			PRINT 'PRODUCTO REGISTRADO'
		end
	else
		begin
			print 'EL PRODUCTO YA EXISTE'
		end
	end
select * from Producto
delete from Producto
select * from Categoria

---Insertando valores a la tabla producto
exec SP_Insertar_Producto 'hammer gel con cafeina',25,'15/09/2022',20,1,
'hidratos de carbono complejos y los ingredientes naturales. El resultado es una fuente de energía de diferentes sabores, que digiere más fácil que cualquier otro gel energizante.','hammer'

exec SP_Insertar_Producto 'Hammer Vegan Protein',20,'15/09/2022',15,1,
'Con cinco fuentes de proteína 100% de origen vegetal, incluyendo proteínas de guisante, proteína de arroz integral orgánico, espirulina orgánica, Chlorella orgánica, y alfalfa','hammer'

exec SP_Insertar_Producto 'Hammer bar',18,'15/12/2022',15,1,
'Las Barras nutritivas de Hammer están compuestas con ingrediente sanos, libres de modificaciones genéticas produciendo ingredientes 
sin azúcares refinados añadidos. Además, están aprobadas por la USDA, son productos sin lácteos y certificadas como alimentos vegetarianos.','hammer'

exec SP_Insertar_Producto 'Premium Insurance Caps',25,'15/09/2023',5,1,
'Multivitamínico fuerte/suplemento mineral
Apoya una salud óptima
Aumenta la energía durante el día
Apoya la función inmune','hammer'

exec SP_Insertar_Producto 'Race Caps Supreme',20,'15/09/2023',10,1,
'Fuerte potenciador muscular
Prolonga la resistencia
Aumenta la energía
Apoya la salud cognitiva y cardiovascular','hammer'

exec SP_Insertar_Producto 'Anti-Fatigue Caps',18,'15/12/2022',12,1,
'Combina dos nutrientes de captación del amoniaco
Prolonga la resistencia en los entrenamientos y las carreras de larga distancia
Ayuda a la producción de energía
Ayuda a prevenir los calambres musculares
Contrarresta la fatiga cotidiana','hammer'

exec SP_Insertar_Producto 'Fully Charged',24,'15/12/2022',25,1,
'Aumenta la energía y el rendimiento
Focalización mental
Minimiza el dolor muscular','hammer'


exec SP_Insertar_Producto 'Creatina monohidratada',30,'15/12/2022',25,1,
'suplementación con creatina ayudará a realizar más esfuerzos (más repeticiones, por ejemplo, algo que en consecuencia 
aumentará el rendimiento y la masa muscular','hammer'

exec SP_Insertar_Producto 'aminoacidos',32,'15/12/2023',30,1,
'suplemente deportivo para ejercicios intensos','bcca'

exec SP_Insertar_Producto 'guateleta',24,'',30,2,
'accesorio deportivo para manos','ady'

exec SP_Insertar_Producto 'guateleta',25,'',30,2,
'accesorio deportivo para manos','everlast'

exec SP_Insertar_Producto 'colchoneta',32,'',30,2,
'colchoneta para ejercicios de yoga','everlast'

exec SP_Insertar_Producto 'bolso',20,'',30,2,
'bolso deportivo para dama','everlast'

exec SP_Insertar_Producto 'mochila',28,'',10,2,
'mochila de training order armur negro','everlast'

exec SP_Insertar_Producto 'guantes de box',28,'',10,2,
'guantes de boxeo proelite v2','everlast'

exec SP_Insertar_Producto 'balon de basket',10,'',5,2,
'balon de baloncesto nba drive','wilson'

exec SP_Insertar_Producto 'mochila deportiva',15,'',6,2,
'mochila deportiva color negra','nike'

exec SP_Insertar_Producto 'faja moldeadora',10,'',4,2,
'faja moldeadora para dama talla l','k6'

exec SP_Insertar_Producto 'calcetin yoga gris',10,'',4,2,
'calcetin para yoga color gris','galam'

exec SP_Insertar_Producto 'aro de pilates',16,'',4,2,
'aro de pilates pro training v8','everlast'

exec SP_Insertar_Producto 'espinillera',20,'',10,2,
'espinillera neominius talla s','umbro'

exec SP_Insertar_Producto 'muñequera',18,'',10,2,
'muñequera nivel 3 talla s','k6'

exec SP_Insertar_Producto 'cinturon',23,'',10,2,
'cinturon talla l','k6'

exec SP_Insertar_Producto 'faja de neopreno',20,'',9,2,
'faja moldeadora de neopreno','k6'

exec SP_Insertar_Producto 'balon de futbol',20,'',9,2,
'balon de futbol no. 6','runic'

exec SP_Insertar_Producto 'sujetador deportivo',30,'',12,4,
'sujetador talla s para dama','nike'

exec SP_Insertar_Producto 'sujetador deportivo',27,'',12,4,
'sujetador talla s para dama','puma'

exec SP_Insertar_Producto 'camisa fitness',20,'',12,4,
'sujetador talla m para dama','adidas'

exec SP_Insertar_Producto 'mallas fitnes',30,'',12,4,
'malla fitness para mujer','adidas'

exec SP_Insertar_Producto 'sudadera para hombre',40,'',0,4,
'sudadera para hombre talla l','joma'

exec SP_Insertar_Producto 'camisera de tirantes',20,'',17,4,
'camisera forza de tirantes','forza'

exec SP_Insertar_Producto 'camisera de tirantes',20,'',17,4,
'camisera forza de tirantes','forza'


delete from Producto
truncate table Producto
select * from Categoria
select * from Membresia

select * from Producto



select * from Producto
select * from Proveedor
select * from Categoria

update Producto set Nombre = 'GUANTELETA' where ID_Producto = 1



update Producto
	set Descripcion_Producto = Upper('hidratos de carbono complejos y los ingredientes naturales. El resultado es una fuente de energía de diferentes sabores, que digiere más fácil que cualquier otro gel energizante.')
	where ID_Producto = 3

/*


declare @fecha date
set @fecha = null
print @fecha
*/