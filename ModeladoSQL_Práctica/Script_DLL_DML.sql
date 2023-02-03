-- Modelo normalizado Flota vehículos KeepCoding


create schema flota_1 authorization xnwnljth;


----------------------------------------------------------- INICIO CREACIÓN TABLAS ------------------------------------------------------------------------------------------------

-- 1. Creación de Grupos, Marcas y Modelos

-- Grupos
create table flota_1.grupos (
	id_grupo varchar(20) not null, --PK
	nombre_grupo varchar(200) not null
);
 -- pk
alter table flota_1.grupos
add constraint grupos_PK primary key(id_grupo);

-- Marcas
create table flota_1.marcas (
	id_marca varchar(20) not null, --PK
	nombre_marca varchar(200) not null,
	id_grupo varchar(20) not null -- FK grupos
);
-- pk
alter table flota_1.marcas
add constraint marcas_PK primary key(id_marca);
-- fk
alter table flota_1.marcas
add constraint marcas_grupo_FK foreign key(id_grupo)
references flota_1.grupos(id_grupo);

-- Modelos
create table flota_1.modelos (
	id_modelo varchar(20) not null, --PK
	nombre_modelo varchar(200) not null,
	id_marca varchar(20) not null -- FK marcas
);
-- pk
alter table flota_1.modelos
add constraint modelos_PK primary key(id_modelo);
-- fk
alter table flota_1.modelos
add constraint modelos_marca_FK foreign key(id_marca)
references flota_1.marcas(id_marca);



-- 2. Creación Vehículos y sus tablas de referencia 

-- Colores
create table flota_1.colores (
	id_color varchar(20) not null, --PK
	nombre_color varchar(200) not null
);
-- pk
alter table flota_1.colores
add constraint colores_PK primary key(id_color);

-- Aseguradoras
create table flota_1.aseguradoras (
	id_aseguradora varchar(20) not null, --PK
	nombre_aseguradora varchar(200) not null
);
-- pk
alter table flota_1.aseguradoras
add constraint aseguradoras_PK primary key(id_aseguradora);


--Vehiculos
create table flota_1.vehiculos (
	id_vehiculo varchar(20) not null, --PK
	id_modelo varchar(20) not null, -- FK modelo
	id_color varchar(20) not null, -- FK color
	id_aseguradora varchar(20) not null, --FK aseguradora
	poliza varchar(200) not null,
	matricula varchar(20) not null,
	kilometros decimal(10, 2) not null,
	fecha_compra date null,
	fecha_baja date null
);
-- pk
alter table flota_1.vehiculos
add constraint vehiculos_PK primary key(id_vehiculo);
-- fk modelo
alter table flota_1.vehiculos
add constraint vehiculo_modelo_FK foreign key(id_modelo)
references flota_1.modelos(id_modelo);
-- fk color
alter table flota_1.vehiculos
add constraint vehiculo_color_FK foreign key(id_color)
references flota_1.colores(id_color);
-- fk aseguradora
alter table flota_1.vehiculos
add constraint vehiculo_aseguradora_FK foreign key(id_aseguradora)
references flota_1.aseguradoras(id_aseguradora);



-- 3. Revision vehículos y tablas de referencia  

-- Monedas
create table flota_1.monedas (
	id_moneda varchar(20) not null, --PK
	nombre_moneda varchar(200) not null
);
-- pk
alter table flota_1.monedas
add constraint monedas_PK primary key(id_moneda);


-- Revision_Vehiculos
create table flota_1.revision_vehiculo (
	id_vehiculo varchar(20) not null, --PK FK vehiculo
	fecha_revision date not null, -- PK
	kilometraje decimal(10, 2) null,
	importe decimal(10, 2) null,
	id_moneda varchar(20) not null -- FK moneda
);
-- pk
alter table flota_1.revision_vehiculo
add constraint revision_vehiculo_PK primary key(id_vehiculo, fecha_revision);
-- fk vehiculos
alter table flota_1.revision_vehiculo
add constraint revision_vehiculo_vehiculo_FK foreign key(id_vehiculo)
references flota_1.vehiculos(id_vehiculo);
-- fk moneda
alter table flota_1.revision_vehiculo
add constraint vehiculo_revision_moneda_FK foreign key(id_moneda)
references flota_1.monedas(id_moneda);


--------------------------------------------------------- FIN CREACIÓN TABLAS -----------------------------------------------------------------------------------------------


--------------------------------------------------------- INICIO LLENADO DATOS ----------------------------------------------------------------------------------------------

-- Grupos automovilísticos

