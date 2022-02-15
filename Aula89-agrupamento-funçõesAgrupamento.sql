-- AGRUPAMENTO:

-- DDL - Data Definition Language: -CREATE; -ALTER; -DROP:
-- CRIAÇÃO DO BANCO DE DADOS:
CREATE DATABASE agrupamento;

-- CRIAÇÃO DAS TABELAS DO BANCO DE DADOS AGRUPAMENTO:

CREATE TABLE tipos(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
);



CREATE TABLE fabricantes(
	id_fabr SERIAL PRIMARY KEY,
	nome_fabr VARCHAR(60) NOT NULL
);

CREATE TABLE produtos(
	id_prod SERIAL PRIMARY KEY,
	nome_prod VARCHAR(60) NOT NULL,
	id_fabricante INT REFERENCES fabricantes(id_fabr) NOT NULL,
	qtde INT NOT NULL,
	id_tipo INT REFERENCES tipos(id_tip) NOT NULL 
);

-- ALTERAÇÃO DA COLUNA DE UMA TABELA:
ALTER TABLE tipos RENAME id TO id_tip;
ALTER TABLE tipos RENAME nome TO nome_tip;

-- DML: DATA MANIPULATION LANGUAGE: - INSERT, - UPDATE, - DELETE:
INSERT INTO tipos(nome_tip) VALUES ('Console');
INSERT INTO tipos(nome_tip) VALUES ('Notebook');
INSERT INTO tipos(nome_tip) VALUES ('Celular');
INSERT INTO tipos(nome_tip) VALUES ('Smartphone');
INSERT INTO tipos(nome_tip) VALUES ('Sofá');
INSERT INTO tipos(nome_tip) VALUES ('Armário');
INSERT INTO tipos(nome_tip) VALUES ('Refrigerador');

INSERT INTO fabricantes(nome_fabr) VALUES ('Sony');
INSERT INTO fabricantes(nome_fabr) VALUES ('Dell');
INSERT INTO fabricantes(nome_fabr) VALUES ('Microsoft');
INSERT INTO fabricantes(nome_fabr) VALUES ('Samsung');
INSERT INTO fabricantes(nome_fabr) VALUES ('Apple');
INSERT INTO fabricantes(nome_fabr) VALUES ('Beline');
INSERT INTO fabricantes(nome_fabr) VALUES ('Magno');
INSERT INTO fabricantes(nome_fabr) VALUES ('CCE');
INSERT INTO fabricantes(nome_fabr) VALUES ('Nitendo');

INSERT INTO produtos (nome_prod, id_fabricante, qtde, id_tipo) VALUES ('Playstation 3', 1, 100, 1);
INSERT INTO produtos (nome_prod, id_fabricante, qtde, id_tipo) VALUES ('Core 2 Duo 4 GB RAM', 2, 200, 2);
INSERT INTO produtos (nome_prod, id_fabricante, qtde, id_tipo) VALUES ('Xbox 360 120 GB', 3, 350, 1);
INSERT INTO produtos (nome_prod, id_fabricante, qtde, id_tipo) VALUES ('GT - I6220 Quad Band', 4, 300, 3);
INSERT INTO produtos (nome_prod, id_fabricante, qtde, id_tipo) VALUES ('IPHONE 4 32 GB', 5, 50, 4);
INSERT INTO produtos (nome_prod, id_fabricante, qtde, id_tipo) VALUES ('Playstation 2', 1, 50, 1);
INSERT INTO produtos (nome_prod, id_fabricante, qtde, id_tipo) VALUES ('Sofá Estufado', 6, 200, 5);
INSERT INTO produtos (nome_prod, id_fabricante, qtde, id_tipo) VALUES ('Armário de Serviço', 7, 50, 6);
INSERT INTO produtos (nome_prod, id_fabricante, qtde, id_tipo) VALUES ('Refrigerador 420 L', 8, 200, 7);
INSERT INTO produtos (nome_prod, id_fabricante, qtde, id_tipo) VALUES ('WII 120 GB', 8, 250, 1);

-- SELECT COM AGRUPAMENTO:

