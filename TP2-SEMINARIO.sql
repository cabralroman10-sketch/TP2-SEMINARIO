Create table Producto (
Idproducto int primary key not null,
nombre varchar(100),
precio double,
Stock int,
Stock_min int,
IdProveedor int,
foreign key (IdProveedor) references Proveedor (IdProveedor)
);

create table Stock(
Idstock int primary key not null,
stock int,
stockMin int,
Idproducto int,
foreign key (Idproducto) references Producto (Idproducto)
);

Create table Proveedor (
IdProveedor int primary key not null,
nombre varchar (100),
contacto varchar (50),
email varchar(70),
sitioweb varchar(100)
);

Create table Pedido(
Idpedido int primary key not null,
Fecha datetime,
estado boolean,
importe double,
cantidad int,
Idproveedor int,
foreign key (Idproveedor) references Proveedor (IdProveedor)
);

create table FacturaProveedor(
Idfactura int primary key not null,
numeroFactura int,
fecha datetime,
importe double,
IdPedido int,
foreign key (Idpedido) references Pedido (Idpedido)
);

Create table PagoProveedor(
Idpagoproveedor int primary key not null,
feecha datetime,
importe double,
metodo varchar(70),
IdFactura int,
foreign key (IdFactura) references FacturaProveedor (Idfactura)
);

Create table Venta (
Idventa int primary key not null,
fecha datetime,
importe double,
forma_pago varchar(100)
);

Create table DetalleVenta(
Iddetalleventa int primary key not null,
cantidad int,
precioUnitario double,
subtotal double,
Idventa int,
foreign key (Idventa) references Venta (Idventa)
);

Create table Cliente(
Idcliente int primary key not null,
Nombre varchar(100),
Dni varchar(20),
contacto varchar(50)
);

create table CuentaCorriente(
IdCuenta int primary key not null,
nombre Varchar(50),
saldo double,
estado boolean,
Idcliente int,
foreign key (Idcliente) references Cliente (Idcliente)
);

create table PagoCliente(
idPago int primary key not null,
fecha datetime,
importe double,
formapago varchar(50),
Idcuenta int,
foreign key (Idcuenta) references CuentaCorriente (IdCuenta)
);

Insert into Producto (Idproducto,nombre,precio,Stock,Stock_min,IdProveedor)
values (1,'Martillo galponero',15000,15,3,1),
(2,'destornillador',6000,10,5,1),
(3,'Tenaza',18000,6,2,3),
(4,'Pincel',2000,30,10,2),
(5,'Cinta metrica 5Mts',7500,10,3,3);

Insert into Stock (Idstock,stock,stockMin,Idproducto)
values (1,15,3,1),
(2,10,5,2),
(3,6,2,3),
(4,30,10,4),
(5,10,3,5);

Insert into Proveedor (IdProveedor,nombre,contacto,sitioweb)
values (1,'ferretera central','3546418617','www.ferreteracentral.com.ar'),
(2,'FOX sanitarios','3546221400','www.FOXSSANITARIOS.com.ar'),
(3,'RUNA','3546712205','www.RUNAOFICIAL.com.ar');

Insert into Pedido (Idpedido,Fecha,estado,importe,cantidad,Idproveedor)
values (1,'2026-09-28',true,150000,30,3),
(2,'2026-08-25',true,200000,40,2),
(3,'2026-09-18',false,1000000,80,1),
(4,'2026-08-15',true,50000,12,1);

insert into FacturaProveedor (Idfactura,numeroFactura,fecha,importe,IdPedido)
values (1,1100,'2026-09-29',150000,1),
(2,1101,'2026-08-26',200000,2),
(3,1102,'2026-09-19',1000000,3),
(4,1103,'2026-08-16',50000,4);

insert into PagoProveedor(Idpagoproveedor,feecha,importe,metodo,IdFactura)
values (1,'2026-10-2',150000,'transferencia',1),
(2,'2026-08-28',200000,'cheque',2),
(3,'2026-09-25',150000,'efectivo',3),
(4,'2026-08-23',50000,'transferencia',4);

SELECT * FROM PagoProveedor;

SELECT
    pg.Idpagoproveedor AS ID_Pago, pg.feecha AS Fecha_Pago,
    pg.importe AS Importe_Pago, pg.metodo AS Metodo_Pago,
    f.Idfactura AS ID_Factura, f.numeroFactura as N_Factura,
    f.importe as Importe_Factura, pe.Idpedido AS ID_Pedido,
    pe.Fecha AS Fecha_Pedido, pr.IdProveedor AS ID_Proveedor,
    pr.nombre AS Nombre_Proveedor
FROM PagoProveedor pg
INNER JOIN FacturaProveedor f
    ON pg.IdFactura = f.Idfactura
INNER JOIN Pedido pe
    ON f.IdPedido = pe.Idpedido
INNER JOIN Proveedor pr
    ON pe.Idproveedor = pr.IdProveedor
WHERE pr.nombre = 'ferretera central';

SELECT
    pe.Idpedido AS ID_Pedido,
    pe.Fecha AS Fecha_Pedido,
    pe.cantidad AS Cantidad,
    pe.importe AS Importe,
    pr.IdProveedor AS ID_Proveedor,
    pr.nombre AS Proveedor
FROM Pedido pe
INNER JOIN Proveedor pr
    ON pe.Idproveedor = pr.IdProveedor
WHERE pe.estado = false;

Select * from Stock;

TRUNCATE TABLE Stock;

Select * from Stock;





