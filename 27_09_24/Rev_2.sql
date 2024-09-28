SELECT
    estado,
    AVG(valor_compra) AS media_valor_compra,
    COUNT(*) AS total_produtos_vendidos
FROM vendas v
INNER JOIN usuarios u ON v.cod_usuario = u.cod_usuario
GROUP BY estado
HAVING AVG(valor_compra) > 5000
ORDER BY media_valor_compra ASC;
