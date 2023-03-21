create table departamento(
    id_dep int(3) auto_increment primary key,
    nome_dep varchar(50) not null
);

create table funcionario(
    id_func int(3) auto_increment primary key,
    nome_func varchar(50) not null,
    nascimento_func date not null,
    salario_func int(6) not null,
    id_dep int(3) not null,
    constraint fk_dep foreign key (id_dep) references departamento(id_dep)
);

create table dependente(
    id_dependente int(3) not null auto_increment primary key,
    nome_dependente varchar(50) not null,
    id_func int(3) not null,
    CONSTRAINT fk_func foreign key (id_func) references funcionario(id_func)
);

insert into departamento values (0,"DIRCO");
insert into departamento values (0,"DELTA");
insert into departamento values (0,"DOOR");
insert into departamento values (0,"DIR");
insert into departamento values (0,"DER");
insert into departamento values (0,"DETRAN");
insert into departamento values (0,"DARV");
insert into departamento values (0,"DOT");

insert into funcionario values (0,"Leonardo","2003-06-26",1000,1);
insert into funcionario values (0,"Vithor","2001-02-10",6500,4);
insert into funcionario values (0,"Cristiano","2002-01-12",8100,3);
insert into funcionario values (0,"Tulio","2000-10-29",7000,2);
insert into funcionario values (0,"Daniel","2000-10-29",7000,1);
insert into funcionario values (0,"Pedro","2000-10-29",7000,5);
insert into funcionario values (0,"Guilherme","2000-10-29",7000,4);

insert into dependente values (0,"Jorge",1);
insert into dependente values (0,"Eduardo",3);
insert into dependente values (0,"Borges",2);
insert into dependente values (0,"Dudu",4);
insert into dependente values (0,"John Arias",4);
insert into dependente values (0,"German Cano",4);
insert into dependente values (0,"Andre",4);

select nome_dep, nome_func from funcionario inner join departamento on funcionario.id_dep = departamento.id_dep;



