select * from Estado_Empleado

sp_help Estado_Empleado

insert into Estado_Empleado (ID_ESTADO_EMP,Descripcion)
	values ('A','EMPLEADO ACTIVO')

insert into Estado_Empleado (ID_ESTADO_EMP,Descripcion)
	values ('B','EMPLEADO DE BAJA')

--CORRIGIENDO NOMBRE DE LA TABLA
SP_RENAME 'dbo.Estado_Empleado.Descripcoion','Descripcion'