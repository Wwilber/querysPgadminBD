SELECT * FROM PRODUTOS;
SELECT * FROM produtos WHERE preco>'120.000,00';

UPDATE produtos SET preco='1000,00' WHERE codigo=2;
-- ALIAS:
SELECT p.codigo as cod, p.descricao as desc, p.preco as pre, p.codigo_tipo as cod_tipo FROM produtos as  p;
SELECT p.descricao as descrição, p.preco as preço, p.codigo_tipo as "tipo do produto", p.codigo as id FROM produtos as p;
SELECT descricao as descrição, preco as preço, codigo_tipo as "tipo do produto", codigo as identificador FROM produtos;
