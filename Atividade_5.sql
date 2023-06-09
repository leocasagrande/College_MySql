create database locadora2;
use locadora2;

CREATE TABLE CLIENTE (
	numCliente INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	endereco VARCHAR(50) NOT NULL,
	foneres VARCHAR(50) NOT NULL,
	fonecel VARCHAR(50) NOT NULL,
	CONSTRAINT PK_CLIENTE	PRIMARY KEY (numCliente)
);

CREATE TABLE ATOR (
	cod INTEGER NOT NULL,
	datanasc DATE NOT NULL,
	nacionalidade VARCHAR(50) NOT NULL,
	nomereal VARCHAR(50) NOT NULL,
	nomeartistico VARCHAR(50) NOT NULL,
	CONSTRAINT PK_ATOR PRIMARY KEY (cod)
);

CREATE TABLE CLASSIFICACAO (
	cod INTEGER NOT NULL,
	nome VARCHAR(30) NOT NULL,
	preco FLOAT NOT NULL,
	CONSTRAINT PK_CLASSIFICACAO PRIMARY KEY (cod)
);

CREATE TABLE FILME (
	numFilme INTEGER NOT NULL,
	titulo_original VARCHAR(50) NOT NULL,
	titulo_pt VARCHAR(50) NOT NULL,
	duracao INTEGER NOT NULL,
	data_lancamento DATE NOT NULL,
	direcao VARCHAR(250) NOT NULL,
	categoria VARCHAR(50) NOT NULL,
	classificacao INTEGER NOT NULL,
	CONSTRAINT PK_FILME PRIMARY KEY (numFilme),
	CONSTRAINT FK_MIDIA FOREIGN KEY (classificacao) REFERENCES CLASSIFICACAO (cod)
);

CREATE TABLE MIDIA (
	numFilme INTEGER NOT NULL,
	numero INTEGER NOT NULL,
	tipo VARCHAR(50) NOT NULL,
	CONSTRAINT PK_MIDIA PRIMARY KEY (numFilme, numero),
	CONSTRAINT FKK_MIDIA FOREIGN KEY (numFilme) REFERENCES FILME (numFilme)
);
	
CREATE TABLE ESTRELA (
	numFilme INTEGER NOT NULL,
	codator INTEGER NOT NULL,
	CONSTRAINT PK_ESTRELA PRIMARY KEY (numfilme, codator),
	CONSTRAINT FK_ESTRELA FOREIGN KEY (numFilme) REFERENCES FILME(numFilme),
	CONSTRAINT FK_CodAtor FOREIGN KEY (codator) REFERENCES ATOR(cod)
);

CREATE TABLE EMPRESTIMO (
	numFilme INTEGER NOT NULL,
	numero INTEGER NOT NULL,
	tipo VARCHAR(50) NOT NULL,
	cliente INTEGER NOT NULL,
	dataret DATE NOT NULL,
	datedev DATE NOT NULL,
	valor_pg FLOAT NOT NULL,
	CONSTRAINT PK_EMPRESTIMO PRIMARY KEY (numfilme, numero, tipo, cliente),
	CONSTRAINT FK_EMPRESTIMO FOREIGN KEY (numFilme, numero) REFERENCES MIDIA (numFilme, numero),
	CONSTRAINT FK_CLIENTE FOREIGN KEY (cliente) REFERENCES CLIENTE (numCliente)
);

INSERT INTO CLIENTE VALUES (1, 'João José da Silva', 'Rua das Dores, 1687, Ipiranga', '(91) 3524-4651', '(91) 9254-4651');
INSERT INTO CLIENTE VALUES (2, 'Maria Joaquina Magalhães', 'Av. Litorânia, 5484, Praia do Morro', '(28) 3842-9741', '(28) 9954-9741');
INSERT INTO CLIENTE VALUES (3, 'Abelita Valéria Fernandes', 'Av. Marechal Deodoro da Fonseca, 842, Santa Maria', '(21) 2164-8974', '(21) 9988-8974');
INSERT INTO CLIENTE VALUE (4, 'Belarmino Jhones', 'Rua Joaquim Aníbal, 21, Centro', '(31) 3249-1245', '(31) 8821-1245');
INSERT INTO CLIENTE VALUES (5, 'Bosco Calcido das Cruzes', 'Rua da Curva, 10, Pelorinho', '(71) 3984-5566', '(71) 9287-5566');
INSERT INTO CLIENTE VALUES (6, 'Delfim Vieira Neto', 'Av. Dr. Roberto Luzitano, 5543, Ala Oeste', '(55) 3218-7138', '(55) 8671-7138');
INSERT INTO CLIENTE VALUES (7, 'Gabriela Bochelli Soviersovisk', 'Av. Atlântica, 1111, Orla', '(98) 3285-4712', '(98) 8137-4712');

