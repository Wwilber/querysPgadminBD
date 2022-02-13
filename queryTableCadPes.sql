CREATE TABLE bairro(
	id_bai		SERIAL					PRIMARY KEY,
	nome_bai	CHARACTER VARYING(50)	NOT NULL
);

CREATE TABLE logradouro(
	id_logr		SERIAL					PRIMARY KEY,
	nome_logr	CHARACTER VARYING(50)	NOT NULL
);

CREATE TABLE cep(
	id_cep			SERIAL								PRIMARY KEY,
	cep				CHARACTER VARYING(9)				NOT NULL,
	id_bairro		INT REFERENCES bairro(id_bai)			NOT NULL,
	id_logradouro	INT REFERENCES logradouro(id_logr)		NOT NULL
);
CREATE TABLE pess_fisica(
	id_pf			SERIAL								PRIMARY KEY,
	cpf				VARCHAR(15)							NOT NULL,
	nome			VARCHAR(50)							NOT NULL,
	id_bairro		INT REFERENCES bairro(id_bai)			NOT NULL,
	id_logradouro	INT REFERENCES logradouro(id_logr)		NOT NULL,
	id_ce			INT REFERENCES cep(id_cep)				NOT NULL	
);