insert into flota_1.grupos (id_grupo, nombre_grupo)
values ('G001', 'Volkswagen Group'),
('G002', 'Toyota Motor'),
('G003', 'Ford Motor Company'),
('G004', 'BMW Group'),
('G005', 'Stellantis'),
('G006', 'General Motors');


-- Marcas

insert into flota_1.marcas (id_marca, nombre_marca, id_grupo)
values ('M001', 'Audi', 'G001'),
('M002', 'Bentley', 'G001'),
('M003', 'Bugatti', 'G001'),
('M004', 'Lamborghini', 'G001'),
('M005', 'Porsche', 'G001'),
('M006', 'Seat', 'G001'),
('M007', 'Skoda', 'G001'),
('M008', 'Volkswagen', 'G001'),
('M009', 'Lexus', 'G002'),
('M010', 'Toyota', 'G002'),
('M011', 'Daihatsu', 'G002'),
('M012', 'Lincoln', 'G003'),
('M013', 'Ford', 'G003'),
('M014', 'Rolls-Royce', 'G004'),
('M015', 'BMW', 'G004'),
('M016', 'Mini', 'G004'),
('M017', 'Fiat', 'G005'),
('M018', 'Chrysler', 'G005'),
('M019', 'Peugeout', 'G005'),
('M020', 'Citröen', 'G005'),
('M021', 'Jeep', 'G005'),
('M022', 'Maserati', 'G005'),
('M023', 'Alfa Romeo', 'G005'),
('M024', 'Dodge', 'G005'),
('M025', 'Cadillac', 'G006'),
('M026', 'Chevrolet', 'G006'),
('M027', 'GMG', 'G006'),
('M028', 'Opel', 'G006');


-- Modelos

insert into flota_1.modelos (id_modelo, nombre_modelo, id_marca)
values ('AU001', 'A1', 'M001'),
('AU002', 'A6', 'M001'),
('AU003', 'A8', 'M001'),
('AU004', 'TT', 'M001'),
('AU005', 'A1', 'M001'),
('BE001', 'Bentayga', 'M002'),
('BE002', 'Flying spur', 'M002'),
('SE001', 'Ibiza', 'M006'),
('SE002', 'Leon', 'M006'),
('SE003', 'Córdoba', 'M006'),
('SE004', 'Toledo', 'M006'),
('SE005', 'Logroño', 'M006'),
('LE001', 'LS', 'M009'),
('LE002', 'UX', 'M009'),
('TO001', 'Raize', 'M010'),
('TO002', 'Rush', 'M010'),
('TO003', 'RAV4', 'M010'),
('TO004', 'Corolla', 'M010'),
('FO001', 'Fiesta', 'M013'),
('FO002', 'Scort', 'M013'),
('BM001', 'X4 M', 'M015'),
('BM002', 'X7 M', 'M015'),
('BM003', '8 Gran Coupé M', 'M015'),
('MI001', 'Clubman', 'M016'),
('MI002', 'Countryman', 'M016'),
('FI001', 'Punto', 'M017'),
('FI002', 'Ducato', 'M017'),
('FI003', 'Argo', 'M017'),
('FI004', 'Pulse', 'M017'),
('PE001', '505', 'M019'),
('PE002', '605', 'M019'),
('PE003', '805', 'M019'),
('PE004', '505 Turbo', 'M019'),
('OP001', 'Corsa', 'M028'),
('OP002', 'Cadet', 'M028'),
('OP003', 'Combo', 'M028'),
('OP004', 'Crossland', 'M028');


-- Colores

insert into flota_1.colores (id_color, nombre_color)
values ('001', 'Azul'),
('002', 'Amarillo'),
('003', 'Ambar'),
('004', 'Blanco'),
('005', 'Beige'),
('006', 'Crema'),
('007', 'Gris'),
('008', 'Granate'),
('009', 'Hueso'),
('011', 'Marron'),
('012', 'Magenta'),
('013', 'Naranja'),
('014', 'Negro'),
('015', 'Rojo'),
('016', 'Verde'),
('017', 'Violeta');


-- Aseguradoras

insert into flota_1.aseguradoras (id_aseguradora, nombre_aseguradora)
values ('001', 'Mapfre'),
('002', 'Zenit'),
('003', 'Liberty'),
('004', 'Allianz'),
('005', 'Mutua Madrileña'),
('006', 'Generali');

-- Monedas

