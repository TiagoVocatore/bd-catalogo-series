-- alterando dados
UPDATE serie SET data_inicio =  TO_DATE('14/06/2021', 'DD/MM/YYYY') WHERE serie_id = 5;

-- concatenando informações
SELECT s.nome || '' || ' - série criada por ' || a.nome as "Apresentação" FROM serie s 
       INNER JOIN autor_principal a ON s.autor_id = a.autor_id;

-- juntando tabelas para detalhar informações sobre a série
SELECT s.nome as "SÉRIE", COUNT(t.temporada_id) "NR. TEMPORADAS", s.descricao,
       a.nome as "AUTOR", st.status, p.nome "PAÍS" FROM serie s 
       INNER JOIN temporada t ON s.serie_id = t.serie_id 
       INNER JOIN autor_principal a ON s.autor_id = a.autor_id
       INNER JOIN status st ON s.status_id = st.status_id
       INNER JOIN pais_origem p ON s.pais_origem_id = p.pais_origem_id
       GROUP BY s.nome, s.descricao, a.nome, st.status, p.nome ORDER BY s.nome; 

-- média dos episódios por temporada        
SELECT s.nome, ROUND(AVG(e.nota),2) as "MÉDIA DOS EPISÓDIOS", t.numero_temporada as "TEMPORADA" FROM serie s
       INNER JOIN temporada t ON s.serie_id = t.serie_id
       INNER JOIN episodio e ON t.temporada_id = e.temporada_id GROUP BY s.nome, t.numero_temporada ORDER BY s.nome, "TEMPORADA";  

-- usando o case para informar que um campo não foi preenchido         
SELECT nome as "SÉRIE", data_inicio as "INICIO", 
       CASE 
           WHEN data_fim IS NULL THEN 'Sem fim definido'
           WHEN data_fim IS NOT NULL THEN TO_CHAR(data_fim, 'DD/MM/YY')
       END "TERMINO",
       descricao FROM serie;

-- usando a clausula where
SELECT s.nome, t.numero_temporada || ' temp - ep ' || e.numero_episodio as "NR. EPISÓDIO" ,e.titulo, e.nota FROM serie s
       INNER JOIN temporada t ON s.serie_id = t.serie_id
       INNER JOIN episodio e ON t.temporada_id = e.temporada_id
       WHERE s.serie_id = 4 and t.numero_temporada = 1;   

-- selecionando os canais em que as séries estão ativas
SELECT s.nome SÉRIE, c.nome CANAL, tc.tipo "TIPO CANAL" from serie s
       INNER JOIN serie_canal sc ON s.serie_id = sc.serie_id
       INNER JOIN canal c ON sc.canal_id = c.canal_id
       INNER JOIN tipo_canal tc ON c.tipo_canal_id = tc.tipo_canal_id 
       WHERE sc.ativo = 'S';

-- selecionando atores que o nome começa com a letra M 
SELECT a.nome "ATOR/ATRIZ", po.nome "PAÍS ORIGEM" from ator a
       INNER JOIN pais_origem po ON po.pais_origem_id = a.pais_origem_id
       WHERE UPPER(a.nome) like 'M%';

-- selecionando os episódios que tenham notas entre 8.5 e 9.5 da série com id 13 
 SELECT s.nome, t.numero_temporada || ' temp - ep ' || e.numero_episodio as "NR. EPISÓDIO", e.titulo, e.nota  FROM serie s 
        INNER JOIN temporada t ON s.serie_id = t.serie_id
        INNER JOIN episodio e ON t.temporada_id = e.temporada_id where s.serie_id = 13 AND (e.nota BETWEEN 8.5 AND 9.5) ORDER BY e.nota DESC;

-- selecionando episódios com notas menores ou igua a 7.5       
SELECT s.nome, t.numero_temporada || ' temp - ep ' || e.numero_episodio as "NR. EPISÓDIO", e.titulo, e.nota  FROM serie s 
        INNER JOIN temporada t ON s.serie_id = t.serie_id
        INNER JOIN episodio e ON t.temporada_id = e.temporada_id where e.nota <= 7.5 ORDER BY e.nota DESC;        
 
-- calculando o número de meses passados da série com a data de inicio mais antiga 
SELECT nome SÉRIE, data_inicio INÍCIO, ROUND(MONTHS_BETWEEN(SYSDATE,data_inicio),0) "MESES PASSADOS DESDE O INÍCIO" FROM serie WHERE data_inicio = (SELECT min(data_inicio) FROM serie);

-- selecionando as séries em que os atores do país 1 atuaram
SELECT a.nome "ATOR", s.nome "SÉRIE" FROM ator a
       INNER JOIN serie_ator sa ON a.ator_id = sa.ator_id
       INNER JOIN serie s ON sa.serie_id = s.serie_id WHERE a.pais_origem_id = 1 ORDER BY a.nome, s.nome;  

-- selecionando séries que tenham o gênero com id 1 ou 2
SELECT s.nome SÉRIE, g.tipo FROM serie s 
       INNER JOIN serie_genero sg ON s.serie_id = sg.serie_id
       INNER JOIN genero g ON sg.genero_id = g.genero_id 
       WHERE g.genero_id  IN (1, 2);