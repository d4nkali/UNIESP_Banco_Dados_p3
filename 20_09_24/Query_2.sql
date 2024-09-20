--Query 2
SELECT
	estado,
	AVG(valor_compra) AS media_valor_compra
FROM vendas v
INNER JOIN usuarios u ON v.cod_usuario = u.cod_usuario
WHERE estado like '%Pessoa%'
GROUP BY estado, valor_compra
HAVING valor_compra > 10000
ORDER BY media_valor_compra DESC;