/*

Questão 2 - Utilizando uma CTE, calcule a média de valor de compra por usuário e liste os
usuários cuja média de compra seja superior a 500.

*/
WITH ComprasPorUsuario AS (
    SELECT
        u.cod_usuario,
        COALESCE(SUM(v.valor_compra), 0) AS total_compras,
        COUNT(v.cod_produto) AS num_compras
    FROM usuarios u
    LEFT JOIN vendas v ON u.cod_usuario = v.cod_usuario
    GROUP BY u.cod_usuario
),
MediaValorCompra AS (
    SELECT
        cod_usuario,
        round(total_compras::numeric / NULLIF(num_compras, 0), 2) AS media_compra
    FROM ComprasPorUsuario
)
SELECT 
    cod_usuario,
    media_compra
FROM MediaValorCompra
WHERE media_compra > 500;
