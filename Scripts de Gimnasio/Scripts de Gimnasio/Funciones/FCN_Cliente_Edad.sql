ALTER function FCN_Cliente_Edad
(
	@cedula char(18)
)
returns varchar(50)
as
begin
		declare @edad varchar(50)
		if exists (select Cedula from Cliente where Cedula = @cedula)
		begin
			set @edad ='EL CLIENTE TIENE ' + (SELECT CONVERT(varchar(10), (SELECT      FLOOR((CAST(CONVERT(varchar(8), GETDATE(), 112) AS int) - CAST(CONVERT(varchar(8), Fecha_Nac, 112) AS int)) / 10000)
					FROM  dbo.Cliente where Cedula = @cedula))  )    + ' AÑOS DE EDAD'
		end
		ELSE
		BEGIN
		set @edad ='EL CLIENTE NO EXISTE EN LA BASE DE DATOS'
		END
	return @edad
end

select dbo.FCN_Cliente_Edad('448-150493-0101V')




