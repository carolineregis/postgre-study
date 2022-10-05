-- CRUD STUDY

--create
CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura real,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em timestamp
);

--read
SELECT * FROM aluno

--create (?)
INSERT INTO aluno (
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
) VALUES (
	'Caroline',
	'09003956561',
	'É doidinha da cabeça',
	19,
	45.00,
	150,
	true,
	'2002-03-05',
	'14:30:00',
	'2022-02-08 12:35:00'
)

--update
UPDATE aluno
	SET nome = 'Dumas'
WHERE id = 1;

--filter
SELECT *
	FROM aluno
	WHERE nome = 'Caroline'

--delete
DELETE
	FROM aluno
	WHERE nome = 'Caroline'




