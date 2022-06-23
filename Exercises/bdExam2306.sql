-- AVALIAÇÃO - BD II - Turma A - 2º Bimestre - 23/06/2022
-- Leia a prova com atenção e analise atentamente as tabelas.
-- Desenvolva SOMENTE o que for solicitado no enunciado do exercício.
-- PROIBIDO editar ou apagar o enunciado.
-- Desenvolva o script SEMPRE abaixo do seu enunciado.
-- NÃO é necessário inserir registros para a resolução dos exercícios, BASTA desenvolver o script.
-- Cada questão vale 1 ponto

-- OBS: os inserts são para teste!

create database prova2;
use prova2;

CREATE TABLE medicos (
    cod_medico INT NOT NULL,
    nome VARCHAR(40) NOT NULL,
    especialidade VARCHAR(35) NOT NULL,
    salario DECIMAL(9 , 2 ) NOT NULL,
    cidade VARCHAR(35) NOT NULL
);

 insert into medicos values (1, 'arthur', 'cardiologista', 2000, 'bauru');
  insert into medicos values (2, 'marcelo', 'urologista', 3000, 'agudos');
   insert into medicos values (3, 'daniela', 'terapeuta', 4000, 'jau');
     insert into medicos values (4, 'paulo', 'urologista', 6000, 'agudos');
   insert into medicos values (5, 'fernanda', 'terapeuta', 7000, 'jau');

CREATE TABLE enfermeiros (
    cod_enfermeiro INT NOT NULL,
    nome VARCHAR(40) NOT NULL,
    data_admissao DATETIME NOT NULL,
    salario DECIMAL(7 , 2 ) NOT NULL,
    cidade VARCHAR(35) NOT NULL,
    idade INT NOT NULL
);

insert into enfermeiros values (1, 'antonio', '2022/01/01', 2600, 'agudos', 21);
insert into enfermeiros values (2, 'pedro', '2022/02/02', 2000, 'bauru', 20);
insert into enfermeiros values (3, 'marcelo', '2022/03/03', 4000, 'agudos', 25);

CREATE TABLE pacientes (
    cod_paciente INT NOT NULL,
    nome VARCHAR(40) NOT NULL,
    cidade VARCHAR(35) NOT NULL,
    idade INT NOT NULL,
    sexo CHAR(1) NOT NULL
);

insert into pacientes values (1, 'mauricio', 'lencois paulista', 28, 'f');
insert into pacientes values (2, 'amanda', 'bauru', 18, 'f');
insert into pacientes values (3, 'paula', 'agudos', 19, 'f');
insert into pacientes values (4, 'geraldo', 'lencois paulista', 15, 'm');
insert into pacientes values (5, 'armando', 'lencois paulista', 16, 'm');

CREATE TABLE consulta (
    cod_consulta INT NOT NULL,
    dtconsulta DATETIME NOT NULL,
    cod_medico INT NOT NULL,
    cod_enfermeiro INT NOT NULL,
    cod_paciente INT NOT NULL
);

 insert into consulta values (1, '2020/03/16', 1, 1, 1);

-- 1 – Informe o total de médicos cardiologistas ou urologistas
--     que moram em bauru ou agudos com salário entre 2999 e 5999.

SELECT 
    COUNT(nome) 'TOT MEDICOS'
FROM
    medicos
WHERE
    (especialidade = 'cardiologista'
        OR especialidade = 'urologista')
        AND (cidade = 'bauru' OR cidade = 'agudos')
        AND salario >= 2999
        AND salario <= 5999;

-- 2 – Mostrar a soma dos salários dos enfermeiros 
--     que moram em são paulo ou brasilia e com salário entre 1999 e 3999.

SELECT 
    SUM(salario) 'SOMA SALÁRIO'
FROM
    enfermeiros
WHERE
    (cidade = 'sao paulo'
        OR cidade = 'brasilia')
        AND salario >= 1999
        AND salario <= 3999;

-- 3 – Mostrar o valor médio dos salários dos médicos que morem em bauru ou agudos
--     cuja especialidade não for dentista.

SELECT 
    CAST(AVG(salario) AS DECIMAL (8 , 2 )) 'MÉDIA SALARIAL'
FROM
    medicos
WHERE
    (cidade = 'bauru' OR cidade = 'agudos')
        AND especialidade != 'dentista';

-- 4 – Mostrar SOMENTE a idade do paciente mais novo do sexo feminino.

SELECT 
    MIN(idade) 'MENOR IDADE'
FROM
    pacientes
WHERE
    sexo = 'f';

-- 5 – Mostrar SOMENTE a idade do paciente mais velho do sexo masculino
--     que mora em Lençois Paulista.

SELECT 
    MAX(idade) 'MAIOR IDADE'
FROM
    pacientes
WHERE
    sexo = 'm'
        AND cidade = 'lencois paulista';

-- 6 – Informe a quantidade de especialidades dos médicos disponíveis na cidade de bauru

SELECT 
    COUNT(especialidade) 'QTD ESPECIALIDADE'
FROM
    medicos
WHERE
    cidade = 'bauru';

-- 7 – Relacionando as tabela consulta com médicos, enfermeiros e pacientes
--     mostar o nome do médico, o nome do enfermeiro e o nome do paciente.

SELECT 
    medicos.nome 'NOME MÉDICO',
    enfermeiros.nome 'NOME ENFERMEIRO',
    pacientes.nome 'NOME PACIENTE'
FROM
    consulta,
    medicos,
    enfermeiros,
    pacientes
LIMIT 1;

-- 8 – Mostrar a quantidade de médicos, a soma dos salários dos médicos, o maior
--     e o menor salário dos médicos e a média salarial dos médicos em um
--     ÚNICO script

SELECT 
    COUNT(nome) 'QTD MEDICOS',
    SUM(salario) 'SOMA SALÁRIO',
    MAX(salario) 'MAIOR SALÁRIO',
    MIN(salario) 'MENOR SALÁRIO',
    CAST(AVG(salario) AS DECIMAL (8 , 2 )) 'MÉDIA SALARIAL'
FROM
    medicos;

-- 9 – Mostrar apenas uma ocorrência das especialidades médicas cadastradas.

SELECT DISTINCT
    especialidade 'ESPECIALIDADE'
FROM
    medicos;

-- 10 – Mostrar o valor médio do salário dos enfermeiros, o maior salário dos enfermeiros, 
--      o menor salário dos enfermeiros e a soma de todos os salários dos enfermeiros 
--      que moram em bauru ou agudos, com idade entre 20 e 25 anos
--      com salário entre 1300 e 5700 em um ÚNICO script.

SELECT 
    CAST(AVG(salario) AS DECIMAL (8 , 2 )) 'MÉDIA SALARIAL',
    MAX(salario) 'MAIOR SALÁRIO',
    MIN(salario) 'MENOR SALÁRIO',
    SUM(salario) 'SOMA SALÁRIO'
FROM
    enfermeiros
WHERE
    (cidade = 'bauru' OR cidade = 'agudos')
        AND idade >= 20
        AND idade <= 25
        AND salario >= 1300
        AND salario <= 5700;