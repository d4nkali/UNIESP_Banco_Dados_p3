/*

Criar uma view materializada que mostra a quantidade total vendida de cada
produto.

a. Qual é a quantidade total vendida do produto "Smartphone"?

*/
create materialized view vw_vendas_total_celular as 
	select 
	cod_produto, 
	sum(quantidade) as quantidade_total
	from 
		vendas v 
	group by
		cod_produto;

select quantidade_total from vw_vendas_total_celular where cod_produto = 3;
