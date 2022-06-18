ALTER proc SP_Insertar_Proveedor 
@Nombre nvarchar (100),
@Telefono char(8),
@Direccion nvarchar (300)
as
begin
set nocount on
	if not exists (select Nombre from Proveedor with (nolock)where Nombre = @Nombre)
	begin
			insert into Proveedor (Nombre,Telefono,Direccion)
		values (LTRIM(RTRIM(UPPER(@Nombre))),LTRIM(RTRIM(UPPER(@Telefono))),LTRIM(RTRIM(UPPER(@Direccion))))
		print 'PROVEEDOR REGISTRADO'
	end
	else
	begin
		print 'EL PRODUCOT YA EXISTE EN LA BASE DE DATOS'
	end
end

----------------------------------------------------------------------



select * from Proveedor
sp_help Proveedor








exec SP_Insertar_Proveedor 'HAMMER NUTRITION','22268210','PLAZA NATURA MODULOS A24 Y A25'
exec SP_Insertar_Proveedor 'suplemententos molina','83233858','avenida universitaria casimiro sotelo, frente al porton principal de la Universidad nacionande ingenieria, managua'
exec SP_Insertar_Proveedor 'suplementos deportivos','22774502','altamira deste no.443, managua'
exec SP_Insertar_Proveedor 'deportes rivera','22497102','iglesia el calvario 2c. al lago 75 varas al este, managua'
exec SP_Insertar_Proveedor 'coca - cola','22801005','carretera norte km 3'
exec SP_Insertar_Proveedor 'coca - cola','22801005','carretera norte km 3'
exec SP_Insertar_Proveedor 'pepsi','22108594','carretera norte km 12'

update Proveedor set Nombre =  'PEPSICO INC.' WHERE ID_Proveedor = 1002