insert into flota_1.monedas (id_moneda, nombre_moneda)
values ('ALL', 'Lek albano'),
('EUR', 'Euro'),
('DZD', 'Dinar Argelino'),
('ARS', 'Peso argentino'),
('AMD', 'Dram armenio'),
('AUD', 'Dolar australiano'),
('MMK', 'Kyat birmano'),
('BRL', 'Real brasileno'),
('BGN', 'Lev'),
('CLP', 'Peso chileno'),
('CNY', 'Renminbi'),
('USD', 'Dolar estadounidense'),
('GEL', 'Lari'),
('GTQ', 'Quetzal'),
('GBP', 'Libra esterlina'),
('HKD', 'Dolar de Hong Kong'),
('JPY', 'Yen'),
('KWD', 'Dinar Kuwaiti'),
('MXN', 'Peso mexicano'),
('NOK', 'Corona Noruega'),
('VND', 'Dong'),
('DJF', 'Franco Yibutiano');


-- Vehículos

insert into flota_1.vehiculos 
(id_vehiculo, id_modelo, id_color, id_aseguradora, poliza, matricula, kilometros, fecha_compra, fecha_baja)
values ('0001', 'PE004', '007', '001', 'M547896', 'LO-7588-F', '185475.54' , '1990/08/10', '4000/01/01'),
('0002', 'OP004', '001', '001', 'M589745', 'BA-4565-J', '321587.0', '1998/06/23', '2010/12/31'),
('0003', 'FI001', '015', '001', 'M698422', 'CA-4532-D', '541684.45', '1998/06/23', '2010/12/31'),
('0004', 'OP002', '015', '004', 'A123456', 'VA-2435-M', '201003.05', '1998/06/23', '2010/12/31'),
('0005', 'OP002', '007', '004', 'A986745', 'MA-9988-AZ', '197845.98', '1998/06/23', '2010/12/31'),
('0006', 'FO001', '015', '004', 'A526341', 'LU-5467-H', '897589.98', '1998/06/23', '4000/01/01'),
('0007', 'FO001', '001', '004', 'A985423', 'T-2526-K', '189214', '1999/10/19', '2010/12/31'),
('0008', 'SE004', '001', '004', 'A154697', 'LO-3459-S', '97526.78', '1999/10/19', '2010/12/31'),
('0009', 'BM003', '015', '004', 'A252526', 'O-0001-J', '259312.55', '1999/10/19', '2015/06/30'),
('0010', 'SE004', '015', '006', 'G789456321', 'VA-8751-M', '219547.5', '1999/10/19', '2015/06/30'),
('0011', 'AU003', '014', '006', 'G321465897', 'SE-1257-Z', '501105.50', '1999/10/19', '4000/01/01'),
('0012', 'MI002', '001', '006', 'G585825654', '0000-BBB', '197475.12', '2004/03/25', '2018/12/31'),
('0013', 'AU003', '014', '006', 'G475869748', '0001-BBB', '301654', '2004/03/25', '2018/12/31'),
('0014', 'MI002', '013', '006', 'G555588969', '5679-DBF', '201579.45', '2004/03/25', '2015/06/30'),
('0015', 'FO001', '013', '006', 'G857845788', '3453-FHR', '127265.5', '2004/03/25', '4000/01/01'),
('0016', 'LE002', '013', '006', 'G121212456', '2222-GRR', '25154.3', '2012/12/13', '2022/09/30'),
('0017', 'FI001', '013', '005', 'MM56478', '3419-GRZ', '418569.45', '2012/12/13', '2022/09/30'),
('0018', 'BM003', '007', '003', 'LBT_RETT', '9999-GRZ', '192942.74', '2012/12/13', '4000/01/01'),
('0019', 'AU004', '007', '003', 'LBT_DEDR', '1234-HHH', '101987.45', '2015/05/17', '2022/09/30'),
('0020', 'OP004', '007', '002', 'Z4547898', '8476-HHL', '95554.45', '2015/05/17', '2022/09/30'),
('0021', 'MI002', '007', '002', 'Z4584784', '0000-HNN', '117558.85', '2016/08/23', '4000/01/01'),
('0022', 'BM003', '013', '002', 'Z4545784', '9438-HNZ', '45124.87', '2016/08/23', '4000/01/01'),
('0023', 'SE004', '015', '002', 'Z6598523', '2618-KMB', '25129.50', '2018/12/30', '4000/01/01'),
('0024', 'SE004', '011', '002', 'Z2525417', '5678-KMB', '21547.45', '2018/12/30', '4000/01/01'),
('0025', 'OP002', '015', '002', 'Z7485475', '9432-KKK', '195548.45', '2018/12/30', '2022/12/31'),
('0026', 'PE003', '014', '002', 'Z9865874', '9123-KZZ', '87455.50', '2018/12/30', '4000/01/01'),
('0027', 'PE003', '011', '002', 'Z5854521', '2367-MNP', '12648.30', '2021/09/15', '4000/01/01'),
('0028', 'PE003', '017', '001', 'M9685784', '6776-MNP', '6554.50', '2022/09/20', '4000/01/01'),
('0029', 'TO002', '017', '001', 'M9895685', '6879-MNP', '19985.50', '2022/09/21', '4000/01/01'),
('0030', 'TO002', '001', '001', 'M9987456', '8912-MNQ', '125.25', '2023/01/31', '4000/01/01');


