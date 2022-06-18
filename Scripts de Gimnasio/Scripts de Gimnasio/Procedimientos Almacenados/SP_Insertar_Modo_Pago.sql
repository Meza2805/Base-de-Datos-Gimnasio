CREATE PROC SP_Insertar_Modo_Pago
@id int,
@Descripcion varchar(25)
as
begin
	if not exists (select ID_MPago from Modo_Pago where ID_MPago = @id)
		begin
			insert into Modo_Pago (ID_MPago,Descripcion) values (@id,@Descripcion)
		end
	else
		begin
			print 'EL MODO DE PAGO YA EXISTE EN LA BASE DE DATOS'
		end
end



SELECT * FROM Modo_Pago
SP_HELP Modo_Pago