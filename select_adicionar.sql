create table cliente(
        id_cliente int(3) auto_increment primary key,
        nome varchar(50) not null,
        empresa varchar(50) not null,
        telefone varchar(20) not null
);

create table tecnico(
        id_tecnico int(3) auto_increment primary key,
        nome varchar(50) not null
);

create table finalizacao(
        id_final int(3) auto_increment primary key,
        valor_total int(9) not null,
        data_final date not null,
        data_entrega date not null
);

create table ordem_servico(
        id_ordem int(3) auto_increment primary key,
        data_ordem date not null,
        defeito varchar(50) not null,
        equipamento varchar(50) not null,
        id_cliente int(3) not null,
        id_tecnico int(3) not null,
        id_final int(3) not null,
        constraint fk_cliente foreign key (id_cliente) references cliente(id_cliente),
        constraint fk_tecnico foreign key (id_tecnico) references tecnico(id_tecnico),
        constraint fk_final foreign key (id_final) references finalizacao(id_final)
);

create table servico(
        id_servico int(3) auto_increment primary key,
        atividade varchar(50) not null
);

create table relacao(
        id_ordem int(3) not null,
        id_servico int(3) not null,
        constraint fk_ordem foreign key (id_ordem) references ordem_servico(id_ordem),
        constraint fk_servico foreign key (id_servico) references servico(id_servico)
);

insert into cliente values(0,"Leonardo", "BB", 83129312);
insert into cliente values(0,"Gustavo", "BRB", 92129312);
insert into cliente values(0,"Carlos", "SANTANDER", 99312312);
insert into cliente values(0,"Moura", "CAIXA", 92563123);

insert into tecnico values(0,"Jorge");
insert into tecnico values(0,"Tulio");
insert into tecnico values(0,"Naka");
insert into tecnico values(0,"Felipe");

insert into finalizacao values(0, 900, "2022-10-26", "2022-10-27");
insert into finalizacao values(0, 250, "2022-10-20", "2022-10-22");
insert into finalizacao values(0, 700, "2022-10-10", "2022-10-15");
insert into finalizacao values(0, 120, "2022-10-08", "2022-10-09");

insert into ordem_servico values(0,"2022-09-10", "Quebrado", "Corta Gramas", 3, 2, 1);
insert into ordem_servico values(0,"2022-10-11", "Falta de pecas", "Moedor", 2, 1, 3);
insert into ordem_servico values(0,"2022-07-01", "Pifou", "Liquidificador", 1, 3, 2);

insert into servico values(0,"Engenharia");
insert into servico values(0,"Direito");
insert into servico values(0,"Computacao");

insert into relacao values(1,3);
insert into relacao values(2,1);
insert into relacao values(3,2);

select cliente.nome, ordem_servico.equipamento,servico.atividade from ordem_servico inner join cliente on ordem_servico.id_cliente = cliente.id_cliente inner join relacao on ordem_servico.id_ordem = relacao.id_ordem inner join servico on relacao.id_servico = servico.id_servico;










