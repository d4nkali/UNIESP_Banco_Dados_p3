/*

Questão 2- Escreva uma consulta para listar todos os produtos na categoria 'Eletrônicos' com seus
respectivos valores.

*/
select 
	p.cod_produto,
	p.nome_produto,
	p.categoria_produto
from public.produtos p 
inner join vendas v on 
p.cod_produto = v.cod_produto
where p.categoria_produto = 'Eletronicos';