SELECT pr.id_prod AS "CÓDIGO DO PRODUTO", pr.nome_prod AS "NOME DO PRODUTO", fab.nome_fabr AS "FABRICANTE", 
tp.nome_tip AS "TIPO DO PRODUTO", pr.qtde 
FROM produtos AS pr, fabricantes AS fab, tipos AS tp
WHERE id_fabricante=id_fabr AND id_tipo=id_tip;

-- ORDER BY:
SELECT pr.id_prod AS "CÓDIGO DO PRODUTO", pr.nome_prod AS "NOME DO PRODUTO", fab.nome_fabr AS "FABRICANTE", 
tp.nome_tip AS "TIPO DO PRODUTO", pr.qtde 
FROM produtos AS pr, fabricantes AS fab, tipos AS tp
WHERE id_fabricante=id_fabr AND id_tipo=id_tip 
ORDER BY pr.qtde;

SELECT pr.id_prod AS "CÓDIGO DO PRODUTO", pr.nome_prod AS "NOME DO PRODUTO", fab.nome_fabr AS "FABRICANTE", 
tp.nome_tip AS "TIPO DO PRODUTO", pr.qtde 
FROM produtos AS pr, fabricantes AS fab, tipos AS tp
WHERE id_fabricante=id_fabr AND id_tipo=id_tip 
ORDER BY pr.id_prod;

-- ORDER BY:
SELECT pr.id_prod AS "CÓDIGO DO PRODUTO", pr.nome_prod AS "NOME DO PRODUTO", fab.nome_fabr AS "FABRICANTE", 
tp.nome_tip AS "TIPO DO PRODUTO", pr.qtde 
FROM produtos AS pr, fabricantes AS fab, tipos AS tp
WHERE id_fabricante=id_fabr AND id_tipo=id_tip 
ORDER BY pr.id_prod;


SELECT * FROM produtos WHERE id_prod>=1 AND id_prod<=99;
SELECT * FROM tipos;
SELECT * FROM fabricantes;
SELECT * FROM produtos;

UPDATE produtos SET id_prod='1' WHERE id_prod='8';

-- GROUP BY:
SELECT t.nome_tip AS tipos, f.nome_fabr AS Fabricante, SUM(p.qtde) AS "quantidade em estoque"
	FROM tipos AS t, fabricantes AS f, produtos AS p
	WHERE p.id_tipo=t.id_tip AND p.id_fabricante=f.id_fabr
	GROUP BY t.nome_tip, f.nome_fabr;

-- HAVING:
SELECT t.nome_tip AS tipos, f.nome_fabr AS Fabricante, SUM(p.qtde) AS "quantidade em estoque"
	FROM tipos AS t, fabricantes AS f, produtos AS p
	WHERE p.id_tipo=t.id_tip AND p.id_fabricante=f.id_fabr
	GROUP BY t.nome_tip, f.nome_fabr
	HAVING SUM(p.qtde)>200;

SELECT t.nome_tip AS tipos, f.nome_fabr AS Fabricante, SUM(p.qtde) AS "quantidade em estoque"
	FROM tipos AS t, fabricantes AS f, produtos AS p
	WHERE p.id_tipo=t.id_tip AND p.id_fabricante=f.id_fabr
	GROUP BY f.nome_fabr, t.nome_tip
	HAVING SUM(p.qtde)>200;
	
-- ORDENAMENTO PADRÃO BY ASC - POR ID:
SELECT * FROM tipos;
SELECT * FROM fabricantes;
SELECT * FROM produtos;

SELECT * FROM tipos ORDER BY id_tip DESC;

SELECT id_tip, nome_tip FROM tipos ORDER BY id_tip ASC;

-- PARA VERIFICAR OS 3 TIPOS DE PRODUTOS CADASTRADOS - LIMIT = LIMITA A QUANTIDADE DE REGISTROS LISTADOS: 
SELECT id_tip, nome_tip FROM tipos ORDER BY nome_tip DESC LIMIT 3;

SELECT * FROM produtos ORDER BY id_prod DESC;
SELECT * FROM produtos ORDER BY id_prod DESC LIMIT 5;