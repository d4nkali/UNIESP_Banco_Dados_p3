/*

Questão 3 - Crie uma subconsulta para obter a quantidade total de vendas para cada produto e, em
seguida, liste os produtos que tiveram mais de 50 vendas.

*/
select
	u.cod_usuario,
	sum(v.valor_compra) as total_vendas
	from vendas v
	inner join usuarios u on u.cod_usuario = v.cod_usuario
	group by u.cod_usuario
	order by total_vendas
