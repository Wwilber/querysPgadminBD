-- DML - DATA MANIPULATION LANGUAGE: - insert; - update; - delete:

-- COMANDO DQL:
SELECT * FROM produtos;
SELECT * FROM tipos_produto;

-- COMANDOS DML:
-- UPDATE:
UPDATE produtos SET descricao = 'iphone XII' WHERE codigo = 1;
UPDATE produtos SET descricao = 'samsung A-10', preco = 1500.00 WHERE codigo = 2;

-- O UPDATE SEM O WHERE ALTERA OS DADOS DE TODAS AS LINHAS.
UPDATE produtos SET descricao = 'samsung A-10';

UPDATE produtos SET descricao = 'iphone XII' WHERE codigo = 1;
UPDATE produtos SET descricao = 'MOTOROLA' WHERE codigo = 2;
UPDATE produtos SET descricao = 'ZANFONE' WHERE codigo = 3;

UPDATE produtos SET codigo_tipo = 4;

-- DELETE:
DELETE FROM produtos WHERE preco='1500';


