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
