SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

-- se tentarmos apagar um aluno:
DELETE FROM aluno WHERE id = 1;
-- não funciona, porque esse aluno está relacionado a um curso na tabela aluno_curso

-- Quando criamos a nossa FOREIGN KEY, o padrão dela é o comando ON DELETE RETRICT, ou seja, 
-- a chave estrangeira restringe o apagamento de dados que estão em duas tabelas. 
-- Ao trocarmos para ON DELETE CASCADE , sempre que apagarmos um dado de um banco, 
-- o registro será apagado de todas as tabelas que o contém, ou seja, 
-- quando apagarmos o dado do aluno, ele também será excluído do curso.

-- apagando a tabela existente e criando com o comando DELETE CASCADE
DROP TABLE aluno_curso

CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	FOREIGN KEY (aluno_id)
	REFERENCES aluno(id)
	ON DELETE CASCADE,
	
	FOREIGN KEY (curso_id)
	REFERENCES curso(id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

SELECT aluno.nome as "Nome do Aluno",
curso.nome as "Nome do Curso"
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id

DELETE FROM aluno WHERE (id = 4)

-- apagando a tabela aluno_curso existente e criando uma nova para adicionar o UPDATE CASCADE
DROP TABLE aluno_curso

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),

	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id)
    ON DELETE CASCADE
    ON  UPDATE CASCADE,

    FOREIGN KEY (curso_id)
    REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1)
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1)

SELECT 
	aluno.id as aluno_id,
	aluno.nome as "Nome do Aluno",
	curso.id as "curso_id",
	curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id

UPDATE aluno SET id = 20 WHERE  id = 2;
SELECT * FROM aluno_curso