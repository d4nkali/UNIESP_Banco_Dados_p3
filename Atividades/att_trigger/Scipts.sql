/*

Exercícios Trigger

Aluno: Danilo Pereira Viana - P3B
Data: 06/12/2024

*/

/*

Questão 1 - Crie uma trigger que registra a data e hora da última atualização de um registro na
tabela de sua escolha.

*/
-- Criando função da trigger
CREATE OR REPLACE FUNCTION atualiza_data_hora()
RETURNS TRIGGER AS $$
BEGIN
    -- Atualizar a coluna ultima_atualizacao com a data e hora atual
    NEW.ultima_atualizacao = NOW();
    RETURN NEW;
END;

$$ LANGUAGE plpgsql;

-- Criar a trigger que dispara a função na atualização de registros
CREATE TRIGGER trigger_atualiza_data_hora
BEFORE UPDATE ON funcionarios
FOR EACH ROW
EXECUTE FUNCTION atualiza_data_hora();


/*

Questão 2 - Crie uma trigger que verifica se o valor do campo idade é maior ou igual à 18 anos
antes de inserir um novo registro na tabela funcionários, se a idade for menor que 18,
ele será considerado menor aprendiz:

*/
-- Função que será usada pela trigger
CREATE OR REPLACE FUNCTION verifica_idade_funcionario()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se a idade é menor que 18
    IF NEW.idade < 18 THEN
        NEW.modalidade_contrato := 'Menor Aprendiz';
    END IF;
    RETURN NEW;
END;

$$ LANGUAGE plpgsql;

-- Trigger que chama a função antes de inserir um novo registro
CREATE TRIGGER valida_idade_antes_inserir
BEFORE INSERT ON public.funcionarios
FOR EACH ROW
EXECUTE FUNCTION verifica_idade_funcionario();


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
