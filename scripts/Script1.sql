CREATE TABLE ator (
    ator_id         NUMBER(18) NOT NULL,
    nome            VARCHAR2(100) NOT NULL,
    pais_origem_id  NUMBER(18) NOT NULL
);

ALTER TABLE ator ADD CONSTRAINT ator_pk PRIMARY KEY ( ator_id );

CREATE TABLE autor_principal (
    autor_id        NUMBER(18) NOT NULL,
    nome            VARCHAR2(100) NOT NULL,
    pais_origem_id  NUMBER(18) NOT NULL
);

ALTER TABLE autor_principal ADD CONSTRAINT autor_principal_pk PRIMARY KEY ( autor_id );

CREATE TABLE canal (
    canal_id       NUMBER(18) NOT NULL,
    nome           VARCHAR2(100) NOT NULL,
    tipo_canal_id  NUMBER(18) NOT NULL
);

ALTER TABLE canal ADD CONSTRAINT canal_pk PRIMARY KEY ( canal_id );

CREATE TABLE episodio (
    episodio_id      NUMBER(18) NOT NULL,
    titulo           VARCHAR2(200),
    numero_episodio  NUMBER(3) NOT NULL,
    data_episodio    DATE NOT NULL,
    temporada_id     NUMBER(18) NOT NULL,
    nota             NUMBER(3, 1) NOT NULL
);

ALTER TABLE episodio ADD CHECK ( nota BETWEEN 0 AND 10 );

ALTER TABLE episodio ADD CONSTRAINT episodio_pk PRIMARY KEY ( episodio_id );

CREATE TABLE genero (
    genero_id  NUMBER(18) NOT NULL,
    tipo       VARCHAR2(100) NOT NULL
);

ALTER TABLE genero ADD CONSTRAINT genero_pk PRIMARY KEY ( genero_id );

CREATE TABLE pais_origem (
    pais_origem_id  NUMBER(18) NOT NULL,
    nome            VARCHAR2(100) NOT NULL
);

ALTER TABLE pais_origem ADD CONSTRAINT pais_origem_pk PRIMARY KEY ( pais_origem_id );

CREATE TABLE serie (
    serie_id        NUMBER(18) NOT NULL,
    nome            VARCHAR2(100) NOT NULL,
    data_inicio     DATE NOT NULL,
    data_fim        DATE,
    pais_origem_id  NUMBER(18) NOT NULL,
    autor_id        NUMBER(18) NOT NULL,
    descricao       VARCHAR2(500),
    status_id       NUMBER(18) NOT NULL
);

ALTER TABLE serie ADD CONSTRAINT serie_pk PRIMARY KEY ( serie_id );

CREATE TABLE serie_ator (
    serie_ator_id  NUMBER(18) NOT NULL,
    ator_id        NUMBER(18) NOT NULL,
    serie_id       NUMBER(18) NOT NULL
);

ALTER TABLE serie_ator ADD CONSTRAINT serie_ator_pk PRIMARY KEY ( serie_ator_id );

CREATE TABLE serie_canal (
    serie_canal_id  NUMBER(18) NOT NULL,
    serie_id        NUMBER(18) NOT NULL,
    canal_id        NUMBER(18) NOT NULL,
    ativo           CHAR(1)
);

ALTER TABLE serie_canal ADD CONSTRAINT serie_canal_pk PRIMARY KEY ( serie_canal_id );

CREATE TABLE serie_genero (
    serie_genero_id  NUMBER(18) NOT NULL,
    serie_id         NUMBER(18) NOT NULL,
    genero_id        NUMBER(18) NOT NULL
);

ALTER TABLE serie_genero ADD CONSTRAINT serie_genero_pk PRIMARY KEY ( serie_genero_id );

CREATE TABLE status (
    status_id  NUMBER(18) NOT NULL,
    status     VARCHAR2(150) NOT NULL
);

ALTER TABLE status ADD CONSTRAINT status_pk PRIMARY KEY ( status_id );

CREATE TABLE temporada (
    temporada_id      NUMBER(18) NOT NULL,
    numero_temporada  NUMBER(3) NOT NULL,
    data_inicio       DATE NOT NULL,
    data_fim          DATE,
    serie_id          NUMBER(18) NOT NULL
);

ALTER TABLE temporada ADD CONSTRAINT temporada_pk PRIMARY KEY ( temporada_id );

CREATE TABLE tipo_canal (
    tipo_canal_id  NUMBER(18) NOT NULL,
    tipo           VARCHAR2(100) NOT NULL
);

ALTER TABLE tipo_canal ADD CONSTRAINT tipo_canal_pk PRIMARY KEY ( tipo_canal_id );

ALTER TABLE ator
    ADD CONSTRAINT ator_pais_origem_fk FOREIGN KEY ( pais_origem_id )
        REFERENCES pais_origem ( pais_origem_id );

ALTER TABLE autor_principal
    ADD CONSTRAINT autor_principal_pais_origem_fk FOREIGN KEY ( pais_origem_id )
        REFERENCES pais_origem ( pais_origem_id );

ALTER TABLE canal
    ADD CONSTRAINT canal_tipo_canal_fk FOREIGN KEY ( tipo_canal_id )
        REFERENCES tipo_canal ( tipo_canal_id );

ALTER TABLE episodio
    ADD CONSTRAINT episodio_temporada_fk FOREIGN KEY ( temporada_id )
        REFERENCES temporada ( temporada_id );

ALTER TABLE serie_ator
    ADD CONSTRAINT serie_ator_ator_fk FOREIGN KEY ( ator_id )
        REFERENCES ator ( ator_id );

