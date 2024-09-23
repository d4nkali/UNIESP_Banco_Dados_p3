-- Query 1
with compras_2023_cte as (
select 
	v.cod_usuario,
	p.nome_produto,
	v.data_compra
from
	public.produtos p
join vendas v 
on
	p.cod_produto = v.cod_produto
where
	data_compra = (
	select
		max(v2.data_compra)
	from
		vendas v2
	where
		extract(year
	from
		v2.data_compra::date) < 2023
	)
)
select
	*
from
	compras_2023_cte
order by data_compra;
--order by cod_usuario;
--where cod_usuario in (18762, 4353);