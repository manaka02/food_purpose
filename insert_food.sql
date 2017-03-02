--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.5
-- Started on 2017-03-02 14:47:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 182 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 182
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 60136)
-- Name: aliment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE aliment (
    aliment_id integer NOT NULL,
    composant_id integer NOT NULL,
    categorie_id integer NOT NULL,
    designation character varying(50),
    details character varying(100),
    bio boolean,
    cholesterol boolean
);


ALTER TABLE aliment OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 60134)
-- Name: aliment_aliment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aliment_aliment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aliment_aliment_id_seq OWNER TO postgres;

--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 172
-- Name: aliment_aliment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aliment_aliment_id_seq OWNED BY aliment.aliment_id;


--
-- TOC entry 175 (class 1259 OID 60147)
-- Name: categorie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categorie (
    categorie_id integer NOT NULL,
    designation character varying(50),
    details character varying(100)
);


ALTER TABLE categorie OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 60145)
-- Name: categorie_categorie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categorie_categorie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categorie_categorie_id_seq OWNER TO postgres;

--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 174
-- Name: categorie_categorie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categorie_categorie_id_seq OWNED BY categorie.categorie_id;


--
-- TOC entry 177 (class 1259 OID 60156)
-- Name: composant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE composant (
    composant_id integer NOT NULL,
    kcal smallint,
    glucide smallint,
    protide smallint,
    lipide smallint
);


ALTER TABLE composant OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 60154)
-- Name: composant_composant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE composant_composant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE composant_composant_id_seq OWNER TO postgres;

--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 176
-- Name: composant_composant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE composant_composant_id_seq OWNED BY composant.composant_id;


--
-- TOC entry 179 (class 1259 OID 60165)
-- Name: recherche; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recherche (
    recherche_id integer NOT NULL,
    user_id integer,
    categorie_id integer,
    date_recherche date,
    details character varying(100),
    glucide smallint,
    protide smallint,
    lipide smallint
);


ALTER TABLE recherche OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 60163)
-- Name: recherche_recherche_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recherche_recherche_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recherche_recherche_id_seq OWNER TO postgres;

--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 178
-- Name: recherche_recherche_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recherche_recherche_id_seq OWNED BY recherche.recherche_id;


--
-- TOC entry 181 (class 1259 OID 60176)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE utilisateur (
    user_id integer NOT NULL,
    nom character varying(50),
    prenom character varying(50),
    mail character varying(100),
    password character varying(50),
    statut smallint
);


ALTER TABLE utilisateur OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 60174)
-- Name: utilisateur_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utilisateur_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utilisateur_user_id_seq OWNER TO postgres;

--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 180
-- Name: utilisateur_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE utilisateur_user_id_seq OWNED BY utilisateur.user_id;


--
-- TOC entry 1905 (class 2604 OID 60139)
-- Name: aliment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliment ALTER COLUMN aliment_id SET DEFAULT nextval('aliment_aliment_id_seq'::regclass);


--
-- TOC entry 1906 (class 2604 OID 60150)
-- Name: categorie_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categorie ALTER COLUMN categorie_id SET DEFAULT nextval('categorie_categorie_id_seq'::regclass);


--
-- TOC entry 1907 (class 2604 OID 60159)
-- Name: composant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY composant ALTER COLUMN composant_id SET DEFAULT nextval('composant_composant_id_seq'::regclass);


--
-- TOC entry 1908 (class 2604 OID 60168)
-- Name: recherche_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recherche ALTER COLUMN recherche_id SET DEFAULT nextval('recherche_recherche_id_seq'::regclass);


--
-- TOC entry 1909 (class 2604 OID 60179)
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilisateur ALTER COLUMN user_id SET DEFAULT nextval('utilisateur_user_id_seq'::regclass);


--
-- TOC entry 2043 (class 0 OID 60136)
-- Dependencies: 173
-- Data for Name: aliment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 172
-- Name: aliment_aliment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aliment_aliment_id_seq', 1, false);


