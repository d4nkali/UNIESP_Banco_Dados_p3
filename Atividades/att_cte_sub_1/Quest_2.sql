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