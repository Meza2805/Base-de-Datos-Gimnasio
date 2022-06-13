create proc SP_Busqueda_Modo_Pago
@id int,
@descripcion varchar(25)
as
begin
	if not exists (select ID_MPago from Modo_Pago where ID_MPago=@id)
		begin
			print 'EL MODO DE PAGO NO EXISTE EN LA BASE DE DATOS'
		end
	else
		begin
			select ID_MPago, Descripcion from Modo_Pago
			where ID_MPago = @id
		end
end
