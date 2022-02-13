-- DCL - DATA CONTROL LANGUAGE: - Grant - Revoke:

-- COMANDO CREATE USER: criar usuário do banco de dados:

-- CRIAR USUÁRIO DO BANCO DE DADOS COM SENHA VIA COMANDO NO QUERY:
CREATE USER estagiario WITH PASSWORD '123456';	

-- COMANDO DROP - remove usuário do banco de dados:
DROP USER estagiario;


-- COMANDO GRANT: conceder privilégios ao usuário do banco de dados - estagiario:
-- conceder todas as permissões, inclusive na tabela sequences o arquivo da tabela pacientes:
GRANT ALL ON pacientes TO estagiario;
GRANT USAGE, SELECT ON SEQUENCE pacientes_id_seq TO estagiario

-- CONCEDER PERMISSÕES PARA UM USUARIO SÓ CONSULTAR OS DADOS NO BD - DQL(select): 
-- permissão para o usuário estagiario fazer select na tabela empresas.
GRANT SELECT ON empresas TO estagiario;


-- COMANDO REVOKE - remove permissões do usuário:

-- remover todas as permissões:
REVOKE ALL ON pacientes FROM estagiario;

-- remove a permissão de utilizar a tabela empresas_id_seq: 
REVOKE USAGE, SELECT ON SEQUENCE empresas_id_seq FROM estagiario;






