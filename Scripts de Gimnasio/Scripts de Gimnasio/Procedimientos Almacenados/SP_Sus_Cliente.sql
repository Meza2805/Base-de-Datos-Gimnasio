alter proc SP_Sus_Cliente
@ID_Cliente varchar(16)
as begin
if exists(select ID_Cliente from suscripcion where ID_Cliente = @id_cliente)
	begin
		select Descripcion as MEMBRESIA,Fecha_Contratacion AS [FECHA CONTRATACION],Fecha_Expiracion AS [FECHA VENCIMIENTO] from suscripcion s 
		inner join Membresia m on s.ID_Membresia = m.ID_Membresia  where ID_Cliente = @ID_Cliente  and Finalizada =0
end

end


select * from suscripcion  
exec SP_Sus_Cliente '449-160693-2301N'