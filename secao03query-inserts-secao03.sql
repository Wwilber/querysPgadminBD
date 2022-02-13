-- INSERTS:
-- tipos de produtos:
INSERT INTO tipos_produto(descricao) VALUES ('computadores');
INSERT INTO tipos_produto(descricao) VALUES ('monitores');
INSERT INTO tipos_produto(descricao) VALUES ('impressoras');

-- produtos:
INSERT INTO produtos(descricao, preco, id_tipo_produto) VALUES ('hp 3020', 1200.00, 3);
INSERT INTO produtos(descricao, preco, id_tipo_produto) VALUES ('notebook mac', 14000.00, 1);
INSERT INTO produtos(descricao, preco, id_tipo_produto) VALUES ('samsung 15"', 2800.00, 2);
INSERT INTO produtos(descricao, preco, id_tipo_produto) VALUES ('Apple Whach"', 5000.00, 1);

-- pacientes:
INSERT INTO pacientes(nome, endereco, bairro, cidade, estado, cep, data_nasc)
VALUES ('wilber ribeiro', 'rua 7, 221, altos', 'novo maracanau','maracanau','ce','61905500', '1972-11-11');

INSERT INTO pacientes(id, nome, endereco, bairro, cidade, estado, cep, data_nasc)
VALUES (3, 'aline tomaz', 'rua 7, 221, altos', 'novo maracanau','maracanau','ce','61905500', '1980-01-13');

INSERT INTO pacientes(nome, endereco, bairro, cidade, estado, cep, data_nasc)
VALUES ('arthur tomaz', 'rua 7, 221, altos', 'novo maracanau','maracanau','ce','61905500', '1990-02-02');

-- SELECTS:

SELECT * from tipos_produto;

SELECT * from tipos_produto WHERE descricao='monitores';

SELECT * from pacientes;