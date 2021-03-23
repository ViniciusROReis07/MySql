create database dbvideoLocadora;

use dbvideoLocadora;

create table tblFilmes(
  idFilme integer(8) not null auto_increment primary key,
  nome varchar(100) not null,
  qtd integer(4) not null,
  data_lancamento date not null,
  sinopse varchar(500) not null
);

create table tblGenero(
  idGenero integer(8) not null auto_increment primary key,
  nome varchar(100) not null
);

create table tblFilmeGenero(
  idFilmeGenero integer(8) not null auto_increment primary key,
  idFilme integer(8) not null,
  constraint FKFilmeGeneroFime foreign key (idFilme) references tblFilmes (idFilme),
  idGenero integer(8) not null,
  constraint FKFilmeGeneroGenero foreign key (idGenero) references tblGenero (idGenero)
);
create table tblTelefoneTipo(
  idTelefoneTipo integer(8) not null auto_increment primary key,
  tipo varchar(80) not null
);
create table tblTelefones(
  idTelefone integer(8) not null auto_increment primary key,
  telefone varchar(18) not null,
  idTelefoneTipo integer(8) not null,
  constraint FKTelefonesTelefoneTipo foreign key (idTelefoneTipo) references tblTelefoneTipo (idTelefoneTipo)
);
create table tblAtores(
  idAtor integer(8) not null auto_increment primary key,
  nome varchar(100) not null,
  qtdeOscars integer(3) not null,
  dataNascimento date not null,
  idTelefone integer(8) not null,
  constraint FKAtoresRelefones foreign key (idTelefone) references tblTelefones (idTelefone)
);

create table tblAtorFilme(
  idAtorFilme integer(8) not null auto_increment primary key,
  idAtor integer(8) not null,
  constraint FKAtorFilmeAtor foreign key (idAtor) references tblAtores (idAtor),
  idFilme integer(8) not null,
  constraint FKAtorFilmeFilme foreign key (idFilme) references tblFilmes (idFilme)
);

#Para deletar todos os dados de uma tabela
delete from tblAtorFilme where idAtorFilme > 0;

alter table tblFilmes modify column sinopse text;

#Insert tradicional
insert into tblTelefoneTipo (tipo) values ('Comercial');

#Insert unico para inserir varios dados de uma so vez
insert into tblTelefoneTipo (tipo) values ('Comercial'),('Residencial'),('Celular'),('Parente'),('Amigo');

insert into tblTelefones (telefone,idTelefoneTipo) values ('(11) 4774-5024',5);

insert into tblAtores (nome,qtdeOscars,dataNascimento,idTelefone) values ('Alfredo James Pacino',5,'1940-04-25',1);

insert into tblAtores (nome,qtdeOscars,dataNascimento,idTelefone) values ('Marlo Brando', 1, '1924-04-03',1);

insert into tblAtores (nome,qtdeOscars,dataNascimento,idTelefone) values ('Morgan Freeman', 3 , '1937-06-01',2) , ('Timothy Francis Robbins',1,'1958-10-16',3);

insert into tblFilmes (nome , qtd , data_lancamento , sinopse ) values ('O Poderoso Chef�o' , 10 , '1972-03-24' , 'Don Vito Corleone (Marlon Brando) � o chefe de uma "fam�lia" de Nova York que est� feliz, pois Connie (Talia Shire), sua filha, se casou com Carlo (Gianni Russo). Por�m, durante a festa, Bonasera (Salvatore Corsitto) � visto no escrit�rio de Don Corleone pedindo "justi�a", vingan�a na verdade contra membros de uma quadrilha, que espancaram barbaramente sua filha por ela ter se recusado a fazer sexo para preservar a honra. Vito discute, mas os argumentos de Bonasera o sensibilizam e ele promete que os homens, que maltrataram a filha de Bonasera n�o ser�o mortos, pois ela tamb�m n�o foi, mas ser�o severamente castigados. Vito por�m deixa claro que ele pode chamar Bonasera algum dia para devolver o "favor". Do lado de fora, no meio da festa, est� o terceiro filho de Vito, Michael (Al Pacino), um capit�o da marinha muito decorado que h� pouco voltou da 2� Guerra Mundial. Universit�rio educado, sens�vel e perceptivo, ele quase n�o � notado pela maioria dos presentes, com exce��o de uma namorada da faculdade')

