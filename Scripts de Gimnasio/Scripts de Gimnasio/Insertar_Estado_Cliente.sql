select * from Estado_Cliente
SP_HELP  ESTADO_CLIENTE

Insert into Estado_Cliente (ID_Estado,Descripcion,Observacion)
	values ('I','Inactivo','Cliente sin membresia activa')

Insert into Estado_Cliente (ID_Estado,Descripcion,Observacion)
	values ('A','Activo','Cliente con membresia activa')

Insert into Estado_Cliente (ID_Estado,Descripcion,Observacion)
	values ('C','Baneado','Cliente Baneado')

update Estado_Cliente set Descripcion = 'INACTIVO',Observacion= 'CLIENTE SIN MEMBRESIA ACTIVA' 
	where ID_Estado = 'I'

UPDATE Estado_Cliente SET Descripcion ='ACTIVO',Observacion='CLIENTE CON MEMBRESIA ACTIVA'
	WHERE ID_Estado='A'

UPDATE Estado_Cliente SET Descripcion ='BANEADO',Observacion='CLIENTE BANEADO'
	WHERE ID_Estado='C'

UPDATE Estado_Cliente SET ID_Estado = 'B' WHERE Observacion='CLIENTE BANEADO'