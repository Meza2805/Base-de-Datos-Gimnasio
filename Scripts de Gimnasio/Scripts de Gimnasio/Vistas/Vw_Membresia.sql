create view Vw_Membresia
as
select ID_Membresia AS [CODIGO],Descripcion as DESCRIPCION,
('C$' + ' '+CONVERT(VARCHAR(10),Precio)) AS PRECIO from Membresia