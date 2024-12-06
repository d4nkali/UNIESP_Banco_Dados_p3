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
