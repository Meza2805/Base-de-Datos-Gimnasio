  create  view Vw_Cantidad_Clientes_por_Membresia
  as
  SELECT M.Descripcion AS MEMBRESIA,COUNT(S.ID_Membresia)AS CANTIDAD  FROM suscripcion S 
   INNER JOIN Membresia M ON S.ID_Membresia = M.ID_Membresia WHERE S.Finalizada=0 GROUP BY M.Descripcion