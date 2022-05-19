create database bd_pets;
use bd_pets;

create table pet (
	id_pet     int not null primary key,
	nome_pet   varchar (40),
	raca       varchar (40)
);

insert into pet values (1, "Xuxu", "Street Dog");
insert into pet values (2, "Abobrinha", "Dog Alemao");
insert into pet values (3, "Vanderlei", "Bulldog");
insert into pet values (4, "Jujuba", "Bulldog");
insert into pet values (5, "Vincent", "Pinscher");
insert into pet values (6, "Cleber", "Street Dog");
insert into pet values (7, "Mauricio", "Bulldog");
insert into pet values (8, "Andreia", "Pastor Alemão");
insert into pet values (9, "Valeria", "Street Dog");
insert into pet values (10, "Jorge", "Street Dog");
-- select * from pet;

-- ________________________________________________________________________

create table proprietario (
	id_prop 	 int not null primary key,
    -- id_pet  	 int not null,
	nome_prop    varchar (40) not null
);

insert into proprietario values (1, "Arthur");
insert into proprietario values (2, "Valéria");
insert into proprietario values (3, "Joao");
insert into proprietario values (4, "Vagner");
insert into proprietario values (5, "Bruno");
insert into proprietario values (6, "Georgia");
insert into proprietario values (7, "Vinicius");
insert into proprietario values (8, "Matheus");
insert into proprietario values (9, "Guilherme");
insert into proprietario values (10, "Cristiano");
-- select * from proprietario;

-- ________________________________________________________________________

create table veterinario (
	id_vet 	   int not null primary key,
	nome_vet   varchar (40) not null
);

insert into veterinario values (1,"Dr. Adailton");
insert into veterinario values (2,"Dr. Maria");
insert into veterinario values (3,"Dr. Altair");
insert into veterinario values (4,"Dr. Mauro");
insert into veterinario values (5,"Dr. Renata");

-- UPDATE veterinario SET nome_vet = "Dr. Adailton" where id_vet=1;
-- UPDATE veterinario SET nome_vet = "Dr. Maria" where id_vet=2;
-- UPDATE veterinario SET nome_vet = "Dr. Altair" where id_vet=3;
-- select * from veterinario;

-- ________________________________________________________________________

create table funcionario (
	id_fun 	   int not null primary key,
	nome_fun   varchar (40) not null
);

insert into funcionario values (1,"Lucy");
insert into funcionario values (2,"Jorge");
insert into funcionario values (3,"Mariana");
insert into funcionario values (4,"Julia");
insert into funcionario values (5,"Gabriel");
-- select * from funcionario;

-- ________________________________________________________________________

create table atendimento (
	id_fun 		  int not null,
    id_vet 		  int not null,
    id_prop 	  int not null,
    id_pet 	 	  int not null,
    servico varchar(255)
);

insert into atendimento values (1, 1, 1, 1, "Banho");
insert into atendimento values (4, 2, 2, 2, "Consulta");
insert into atendimento values (3, 3, 3, 3, "Vacina");
insert into atendimento values (4, 2, 4, 4, "Consulta");
insert into atendimento values (5, 3, 5, 5, "Vacina");
insert into atendimento values (3, 1, 6, 6, "Banho");
insert into atendimento values (3, 1, 7, 7, "Banho");
insert into atendimento values (4, 2, 8, 8, "Consulta");
insert into atendimento values (3, 1, 9, 9, "Banho");
insert into atendimento values (3, 3, 10, 10, "Vacina");
-- select * from atendimento;

-- ________________________________________________________________________

-- Mostrar o nome e a raça dos pets atendidos por qual veterinário:
select pet.nome_pet, pet.raca, veterinario.nome_vet
from atendimento, pet, veterinario
where atendimento.id_pet = pet.id_pet and
	  atendimento.id_vet = veterinario.id_vet;

-- Mostrar o nome do funcionário, o nome e a raça dos pets que tomaram 'vacina'
select funcionario.nome_fun, pet.nome_pet, pet.raca, atendimento.servico 
from atendimento, funcionario, pet
where (atendimento.id_fun = funcionario.id_fun and
	  atendimento.id_pet = pet.id_pet) and 
      atendimento.servico = "Vacina";
      
-- Mostrar o nome do pet e o nome do proprietário dos pets da raça 'street dog'
select pet.nome_pet, proprietario.nome_prop, pet.raca 
from atendimento, proprietario, pet
where (atendimento.id_pet = pet.id_pet and
	  atendimento.id_prop = proprietario.id_prop) and 
      pet.raca = "Street Dog";

-- Mostrar o nome do funcionário e o nome do veterinário, que atenderam o pet (nome e raça) do proprietário (nome)
select funcionario.nome_fun, veterinario.nome_vet, pet.nome_pet, pet.raca, proprietario.nome_prop
from atendimento, proprietario, pet, veterinario, funcionario
where atendimento.id_fun = funcionario.id_fun and
	  atendimento.id_vet = veterinario.id_vet and 
      atendimento.id_pet = pet.id_pet and
      atendimento.id_prop = proprietario.id_prop;

-- Mostrar o nome dos pets que tomaram banho e qual funcionário deu o banho
select pet.nome_pet, atendimento.servico, funcionario.nome_fun
from pet, atendimento, funcionario
where (atendimento.id_pet = pet.id_pet and
	  atendimento.id_fun = funcionario.id_fun) and 
      atendimento.servico = "Banho";

-- Mostrar o nome do veterinário e do pet atendido em uma ´consulta'
select veterinario.nome_vet, pet.nome_pet, atendimento.servico
from atendimento, pet, veterinario
where (atendimento.id_pet = pet.id_pet and
	  atendimento.id_vet = veterinario.id_vet) and
      atendimento.servico = "Consulta";