-- Script SQL para criar a tabela funcionarios.
CREATE TABLE public.funcionarios (
	cod_funcionario integer NULL,
	data_cadastro varchar(50) NULL,
	idade integer NULL,
	cidade varchar(50) NULL,
	estado varchar(50) NULL,
    departamento varchar(50) NULL,
    salario real NULL,
    modalidade_contrato varchar(50) null,
    ultima_atualizacao TIMESTAMP
);

SELECT * FROM funcionarios;
