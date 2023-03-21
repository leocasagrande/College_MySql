create database atividade_8;

use atividade_8;

create table cliente(
    cpf int(9) primary key,
    nome varchar(60) not null,
    dtNasc DATE
);

create table modelo(
    codMod int(3) auto_increment primary key,
    descri varchar(40) not null
);

create table patio(
    num integer auto_increment primary key,
    ender varchar(40) not null,
    capacidade integer not null 
);

create table veiculo(
    placa varchar(8) primary key,
    cor varchar(20) not null,
    ano integer not null,
    codMod int(3) not null,
    cpf int(3) not null,
    constraint fk_codMod foreign key (codMod) references modelo(codMod),
    constraint fk_cpf foreign key (cpf) references cliente(cpf)
);

create table estaciona(
    cod int(3) auto_increment primary key,
    dtEntrada varchar(10) not null,
    dtSaida varchar(10) not null,
    hsEntrada varchar(10) not null,
    hsSaida varchar(10) not null,
    num integer not null,
    placa varchar(8) not null,
    constraint fk_num foreign key (num) references patio(num),
    constraint fk_placa foreign key (placa) references veiculo(placa)
);

insert into cliente values(90129201, "Leonardo", "1970-06-20");
insert into cliente values(98371391, "Tulio", "1990-10-25");
insert into cliente values(83194124, "Ronaldo", "2000-03-14");
insert into cliente values(71238123, "Rogerio", "2003-02-10");
insert into cliente values(12313128, "Rodrigo", "2001-07-21");
insert into cliente values(98412414, "Mario", "1998-06-10");

insert into modelo values(0, "Gol");
insert into modelo values(0, "Strada");
insert into modelo values(0, "Compass");
insert into modelo values(0, "Civic");
insert into modelo values(0, "Tucson");
insert into modelo values(0, "Savero");

insert into patio values(0, "Av. Paulista Rua 5", 10);
insert into patio values(0, "Av. Paulista Rua 6", 7);
insert into patio values(0, "Av. Paulista Rua 1", 8);
insert into patio values(0, "Av. Paulista Rua 3", 9);

insert into veiculo values("JJJ-2020", "Branco", "2020", 1, 90129201);
insert into veiculo values("JKU-2022", "Preto", "2019", 2, 98371391);
insert into veiculo values("JEG-2010", "Prata", "2019", 4, 83194124);
insert into veiculo values("DWA-2019", "Verde", "2018", 3, 71238123);
insert into veiculo values("PQW-2012", "Verde", "2017", 6, 12313128);
insert into veiculo values("QYU-2018", "Verde", "2015", 5, 98412414);

insert into estaciona values(0, "2022-10-20", "2022-10-22", "9 horas", "9 horas", 1, "JJJ-2020");
insert into estaciona values(0, "2022-10-15", "2022-10-19", "10 horas", "10 horas", 4, "JEG-2010");
insert into estaciona values(0, "2022-10-13", "2022-10-15", "11 horas", "11 horas", 2, "JKU-2022");
insert into estaciona values(0, "2022-10-20", "2022-10-22", "9 horas", "9 horas", 1, "DWA-2019");
insert into estaciona values(0, "2022-10-10", "2022-10-12", "8 horas", "8 horas", 4, "JJJ-2020");
insert into estaciona values(0, "2022-10-05", "2022-10-07", "14 horas", "14 horas", 3, "QYU-2018");

/*LETRA A*/
select veiculo.placa, cliente.nome from veiculo inner join cliente on veiculo.cpf = cliente.cpf;

/*LETRA B*/
select cliente.cpf, cliente.nome from cliente inner join veiculo on cliente.cpf = veiculo.cpf where placa = "JJJ-2020";

/*LETRA C*/
select veiculo.placa, veiculo.cor from veiculo inner join estaciona on veiculo.placa = estaciona.placa where estaciona.cod = 1;

/*LETRA D*/
select veiculo.placa, veiculo.ano from veiculo inner join estaciona on veiculo.placa = estaciona.placa where estaciona.cod = 1;

/*LETRA E*/
select veiculo.placa, veiculo.ano, modelo.descri from veiculo inner join modelo on veiculo.codMod = modelo.codMod where veiculo.ano > 2000;

/*LETRA F*/
select patio.ender, estaciona.dtEntrada, estaciona.dtSaida from estaciona inner join patio on estaciona.num = patio.num inner join veiculo on estaciona.placa = veiculo.placa where veiculo.placa = "JEG-2010";

/*LETRA G*/
select veiculo.cor, count(estaciona.cod) as qtde from estaciona inner join veiculo on estaciona.placa = veiculo.placa group by veiculo.cor; 

/*LETRA H*/
select cliente.nome, modelo.codMod from veiculo inner join cliente on veiculo.cpf = cliente.cpf inner join modelo on veiculo.codMod = modelo.codMod where modelo.codMod = 1;

/*LETRA I*/
select veiculo.placa, estaciona.hsEntrada, estaciona.hsSaida from estaciona inner join veiculo on estaciona.placa = veiculo.placa where veiculo.cor = "Verde";

/*LETRA J*/
select estaciona.cod, veiculo.placa from estaciona inner join veiculo on estaciona.placa = veiculo.placa where veiculo.placa = "JJJ-2020";

/*LETRA K*/
select cliente.nome, estaciona.cod from estaciona inner join veiculo on estaciona.placa = veiculo.placa inner join cliente on veiculo.cpf = cliente.cpf where estaciona.cod = 2;

/*LETRA L*/
select cliente.cpf, estaciona.cod from estaciona inner join veiculo on estaciona.placa = veiculo.placa inner join cliente on veiculo.cpf = cliente.cpf where estaciona.cod = 3;

/*LETRA M*/
select modelo.descri, estaciona.cod from estaciona inner join veiculo on estaciona.placa = veiculo.placa inner join modelo on veiculo.codMod = modelo.codMod where estaciona.cod = 2;

/*LETRA N*/
select veiculo.placa, cliente.nome, modelo.descri from estaciona inner join veiculo on estaciona.placa = veiculo.placa inner join cliente on veiculo.cpf = cliente.cpf inner join modelo on veiculo.codMod = modelo.codMod;