INSERT INTO CLASSIFICACAO VALUES (1,'Super-lançamento',15.00);
INSERT INTO CLASSIFICACAO VALUE (2,'Lançamento',10.00);
INSERT INTO CLASSIFICACAO VALUES (3,'Acervo',5.00);

INSERT INTO FILME VALUES (1, 'The Godfather', 'O Poderoso Chefão', 175, '1972-03-24', 'Francis Ford Coppola', 'Crime/Drama', 3);
INSERT INTO FILME VALUES (2, 'Over Flew Over The Cuckoos Nest', 'Um Estranho no Ninho', 133, '1975-11-21', 'Millos Forman', 'Drama', 3);
INSERT INTO FILME VALUES (3, 'The Avengers', 'Os Vingadores', 143, '2012-04-26', 'Joss Whedon', 'Ação', 2);
INSERT INTO FILME VALUES (4, 'A Clockwork Orange', 'Laranja Mecânica', 136, '1972-01-13', 'Stanley Kubrick', 'Crime/Drama/Ficção Científica', 3);
INSERT INTO FILME VALUES (5, 'Inception', 'A Origem', 148, '2010-07-16', 'Christopher Nolan', 'Ação/Aventura/Mistério', 2);
INSERT INTO FILME VALUES (6, 'Pulp Fiction', 'Pulp Fiction: Tempo de Violência', 154, '1994-10-21', 'Quentin Tarantino', 'Crime/Drama/Thriller', 3);
INSERT INTO FILME VALUES (7, 'The Hangover Part III', 'Se Beber, Não Case! Parte: 3', 100, '2013-05-24', 'Tood Phillips', 'Comédia', 1);
INSERT INTO FILME VALUES (8, 'The Silence of the Lambs', 'O Silêncio dos Inocentes', 118, '1991-05-31', 'Jonathan Demme', 'Crime/Drama/Thriller', 1);
INSERT INTO FILME VALUES (9, 'Memento', 'Amnésia', 113, '2000-10-20', 'Christopher Nolan', 'Mistério/Thriller', 3);
INSERT INTO FILME VALUES (10, 'Les Misérables', 'Os Miseráveis', 158, '2013-01-11', 'Tom Hooper', 'Drama/Musical/Romance', 1);
INSERT INTO FILME VALUES (11, 'The Pianist', 'O Pianista', 150, '2003-01-04', 'Roman Polanski', 'Biografia/Drama/História', 3);
INSERT INTO FILME VALUES (12, 'Citizen Kane', 'Cidadão Kane', 119, '1942-01-24', 'Orson Welles', 'Drama/Mistério', 3); 
INSERT INTO FILME VALUES (13, 'The Shining', 'O Iluminado', 146, '1980-12-25', 'Stanley Kubrick', 'Terror/Mistério', 3);
INSERT INTO FILME VALUES (14, 'World War Z', 'Guerra Mundial Z', 116, '2013-06-21', 'Marc Forster', 'Ação/Drama/Terror', 1);
INSERT INTO FILME VALUES (15, 'Django Unchained', 'Django Livre', 165, '2013-01-18', 'Quentin Tarantino', 'Aventura/Velho-Oeste', 1);


INSERT INTO MIDIA VALUES (7,1,'Blu-ray');
INSERT INTO MIDIA VALUES (7,2,'DVD');
INSERT INTO MIDIA VALUES (10,1,'Blu-ray');
INSERT INTO MIDIA VALUES (14,1,'Blu-ray');
INSERT INTO MIDIA VALUES (44,2,'DVD');
INSERT INTO MIDIA VALUES (14,3,'VHS');
INSERT INTO MIDIA VALUES (55,1,'Blu-ray');


INSERT INTO MIDIA VALUES (3,1,'Blu-ray');
INSERT INTO MIDIA VALUES (3,2,'DVD');
INSERT INTO MIDIA VALUES (3,3,'VHS');
INSERT INTO MIDIA VALUES (5,1,'Blu-ray');
INSERT INTO MIDIA VALUES (5,2,'DVD');


