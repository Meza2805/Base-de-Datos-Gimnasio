create view Vw_Info_Clientes_Membresia_Activa 
as
   SELECT ID_Cliente AS [CEDULA CLINETE],C.[Primer Nombre] AS NOMBRE,C.[Primer Apellido] AS 
   APELLIDO,Fecha_Contratacion AS [FECHA DE CONTRATACION], Fecha_Expiracion AS [FECHA DE EXPIRACION],M.Descripcion AS
   [TIPO DE MEMBRESIA] FROM suscripcion S INNER JOIN Cliente C
   ON S.ID_Cliente = C.Cedula INNER JOIN Membresia M ON S.ID_Membresia = M.ID_Membresia WHERE S.Finalizada=0