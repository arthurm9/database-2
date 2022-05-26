create database hospital;
use hospital;

create table medicos(
	Idmed int not null,
	Medico varchar(40) not null,
	Especialidade varchar(20) not null,
	Salario decimal(8,2) not null,
	Cidade varchar(20) not null,
	Idade int null,
	Dtadm datetime not null,
	primary key (idmed)
);

insert into medicos values (1,'Zenaide','urologista',2500,'bauru',52,'01/01/2000');
insert into medicos values (2,'Antenor','cardiologista',1500,'jau',NULL,'01/01/2020');
insert into medicos values (3,'Polinomia','ortopedista',3500,'bauru',57,'01/01/1999');
insert into medicos values (4,'Biafra','ortopedista',7500,'agudos',30,'31/10/2010');
insert into medicos values (5,'Welber','cardiologista',500,'bauru',38,'01/01/2000');
insert into medicos values (6,'Anpolina','clinico geral',5600,'agudos',70,'01/01/2020');
insert into medicos values (7,'Juan','cardiologista',500,'bauru',NULL,'15/12/2017');
insert into medicos values (8,'Hermes','clinico geral',2000,'agudos',78,'31/10/2010');
insert into medicos values (9,'Humbelina','pediatra',500,'jau',56,'31/10/2010');
insert into medicos values (10,'Josefa','pediatra',1000,'jau',65,'01/07/2020');
insert into medicos values (11,'Cristaldo','urologista',6600,'agudos',null,'01/01/2000');
insert into medicos values (12, 'Marta','urologista',1345.99,'agudos ',37,'01/01/2020');
insert into medicos values (13,'Carlos','urologista',3500,'são paulo',52,'01/01/2021');
insert into medicos values (14,'Joaquina','cardiologista',4500,'jau',NULL,'01/01/2022');
insert into medicos values (15,'Kaique','ortopedista',5500,'bauru',57,'01/01/2020');
insert into medicos values (16,'Bill','ortopedista',7500,'são paulo',30,'31/10/2021');
insert into medicos values (17,'Roque','cardiologista',5500,'bauru',38,'01/01/2022');
insert into medicos values (18,'Marildo','clinico geral',5600,'agudos',70,'01/01/2021');
insert into medicos values (19,'Mari','cardiologista',7500,'são paulo',NULL,'15/12/2017');
insert into medicos values (20,'Mirtes','clinico geral',8000,'agudos',78,'31/10/2020');
insert into medicos values (21,'Silvia','pediatra',5100,'jau',56,'31/10/2021');
insert into medicos values (22,'Marta','pediatra',8000,'são paulo',65,'01/07/2022');
insert into medicos values (23,'Cristina','urologista',6600,'agudos',null,'01/01/2021');
insert into medicos values (24,'Shirley','urologista',2345.99,'agudos ',37,'01/01/2020');
insert into medicos values (25,'Tildo','obstetra',3500,'são paulo',33,'01/01/2021');
insert into medicos values (26,'Tulio','cardiologista',4500,'jau',44,'01/01/2022');
insert into medicos values (27,'Tabata','obstetra',5500,'bauru',55,'01/01/2020');
insert into medicos values (28,'Thaina','ortopedista',7500,'são paulo',45,'31/10/2021');
insert into medicos values (29,'Rita','cardiologista',5500,'bauru',55,'01/01/2022');
insert into medicos values (30,'Rute','obstetra',5600,'agudos',61,'01/01/2021');
insert into medicos values (31,'Raquel','cardiologista',7500,'são paulo',29,'15/12/2017');
insert into medicos values (32,'Carla','clinico geral',8000,'agudos',30,'31/10/2020');
insert into medicos values (33,'Katarina','obstetra',5100,'jau',31,'31/10/2021');
insert into medicos values (34,'Giovani','pediatra',8000,'são paulo',45,'01/07/2022');
insert into medicos values (35,'Giovana','obstetra',6600,'agudos',46,'01/01/2021');
insert into medicos values (36,'Abigail','obstetra',2345.99,'agudos ',47,'01/01/2020');
insert into medicos values (37,'Dilso','obstetra',4500,'são paulo',51,'01/01/2021');
insert into medicos values (38,'Duilio','pediatra',4500,'jau',52,'01/01/2022');
insert into medicos values (39,'Duane','obstetra',6500,'bauru',53,'01/01/2020');
insert into medicos values (40,'Rui','ortopedista',7500,'são paulo',59,'31/10/2021');
insert into medicos values (41,'Rubens','cardiologista',9500,'bauru',60,'01/01/2022');
insert into medicos values (42,'Ruiz','obstetra',2600,'agudos',61,'01/01/2021');
insert into medicos values (43,'Bruno','pediatra',3500,'são paulo',70,'15/12/2017');
insert into medicos values (44,'Bruna','clinico geral',4000,'agudos',30,'31/10/2020');
insert into medicos values (45,'Rubia','obstetra',5100,'jau',20,'31/10/2021');
insert into medicos values (46,'Harry','pediatra',7000,'são paulo',30,'01/07/2022');
insert into medicos values (47,'Potter','urologista',8600,'agudos',46,'01/01/2021');
insert into medicos values (48,'Hermione','obstetra',4345.99,'agudos',47,'01/01/2020');

-- Informe o total de médicos cadastrados.
select count(Medico) 'TOT MÉDICOS'
from medicos;

-- Informe o total de especialidades cadastradas.
select count(Especialidade) 'TOT ESPECIALIDADES'
from medicos;

-- Informe o valor médio do salário dos médicos
select CAST(AVG(Salario) AS DECIMAL (8,2)) 'MÉDIA SALARIAL'
from medicos;

-- Informe o maior salário pago para um médico.
select MAX(Salario) 'SALÁRIO MAX'
from medicos;

-- Informe o menor salário entre os médicos de bauru ou agudos.
select MIN(Salario) 'SALÁRIO MIN'
from medicos
where (cidade = 'bauru' or cidade = 'agudos');

-- Informe o total de urologistas
select count(Especialidade) 'TOT UROLO'
from medicos
where (Especialidade = 'urologista');