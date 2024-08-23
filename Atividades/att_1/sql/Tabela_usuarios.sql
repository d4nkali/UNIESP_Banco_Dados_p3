-- Script SQL para criar a tabela usuarios.

CREATE TABLE public.usuarios (
	cod_usuario integer NULL,
	data_cadastro varchar(50) NULL,
	faixa_etaria varchar(50) NULL,
	cidade varchar(50) NULL,
	estado varchar(50) NULL
);

SELECT * FROM usuarios;