insert into tblFilmes (nome , qtd , data_lancamento , sinopse ) values ('Um Sonho de Liberdade' , 5 , '1995-01-25' , 'Em 1946, Andy Dufresne (Tim Robbins), um jovem e bem sucedido banqueiro, tem a sua vida radicalmente modificada ao ser condenado por um crime que...');

insert into  tblGenero (nome) values ('Drama') , ('Policial');

insert into tblFilmeGenero (idFilme , idGenero) values (1,1) , (1,2) , (2,1);

insert into tblAtorFilme (idAtor,idFilme) values (1,1) , (2,1) , (3,2) , (4,2);

insert into tblAtores (nome, qtdeOscars , dataNascimento , idTelefone ) values ('Michael Clarke Duncan', 50 , '1957-12-10' , 7 );

insert into tblAtorFilme (idAtor,idFilme) values (8,4) , (9,4);

insert into tblFilmes (nome ,qtd , data_lancamento , sinopse ) values (' O Rei Le�o ' , 20 , '2011-08-26' , 'Mufasa (voz de James Earl Jones), o Rei Le�o, e a rainha Sarabi (voz de Madge Sinclair) apresentam ao reino o herdeiro do trono, Simba (voz de... ');

insert into tblTelefones (telefone,idTelefoneTipo) values ('(11) 94475-2568' , 7);

insert into tblAtores (nome , qtdeOscars , dataNascimento , idTelefone) values ('Garcia J�nior' , 0 , '1967-03-2' ,4);
insert into tblAtores (nome , qtdeOscars , dataNascimento , idTelefone) values ();

#Script para alterar registros, nunca esquecer do where
update tblTelefoneTipo set tipo = 'Familiar' where idTelefoneTipo = 8;


alter table tblFilmes add status boolean;

update tblFilmes set status ='1' where idFilme > 0;
update tblFilmes set status ='0' where qtd <= 5;


#Select para trazer todos os campos de uma tabela


select * from tblFilmes;

select tblFimes.* from tblFilmes;

select tblFilmes.nome , tblFilmes.qtd from tblFilmes;



#Select com where

select * from tblFilmes where idFilme = 1;


select * from tblFilmes where tblFilmes.idFilme = 1;

select * from tblFilmes where nome = 'O Poderoso Chef�o';

select * from tblFilmes where nome like 'O Poderoso Chef�o';

#Utilizando o like pode buscar por peda�oes da informa��o
/*
  like 'valor' - busca fazendo a compara��o atrav�s da igualdade
  like 'valor%' - busca fazendo a compar��o por tudo que come�a com aquela informa��o
  like '%valor' - busca fazedo a caompara��o por tudo que termina com aquela informa��o
  like '%valor%' - busca fazendo a compara��o por qualquer parte do campo

*/
select * from tblFilmes where nome like 'O%'


#Utilizando operadores l�gicos or, and, not
  #And - todas as condi��es precisam ser validas para trazer algum resultado
  #Or - se apenas uma das condi��es for valida ir� trazer o resultado

  #Operadores de compara��o = , < , > , <= , >= , <>

select * from tblFilmes where qtd < 5 and sinopse like '%vida%';

select * from tblFilmes where qtd <= 5 or sinopse like '%vida%';


select * from tblFilmes where qtd = 5 or qtd = 10;

#Coloca o parentese na ar�a onde quer a invers�o no not
select * from tblFilmes where (not (qtd <> 5 ))or qtd = 10;

#Utilizando o comando in () , podemos colocar uma lista de itens a serem buscados no BD
select * from tblFilmes where qtd in(5,10,4);
#not in() inverte o resultado da busca
select * from tblFilmes where qtd not in(5,10,4);
#OBS : in () ou not in() substitui o operador logico (OR) na compara��o , desde que seja o mesmo campo


