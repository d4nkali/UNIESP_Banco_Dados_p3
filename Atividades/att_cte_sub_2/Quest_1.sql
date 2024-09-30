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