INSERT INTO MIDIA VALUES (1,1,'DVD');
INSERT INTO MIDIA VALUES (1,2,'DVD');
INSERT INTO MIDIA VALUE (1,3,'VHS');
INSERT INTO MIDIA VALUES (2,1,'VHS');
INSERT INTO MIDIA VALUES (2,2,'VHS');
INSERT INTO MIDIA VALUES (4,1,'VHS');
INSERT INTO MIDIA VALUES (6,1,'DVD');
INSERT INTO MIDIA VALUES (8,1,'VHS');
INSERT INTO MIDIA VALUES (9,1,'DVD');
INSERT INTO MIDIA VALUES (11,1,'DVD');
INSERT INTO MIDIA VALUES (12,1,'VHS');
INSERT INTO MIDIA VALUE (13,1,'DVD');

INSERT INTO EMPRESTIMO VALUES (1,3,'VHS',1,'1978-08-15', '2013-06-27', 63675.00);
INSERT INTO EMPRESTIMO VALUES (2,1,'VHS',2,'2013-01-12', '2013-01-14', 5.00);
INSERT INTO EMPRESTIMO VALUES (3,1,'Blu-ray',3,'2012-04-29', '2012-04-30', 10.00);
INSERT INTO EMPRESTIMO VALUES (4,1,'VHS',4,'2013-01-01', '2013-01-03', 5.00);
INSERT INTO EMPRESTIMO VALUES (5,1,'Blu-ray',5,'2012-09-30', '2012-10-01', 10.00);
INSERT INTO EMPRESTIMO VALUES (6,1,'DVD',6,'2013-05-04', '2013-05-06', 5.00);
INSERT INTO EMPRESTIMO VALUES (7,1,'Blu-ray',7,'2013-05-27', '2013-05-28', 15.00);
INSERT INTO EMPRESTIMO VALUES (8,1,'VHS',1,'2013-03-16', '2013-03-17', 15.00);
INSERT INTO EMPRESTIMO VALUES (9,1,'DVD',2,'2013-03-24', '2013-03-25', 5.00);
INSERT INTO EMPRESTIMO VALUES (10,1,'Blu-ray',3,'2013-06-22', '2013-06-23', 15.00);
INSERT INTO EMPRESTIMO VALUES (11,1,'DVD',4,'2013-01-12', '2013-01-14', 5.00);
INSERT INTO EMPRESTIMO VALUES (12,1,'VHS',5,'2013-02-12', '2013-02-14', 5.00);
INSERT INTO EMPRESTIMO VALUES (13,1,'DVD',6,'2012-10-12', '2012-10-15', 5.00);
INSERT INTO EMPRESTIMO VALUES (14,1,'Blu-ray',7,'2013-06-23', '2013-06-27', 30.00);
INSERT INTO EMPRESTIMO VALUES (15,1,'Blu-ray',1,'2013-02-15', '2013-02-19', 45.00);
INSERT INTO EMPRESTIMO VALUES (1,1,'DVD',2,'2013-05-02', '2013-05-05', 5.00);
INSERT INTO EMPRESTIMO VALUES (2,2,'VHS',3,'2013-04-09', '2013-04-12', 10.00);
INSERT INTO EMPRESTIMO VALUES (3,1,'Blu-ray',4,'2013-02-09', '2013-02-20', 10.00);
INSERT INTO EMPRESTIMO VALUES (4,1,'VHS',5,'2013-06-07', '2013-06-08', 5.00);
INSERT INTO EMPRESTIMO VALUES (5,1,'Blu-ray',6,'2013-06-14', '2013-06-27', 65.00);

