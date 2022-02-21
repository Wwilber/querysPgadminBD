-- DDL - Data Definition Language: -CREATE; -ALTER; -DROP:
CREATE TABLE categorias(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
);

CREATE TABLE produtos2(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(60) NOT NULL,
	preco_venda DECIMAL(8,2) NOT NULL,
	preco_custo DECIMAL(8,2) NOT NULL,
	id_categoria INT REFERENCES categorias(id) NOT NULL
);


-- DML - DATA MANIPULATION LANGUAGE: -INSERT; -UPDATE; -DELETE:
INSERT INTO categorias (nome) VALUES ('Material Escolar');
INSERT INTO categorias (nome) VALUES ('Acessório Informática');
INSERT INTO categorias (nome) VALUES ('Material de Escritório');
INSERT INTO categorias (nome) VALUES ('Game');

INSERT INTO produtos2 (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caderno', '5.45', '2.30', 1);
INSERT INTO produtos2 (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caneta', '1.20', '0.45', 1);
INSERT INTO produtos2 (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Pendrive 320B', '120.54', '32.55', 2);
INSERT INTO produtos2 (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Mouse', '17.00', '4.30', 2);
INSERT INTO produtos2 (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Nitendo', '3000.00', '1500.30', 4);

-- DQL: DATA QUERY LANGUAGE: -SELECT:
SELECT * FROM categorias;
SELECT * FROM produtos2;

-- SELECT COM WHERE:
SELECT p.descricao, p.preco_venda, p.preco_custo, c.nome
FROM produtos2 AS p, categorias AS c
WHERE p.id = c.id;

-- SELECT COM INNER JOIN:
SELECT p.descricao, p.preco_venda, p.preco_custo, c.nome
FROM produtos2 AS p
INNER JOIN categorias AS c
ON p.id = c.id;

-- FUNÇÕES DE AGREGAÇÃO:
-- FUNÇÃO MAX: 
-- retorna o maior preço de venda da tabela produtos.
SELECT MAX(preco_venda) FROM produtos2;

-- estamos buscando o maior preço de venda em todas as categorias de produtos que temos. Ao final, estamos agrupando pelo id da categoria:
SELECT id_categoria, MAX(preco_venda) FROM produtos2 GROUP BY id_categoria;
SELECT preco_venda, MAX(preco_venda) FROM produtos2 GROUP BY preco_venda;
SELECT * FROM produtos2;
-- No exemplo abaixo estamos buscando o maior preço de venda emcada uma dascategoriasdeprodutos que temos onde o preço de venda seja maior que 10,00. Ao final estamosagrupandopelo id da categoria.
-- OBS: A cláusula HAVING funciona quase como um WHERE, mas é geralmenteutilizadaemconjunto com funções de agregação enquanto o WHERE é utilizado como SELECT.
SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria HAVING MAX(preco_venda) > 10;

-- FUNÇÃO MIN: 
-- A função min analisa um conjunto de valores e retorna o menor entre eles.
-- No exemplo abaixo a função min() retorna o menor preço de venda da tabelaprodutos:
SELECT MIN(preco_venda) FROM produtos2;
SELECT MAX(preco_venda) FROM produtos2;

-- FUNÇÃO SUM: A função sum() realiza a soma dos valores em uma única coluna e retorna esse resultado.
-- No exemplo abaixo somamos todos os preços de venda dos produtos onde a categoriasejaigual a 1.
SELECT SUM(preco_venda) FROM produtos2 WHERE id_categoria = 1;
SELECT SUM(preco_venda) FROM produtos2 WHERE id_categoria = 2;
SELECT SUM(preco_venda) FROM produtos2 WHERE id_categoria = 3;
SELECT SUM(preco_venda) FROM produtos2 WHERE id_categoria = 4;
SELECT * FROM produtos2;


SELECT SUM(preco_venda) FROM produtos2;

-- FUNÇÃO AVG: 
-- Com a função avg() podemos calcular a média aritmética dos valores emumaúnicacoluna.
-- No exemplo abaixo estamos calculando a média aritmética dos preços de venda da tabela produtos:
SELECT AVG(preco_venda) FROM produtos2;

-- FUNÇÃO ROUND: 
-- para arredondar valores e desta forma especificar quantascasasdecimais queremos apresentar o valor.
-- No exemplo abaixo, estamos calculando a média aritmética de todos os preços de venda da tabela produtos e apresentando o valor com duas casas decimais:
SELECT ROUND(AVG(preco_venda), 2) FROM produtos2;

-- FUNÇÃO COUNT:
-- A função count() retorna o total de linhas selecionadas; 
-- Podemos passar por parâmetro o nome da coluna ou um asterisco; 
-- Por padrão, quando informado o nome de uma coluna, valores do tipo NULL sãoignorados,mas quando informado um asterisco (*) todas as linhas serão contabilizadas.
-- No exemplo ABAIXO estamos contando quantos produtos da categoria 1 temos cadastrados:
SELECT COUNT(preco_venda) AS Quantidade FROM produtos2 WHERE id_categoria=1;





