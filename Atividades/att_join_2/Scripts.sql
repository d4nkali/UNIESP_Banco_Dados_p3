/*

Exercícios Join 2

Aluno: Danilo Pereira Viana - P3B
Data: 11/10/2024

*/


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
	order by total_vendas;


/*

Questão 4 - Obtenha uma lista de usuários que fizeram compras com cartão de crédito
('forma_pagamento' é igual a 'Cartão de Crédito').

*/
select v.forma_pagamento,
	v.cod_usuario
from vendas v
where forma_pagamento = 'cartao_credito'
order by forma_pagamento desc;


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
where p.categoria_produto = 'Moda e beleza' and v.valor_compra > (select media_compra from MediaVendaModa);
