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

-- consulta com JOIN: Unindo dados da tabela A com dados da tabela B
SELECT * 
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id 
JOIN curso ON curso.id = aluno_curso.curso_id

-- matriculando o aluno em outro curso
INSERT INTO aluno_curso VALUES (2, 2)

-- fazendo consulta com alias para deixar os resultados mais claros
SELECT aluno.nome as "aluno",
curso.nome as "curso"
FROM aluno 
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id

-- ESTUDO DE JOINS
INSERT INTO aluno (nome) VALUES ('Arturo'); -- essa ocorrência irá aparecer na tabela aluno mas não na consulta com JOIN, pois ele não está matriculado em nenhum curso
INSERT INTO curso (id, nome) VALUES (3, 'CSS'); -- da mesma forma, não aparece na consulta com JOIN porque não está relacionado a nenhum aluno

-- LEFT JOIN -> quando existe um dado na tabela esquerda que não existe na tabela direita
SELECT aluno.nome as "Nome do Aluno",
curso.nome as "Nome do Curso"
FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso ON curso.id = aluno_curso.curso_id

-- RIGHT JOIN -> retorno da lista com todos os cursos (a lista da direita)
SELECT aluno.nome as "Nome do Aluno",
curso.nome as "Nome do Curso"
FROM aluno
RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
RIGHT JOIN curso ON curso.id = aluno_curso.curso_id

-- FULL JOIN -> retorna lista com todos os alunos e todos os cursos, mesmo que eles não estejam relacionados 
SELECT aluno.nome as "Nome do Aluno",
curso.nome as "Nome do Curso"
FROM aluno
FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
FULL JOIN curso ON curso.id = aluno_curso.curso_id

-- CROSS JOIN -> retorna todos os dados das duas tabelas, sem passar pela tabela aluno_curso. Multiplica os dados de A pelos dados da tabela B
SELECT aluno.nome as "Nome do Aluno",
curso.nome as "Nome do Curso"
FROM aluno 
CROSS JOIN curso

-- adicionando mais um aluno para testar o comportamento do CROSS JOIN
INSERT INTO aluno (nome) VALUES ('Carosfine')

-- repetindo o ultimo SELECT
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
    FROM aluno
CROSS JOIN curso