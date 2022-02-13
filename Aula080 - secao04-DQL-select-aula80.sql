-- CRIAÇÃO DO BANCO DE DADOS secao04 ACESSANDO DE OUTRO BANCO DE DADOS:
CREATE DATABASE secao04;

-- CRIAÇÃO DAS TABELAS:
CREATE TABLE tipos_produto(
	codigo		SERIAL 		PRIMARY KEY,
	descricao	VARCHAR(30)	NOT NULL
);

CREATE TABLE produtos(
	codigo		SERIAL		PRIMARY KEY,
	descricao	VARCHAR(30)	NOT NULL,
	preco		MONEY		NOT NULL,
	codigo_tipo	INT REFERENCES tipos_produto(codigo) NOT NULL
);

-- INSERTS:

INSERT INTO tipos_produto(descricao) VALUES ('computador');
INSERT INTO tipos_produto(descricao) VALUES ('impressora');
INSERT INTO tipos_produto(descricao) VALUES ('televisor');
INSERT INTO tipos_produto(descricao) VALUES ('celular');

INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('ACCER 1080', 4000.00, 1);
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('IPHONE X', 8500.00, 4);
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('HP 7000 AUT', 2300.00, 2);
INSERT INTO produtos(descricao, preco, codigo_tipo) VALUES ('SAMSUNG 50"', 3333.22, 3);

-- SELECTS:
-- select geral:
SELECT * FROM produtos;
SELECT * FROM produtos WHERE codigo ='2';

-- select em cada coluna cada informação:
SELECT descricao, preco FROM produtos WHERE codigo ='1';

-- select em uma coluna todas as informações: 
SELECT (descricao, preco) FROM produtos WHERE codigo ='2';

-- ALIAS:
SELECT p.codigo as cod, p.descricao as desc, p.preco as pre, p.codigo_tipo as cod_tipo FROM produtos as  p;
SELECT p.descricao as descrição, p.preco as preço, p.codigo_tipo as "tipo do produto", p.codigo as id FROM produtos as p;
SELECT descricao as descrição, preco as preço, codigo_tipo as "tipo do produto", codigo as identificador FROM produtos;


