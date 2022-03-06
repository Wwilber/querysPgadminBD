-- aulas: 94 a 100:
------------------------------------------ PROJETO LOCADORA DE VÍDEO: -------------------------------------
-- Uma pequena locadora de vídeo possui ao redor de 2000 DVDS, cujo empréstimo deve ser controlado. Cada DVD possui 
-- um número de identificação e contém um único filme. Cada filme recebe um idetificador próprio, e sabe-se título e categoria
-- (comédia, drama, aventura,...).

-- Para cada filme cadastrado há pelo menos um DVD. Além disso, filmes mais longos necessitam de dois DVDs. Os clientes podem desejar
-- encontrar os filmes estrelados por seu ator predileto. Por isso, é necessário manter a informação dos atores que estrelam em cada 
-- filme, mas nem todo filme possui estrelas.

-- Muitos clientes, quando vêem a listagem de atores do filme escolhido, ficam interessados em saber, por um determinado ator, o seu 
-- nome real e de quais outros filmes do mesmo gênero aquele ator participou. A locadora possui muitos clientes cadastrados, dos quais
-- sabem nome, sobrenome, telefone e endereço de contato. Além disso, cada cliente recebe um número de associado.

-- Finalmente a empresa deve permitir a consulta a empréstimos de DVDs, com informações de qual cliente alugou o quê, datas de 
-- empréstimos e devolução, valor pago ou a pagar, atrasos, etc...
-- CRIAÇÃO DAS ENTIDADES:
-- FILMES: id, titulo, id_genero;
-- GENERO: id, genero;
-- DVDS: id, id_filme, quantidade;
-- ATORES: id, nome.
-- FILMES-ATORES: id, id_atores, id_filmes, personagem; 
-- CLIENTES: id, nome, sobrenome, telefone, endereço. 


-- AULA 95: PARTE 2 - CRIAÇÃO DO BANCO DE DADOS E TABELAS: DDL - Data Definition Language(Linguagem de Definição de Dados): - CREATE, - ALTER, DROP:

-- CRIAÇÃO DO BANCO DE DADOS:
CREATE DATABASE locadoravideo;

-- ALTERAÇÃO DO NOME DO BANCO DE DADOS:
ALTER DATABASE "locadoravideo" RENAME TO "locadoraVideo";

-- CRIAÇÃO DAS TABELAS DO BANCO DE DADOS locadoraVideo:
-- CRIADA A TABELA ATORES:
CREATE TABLE atores(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(45)
);
-- ALTERADA A TABELA ATORES E INCLUÍDO "NOT NULL" NA LINHA "nome":
ALTER TABLE atores ALTER COLUMN nome SET NOT NULL;

-- CRIADA A TABELA "filme":
CREATE TABLE filme(
	id SERIAL PRIMARY KEY,
	titulo VARCHAR(45) NOT NULL,
	id_genero INT REFERENCES genero(id) NOT NULL
);
-- ALTERADA NA "filme" o nome da tabela para "filmes":
ALTER TABLE filme RENAME TO filmes;

-- adicionar uma coluna a tabela "filmes":
ALTER TABLE filmes ADD COLUMN valor DECIMAL(8,2) NOT NULL;

-- CRIADA A TABELA "genero":
CREATE TABLE genero(
	id SERIAL PRIMARY KEY,
	genero VARCHAR(45)
);
-- ALTERADA A TABELA "genero" E INCLUÍDO "NOT NULL" NA LINHA "genero":
ALTER TABLE genero ALTER COLUMN genero SET NOT NULL;

-- CRIADA A TABELA "dvds":
CREATE TABLE dvds(
	id SERIAL PRIMARY KEY,
	id_filmes INT REFERENCES filmes(id) NOT NULL,
	quantidade INT NOT NULL
);

-- CRIADA A TABELA "emprestimo":
CREATE TABLE emprestimos(
	id SERIAL PRIMARY KEY,
	date DATE NOT NULL, -- foi alterada date para timestamp por dentro.
	id_cliente INT REFERENCES clientes(id) NOT NULL
);

-- CRIADA A TABELA "clientes":
CREATE TABLE clientes(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	sobrenome VARCHAR(45) NOT NULL,
	telefone VARCHAR(15) NOT NULL,
	endereco VARCHAR(45) NOT NULL	
);

