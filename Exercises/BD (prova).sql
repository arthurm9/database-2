create database prova; 
use prova;

CREATE TABLE alunos (
    idAluno INT NOT NULL,
    nome VARCHAR(255),
    telefone VARCHAR(255),
    PRIMARY KEY (idAluno)
);

insert into alunos (idAluno, nome, telefone) values (1, "André", "(14) 99238-3784");
insert into alunos (idAluno, nome, telefone) values (2, "Bruno", "(14) 99293-3989");
insert into alunos (idAluno, nome, telefone) values (3, "Carlos", "(14) 9822-3115");

CREATE TABLE professores (
    idProf INT NOT NULL,
    nome VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (idProf)
);

insert into professores (idProf, nome, email) values (10, "Douglas", "douglasprof10@gmail.com");
insert into professores (idProf, nome, email) values (20, "Eduardo", "eduardoprof20@gmail.com");
insert into professores (idProf, nome, email) values (30, "Fabiano", "fabianoprof30@gmail.com");

CREATE TABLE disciplinas (
    idDisc INT NOT NULL,
    nomeDisc VARCHAR(255),
    PRIMARY KEY (idDisc)
);

insert into disciplinas (idDisc, nomeDisc) values (100, "Matematica");
insert into disciplinas (idDisc, nomeDisc) values (200, "Português");
insert into disciplinas (idDisc, nomeDisc) values (300, "Inglês");

CREATE TABLE aulas (
    idAluno INT NOT NULL,
    idProf INT NOT NULL,
    idDisc INT NOT NULL
);

insert into aulas (idAluno, idProf, idDisc) values (1,10,100);
insert into aulas (idAluno, idProf, idDisc) values (2,20,200);
insert into aulas (idAluno, idProf, idDisc) values (3,30,300);

SELECT 
    alunos.nome 'NOME', disciplinas.nomeDisc 'DISCIPLINA'
FROM
    aulas,
    alunos,
    disciplinas
WHERE
    aulas.idAluno = alunos.idAluno
        AND aulas.idDisc = disciplinas.idDisc;
      
SELECT 
    professores.nome 'NOME PROF',
    disciplinas.nomeDisc 'DISCIPLINA'
FROM
    aulas,
    professores,
    disciplinas
WHERE
    aulas.idProf = professores.idProf
        AND aulas.idDisc = disciplinas.idDisc;
      
SELECT 
    alunos.nome 'NOME ALUNO',
    alunos.telefone 'TEL',
    professores.nome 'NOME PROF'
FROM
    aulas,
    alunos,
    professores
WHERE
    aulas.idAluno = alunos.idAluno
        AND aulas.idProf = professores.idProf;
      
SELECT 
    alunos.nome 'NOME ALUNO',
    professores.nome 'NOME PROF',
    professores.email 'EMAIL PROF'
FROM
    aulas,
    alunos,
    professores
WHERE
    aulas.idAluno = alunos.idAluno
        AND aulas.idProf = professores.idProf;
      
SELECT 
    alunos.nome 'NOME ALUNO',
    professores.nome 'NOME PROF',
    disciplinas.nomeDisc 'DISCIPLINAS'
FROM
    aulas,
    alunos,
    professores,
    disciplinas
WHERE
    aulas.idAluno = alunos.idAluno
        AND aulas.idProf = professores.idProf
        AND aulas.idDisc = disciplinas.idDisc;