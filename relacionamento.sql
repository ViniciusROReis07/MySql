#Relacionamento utilizando where

select tblAtores.nome, tblTelefones.telefone , tblTelefoneTipo.tipo
from tblAtores , tblTelefones , tblTelefoneTipo
where tblTelefones.idTelefone = tblAtores.idTelefone and tblTelefoneTipo.idTelefoneTipo = tblTelefones.idTelefoneTipo;

select tblFilmes.nome as nomeFilme, tblAtores.nome, tblTelefones.telefone , tblTelefoneTipo.tipo
from tblAtores , tblTelefones , tblTelefoneTipo, tblFilmes ,tblAtorFilme
where tblTelefones.idTelefone = tblAtores.idTelefone
and tblTelefoneTipo.idTelefoneTipo = tblTelefones.idTelefoneTipo
and tblAtores.idAtor = tblAtorFilme.idAtor
and tblFilmes.idFilme = tblAtorFilme.idFilme;

select tblFilmes.nome as nomeFilme, tblAtores.nome, tblTelefones.telefone , tblGenero.nome , tblTelefoneTipo.tipo
from tblAtores , tblTelefones , tblTelefoneTipo, tblFilmes ,tblAtorFilme , tblFilmeGenero, tblGenero
where tblTelefones.idTelefone = tblAtores.idTelefone
and tblTelefoneTipo.idTelefoneTipo = tblTelefones.idTelefoneTipo
and tblAtores.idAtor = tblAtorFilme.idAtor
and tblFilmes.idFilme = tblAtorFilme.idFilme
and tblFilmes.idFilme = tblFilmeGenero.idFilme
and tblGenero.idGenero = tblFilmeGenero.idGenero;


#Relacionamento utilizando o INNER JOIN

select tblAtores.nome , tblTelefones.telefone , tblTelefoneTipo.tipo
from tblAtores inner join tblTelefones
        on (tblAtores.idTelefone = tblTelefones.idTelefone)
        inner join tblTelefoneTipo
        on (tblTelefones.idTelefoneTipo = tblTelefoneTipo.idTelefoneTipo);

select tblAtores.nome , tblTelefones.telefone , tblTelefoneTipo.tipo, tblFilmes.nome
from tblTelefoneTipo inner join tblTelefones
          on (tblTelefoneTipo.idTelefoneTipo = tblTelefones.idTelefoneTipo)
          inner join tblAtores
          on (tblTelefones.idTelefone = tblAtores.idTelefone)
          inner join tblAtorFilme
          on (tblAtores.idAtor = tblAtorFilme.idAtor)
          inner join tblFilmes
          on (tblAtorFilme.idFilme = tblFilmes.idFilme);

select tblAtores.nome , tblTelefones.telefone , tblTelefoneTipo.tipo, tblFilmes.nome
from tblTelefoneTipo inner join tblTelefones
          on (tblTelefoneTipo.idTelefoneTipo = tblTelefones.idTelefoneTipo)
          inner join tblAtores
          on (tblTelefones.idTelefone = tblAtores.idTelefone)
          inner join tblAtorFilme
          on (tblAtores.idAtor = tblAtorFilme.idAtor)
          inner join tblFilmes
          on (tblAtorFilme.idFilme = tblFilmes.idFilme);


#Relacionamento utilizando todas as tabelas
select tblFilmes.nome,tblGenero.nome,tblAtores.nome,tblTelefones.telefone,tblTelefoneTipo.idTelefoneTipo
from tblTelefoneTipo inner join tblTelefones
      on (tblTelefoneTipo.idTelefoneTipo = tblTelefones.idTelefoneTipo)
      inner join tblAtores
      on (tblTelefones.idTelefone = tblAtores.idTelefone)
      inner join tblAtorFilme
      on (tblAtores.idAtor = tblAtorFilme.idAtor)
      inner join tblFilmes
      on (tblAtorFilme.idFilme = tblFilmes.idFilme)
      inner join tblfilmeGenero
      on (tblFilmes.idFilme = tblFilmeGenero.idFilme)
      inner join tblGenero
      on (tblFilmeGenero.idGenero = tblGenero.idGenero)


#INNER JOIN - traz tudo que esta relacionado entre duas tableas
select tblTelefones.telefone , tblTelefoneTipo.tipo
from tblTelefoneTipo inner join tblTelefones
  on(tblTelefoneTipo.idTelefoneTipo = tblTelefones.idTelefonetipo);

#LEFT JOIN - traz tudo que esta relacionado entre duas tabelas (Somente os dados em comum)
#e tambem dados da tabela da esquerda que não esta relacionado com a tabela da direita
select tblTelefones.telefone , tblTelefoneTipo.tipo
from tblTelefoneTipo left join tblTelefones
  on(tblTelefoneTipo.idTelefoneTipo = tblTelefones.idTelefonetipo);

#RIGHT JOIN - traz tudo que esta relacionado entre duas tabelas (Somente os dados em comum)
#e tambem dados da tabela da esquerda que não esta relacionado com a tabela da direita
select tblTelefones.telefone , tblTelefoneTipo.tipo
from tblTelefoneTipo right join tblTelefones
  on(tblTelefoneTipo.idTelefoneTipo = tblTelefones.idTelefonetipo);


#FULL OUTLER JOIN - no mysql esse comando não é possivel de fazer , porem se utilizarmos o comando UNION,
#conseguimos juntar o LEFT JOIN e o RIGTH JOIN em apenas um script
#UNION  - precisa que a qtde de colunas sejam iguais
select tblTelefones.telefone , tblTelefoneTipo.tipo
from tblTelefoneTipo right join tblTelefones
  on(tblTelefoneTipo.idTelefoneTipo = tblTelefones.idTelefonetipo)
union
select tblTelefones.telefone , tblTelefoneTipo.tipo
from tblTelefoneTipo left join tblTelefones
  on(tblTelefoneTipo.idTelefoneTipo = tblTelefones.idTelefonetipo);






#UNION - traz os dados juntando os dois selects , porem se existir um registro em duplicidade ele não retorna
select nome,qtd , 'F' as TipoPedidofrom tblFilmes where qtd <5
 union
select nome,qtd , 'NF' as TipoPedidofromfrom tblFilmes where qtd >7;

select nome,qtd , 'Estoque a baixo' as Estoque from tblFilmes where qtd <5
 union
select nome,qtd , 'Estoque a OK' as Estoque from tblFilmes where qtd >7;

#UNION ALL - traz os dados juntando os dois selects , porem se existir um registro em duplicidade ele retorna
select nome,qtd from tblFilmes where qtd <5
 union all
select nome,qtd from tblFilmes where qtd >7;



#DISTINCT - aplicado em um campo faz a distinção entre o dado (se for a mesma informação ele traz somente uma vez)
select idFilme,nome from tblFilmes where idFilme in(
select distinct idFilme from tblAtorFilme);



























