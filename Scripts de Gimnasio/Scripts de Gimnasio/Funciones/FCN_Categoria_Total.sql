CREATE FUNCTION FCN_Categoria_Total
(
)
RETURNS varchar(10)
AS
BEGIN
	
	return 'ACUTALMENTE EXISTE ' + (select count(*) from Categoria) + ' CATEGORIAS'
END
GO

