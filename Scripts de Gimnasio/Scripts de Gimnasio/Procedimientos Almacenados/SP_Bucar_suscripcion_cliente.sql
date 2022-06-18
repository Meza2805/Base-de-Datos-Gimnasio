create proc SP_Bucar_suscripcion_cliente
@id_cliente char(16)
as
begin
	if exists(select ID_Cliente from suscripcion where ID_Cliente = @id_cliente and Finalizada =0)
	begin
		select * from suscripcion s 
		inner join Membresia m on s.ID_Membresia = m.ID_Membresia

	end
end