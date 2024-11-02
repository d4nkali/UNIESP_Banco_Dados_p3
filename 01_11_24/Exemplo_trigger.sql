--Alrteração da tabela usuários
ALTER TABLE usuarios
ADD COLUMN data_atualizacao TIMESTAMP;

--CRIAÇÃO DA TRIGGER--
CREATE OR REPLACE FUNCTION atualiza_data_hora()
RETURNS TRIGGER AS $$
BEGIN
    NEW.data_atualizacao := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualiza_data_hora_usuarios
BEFORE UPDATE ON usuarios
FOR EACH ROW
EXECUTE FUNCTION atualiza_data_hora();


--Teste de UPDATE
select * from usuarios


UPDATE usuarios
SET cidade = 'João Pessoa',
    estado = 'Paraiba'
WHERE cod_usuario = 1;
