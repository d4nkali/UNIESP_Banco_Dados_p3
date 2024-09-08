/*

Exercícios Subquerys e CTE 1

Aluno: Danilo Pereira Viana - P3B
Data: 07/09/2024

*/

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

-- Questão 2 - Crie uma query do tipo CTE para calcular a média das compras por faixa etária - Dica:(group by)
WITH CompraPorUsuario AS (
    SELECT
        u.cod_usuario,
        u.faixa_etaria,
        COALESCE(SUM(v.valor_compra), 0) AS total_compras
    from usuarios u
    LEFT join vendas v ON u.cod_usuario = v.cod_usuario
    GROUP BY
        u.cod_usuario, u.faixa_etaria
),
MediaCompraPorFaixa AS (
    SELECT
        faixa_etaria,
        ROUND(AVG(total_compras)::numeric, 2) AS media_compras
    from CompraPorUsuario
    GROUP BY
        faixa_etaria
)
SELECT
    faixa_etaria,
    media_compras
from MediaCompraPorFaixa
ORDER BY
    faixa_etaria;

-- Questão 3 - Crie uma query do tipo subconsulta correlacionada para obter usuários com maior número de compras.
SELECT 
    u.cod_usuario,
    COUNT(v.cod_usuario) AS total_compras
FROM usuarios u
LEFT JOIN vendas v ON u.cod_usuario = v.cod_usuario
GROUP BY u.cod_usuario
ORDER BY total_compras DESC;