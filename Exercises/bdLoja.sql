create database bdLoja;
use bdLoja;

CREATE TABLE pessoas (
    idPessoa INT NOT NULL,
    nomePessoa VARCHAR(255) NOT NULL,
    telPessoa VARCHAR(255),
    PRIMARY KEY (idPessoa)
);

insert into pessoas (idPessoa, nomePessoa, telPessoa) values (1, "Arthur Marques", "(11) 98134-2355");
insert into pessoas (idPessoa, nomePessoa, telPessoa) values (2, "Lucas Vieira", "(11) 981774-3985");

CREATE TABLE veiculo (
    idVeiculo INT NOT NULL,
    modVeiculo VARCHAR(255) NOT NULL,
    preco DECIMAL(8 , 2 ),
    PRIMARY KEY (idVeiculo)
);

insert into veiculo (idVeiculo, modVeiculo, preco) values (10, "Mustang", 160000.00);
insert into veiculo (idVeiculo, modVeiculo, preco) values (20, "Porsche", 130000.00);

CREATE TABLE venda (
    idPessoa INT NOT NULL,
    idVeiculo INT NOT NULL
);

insert into venda (idPessoa, idVeiculo) values (1, 10);
insert into venda (idPessoa, idVeiculo) values (2, 20);

SELECT 
    pessoas.nomePessoa 'NOME PESSOA',
    veiculo.modVeiculo 'MODELO VEÍCULO',
    veiculo.preco 'PRECO'
FROM
    venda,
    pessoas,
    veiculo
WHERE
    venda.idPessoa = pessoas.idPessoa
        AND venda.idVeiculo = veiculo.idVeiculo;

SELECT 
    veiculo.modVeiculo 'MODELO VEÍCULO',
    pessoas.nomePessoa 'NOME PESSOA',
    pessoas.telPessoa 'TELEFONE'
FROM
    venda,
    pessoas,
    veiculo
WHERE
    venda.idPessoa = pessoas.idPessoa
        AND venda.idVeiculo = veiculo.idVeiculo;

SELECT 
    pessoas.nomePessoa 'NOME PESSOA',
    pessoas.telPessoa 'TELEFONE',
    veiculo.modVeiculo 'MODELO VEÍCULO',
    veiculo.preco 'PRECO'
FROM
    venda,
    pessoas,
    veiculo
WHERE
    venda.idPessoa = pessoas.idPessoa
        AND venda.idVeiculo = veiculo.idVeiculo;
