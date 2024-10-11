/*

Questão 5 - Calcule a média de valor de compra por produto na categoria 'Roupas' e liste os
produtos com valores acima dessa média.

*/
with MediaVendaModa as (
	select 
		avg(v.valor_compra) as media_compra
	from vendas v 
	inner join produtos p on p.cod_produto = v.cod_produto
	where p.categoria_produto = 'Moda e beleza'
)
select 
	p.nome_produto,
	v.valor_compra
from vendas v
inner join public.produtos p on p.cod_produto = v.cod_produto 
where p.categoria_produto = 'Moda e beleza' and v.valor_compra > (select media_compra from MediaVendaModa)
