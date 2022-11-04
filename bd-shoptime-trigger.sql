create database shoptime;
use shoptime;

CREATE TABLE pedidos (
    dtcompra DATETIME,
    produto VARCHAR(40),
    qtdade INT,
    valor DECIMAL(7, 2),
    vendedor VARCHAR(40),
    comissao DECIMAL(6, 2)
);

insert into pedidos values ('2022/11/03', 'notebook dell', 1, 3750, 'Anpolino', 275);
insert into pedidos values ('2022/10/06', 'monitor full hd', 1, 1000, 'Gilcimara', 200);
insert into pedidos values ('2022/11/08', 'mouse gamer', 2, 230, 'Cléber', 120);
insert into pedidos values ('2022/12/04', 'pendrive 2tb', 2, 220, 'Gilcimara', 25);

CREATE TABLE entrega (
    produto VARCHAR(40),
    qtdade INT
);

CREATE TABLE vendadiaria (
    dtcompra DATETIME,
    vendedor VARCHAR(40)
);

CREATE TABLE comissaovendedor (
    dtcompra DATETIME,
    vendedor VARCHAR(40),
    comissao DECIMAL(5 , 2 )
);

CREATE TABLE valoresvenda (
    dtcompra DATETIME,
    valor DECIMAL(7 , 2 )
);

CREATE TABLE vendaprodutos (
    produto VARCHAR(40),
    valor DECIMAL(7 , 2 )
);

CREATE TABLE caixadia (
    valor DECIMAL(8 , 2 )
);

insert into entrega values ('notebook dell', 1);
insert into entrega values ('monitor full hd', 1);
insert into entrega values ('mouse gamer', 2);
insert into entrega values ('pendrive 2tb', 2);
  
insert into vendadiaria values ('2022/11/03', 'Anpolino');
insert into vendadiaria values ('2022/10/06', 'Gilcimara');
insert into vendadiaria values ('2022/11/08', 'Cléber');
insert into vendadiaria values ('2022/12/04', 'Gilcimara');

insert into comissaovendedor values ('2022/11/03', 'Anpolino', 275);
insert into comissaovendedor values ('2022/10/06', 'Gilcimara', 200);
insert into comissaovendedor values ('2022/11/08', 'Cléber', 120);
insert into comissaovendedor values ('2022/12/04', 'Gilcimara', 25);

insert into valoresvenda values ('2022/11/03', 3570);
insert into valoresvenda values ('2022/10/06', 1000);
insert into valoresvenda values ('2022/11/08', 230);
insert into valoresvenda values ('2022/12/04', 220);

insert into vendaprodutos values ('notebook dell', 3570);
insert into vendaprodutos values ('monitor full hd', 1000);
insert into vendaprodutos values ('mouse gamer', 230);
insert into vendaprodutos values ('pendrive 2tb', 220);

insert into caixadia values (0);
UPDATE caixadia 
SET 
    valor = valor + 3570;
UPDATE caixadia 
SET 
    valor = valor + 1000;
UPDATE caixadia 
SET 
    valor = valor + 230;
UPDATE caixadia 
SET 
    valor = valor + 220;

delimiter $$
create trigger Tgr_ItensPedido_Insert after insert
on pedidos
for each row
begin
    insert into entrega set produto = new.produto, qtdade = new.qtdade;
    insert into comissaovendedor set dtcompra = new.dtcompra, vendedor = new.vendedor, comissao = new.comissao * 0.1;
    insert into vendadiaria set dtcompra = new.dtcompra, vendedor = new.vendedor;
    update caixadia set valor = valor + new.valor;
END $$

-- drop trigger Tgr_ItensPedido_Insert;

insert into pedidos values('2022/11/10','cadeira gamer',1,1700,'Ze',55);
insert into pedidos values('2022/11/11','i9',1,5000,'João',90);
insert into pedidos values('2022/11/10','teclado gamer',1,350,'Ambrosio',15);
insert into pedidos values('2022/11/11','gabinete',1,500,'Ze',80);
insert into pedidos values('2022/11/13','fone de ouvido',2,160,'Ambrosio',10);
insert into pedidos values('2022/11/15','cabo hdmi',5,100,'Ze',40);
insert into pedidos values('2022/11/14','moto g 10',1,1750,'Ambrosio',30);
insert into pedidos values('2022/11/13','estabilizador',2,300,'João',20);
insert into pedidos values('2022/11/15','carregador celular',2,90,'João',15);
insert into pedidos values('2022/11/14','microfone',2,720,'Ze',60);
insert into pedidos values('2022/11/14','power bank',1,350,'João',15);
insert into pedidos values('2022/11/16','mousepad',2,130,'Ambrosio',10);

select * from pedidos;
select * from entrega;
select * from vendadiaria;
select * from valoresvenda;
select * from comissaovendedor;
select * from vendaprodutos;
select * from caixadia;