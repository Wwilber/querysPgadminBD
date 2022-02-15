-- DDL: Data Definition Language: - CREATE; ALTER; - DROP:
-- EXCLUIR BANCO DE DADOS:
DROP DATABASE junção;

-- CRIAR BANCO DE DADOS:
CREATE DATABASE juncao;

-- CRIAR TABELAS:
CREATE TABLE profissoes(
	id SERIAL PRIMARY KEY,
	cargo VARCHAR(60) NOT NULL
);

CREATE TABLE clientes(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL,
	data_nascimento DATE	NOT NULL,
	telefone VARCHAR(10) NOT NULL,
	id_profissao INT REFERENCES profissoes(id) NOT NULL
);

CREATE TABLE consumidor(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL,
	contato VARCHAR(50) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	cep VARCHAR(20) NOT NULL,
	pais VARCHAR(50) NOT NULL	
);

CREATE TABLE clientesb(
	cod_cliente SERIAL PRIMARY KEY,
	nome_cliente VARCHAR(50) NOT NULL,
	sobrenome_cliente VARCHAR(50) NOT NULL
);

INSERT INTO clientesb (nome_cliente, sobrenome_cliente) VALUES ('Maria', 'das Graças');
INSERT INTO clientesb (nome_cliente, sobrenome_cliente) VALUES ('Aline', 'Tomaz');
INSERT INTO clientesb (nome_cliente, sobrenome_cliente) VALUES ('Wilber', 'Ribeiro');


CREATE TABLE produtosb(
	cod_produto	SERIAL PRIMARY KEY,
	nome_produto VARCHAR(50) NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	preco	MONEY	NOT NULL, 
	qtde_estoque INT
)

INSERT INTO produtosb(nome_produto, descricao, preco, qtde_estoque) VALUES ('Perfume One Million', 'Flagrância Cheirosa', '600,00', 15);
INSERT INTO produtosb(nome_produto, descricao, preco, qtde_estoque) VALUES ('Shampoo pra Cavalo', 'deixa cabelo liso', '78,00', 05);
INSERT INTO produtosb(nome_produto, descricao, preco, qtde_estoque) VALUES ('Desodorante Rexona', 'Suave', '12,88', 07);

CREATE TABLE pedidosb(
	cod_pedido SERIAL PRIMARY KEY,
	cod_cliente INT REFERENCES clientesb(cod_cliente) NOT NULL,
	cod_produto INT REFERENCES produtosb(cod_produto) NOT NULL,  
	qtde INT NOT NULL
);



INSERT INTO pedidosb (cod_cliente, cod_produto, qtde) VALUES (01, 02, 03);
INSERT INTO pedidosb (cod_cliente, cod_produto, qtde) VALUES (02, 03, 05);
INSERT INTO pedidosb (cod_cliente, cod_produto, qtde) VALUES (03, 03, 03);
INSERT INTO pedidosb (cod_cliente, cod_produto, qtde) VALUES (03, 01, 01);

-- DML: DATA MANIPULATION LANGUAGE: - INSERT; - UPDATE; -DELETE:

-- INSERIR DADOS NAS TABELAS:
INSERT INTO profissoes (cargo) VALUES ('Programador');  
INSERT INTO profissoes (cargo) VALUES ('Analista de Sistema');
INSERT INTO profissoes (cargo) VALUES ('Suporte');
INSERT INTO profissoes (cargo) VALUES ('Gerente');

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) 
VALUES ('João Pereira', '15-06-1981', '1234-5688', 1);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) 
VALUES ('Ricardo da Silva', '10-10-1973', '2234-5669', 2);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) 
VALUES ('Felipe Oliveira', '01-08-1987', '4234-5640', 3);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) 
VALUES ('Mário Pirez', '05-02-1991', '5234-5621', 1);
INSERT INTO clientes (nome, data_nascimento, telefone) 
VALUES ('João Silveira', '25-02-1970', '3333-3435');

INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) 
VALUES (' Aline Tomaz', 'Wilber Ribeiro', 'Avenida Domingos Olimpio 2067', 'Fortaleza', '60040-081', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) 
VALUES (' Wilber Ribeiro', 'Aline Tomaz', 'Rua 7, 221 - B', 'Maracanaú', '61905-500', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) 
VALUES (' Arthur Tomaz', 'Aline Tomaz', 'Rua 7, 221 - B', 'Maracanaú', '61905-500', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) 
VALUES (' Raimundo Nonato', 'Jane Tomaz', 'Rua 150, 1333', 'Maracanaú', '61905-500', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) 
VALUES ('Jane Tomaz', 'Raimundo Nonato', 'Rua João da Silveira 1407', 'Maranguape', '62355-200', 'Brasil');

SELECT * FROM consumidor;
SELECT * FROM clientes, profissoes; 

-- ver o formato da data:
SHOW DATESTYLE;

-- JUNÇÃO DE TABELAS:

-- JUNÇÃO DE PRODUTO CARTESIANO: Aprendendo essa nem precisa das outras.
SELECT c.nome, c.data_nascimento, c.telefone, c.id_profissao, p.cargo 
FROM clientes AS c, profissoes AS p WHERE c.id_profissao=p.id;

SELECT c.nome AS CLIENTE, c.data_nascimento AS "DATA DE NASCIMENTO", c.telefone AS "FONE", p.cargo AS "CARGO DO CLIENTE" 
FROM clientes AS c, profissoes  AS p  WHERE c.id_profissao=p.id;

