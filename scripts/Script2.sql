-- adicionando países
INSERT INTO pais_origem (nome) VALUES ('Brasil');
INSERT INTO pais_origem (nome) VALUES ('Estados Unidos');
INSERT INTO pais_origem (nome) VALUES ('Canadá');
INSERT INTO pais_origem (nome) VALUES ('Reino Unido');
INSERT INTO pais_origem (nome) VALUES ('Alemanha');
INSERT INTO pais_origem (nome) VALUES ('Austrália');

-- adicionando gêneros
INSERT INTO genero (tipo) VALUES ('Comédia');    
INSERT INTO genero (tipo) VALUES ('Romance');   
INSERT INTO genero (tipo) VALUES ('Terror');   
INSERT INTO genero (tipo) VALUES ('Aventura');   
INSERT INTO genero (tipo) VALUES ('Ficção Científica');   
INSERT INTO genero (tipo) VALUES ('Fantasia');    
INSERT INTO genero (tipo) VALUES ('Drama'); 
INSERT INTO genero (tipo) VALUES ('Suspense'); 
INSERT INTO genero (tipo) VALUES ('Ação'); 

-- adicionando status
INSERT INTO status (status) VALUES ('Em exibição');
INSERT INTO status (status) VALUES ('Renovada');
INSERT INTO status (status) VALUES ('Cancelada');
INSERT INTO status (status) VALUES ('Finalizada');

-- adicionando o tipo de canal
INSERT INTO tipo_canal (tipo) VALUES ('TV');
INSERT INTO tipo_canal (tipo) VALUES ('Streaming');

-- adicionando canais
INSERT INTO canal (nome, tipo_canal_id) VALUES ('Globo', 1);
INSERT INTO canal (nome, tipo_canal_id) VALUES ('Netflix', 2);
INSERT INTO canal (nome, tipo_canal_id) VALUES ('Disney+', 2);
INSERT INTO canal (nome, tipo_canal_id) VALUES ('ABC', 1);
INSERT INTO canal (nome, tipo_canal_id) VALUES ('FOX', 1);
INSERT INTO canal (nome, tipo_canal_id) VALUES ('Prime Video', 2);
INSERT INTO canal (nome, tipo_canal_id) VALUES ('HBO', 1);
INSERT INTO canal (nome, tipo_canal_id) VALUES ('HBO Max', 2);
INSERT INTO canal (nome, tipo_canal_id) VALUES ('Globoplay', 2);
INSERT INTO canal (nome, tipo_canal_id) VALUES ('SBT', 1);

--adicionando autores
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('Ana Maria Ribeiro',1);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('Diego Souza',1);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('Julia Campos',1);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('Maria Tereza Santos',1);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('Antonio Nunes',1);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('Mary Smith',2);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('David Johnson',2);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('Sarah Jones',2);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('James Miller',2);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('Philip Wilson',2);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('Charlie Spellman',3);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('Malcolm Polley',3);
INSERT INTO autor_principal (nome, pais_origem_id) VALUES ('Sarah Cameron',4);

-- adicionando atores
INSERT INTO ator (nome, pais_origem_id) VALUES ('Antonio Braga', 1);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Maria Ribeiro', 1);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Rita Lopes', 1);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Marcos Silva', 1);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Debora Farias', 1);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Sarah Horler', 2);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Edward Smith', 2);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Jakob Carano', 2);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Pilou Bettany', 2);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Sacha Horler', 4);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Erin Taylor', 5);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Jack Moriarty', 5);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Pedro Schmidt', 6);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Gina Smith', 3);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Elizabeth Harris', 3);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Paul Wilson', 3);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Jared Miller', 2);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Lee Jones', 4);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Hermila Guedes', 5);
INSERT INTO ator (nome, pais_origem_id) VALUES ('Marc Johnson', 6);
