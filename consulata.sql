create database clinica_medica;
use clinica_medica;

create table consulta (
	valor decimal(7,2),
    paciente varchar(150),
    desconto_plano decimal(7,2),
    tipo varchar(150),
    medico varchar(150),
    data_consulta datetime
);

create table caixa_dia (
    medico varchar(150),
	valor decimal(7,2)
);

create table agendamento_secretaria (
	paciente varchar(150),
    data_consulta datetime,
    medico varchar(150)
);

create table agendamento_paciente (
	valor decimal(7,2),
    data_consulta datetime
);

create table caixa_total (
	valor decimal(7,2)
);

create table agendamento_medico (
	paciente varchar(150),
    data_consulta datetime,
    tipo varchar(150)
);

insert into caixa_total values (0);
insert into caixa_dia values ('Rogério da Silva', 0),
							 ('Marco Vieira',     0),
                             ('Ronan Marques',    0);

delimiter $$
create trigger Tgr_Consulta_Insert after insert
on consulta
for each row
begin
    insert into agendamento_secretaria set paciente = new.paciente, data_consulta = new.data_consulta, medico = new.medico;
    insert into agendamento_paciente set valor = new.valor - (new.valor * new.desconto_plano), data_consulta = new.data_consulta;
    insert into agendamento_medico set paciente = new.paciente, data_consulta = new.data_consulta, tipo = new.tipo;
    update caixa_dia set valor = valor +  new.valor - (new.valor * new.desconto_plano) where medico = new.medico;
    update caixa_total set valor = valor +  new.valor - (new.valor * new.desconto_plano);
end $$

insert into consulta values (150, 'Sidney Vieira Crisóstomo de Oliveira', 0.2, 'Endoscopia', 'Rogério da Silva', '2001/09/11 08:46:24'),
							(500, 'Rock Balboa', 0.6, 'Dentista', 'Marco Vieira', '1889/11/15 13:02:56'),
							(5000, 'Geovana do Pradro', 0, 'Cardiologia', 'Ronan Marques', '2022/9/15 22:25:58');
                            
select * from consulta;
select * from caixa_dia;
select * from agendamento_secretaria;
select * from agendamento_paciente;
select * from agendamento_medico;
select * from caixa_total;