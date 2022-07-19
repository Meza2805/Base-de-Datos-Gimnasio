create proc SP_Mostrar_Proveedores
as
begin
select ID_Proveedor as [CODIGO],Nombre AS PROOVEDOR,Telefono AS TELEFONO,Direccion AS DIRECCION from Proveedor
end


exec SP_Mostrar_Proveedores