/*

Questão 3 - Crie uma trigger que gere uma nova entrada na tabela historico_produtos sempre que
um registro na tabela produtos é atualizado:

*/
-- Função que será usada pela trigger
CREATE OR REPLACE FUNCTION gerar_historico_produtos()
RETURNS TRIGGER AS $$
BEGIN
    -- Insere um novo registro no histórico com os dados antigos
    INSERT INTO public.historico_produtos (
        cod_produto, 
        nome_produto, 
        categoria_produto, 
        valor_produto, 
        data_modificacao
    )
    VALUES (
        OLD.cod_produto,
        OLD.nome_produto,
        OLD.categoria_produto,
        OLD.valor_produto,
        NOW()
    );
    RETURN NEW;
END;

$$ LANGUAGE plpgsql;

-- Trigger que chama a função após a atualização de um registro
CREATE TRIGGER trigger_historico_produtos
AFTER UPDATE ON public.produtos
FOR EACH ROW
EXECUTE FUNCTION gerar_historico_produtos();
