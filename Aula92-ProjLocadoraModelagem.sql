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


-- DDL - Data Definition Language(Linguagem de Definição de Dados): - CREATE, - ALTER, DROP:

-- CRIAÇÃO DO BANCO DE DADOS:
CREATE DATABASE locadoravideo;

-- ALTERAÇÃO DO NOME DO BANCO DE DADOS:
ALTER DATABASE "locadoravideo" RENAME TO "locadoraVideo";

-- CRIAÇÃO DAS TABELAS DO BANCO DE DADOS locadoraVideo:

CREATE TABLE genero(
	id SERIAL PRIMARY KEY,
	genero VARCHAR(45)
);

ALTER TABLE genero ALTER COLUMN genero SET NOT NULL;

CREATE TABLE atores(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(45)
);

ALTER TABLE atores ALTER COLUMN nome SET NOT NULL;


-- DQL - DATA QUERY LANGUAGE(Linguagem de Consulta de Dados): - SELECT:

-- comando psql para ver a estrutura de uma tabela: 
\d nome_da_tabela = EXEMPLO: \d atores; 

-- consulta usando sql:
SELECT * FROM information_schema.columns WHERE table_name ='atores';
SELECT * FROM information_schema.columns;


CREATE TABLE filme(
	id SERIAL PRIMARY KEY,
	titulo VARCHAR(45) NOT NULL,
	id_genero INT REFERENCES genero(id) NOT NULL
);

ALTER TABLE filme RENAME TO filmes;

CREATE TABLE atores_filmes(
	id SERIAL PRIMARY KEY,
	id_atores INT REFERENCES atores(id) NOT NULL,
	id_filmes INT REFERENCES filmes(id) NOT NULL,
	valor DECIMAL(8,2) NOT NULL
);
CREATE TABLE dvds(
	id SERIAL PRIMARY KEY,
	id_filmes INT REFERENCES filmes(id) NOT NULL,
	quantidade INT NOT NULL
);

CREATE TABLE clientes(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	sobrenome VARCHAR(45) NOT NULL,
	telefone VARCHAR(15) NOT NULL,
	endereco VARCHAR(45) NOT NULL	
);

CREATE TABLE emprestimos(
	id SERIAL PRIMARY KEY,
	date DATE NOT NULL,
	id_cliente INT REFERENCES clientes(id) NOT NULL
);

CREATE TABLE filme_emprestimo(
	id SERIAL PRIMARY KEY,
	id_emprestimo INT REFERENCES emprestimo(id) NOT NULL,
	id_dvd INT REFERENCES 
)




-- DML - Data Manipulation Language(Linguagem de Manipulação de Dados): - INSERT, - UPDATE, - DELETE: 
