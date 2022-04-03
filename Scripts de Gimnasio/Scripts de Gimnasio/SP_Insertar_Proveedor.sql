select * from Proveedor
sp_help Proveedor

ALTER proc SP_Insertar_Proveedor 
@Nombre nvarchar (100),
@Telefono char(8),
@Direccion nvarchar (300)
as
begin
	insert into Proveedor (Nombre,Telefono,Direccion)
		values (LTRIM(RTRIM(UPPER(@Nombre))),LTRIM(RTRIM(UPPER(@Telefono))),LTRIM(RTRIM(UPPER(@Direccion))))
end

exec SP_Insertar_Proveedor 'HAMMER NUTRITION','22268210','PLAZA NATURA MODULOS A24 Y A25'
exec SP_Insertar_Proveedor 'suplemententos molina','83233858','avenida universitaria casimiro sotelo, frente al porton principal de la Universidad nacionande ingenieria, managua'
exec SP_Insertar_Proveedor 'suplementos deportivos','22774502','altamira deste no.443, managua'
exec SP_Insertar_Proveedor 'deportes rivera','22497102','iglesia el calvario 2c. al lago 75 varas al este, managua'
