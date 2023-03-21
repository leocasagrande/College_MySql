create database hospital;

use hospital;

create table medico(
    cod_medico int(3) auto_increment primary key,
    nome_medico varchar(30) not null
);

create table medicamento(
    cod_medicamento int(3) auto_increment primary key,
    nome_medicamento varchar(30) not null
);
 
create table paciente(
    cod_paciente int(3) auto_increment primary key,
    nome_paciente varchar(30) not null
);

create table consulta(
    cod_consulta int(3) auto_increment primary key,
    dataa date not null,
    cod_medico int(3) not null,
    cod_paciente int(3) not null,
    constraint fk_medico foreign key (cod_medico) references medico(cod_medico),
    constraint fk_paciente foreign key (cod_paciente) references paciente(cod_paciente)
);

create table prescicao(
    posologia varchar(50) not null,
    cod_consulta int(3) not null,
    cod_medicamento int(3) not null,
    constraint fk_consulta foreign key (cod_consulta) references consulta(cod_consulta),
    constraint fk_medicamento foreign key (cod_medicamento) references medicamento(cod_medicamento)
);

insert into medico values (0,"Bruno");
insert into medico values (0,"Caio");
insert into medico values (0,"Bernardo");
insert into medico values (0,"Julio");
insert into medico values (0,"Cris");

insert into medicamento values (0,"Buscopan");
insert into medicamento values (0,"Azatioprina");
insert into medicamento values (0,"Infliximabe");
insert into medicamento values (0,"Atenolol");
insert into medicamento values (0,"Neosoro");
insert into medicamento values (0,"Maxalgina");

insert into paciente values (0,"Jorge");
insert into paciente values (0,"Daniel");
insert into paciente values (0,"Lucas");
insert into paciente values (0,"Jonas");
insert into paciente values (0,"Pedro");

insert into consulta values (0,"2022-06-19",2,1);
insert into consulta values (0,"2022-06-20",3,2);
insert into consulta values (0,"2022-06-20",1,3);
insert into consulta values (0,"2022-06-22",2,3);
insert into consulta values (0,"2022-06-22",3,4);

insert into prescicao values("3 ao dia",1,1);
insert into prescicao values("2 ao dia",2,3);
insert into prescicao values("1 ao dia",3,5);
insert into prescicao values("3 ao dia",4,2);
insert into prescicao values("1 ao dia",1,4);

select prescicao.posologia, medico.cod_medico from prescicao inner join consulta on prescicao.cod_consulta = consulta.cod_consulta inner join medico on consulta.cod_medico = medico.cod_medico;

select paciente.cod_paciente, paciente.nome_paciente, medicamento.nome_medicamento from prescicao inner join medicamento on prescicao.cod_medicamento = medicamento.cod_medicamento inner join consulta on prescicao.cod_consulta = consulta.cod_consulta inner join paciente on consulta.cod_paciente = paciente.cod_paciente order by paciente.cod_paciente; 

select * from consulta where dataa = "2022-06-22";