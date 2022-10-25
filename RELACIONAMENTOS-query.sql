-- Criando uma tabela com chave primária

-- o comando NOT NULL evita que a tabela seja criada com um campo vazio
CREATE TABLE curso (
	id INTEGER NOT NULL,
	nome VARCHAR(255) NOT NULL
);

-- esse insert viola a regra que próibe campos vazios 
INSERT INTO curso (id, nome) VALUES (NULL, NULL)

-- insert válido
INSERT INTO curso (id, nome) VALUES (5, 'informática')
