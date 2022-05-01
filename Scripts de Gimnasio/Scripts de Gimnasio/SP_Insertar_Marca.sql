
 ALTER table Marca
 DROP column  Descripcion

 alter proc SP_Insertar_Marca
 @nombre varchar(40)
 as
 set nocount on
	begin
	if not exists (select top 1 Nombre from Marca where Nombre = @nombre)
		begin
		insert into Marca (Nombre)
		values (LTRIM(RTRIM(UPPER(@nombre))))
		print 'MARCA REGISTRADA'
		end
	end
---------------------------------------------------------------





 select Marca from Producto group by Marca
 select * from Marca
 SP_Help Marca


exec SP_Insertar_Marca 'ADIDAS'
exec SP_Insertar_Marca 'ADy'
exec SP_Insertar_Marca 'BCCA'
exec SP_Insertar_Marca 'EVERLAST'
exec SP_Insertar_Marca 'FORZA'
exec SP_Insertar_Marca 'GALAM'
exec SP_Insertar_Marca 'HAMMER'
exec SP_Insertar_Marca 'JOMA'
exec SP_Insertar_Marca 'K6'
exec SP_Insertar_Marca 'NIKE'
exec SP_Insertar_Marca 'PUMA'
exec SP_Insertar_Marca 'RUNIC'
exec SP_Insertar_Marca 'UMBRO'
exec SP_Insertar_Marca 'WILSON'
exec SP_Insertar_Marca 'pepsi'
exec SP_Insertar_Marca 'coca-cola'
exec SP_Insertar_Marca 'productos maravilla'


select * from Producto
select * from Marca

update Producto set ID_Marca = 7 where ID_Producto= 13
update Producto set ID_Marca = 7 where ID_Producto= 14
update Producto set ID_Marca = 7 where ID_Producto= 15
update Producto set ID_Marca = 7 where ID_Producto= 16

update Producto set ID_Marca = 5 where ID_Producto= 17
update Producto set ID_Marca = 5 where ID_Producto= 18
update Producto set ID_Marca = 5 where ID_Producto= 19

update Producto set ID_Marca = 6 where ID_Producto= 20
update Producto set ID_Marca = 6 where ID_Producto= 21

update Producto set Stock = 15 where ID_Producto = 42

update Producto set ID_Marca = 11 where ID_Producto= 22
update Producto set ID_Marca = 8 where ID_Producto= 23


update Producto set ID_Marca = 5 where ID_Producto= 43

select * from Producto
select * from Marca

update Producto set ID_Marca = 8 where ID_Producto= 24
update Producto set ID_Marca = 8 where ID_Producto= 25
update Producto set ID_Marca = 10 where ID_Producto= 26
update Producto set ID_Marca = 4 where ID_Producto= 27
update Producto set ID_Marca = 14 where ID_Producto= 37
update Producto set ID_Marca = 14 where ID_Producto= 28

update Producto set ID_Marca = 9 where ID_Producto= 38
update Producto set ID_Marca = 11 where ID_Producto= 39

select * from Producto
select * from Marca


update Producto set ID_Marca = 8 where ID_Producto= 29
update Producto set ID_Marca = 9 where ID_Producto= 30
update Producto set ID_Marca = 9 where ID_Producto= 31
update Producto set ID_Marca = 9 where ID_Producto= 32
update Producto set ID_Marca = 4 where ID_Producto= 33

update Producto set ID_Marca = 4 where ID_Producto= 34
update Producto set ID_Marca = 4 where ID_Producto= 35
update Producto set ID_Marca = 9 where ID_Producto= 36

update Producto set ID_Marca = 9 where ID_Producto= 40
update Producto set ID_Marca = 9 where ID_Producto= 41
update Producto set ID_Marca = 9 where ID_Producto= 42