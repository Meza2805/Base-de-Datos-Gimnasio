alter FUNCTION FCN_Suscripcion_Cliente_Mayor_Sucripciones
(
	
)
RETURNS varchar(100)
AS
BEGIN
	declare @Cedula char(16)
	declare @cantidad varchar(5)
	declare @mensaje varchar(100)

			set @Cedula = (SELECT  top 1  ID_Cliente FROM suscripcion where Finalizada = 1 group by ID_Cliente order by count(*) desc)
			set @cantidad =  ( select convert(varchar(5), (SELECT  top 1  count(*) FROM suscripcion where Finalizada = 1 group by ID_Cliente order by count(*) desc)))
			set @mensaje = 'EL CLIENTE CON EL NUMERO MAYO DE SUSCRIPCIONES CONTRATADAS ES ' + @Cedula + ' CON UN HISTORIAL DE '+ @cantidad+ ' SUSCRIPCIONES.'  
		
	RETURN @mensaje 
END

select dbo.FCN_Suscripcion_Cliente_Mayor_Sucripciones()