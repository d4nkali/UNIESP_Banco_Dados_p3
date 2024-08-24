select v.cod_usuario, p.nome_produto
from public.produtos p 
join vendas v 
on p.cod_produto = v.cod_produto