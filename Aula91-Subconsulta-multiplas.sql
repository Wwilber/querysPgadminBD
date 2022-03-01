-- SUBCONSULTAS: aula 20 do ultrabook:
-- CREATE DATABASE subconsulta;

-- CRIAÇÃO DAS TABELAS:

-- DDL - DATA DEFINITION LANGUAGE: - CREATE; - ALTER; - DROP:
CREATE TABLE escritorios(
	id SERIAL PRIMARY KEY,
	pais VARCHAR(30) NOT NULL
);

CREATE TABLE funcionarios(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	sobrenome VARCHAR(30) NOT NULL,
	id_esc INT REFERENCES escritorios(id)
);

CREATE TABLE pagamentos(
	id SERIAL PRIMARY KEY,
	id_funcionario INT REFERENCES funcionarios(id) NOT NULL,
	salario DECIMAL(8,2) NOT NULL,
	data DATE NOT NULL
 );

-- DML - DATA MANIPULATION LANGUAGE: - INSERT; - UPDATE; - DELETE:

-- INSERT:
INSERT INTO escritorios (pais) VALUES ('Brasil');
INSERT INTO escritorios (pais) VALUES ('USA');
INSERT INTO escritorios (pais) VALUES ('Portugal');
INSERT INTO escritorios (pais) VALUES ('Bélgica');
INSERT INTO escritorios (pais) VALUES ('França');
INSERT INTO escritorios (pais) VALUES ('Itália');

INSERT INTO funcionarios (nome, sobrenome, id_esc) VALUES ('Wilber', 'Ribeiro', 1);
INSERT INTO funcionarios (nome, sobrenome, id_esc) VALUES ('Aline', 'Tomaz', 2);
INSERT INTO funcionarios (nome, sobrenome, id_esc) VALUES ('Arthur', 'Tomaz', 3);
INSERT INTO funcionarios (nome, sobrenome, id_esc) VALUES ('Ana', 'Célia', 4);
INSERT INTO funcionarios (nome, sobrenome, id_esc) VALUES ('Angela', 'Ribeiro', 5);
INSERT INTO funcionarios (nome, sobrenome, id_esc) VALUES ('Silvia', 'Helena', 6);

INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (01, 5000.00, '01-12-2021');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (02, 3333.33, '06-06-2021');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (03, 4000.00, '26-02-2022');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (04, 6585.00, '31-12-2021');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (05, 6987.00, '10-10-2021');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (06, 7411.44, '02-01-2022');

-- UPDATE:




-- DQL - DATA QUERY LANGUAGE: - SELECT:
SELECT * FROM escritorios;
SELECT * FROM funcionarios;
SELECT * FROM pagamentos;

-- COM SUBCONSULTAS:
SELECT nome, sobrenome FROM funcionarios WHERE id_esc IN ( SELECT id FROM escritorios WHERE  pais='Brasil');
SELECT nome, sobrenome FROM funcionarios WHERE id_esc IN ( SELECT id FROM escritorios WHERE  id=2);

-- SEM SUBCONSULTAS:
SELECT nome, sobrenome 
	FROM funcionarios AS f, escritorios AS e 
	WHERE f.id_esc = e.id 
	AND e.pais='Brasil';  
	
SELECT nome, sobrenome 
	FROM funcionarios f, escritorios e 
	WHERE f.id_esc = e.id 
	AND e.pais='Bélgica';  

SELECT nome, sobrenome
FROM funcionarios
INNER JOIN escritorios
ON escritorios.id = funcionarios.id_esc
AND escritorios.pais='Brasil';

SELECT nome, sobrenome
FROM funcionarios
INNER JOIN escritorios
ON escritorios.id = funcionarios.id_esc
AND escritorios.pais='Bélgica';

EXEMPLO 2:
SELECT f.nome, f.sobrenome, e.pais, p.salario
FROM pagamentos AS p, funcionarios AS f, escritorios AS e
WHERE f.id_esc = e.id 
AND p.id_funcionario = f.id
AND salario = (SELECT MAX(salario) FROM pagamentos);

-- EXEMPLO 3:
SELECT f.nome, f.sobrenome, e.pais, p.salario
FROM pagamentos AS p, funcionarios AS f, escritorios AS e
WHERE f.id_esc = e.id 
AND p.id_funcionario = f.id
AND salario < (SELECT AVG(salario) FROM pagamentos);



