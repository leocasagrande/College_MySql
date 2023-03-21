create DATABASE atividade7;

use atividade7;

create table ramo_atividade(
        cd_ramo int(3) auto_increment primary key,
        ds_ramo varchar(20)
);

create table tipo_assinante(
        cd_tipo int(3) auto_increment primary key,
        ds_tipo varchar(20)
);

create table assinante(
        cd_assinante int(3) auto_increment primary key,
        nm_assinante varchar(30),
        cd_ramo int(3) not null,
        cd_tipo int(3) not null,
        constraint fk_ramo foreign key (cd_ramo) references ramo_atividade(cd_ramo),
        constraint fk_tipo foreign key (cd_tipo) references tipo_atividade(cd_tipo)
);

create table municipio(
        cd_munic int(3) auto_increment primary key,
        ds_munic varchar(20)
);

create table endereco(
        cd_endereco int(3) auto_increment primary key,
        ds_endereco varchar(30),
        complemento varchar(20),
        bairro varchar(20),
        CEP int(11),
        cd_municipio int(3),
        cd_assinante int(3),
        constraint fk_munic foreign key (cd_municipio) references municipio(cd_munic),
        constraint fk_assinante foreign key (cd_assinante) references assinante(cd_assinante)
);

create table telefone(
        cd_fone int(3) auto_increment primary key,
        ddd int(3),
        n_fone int(3),
        cd_endereco int(3),
        constraint fk_end foreign key (cd_endereco) references endereco(cd_endereco)
);

/*LETRA A*/

select assinante.nm_assinante, endereco.ds_endereco, telefone.n_fone from ((endereco inner join assinante on endereco.cd_assinante = assinante.cd_assinante) inner join telefone on endereco.cd_endereco = telefone.cd_endereco);

/*LETRA B*/

select assinante.nm_assinante, ramo_atividade.ds_ramo from assinante inner join ramo_atividade on assinante.cd_ramo = ramo_atividade.cd_ramo order by ramo_atividade.ds_ramo, assinante.nm_assinante;

/*LETRA C*/

select assinate.nm_assinante from assinante inner join tipo_assinante on assinante.cd_tipo = tipo_assinante.cd_tipo left join endereco on assinante.cd_assinante = endereco.cd_assinante left join telefone on endereco.cd_endereco = telefone.cd_endereco left join municipio on municipio.cd_munic = endereco.cd_municipio where tipo_assinante.ds_tipo = "Residencial" and municipio.ds_munic = "Pelotas";

/*LETRA D*/

select assinante.nm_assinante, count(*) as qtt, telefone.ddd, telefone.n_fone from assinante inner join endereco on endereco.cd_assinante = assinante.cd_assinante left join telefone on telefone.cd_endereco = endereco.cd_endereco group by assinante.nm_assinante having qtt > 1;

/*LETRA E*/

select assinante.nm_assinante, telefone.n_fone, tipo_assinante.ds_tipo, endereco.ds_endereco from ((assinante inner join endereco on assinante.cd_assinante = endereco.cd_assinante) inner join municipio on endereco.cd_municipio = municipio.cd_munic) inner join tipo_assinante on assinante.cd_tipo = tipo_assinante.cd_tipo where ds_endereco = "Natal" or "João Câmara";