select * from Detalle_Factura where ID_Factura = 1
select * from Factura
select * from Detalle_Factura

declare @detalle table (id int identity (1,1), codigo_producto int,cantidad int,precio_producto money,total money)
		insert into @detalle (codigo_producto,DF.cantidad,precio_producto,total)
		select DF.ID_Producto,DF.Cant_Producto, P.[Precio Venta],(P.[Precio Venta] * DF.Cant_Producto) from Detalle_Factura DF inner join Producto P
		on p.ID_Producto=df.ID_Producto where ID_Factura = 1

select * from @detalle
select * from Producto

	
		





declare @detalle2 table (codigo int,precio money)
declare @j int
set @j=1
declare @limite int
set @limite = (select  count(*) from @detalle)
--select * from @detalle
--select  top (@j) codigo from @detalle order by codigo
--select  top (@j) precio from @detalle order by codigo
--insert into @detalle2 (codigo,precio)
	--values ((select  top (@j) codigo from @detalle order by codigo),(select  top (@j) precio from @detalle order by codigo) )
--select * from @detalle2


while @j<= @limite 
	begin
	set nocount on
	insert into @detalle2 (codigo,precio)
	values ((select  top (@j) codigo from @detalle order by codigo),(select  top (@j) precio from @detalle order by codigo) )
	set @j  = @j+1
	end

select * from @detalle
select * from @detalle2