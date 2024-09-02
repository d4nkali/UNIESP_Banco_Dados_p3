-- Script SQL para realizar uma CTE.

WITH compras_2023_cte AS (
    SELECT v.cod_usuario, p.nome_produto
    FROM public.produtos p
    JOIN vendas v
    ON p.cod_produto = v.cod_produto
    WHERE v.data_compra = (
        SELECT MAX(v2.data_compra)
        FROM vendas v2 
        WHERE EXTRACT(YEAR FROM v2.data_compra::date) < 2023
    )
)
SELECT * FROM compras_2023_cte;