INSERT INTO ATOR VALUES (1, '1923-04-03', 'USA', 'Marlon Brando Jr.', 'Marlon Brando');
INSERT INTO ATOR VALUES (2, '1940-04-25', 'USA', 'Alfredo James Pacino', 'Al Pacino');
INSERT INTO ATOR VALUES (3, '1940-03-26', 'USA', 'James Edmund Caan', 'James Caan');
INSERT INTO ATOR VALUES (4, '1937-04-22', 'USA', 'John Joseph Nicholson', 'Jack Nicholson');
INSERT INTO ATOR VALUES (5, '1944-11-17', 'USA', 'Daniel Michae DeVito Jr.', 'Danny DeVito');
INSERT INTO ATOR VALUES (6, '1938-10-22', 'USA', 'Christopher Allen Lloyd', 'Christopher Lloyd');
INSERT INTO ATOR VALUES (7, '1965-04-04', 'USA', 'Robert John Downey Jr.', 'Robert Downey Jr.'); 
INSERT INTO ATOR VALUES (8, '1967-12-22', 'USA', 'Mark Alan Ruffalo', 'Mark Ruffalo');
INSERT INTO ATOR VALUES (9, '1984-11-22', 'USA', 'Scarlett Ingrid Johansson', 'Scarlett Johansson');
INSERT INTO ATOR VALUES (10, '1943-06-13', 'UK', 'Malcolm John Taylor', 'Malcolm McDowell');
INSERT INTO ATOR VALUES (11, '1947-04-26', 'UK', 'Alan Clarke', 'Warren Clarke');
INSERT INTO ATOR VALUES (12, '1930-11-13', 'UK', 'Adrienne Riccoboni', 'Adrienne Corri');
INSERT INTO ATOR VALUES (13, '1974-11-11', 'USA', 'Leonardo Wilhelm DiCaprio', 'Leonardo DiCaprio');
INSERT INTO ATOR VALUES (14, '1981-02-17', 'USA', 'Joseph Leonard Gordon-Levitt', 'Joseph Gordon-Levitt');
INSERT INTO ATOR VALUES (15, '1987-02-21', 'Canadá', 'Ellen Philpotts-Page', 'Ellen Page');
INSERT INTO ATOR VALUES (16, '1954-02-18', 'USA', 'John Joseph Travolta', 'John Travolta');
INSERT INTO ATOR VALUES (17, '1948-12-21', 'USA', 'Samuel Leroy Jackson', 'Samuel L. Jackson');
INSERT INTO ATOR VALUES (18, '1955-19-03', 'Alemanha Ocidental', 'Walter Bruce Willis', 'Bruce Willis');
INSERT INTO ATOR VALUES (19, '1975-01-05', 'USA', 'Bradley Charles Cooper', 'Bradley Cooper');
INSERT INTO ATOR VALUES (20, '1974-01-24', 'USA', 'Edward Paul Helms', 'Ed Helms');
INSERT INTO ATOR VALUES (21, '1969-10-01', 'USA', 'Zacharius Knight Galifianakis', 'Zach Galifianakis');
INSERT INTO ATOR VALUES (22, '1937-12-31', 'UK', 'Philip Anthony Hopkins', 'Anthony Hopkins');
INSERT INTO ATOR VALUES (23, '1962-11-19', 'USA', 'Alicia Christian Foster', 'Jodie Foster');
INSERT INTO ATOR VALUES (24, '1944-08-25', 'USA', 'Philip Anthony Mair Heald', 'Anthony Heald');
INSERT INTO ATOR VALUES (25, '1967-10-05', 'UK', 'Guy Edward Peace', 'Guy Pearce');
INSERT INTO ATOR VALUES (26, '1967-08-21', 'Canadá', 'Carrie-Anne Moss', 'Carrie-Anne Moss');
INSERT INTO ATOR VALUES (27, '1951-09-12', 'USA', 'Joseph Peter Pantoliano', 'Joe Pantoliano');
INSERT INTO ATOR VALUES (28, '1968-10-12', 'Austrália', 'Hugh Michael Jackman', 'Hugh Jackman');
INSERT INTO ATOR VALUES (29, '1964-04-07', 'Nova Zelândia', 'Russel Ira Crowe', 'Russel Crowe');
INSERT INTO ATOR VALUES (30, '1985-12-03', 'USA', 'Amanda Michelle Seyfried', 'Amanda Seyfried');
INSERT INTO ATOR VALUES (31, '1973-04-14', 'USA', 'Adrien Brody', 'Adrien Brody');
INSERT INTO ATOR VALUES (32, '1964-07-31', 'UK', 'Emilia Lydia Rose Fox', 'Emilia Fox');
INSERT INTO ATOR VALUES (33, '1926-08-06', 'UK', 'Francis Finlay', 'Frank Finlay');
INSERT INTO ATOR VALUES (34, '1905-05-15', 'USA', 'Joseph Cheshire Cotten', 'Joseph Cotten');
INSERT INTO ATOR VALUES (35, '1913-08-24', 'USA', 'Margaret Louise Comingore', 'Dorothy Comingore');
INSERT INTO ATOR VALUES (36, '1900-12-06', 'USA', 'Agnes Robertson Moorehead', 'Agnes Moorehead');
INSERT INTO ATOR VALUES (37,'1949-07-07', 'USA', 'Shelley Alexis Duvall', 'Shelley Duvall');
INSERT INTO ATOR VALUES (38, '1910-05-23', 'USA', 'Bejamin Sherman Crothers', 'Scatman Crothers');
INSERT INTO ATOR VALUES (39, '1963-12-18', 'USA', 'William Bradley Pitt', 'Brad Pitt');
INSERT INTO ATOR VALUES (40, '1975-09-22', 'USA', 'Mireille Enos', 'Mireille Enos');
INSERT INTO ATOR VALUES (41, '1966-07-14', 'USA', 'Matthew Chandler Fox', 'Matthew Fox');
INSERT INTO ATOR VALUES (42, '1967-12-13', 'USA', 'Eric Marlon Bishop', 'Jamie Foxx');
INSERT INTO ATOR VALUES (43, '1956-10-04', 'Áustria', 'Christoph Waltz', 'Christoph Waltz');


