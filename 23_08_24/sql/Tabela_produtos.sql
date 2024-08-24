-- Script SQL para criar a tabela produtos.

CREATE TABLE public.produtos (
	cod_produto integer NULL,
	nome_produto varchar(50) NULL,
	categoria_produto varchar(50) NULL,
	valor_produto real NULL
);

SELECT * FROM produtos;
