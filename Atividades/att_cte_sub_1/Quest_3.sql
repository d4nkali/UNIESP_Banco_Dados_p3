-- Questão 3 - Crie uma query do tipo subconsulta correlacionada para obter usuários com maior número de compras.
SELECT 
    u.cod_usuario,
    COUNT(v.cod_usuario) AS total_compras
FROM usuarios u
LEFT JOIN vendas v ON u.cod_usuario = v.cod_usuario
GROUP BY u.cod_usuario
ORDER BY total_compras DESC;