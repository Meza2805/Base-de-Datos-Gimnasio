

--print dbo.FCN_fechatexto ('20190102')

CREATE FUNCTION FCN_FechaTexto (@fecha datetime)
RETURNS VARCHAR(60)
AS
BEGIN
declare @dia varchar(20)
declare @mes varchar(20)
declare @fechatexto varchar(50)
set @dia = (CASE WHEN datepart(dw,@fecha) = 1 THEN 'Domingo ' + convert(varchar(2),datepart(dd,@fecha))
				WHEN datepart(dw,@fecha) = 2 THEN 'Lunes ' + convert(varchar(2),datepart(dd,@fecha))	
				WHEN datepart(dw,@fecha) = 3 THEN 'Martes ' + convert(varchar(2),datepart(dd,@fecha))	
				WHEN datepart(dw,@fecha) = 4 THEN 'Mirrcoles ' + convert(varchar(2),datepart(dd,@fecha))	
				WHEN datepart(dw,@fecha) = 5 THEN 'Jueves ' + convert(varchar(2),datepart(dd,@fecha))	
				WHEN datepart(dw,@fecha) = 6 THEN 'Viernes ' + convert(varchar(2),datepart(dd,@fecha))	
				WHEN datepart(dw,@fecha) = 7 THEN 'Sabado ' + convert(varchar(2),datepart(dd,@fecha))	
			END)
set @mes = (CASE WHEN datepart(mm,@fecha) = 1 THEN 'Enero'
				WHEN datepart(mm,@fecha) = 2 THEN 'Febrero'
				WHEN datepart(mm,@fecha) = 3 THEN 'Marzo'
				WHEN datepart(mm,@fecha) = 4 THEN 'Abril'
				WHEN datepart(mm,@fecha) = 5 THEN 'Mayo'
				WHEN datepart(mm,@fecha) = 6 THEN 'Junio'
				WHEN datepart(mm,@fecha) = 7 THEN 'Julio'
				WHEN datepart(mm,@fecha) = 8 THEN 'Agosto'
				WHEN datepart(mm,@fecha) = 9 THEN 'Septiembre'
				WHEN datepart(mm,@fecha) = 10 THEN 'Octubre'
				WHEN datepart(mm,@fecha) = 11 THEN 'Noviembre'
				WHEN datepart(mm,@fecha) = 12 THEN 'Diciembre'
			END)
set @fechatexto = @dia + ' de ' + @mes
RETURN @fechatexto
END

print dbo.FCN_FechaTexto ('15/04/1993')