-- CRIADA A TABELA "atores-filmes":
CREATE TABLE atores_filmes(
	id SERIAL PRIMARY KEY,
	id_atores INT REFERENCES atores(id) NOT NULL,
	id_filmes INT REFERENCES filmes(id) NOT NULL,
	personagem VARCHAR(45) NOT NULL
);

-- CRIADA A TABELA "filme_emprestimo":
CREATE TABLE filme_emprestimo(
	id SERIAL PRIMARY KEY,
	id_emprestimo INT REFERENCES emprestimos(id) NOT NULL,
	id_dvd INT REFERENCES dvds(id) NOT NULL 
);

-- CRIADA A TABELA "devolucao":
CREATE TABLE devolucao(
	id SERIAL PRIMARY KEY,
	id_emprestimo INT REFERENCES emprestimos(id) NOT NULL,
	data TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

-- CRIADA A TABELA "filme_devolucao":
CREATE TABLE filme_devolucao(
	id SERIAL PRIMARY KEY,
	id_devolucao INT REFERENCES devolucao(id) NOT NULL,
	id_filme_emprestimo INT REFERENCES filme_emprestimo(id) NOT NULL
);

-- AULA 96: PARTE 3 - INSERINDO DADOS DE TESTE: DML - Data Manipulation Language(Linguagem de Manipulação de Dados): - INSERT, - UPDATE, - DELETE: 
-- ATORES:
INSERT INTO atores (nome) VALUES ('Brad Pitt');
INSERT INTO atores (nome) VALUES ('Angeline Jolie');
INSERT INTO atores (nome) VALUES ('Felicity Jones');

--GENERO:
INSERT INTO genero (genero) VALUES ('comédia');
INSERT INTO genero (genero) VALUES ('drama');
INSERT INTO genero (genero) VALUES ('ação');
INSERT INTO genero (genero) VALUES ('aventura');
INSERT INTO genero (genero) VALUES ('suspense');
INSERT INTO genero (genero) VALUES ('terror');
INSERT INTO genero (genero) VALUES ('ficção científica');
INSERT INTO genero (genero) VALUES ('documentário');

-- CLIENTES:
INSERT INTO clientes (nome, sobrenome, telefone, endereco)
VALUES ('Wilber', 'Ribeiro', '85985994714', 'Rua 7 - 221');
INSERT INTO clientes (nome, sobrenome, telefone, endereco)
VALUES ('Aline', 'Tomaz', '85986250316', 'Rua 5 - 114');
INSERT INTO clientes (nome, sobrenome, telefone, endereco)
VALUES ('Ana', 'Célia', '8532325874', 'Rua João Áreas - 274');
INSERT INTO clientes (nome, sobrenome, telefone, endereco)
VALUES ('Silvia', 'Helena', '8589874135', 'Av. Domingos Olimpio - 2067');

-- FILMES:
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Tomb Raider', 3, 8.99);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Star Wars', 7, 6.66);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Tróia', 4, 5.03);


-- ATORES_FILMES:
INSERT INTO atores_filmes (id_atores, id_filmes, personagem) VALUES (01, 01, 'JOÃO');
INSERT INTO atores_filmes (id_atores, id_filmes, personagem) VALUES (02, 03, 'MARIA');
INSERT INTO atores_filmes (id_atores, id_filmes, personagem) VALUES (03, 02, 'PAULO');

-- DVDS:
INSERT INTO dvds (id_filmes, quantidade) VALUES (01, 04);
INSERT INTO dvds (id_filmes, quantidade) VALUES (02, 02);
INSERT INTO dvds (id_filmes, quantidade) VALUES (03, 01);

-- EMPRÉSTIMOS:
INSERT INTO emprestimos (date, id_cliente) VALUES ('05-03-2022', 01);
INSERT INTO emprestimos (date, id_cliente) VALUES ('02-01-2021', 02);
INSERT INTO emprestimos (date, id_cliente) VALUES ('04-03-2022', 03);

-- FILME_EMPRESTIMO:
INSERT INTO filme_emprestimo (id_emprestimo, id_dvd) VALUES (01,01);
INSERT INTO filme_emprestimo (id_emprestimo, id_dvd) VALUES (03,03);
INSERT INTO filme_emprestimo (id_emprestimo, id_dvd) VALUES (02,02);

-- DEVOLUÇÃO:
INSERT INTO devolucao (id_emprestimo, data) VALUES (01, '05-03-2022');
INSERT INTO devolucao (id_emprestimo, data) VALUES (02, '05-03-2022');
INSERT INTO devolucao (id_emprestimo, data) VALUES (03, '05-03-2022');

