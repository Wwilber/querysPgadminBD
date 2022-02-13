-- DTL - DATA TRANSACTION LANGUAGE: - Begin - Commit - Rollback:

-- COMANDOS DDL(Data Definition Language) - CREATE, ALTER, DROP:
-- CRIAÇÃO DO BANCO DE DADOS secao05:
CREATE DATABASE secao05;

-- CRIAÇÃO DAS TABELAS DO BANCO DE DADOS secao05:
CREATE TABLE tipos_produto(
	codigo SERIAL PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
);

CREATE TABLE produtos(
	codigo SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	preco MONEY	NOT NULL,
	codigo_tipo INT REFERENCES tipos_produto(codigo) NOT NULL
);

-- COMANDOS DML(Data Manipulation Language) - INSERT, UPDATE, DELETE:
INSERT INTO tipos_produto (descricao) VALUES ('celular');
INSERT INTO tipos_produto (descricao) VALUES ('impressora');
INSERT INTO tipos_produto (descricao) VALUES ('notebook');
INSERT INTO tipos_produto (descricao) VALUES ('televisor');

INSERT INTO produtos (nome, preco, codigo_tipo) VALUES ('samsung a-10', '1200.00', 1);
INSERT INTO produtos (nome, preco, codigo_tipo) VALUES ('hp 770', '2000.00', 2);
INSERT INTO produtos (nome, preco, codigo_tipo) VALUES ('acer core i3', '4333.47', 3);
INSERT INTO produtos (nome, preco, codigo_tipo) VALUES ('semp toshiba', '2500.00', 4);

-- COMANDO DQL(Data Manipulation Language)  - SELECT:
SELECT * FROM tipos_produto;
SELECT * FROM produtos;

-- DTL - DATA TRANSACTION LANGUAGE: - Begin - Commit - Rollback:
--INÍCIO DA TRANSAÇÃO:
BEGIN TRANSACTION;
	INSERT INTO tipos_produto (descricao) VALUES ('TIPO A');
	INSERT INTO tipos_produto (descricao) VALUES ('TIPO B');

-- DESFAZER TRANSAÇÕES DO BEGIN TRANSACTION antes de ser comitado;
ROLLBACK;

-- GRAVAÇÃO DA OPERAÇÃO FEITA PELO BEGIN TRANSACTION: COMMIT
-- depois de comitado não dá pra utilizar o rollback para desfazer. 
COMMIT;


