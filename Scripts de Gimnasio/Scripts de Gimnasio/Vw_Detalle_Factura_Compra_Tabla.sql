create view Vw_Detalle_Factura_Compra_Tabla
as
select ID_Detalle,ID_Factura_Compra,ID_Producto, ('C$' + ' '+CONVERT(VARCHAR(10),costo)) as costo
from Detalle_Factura_Compra

