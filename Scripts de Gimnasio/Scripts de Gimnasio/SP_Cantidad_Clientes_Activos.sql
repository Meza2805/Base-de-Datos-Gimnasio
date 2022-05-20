create proc SP_Cantidad_Cliente
@inactivo int out,
@activo int out,
@total int out
as 
	begin
	set @inactivo = (select count(Cedula) from Cliente WHERE ID_Estado = 'I')
	set @activo =  (select count(Cedula) from Cliente WHERE ID_Estado = 'A')
	set @total = (select count(Cedula) from Cliente )
	select @inactivo,@activo,@total
	end
