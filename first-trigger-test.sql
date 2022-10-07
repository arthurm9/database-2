create database loja;
use loja;

CREATE TABLE produto (
    idproduto INT NOT NULL AUTO_INCREMENT,
    produto VARCHAR(155),
    valor DECIMAL(8 , 2 ),
    estoque INT(100),
    PRIMARY KEY (idproduto)
);

CREATE TABLE cliente (
    idcliente INT NOT NULL AUTO_INCREMENT,
    cliente VARCHAR(155),
    PRIMARY KEY (idcliente)
);

CREATE TABLE vendedor (
    idvendedor INT NOT NULL AUTO_INCREMENT,
    vendedor VARCHAR(155),
    PRIMARY KEY (idvendedor)
);

CREATE TABLE venda (
    idvenda INT NOT NULL AUTO_INCREMENT,
    idproduto INT NOT NULL,
    idcliente INT NOT NULL,
    idvendedor INT NOT NULL,
    quantidadetotal INT(100),
    valortotal DECIMAL(8 , 2 ),
	PRIMARY KEY (idvenda)
);

insert into produto(idproduto, produto, valor, estoque) 
	values(1, 'alface', 8, 30);
insert into produto(idproduto, produto, valor, estoque) 
	values(2, 'coca-cola', 9.80, 50);
insert into produto(idproduto, produto, valor, estoque) 
	values(3, 'pão francês', 0.80, 80);

SELECT 
    *
FROM
    produto;

insert into cliente(idcliente, cliente) 
	values(1, 'quitanda da maria');
insert into cliente(idcliente, cliente) 
	values(2, 'bar do zé');
insert into cliente(idcliente, cliente) 
	values(3, 'padaria do daniel');

SELECT 
    *
FROM
    cliente;

insert into vendedor(idvendedor, vendedor) 
	values(1, 'gigantão');
insert into vendedor(idvendedor, vendedor) 
	values(2, 'santa catarina');
insert into vendedor(idvendedor, vendedor) 
	values(3, 'jaú serve');

SELECT 
    *
FROM
    vendedor;

insert into venda(idvenda, idproduto, idcliente, idvendedor, quantidadetotal, valortotal)
	values(1, 1, 1, 1, 20, 250);
insert into venda(idvenda, idproduto, idcliente, idvendedor, quantidadetotal, valortotal) 
	values(2, 2, 2, 2, 15, 120);
insert into venda(idvenda, idproduto, idcliente, idvendedor, quantidadetotal, valortotal) 
	values(3, 3, 3, 3, 50, 150);

SELECT 
    *
FROM
    venda;

CREATE TABLE comissao (
    idvenda INT NOT NULL,
    comissao DECIMAL(8 , 2 )
);

insert into comissao(idvenda, comissao) 
	values (1, 250 * 0.1);
insert into comissao(idvenda, comissao) 
	values (2, 120 * 0.1);
insert into comissao(idvenda, comissao) 
	values (3, 150 * 0.1);

SELECT 
    *
FROM
    comissao;

UPDATE produto 
SET 
    estoque = estoque - 20
WHERE
    idproduto = 1;
    
UPDATE produto 
SET 
    estoque = estoque - 15
WHERE
    idproduto = 2;
    
UPDATE produto 
SET 
    estoque = estoque - 50
WHERE
    idproduto = 3;
    
-- drop schema loja;