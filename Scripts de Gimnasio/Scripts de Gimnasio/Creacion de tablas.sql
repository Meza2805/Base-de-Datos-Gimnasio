

CREATE TABLE Estado_Cliente 
(
  ID_Estado char (1),
  Descripcion nvarchar (25),
  Observacion nvarchar(100),
  Constraint PK_ECliente Primary Key (ID_Estado) 
)

alter TABLE Cliente
 (
  ID_Cliente int identity (1,1)  not null,
  [Primer Nombre] nvarchar(25) COLLATE Modern_Spanish_CI_AS  not null,
  [Segundo Nombre] nvarchar(25) COLLATE Modern_Spanish_CI_AS ,
  [Primer Apellido] nvarchar(25)COLLATE Modern_Spanish_CI_AS  not null,
  [Segundo Apellido] nvarchar(25) COLLATE Modern_Spanish_CI_AS ,
  [Sexo] char(1),
  [Fecha_Nac] date,
  [Fecha_Registro] date,
  [ID_Estado] char (1),
  Constraint PK_Cliente  primary key ([ID_Cliente]),
  Constraint FK_Estado_C  foreign key ([ID_Estado]) references Estado_Cliente (ID_Estado) on update cascade on delete cascade
)

CREATE TABLE Registo_Asistencia 
(
  ID_Registro int identity not null,
  Fecha datetime,
  ID_Cliente int,
  Constraint PK_R_Asistencia primary key ([ID_Registro]),
  Constraint FK_ID_Cliente foreign key (ID_Cliente) references  Cliente (ID_Cliente) on update cascade on delete cascade
)


alter TABLE Empleado 
(
  ID_Empleado int identity (1,1) not null,
  [Primer Nombre] nvarchar(25) COLLATE Modern_Spanish_CI_AS  not null,
  [Segundo Nombre] nvarchar(25) COLLATE Modern_Spanish_CI_AS ,
  [Primer Apellido] nvarchar(25)COLLATE Modern_Spanish_CI_AS  not null,
  [Segundo Apellido] nvarchar(25) COLLATE Modern_Spanish_CI_AS ,
  [Telefono] char (8),
  [Direccion] varchar (200),
  [Fecha Contratacion] date,
  Constraint PK_Empleado PRIMARY KEY ([ID_Empleado])
)


CREATE TABLE Membresia 
(
  ID_Membresia char (1) not null,
  Descripcion varchar (50),
  Precio money,
   constraint  PK_Membresia PRIMARY KEY  (ID_Membresia)
)

CREATE TABLE suscripcion (
  ID_SUBS int identity (1,1) not null,
  Fecha_Contratacion date,
  Fecha_Expiracion date,
  ID_Cliente int,
  ID_Empleado int,
  ID_Membresia char(1),
  Constraint PK_Subs PRIMARY KEY (ID_SUBS),
  Constraint FK_Cliente foreign key (ID_CLIENTE) References Cliente (ID_Cliente) on delete cascade on update cascade,
  Constraint FK_Empleado foreign key (ID_Empleado) references Empleado (ID_Empleado) on delete cascade on update cascade,
  Constraint FK_Membersia foreign key (ID_Membresia) references Membresia (ID_Membresia ) on delete cascade on update cascade
)



CREATE TABLE [Modo_Pago] 
(
  ID_MPago int,
  Descripcion varchar (25),
  Constraint PK_MPAGO PRIMARY KEY ([ID_MPago])
)

CREATE TABLE Factura
(
  [ID_Factura] int identity (1,1) not null,
  Fecha date,
  ID_Cliente int,
  ID_Empleado int,
  ID_MPago int,
  SubTotal money,
  IVA money,
  Total money,
  Constraint PK_Factura PRIMARY KEY ([ID_Factura]),
  Constraint FK_Cliente2 foreign key (ID_CLIENTE) References Cliente (ID_Cliente) on delete cascade on update cascade,
  Constraint FK_Empleado2 foreign key (ID_Empleado) references Empleado (ID_Empleado) on delete cascade on update cascade,
  Constraint FK_ID_MPago foreign key (ID_MPago) references Modo_Pago (ID_MPago) on delete cascade on update cascade
)

CREATE TABLE Categoria
(
  ID_Categoria int identity (1,1) not null,
  [Descripcion] nvarchar(50) COLLATE Modern_Spanish_CI_AS,
  Constraint PK_Categoria_Producto PRIMARY KEY (ID_Categoria)
)

