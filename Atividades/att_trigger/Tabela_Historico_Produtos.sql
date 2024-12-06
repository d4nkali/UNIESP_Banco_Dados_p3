-- Tabela para armazenar o histórico de atualizações
CREATE TABLE public.historico_produtos (
    cod_historico integer NULL,
    cod_produto integer NULL,
    nome_produto varchar(50),
    categoria_produto varchar(50),
    valor_produto real,
    data_modificacao TIMESTAMP DEFAULT NOW()
);

SELECT * FROM historico_produtos;