#order by - permite fazer a ordena��o dos registros
select * from tblFilmes order by nome;#Ordem crescente (Padr�o)
select * from tblFilmes order by nome asc; #Ordem crescente utilizando o (asc)
select * from tblFilmes order by nome desc; #Ordem decrescente utilizando o (desc)
#Order by � sempre a ultima instru��o do script e podemos abrir ordena��o por varios campos
select * from tblFilmes where idFilme > 5 order by nome,qtd asc;

select * from tblFilmes where idFilme > 5 order by nome desc,qtd asc;

#Limit - permite especificar a quantidade de registros que ser� retornada (mysql LIMIT,alguns outros bancos usam o TOP)
select * from tblFilmes order by idFilme desc limit 1;#Trazer o primeiro registro
select * from tblFilmes order by idFilme asc limit 5;#Trazer o ultimo registro


#COUNT - permite contar qtos registros existem
select count(*) as qtdeRegistros from tblFilmes;
select count(*) as qtdeRegistros from tblFilmes where idFilme < 3;

#MIN/MAX
select min(qtd) , nome from tblFilmes;
select max(qtd) as maximo , nome from tblFilmes;

#AVG - permite calcular a media
select avg(qtd) as media from tblFilmes;

#SUM - soma de valores
select sum(qtd) as soma from tblFilmes;

select sum(qtd) as soma from tblFilmes where qtd < 3;

select (sum(qtd)/2) as soma from tblFilmes where qtd < 3;


#Fazendo calculos no select

select (qtd/3) from tblFilmes;
select (qtd*3) as resultado , nome , sinopse from tblFilmes;
select (qtd-3) from tblFilmes;
select (qtd+3) from tblFilmes;

#Between - permite fazer uma busca utilizando um range de valores
select * from tblFilmes where qtd > 2 and qtd < 8;#Op��o 1 usando operador logico
select * from tblFilmes where (not (qtd > 2 and qtd < 8)));
select * from tblFilmes where qtd between 2 and 8;#Op��o 2 usando o between
select * from tblFilmes where not qtd between 2 and 8;

select qtd ,  concat('R$ ', (qtd - round((qtd * 50)/100,2))) as deconto from tblFilmes;

#TRABALHANDO COM DATA E HORA
#Retorna a data atual do servidor
select curdate();
select current_date();

#Retorna a hora do servidor
select curtime();
select current_time();

#Retorna data e hora do servidor
select current_timestamp;

#Fun�oes para formatar Hora
select time_format(curtime(),'%h') as hora;#hora de 0-12
select time_format(curtime(),'%H') as hora;#hora de 0-23
select time_format(curtime(),'%i') as hora;#minuto
/*
  %h - retorna a hora de 0-12
  %H - retorna a hora de 0-23
  %i - retorna os minutos
  %s - retorna o segundo
  %r - retorna AM/PM
  %T - retorna o padr�o da hora que � hh:mm:ss
  */

select time_format(curtime(),'%r') as hora;

#HOUR() , MINUTE () , SECOND()
select hour(curtime()) as hora;
select minute(curtime()) as hora;
select second(curtime()) as hora;

#TIME() - permite extarir apenas a hora de um campo datetime
select time(current_timestamp()) as hora;

#Fun��es para formatar Data
select date_format(curdate(),'%d/%m/%Y');#data padr�o brasileiro
select date_format(curdate(),'%Y-%m-%d');#data padr�o americano

select date_format(curdate(),'%b');


/*
   %W: dia da semana por extenso. Exemplo: segunda, ter�a, quarta e assim por diante;
    %w: dia da semana representado por um inteiro num�rico. 0-Domingo, 1-Segunda, e assim por diante. A sequ�ncia termina em 6 - S�bado;
    %a: dia da semana por extenso abreviado. Exemplo: Seg, Ter, Qua e assim por diante;
    %M: m�s por extenso completo. Exemplo: Janeiro, Fevereiro, Mar�o e assim por diante;
    %b: m�s por extenso abreviado. Exemplo: Jan, Fev, Mar e assim por diante;
    %d: retorna o dia
    %m: retorna o m�s
    %y: retorna o ano 00
    %Y: retorna o ano 0000
*/

select day(curdate()) as data;
select month(curdate()) as mes;
select year(curdate()) as ano;

#Extrai apenas a data de um campo datetime
select date(current_timestamp()) as data ;
























