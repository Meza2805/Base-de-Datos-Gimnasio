create proc SP_Eliminar_Modo_Pago
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
			delete  from Modo_Pago
			where ID_MPago = @id
		end
end
