-- DDL - DATA DEFINITION LANGUAGE: - create - alter; - drop:

-- COMANDO CREATE:

-- CRIAÇÃO DE UM BANCO DE DADOS:
CREATE DATABASE teste;


-- CRIAÇÃO DE TABELAS PARA O BANCO DE DADOS:

CREATE TABLE tipos_produto(
	id 			SERIAL 					PRIMARY KEY, 
	descricao 	CHARACTER VARYING(50) 	NOT NULL
);

CREATE TABLE produtos(
	id 					SERIAL 								PRIMARY KEY, 
	descricao 			CHARACTER VARYING(50)				NOT NULL,
	preco 				MONEY 								NOT NULL,
	id_tipo_produto 	INT REFERENCES tipos_produto(id) 	NOT NULL
);

CREATE TABLE pacientes(
	id 			SERIAL 					PRIMARY KEY,
	nome 		CHARACTER VARYING(50) 	NOT NULL,
	endereco	CHARACTER VARYING(50)	NOT NULL,
	bairro		CHARACTER VARYING(40)	NOT NULL,
	cidade		VARCHAR(40)				NOT NULL,
	estado		CHAR(2)					NOT NULL,
	cep			VARCHAR(9)				NOT NULL,
	data_nasc	DATE					NOT NULL
);

CREATE TABLE professores(
	id 			SERIAL 					PRIMARY KEY,
	nome 		CHARACTER VARYING(50)	NOT NULL,
	telefone	INT 					NOT NULL
	
);

CREATE TABLE turmas(
	id 				SERIAL							PRIMARY KEY,
	capacidade		INT								NOT NULL,
	id_professor	INT REFERENCES professores(id)	NOT NULL
);

-- COMANDO ALTER: alterar tabelas:

ALTER TABLE tipos_produto ADD peso DECIMAL(8,2);

SELECT * FROM tipos_produto;

-- COMANDOS DML:
UPDATE tipos_produto SET peso=4544.14 WHERE codigo=1;
UPDATE tipos_produto SET descricao='impressora E', peso=696.47 WHERE codigo=4;
UPDATE tipos_produto SET peso=1000.00 WHERE codigo>1 and codigo<4;

-- COMANDO DROP
-- DELETAR TABELA:
-- Se a tabela que deseja deletar possuir relacionamento não é possível deletar.
DROP TABLE pacientes;

-- DELETAR O BANCO DE DADOS:
DROP DATABASE SECAO03; - não deleta banco de dados conectado.

SELECT * FROM produtos;
SELECT * FROM tipos_produto;

