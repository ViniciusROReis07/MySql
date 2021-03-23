create database dbPaulistao;

use dbPaulistao;

create table tblPatrocinador(
  id integer(5) not null auto_increment primary key,
  nome varchar(100) not null
);


create table tblTime(
  id integer(5) not null auto_increment primary key,
  nome varchar(100) not null,
  titulos integer(10) not null,
  fundacao date not null,
  idPatrocinador integer(5) not null,
  constraint FKTimePatrocinador foreign key (idPatrocinador) references tblPatrocinador (id)
);

create table tblJogador(
  id integer(5) not null auto_increment primary key,
  nome varchar(100) not null,
  dataNascimento date not null,
  idTime integer(5) not null,
  constraint FKJogadorTime foreign key (idTime) references tblTime (id)
);

alter table tblJogador add idPatrocinador integer(5) not null;

alter table tblJogador add constraint FKJogadorPatrocinador foreign key (idPatrocinador) references tblPatrocinador (id);

insert into tblPatrocinador (nome) values ('PUMA') , ('ADIDAS') ,  ('REEBOK'), ('NIKE');

insert into tblTime (nome,titulos,fundacao,idPatrocinador) values ('S. E. Palmeiras',23,'1914-08-26',1);

insert into tblJogador (nome,dataNascimento,idTime,idPatrocinador) values ('Gustavo Gomez','1990-05-08',1,1);

select tblPatrocinador.nome as patrocinador, tblTime.nome as clube, tblJogador.nome as jogador from tblPatrocinador
 inner join tblTime on (tblPatrocinador.id = tblTime.idPatrocinador)
  inner join tblJogador on (tblTime.id = tblJogador.idTime);

update tblJogador set idPatrocinador = 4 where id = 1;

delete from tblpatrocinador where id = 3;

/*drop database dbPaulistao;*/