create database loja;
use loja;

create table hidratante (
	idHid int not null primary key,
    hid varchar(255),
    precoHid decimal(6,2) not null
);

insert into hidratante values (1, "Nivea", 15);
insert into hidratante values (2, "Dove", 12);
insert into hidratante values (3, "Giovanna Baby", 20);

-- ___________________________________________________________________________________________

create table shampoo (
	idShamp int not null primary key,
    shamp varchar(255),
    precoShamp decimal(6,2) not null
);

insert into shampoo values (1, "Tres Emmé", 10);
insert into shampoo values (2, "Darling", 7);
insert into shampoo values (3, "Elseve", 11);

-- ___________________________________________________________________________________________

create table sabonete (
	idSab int not null primary key,
    sab varchar(255),
    precoSab decimal(6,2) not null
);

insert into sabonete values (1, "Lux", 2);
insert into sabonete values (2, "Dove", 3);
insert into sabonete values (3, "Nivea", 2.9);

-- ___________________________________________________________________________________________

create table clientes (
	idCli int not null primary key,
    nomeCli varchar(255), 
    desconto decimal(6,2)
);

insert into clientes values (1, "Jorge Amado", 7);
insert into clientes values (2, "Vitor Gabriel", 5);
insert into clientes values (3, "Marina Souza", 10);

drop table clientes;
-- ___________________________________________________________________________________________

create table vendedores (
	idVenor int not null primary key,
    nomeVenor varchar(255), 
    comissao decimal(6,2)
);

insert into vendedores values (1, "Vagner Carvalho", 8);
insert into vendedores values (2, "Julia Fernanda", 10);
insert into vendedores values (3, "Gabriela Medeiros", 6);

-- ___________________________________________________________________________________________

create table vendas (
	idVen int not null primary key,
    dtVen date,
    idVenor int not null,
    idHid int not null,
    idSham int not null,
    idSab int not null
);

insert into vendas values (1, DATE (NOW()),1, 1,2,2);
insert into vendas values (2, DATE (NOW()),2, 2,1,3);
insert into vendas values (3, DATE (NOW()),3, 1,1,1);
insert into vendas values (4, DATE (NOW()),2, 3,2,1);
 
 -- ___________________________________________________________________________________________
 
 -- SELECT'S
-- Qual o valor da compra?

select (hidratante.precoHid + shampoo.precoShamp + sabonete.precoSab) 'TOTAL'
from vendas, hidratante, shampoo, sabonete
where vendas.idHid = hidratante.idHid and
	  vendas.idSham = shampoo.idShamp and
      vendas.idSab = sabonete.idSab;
      
-- Qual o valor a pagar pelo cliente?

select (hidratante.precoHid + shampoo.precoShamp + sabonete.precoSab) - ((hidratante.precoHid + shampoo.precoShamp + sabonete.precoSab)) * (clientes.desconto / 100) 'DESCONTO 10%'
from vendas, hidratante, shampoo, sabonete
where vendas.idHid = hidratante.idHid and
	  vendas.idSham = shampoo.idShamp and
      vendas.idSab = sabonete.idSab;
      
-- Qual o valor da comissão?

select  vendedores.nomeVenor 'VENDEDOR/VENDA', ((hidratante.precoHid + shampoo.precoShamp + sabonete.precoSab) * vendedores.comissao) 'COMISSAO FINAL'
from vendas, vendedores, hidratante, shampoo, sabonete
where vendas.idVenor =  vendedores.idVenor and
	  vendas.idHid = hidratante.idHid and
	  vendas.idSham = shampoo.idShamp and
      vendas.idSab = sabonete.idSab;
	  
-- Mostrar todas as vendas com valor de compra, valor pago pelo cliente e o valor da comissão

SELECT vendas.idVen "ID",
(hidratante.precoHid + shampoo.precoShamp + sabonete.precoSab) "VALOR COMPRA",
(hidratante.precoHid + shampoo.precoShamp + sabonete.precoSab) - ((hidratante.precoHid + shampoo.precoShamp + sabonete.precoSab) * clientes.desconto / 100) 'VALOR A PAGAR',
(hidratante.precoHid + shampoo.precoShamp + sabonete.precoSab) * (vendedores.comissao / 100) "COMISSÃO FINAL"
FROM hidratante, shampoo, sabonete, vendedores, clientes , venda
WHERE venda.idHid = hidratante.idHid and 
venda.idShamp = shampoo.idShamp and 
venda.idSab = sabonete.idSab and 
venda.idVen = venda.idVen and 
venda.idCli = clientes.idCli;
