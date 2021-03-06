ALTER FUNCTION [dbo].[FCN_Registro_Asistencia_Total_Cliente]
(	
	@cedula char(18)
)
RETURNS varchar(100) 
AS
begin
	declare @mensaje varchar(100)
	if exists (select ID_Cliente from Registo_Asistencia where ID_Cliente = @cedula)
		begin
			set @mensaje =  'EL CLINETE TIENE '+(select convert(varchar(5),(select count(*) from Registo_Asistencia where ID_Cliente ='001-160605-0101L')))+' REGISTROS'
		end
	else
		begin
			set @mensaje =  'EL CLINETE NO EXISTE'
		end
	
	return @mensaje
end 