CREATE TABLE Producto
(
  ID_Producto int identity (1,1) not null,
  Descripcion nvarchar(50) COLLATE Modern_Spanish_CI_AS,
  [Precio Venta] money,
  [Precio Compra] money,
  [Fecha Vencimiento] date,
  Stock int,
  ID_Categoria int,
  Constraint PK_Producto PRIMARY KEY ([ID_Producto]),
  Constraint FK_ID_Categoria foreign key (ID_Categoria)  references Categoria (ID_Categoria) on delete cascade on update cascade
)

alter table Producto
add Marca varchar(50)

alter table Producto
add Fecha_Compra date

alter table Producto
add Descripcion_Producto nvarchar (200)


CREATE TABLE Detalle_Factura
(
  [ID_Detalle] int identity (1,1) not null,
  [ID_Factura] int,
  [ID_Producto] int,
  [Cant_Producto] int,
  Constraint PK_Detalle_Factura PRIMARY KEY ([ID_Detalle]),
  Constraint FK_ID_Factura foreign key (ID_Factura) references Factura (ID_Factura) on delete cascade on update cascade,
  Constraint FK_Producto foreign key (ID_Producto) references Producto (ID_Producto) on delete cascade on update cascade
)

CREATE TABLE Proveedor
(
  [ID_Proveedor] int identity (1,1) not null,
  Nombre  nvarchar (50 ) COLLATE Modern_Spanish_CI_AS not null,
  Telefono char (8),
  Direccion nvarchar(150),
  Constraint PK_Proveedor PRIMARY KEY (ID_Proveedor)
)

CREATE TABLE [Producto_Proveedor] (
  ID_PP int identity (1,1) not null,
  [ID_Producto] int not null,
  [ID_Proveedor] int not null,
  Constraint PK_PP PRIMARY KEY (ID_PP),
  Constraint FK_Prodcuto2 foreign key (ID_Producto) references Producto (ID_Producto) on delete cascade on update cascade,
  Constraint FK_Proveedor foreign key  (ID_Proveedor) references Proveedor (ID_Proveedor) on delete cascade on update cascade
)


create table Estado_Empleado
(
ID_Empleado char(1) not null,
Descripcoion nvarchar(25)
Constraint PK_Estado_Empleado primary key (ID_Empleado)
)



select * from Empleado
--Agregando el campo de id_estado_cliente a la tabla Cliente que ya estaba creada
alter table Empleado
	add  ID_Estado_Empleado char (1)
	constraint FK_ID_ESTADO_EMPLEADO_2 FOREIGN KEY  (ID_Estado_Empleado) REFERENCES Estado_Empleado (ID_Empleado) on delete cascade on update cascade

--SE UTILIZA UN PROCEDIMIENTO ALMACENADO PREDETERMINADO EN SQL PARA REALIZAR EL CAMBIO DE NOMBRE DE UNA COLUMNA
exec sp_rename 'dbo.Estado_Empleado.ID_Empleado', 'ID_ESTADO_EMP','COLUMN'
SELECT * FROM Estado_Empleado


sp_rename 'dbo.Estado_Cliente.ID_Observacion','Observacion'



select * from Estado_Cliente

create table Observacion 
(
	ID_Observacion int identity (1,1) not null,
	Descripcion_Observacion varchar(100)
	Constraint PK_Observacion primary key (ID_Observacion)
)

select * from Producto
delete from Producto
sp_help Producto

--Agregando restriccion para el campo fecha_nacimiento
alter table Producto WITH NOCHECK ADD
constraint Fecha_vencimiento default('NO TIENE') FOR [Fecha Vencimiento]

--prueba de varchar y date

declare @fecha_prueba varchar(10)
declare @fecha_prueba_02 date
set @fecha_prueba_02 = GETDATE();
 set @fecha_prueba = CAST (datepart(YEAR, GETDATE()) as varchar(4))+'-'+ CAST ( DATEPART(MONTH,GETDATE()) as varchar(2))+'-'
 + cast (DATEPART(DAY,GETDATE()) as varchar (4))
 if @fecha_prueba = @fecha_prueba_02
	begin
	print 'SON IGUALES'
	end
 print @fecha_prueba
 print @fecha_prueba_02
 select * from suscripcion
 select * from Producto
