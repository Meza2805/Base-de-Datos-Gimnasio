create view Vw_Mostrar_Clientes_Ordenados
as
select Cedula,[Primer Nombre], [Segundo Nombre],[Primer Apellido],[Segundo Apellido], Sexo, Fecha_Nac from cliente
where Cedula != '000-000000-00000'


select * from Vw_Mostrar_Clientes_Ordenados