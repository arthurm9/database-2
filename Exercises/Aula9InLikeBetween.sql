-- 1 criar banco de dados, tabela e inserir registros
create database hospital;
use hospital; 

create table medicos(
idmed			int			not null,
medico			varchar(40) not null,
especialidade	varchar(20) not null,
salario			decimal(8,2)not null,
cidade			varchar(20) null,
idade			int			null,
primary key(idmed)
);

-- delete from medicos;
insert into medicos values (1,'Zenaide','urologista',2500,'bauru',52);
insert into medicos values (2,'Antenor','cardiologista',1500,'jau',NULL);
insert into medicos values (3,'Polinomia','ortopedista',3500,'bauru',57);
insert into medicos values (4,'Biafra','ortopedista',7500,'agudos',30);
insert into medicos values (5,'Welber','cardiologista',500,'bauru',38);
insert into medicos values (6,'Anpolina','clinico geral',5600,NULL,70);
insert into medicos values (7,'Juan Jose','cardiologista',500,'bauru',NULL);
insert into medicos values (8,'Hermes','clinico geral',2000,NULL,78);
insert into medicos values (9,'Humbelina','pediatra',500,'jau',56);
insert into medicos values (10,'Josefa','pediatra',1000,'jau',65);
insert into medicos values (11,'Cristaldo','urologista',6600,null,null);
insert into medicos values (12,'Delei','urologista',1345.99,' ',37);
insert into medicos values (13,'Lampião','pediatra',2999,'bauru',45);
insert into medicos values (14,'Mary Beatiful','clinico geral',3999,'agudos',39);

select * from medicos;

-- 2 Identificar algum registro campo NULL
-- testar CIDADE

select idmed 'ID', medico 'NOME', cidade 'CIDADE'
from medicos
where cidade is null;

-- TESTAR IDADE

select idmed 'ID', medico 'NOME', idade 'IDADE'
from medicos
where idade is null;

-- TESTAR IDADE ou CIDADE

select idmed 'ID', medico 'NOME', idade 'IDADE', cidade 'CIDADE'
from medicos
where idade is null or 
	  cidade is null;

-- TESTAR IDADE e CIDADE

select idmed 'ID', medico 'NOME', idade 'IDADE', cidade 'CIDADE'
from medicos
where idade is null and 
	  cidade is null;

-- 3 Identificar os demais registros do mesmo campo NOT NULL
-- TESTAR IDADE OU CIDADE

select idmed 'ID', medico 'NOME', idade 'IDADE', cidade 'CIDADE'
from medicos
where idade is not null or 
	  cidade is not null;

-- TESTAR CIDADE OU IDADE

select idmed 'ID', medico 'NOME', cidade 'CIDADE', idade 'IDADE'
from medicos
where cidade is not null and 
	  idade is not null;

-- 4 Listar médicos com salario entre 1000 e 2000
-- utilizar between

select idmed 'ID', medico 'NOME', salario 'SALÁRIO'
from medicos
where salario between 1000 and 2000;

-- 5 Listar médicos com idade entre 50 e 60 anos
-- utilizar between
 
 select idmed 'ID', medico 'NOME', idade 'IDADE'
from medicos
where idade between 50 and 60;

-- 5 Utilizando like mostrar médicos
-- NOME começa com J

select idmed 'ID', medico 'NOME'
from medicos
where medico like 'j%';

-- NOME começa com JUAN

select idmed 'ID', medico 'NOME'
from medicos
where medico like 'juan%';

-- NOME com a segunda letra U

select idmed 'ID', medico 'NOME'
from medicos
where medico like '_u%';

-- NOME com a letra A em qualquer posição

select idmed 'ID', medico 'NOME'
from medicos
where medico like '%a%';

-- NOME com a letra e ou i em qualquer posição

select idmed 'ID', medico 'NOME'
from medicos
where medico like '%i%' or
	  medico like '%e%';

-- NOME com e ou i em qualquer posição e cidade com b em qualquer posição

select idmed 'ID', medico 'NOME'
from medicos
where medico like '%e%' or 
	  medico like '%i%' and 
      cidade like '%b%';

-- utilizando IN
-- 6 Listar médicos com código 1, 4 ou 8.

select idmed 'ID', idmed 'ID', medico 'NOME'
from medicos
where idmed in (1,4,8);
      
-- listar medicos com nome welber,biafra,Justino e Zenaide

select idmed 'ID', medico 'NOME'
from medicos
where medico in ('welber','biafra','justino','zenaide');

-- listar médicos com salario 1000, 2000, 1345.99 e 9000

select idmed 'ID', medico 'NOME', salario 'SALARIO'
from medicos
where salario in (1000, 2000, 1345.99, 9000);

-- 7 Simular um reajuste de 10% no salario para:
-- TODOS os médicos

select idmed 'ID', medico 'NOME', salario + ((salario)*10/100) 'SALARIO'
from medicos;

-- Simular um reajuste de 10% no salario para medico especialista em ORTOPEDIA 
-- ou CARDIOLOGIA  
-- utilizar  IN

select idmed 'ID', medico 'NOME', salario + ((salario)*10/100) 'SALARIO', especialidade 'ESPECIALIDADE'
from medicos
where especialidade in ('ortopedista');

-- utilizar  LIKE
 
select idmed 'ID', medico 'NOME', salario + ((salario)*10/100) 'SALARIO', especialidade 'ESPECIALIDADE'
from medicos
where especialidade like 'ortopedista';

-- 9 Utilizando IN LIKE e BETWEEN 
-- mostrar médicos com a letra a em qualquer posição do nome e
-- salário entre 2500 e 3500 e
-- especialidade urologista oy ortopedista

select idmed 'ID', medico 'NOME', salario 'SALARIO', especialidade 'ESPECIALIDADE'
from medicos
where medico like '%a%' and
	  salario between 2500 and 3500 and
      especialidade in ('urologista', 'ortopedista');








