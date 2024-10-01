/*

Questão 3 - Crie uma subconsulta para obter a quantidade total de vendas para cada produto e, 
em seguida, liste os produtos que tiveram mais de 50 vendas.

*/
with QuantidadeTotalVendas as(
	select p.nome_produto,
	count(v.quantidade) as total_vendas 
	from public.produtos p 
	join vendas v 
	on p.cod_produto = v.cod_produto
	group by p.nome_produto
)
select nome_produto, total_vendas
from QuantidadeTotalVendas
where total_vendas > 50;
