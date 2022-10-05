--selecting specific fields

SELECT * FROM aluno

SELECT nome FROM aluno

--selecting fields and casting 
SELECT nome AS "Nome do Aluno",
	idade,
	altura
FROM aluno

INSERT INTO aluno (nome) VALUES ('Gabriel Gol');
INSERT INTO aluno (nome) VALUES ('Lula da Silva');
INSERT INTO aluno (nome) VALUES ('Gabriel do Poço');
INSERT INTO aluno (nome) VALUES ('Lucas Mel');
INSERT INTO aluno (nome) VALUES ('Lucas Mal');

--APLICANDO FILTROS

--pesquisando um texto específico (igual)
SELECT *
	FROM aluno
WHERE nome = 'Gabriel Gol'

--diferente <> ou !=
SELECT * 
	FROM aluno
WHERE nome != 'Lula da Silva'

--LIKE (o under aceita qualquer caractere naquela posição)
SELECT *
	FROM aluno
WHERE nome LIKE 'Lucas M_l'

--LIKE + (%) -> recupera todos os dados começados em L
SELECT * 
	FROM aluno
WHERE nome like 'L%'

--LIKE + % no inicio -> recupera todos os dados terminados em l
SELECT * 
	FROM aluno
WHERE nome like '%l'