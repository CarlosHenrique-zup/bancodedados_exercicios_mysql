drop table cidade;
drop table estado;

create table estado (
sigla varchar(2) primary key,
nome varchar(50) not null,
regiao varchar(50) not null);

create table cidade (
cep int primary key,
nome varchar(50) not null,
nro_habitantes int not null default 0,
capital boolean not null,
estado varchar(2) not null,
renda_per_capita decimal(10, 2),
data_fundacao date,
constraint estado_fk
foreign key (estado)
references estado (sigla)
);

insert into estado
values
("mg", "Minas Gerais", "Sudeste"),
("sp", "São Paulo", "Sudeste"),
("go", "Goiás", "Centro-Oeste"),
("pb", "Paraíba", "Nordeste");

insert into cidade 
values
(38408204, "Uberlândia", 400000, 0, "mg", 15000, '1232-01-01'),
(11000000, "São Paulo", 10000000, 1, "sp", 40000, '1670-03-12'),
(11980000, "Campinas", 1000000, 0, "sp", 38000, '1575-03-01'),
(44400000, "João Pessoa", 2000000, 1, "pb", 20000, '1888-02-03'),
(11000023, "São José do Rio Preto", 470000, 0, "sp", 50000, '1993-10-22'),
(34000000, "Belo Horizonte", 5000000, 1, "mg", 35000, '1776-06-23'),
(25000000, "Itumbiara", 200000, 0, "go", 23000, '1653-05-24'),
(38180000, "Araxá", 100000, 0, "mg", 70000, '1444-11-19'),
(21000000, "Goiânia", 4000000, 0, "go", 10000, '1721-07-04');

/*Selecione o nome e a renda per capita das cidades com mais de 5000 habitantes*/
SELECT c.nome AS Nome, c.renda_per_capita AS RendaPerCapita
FROM cidade c
WHERE c.nro_habitantes > 5000;

/*Selecione todos os dados das cidades que foram fundadas depois de 12 março de 1432.*/
SELECT c.*
FROM cidade c
WHERE c.data_fundacao > '1432-03-12';

/*Selecione a cidade cujo cep é 38180000.*/
SELECT c.nome AS Nome
FROM cidade c
WHERE c.cep = 38180000;

/*Selecione o nome das cidades do estado de São Paulo.*/
SELECT c.nome AS Nome
FROM cidade c
WHERE c.estado = 'sp';

/*Selecione todos os dados das cidades que ficam no estado de São Paulo e que possuam mais
do que 100 mil habitantes.*/
SELECT  c.*
FROM cidade c
WHERE c.estado = 'sp' AND nro_habitantes > 100000;

/*Selecione o nome das cidades que são capitais e tem mais do que 30000 de renda per capita.*/
SELECT c.nome AS Nome
FROM cidade c
WHERE c.capital = 1 AND c.renda_per_capita > 30000;

/*Selecione o nome da cidade e o nome do estado cuja sigla é sp.*/
SELECT c.nome as NomeCidade, e.nome as NomeEstado
FROM estado e, cidade c
WHERE c.estado = e.sigla AND e.sigla = 'sp';

/*Selecione a região, o nome do estado, o nome da cidade e a quantidade de habitantes das
cidades com renda per capita maior do que 20000 e que não são capitais.*/
SELECT e.regiao AS RegiaoCidade, e.nome AS NomeEstado,c.nome AS NomeCidade, c.nro_habitantes AS NumeroHabitantesCidade
FROM cidade c, estado e
WHERE e.sigla = c.estado
AND c.renda_per_capita > 20000 AND c.capital <> 1;

/*Selecione todos os dados das cidades que pertencem a região sudeste.*/
SELECT e.*
FROM estado e
WHERE e.regiao = 'Sudeste';

/*Selecione o nome e a quantidade de habitantes das cidades da região sudeste que não sejam
capitais, que não sejam do estado cuja sigla é mg e que tenham a renda per capita maior do
que 15000.*/
SELECT c.nome AS NomeCidade , c.nro_habitantes AS NumeroHabitantes
FROM cidade c, estado e
WHERE e.sigla = c.estado 
AND e.regiao = 'Sudeste' 
AND c.capital <> 1 
AND e.sigla = 'mg' 
AND c.renda_per_capita > 15000;

SELECT * FROM cidade;
SELECT * FROM estado;