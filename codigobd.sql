--Criação da tabela de projetos
CREATE TABLE projetos(
	idprojeto serial NOT NULL,
	nome varchar(50) NOT NULL,
	dtinicio date NOT NULL,
	dtfim date NOT NULL,
	PRIMARY KEY (idprojeto)
);

--Criação da tabela de atividades dos projetos
CREATE TABLE atividades(
	idatividade serial NOT NULL,
	idprojeto int NOT NULL,
	nome varchar(50) NOT NULL,
	dtinicio date NOT NULL,
	dtfim date NOT NULL,
	finalizada boolean,
	PRIMARY KEY (idatividade),
	FOREIGN KEY (idprojeto) REFERENCES projetos(idprojeto)
);

--Insersão de dados sobre os projetos
INSERT INTO projetos (nome, dtInicio, dtFim) VALUES
('Projeto 1', '01/01/2019', '31/01/2019'),
('Projeto 2', '01/02/2019', '28/02/2019'),
('Projeto 3', '03/01/2020', '25/03/2020'),
('Projeto 4', '07/02/2021', '17/04/2021')

--Insersão de dados sobre as atividades dos projetos
INSERT INTO atividades (idProjeto, nome, dtInicio, dtFim, finalizada) VALUES
(1, 'Atividade 1', '06/01/2019', '15/01/2019', TRUE),
(1, 'Atividade 2', '16/01/2019', '31/01/2019', FALSE),
(2, 'Atividade 1', '01/02/2019', '10/02/2019', FALSE),
(2, 'Atividade 2', '11/02/2019', '20/02/2019', FALSE),
(2, 'Atividade 3', '21/02/2019', '02/03/2019', FALSE),
(3, 'Atividade 1', '03/01/2020', '20/01/2020', TRUE),
(3, 'Atividade 2', '02/02/2020', '15/02/2020', TRUE),
(3, 'Atividade 3', '21/02/2020', '25/03/2020', FALSE),
(4, 'Atividade 1', '07/02/2021', '12/03/2021', TRUE),
(4, 'Atividade 2', '15/03/2021', '14/04/2021', TRUE)


--CONSULTAS..........................................

--Vizualizar todos projetos cadastrados
SELECT * FROM projetos;

--Vizualizar todas as atividades cadastradas
SELECT * FROM atividades;

--Vizualizar porcentagem de conclusão de determinado projeto (Exemplo projeto 1)
SELECT finalizada, CAST(100*COUNT(*)/SUM(COUNT(*)) OVER () AS decimal(10,2))
FROM atividades
WHERE idprojeto = 1
GROUP BY finalizada
ORDER BY finalizada;



















