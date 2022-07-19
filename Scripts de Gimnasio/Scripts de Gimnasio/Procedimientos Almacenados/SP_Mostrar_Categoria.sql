alter proc SP_Mostrar_Categoria
as
begin
select ID_Categoria AS [CODIGO], Descripcion AS CATEGORIA from Categoria
end