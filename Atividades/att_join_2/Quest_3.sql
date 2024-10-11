/*

Questão 3 - Calcule o total de vendas (valor_compra) para cada usuário e ordene os resultados em
ordem decrescente de valor total.

*/
select
	u.cod_usuario,
	sum(v.valor_compra) as total_vendas
	from vendas v
	inner join usuarios u on u.cod_usuario = v.cod_usuario
	group by u.cod_usuario
	order by total_vendas
