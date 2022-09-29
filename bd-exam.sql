create database prova;
use prova;
 
CREATE TABLE transporte (
    empresa VARCHAR(30) NOT NULL,
    modelo VARCHAR(30) NOT NULL,
    rota VARCHAR(30) NOT NULL,
    capacidade INT NOT NULL,
    precofrete DECIMAL(8 , 2 ) NOT NULL,
    periodo VARCHAR(15) NOT NULL,
    motorista VARCHAR(25) NOT NULL
);

SELECT 
    *
FROM
    transporte;

insert into transporte values ('prata','onibus','estadual',45,3500,'manha','abelardo');
insert into transporte values ('reunidas','onibus','estadual',50,4500,'manha','turbucio');
insert into transporte values ('prata','onibus','estadual',45,3500,'tarde','marco');
insert into transporte values ('reunidas','onibus','estadual',50,4500,'tarde','bidu');
insert into transporte values ('reunidas','onibus','estadual',50,4400,'tarde','hindenburgo');
insert into transporte values ('prata','van','municipal',15,3300,'manha','roque');
insert into transporte values ('reunidas','van','municipal',12,4300,'manha','sidney');
insert into transporte values ('prata','van','municipal',15,3600,'tarde','ronan');
insert into transporte values ('reunidas','van','municipal',12,4600,'tarde','tomejerry');
insert into transporte values ('prata','van','municipal',16,3750,'tarde','sandy');
insert into transporte values ('reunidas','van','municipal',13,4690,'tarde','junior');
insert into transporte values ('prata','aviao','nacional',180,33500,'noite','Julibela');
insert into transporte values ('reunidas','aviao','nacional',160,43500,'noite','Belagil');
insert into transporte values ('prata','aviao','nacional',180,31500,'noite','Gilcimara');
insert into transporte values ('reunidas','aviao','nacional',160,41500,'noite','Gilciane');

-- 1 -- mostrar o valor medio(precofrete) do frete agrupado por modelos
-- mas somente os veículos que fazem a rota municipal ou estadual
-- no período da manha ou tarde

select modelo 'Modelo', rota 'Rota', cast(avg(precofrete) as decimal (8,2)) 'Frete Médio'
from transporte 
where (rota = 'municipal' or rota = 'estadual') and
	  (periodo = 'manha' or periodo = 'tarde')
group by modelo;

-- 2 mostrar a soma dos passareiros transportados(capacidade) agrupados por
-- empresa e modelo, exceto os aviões, ordenado por empresa

select modelo 'Modelo', empresa 'Empresa', sum(capacidade) 'QTD Passageiros'
from transporte
group by empresa, modelo
having modelo != 'aviao'
order by empresa;

-- 3 -- mostrar as transportadoras agrupadas por empresa,modelo,rota

select empresa 'Empresa', modelo 'Modelo', rota 'Rota', capacidade 'Capacidade', precofrete 'Preço do Frete', periodo 'Período', motorista 'Motorista'
from transporte
group by empresa, modelo, rota;

-- 4 -- agrupando por empresa, informar o total de motoristas de cada empresa

select empresa 'Empresa', count(motorista) 'QTD Motoristas'
from transporte
group by empresa;

-- 5 -- qual o valor medio do frete agrupado por rota

select rota 'Rota', cast(avg(precofrete) as decimal (8,2)) 'Frete Médio'
from transporte
group by rota;

-- 6 -- qual a valor medio de passageiros agrupados por periodo
-- levando em consideração todos os veículos com sua capacidade máxima

select modelo 'Modelo', periodo 'Período', cast(avg(capacidade) as decimal (8,2)) 'Passageiros Médio'
from transporte 
group by periodo;

-- 7 -- informe a quantidade veiculos agrupados por modelo

select modelo 'Modelo', count(modelo) 'QTD Veículos'
from transporte
group by modelo;

-- 8 -- agrupados por periodo, informe a maior capacidade de transporte de cada periodo
-- exceto o periodo da manha e também apenas com veículos com capacidade superior a 60
-- passageiros

select periodo 'Período', modelo 'Modelo', max(capacidade) 'Capacidade Máxima'
from transporte
where capacidade > 60
group by periodo
having periodo != 'manha';

-- 9 -- agrupados por empresa qual o menor frete de cada grupo

select empresa 'Empresa', min(precofrete) 'Menor Frete'
from transporte
group by empresa;

-- 10 ebalore um script que utilize pelo menos 1 agrupamento e todas as opções
-- de agregação de valor (utilizar campos diferentes - pelo menos 2), 
-- utilizando ainda where, having e order by

select empresa 'Empresa', count(motorista) 'Motorista', sum(capacidade) 'Capacidade Máxima', min(precofrete) 'Menor Frete', max(precofrete) 'Maior Frete', cast(avg(precofrete) as decimal (8,2)) 'Frete Médio'
from transporte
where capacidade > 60 and precofrete > 4400
group by empresa
having empresa like 'p%'
order by capacidade;