-- Script SQL para criar a tabela de vendas.

CREATE TABLE public.vendas (
	cod_usuario integer NULL,
	cod_produto integer NULL,
	data_compra varchar(50) NULL,
	forma_pagamento varchar(50) NULL,
	quantidade integer NULL,
	valor_compra varchar(50) NULL,
	data_prevista_entrega varchar(50) NULL,
	data_entrega varchar(50) NULL
);

SELECT * FROM vendas;
