create proc SP_Membresia_Precio
as
begin

select Descripcion as MEMBRESIA ,  'C$ '+ (SELECT CONVERT(VARCHAR(25),Precio))  
AS PRECIO from Membresia order by Membresia.Precio

end

