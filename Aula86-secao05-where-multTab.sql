-- DQL(Data Query Language - Linguagem de Consulta de Dados) - SELECT: Multiplas Tabelas:

SELECT * FROM produtos;
SELECT * FROM tipos_produto;

SELECT * FROM produtos WHERE preco>'120.000,00';

UPDATE produtos SET preco='1000,00' WHERE codigo=2;
-- ALIAS:
SELECT p.codigo as cod, p.descricao as desc, p.preco as pre, p.codigo_tipo as cod_tipo FROM produtos as  p;
SELECT p.descricao as descrição, p.preco as preço, p.codigo_tipo as "tipo do produto", p.codigo as id FROM produtos as p;
SELECT descricao as descrição, preco as preço, codigo_tipo as "tipo do produto", codigo as identificador FROM produtos;

-- CONSULTA EM MÚLTIPLAS TABELAS:
SELECT p.codigo AS "código", p.nome AS "descricao do produto", p.preco AS "preço", p.codigo_tipo AS "tipo do produto", tp.descricao AS "descrição do produto" FROM 
produtos AS p, tipos_produto AS tp WHERE p.codigo_tipo= tp.codigo;

SELECT p.codigo AS "código", p.nome AS "descricao do produto", p.preco AS "preço", tp.descricao AS "tipo do produto" FROM 
produtos AS p, tipos_produto AS tp WHERE p.codigo_tipo= tp.codigo;

