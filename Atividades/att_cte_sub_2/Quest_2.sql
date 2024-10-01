/*

Questão 2 - Utilizando uma CTE, calcule a média de valor de compra por usuário e liste os
usuários cuja média de compra seja superior a 500.

*/
with ComprasPorUsuario as (
    select
        u.cod_usuario,
        coalesce(sum(v.valor_compra), 0) as total_compras,
        count(v.cod_produto) as num_compras
    from usuarios u
    left join vendas v on u.cod_usuario = v.cod_usuario
    group by u.cod_usuario
),
MediaValorCompra as (
    select
        cod_usuario,
        round(total_compras::numeric / NULLIF(num_compras, 0), 2) as media_compra
    from ComprasPorUsuario
)
select 
    cod_usuario,
    media_compra
from MediaValorCompra
where media_compra > 500;