-- FILME_DEVOLUÇÃO:
INSERT INTO filme_devolucao (id_devolucao, id_filme_emprestimo)
VALUES (01, 01);
INSERT INTO filme_devolucao (id_devolucao, id_filme_emprestimo)
VALUES (02, 02);
INSERT INTO filme_devolucao (id_devolucao, id_filme_emprestimo)
VALUES (03, 03);

-- AULA 97: PARTE 4 - CONSULTA SIMPLES: DQL - DATA QUERY LANGUAGE(Linguagem de Consulta de Dados): - SELECT:

-- comando psql para ver a estrutura de uma tabela: 
\d nome_da_tabela = EXEMPLO: \d atores; 

-- consulta usando sql:
SELECT * FROM information_schema.columns WHERE table_name ='atores';
SELECT * FROM information_schema.columns;

SELECT * FROM atores;
SELECT * FROM atores_filmes;
SELECT * FROM clientes;
SELECT * FROM devolucao;
SELECT * FROM dvds;
SELECT * FROM emprestimos;
SELECT * FROM filme_devolucao;
SELECT * FROM filme_emprestimo;
SELECT * FROM filmes;
SELECT * FROM genero;

-- SELECT TABELA: filmes COM gênero:
SELECT f.titulo AS "TÍTULO DO FILMES", g.genero AS "GÊNERO DO FILMES", f.valor AS "VALOR DA LOCAÇÃO" 
	FROM filmes AS f, genero AS g
	WHERE f.id_genero=g.id;
	
-- SELECT TABELA atores_filmes COM tabelas atores E filmes:
SELECT a.nome AS "NOME DO ATOR", f.titulo AS "TÍTULO DO FILME", g.genero AS "GENERO DO FILME", 
f.valor AS "VALOR DA lOCAÇÃO", af.personagem AS "PERSONAGEM NO FILME"
	FROM atores AS a, filmes AS f, genero AS g, atores_filmes AS af
	WHERE af.id_atores = a.id 
	AND af.id_filmes = f.id 
	AND f.id_genero =  g.id;  
	
-- UTILIZANDO FILTROS:
SELECT * FROM genero WHERE id = 1;
SELECT genero FROM genero WHERE id = 2;
SELECT titulo,valor FROM filmes WHERE id = 3;
SELECT (titulo,valor) FROM filmes;
SELECT (titulo,valor) FROM filmes WHERE id = 1 AND valor<=9.22;


-- FUNÇÃO AGREGADA:
SELECT * FROM filmes;
SELECT SUM(valor) FROM filmes;
SELECT AVG(valor) FROM filmes;
SELECT MAX(valor) FROM filmes;
SELECT MIN(valor) FROM filmes;

-- AULA 97: PARTE 5 - CONSULTAS COMPLEXAS: DQL - DATA QUERY LANGUAGE(Linguagem de Consulta de Dados): - SELECT:
-- SELECT TABELA atores_filmes COM tabelas atores E filmes:

SELECT a.nome AS "NOME DO ATOR", f.titulo AS "TÍTULO DO FILME", g.genero AS "GENERO DO FILME", 
f.valor AS "VALOR DA lOCAÇÃO", af.personagem AS "PERSONAGEM NO FILME"
	FROM atores AS a, filmes AS f, genero AS g, atores_filmes AS af
	WHERE af.id_atores = a.id 
	AND af.id_filmes = f.id 
	AND f.id_genero =  g.id
	AND af.personagem='MARIA';  

-- AULA 99: PARTE 6 - ATUALIZANDO DADOS: DML - Data Manipulation Language(Linguagem de Manipulação de Dados): - INSERT, - UPDATE, - DELETE: 

-- ALTERANDO TABELA DE ATORES:
SELECT * FROM atores;
UPDATE atores SET nome='Wilber Ribeiro' WHERE id=1;

SELECT * FROM emprestimos;
UPDATE emprestimos SET date='03-05-2022 08:01:05' WHERE id=2;

-- AULA 100: PARTE 7 - ATUALIZANDO DADOS: DML - Data Manipulation Language(Linguagem de Manipulação de Dados): - INSERT, - UPDATE, - DELETE: 
SELECT * FROM atores;
SELECT * FROM atores_filmes;
UPDATE atores_filmes SET id_atores=2 WHERE id=1;
DELETE FROM atores WHERE id=1;

