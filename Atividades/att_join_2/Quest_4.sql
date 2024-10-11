/*

Questao 4 - Obtenha uma lista de usuários que fizeram compras com cartão de crédito
('forma_pagamento' é igual a 'Cartão de Crédito').

*/
select v.forma_pagamento,
	v.cod_usuario
from vendas v
where forma_pagamento = 'cartao_credito'
order by forma_pagamento desc
