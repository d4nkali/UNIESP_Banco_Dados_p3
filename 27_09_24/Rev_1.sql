CREATE MATERIALIZED VIEW vw_vendas_por AS
WITH vendas_por_usuario AS (
    SELECT
        u.cod_usuario,  
        u.data_cadastro, 
        COUNT(*) AS quantidade_total
    FROM usuarios u
    INNER JOIN vendas v ON u.cod_usuario = v.cod_usuario
    GROUP BY u.cod_usuario, u.data_cadastro 
)
SELECT * FROM vendas_por_usuario;
