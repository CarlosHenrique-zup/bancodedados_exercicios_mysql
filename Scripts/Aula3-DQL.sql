USE BANCO_CIDADE;

INSERT INTO cidade VALUES (38098204, "São Carlos", 30000, 0, "sp", 1200, '1950-07-13');
INSERT INTO cidade VALUES (12123223, "Araraquara", 8000, 0, "sp", 900, '1600-08-27');
INSERT INTO cidade VALUES (32423111, "Jundiaí", 20000, 0, "sp", 1540, '1998-11-12');
INSERT INTO cidade VALUES (43232421, "Bauru", 54300, 0, "sp", 2000, '1950-10-01');
INSERT INTO cidade VALUES (34545656, 'Osasco', 1200, 0, "sp", 3200, '1977-08-10');

insert into cidade (
nome,
cep,
numero_habitantes,
capital,
uf,
renda_percapita,
data_fundacao)
values
('Alfenas','35620101',73774, FALSE, 'MG', 2717, '1881-10-15'),
('Barro Alto','56986320',79058, FALSE, 'GO', 1900, '1959-11-14'),
('Sumaré','13150000',241311, FALSE, 'SP', 2105, '1868-07-26'),
('Paulinia','13140000',82146, false, 'SP', 5123, '1944-11-30'),
('Limeira','13487031',276022, false, 'SP', 6800, '1826-09-15');

/* Selecione o nome, o estado e o número de habitantes das cidades que pertencem aos estados
de São Paulo, Minas Gerais e Goiás */
SELECT c.nome AS "Nome", c.estado AS "Estado", c.nro_habitantes AS "Numero de Habitantes"
FROM cidade c,estado e
WHERE c.estado = e.sigla
AND e.nome IN('São Paulo', 'Minas Gerais', 'Goias');

/*Selecione os dados das cidades que não ficam em São Paulo, Minas Gerais e Paraíba */
SELECT c.*
FROM cidade c
WHERE c.estado NOT IN('sp', 'mg','pb');

/*Selecione os dados das cidades cujos nomes dos estados à que elas pertencem começam
com a letra M*/
SELECT c.* 
FROM cidade c, estado e
WHERE e.sigla = c.estado
AND e.nome LIKE "M%";

/*TESTE*/
SELECT c.*
FROM cidade c, estado e
WHERE e.sigla = c.estado
AND c.nome LIKE "B%";

/*Conte quantas cidades ficam na região Centro-Oeste e tem mais do que 400 mil habitantes.*/
SELECT COUNT(*)
FROM estado e, cidade c
WHERE e.sigla = c.estado 
AND e.regiao IN ("Centro-Oeste")
AND c.nro_habitantes > 400000; 

/*Obtenha o total da população da região Sudeste.*/
SELECT SUM(c.nro_habitantes) AS "Numero de Habitantes"
FROM estado e, cidade c
WHERE e.sigla = c.estado 
AND e.regiao = "Sudeste"; 

/*Obtenha a renda per capita média da região Nordeste.*/
SELECT ROUND(AVG(c.renda_per_capita),2) AS "Renda per Capita"
FROM estado e, cidade c
WHERE e.sigla = c.estado
AND e.regiao = "Nordeste";

/*Obtenha a maior população entre as cidades da região Centro-Oeste.*/
SELECT MAX(c.nro_habitantes) AS "Número de Habitantes"
FROM estado e, cidade c
WHERE e.sigla = c.estado
AND e.regiao = "Centro-Oeste";

/*Obtenha a média da renda per capita das capitais.*/
SELECT ROUND(AVG(c.renda_per_capita),2) AS "Renda per Capita"
FROM cidade c
WHERE c.capital = 1;

/*Obtenha a data de fundação da cidade mais antiga entre as cidades da região Sudeste que
não sejam capitais e que tenham a população maior do que 100 mil habitantes.*/
SELECT MIN(c.data_fundacao) AS "Fundação Mais Antiga"
FROM cidade c, estado e
WHERE e.sigla = c.estado
AND e.regiao = "Sudeste" 
AND c.capital <> 1 
AND nro_habitantes > 100000;

/*Obtenha a média da renda per capita das cidades que não se encontram na região Sudeste e
Nordeste que tenham sido fundadas depois de 01 de Abril de 1500 e que tenham o nome
começado pela letra S.*/
SELECT ROUND(AVG(c.renda_per_capita),2) as "Renda per Capita"
FROM cidade c,estado e
WHERE e.sigla = c.estado
AND e.regiao NOT IN ("Centro-Oeste", "Nordeste") 
AND c.data_fundacao > "1500-04-01" 
AND c.nome LIKE "S%";

SELECT * FROM cidade;