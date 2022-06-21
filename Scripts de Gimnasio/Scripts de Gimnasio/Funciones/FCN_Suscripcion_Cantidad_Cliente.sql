
alter FUNCTION FCN_Suscripcion_Cantidad_Cliente
(
	@Cedula char(16)
)
RETURNS varchar(100)
AS
BEGIN
	declare @cantidad varchar(5)
	declare @mensaje varchar(100)
	if exists (select ID_Cliente from suscripcion where ID_Cliente = @Cedula and Finalizada = 0)
		begin
			set @cantidad =  ( select convert(varchar(5), (SELECT COUNT (*)  FROM suscripcion where Finalizada = 1 AND ID_Cliente=@Cedula group by ID_Cliente)))
			set @mensaje ='EL CLIENTE TIENE UN TOTAL DE '+ @cantidad + ' SUSCRIPCIONES REGISTRADAS' 
		end
	else
		begin
			set @mensaje ='EL CLIENTE TNO TIENE SUSCRIPCIONES REGISTRADAS'
		end
	RETURN @mensaje 
END
GO