ALTER TABLE serie_ator
    ADD CONSTRAINT serie_ator_serie_fk FOREIGN KEY ( serie_id )
        REFERENCES serie ( serie_id );

ALTER TABLE serie
    ADD CONSTRAINT serie_autor_principal_fk FOREIGN KEY ( autor_id )
        REFERENCES autor_principal ( autor_id );

ALTER TABLE serie_canal
    ADD CONSTRAINT serie_canal_canal_fk FOREIGN KEY ( canal_id )
        REFERENCES canal ( canal_id );

ALTER TABLE serie_canal
    ADD CONSTRAINT serie_canal_serie_fk FOREIGN KEY ( serie_id )
        REFERENCES serie ( serie_id );

ALTER TABLE serie_genero
    ADD CONSTRAINT serie_genero_genero_fk FOREIGN KEY ( genero_id )
        REFERENCES genero ( genero_id );

ALTER TABLE serie_genero
    ADD CONSTRAINT serie_genero_serie_fk FOREIGN KEY ( serie_id )
        REFERENCES serie ( serie_id );

ALTER TABLE serie
    ADD CONSTRAINT serie_pais_origem_fk FOREIGN KEY ( pais_origem_id )
        REFERENCES pais_origem ( pais_origem_id );

ALTER TABLE serie
    ADD CONSTRAINT serie_status_fk FOREIGN KEY ( status_id )
        REFERENCES status ( status_id );

ALTER TABLE temporada
    ADD CONSTRAINT temporada_serie_fk FOREIGN KEY ( serie_id )
        REFERENCES serie ( serie_id );

CREATE SEQUENCE ator_ator_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ator_ator_id_trg BEFORE
    INSERT ON ator
    FOR EACH ROW
    WHEN ( new.ator_id IS NULL )
BEGIN
    :new.ator_id := ator_ator_id_seq.nextval;
END;
/

CREATE SEQUENCE autor_principal_autor_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER autor_principal_autor_id_trg BEFORE
    INSERT ON autor_principal
    FOR EACH ROW
    WHEN ( new.autor_id IS NULL )
BEGIN
    :new.autor_id := autor_principal_autor_id_seq.nextval;
END;
/

CREATE SEQUENCE canal_canal_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER canal_canal_id_trg BEFORE
    INSERT ON canal
    FOR EACH ROW
    WHEN ( new.canal_id IS NULL )
BEGIN
    :new.canal_id := canal_canal_id_seq.nextval;
END;
/

CREATE SEQUENCE episodio_episodio_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER episodio_episodio_id_trg BEFORE
    INSERT ON episodio
    FOR EACH ROW
    WHEN ( new.episodio_id IS NULL )
BEGIN
    :new.episodio_id := episodio_episodio_id_seq.nextval;
END;
/

CREATE SEQUENCE genero_genero_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER genero_genero_id_trg BEFORE
    INSERT ON genero
    FOR EACH ROW
    WHEN ( new.genero_id IS NULL )
BEGIN
    :new.genero_id := genero_genero_id_seq.nextval;
END;
/

CREATE SEQUENCE pais_origem_pais_origem_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pais_origem_pais_origem_id_trg BEFORE
    INSERT ON pais_origem
    FOR EACH ROW
    WHEN ( new.pais_origem_id IS NULL )
BEGIN
    :new.pais_origem_id := pais_origem_pais_origem_id_seq.nextval;
END;
/

CREATE SEQUENCE serie_serie_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER serie_serie_id_trg BEFORE
    INSERT ON serie
    FOR EACH ROW
    WHEN ( new.serie_id IS NULL )
BEGIN
    :new.serie_id := serie_serie_id_seq.nextval;
END;
/

CREATE SEQUENCE serie_ator_serie_ator_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER serie_ator_serie_ator_id_trg BEFORE
    INSERT ON serie_ator
    FOR EACH ROW
    WHEN ( new.serie_ator_id IS NULL )
BEGIN
    :new.serie_ator_id := serie_ator_serie_ator_id_seq.nextval;
END;
/

CREATE SEQUENCE serie_canal_serie_canal_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER serie_canal_serie_canal_id_trg BEFORE
    INSERT ON serie_canal
    FOR EACH ROW
    WHEN ( new.serie_canal_id IS NULL )
BEGIN
    :new.serie_canal_id := serie_canal_serie_canal_id_seq.nextval;
END;
/

CREATE SEQUENCE serie_genero_serie_genero_id START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER serie_genero_serie_genero_id BEFORE
    INSERT ON serie_genero
    FOR EACH ROW
    WHEN ( new.serie_genero_id IS NULL )
BEGIN
    :new.serie_genero_id := serie_genero_serie_genero_id.nextval;
END;
/

CREATE SEQUENCE status_status_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER status_status_id_trg BEFORE
    INSERT ON status
    FOR EACH ROW
    WHEN ( new.status_id IS NULL )
BEGIN
    :new.status_id := status_status_id_seq.nextval;
END;
/

CREATE SEQUENCE temporada_temporada_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER temporada_temporada_id_trg BEFORE
    INSERT ON temporada
    FOR EACH ROW
    WHEN ( new.temporada_id IS NULL )
BEGIN
    :new.temporada_id := temporada_temporada_id_seq.nextval;
END;
/

CREATE SEQUENCE tipo_canal_tipo_canal_id_seq START WITH 1 MINVALUE 1 MAXVALUE 999999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipo_canal_tipo_canal_id_trg BEFORE
    INSERT ON tipo_canal
    FOR EACH ROW
    WHEN ( new.tipo_canal_id IS NULL )
BEGIN
    :new.tipo_canal_id := tipo_canal_tipo_canal_id_seq.nextval;
END;
/
