alter proc SP_Buscar_Categoria
@id int
as
begin
select Nombre from Marca where ID_Categoria = @id order by Nombre

end

select * from ca

exec SP_Buscar_Categoria 'SUPLEMENTOS DEPORTIVOS'

select * from Categoria
select * from Marca