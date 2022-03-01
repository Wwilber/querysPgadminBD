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



