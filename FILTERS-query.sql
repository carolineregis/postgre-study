--selecting specific fields

SELECT * FROM aluno

SELECT nome FROM aluno

--selecting fields and casting 
SELECT nome AS "Nome do Aluno",
	idade,
	altura
FROM aluno