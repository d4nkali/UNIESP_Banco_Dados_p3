-- Questão 1 - Crie uma query do tipo subquery que apresente os produtos vendidos por usuário.
WITH compras_2023_cte AS (
    SELECT v.cod_usuario, p.nome_produto, v.data_compra
    FROM public.produtos p
    JOIN vendas v
    ON p.cod_produto = v.cod_produto
    WHERE data_compra = (
        SELECT MAX(v2.data_compra)
        FROM vendas v2 
        WHERE EXTRACT(YEAR FROM v2.data_compra::date) < 2023
    )
    order by v.cod_usuario
)
SELECT * FROM compras_2023_cte;
