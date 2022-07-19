declare @id int, @nombre varchar(35), @precio decimal(12,2),
@stock int, @descripcion varchar(35)

--creando tabla temporal
create table #productos
(
	id int, nombre varchar(35),precio decimal(12,2),sotck int, descripcion varchar (35)
)

declare CurProducto Cursor for
select ID_Producto,Nombre,Precio,Stock,Descripcion_Producto 
from Producto order by Stock


open CurProducto
fetch next from CurProducto
into @id,@nombre,@precio,@stock,@descripcion
while (@@FETCH_STATUS = 0)
begin
	insert into #productos (id,nombre,precio,sotck,descripcion)
	values (@id,@nombre,@precio,@stock,@descripcion)
end
close CurProducto
deallocate CurProducto