INSERT INTO ESTRELA VALUES (1,1);
INSERT INTO ESTRELA VALUES (1,2);
INSERT INTO ESTRELA VALUES (1,3);


INSERT INTO ESTRELA VALUES (2,4);
INSERT INTO ESTRELA VALUES (2,5);
INSERT INTO ESTRELA VALUES (2,6);


INSERT INTO ESTRELA VALUES (3,7);
INSERT INTO ESTRELA VALUES (3,8);
INSERT INTO ESTRELA VALUES (3,9);


INSERT INTO ESTRELA VALUES (4,9);
INSERT INTO ESTRELA VALUES (4,1);
INSERT INTO ESTRELA VALUES (4,7);


INSERT INTO ESTRELA VALUES (5,13);
INSERT INTO ESTRELA VALUES (5,14);
INSERT INTO ESTRELA VALUES (5,15);


INSERT INTO ESTRELA VALUES (6,16);
INSERT INTO ESTRELA VALUES (6,17);
INSERT INTO ESTRELA VALUES (6,18);


INSERT INTO ESTRELA VALUES (7,19);
INSERT INTO ESTRELA VALUES (7,20);
INSERT INTO ESTRELA VALUES (7,21);


INSERT INTO ESTRELA VALUES (8,22);
INSERT INTO ESTRELA VALUES (8,23);
INSERT INTO ESTRELA VALUES (8,24);


INSERT INTO ESTRELA VALUES (9,25);
INSERT INTO ESTRELA VALUES (9,26);
INSERT INTO ESTRELA VALUES (9,27);


INSERT INTO ESTRELA VALUES (10,28);
INSERT INTO ESTRELA VALUES (10,29);
INSERT INTO ESTRELA VALUES (10,30);


INSERT INTO ESTRELA VALUES (11,31);
INSERT INTO ESTRELA VALUES (11,32);
INSERT INTO ESTRELA VALUES (11,33);


INSERT INTO ESTRELA VALUES (12,34);
INSERT INTO ESTRELA VALUES (12,35);
INSERT INTO ESTRELA VALUES (12,36);


INSERT INTO ESTRELA VALUES (13,4);
INSERT INTO ESTRELA VALUES (13,37);
INSERT INTO ESTRELA VALUES (13,38);


INSERT INTO ESTRELA VALUES (14,39);
INSERT INTO ESTRELA VALUES (14,40);
INSERT INTO ESTRELA VALUES (14,41);


INSERT INTO ESTRELA VALUES (15,13);
INSERT INTO ESTRELA VALUES (15,42);
INSERT INTO ESTRELA VALUES (15,43);


SELECT ATOR.nomeartistico,FILME.titulo_original
FROM ATOR,ESTRELA,FILME
WHERE ATOR.cod = ESTRELA.codator AND 
	FILME.numFilme = ESTRELA.numFilme;
    
    
SELECT titulo_pt, classificacao FROM FILME;

SELECT titulo_original, tipo FROM FILME, MIDIA ORDER BY titulo_original;

SELECT FILME, titulo_pt, EMPRESTIMO.datedev FROM FILME INNER JOIN EMPRESTIMO;