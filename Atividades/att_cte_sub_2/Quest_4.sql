/*

Questão 4 - Utilize uma CTE para calcular o total de vendas por estado e, em seguida, liste os 
estados com o maior total de vendas.

*/
with TotalVendasEstado as (
	select 
	u.cidade,
	sum(v.valor_compra) as total_vendas
	from vendas v 
	join usuarios u on v.cod_usuario = u.cod_usuario 
	group by u.cidade
)
select cidade, total_vendas
from TotalVendasEstado
order by total_vendas desc;
