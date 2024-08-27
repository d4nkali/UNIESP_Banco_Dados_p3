/*

Questão 1 - Crie uma query que apresente os usuários e o produto comprado.

Aluno: Danilo Pereira - P3B

*/

select v.cod_usuario, p.nome_produto
from public.produtos p 
join vendas v 
on p.cod_produto = v.cod_produto;