-- Revisión_Vehículo

insert into flota_1.revision_vehiculo (id_vehiculo, fecha_revision, kilometraje, importe, id_moneda)
values ('0001', '1993/09/30', '20000', '20', 'EUR'),
('0001', '1995/09/30', '90000', '20', 'EUR'),
('0001', '1999/09/30', '100000', '20', 'EUR'),
('0001', '2004/09/30', '110000', '20', 'EUR'),
('0001', '2006/09/30', '115000', '30', 'EUR'),
('0001', '2008/09/30', '120000', '35', 'EUR'),
('0001', '2010/09/30', '125000', '35', 'EUR'),
('0001', '2011/09/30', '130000', '45', 'EUR'),
('0001', '2012/09/30', '135000', '55', 'EUR'),
('0001', '2013/09/30', '140000', '60', 'EUR'),
('0001', '2015/09/30', '145000', '80', 'EUR'),
('0001', '2017/09/30', '150000', '90', 'EUR'),
('0001', '2018/09/30', '155000', '110', 'EUR'),
('0001', '2019/09/30', '160000', '110', 'EUR'),
('0001', '2020/09/30', '165000', '110', 'EUR'),
('0001', '2022/09/30', '170000', '120', 'EUR'),
('0002', '2004/09/30', '60000', '20', 'EUR'),
('0002', '2005/09/30', '120000', '30', 'EUR'),
('0002', '2006/09/30', '180000', '30', 'EUR'),
('0002', '2007/09/30', '220000', '45', 'EUR'),
('0002', '2008/09/30', '280000', '50', 'EUR'),
('0002', '2009/09/30', '310000', '60', 'EUR'),
('0003', '2004/09/30', '50000', '35', 'EUR'),
('0003', '2005/09/30', '120000', '40', 'EUR'),
('0003', '2006/09/30', '200000', '55', 'EUR'),
('0003', '2007/09/30', '300000', '60', 'EUR'),
('0003', '2008/09/30', '400000', '85', 'EUR'),
('0003', '2009/09/30', '500000', '100', 'EUR'),
('0004', '2004/09/30', '54000', '30', 'EUR'),
('0004', '2005/09/30', '92000', '45', 'EUR'),
('0004', '2006/09/30', '120000', '50', 'EUR'),
('0004', '2007/09/30', '165000', '55', 'EUR'),
('0004', '2008/09/30', '200000', '55', 'EUR'),
('0004', '2009/09/30', '200001', '60', 'EUR'),
('0005', '2004/09/30', '21000', '35', 'EUR'),
('0005', '2005/09/30', '56000', '40', 'EUR'),
('0005', '2006/09/30', '98000', '40', 'EUR'),
('0005', '2007/09/30', '145000', '45', 'EUR'),
('0005', '2008/09/30', '180000', '50', 'EUR'),
('0005', '2009/09/30', '195000', '65', 'EUR'),
('0006', '2008/09/30', '36000', '65', 'EUR'),
('0006', '2012/09/30', '125000', '95', 'EUR'),
('0006', '2014/09/30', '215000', '95', 'EUR'),
('0006', '2016/09/30', '410000', '95', 'EUR'),
('0006', '2018/09/30', '625000', '100', 'EUR'),
('0006', '2019/09/30', '756000', '110', 'EUR'),
('0006', '2022/09/30', '890000', '110', 'EUR'),
('0007', '2005/09/30', '35000', '40', 'EUR'),
('0007', '2006/09/30', '91000', '50', 'EUR'),
('0007', '2007/09/30', '112000', '55', 'EUR'),
('0007', '2008/09/30', '146000', '60', 'EUR'),
('0007', '2009/09/30', '185000', '75', 'EUR'),
('0008', '2005/09/30', '12000', '45', 'EUR'),
('0008', '2006/09/30', '21000', '50', 'EUR'),
('0008', '2007/09/30', '35000', '50', 'EUR'),
('0008', '2008/09/30', '65000', '55', 'EUR'),
('0008', '2009/09/30', '95000', '60', 'EUR'),
('0009', '2010/09/30', '46000', '75', 'EUR'),
('0009', '2011/09/30', '98000', '80', 'EUR'),
('0009', '2012/09/30', '156000', '90', 'EUR'),
('0009', '2013/09/30', '231000', '95', 'EUR'),
('0009', '2014/09/30', '250000', '95', 'EUR'),
('0010', '2005/09/30', '21000', '35', 'EUR'),
('0010', '2010/09/30', '45000', '65', 'EUR'),
('0010', '2012/09/30', '82000', '70', 'EUR'),
('0010', '2013/09/30', '101000', '85', 'EUR'),
('0010', '2014/09/30', '145000', '85', 'EUR'),
('0010', '2015/09/30', '201000', '85', 'EUR'),
('0011', '2003/09/30', '63000', '25', 'EUR'),
('0011', '2005/09/30', '154000', '30', 'EUR'),
('0011', '2007/09/30', '217000', '55', 'EUR'),
('0011', '2009/09/30', '341000', '60', 'EUR'),
('0011', '2011/09/30', '425000', '70', 'EUR'),
('0011', '2012/09/30', '500000', '70', 'EUR'),
('0012', '2012/09/30', '14000', '70', 'EUR'),
('0012', '2013/09/30', '51000', '75', 'EUR'),
('0012', '2014/09/30', '81000', '90', 'EUR'),
('0012', '2015/09/30', '104000', '105', 'EUR'),
('0012', '2016/09/30', '127000', '125', 'EUR'),
('0012', '2017/09/30', '145000', '130', 'EUR'),
('0012', '2018/09/30', '190000', '130', 'EUR'),
('0013', '2009/09/30', '9500', '45', 'EUR'),
('0013', '2010/09/30', '31000', '50', 'EUR'),
('0013', '2012/09/30', '63000', '65', 'EUR'),
('0013', '2014/09/30', '127000', '80', 'EUR'),
('0013', '2016/09/30', '212000', '85', 'EUR'),
('0013', '2018/09/30', '300000', '90', 'EUR'),
('0014', '2009/09/30', '11000', '256', 'CNY'),
('0014', '2011/09/30', '27000', '300', 'CNY'),
('0014', '2012/09/30', '63000', '360', 'CNY'),
('0014', '2013/09/30', '103000', '390', 'CNY'),
('0014', '2014/09/30', '163000', '420', 'CNY'),
('0014', '2015/09/30', '200000', '450', 'CNY'),
('0015', '2019/09/30', '21000', '645', 'CNY'),
('0015', '2020/09/30', '43000', '825', 'CNY'),
('0015', '2021/09/30', '97000', '850', 'CNY'),
('0015', '2022/09/30', '125000', '865', 'CNY'),
('0016', '2016/09/30', '1000', '45500', 'CLP'),
('0016', '2017/09/30', '5000', '55000', 'CLP'),
('0016', '2018/09/30', '10000', '60000', 'CLP'),
('0016', '2019/09/30', '15000', '65000', 'CLP'),
('0016', '2020/09/30', '20000', '70000', 'CLP'),
('0016', '2021/09/30', '25000', '75000', 'CLP'),
('0017', '2016/09/30', '42000', '45000', 'CLP'),
('0017', '2018/09/30', '157000', '60000', 'CLP'),
('0017', '2020/09/30', '301000', '65000', 'CLP'),
('0017', '2021/09/30', '400000', '70000', 'CLP'),
('0018', '2018/09/30', '45000', '56000', 'CLP'),
('0018', '2020/09/30', '92000', '61500', 'CLP'),
('0018', '2022/09/30', '160000', '63000', 'CLP'),
('0019', '2020/09/30', '12000', '85500', 'CLP'),
('0019', '2021/09/30', '100000', '94200', 'CLP'),
('0020', '2017/09/30', '15000', '19500', 'DJF'),
('0020', '2019/09/30', '51000', '20000', 'DJF'),
('0020', '2021/09/30', '90000', '21500', 'DJF'),
('0021', '2018/09/30', '6500', '20000', 'DJF'),
('0021', '2020/09/30', '40000', '22000', 'DJF'),
('0021', '2022/09/30', '100000', '23000', 'DJF'),
('0022', '2018/09/30', '9000', '23500', 'DJF'),
('0022', '2020/09/30', '21000', '23500', 'DJF'),
('0022', '2022/09/30', '45000', '24000', 'DJF'),
('0023', '2022/09/30', '15000', '43000', 'AMD'),
('0024', '2022/09/30', '10000', '46000', 'AMD'),
('0025', '2022/09/30', '10000', '48000', 'AMD'),
('0026', '2022/09/30', '10000', '42000', 'AMD');