--
-- TOC entry 2045 (class 0 OID 60147)
-- Dependencies: 175
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categorie (categorie_id, designation, details) VALUES (1, 'fruit sec ', 'pas de details');
INSERT INTO categorie (categorie_id, designation, details) VALUES (2, 'fruit charnue', 'pas de details');
INSERT INTO categorie (categorie_id, designation, details) VALUES (3, 'legume', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (4, 'viande', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (5, 'fruit de mer', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (6, 'boisson', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (7, 'charcuterie', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (8, 'crustacé', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (9, 'Mollusques', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (10, 'volailles', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (11, 'champignons', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (12, 'poisson', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (13, 'céréales', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (14, 'algues', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (15, 'aliments commerciaux', NULL);
INSERT INTO categorie (categorie_id, designation, details) VALUES (16, 'produits laitiers', NULL);


--
-- TOC entry 2066 (class 0 OID 0)
-- Dependencies: 174
-- Name: categorie_categorie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categorie_categorie_id_seq', 16, true);


--
-- TOC entry 2047 (class 0 OID 60156)
-- Dependencies: 177
-- Data for Name: composant; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2067 (class 0 OID 0)
-- Dependencies: 176
-- Name: composant_composant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('composant_composant_id_seq', 1, false);


--
-- TOC entry 2049 (class 0 OID 60165)
-- Dependencies: 179
-- Data for Name: recherche; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2068 (class 0 OID 0)
-- Dependencies: 178
-- Name: recherche_recherche_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recherche_recherche_id_seq', 1, false);


--
-- TOC entry 2051 (class 0 OID 60176)
-- Dependencies: 181
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO utilisateur (user_id, nom, prenom, mail, password, statut) VALUES (2, 'Rajaonah', 'Sam', 'sam@gmail.com', '123456', 1);
INSERT INTO utilisateur (user_id, nom, prenom, mail, password, statut) VALUES (1, 'Ralambosoa', 'Toavina', 'toavina@gmail.com', 'azertyuiop', 1);
INSERT INTO utilisateur (user_id, nom, prenom, mail, password, statut) VALUES (3, 'Andriatiana', 'Baliaka', 'baliaka@gmail.com', '456789', 1);
INSERT INTO utilisateur (user_id, nom, prenom, mail, password, statut) VALUES (4, 'Raeliarisoa', 'Camilla', 'camille@gmail.com', 'qsdfghjk', 1);
INSERT INTO utilisateur (user_id, nom, prenom, mail, password, statut) VALUES (5, 'Rakotonirina ', 'Richard', 'richard@gmail.com', 'kjhgfdsuytrez', 2);
INSERT INTO utilisateur (user_id, nom, prenom, mail, password, statut) VALUES (6, 'Randrianasolo', 'François', 'francois@gmail.com', 'jhgfdstrez', 1);


--
-- TOC entry 2069 (class 0 OID 0)
-- Dependencies: 180
-- Name: utilisateur_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utilisateur_user_id_seq', 6, true);


--
-- TOC entry 1914 (class 2606 OID 60141)
-- Name: pk_aliment; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY aliment
    ADD CONSTRAINT pk_aliment PRIMARY KEY (aliment_id);


--
-- TOC entry 1916 (class 2606 OID 60152)
-- Name: pk_categorie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categorie
    ADD CONSTRAINT pk_categorie PRIMARY KEY (categorie_id);


--
-- TOC entry 1920 (class 2606 OID 60161)
-- Name: pk_composant; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY composant
    ADD CONSTRAINT pk_composant PRIMARY KEY (composant_id);


--
-- TOC entry 1922 (class 2606 OID 60170)
-- Name: pk_recherche; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recherche
    ADD CONSTRAINT pk_recherche PRIMARY KEY (recherche_id);


--
-- TOC entry 1927 (class 2606 OID 60181)
-- Name: pk_utilisateur; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT pk_utilisateur PRIMARY KEY (user_id);


--
-- TOC entry 1910 (class 1259 OID 60144)
-- Name: aliment_composant_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX aliment_composant_fk ON aliment USING btree (composant_id);


--
-- TOC entry 1911 (class 1259 OID 60142)
-- Name: aliment_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX aliment_pk ON aliment USING btree (aliment_id);


--
-- TOC entry 1912 (class 1259 OID 60143)
-- Name: categorie_aliment_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX categorie_aliment_fk ON aliment USING btree (categorie_id);


--
-- TOC entry 1918 (class 1259 OID 60162)
-- Name: composant_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX composant_pk ON composant USING btree (composant_id);


--
-- TOC entry 1923 (class 1259 OID 60171)
-- Name: recherche_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX recherche_pk ON recherche USING btree (recherche_id);


--
-- TOC entry 1917 (class 1259 OID 60153)
-- Name: type_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX type_pk ON categorie USING btree (categorie_id);


--
-- TOC entry 1924 (class 1259 OID 60172)
-- Name: type_recherche_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX type_recherche_fk ON recherche USING btree (categorie_id);


--
-- TOC entry 1928 (class 1259 OID 60182)
-- Name: utilisateur_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX utilisateur_pk ON utilisateur USING btree (user_id);


--
-- TOC entry 1925 (class 1259 OID 60173)
-- Name: utilisateur_recherche_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX utilisateur_recherche_fk ON recherche USING btree (user_id);


--
-- TOC entry 1929 (class 2606 OID 60183)
-- Name: fk_aliment_aliment_c_composan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliment
    ADD CONSTRAINT fk_aliment_aliment_c_composan FOREIGN KEY (composant_id) REFERENCES composant(composant_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1930 (class 2606 OID 60188)
-- Name: fk_aliment_categorie_categori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aliment
    ADD CONSTRAINT fk_aliment_categorie_categori FOREIGN KEY (categorie_id) REFERENCES categorie(categorie_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1931 (class 2606 OID 60193)
-- Name: fk_recherch_recherche_categori; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recherche
    ADD CONSTRAINT fk_recherch_recherche_categori FOREIGN KEY (categorie_id) REFERENCES categorie(categorie_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1932 (class 2606 OID 60198)
-- Name: fk_recherch_utilisate_utilisat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recherche
    ADD CONSTRAINT fk_recherch_utilisate_utilisat FOREIGN KEY (user_id) REFERENCES utilisateur(user_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-03-02 14:47:14

--
-- PostgreSQL database dump complete
--

