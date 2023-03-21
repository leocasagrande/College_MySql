create database universidade;

use universidade;

create table professor(
	prof_id int not null primary key,
    nome varchar(20),
    rua varchar(20),
    cidade varchar(20)
);

create table aluno(
	aluno_id int not null primary key,
    nome varchar(20),
    rua varchar(20),
    cidade varchar(20)
);

create table disciplina(
	disc_id int not null primary key,
    nome_disc varchar(20),
    nome_curso varchar(20),
    qtd_aulas int
);

create table matricula(
	aluno_id int not null,
    disc_id int not null primary key,
    ano year,
    constraint fk_matricula foreign key (aluno_id) references aluno (aluno_id)
);

create table professor_disciplina(
	disc_id int not null,
	prof_id int not null primary key,
    ano year,
    constraint fk_prof foreign key (prof_id) references professor (prof_id),
    constraint fk_prof_disc foreign key (disc_id) references disciplina (disc_id)
); 

select * from professor;

insert into professor values (5678, "Nathan", "Albuquerque", "Brasilia");
insert into professor values (5679, "Lucas", "Laranjeiras", "Brasilia");
insert into professor values (5680, "Leonardo", "Gavea", "Brasilia");
insert into professor values (5681, "Cris", "Santos", "Brasilia"); 
insert into professor values (5682, "Kassya", "Barueri", "Brasilia");
insert into professor values (5683, "Claudio", "Ipanema", "Brasilia");
insert into professor values (5684, "Fred", "Albuquerque", "Brasilia");
insert into professor values (5685, "Conca", "Jardins", "Brasilia");
insert into professor values (5686, "Lima", "Barueri", "Brasilia");
insert into professor values (5687, "Nathan", "Soares", "Brasilia");

select * from aluno;

insert into aluno values (1111, "Jorge", "Laranjeiras", "Brasilia");
insert into aluno values (1112, "Davi", "Barueri", "Brasilia");
insert into aluno values (1113, "Caio", "Gavea", "Brasilia");
insert into aluno values (1114, "Pedro", "Olinda", "Brasilia");
insert into aluno values (1115, "Lucas", "Oliveira", "Brasilia");
insert into aluno values (1116, "Leonardo", "Castro", "Brasilia");
insert into aluno values (1117, "Julio", "Park", "Brasilia");
insert into aluno values (1118, "Julia", "Antonio", "Brasilia");
insert into aluno values (1119, "Amanda", "Limeira", "Brasilia");
insert into aluno values (1120, "Antonio", "Laranjeiras", "Brasilia");

select * from matricula;

insert into matricula values (1111, 100, 2022);
insert into matricula values (1112, 101, 2022);
insert into matricula values (1113, 100, 2022);
insert into matricula values (1114, 101, 2022);
insert into matricula values (1115, 100, 2022);
insert into matricula values (1116, 101, 2022);
insert into matricula values (1117, 101, 2022);
insert into matricula values (1118, 100, 2022);
insert into matricula values (1119, 100, 2022);
insert into matricula values (1120, 101, 2022);

select * from disciplina;

insert into disciplina values (100, "Lab BB", "BCC", 16);
insert into disciplina values (101, "Prog Estru", "BCC", 16);
insert into disciplina values (100, "Lab BB", "BCC", 16);
insert into disciplina values (101, "Prog Estru", "BCC", 16);
insert into disciplina values (100, "Lab BB", "BCC", 16);
insert into disciplina values (101, "Prog Estru", "BCC", 16);
insert into disciplina values (101, "Prog Estru", "BCC", 16);
insert into disciplina values (100, "Lab BB", "BCC", 16);
insert into disciplina values (100, "Lab BB", "BCC", 16);
insert into disciplina values (101, "Prog Estru", "BCC", 16);

select * from professor_disciplina;

insert into professor_disciplina values (101, 5678, 2010);
insert into professor_disciplina values (100, 5679, 2010);
insert into professor_disciplina values (101, 5680, 2010);
insert into professor_disciplina values (100, 5681, 2010);
insert into professor_disciplina values (100, 5682, 2010);
insert into professor_disciplina values (101, 5683, 2010);
insert into professor_disciplina values (101, 5684, 2010);
insert into professor_disciplina values (100, 5685, 2010);
insert into professor_disciplina values (101, 5686, 2010);
insert into professor_disciplina values (100, 5687, 2010);

select nome from professor;


