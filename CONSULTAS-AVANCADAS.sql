-- AVANÇANDO COM CONSULTAS
-- Criando tabela simulando cadastro de funcionários
CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');

-- consulta ordenada em ordem alfabética crescente
SELECT * 
    FROM funcionarios
    ORDER BY nome;
	
-- consulta ordenada em ordem alfabética decrescente
SELECT * 
    FROM funcionarios
    ORDER BY nome DESC;
	
-- consulta declarando a ordem com o número da posição do campo
SELECT *
	FROM funcionarios
	ORDER BY 4
	
-- limitando a quantidade de registros listados
SELECT * FROM funcionarios
ORDER BY nome
LIMIT 3;

-- exibindo o resultado após pular algumas linhas
SELECT * FROM funcionarios
ORDER BY nome
LIMIT 5
OFFSET 1;

-- COMANDOS DE AGREGAÇÃO
-- COUNT -> quantos registros existem na tabela
SELECT COUNT (id)
  FROM funcionarios;
  
-- SUM -> soma os valores
SELECT SUM (id) as "Soma"
  FROM funcionarios;

-- MAX -> retorna o maior valor do campo 
SELECT MAX (id) as "Maior valor"
  FROM funcionarios;
  
-- AVG -> retorna a media dos valores
SELECT AVG (id) as "Média"
  FROM funcionarios;

-- ROUND -> arredonda valores decimais
SELECT ROUND (AVG(id), 0) as "Média arredondada"
  FROM funcionarios;
  
-- COMO NÃO REPETIR OS RESULTADOS
-- DISTINCT
SELECT DISTINCT nome, sobrenome
  FROM funcionarios
  ORDER BY nome;
  
 -- GROUP BY --> agrupamento para realização de buscas com funções de agregação
 SELECT
       nome,
       sobrenome,
       COUNT(*)
  FROM funcionarios
  GROUP BY nome, sobrenome
  ORDER BY nome;
  
-- contar todos os cursos com alunos matriculados
SELECT *
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
	
-- busca mostrando o nome dos cursos e quantidade de alunos em cada um deles
SELECT curso.nome,
        COUNT(aluno.id)
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
    GROUP BY 1
    ORDER BY 1
	
-- exibindo cursos com ou sem alunos matriculados
SELECT *
    FROM curso
    LEFT JOIN aluno_curso ON aluno.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
    WHERE COUNT(aluno.id) = 0
GROUP BY 1