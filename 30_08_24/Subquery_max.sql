-- Script SQL para realizar uma sub query.

select v.cod_usuario, p.nome_produto
from public.produtos p 
join vendas v 
on p.cod_produto = v.cod_produto
WHERE data_compra = (
    SELECT MAX(v2.data_compra)
    FROM vendas v2 
    WHERE EXTRACT(YEAR FROM v2.data_compra::date) < 2023
);
