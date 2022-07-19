alter proc SP_Total_Asistencia
@salida int out
as
begin
 set @salida = ( select count( ID_Registro) from Registo_Asistencia 
where (Select CONVERT(varchar,(Fecha),103)) =(Select CONVERT(varchar,GETDATE(),103)))
select  @salida
end

exec SP_Total_Asistencia 0