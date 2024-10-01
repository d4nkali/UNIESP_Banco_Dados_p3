/*

Exercícios Subquerys e CTE 2

Aluno: Danilo Pereira Viana - P3B
Data: 01/10/2024

*/


/*

Questão 1: Escreva uma subconsulta para encontrar os usuários que compraram 
produtos na categoria 'Eletrônicos'.

*/
with usuarios_compras_eletronicos as (
	select v.cod_usuario, p.nome_produto, p.categoria_produto, v.data_compra
	from public.produtos p 
	join vendas v 
	on p.cod_produto = v.cod_produto
	where p.categoria_produto = 'Eletronicos'
	order by v.cod_usuario
)
select * from usuarios_compras_eletronicos;


/*

Questão 2 - Utilizando uma CTE, calcule a média de valor de compra por usuário e liste os
usuários cuja média de compra seja superior a 500.

*/
with ComprasPorUsuario as (
    select
        u.cod_usuario,
        coalesce(sum(v.valor_compra), 0) as total_compras,
        count(v.cod_produto) as num_compras
    from usuarios u
    left join vendas v on u.cod_usuario = v.cod_usuario
    group by u.cod_usuario
),
MediaValorCompra as (
    select
        cod_usuario,
        round(total_compras::numeric / NULLIF(num_compras, 0), 2) as media_compra
    from ComprasPorUsuario
)
select 
    cod_usuario,
    media_compra
from MediaValorCompra
where media_compra > 500;


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
