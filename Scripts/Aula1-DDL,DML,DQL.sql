/* Banco criado */
CREATE DATABASE BANCO_CIDADE;

/* Usando o banco*/
USE BANCO_CIDADE;

/* 1 */
/* Crie uma tabela (utilizando código) chamada cidade, essa tabela possuirá os atributos nome, cep (chave primária), numero de habitantes, 
capital (campo booleano que indica se é a capital do estado), estado (deve permitir só duas letras pois os estados serão representados por
siglas), renda per capta (decimal) e data de fundação */
CREATE TABLE cidade(
	id_cep VARCHAR(8) NOT NULL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	numero_habitantes INT(10) UNSIGNED NOT NULL,
    capital TINYINT(0) NOT NULL,
    estado CHAR(2) NOT NULL,
    renda_per_capita DECIMAL(6,2) UNSIGNED NOT NULL,
    data_fundacao DATE NOT NULL
);

/* 2 */
/* Insira (utilizando código) 5 cidades em sua base de dados */
INSERT INTO cidade (id_cep, nome, numero_habitantes, capital, estado, renda_per_capita, data_fundacao) VALUES (98981120,'Acre','790101',1,'AC',88.995,'1904-05-14');
INSERT INTO cidade (id_cep, nome, numero_habitantes, capital, estado, renda_per_capita, data_fundacao) VALUES (91321312,'Bahia','15130000',1,'BA',91.281,'1549-03-29');
INSERT INTO cidade (id_cep, nome, numero_habitantes, capital, estado, renda_per_capita, data_fundacao) VALUES (37832423,'Goias','65230000',1,'GO',274.576,'1729-06-25');
INSERT INTO cidade (id_cep, nome, numero_habitantes, capital, estado, renda_per_capita, data_fundacao) VALUES (41322132,'Mato Grosso','3224000',1,'MT',138.600,'1993-08-12');
INSERT INTO cidade (id_cep, nome, numero_habitantes, capital, estado, renda_per_capita, data_fundacao) VALUES (51232134,'Distrito Federal','2570000',1,'DF',406.960,'1960-04-21');

/* 3 */
/* Remova um das cidades pela chave primária */
DELETE FROM cidade
WHERE id_cep = 98981120;

/* 4 */
/*Modifique 2 cidades para aumentar a sua população em 10% (Essa conta você pode fazer na calculadora) */
UPDATE cidade
SET numero_habitantes = (numero_habitantes * 1.1)
WHERE id_cep = 98981120;

UPDATE cidade 
SET numero_habitantes = (numero_habitantes * 1.1)
WHERE id_cep = 91321312;

/* 5 */
/* Crie agora a tabela estado que possui os atributos sigla (chave primária) e nome*/
CREATE TABLE estados(
	id_sigla CHAR(2) NOT NULL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL
);

/* 6 */
/*Insira os estados correspondentes às cidades que você inseriu*/
INSERT INTO estados (id_sigla, nome) VALUES ('AC','Acre');
INSERT INTO estados (id_sigla, nome) VALUES ('BA','Bahia');
INSERT INTO estados (id_sigla, nome) VALUES ('GO','Goias');
INSERT INTO estados (id_sigla, nome) VALUES ('MT','Mato Grosso');
INSERT INTO estados (id_sigla, nome) VALUES ('DF','Distrito Federal');

/* 7 */
/* Altere a tabela cidade para que a coluna estado se torne uma chave estrangeira para o atributo sigla da tabela estado*/
ALTER TABLE cidade ADD CONSTRAINT estado FOREIGN KEY (estado)  REFERENCES estados (id_sigla);

/* 8 */
/*Altere a tabela estado, adicione o campo região (texto)*/
ALTER TABLE estados
ADD COLUMN regiao TEXT AFTER nome;

/*Consultas - Querys*/
DESC cidades;
SELECT * FROM cidade;
DESC estados;
SELECT * FROM estados;













/*Deletar - tabela*/
DROP TABLE cidade;
DROP TABLE estados;


