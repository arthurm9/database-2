create database vendas;
use vendas;

CREATE TABLE cliente (
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cliente VARCHAR(200)
);

CREATE TABLE vendedor (
    id_vendedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    vendedor VARCHAR(200)
);

CREATE TABLE pedido (
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    data_venda VARCHAR(100),
    valor INT,
    produto VARCHAR(100)
);

alter table pedido add constraint fk_pedido_vendedor foreign key (id_vendedor) references vendedor (id_vendedor);
alter table pedido add constraint fk_pedido_cliente foreign key (id_cliente) references cliente (id_cliente);

insert into cliente (cliente) values ("ETEC LTDA");
insert into vendedor (vendedor) values ("SUPPORT");
insert into pedido (id_cliente, id_vendedor, data_venda, valor, produto) values ('1', '1', "20/03/2022", 1500, "Televisor");

-- SELECT 
--    *
-- FROM
--    cliente;
-- SELECT 
--    *
-- FROM
--    vendedor;
-- SELECT 
--    *
-- FROM
--    pedido;

-- Pesquisa em múltiplas tabelas: 
select cliente.cliente, vendedor.vendedor, data_venda, produto, valor 
from pedido, cliente, vendedor 
where pedido.id_cliente = cliente.id_cliente 
and pedido.id_vendedor = vendedor.id_vendedor;

-- O ponto (.) relaciona uma tabela com seu campo. Cliente (tabela) . id_cliente (campo da tabela)

drop schema vendas; 