--INNER JOIN:
-- sintaxe:
-- SELECT colunas - t1.id, t1.nome
-- FROM tabela1 AS t1 (TABELA 1 - QUE TEM A CHAVE ESTRANGEIRA DA RELAÇÃO OU DAS RELACÕES)
-- INNER JOIN tabela2 AS t2 (TABELA QUE TEM A CHAVE PRIMÁRIA)
-- ON t1.id_profissao=t2.id 
-- INNER JOIN tabelaN  AS n
-- ON t1.id_graduacao=t2.id 
e ainda pode complementar com
-- WHERE COM A CONDIÇÃO DE FILTRAGEM

SELECT c.id AS "ID", c.nome AS "CLIENTE", c.data_nascimento AS "DATA DE NASCIMENTO" , c.telefone AS "FONE", 
p.cargo AS "CARGO DO CLIENTE"
FROM clientes AS c 
INNER JOIN profissoes AS p
ON c.id_profissao=p.id;

-- INNER JOIN - 1:
SELECT pedidosb.cod_pedido, produtosb.nome_produto, pedidosb.qtde 
FROM pedidosb
INNER JOIN produtosb
ON pedidosb.cod_pedido=produtosb.cod_produto;

-- INNER JOIN - 2:
SELECT pedb.cod_pedido AS "NÚMERO DO PEDIDO", prodb.nome_produto AS "PRODUTO", prodb.preco, prodb.descricao, pedb.qtde AS "QUANTIDADE", clib.nome_cliente AS "NOME DO CLIENTE", clib.sobrenome_cliente AS "SOBRENOME" 
FROM pedidosb AS pedb
INNER JOIN produtosb AS prodb
ON pedb.cod_pedido=prodb.cod_produto
INNER JOIN clientesb AS clib
ON pedb.cod_cliente=clib.cod_cliente;

-- INNER JOIN - 3:
select p.cod_pedido, c.nome_cliente, c.sobrenome_cliente,
prod.descricao, prod.preco
FROM pedidosb AS p  
INNER JOIN clientesb AS c
ON p.cod_cliente=c.cod_cliente
INNER JOIN produtosb AS prod
ON p.cod_produto=prod.cod_produto;

-- LEFT OUTER JOIN: 
-- Uma junção externa é uma consulta que não requer que os registros de uma tabela possuam registros equivalentes em outra.
-- No exemplo abaixo temos, todos os dados das tabelas clientes e profissoes com os dados da tabela profissoes correspondendo aos dados da tabela clientes (tabela es
--O resultado desta consulta sempre contém todos os registros da tabela esquerda (ou seja, a primeira tabela mencionada na consulta), mesmo quando não exista registros correspondentes na tabela direita. 
-- Desta forma, esta consulta retorna todos os valores da tabela esquerda com os valores da tabela
direita correspondente, ou quando não há correspondência retorna um valor NULL.

SELECT * FROM clientes
LEFT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;


-- RIGHT OUTER JOIN:

-- No exemplo abaixo, trazemos novamente os dados das duas tabelas mas desta vez os dados da tabela da direita (profissoes) foi apresentada de acordo com a tabela à esquerda
SELECT * FROM clientes
RIGHT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;

-- FULL OUTER JOIN:
-- Esta consulta traz então os dados de ambas tabelas de acordo com suas correspondências e caso não tenha preenche o valor com NULL.
SELECT * FROM clientes
FULL OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;

-- UNIÃO DO LEFT E RIGHT:

SELECT * FROM clientes
LEFT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id
UNION
SELECT * FROM clientes
RIGHT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;

-- JUNÇÃO CRUZADA: Esta consulta é usada quando queremos juntar duas ou mais tabelas por cruzamento. Ou seja, para cada linha de uma tabela queremos todos os dados da outra tabela ou vice-versa.
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
FROM clientes AS c
CROSS JOIN profissoes AS p;

-- AUTO JUNÇÃO - SELF JOIN: No exemplo acima estamos realizando um Self Join onde os ids sejam diferentes mas a cidade seja iguaL:
SELECT a.nome AS Consumidor1, b.nome AS Consumidor2, a.cidade
FROM consumidor AS a
INNER JOIN consumidor AS b
ON a.id <> b.id
AND a.cidade = b.cidade;

-- EQUI-JOIN: 
-- Uma junção Equi-Join é um tipo específico de junção baseada em comparador, que usa apenas comparações de igualdade na junçã
-- Neste exemplo estamos realizando um Equi-Join utilizando como comparador os campos de relacionamento:
SELECT *
FROM clientes JOIN profissoes
ON clientes.id_profissao = profissoes.id;

-- NATURAL JOIN: Uma junção Natural-Join é um caso especial de Equi-Join. O resultado desta junção é o conjunto de todas as combinações que são iguais em seus nomes de atributos comuns
-- Neste exemplo a junção natural acontece com os campos comuns do relacionamento.

SELECT * FROM clientes NATURAL JOIN profissoes;

-- O único campo comum entre as duas tabelas é o campo 'id'. Desta forma, veja que o resultado está errado, já que João Pereira e Mário Pirez tem a mesma profissão... Esta junção só 'funciona' bem se os campos chaves (onde acontece os relacionamentos) tiverem o mesmo nome em ambas as tab

-- WHERE DE VÁRIAS TABELAS:
SELECT pedb.cod_pedido AS "NÚMERO DO PEDIDO", prodb.nome_produto AS "PRODUTO", prodb.preco, prodb.descricao, pedb.qtde AS "QUANTIDADE", clib.nome_cliente AS "NOME DO CLIENTE", clib.sobrenome_cliente AS "SOBRENOME" 
FROM pedidosb AS pedb, produtosb AS prodb, clientesb AS clib  
WHERE pedb.cod_pedido=prodb.cod_produto and
pedb.cod_cliente=clib.cod_cliente;
