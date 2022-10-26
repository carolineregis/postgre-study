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

-- com o código dessa forma, ainda é possível criar dois cursos com o mesmo id, o que é perigoso. Para corrigir esse problema:

DROP TABLE curso
CREATE TABLE curso (
	id INTEGER NOT NULL UNIQUE,
	nome VARCHAR(255) NOT NULL
);

-- NOT NULL UNIQUE = PRIMARY KEY, então:
DROP TABLE curso;
CREATE TABLE curso (
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Java');

-- erro (key=1 already exists):
INSERT INTO curso (id, nome) VALUES (1, 'Javascript');

-- criando uma tabela que relacione a tabela de alunos e de cursos
DROP TABLE aluno;
CREATE TABLE aluno (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO aluno (nome) VALUES ('Gabriel');
INSERT INTO aluno (nome) VALUES ('Dumas');

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);

-- criando chave estrangeira para evitar a inserção de um ID não existente
DROP TABLE aluno_curso

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id),
	
	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);

-- ERRO: nossa tabela reconhece que não existe um aluno com id = 3
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);