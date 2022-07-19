alter proc SP_Insertar_Proveedor02
@Nombre varchar (100),
@Telefono varchar(8),
@Direccion varchar (300),
@salida varchar(50) out
as
begin
set nocount on
	if not exists (select Nombre from Proveedor with (nolock)where Nombre = @Nombre)
	begin
			insert into dbo.Proveedor (Nombre,Telefono,Direccion)
		values (LTRIM(RTRIM(UPPER(@Nombre))),LTRIM(RTRIM(UPPER(@Telefono))),LTRIM(RTRIM(UPPER(@Direccion))))
		set @salida = 'PROVEEDOR REGISTRADO'
	end
	else
	begin
		set @salida = 'EL PRODUCTO YA EXISTE EN LA BASE DE DATOS'
	end
	select @salida
end

----------------------------------------------------------------------
select * from Proveedor


select * from Proveedor
insert into Proveedor (Nombre,Telefono,Direccion) values ('prueba','75201801','managua')
sp_help Proveedor


EXEC SP_Insertar_Proveedor02 'ASDA','DASSD','SDASDASDA','' 





exec SP_Insertar_Proveedor 'HAMMER NUTRITION','22268210','PLAZA NATURA MODULOS A24 Y A25'
exec SP_Insertar_Proveedor 'suplemententos molina','83233858','avenida universitaria casimiro sotelo, frente al porton principal de la Universidad nacionande ingenieria, managua'
exec SP_Insertar_Proveedor 'suplementos deportivos','22774502','altamira deste no.443, managua'
exec SP_Insertar_Proveedor 'deportes rivera','22497102','iglesia el calvario 2c. al lago 75 varas al este, managua'
exec SP_Insertar_Proveedor 'coca - cola','22801005','carretera norte km 3'
exec SP_Insertar_Proveedor 'coca - cola','22801005','carretera norte km 3'
exec SP_Insertar_Proveedor 'pepsi','22108594','carretera norte km 12'

update Proveedor set Nombre =  'PEPSICO INC.' WHERE ID_Proveedor = 1002