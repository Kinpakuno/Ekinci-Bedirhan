--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adresse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adresse (
    id integer NOT NULL,
    idclient integer NOT NULL,
    numero integer,
    voie character varying(10) NOT NULL,
    libellevoie character varying(30) NOT NULL,
    codepostal character varying(5) NOT NULL,
    ville character varying(30) NOT NULL
);


ALTER TABLE public.adresse OWNER TO postgres;

--
-- Name: categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorie (
    id integer NOT NULL,
    libelle character varying(30) NOT NULL
);


ALTER TABLE public.categorie OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    nom character varying(30) NOT NULL,
    prenom character varying(30) NOT NULL,
    datenaissance date,
    sexe character(1),
    parrain integer
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commande (
    id integer NOT NULL,
    idclient integer,
    ladate date NOT NULL,
    idadrlivraison integer,
    idpaiement integer
);


ALTER TABLE public.commande OWNER TO postgres;

--
-- Name: paiement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paiement (
    id integer NOT NULL,
    libelle character varying(20) NOT NULL
);


ALTER TABLE public.paiement OWNER TO postgres;

--
-- Name: porter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.porter (
    idcommande integer NOT NULL,
    refproduit integer NOT NULL,
    quantite integer
);


ALTER TABLE public.porter OWNER TO postgres;

--
-- Name: produit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produit (
    ref integer NOT NULL,
    nom character varying(30),
    prix double precision,
    idcategorie integer
);


ALTER TABLE public.produit OWNER TO postgres;

--
-- Data for Name: adresse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adresse (id, idclient, numero, voie, libellevoie, codepostal, ville) FROM stdin;
1	1	17	place	de la République	52000	chaumont
2	1	41	place	du Marché	52000	chaumont
1	2	1	place	du Paradis	52000	chaumont
2	2	49	place	Jean Mermoz	52000	chaumont
3	2	79	boulevard	du Marché	52000	chaumont
1	3	62	impasse	Victor Hugo	52000	chaumont
2	3	51	allée	du Paradis	10000	troyes
1	4	46	allée	Jules Verne	75000	paris
2	4	74	impasse	des Accacias	51100	reims
3	4	27	place	Jules Verne	74000	annecy
1	5	47	avenue	Jules Verne	74000	annecy
2	5	60	rue	du Marché	10000	troyes
1	6	48	avenue	Victor Hugo	74000	annecy
2	6	18	rue	Jean Mermoz	06000	nice
1	7	53	allée	des Accacias	74000	annecy
2	7	22	impasse	du Paradis	52000	chaumont
3	7	13	rue	Victor Hugo	75000	paris
1	8	29	boulevard	de la Libération	10000	troyes
2	8	55	place	Jules Verne	52000	chaumont
3	8	19	avenue	de la République	10000	troyes
1	9	73	impasse	Jules Verne	75000	paris
1	10	22	rue	de la République	74000	annecy
2	10	6	impasse	de la République	51100	reims
1	11	61	place	du Paradis	06000	nice
2	11	73	impasse	des Accacias	10000	troyes
3	11	40	rue	du Paradis	06000	nice
1	12	72	impasse	du Paradis	10000	troyes
2	12	62	avenue	du Paradis	51100	reims
1	13	51	impasse	Victor Hugo	06000	nice
1	14	29	place	du Paradis	06000	nice
2	14	7	avenue	de la République	06000	nice
3	14	44	place	des Accacias	06000	nice
1	15	19	place	de la République	51100	reims
2	15	42	impasse	de la Libération	52000	chaumont
1	16	73	avenue	du Paradis	10000	troyes
2	16	44	place	du Paradis	52000	chaumont
1	17	49	avenue	Jean Mermoz	52000	chaumont
2	17	56	avenue	Jules Verne	75000	paris
3	17	75	place	Jules Verne	52000	chaumont
1	18	3	impasse	du Paradis	74000	annecy
1	19	16	place	de la Libération	10000	troyes
2	19	51	place	du Paradis	06000	nice
1	20	7	avenue	des Accacias	06000	nice
1	21	55	place	du Marché	74000	annecy
2	21	61	avenue	du Paradis	10000	troyes
1	22	76	avenue	du Paradis	75000	paris
1	23	27	place	de la République	10000	troyes
1	24	74	boulevard	Victor Hugo	06000	nice
1	25	23	avenue	Victor Hugo	74000	annecy
2	25	71	place	du Marché	74000	annecy
1	26	17	place	du Marché	51100	reims
2	26	59	place	de la Libération	52000	chaumont
3	26	9	allée	Jules Verne	52000	chaumont
1	27	42	rue	Victor Hugo	75000	paris
1	28	42	allée	Jules Verne	10000	troyes
2	28	72	impasse	Victor Hugo	74000	annecy
3	28	4	place	Jules Verne	74000	annecy
1	29	67	impasse	Jean Mermoz	52000	chaumont
2	29	64	boulevard	Jules Verne	51100	reims
1	30	54	impasse	Victor Hugo	10000	troyes
2	30	9	boulevard	du Paradis	10000	troyes
3	30	64	place	des Accacias	51100	reims
1	31	55	boulevard	Jules Verne	06000	nice
2	31	40	impasse	Jean Mermoz	51100	reims
1	32	52	rue	du Paradis	74000	annecy
1	33	23	impasse	Jean Mermoz	52000	chaumont
2	33	47	allée	des Accacias	06000	nice
1	34	8	boulevard	de la République	10000	troyes
2	34	45	avenue	des Accacias	74000	annecy
1	35	67	impasse	Jean Mermoz	51100	reims
2	35	3	impasse	Jean Mermoz	74000	annecy
1	36	59	avenue	Victor Hugo	10000	troyes
2	36	43	rue	de la République	10000	troyes
1	37	37	impasse	des Accacias	10000	troyes
2	37	35	impasse	de la République	10000	troyes
3	37	68	avenue	du Paradis	74000	annecy
1	38	80	boulevard	Victor Hugo	74000	annecy
2	38	73	avenue	de la République	52000	chaumont
3	38	54	avenue	Victor Hugo	52000	chaumont
1	39	46	impasse	Jules Verne	06000	nice
1	40	33	avenue	du Paradis	52000	chaumont
1	41	51	allée	du Marché	74000	annecy
2	41	71	impasse	de la République	75000	paris
1	42	68	rue	Jules Verne	10000	troyes
2	42	40	allée	Jules Verne	51100	reims
3	42	73	place	du Paradis	52000	chaumont
1	43	40	boulevard	Jean Mermoz	06000	nice
2	43	63	boulevard	du Marché	10000	troyes
1	44	42	boulevard	de la République	06000	nice
2	44	49	place	Victor Hugo	74000	annecy
3	44	52	place	Jean Mermoz	74000	annecy
1	45	37	allée	de la Libération	75000	paris
1	46	31	boulevard	Jules Verne	06000	nice
1	47	77	avenue	de la Libération	75000	paris
2	47	70	place	Jules Verne	10000	troyes
3	47	9	avenue	de la Libération	51100	reims
1	48	60	impasse	Jean Mermoz	52000	chaumont
1	49	56	avenue	Jean Mermoz	10000	troyes
1	50	5	avenue	de la Libération	75000	paris
2	50	62	rue	du Marché	75000	paris
3	50	35	boulevard	de la République	51100	reims
1	51	26	impasse	Jean Mermoz	75000	paris
2	51	66	avenue	de la Libération	74000	annecy
3	51	2	place	Jean Mermoz	51100	reims
1	52	11	boulevard	de la République	74000	annecy
2	52	49	avenue	de la Libération	52000	chaumont
1	53	10	impasse	du Paradis	74000	annecy
1	54	59	place	de la République	75000	paris
2	54	69	impasse	de la République	06000	nice
1	55	47	avenue	des Accacias	52000	chaumont
1	56	38	boulevard	de la Libération	06000	nice
2	56	22	impasse	du Marché	52000	chaumont
1	57	45	boulevard	du Paradis	51100	reims
1	58	18	place	du Paradis	10000	troyes
2	58	0	allée	du Paradis	52000	chaumont
1	59	38	impasse	Jules Verne	74000	annecy
1	60	27	avenue	Victor Hugo	52000	chaumont
1	61	73	avenue	de la République	06000	nice
2	61	64	allée	Victor Hugo	74000	annecy
1	62	21	impasse	du Paradis	74000	annecy
1	63	3	impasse	du Paradis	74000	annecy
2	63	46	avenue	de la Libération	52000	chaumont
1	64	30	place	Jean Mermoz	52000	chaumont
2	64	63	impasse	du Paradis	74000	annecy
3	64	34	impasse	Jules Verne	10000	troyes
1	65	51	allée	Victor Hugo	74000	annecy
2	65	29	place	de la Libération	06000	nice
3	65	35	place	de la Libération	51100	reims
1	66	37	place	de la République	74000	annecy
1	67	56	avenue	Victor Hugo	06000	nice
2	67	54	allée	Jules Verne	51100	reims
3	67	70	rue	Victor Hugo	52000	chaumont
1	68	72	boulevard	de la République	75000	paris
1	69	35	avenue	du Marché	74000	annecy
2	69	72	allée	Victor Hugo	10000	troyes
1	70	13	rue	du Paradis	52000	chaumont
2	70	64	avenue	des Accacias	06000	nice
1	71	31	allée	Jules Verne	06000	nice
1	72	72	boulevard	Jules Verne	06000	nice
2	72	34	boulevard	Victor Hugo	06000	nice
3	72	62	impasse	du Paradis	74000	annecy
1	73	35	allée	Jean Mermoz	75000	paris
2	73	4	impasse	de la Libération	10000	troyes
1	74	36	avenue	Victor Hugo	52000	chaumont
2	74	8	rue	du Marché	52000	chaumont
1	75	26	impasse	de la République	06000	nice
1	76	60	boulevard	Victor Hugo	52000	chaumont
1	77	16	rue	du Paradis	06000	nice
2	77	57	avenue	du Paradis	06000	nice
1	78	65	avenue	Victor Hugo	51100	reims
2	78	43	place	du Paradis	06000	nice
1	79	29	place	des Accacias	74000	annecy
2	79	10	place	Victor Hugo	52000	chaumont
1	80	65	avenue	de la Libération	10000	troyes
2	80	28	impasse	Jules Verne	06000	nice
1	81	7	allée	Jules Verne	52000	chaumont
2	81	33	allée	Jules Verne	06000	nice
1	82	0	rue	de la République	74000	annecy
2	82	36	impasse	de la République	06000	nice
3	82	76	avenue	Jules Verne	74000	annecy
1	83	6	avenue	Jean Mermoz	10000	troyes
1	84	5	impasse	Victor Hugo	75000	paris
1	85	59	impasse	de la République	10000	troyes
1	86	3	allée	de la République	74000	annecy
2	86	62	boulevard	Jules Verne	74000	annecy
3	86	30	place	Victor Hugo	74000	annecy
1	87	47	allée	du Marché	74000	annecy
2	87	45	boulevard	de la République	75000	paris
1	88	45	place	Jules Verne	52000	chaumont
2	88	10	rue	Jules Verne	52000	chaumont
1	89	19	allée	de la Libération	52000	chaumont
2	89	71	boulevard	de la République	10000	troyes
3	89	59	allée	du Marché	52000	chaumont
1	90	45	rue	du Paradis	52000	chaumont
2	90	18	avenue	du Paradis	75000	paris
3	90	24	place	de la République	75000	paris
1	91	39	rue	du Marché	51100	reims
1	92	13	impasse	du Paradis	51100	reims
1	93	13	place	Jean Mermoz	52000	chaumont
2	93	48	impasse	de la République	10000	troyes
1	94	25	avenue	de la Libération	74000	annecy
1	95	66	rue	Victor Hugo	52000	chaumont
2	95	68	allée	Jules Verne	51100	reims
3	95	64	avenue	des Accacias	52000	chaumont
1	96	40	place	de la Libération	74000	annecy
2	96	57	rue	Victor Hugo	52000	chaumont
1	97	39	impasse	du Marché	06000	nice
2	97	39	place	Victor Hugo	06000	nice
3	97	61	boulevard	du Paradis	52000	chaumont
1	98	58	impasse	de la République	10000	troyes
1	99	13	impasse	de la République	51100	reims
2	99	39	place	Jules Verne	51100	reims
1	100	30	avenue	de la République	52000	chaumont
1	101	49	rue	de la République	51100	reims
1	102	19	place	de la République	74000	annecy
2	102	3	place	Victor Hugo	10000	troyes
1	103	59	impasse	Jules Verne	74000	annecy
2	103	77	impasse	de la République	74000	annecy
1	104	57	rue	du Paradis	10000	troyes
2	104	19	rue	de la Libération	51100	reims
3	104	48	allée	Jules Verne	74000	annecy
1	105	70	avenue	de la Libération	10000	troyes
2	105	13	allée	Jean Mermoz	10000	troyes
1	106	13	place	Jules Verne	06000	nice
2	106	38	avenue	des Accacias	06000	nice
1	107	48	boulevard	de la République	51100	reims
2	107	29	place	du Paradis	75000	paris
1	108	11	place	des Accacias	52000	chaumont
2	108	65	impasse	Jean Mermoz	74000	annecy
3	108	10	rue	Jean Mermoz	10000	troyes
1	109	52	impasse	de la Libération	06000	nice
2	109	18	impasse	de la République	06000	nice
1	110	41	boulevard	de la Libération	75000	paris
2	110	43	impasse	Jules Verne	52000	chaumont
1	111	55	avenue	Victor Hugo	06000	nice
1	112	23	avenue	Jules Verne	52000	chaumont
1	113	27	allée	du Paradis	74000	annecy
1	114	20	avenue	de la Libération	52000	chaumont
2	114	49	allée	de la République	51100	reims
1	115	74	avenue	de la République	06000	nice
2	115	63	avenue	de la Libération	10000	troyes
3	115	2	boulevard	de la Libération	52000	chaumont
1	116	26	place	du Marché	06000	nice
1	117	66	rue	Jean Mermoz	06000	nice
2	117	33	allée	Jules Verne	51100	reims
1	118	46	boulevard	de la Libération	10000	troyes
1	119	56	impasse	de la Libération	75000	paris
2	119	50	place	du Paradis	51100	reims
1	120	41	impasse	du Paradis	74000	annecy
2	120	76	avenue	Jean Mermoz	10000	troyes
1	121	61	place	du Paradis	10000	troyes
2	121	68	place	de la Libération	75000	paris
1	122	7	impasse	de la Libération	10000	troyes
1	123	63	allée	de la République	06000	nice
2	123	46	boulevard	Victor Hugo	74000	annecy
1	124	44	place	du Marché	75000	paris
2	124	59	allée	Jules Verne	10000	troyes
1	125	24	place	Jean Mermoz	10000	troyes
1	126	69	place	Victor Hugo	10000	troyes
2	126	72	rue	du Paradis	10000	troyes
1	127	14	boulevard	du Paradis	10000	troyes
2	127	15	allée	Jean Mermoz	06000	nice
3	127	53	rue	du Paradis	10000	troyes
1	128	50	boulevard	de la Libération	52000	chaumont
2	128	75	avenue	de la Libération	74000	annecy
3	128	42	place	du Paradis	52000	chaumont
1	129	18	avenue	des Accacias	74000	annecy
2	129	48	avenue	Victor Hugo	10000	troyes
3	129	46	avenue	du Paradis	51100	reims
1	130	7	boulevard	de la Libération	52000	chaumont
2	130	27	impasse	Jean Mermoz	74000	annecy
1	131	71	avenue	du Marché	52000	chaumont
2	131	17	rue	du Paradis	75000	paris
3	131	50	place	du Marché	51100	reims
1	132	21	boulevard	du Paradis	10000	troyes
2	132	47	impasse	de la Libération	75000	paris
1	133	8	allée	Jean Mermoz	06000	nice
1	134	69	avenue	de la Libération	06000	nice
1	135	12	allée	de la République	10000	troyes
1	136	24	allée	Jules Verne	52000	chaumont
2	136	62	place	de la République	06000	nice
1	137	70	allée	de la République	10000	troyes
1	138	35	impasse	de la République	10000	troyes
2	138	46	place	Jean Mermoz	75000	paris
1	139	9	impasse	de la Libération	74000	annecy
2	139	73	impasse	du Paradis	10000	troyes
1	140	52	place	du Marché	74000	annecy
1	141	8	place	des Accacias	52000	chaumont
1	142	26	place	du Paradis	06000	nice
2	142	39	allée	du Paradis	52000	chaumont
1	143	36	impasse	Jules Verne	51100	reims
2	143	3	place	de la Libération	52000	chaumont
1	144	77	boulevard	du Marché	74000	annecy
1	145	3	place	des Accacias	52000	chaumont
2	145	62	place	des Accacias	52000	chaumont
1	146	45	avenue	Victor Hugo	74000	annecy
2	146	50	place	de la Libération	74000	annecy
3	146	15	avenue	du Marché	10000	troyes
1	147	35	avenue	Victor Hugo	52000	chaumont
1	148	23	allée	de la Libération	10000	troyes
2	148	1	boulevard	Jean Mermoz	10000	troyes
3	148	21	allée	Victor Hugo	51100	reims
1	149	76	place	Jules Verne	75000	paris
2	149	67	place	du Marché	06000	nice
1	150	12	avenue	Jean Mermoz	74000	annecy
2	150	22	impasse	Jean Mermoz	75000	paris
3	150	44	avenue	de la Libération	06000	nice
1	151	18	boulevard	Victor Hugo	52000	chaumont
2	151	17	place	de la République	06000	nice
1	152	5	boulevard	Victor Hugo	74000	annecy
2	152	13	avenue	Jules Verne	52000	chaumont
1	153	14	impasse	des Accacias	06000	nice
1	154	18	boulevard	Jules Verne	52000	chaumont
2	154	53	rue	de la République	52000	chaumont
1	155	20	place	Victor Hugo	51100	reims
1	156	25	allée	de la République	52000	chaumont
2	156	6	boulevard	de la République	10000	troyes
1	157	40	impasse	de la République	06000	nice
1	158	64	place	du Paradis	75000	paris
1	159	48	impasse	de la République	10000	troyes
2	159	48	avenue	du Paradis	75000	paris
1	160	13	impasse	Jean Mermoz	51100	reims
2	160	54	boulevard	Jules Verne	52000	chaumont
1	161	25	boulevard	Jules Verne	10000	troyes
2	161	39	avenue	du Paradis	75000	paris
3	161	32	impasse	du Marché	52000	chaumont
1	162	40	impasse	Jean Mermoz	74000	annecy
2	162	19	rue	de la République	51100	reims
1	163	32	place	Victor Hugo	52000	chaumont
2	163	37	place	de la Libération	74000	annecy
1	164	37	avenue	Victor Hugo	52000	chaumont
2	164	39	impasse	Victor Hugo	75000	paris
3	164	42	place	du Paradis	10000	troyes
1	165	61	avenue	Jules Verne	74000	annecy
2	165	14	avenue	de la Libération	52000	chaumont
3	165	11	allée	de la République	52000	chaumont
1	166	29	avenue	de la République	74000	annecy
2	166	46	allée	Jules Verne	74000	annecy
1	167	36	impasse	Jules Verne	52000	chaumont
1	168	15	avenue	Jules Verne	06000	nice
2	168	28	boulevard	des Accacias	74000	annecy
1	169	4	avenue	Jean Mermoz	06000	nice
2	169	41	rue	Victor Hugo	06000	nice
3	169	39	boulevard	Victor Hugo	06000	nice
1	170	62	place	du Marché	74000	annecy
2	170	51	boulevard	Jean Mermoz	06000	nice
3	170	4	place	Jean Mermoz	52000	chaumont
1	171	45	boulevard	du Paradis	75000	paris
1	172	33	allée	Jean Mermoz	52000	chaumont
2	172	68	avenue	des Accacias	74000	annecy
1	173	51	place	du Marché	74000	annecy
2	173	21	impasse	de la Libération	51100	reims
1	174	75	rue	de la Libération	74000	annecy
1	175	41	place	de la République	74000	annecy
2	175	63	rue	de la République	74000	annecy
3	175	52	boulevard	Victor Hugo	10000	troyes
1	176	13	place	Jean Mermoz	52000	chaumont
2	176	33	impasse	de la Libération	52000	chaumont
1	177	2	place	de la République	52000	chaumont
2	177	44	rue	Jean Mermoz	06000	nice
3	177	38	impasse	Victor Hugo	74000	annecy
1	178	75	impasse	Jules Verne	06000	nice
2	178	35	place	de la République	06000	nice
1	179	65	avenue	des Accacias	10000	troyes
1	180	61	impasse	du Paradis	52000	chaumont
1	181	52	avenue	de la Libération	10000	troyes
1	182	29	rue	de la Libération	52000	chaumont
1	183	5	rue	du Paradis	10000	troyes
2	183	9	rue	Jean Mermoz	06000	nice
1	184	76	avenue	de la République	10000	troyes
2	184	18	allée	du Paradis	52000	chaumont
1	185	45	rue	du Paradis	52000	chaumont
2	185	15	place	du Paradis	10000	troyes
1	186	41	boulevard	de la Libération	74000	annecy
1	187	47	boulevard	de la République	51100	reims
2	187	26	rue	Jules Verne	74000	annecy
1	188	76	impasse	Victor Hugo	74000	annecy
2	188	4	boulevard	Jean Mermoz	74000	annecy
1	189	43	boulevard	Jules Verne	52000	chaumont
2	189	69	avenue	du Paradis	06000	nice
3	189	35	place	de la République	10000	troyes
1	190	24	avenue	de la République	74000	annecy
2	190	50	place	des Accacias	52000	chaumont
1	191	21	place	Jean Mermoz	06000	nice
2	191	54	place	du Paradis	10000	troyes
1	192	71	avenue	de la République	52000	chaumont
2	192	32	place	Jean Mermoz	10000	troyes
1	193	53	place	Jules Verne	10000	troyes
2	193	49	place	des Accacias	52000	chaumont
1	194	72	impasse	de la République	06000	nice
2	194	50	impasse	Jules Verne	74000	annecy
1	195	68	allée	du Paradis	06000	nice
2	195	36	impasse	du Marché	10000	troyes
1	196	59	rue	de la Libération	06000	nice
2	196	30	rue	Jean Mermoz	06000	nice
1	197	50	place	de la Libération	52000	chaumont
2	197	49	place	Victor Hugo	06000	nice
1	198	2	impasse	de la Libération	52000	chaumont
1	199	37	allée	de la République	06000	nice
2	199	13	avenue	Jules Verne	74000	annecy
3	199	27	boulevard	des Accacias	06000	nice
1	200	47	boulevard	du Paradis	52000	chaumont
2	200	65	avenue	des Accacias	10000	troyes
3	200	39	place	du Marché	75000	paris
1	201	56	boulevard	du Marché	74000	annecy
2	201	13	allée	du Paradis	74000	annecy
1	202	79	boulevard	Jules Verne	06000	nice
2	202	16	avenue	du Paradis	06000	nice
1	203	9	place	Victor Hugo	74000	annecy
1	204	76	impasse	Jean Mermoz	74000	annecy
2	204	15	rue	Jean Mermoz	10000	troyes
3	204	76	boulevard	Jules Verne	10000	troyes
1	205	11	impasse	Jean Mermoz	52000	chaumont
2	205	14	place	Jules Verne	52000	chaumont
1	206	40	place	de la Libération	06000	nice
2	206	23	avenue	de la République	51100	reims
1	207	51	allée	Jules Verne	74000	annecy
2	207	46	place	Jean Mermoz	75000	paris
3	207	27	place	Jules Verne	74000	annecy
1	208	27	boulevard	de la République	51100	reims
2	208	42	boulevard	Victor Hugo	10000	troyes
1	209	2	avenue	Jules Verne	06000	nice
2	209	26	place	Jules Verne	10000	troyes
1	210	54	avenue	du Marché	52000	chaumont
2	210	77	boulevard	de la Libération	74000	annecy
3	210	75	place	de la Libération	74000	annecy
1	211	36	allée	Jean Mermoz	10000	troyes
2	211	17	boulevard	Jules Verne	75000	paris
1	212	53	allée	des Accacias	74000	annecy
2	212	20	place	des Accacias	74000	annecy
1	213	26	avenue	des Accacias	74000	annecy
2	213	69	rue	Jean Mermoz	52000	chaumont
3	213	72	boulevard	de la République	06000	nice
1	214	31	rue	des Accacias	52000	chaumont
1	215	62	impasse	Victor Hugo	52000	chaumont
2	215	5	allée	Victor Hugo	74000	annecy
1	216	51	place	de la République	10000	troyes
2	216	39	impasse	de la République	06000	nice
1	217	56	avenue	de la République	52000	chaumont
2	217	28	avenue	Victor Hugo	06000	nice
3	217	30	avenue	de la Libération	06000	nice
1	218	39	place	des Accacias	75000	paris
1	219	16	boulevard	Jean Mermoz	74000	annecy
2	219	70	impasse	Jules Verne	52000	chaumont
1	220	42	boulevard	du Paradis	74000	annecy
2	220	63	boulevard	Victor Hugo	74000	annecy
3	220	51	place	de la Libération	74000	annecy
1	221	64	impasse	Victor Hugo	75000	paris
2	221	61	boulevard	Victor Hugo	52000	chaumont
3	221	71	avenue	Victor Hugo	06000	nice
1	222	56	boulevard	du Marché	52000	chaumont
2	222	62	place	Victor Hugo	10000	troyes
1	223	56	rue	du Paradis	10000	troyes
1	224	19	avenue	de la Libération	06000	nice
1	225	48	allée	du Marché	52000	chaumont
1	226	33	impasse	Jean Mermoz	10000	troyes
1	227	61	rue	Victor Hugo	52000	chaumont
2	227	54	avenue	de la Libération	10000	troyes
3	227	63	impasse	du Paradis	75000	paris
1	228	6	impasse	Victor Hugo	51100	reims
2	228	15	boulevard	Jean Mermoz	74000	annecy
3	228	21	impasse	Jean Mermoz	06000	nice
1	229	75	place	de la République	52000	chaumont
2	229	76	rue	des Accacias	51100	reims
1	230	1	impasse	de la Libération	52000	chaumont
2	230	25	allée	du Paradis	52000	chaumont
1	231	31	place	du Paradis	06000	nice
2	231	53	place	Victor Hugo	52000	chaumont
1	232	71	avenue	Victor Hugo	06000	nice
2	232	12	place	du Marché	74000	annecy
1	233	77	place	du Paradis	74000	annecy
2	233	49	avenue	du Paradis	75000	paris
1	234	2	impasse	de la République	52000	chaumont
2	234	46	impasse	de la Libération	10000	troyes
1	235	70	place	du Paradis	52000	chaumont
1	236	76	allée	du Marché	10000	troyes
2	236	57	boulevard	Jean Mermoz	06000	nice
3	236	15	avenue	Victor Hugo	06000	nice
1	237	61	boulevard	de la République	06000	nice
1	238	40	avenue	Jules Verne	06000	nice
2	238	15	place	Jean Mermoz	52000	chaumont
1	239	2	place	Jules Verne	75000	paris
2	239	67	rue	Victor Hugo	10000	troyes
1	240	68	place	Jean Mermoz	06000	nice
2	240	4	avenue	Victor Hugo	06000	nice
1	241	35	boulevard	Jean Mermoz	06000	nice
2	241	73	allée	du Paradis	06000	nice
1	242	60	place	de la Libération	06000	nice
2	242	43	impasse	de la République	74000	annecy
1	243	71	impasse	Jean Mermoz	75000	paris
2	243	17	impasse	du Marché	52000	chaumont
3	243	17	avenue	Victor Hugo	10000	troyes
1	244	44	avenue	de la Libération	06000	nice
2	244	39	avenue	Jules Verne	10000	troyes
1	245	4	place	Jules Verne	74000	annecy
1	246	32	boulevard	Jean Mermoz	52000	chaumont
2	246	8	boulevard	des Accacias	52000	chaumont
1	247	35	avenue	Jean Mermoz	10000	troyes
2	247	61	place	du Paradis	52000	chaumont
1	248	20	rue	de la République	06000	nice
1	249	6	boulevard	Victor Hugo	74000	annecy
1	250	28	avenue	des Accacias	10000	troyes
2	250	32	place	de la République	10000	troyes
3	250	35	avenue	de la République	75000	paris
1	251	78	boulevard	Jules Verne	74000	annecy
2	251	46	impasse	de la Libération	74000	annecy
3	251	61	allée	Jules Verne	74000	annecy
1	252	78	impasse	de la République	10000	troyes
1	253	28	impasse	du Paradis	06000	nice
2	253	34	avenue	Jules Verne	06000	nice
3	253	56	allée	du Marché	51100	reims
1	254	66	avenue	du Marché	10000	troyes
2	254	52	place	de la République	74000	annecy
1	255	17	allée	des Accacias	74000	annecy
2	255	54	boulevard	Victor Hugo	74000	annecy
1	256	6	allée	des Accacias	74000	annecy
2	256	55	place	Jules Verne	52000	chaumont
1	257	78	place	du Marché	52000	chaumont
2	257	52	boulevard	des Accacias	51100	reims
1	258	49	avenue	de la République	06000	nice
2	258	35	allée	de la Libération	10000	troyes
1	259	58	impasse	de la République	75000	paris
2	259	75	avenue	de la République	10000	troyes
1	260	74	boulevard	de la République	06000	nice
2	260	25	impasse	des Accacias	52000	chaumont
1	261	14	place	de la Libération	10000	troyes
2	261	15	rue	Victor Hugo	52000	chaumont
1	262	4	boulevard	Jules Verne	51100	reims
1	263	43	place	du Marché	06000	nice
1	264	40	place	Jean Mermoz	10000	troyes
1	265	73	impasse	Jean Mermoz	10000	troyes
1	266	55	impasse	de la République	52000	chaumont
1	267	31	impasse	Jules Verne	10000	troyes
2	267	78	avenue	Jean Mermoz	06000	nice
3	267	12	boulevard	du Paradis	52000	chaumont
1	268	70	place	du Paradis	06000	nice
2	268	41	rue	Victor Hugo	10000	troyes
3	268	66	impasse	de la République	10000	troyes
1	269	2	avenue	Victor Hugo	06000	nice
1	270	3	boulevard	Jean Mermoz	51100	reims
1	271	64	rue	de la République	74000	annecy
2	271	71	place	de la République	75000	paris
3	271	71	avenue	de la République	06000	nice
1	272	11	impasse	de la Libération	06000	nice
1	273	62	avenue	Jules Verne	74000	annecy
2	273	25	impasse	Jules Verne	06000	nice
3	273	20	rue	Jean Mermoz	06000	nice
1	274	10	impasse	du Marché	74000	annecy
2	274	40	impasse	des Accacias	74000	annecy
3	274	23	avenue	de la Libération	10000	troyes
1	275	21	avenue	Jean Mermoz	06000	nice
1	276	6	allée	Jules Verne	74000	annecy
2	276	40	boulevard	du Paradis	10000	troyes
1	277	61	allée	du Paradis	10000	troyes
1	278	19	rue	de la République	74000	annecy
2	278	8	avenue	de la République	06000	nice
1	279	42	avenue	Jean Mermoz	10000	troyes
1	280	22	avenue	de la République	51100	reims
2	280	61	impasse	de la République	74000	annecy
1	281	29	place	Jean Mermoz	06000	nice
2	281	68	place	du Paradis	52000	chaumont
1	282	30	boulevard	de la Libération	51100	reims
1	283	69	place	Jean Mermoz	74000	annecy
2	283	62	allée	Jean Mermoz	74000	annecy
3	283	0	allée	du Marché	10000	troyes
1	284	37	place	Jules Verne	74000	annecy
1	285	48	boulevard	Jean Mermoz	52000	chaumont
2	285	2	impasse	du Marché	06000	nice
1	286	48	avenue	Jules Verne	06000	nice
2	286	72	boulevard	du Paradis	06000	nice
1	287	2	place	du Marché	52000	chaumont
2	287	68	impasse	du Paradis	74000	annecy
1	288	62	boulevard	Jean Mermoz	52000	chaumont
2	288	9	boulevard	Jean Mermoz	75000	paris
1	289	78	rue	de la Libération	74000	annecy
1	290	2	boulevard	des Accacias	52000	chaumont
1	291	24	place	Jules Verne	75000	paris
2	291	28	impasse	Victor Hugo	10000	troyes
1	292	66	impasse	de la République	10000	troyes
1	293	27	rue	Jean Mermoz	74000	annecy
2	293	49	boulevard	de la République	06000	nice
3	293	40	place	Jules Verne	74000	annecy
1	294	37	boulevard	de la Libération	51100	reims
2	294	50	place	du Marché	52000	chaumont
1	295	48	place	Jules Verne	06000	nice
2	295	72	allée	Victor Hugo	74000	annecy
3	295	16	impasse	Jean Mermoz	10000	troyes
1	296	13	avenue	du Paradis	75000	paris
2	296	29	boulevard	du Paradis	51100	reims
3	296	60	rue	de la République	10000	troyes
1	297	30	boulevard	Jean Mermoz	52000	chaumont
2	297	37	place	Jean Mermoz	06000	nice
3	297	66	rue	Jean Mermoz	74000	annecy
1	298	10	avenue	des Accacias	06000	nice
2	298	50	boulevard	Jules Verne	52000	chaumont
3	298	45	impasse	des Accacias	10000	troyes
1	299	56	allée	du Paradis	52000	chaumont
2	299	55	avenue	des Accacias	74000	annecy
1	300	54	place	Jean Mermoz	10000	troyes
2	300	78	allée	du Marché	51100	reims
1	301	72	place	Victor Hugo	75000	paris
2	301	44	avenue	Jean Mermoz	52000	chaumont
3	301	40	impasse	de la Libération	06000	nice
1	302	45	impasse	de la Libération	75000	paris
2	302	47	avenue	des Accacias	75000	paris
1	303	9	impasse	des Accacias	74000	annecy
2	303	41	impasse	de la République	74000	annecy
3	303	59	impasse	Jules Verne	74000	annecy
1	304	8	boulevard	de la Libération	06000	nice
2	304	22	allée	de la Libération	06000	nice
1	305	56	boulevard	du Marché	74000	annecy
2	305	54	place	Jules Verne	74000	annecy
1	306	73	avenue	du Paradis	51100	reims
1	307	68	avenue	Victor Hugo	75000	paris
2	307	10	rue	des Accacias	10000	troyes
1	308	24	rue	de la République	74000	annecy
2	308	15	place	de la Libération	06000	nice
1	309	74	boulevard	Jean Mermoz	52000	chaumont
2	309	72	allée	de la République	75000	paris
1	310	10	impasse	de la Libération	10000	troyes
2	310	14	boulevard	Jean Mermoz	52000	chaumont
1	311	38	impasse	des Accacias	06000	nice
2	311	58	impasse	de la République	52000	chaumont
3	311	51	impasse	Jules Verne	51100	reims
1	312	44	impasse	Jean Mermoz	10000	troyes
1	313	39	impasse	Victor Hugo	52000	chaumont
2	313	74	rue	Victor Hugo	75000	paris
1	314	25	impasse	Jean Mermoz	10000	troyes
2	314	19	boulevard	de la République	06000	nice
1	315	64	allée	de la Libération	75000	paris
2	315	65	avenue	des Accacias	06000	nice
3	315	29	impasse	du Paradis	06000	nice
1	316	78	rue	Jean Mermoz	10000	troyes
2	316	25	place	de la République	06000	nice
1	317	32	boulevard	de la République	74000	annecy
2	317	30	boulevard	Victor Hugo	06000	nice
1	318	72	boulevard	de la Libération	52000	chaumont
2	318	23	place	des Accacias	06000	nice
1	319	4	avenue	de la République	51100	reims
2	319	8	avenue	du Paradis	51100	reims
3	319	29	avenue	des Accacias	10000	troyes
1	320	48	avenue	de la République	10000	troyes
2	320	23	boulevard	de la République	52000	chaumont
1	321	76	boulevard	de la République	74000	annecy
2	321	33	rue	Victor Hugo	52000	chaumont
1	322	63	rue	du Marché	74000	annecy
1	323	68	allée	Victor Hugo	74000	annecy
2	323	62	avenue	Jean Mermoz	52000	chaumont
1	324	76	place	des Accacias	10000	troyes
2	324	3	allée	Victor Hugo	52000	chaumont
3	324	74	boulevard	des Accacias	10000	troyes
1	325	70	place	Jules Verne	74000	annecy
1	326	68	allée	Victor Hugo	74000	annecy
2	326	75	boulevard	Jean Mermoz	06000	nice
3	326	42	avenue	Jules Verne	06000	nice
1	327	72	boulevard	Jean Mermoz	74000	annecy
1	328	76	impasse	des Accacias	52000	chaumont
2	328	52	place	Jules Verne	06000	nice
3	328	55	place	Jules Verne	52000	chaumont
1	329	33	allée	de la République	10000	troyes
1	330	20	rue	Jean Mermoz	10000	troyes
1	331	79	place	de la République	06000	nice
2	331	11	avenue	Jules Verne	52000	chaumont
1	332	30	impasse	Victor Hugo	74000	annecy
1	333	33	place	du Marché	06000	nice
1	334	70	place	du Marché	75000	paris
2	334	71	boulevard	de la Libération	74000	annecy
3	334	54	boulevard	de la Libération	10000	troyes
1	335	67	impasse	Jules Verne	74000	annecy
2	335	24	rue	Jules Verne	06000	nice
1	336	17	avenue	du Paradis	10000	troyes
2	336	60	place	Jules Verne	52000	chaumont
3	336	5	impasse	Jean Mermoz	06000	nice
1	337	17	impasse	du Paradis	75000	paris
2	337	61	impasse	Victor Hugo	52000	chaumont
1	338	43	place	du Paradis	10000	troyes
1	339	52	impasse	Jules Verne	74000	annecy
2	339	35	rue	du Paradis	52000	chaumont
1	340	69	boulevard	de la Libération	51100	reims
2	340	75	impasse	de la République	75000	paris
1	341	72	place	du Marché	10000	troyes
2	341	15	place	de la Libération	52000	chaumont
1	342	46	avenue	de la Libération	06000	nice
1	343	32	place	des Accacias	74000	annecy
1	344	20	place	Victor Hugo	06000	nice
2	344	21	avenue	Jean Mermoz	10000	troyes
3	344	3	impasse	de la République	06000	nice
1	345	21	place	du Paradis	51100	reims
2	345	69	allée	Victor Hugo	51100	reims
1	346	58	rue	Jean Mermoz	74000	annecy
2	346	43	allée	Victor Hugo	74000	annecy
1	347	18	place	de la Libération	51100	reims
2	347	60	boulevard	Victor Hugo	06000	nice
1	348	19	avenue	des Accacias	52000	chaumont
2	348	59	impasse	Jules Verne	06000	nice
3	348	59	allée	Jean Mermoz	51100	reims
1	349	50	avenue	du Paradis	74000	annecy
1	350	37	allée	Victor Hugo	74000	annecy
2	350	70	impasse	Victor Hugo	10000	troyes
1	351	73	place	de la Libération	10000	troyes
2	351	72	place	de la République	51100	reims
1	352	35	boulevard	de la Libération	52000	chaumont
2	352	42	boulevard	Victor Hugo	06000	nice
1	353	41	avenue	de la République	10000	troyes
2	353	2	place	Victor Hugo	06000	nice
1	354	10	avenue	Victor Hugo	52000	chaumont
2	354	60	allée	Victor Hugo	74000	annecy
1	355	17	impasse	de la Libération	51100	reims
2	355	9	impasse	Jean Mermoz	75000	paris
1	356	6	avenue	Victor Hugo	10000	troyes
2	356	69	impasse	de la Libération	74000	annecy
1	357	5	impasse	de la Libération	10000	troyes
2	357	78	boulevard	du Paradis	10000	troyes
3	357	14	avenue	de la République	51100	reims
1	358	19	impasse	du Marché	06000	nice
1	359	71	allée	du Marché	52000	chaumont
2	359	46	boulevard	Jules Verne	51100	reims
3	359	59	place	Jean Mermoz	06000	nice
1	360	65	boulevard	Victor Hugo	51100	reims
2	360	41	impasse	du Paradis	52000	chaumont
1	361	49	place	Victor Hugo	74000	annecy
2	361	7	impasse	des Accacias	06000	nice
3	361	39	boulevard	des Accacias	74000	annecy
1	362	17	allée	Jules Verne	74000	annecy
2	362	19	rue	des Accacias	74000	annecy
3	362	58	boulevard	de la République	74000	annecy
1	363	23	impasse	Jules Verne	52000	chaumont
2	363	41	boulevard	Victor Hugo	52000	chaumont
1	364	16	place	de la République	06000	nice
2	364	14	allée	Jean Mermoz	06000	nice
1	365	4	allée	Jean Mermoz	10000	troyes
2	365	47	boulevard	Victor Hugo	51100	reims
1	366	33	boulevard	de la Libération	06000	nice
2	366	54	avenue	Jean Mermoz	06000	nice
1	367	33	impasse	du Paradis	10000	troyes
1	368	59	allée	de la Libération	06000	nice
1	369	70	avenue	Jules Verne	10000	troyes
2	369	22	place	Jean Mermoz	74000	annecy
1	370	8	impasse	du Paradis	74000	annecy
2	370	75	impasse	Jean Mermoz	06000	nice
3	370	2	impasse	de la Libération	10000	troyes
1	371	4	avenue	du Paradis	10000	troyes
2	371	52	impasse	Jules Verne	74000	annecy
3	371	64	avenue	du Marché	06000	nice
1	372	1	boulevard	Victor Hugo	74000	annecy
1	373	37	place	Jules Verne	74000	annecy
2	373	26	place	de la République	10000	troyes
1	374	21	boulevard	Jean Mermoz	10000	troyes
2	374	63	allée	de la République	06000	nice
1	375	0	boulevard	Victor Hugo	06000	nice
1	376	68	impasse	des Accacias	75000	paris
2	376	17	avenue	de la Libération	06000	nice
1	377	33	boulevard	Victor Hugo	74000	annecy
2	377	29	avenue	Victor Hugo	52000	chaumont
1	378	12	impasse	Jules Verne	06000	nice
2	378	13	avenue	Victor Hugo	06000	nice
1	379	68	boulevard	du Paradis	74000	annecy
2	379	74	avenue	de la Libération	06000	nice
1	380	74	impasse	Jean Mermoz	74000	annecy
2	380	74	avenue	Jean Mermoz	06000	nice
1	381	52	allée	de la République	51100	reims
1	382	68	place	du Paradis	10000	troyes
2	382	64	impasse	Jules Verne	06000	nice
1	383	32	avenue	des Accacias	51100	reims
2	383	35	place	du Paradis	51100	reims
1	384	41	place	du Paradis	06000	nice
2	384	46	place	Victor Hugo	51100	reims
1	385	55	avenue	Jules Verne	74000	annecy
1	386	69	allée	de la République	06000	nice
2	386	76	place	de la Libération	52000	chaumont
3	386	49	rue	Jean Mermoz	06000	nice
1	387	53	boulevard	du Paradis	10000	troyes
1	388	22	place	de la République	51100	reims
2	388	6	place	Victor Hugo	06000	nice
1	389	25	allée	Victor Hugo	06000	nice
1	390	31	impasse	du Paradis	10000	troyes
2	390	7	rue	du Marché	74000	annecy
1	391	73	rue	Jules Verne	51100	reims
1	392	30	rue	de la République	74000	annecy
2	392	78	boulevard	Jean Mermoz	52000	chaumont
1	393	20	boulevard	Victor Hugo	52000	chaumont
2	393	10	avenue	de la Libération	74000	annecy
1	394	62	impasse	du Paradis	10000	troyes
2	394	56	rue	de la Libération	06000	nice
1	395	20	allée	du Paradis	74000	annecy
2	395	44	avenue	Victor Hugo	52000	chaumont
3	395	1	impasse	de la République	74000	annecy
1	396	76	impasse	de la République	06000	nice
2	396	44	impasse	de la Libération	52000	chaumont
3	396	25	avenue	Victor Hugo	52000	chaumont
1	397	73	avenue	du Paradis	52000	chaumont
2	397	64	impasse	de la Libération	10000	troyes
3	397	63	rue	de la République	06000	nice
1	398	77	avenue	du Paradis	10000	troyes
1	399	35	allée	du Marché	74000	annecy
2	399	55	place	de la Libération	51100	reims
1	400	72	place	Victor Hugo	06000	nice
2	400	73	place	de la Libération	06000	nice
3	400	38	boulevard	du Marché	06000	nice
1	401	64	rue	de la République	75000	paris
1	402	65	place	de la République	10000	troyes
1	403	8	place	Jean Mermoz	52000	chaumont
1	404	17	impasse	du Marché	74000	annecy
2	404	40	allée	Jean Mermoz	10000	troyes
1	405	55	impasse	Victor Hugo	06000	nice
2	405	58	avenue	du Marché	74000	annecy
1	406	37	avenue	Jules Verne	52000	chaumont
2	406	79	avenue	des Accacias	10000	troyes
3	406	48	rue	du Marché	74000	annecy
1	407	4	impasse	du Paradis	51100	reims
2	407	34	place	des Accacias	75000	paris
1	408	5	impasse	Victor Hugo	74000	annecy
2	408	74	place	de la République	51100	reims
1	409	55	avenue	du Paradis	06000	nice
2	409	74	rue	de la Libération	10000	troyes
1	410	16	impasse	de la Libération	52000	chaumont
1	411	36	impasse	Jules Verne	06000	nice
2	411	64	rue	de la République	74000	annecy
3	411	11	boulevard	Victor Hugo	51100	reims
1	412	63	rue	de la République	06000	nice
1	413	53	place	du Paradis	52000	chaumont
2	413	74	avenue	de la Libération	52000	chaumont
1	414	54	impasse	de la Libération	52000	chaumont
1	415	2	avenue	de la Libération	10000	troyes
2	415	69	rue	Jules Verne	10000	troyes
1	416	47	avenue	Jules Verne	51100	reims
1	417	11	boulevard	Jean Mermoz	06000	nice
2	417	41	rue	du Marché	74000	annecy
1	418	28	place	de la Libération	10000	troyes
2	418	64	rue	des Accacias	74000	annecy
3	418	78	allée	de la République	51100	reims
1	419	17	avenue	de la Libération	51100	reims
2	419	14	allée	Jean Mermoz	06000	nice
3	419	22	impasse	des Accacias	06000	nice
1	420	14	impasse	Jean Mermoz	74000	annecy
1	421	14	impasse	Jean Mermoz	74000	annecy
2	421	75	rue	de la Libération	10000	troyes
3	421	68	place	de la Libération	52000	chaumont
1	422	50	impasse	de la Libération	06000	nice
2	422	42	allée	de la République	74000	annecy
3	422	60	boulevard	de la Libération	10000	troyes
1	423	72	impasse	de la Libération	75000	paris
2	423	61	avenue	Victor Hugo	74000	annecy
1	424	43	impasse	des Accacias	75000	paris
2	424	5	boulevard	du Paradis	06000	nice
1	425	2	avenue	des Accacias	74000	annecy
1	426	64	avenue	des Accacias	52000	chaumont
2	426	48	avenue	Jean Mermoz	06000	nice
3	426	0	allée	du Paradis	74000	annecy
1	427	45	place	de la Libération	51100	reims
2	427	1	rue	du Paradis	74000	annecy
1	428	55	avenue	du Marché	75000	paris
2	428	23	rue	de la République	51100	reims
1	429	49	avenue	des Accacias	52000	chaumont
2	429	39	boulevard	du Marché	06000	nice
1	430	61	allée	du Paradis	06000	nice
1	431	46	boulevard	Victor Hugo	06000	nice
1	432	50	place	de la Libération	51100	reims
2	432	59	allée	de la République	74000	annecy
3	432	39	avenue	Jules Verne	75000	paris
1	433	13	boulevard	du Paradis	10000	troyes
2	433	78	avenue	Jules Verne	52000	chaumont
1	434	36	avenue	Jules Verne	06000	nice
2	434	24	boulevard	Victor Hugo	52000	chaumont
1	435	15	boulevard	Jules Verne	10000	troyes
1	436	44	avenue	du Paradis	52000	chaumont
2	436	23	boulevard	du Paradis	06000	nice
1	437	43	boulevard	du Marché	74000	annecy
2	437	61	place	Jules Verne	74000	annecy
1	438	40	place	du Paradis	74000	annecy
2	438	74	avenue	des Accacias	52000	chaumont
1	439	68	place	Jules Verne	52000	chaumont
1	440	35	avenue	du Marché	10000	troyes
2	440	70	impasse	Victor Hugo	74000	annecy
1	441	34	rue	Jules Verne	75000	paris
1	442	48	boulevard	Jules Verne	06000	nice
1	443	66	avenue	des Accacias	10000	troyes
2	443	25	rue	du Paradis	10000	troyes
1	444	17	avenue	Jean Mermoz	75000	paris
2	444	41	avenue	Victor Hugo	10000	troyes
3	444	74	place	du Paradis	52000	chaumont
1	445	75	place	Victor Hugo	10000	troyes
2	445	46	avenue	du Marché	52000	chaumont
3	445	16	avenue	Jean Mermoz	74000	annecy
1	446	42	impasse	de la République	74000	annecy
2	446	55	boulevard	de la République	51100	reims
3	446	37	impasse	Jules Verne	10000	troyes
1	447	33	avenue	Jean Mermoz	52000	chaumont
2	447	25	boulevard	des Accacias	74000	annecy
3	447	55	avenue	Jean Mermoz	74000	annecy
1	448	78	boulevard	Jules Verne	06000	nice
2	448	57	place	Jules Verne	52000	chaumont
1	449	65	avenue	du Paradis	75000	paris
2	449	15	allée	Jules Verne	10000	troyes
1	450	6	boulevard	du Paradis	06000	nice
2	450	14	avenue	du Marché	74000	annecy
3	450	77	place	de la Libération	10000	troyes
1	451	24	place	des Accacias	51100	reims
2	451	36	rue	du Paradis	74000	annecy
1	452	76	place	Jules Verne	51100	reims
1	453	74	impasse	de la République	06000	nice
1	454	25	avenue	Victor Hugo	75000	paris
1	455	31	boulevard	de la Libération	52000	chaumont
2	455	8	impasse	Jean Mermoz	52000	chaumont
1	456	70	boulevard	Jules Verne	75000	paris
2	456	36	boulevard	de la République	10000	troyes
3	456	1	allée	Jules Verne	51100	reims
1	457	70	impasse	Jules Verne	52000	chaumont
1	458	8	boulevard	de la République	75000	paris
2	458	64	impasse	Jules Verne	52000	chaumont
1	459	65	avenue	de la République	52000	chaumont
1	460	24	place	Jules Verne	74000	annecy
2	460	38	boulevard	des Accacias	52000	chaumont
1	461	74	impasse	du Paradis	51100	reims
2	461	37	boulevard	Jean Mermoz	06000	nice
3	461	11	allée	Jules Verne	06000	nice
1	462	52	place	Jules Verne	10000	troyes
1	463	7	impasse	des Accacias	51100	reims
2	463	61	place	Jean Mermoz	06000	nice
1	464	52	boulevard	du Marché	52000	chaumont
1	465	79	impasse	du Paradis	75000	paris
2	465	32	boulevard	Victor Hugo	75000	paris
1	466	60	rue	du Paradis	74000	annecy
2	466	21	avenue	du Marché	52000	chaumont
1	467	38	avenue	Jules Verne	74000	annecy
1	468	41	avenue	Victor Hugo	06000	nice
1	469	12	place	de la Libération	75000	paris
2	469	25	avenue	de la République	52000	chaumont
1	470	58	avenue	Victor Hugo	06000	nice
1	471	73	avenue	du Marché	74000	annecy
1	472	78	rue	de la République	52000	chaumont
2	472	15	rue	Jules Verne	10000	troyes
3	472	1	avenue	des Accacias	06000	nice
1	473	67	place	des Accacias	74000	annecy
2	473	70	avenue	de la Libération	10000	troyes
1	474	11	boulevard	du Marché	52000	chaumont
2	474	56	impasse	Jean Mermoz	74000	annecy
1	475	26	avenue	de la République	51100	reims
1	476	24	avenue	de la Libération	06000	nice
2	476	40	allée	de la République	51100	reims
3	476	69	boulevard	de la République	52000	chaumont
1	477	1	avenue	de la République	10000	troyes
1	478	42	boulevard	de la Libération	06000	nice
2	478	70	avenue	Jean Mermoz	74000	annecy
3	478	26	rue	de la Libération	10000	troyes
1	479	68	impasse	de la Libération	52000	chaumont
2	479	69	impasse	Jean Mermoz	74000	annecy
3	479	59	allée	du Paradis	74000	annecy
1	480	56	avenue	Victor Hugo	10000	troyes
2	480	9	place	du Marché	74000	annecy
1	481	62	place	de la République	75000	paris
2	481	16	boulevard	de la Libération	75000	paris
1	482	12	rue	de la République	75000	paris
2	482	16	boulevard	de la République	06000	nice
3	482	77	place	Jules Verne	74000	annecy
1	483	29	boulevard	Jules Verne	06000	nice
2	483	6	allée	du Paradis	74000	annecy
3	483	20	boulevard	Jules Verne	10000	troyes
1	484	20	allée	Jean Mermoz	06000	nice
2	484	71	boulevard	du Marché	10000	troyes
1	485	14	boulevard	de la République	51100	reims
1	486	7	avenue	de la République	52000	chaumont
1	487	18	impasse	de la République	51100	reims
2	487	3	avenue	de la République	74000	annecy
1	488	5	avenue	Victor Hugo	75000	paris
2	488	31	allée	Jean Mermoz	06000	nice
1	489	67	avenue	de la République	10000	troyes
2	489	77	place	Jean Mermoz	10000	troyes
3	489	24	avenue	de la République	51100	reims
1	490	43	boulevard	Jean Mermoz	51100	reims
2	490	77	impasse	Victor Hugo	75000	paris
1	491	68	avenue	Jules Verne	74000	annecy
2	491	17	allée	Victor Hugo	74000	annecy
3	491	79	rue	de la République	06000	nice
1	492	36	impasse	Jules Verne	06000	nice
2	492	24	avenue	du Paradis	75000	paris
3	492	4	impasse	Victor Hugo	52000	chaumont
1	493	18	allée	du Paradis	10000	troyes
2	493	29	avenue	de la République	10000	troyes
3	493	11	avenue	Jean Mermoz	51100	reims
1	494	54	impasse	de la République	10000	troyes
1	495	35	impasse	de la République	10000	troyes
2	495	34	rue	de la Libération	52000	chaumont
3	495	75	avenue	de la République	10000	troyes
1	496	66	allée	Victor Hugo	10000	troyes
2	496	68	impasse	des Accacias	51100	reims
1	497	78	avenue	Jean Mermoz	51100	reims
2	497	76	avenue	des Accacias	10000	troyes
1	498	55	impasse	de la Libération	52000	chaumont
2	498	44	impasse	Jules Verne	74000	annecy
3	498	30	place	de la République	06000	nice
1	499	0	boulevard	des Accacias	51100	reims
2	499	19	impasse	de la Libération	52000	chaumont
1	500	41	place	Victor Hugo	75000	paris
2	500	38	place	Jean Mermoz	52000	chaumont
1	501	8	impasse	des Accacias	10000	troyes
1	502	3	place	de la République	10000	troyes
2	502	28	avenue	de la Libération	10000	troyes
1	503	57	place	du Paradis	74000	annecy
2	503	32	place	Victor Hugo	10000	troyes
1	504	21	allée	Jules Verne	06000	nice
2	504	33	allée	de la République	51100	reims
3	504	67	impasse	Victor Hugo	52000	chaumont
1	505	48	avenue	Jean Mermoz	06000	nice
1	506	55	allée	de la Libération	74000	annecy
2	506	36	boulevard	de la République	10000	troyes
1	507	51	rue	de la Libération	10000	troyes
1	508	11	impasse	de la République	52000	chaumont
2	508	44	boulevard	de la République	10000	troyes
1	509	45	rue	Jean Mermoz	74000	annecy
2	509	76	place	de la Libération	74000	annecy
1	510	43	rue	du Paradis	74000	annecy
2	510	62	impasse	Jean Mermoz	74000	annecy
1	511	68	place	du Marché	10000	troyes
2	511	2	boulevard	Jules Verne	06000	nice
3	511	10	avenue	des Accacias	75000	paris
1	512	68	boulevard	de la Libération	10000	troyes
2	512	62	rue	des Accacias	10000	troyes
1	513	56	impasse	de la Libération	06000	nice
2	513	48	place	de la Libération	52000	chaumont
1	514	25	impasse	Jules Verne	10000	troyes
2	514	38	boulevard	des Accacias	06000	nice
1	515	54	rue	de la Libération	10000	troyes
2	515	39	place	du Paradis	52000	chaumont
3	515	35	rue	du Marché	06000	nice
1	516	78	place	Jean Mermoz	52000	chaumont
2	516	46	avenue	de la Libération	52000	chaumont
1	517	46	boulevard	Jules Verne	10000	troyes
2	517	36	boulevard	Victor Hugo	06000	nice
1	518	18	avenue	du Paradis	74000	annecy
2	518	31	rue	Jules Verne	74000	annecy
1	519	52	rue	Jean Mermoz	06000	nice
2	519	71	boulevard	Jean Mermoz	10000	troyes
1	520	47	impasse	de la République	10000	troyes
2	520	60	allée	du Paradis	10000	troyes
1	521	10	allée	Victor Hugo	10000	troyes
2	521	43	rue	des Accacias	74000	annecy
3	521	23	impasse	Jules Verne	74000	annecy
1	522	38	allée	du Paradis	06000	nice
1	523	24	avenue	de la République	52000	chaumont
1	524	79	place	de la Libération	06000	nice
2	524	65	impasse	du Paradis	75000	paris
3	524	1	boulevard	de la Libération	10000	troyes
1	525	50	impasse	du Paradis	06000	nice
2	525	4	place	du Paradis	51100	reims
3	525	33	boulevard	du Paradis	10000	troyes
1	526	75	boulevard	Jean Mermoz	06000	nice
2	526	46	place	de la République	06000	nice
1	527	11	boulevard	du Paradis	75000	paris
2	527	8	boulevard	du Paradis	06000	nice
1	528	31	impasse	Victor Hugo	06000	nice
2	528	63	place	de la Libération	74000	annecy
3	528	2	rue	du Paradis	10000	troyes
1	529	73	boulevard	des Accacias	10000	troyes
2	529	65	avenue	de la République	74000	annecy
1	530	0	allée	Jean Mermoz	51100	reims
2	530	35	boulevard	de la Libération	52000	chaumont
1	531	46	place	de la Libération	06000	nice
1	532	36	boulevard	de la République	74000	annecy
2	532	74	place	du Marché	52000	chaumont
1	533	42	impasse	Jules Verne	52000	chaumont
1	534	14	place	de la Libération	74000	annecy
2	534	45	rue	des Accacias	06000	nice
1	535	38	boulevard	de la République	74000	annecy
2	535	43	allée	du Paradis	75000	paris
1	536	38	allée	Victor Hugo	10000	troyes
1	537	34	avenue	Jean Mermoz	52000	chaumont
2	537	17	place	du Marché	06000	nice
1	538	42	boulevard	du Paradis	75000	paris
2	538	41	avenue	Victor Hugo	75000	paris
3	538	24	boulevard	Jean Mermoz	52000	chaumont
1	539	24	boulevard	Jean Mermoz	74000	annecy
2	539	33	avenue	du Paradis	52000	chaumont
3	539	48	rue	Jean Mermoz	52000	chaumont
1	540	36	impasse	Jean Mermoz	75000	paris
1	541	29	boulevard	du Marché	10000	troyes
2	541	12	boulevard	Victor Hugo	74000	annecy
1	542	69	place	de la République	06000	nice
1	543	35	avenue	de la Libération	06000	nice
1	544	27	boulevard	Jules Verne	06000	nice
2	544	41	allée	du Marché	74000	annecy
3	544	14	boulevard	du Paradis	10000	troyes
1	545	14	impasse	du Paradis	06000	nice
2	545	7	allée	de la République	74000	annecy
1	546	42	place	de la Libération	51100	reims
1	547	25	avenue	de la République	06000	nice
2	547	41	avenue	de la Libération	52000	chaumont
1	548	67	impasse	de la Libération	74000	annecy
1	549	26	place	des Accacias	10000	troyes
1	550	80	place	du Marché	52000	chaumont
1	551	29	boulevard	des Accacias	06000	nice
1	552	57	boulevard	Jean Mermoz	10000	troyes
1	553	71	place	de la République	51100	reims
1	554	18	allée	Victor Hugo	51100	reims
2	554	40	boulevard	de la Libération	74000	annecy
1	555	37	avenue	Jules Verne	75000	paris
2	555	27	rue	Jules Verne	51100	reims
1	556	22	place	du Marché	06000	nice
2	556	31	impasse	des Accacias	10000	troyes
3	556	8	avenue	Jean Mermoz	75000	paris
1	557	39	impasse	de la Libération	75000	paris
2	557	68	place	Jules Verne	74000	annecy
1	558	47	impasse	Jean Mermoz	74000	annecy
2	558	8	allée	Victor Hugo	10000	troyes
3	558	73	impasse	du Paradis	51100	reims
1	559	56	place	Victor Hugo	10000	troyes
2	559	16	impasse	du Paradis	06000	nice
1	560	33	impasse	du Paradis	06000	nice
2	560	61	impasse	de la Libération	74000	annecy
3	560	43	boulevard	de la Libération	74000	annecy
1	561	25	impasse	du Paradis	51100	reims
1	562	65	boulevard	de la Libération	75000	paris
2	562	53	place	du Marché	74000	annecy
3	562	51	allée	des Accacias	06000	nice
1	563	51	place	de la Libération	52000	chaumont
2	563	22	place	Jean Mermoz	74000	annecy
1	564	51	boulevard	Jules Verne	06000	nice
2	564	50	allée	du Paradis	52000	chaumont
1	565	6	rue	de la République	51100	reims
1	566	4	allée	Victor Hugo	74000	annecy
2	566	6	place	de la République	10000	troyes
3	566	29	impasse	Jules Verne	51100	reims
1	567	76	boulevard	du Marché	51100	reims
2	567	36	impasse	Jean Mermoz	75000	paris
1	568	79	place	du Paradis	10000	troyes
1	569	4	boulevard	de la République	51100	reims
2	569	69	boulevard	Victor Hugo	10000	troyes
1	570	41	impasse	du Paradis	10000	troyes
2	570	47	avenue	de la République	06000	nice
3	570	4	place	de la République	75000	paris
1	571	50	allée	Jean Mermoz	52000	chaumont
2	571	2	avenue	de la République	74000	annecy
3	571	34	impasse	de la République	06000	nice
1	572	74	avenue	du Marché	74000	annecy
2	572	2	avenue	Jules Verne	06000	nice
3	572	23	boulevard	Jean Mermoz	74000	annecy
1	573	61	rue	Jules Verne	74000	annecy
2	573	62	impasse	du Paradis	06000	nice
1	574	65	impasse	de la Libération	52000	chaumont
2	574	6	allée	de la Libération	06000	nice
3	574	68	place	de la Libération	51100	reims
1	575	74	boulevard	Jean Mermoz	75000	paris
2	575	11	boulevard	du Paradis	75000	paris
1	576	41	boulevard	de la Libération	52000	chaumont
1	577	42	boulevard	des Accacias	52000	chaumont
2	577	64	avenue	du Marché	74000	annecy
1	578	57	impasse	de la Libération	51100	reims
1	579	65	place	Jules Verne	52000	chaumont
2	579	41	place	de la Libération	52000	chaumont
1	580	57	impasse	Jules Verne	10000	troyes
2	580	43	place	Jean Mermoz	10000	troyes
3	580	48	place	Victor Hugo	52000	chaumont
1	581	54	boulevard	du Paradis	10000	troyes
2	581	19	place	du Paradis	10000	troyes
3	581	67	place	de la Libération	52000	chaumont
1	582	25	place	du Paradis	51100	reims
2	582	36	place	des Accacias	10000	troyes
1	583	63	avenue	Jean Mermoz	74000	annecy
2	583	24	place	Victor Hugo	51100	reims
1	584	25	place	du Paradis	06000	nice
1	585	6	avenue	de la Libération	10000	troyes
2	585	61	boulevard	de la Libération	74000	annecy
1	586	30	rue	Jules Verne	52000	chaumont
1	587	38	boulevard	Victor Hugo	52000	chaumont
1	588	21	rue	de la Libération	52000	chaumont
2	588	47	boulevard	du Marché	52000	chaumont
1	589	18	rue	du Marché	52000	chaumont
2	589	23	impasse	des Accacias	06000	nice
1	590	24	impasse	Jean Mermoz	10000	troyes
2	590	39	allée	Victor Hugo	52000	chaumont
1	591	2	place	Jean Mermoz	74000	annecy
2	591	60	rue	Victor Hugo	52000	chaumont
1	592	8	impasse	Victor Hugo	52000	chaumont
2	592	74	avenue	Victor Hugo	10000	troyes
3	592	78	impasse	Jean Mermoz	10000	troyes
1	593	9	boulevard	Victor Hugo	10000	troyes
2	593	0	allée	de la Libération	52000	chaumont
1	594	2	place	de la République	51100	reims
2	594	4	avenue	des Accacias	51100	reims
1	595	63	boulevard	de la République	06000	nice
1	596	57	rue	Jean Mermoz	06000	nice
1	597	28	boulevard	de la Libération	10000	troyes
2	597	37	impasse	du Marché	75000	paris
3	597	79	place	des Accacias	51100	reims
1	598	70	boulevard	de la République	74000	annecy
2	598	26	boulevard	Victor Hugo	51100	reims
1	599	78	allée	du Paradis	10000	troyes
2	599	58	place	de la République	10000	troyes
3	599	78	place	du Marché	51100	reims
1	600	59	boulevard	de la République	10000	troyes
2	600	72	impasse	de la République	06000	nice
1	601	12	allée	Victor Hugo	74000	annecy
2	601	63	place	des Accacias	74000	annecy
1	602	5	impasse	Jean Mermoz	06000	nice
2	602	79	avenue	des Accacias	52000	chaumont
1	603	55	impasse	Jules Verne	06000	nice
2	603	33	place	Jean Mermoz	52000	chaumont
1	604	45	impasse	Victor Hugo	74000	annecy
1	605	11	allée	du Marché	52000	chaumont
2	605	60	place	Victor Hugo	52000	chaumont
1	606	17	place	de la Libération	74000	annecy
2	606	10	allée	Jean Mermoz	10000	troyes
1	607	48	rue	Jules Verne	75000	paris
1	608	67	place	Jean Mermoz	06000	nice
2	608	24	rue	de la République	74000	annecy
3	608	38	avenue	de la République	10000	troyes
1	609	46	impasse	des Accacias	74000	annecy
2	609	67	rue	Jules Verne	10000	troyes
1	610	54	place	Jules Verne	10000	troyes
1	611	13	impasse	du Marché	75000	paris
2	611	61	impasse	de la Libération	52000	chaumont
1	612	66	rue	de la République	06000	nice
1	613	19	impasse	de la Libération	74000	annecy
1	614	62	boulevard	Victor Hugo	74000	annecy
1	615	20	avenue	du Paradis	10000	troyes
2	615	74	boulevard	de la République	52000	chaumont
1	616	49	place	Victor Hugo	51100	reims
2	616	4	boulevard	du Paradis	10000	troyes
1	617	26	place	Jean Mermoz	06000	nice
1	618	25	place	du Paradis	51100	reims
2	618	60	rue	des Accacias	52000	chaumont
3	618	76	allée	Jean Mermoz	52000	chaumont
1	619	19	impasse	de la Libération	06000	nice
2	619	43	place	de la République	52000	chaumont
3	619	8	rue	Jean Mermoz	06000	nice
1	620	54	allée	du Paradis	06000	nice
2	620	69	place	du Paradis	74000	annecy
1	621	20	boulevard	de la Libération	10000	troyes
1	622	42	place	Victor Hugo	10000	troyes
2	622	40	avenue	Jean Mermoz	52000	chaumont
1	623	29	boulevard	Jules Verne	74000	annecy
2	623	69	impasse	des Accacias	52000	chaumont
3	623	32	allée	des Accacias	10000	troyes
1	624	67	impasse	du Marché	06000	nice
2	624	47	allée	de la République	52000	chaumont
1	625	20	place	Victor Hugo	51100	reims
2	625	55	impasse	Jean Mermoz	06000	nice
3	625	26	place	Jules Verne	51100	reims
1	626	42	impasse	du Marché	52000	chaumont
2	626	35	place	des Accacias	74000	annecy
3	626	8	boulevard	des Accacias	75000	paris
1	627	4	place	Victor Hugo	06000	nice
2	627	12	boulevard	Victor Hugo	10000	troyes
1	628	40	place	du Paradis	10000	troyes
2	628	55	boulevard	de la Libération	74000	annecy
1	629	69	impasse	de la République	51100	reims
1	630	73	avenue	du Paradis	51100	reims
1	631	77	place	Jean Mermoz	52000	chaumont
2	631	38	place	du Paradis	06000	nice
1	632	71	avenue	du Marché	10000	troyes
2	632	25	place	de la Libération	52000	chaumont
1	633	70	place	des Accacias	10000	troyes
2	633	25	place	du Paradis	52000	chaumont
1	634	14	place	de la République	10000	troyes
2	634	79	avenue	Jules Verne	52000	chaumont
3	634	49	boulevard	Jean Mermoz	75000	paris
1	635	38	boulevard	Victor Hugo	75000	paris
2	635	26	avenue	de la Libération	75000	paris
1	636	54	avenue	de la Libération	52000	chaumont
1	637	43	avenue	Jean Mermoz	06000	nice
1	638	30	allée	Jean Mermoz	06000	nice
2	638	53	place	du Paradis	10000	troyes
3	638	73	avenue	de la République	52000	chaumont
1	639	51	avenue	Victor Hugo	51100	reims
2	639	41	allée	Victor Hugo	10000	troyes
1	640	44	impasse	du Paradis	75000	paris
2	640	46	place	Jules Verne	52000	chaumont
1	641	8	boulevard	des Accacias	10000	troyes
2	641	29	place	Jules Verne	06000	nice
1	642	68	avenue	de la Libération	75000	paris
2	642	18	rue	de la République	75000	paris
1	643	9	place	des Accacias	06000	nice
2	643	52	rue	Jules Verne	74000	annecy
1	644	78	rue	du Paradis	74000	annecy
2	644	27	boulevard	Jean Mermoz	51100	reims
1	645	5	place	de la Libération	51100	reims
2	645	56	impasse	du Paradis	10000	troyes
1	646	32	avenue	du Paradis	52000	chaumont
1	647	21	avenue	de la République	52000	chaumont
2	647	23	boulevard	Victor Hugo	75000	paris
1	648	6	impasse	de la Libération	52000	chaumont
2	648	24	rue	de la Libération	51100	reims
1	649	63	allée	Victor Hugo	74000	annecy
2	649	34	impasse	de la Libération	10000	troyes
3	649	41	allée	du Paradis	51100	reims
1	650	28	impasse	de la Libération	74000	annecy
2	650	3	impasse	Jean Mermoz	74000	annecy
1	651	26	boulevard	de la République	06000	nice
2	651	56	avenue	Jules Verne	51100	reims
1	652	26	avenue	de la Libération	74000	annecy
2	652	66	boulevard	Jean Mermoz	75000	paris
1	653	78	place	Victor Hugo	51100	reims
2	653	77	boulevard	de la Libération	06000	nice
3	653	53	avenue	de la Libération	10000	troyes
1	654	10	allée	Victor Hugo	74000	annecy
1	655	0	impasse	du Paradis	52000	chaumont
2	655	49	avenue	Jules Verne	06000	nice
1	656	79	place	du Paradis	51100	reims
1	657	29	avenue	de la République	52000	chaumont
2	657	68	boulevard	du Marché	52000	chaumont
1	658	16	boulevard	de la République	10000	troyes
2	658	62	avenue	de la République	75000	paris
1	659	57	impasse	de la République	06000	nice
2	659	12	impasse	Victor Hugo	10000	troyes
1	660	20	allée	du Paradis	10000	troyes
1	661	43	avenue	du Marché	51100	reims
1	662	34	place	du Paradis	74000	annecy
2	662	37	allée	Victor Hugo	74000	annecy
1	663	51	boulevard	de la Libération	52000	chaumont
2	663	58	impasse	de la Libération	74000	annecy
1	664	27	impasse	du Marché	75000	paris
2	664	5	boulevard	Jean Mermoz	51100	reims
1	665	57	place	de la République	75000	paris
2	665	17	impasse	Jean Mermoz	75000	paris
1	666	25	impasse	du Marché	74000	annecy
2	666	11	boulevard	de la République	74000	annecy
3	666	45	avenue	Victor Hugo	74000	annecy
1	667	45	allée	de la République	75000	paris
2	667	61	impasse	Jules Verne	75000	paris
1	668	35	avenue	Jules Verne	06000	nice
2	668	23	boulevard	des Accacias	10000	troyes
3	668	73	impasse	de la Libération	52000	chaumont
1	669	43	avenue	de la République	52000	chaumont
2	669	69	avenue	Jules Verne	52000	chaumont
1	670	21	place	de la Libération	75000	paris
2	670	5	place	des Accacias	10000	troyes
1	671	2	boulevard	du Paradis	10000	troyes
2	671	51	boulevard	du Paradis	75000	paris
3	671	73	rue	de la République	10000	troyes
1	672	8	boulevard	Victor Hugo	06000	nice
2	672	45	avenue	du Paradis	74000	annecy
1	673	38	boulevard	du Paradis	52000	chaumont
1	674	49	place	du Paradis	06000	nice
2	674	64	boulevard	Jean Mermoz	52000	chaumont
3	674	27	boulevard	Victor Hugo	06000	nice
1	675	78	impasse	du Paradis	52000	chaumont
2	675	58	allée	Jean Mermoz	10000	troyes
1	676	73	rue	Jules Verne	74000	annecy
2	676	48	place	de la République	74000	annecy
3	676	9	allée	de la Libération	10000	troyes
1	677	23	place	des Accacias	74000	annecy
2	677	5	boulevard	de la République	74000	annecy
1	678	33	boulevard	Jean Mermoz	75000	paris
2	678	75	avenue	de la République	06000	nice
1	679	37	impasse	du Paradis	75000	paris
2	679	2	allée	Jean Mermoz	74000	annecy
3	679	1	boulevard	Jean Mermoz	10000	troyes
1	680	7	boulevard	Jules Verne	52000	chaumont
2	680	67	boulevard	Jules Verne	74000	annecy
3	680	23	avenue	Jules Verne	75000	paris
1	681	56	avenue	de la Libération	75000	paris
2	681	11	impasse	Jean Mermoz	74000	annecy
1	682	15	avenue	de la République	10000	troyes
2	682	64	rue	de la Libération	10000	troyes
1	683	32	avenue	Jean Mermoz	10000	troyes
2	683	50	rue	Jules Verne	74000	annecy
1	684	55	place	de la République	75000	paris
2	684	12	allée	du Paradis	74000	annecy
1	685	11	rue	de la Libération	75000	paris
2	685	7	allée	Jules Verne	75000	paris
3	685	3	place	Jules Verne	10000	troyes
1	686	59	impasse	Jean Mermoz	74000	annecy
1	687	73	boulevard	Jules Verne	75000	paris
2	687	55	rue	du Marché	75000	paris
3	687	63	avenue	Victor Hugo	10000	troyes
1	688	76	boulevard	du Paradis	75000	paris
2	688	20	impasse	de la Libération	52000	chaumont
1	689	7	avenue	Jean Mermoz	74000	annecy
2	689	40	boulevard	Victor Hugo	51100	reims
1	690	52	place	du Marché	74000	annecy
2	690	41	rue	Jean Mermoz	74000	annecy
1	691	25	impasse	Jean Mermoz	10000	troyes
1	692	39	place	du Paradis	51100	reims
1	693	48	rue	du Paradis	10000	troyes
2	693	3	boulevard	Jules Verne	51100	reims
1	694	76	place	de la Libération	10000	troyes
1	695	44	impasse	Victor Hugo	74000	annecy
2	695	16	place	Jules Verne	06000	nice
3	695	12	impasse	de la République	51100	reims
1	696	17	boulevard	des Accacias	06000	nice
2	696	14	rue	du Marché	52000	chaumont
1	697	37	impasse	de la République	06000	nice
2	697	76	boulevard	des Accacias	75000	paris
3	697	20	boulevard	Victor Hugo	52000	chaumont
1	698	68	boulevard	du Paradis	06000	nice
2	698	40	impasse	de la République	52000	chaumont
1	699	49	rue	Jules Verne	52000	chaumont
2	699	4	boulevard	du Paradis	52000	chaumont
1	700	54	avenue	du Paradis	06000	nice
2	700	57	impasse	de la République	74000	annecy
1	701	24	impasse	Jean Mermoz	10000	troyes
1	702	78	boulevard	Jean Mermoz	10000	troyes
1	703	6	impasse	Jean Mermoz	06000	nice
2	703	63	place	Victor Hugo	52000	chaumont
1	704	58	place	Jules Verne	75000	paris
1	705	37	boulevard	Jean Mermoz	10000	troyes
2	705	77	boulevard	Jules Verne	51100	reims
1	706	12	boulevard	Jean Mermoz	10000	troyes
2	706	16	boulevard	de la République	52000	chaumont
3	706	67	rue	Jean Mermoz	51100	reims
1	707	65	avenue	Jean Mermoz	06000	nice
2	707	14	impasse	des Accacias	74000	annecy
1	708	35	boulevard	du Paradis	74000	annecy
2	708	33	place	du Marché	06000	nice
1	709	75	rue	de la Libération	06000	nice
2	709	48	boulevard	de la Libération	74000	annecy
3	709	29	avenue	Jules Verne	52000	chaumont
1	710	59	avenue	Jean Mermoz	52000	chaumont
2	710	43	avenue	Jules Verne	74000	annecy
1	711	25	avenue	du Paradis	75000	paris
2	711	72	boulevard	Jean Mermoz	10000	troyes
3	711	4	rue	du Marché	74000	annecy
1	712	5	avenue	des Accacias	10000	troyes
1	713	0	boulevard	de la République	06000	nice
1	714	38	place	du Paradis	51100	reims
1	715	9	boulevard	du Paradis	10000	troyes
2	715	59	rue	de la République	10000	troyes
3	715	13	allée	de la République	51100	reims
1	716	28	allée	de la Libération	06000	nice
2	716	1	rue	de la République	10000	troyes
1	717	76	avenue	Victor Hugo	06000	nice
2	717	34	impasse	Jean Mermoz	51100	reims
3	717	5	rue	Jules Verne	52000	chaumont
1	718	0	rue	Jules Verne	10000	troyes
2	718	47	place	du Paradis	10000	troyes
1	719	63	avenue	de la Libération	06000	nice
2	719	40	impasse	Jules Verne	10000	troyes
1	720	80	rue	des Accacias	74000	annecy
2	720	6	boulevard	du Marché	51100	reims
3	720	74	place	Victor Hugo	06000	nice
1	721	73	boulevard	de la République	06000	nice
1	722	14	place	de la République	74000	annecy
2	722	59	boulevard	du Paradis	51100	reims
1	723	72	impasse	Victor Hugo	74000	annecy
2	723	71	rue	Jean Mermoz	74000	annecy
1	724	46	rue	de la Libération	10000	troyes
1	725	73	avenue	de la Libération	74000	annecy
2	725	18	avenue	du Marché	52000	chaumont
1	726	9	avenue	du Marché	06000	nice
1	727	78	place	Victor Hugo	75000	paris
2	727	5	impasse	Victor Hugo	74000	annecy
1	728	28	avenue	Jules Verne	74000	annecy
2	728	57	impasse	du Marché	06000	nice
1	729	73	place	Jean Mermoz	75000	paris
1	730	6	avenue	du Marché	51100	reims
2	730	60	impasse	du Paradis	10000	troyes
1	731	29	avenue	du Paradis	06000	nice
2	731	15	avenue	Jean Mermoz	74000	annecy
1	732	5	boulevard	du Paradis	06000	nice
1	733	40	impasse	de la Libération	06000	nice
2	733	68	place	Jean Mermoz	52000	chaumont
1	734	33	boulevard	Jean Mermoz	51100	reims
2	734	29	place	du Paradis	06000	nice
1	735	46	avenue	de la République	10000	troyes
2	735	64	rue	Jules Verne	74000	annecy
1	736	25	boulevard	Jean Mermoz	74000	annecy
2	736	58	place	Jean Mermoz	52000	chaumont
3	736	46	avenue	du Paradis	74000	annecy
1	737	65	allée	Victor Hugo	10000	troyes
2	737	11	place	Victor Hugo	52000	chaumont
3	737	49	avenue	de la Libération	51100	reims
1	738	8	rue	Victor Hugo	75000	paris
2	738	22	impasse	du Paradis	52000	chaumont
1	739	49	impasse	de la Libération	06000	nice
2	739	13	place	de la République	51100	reims
3	739	50	impasse	Victor Hugo	74000	annecy
1	740	14	avenue	du Marché	52000	chaumont
2	740	67	allée	du Paradis	75000	paris
1	741	50	boulevard	de la République	10000	troyes
1	742	62	boulevard	de la République	10000	troyes
2	742	44	avenue	Jules Verne	74000	annecy
3	742	16	allée	de la République	51100	reims
1	743	30	avenue	du Paradis	06000	nice
1	744	1	impasse	de la République	75000	paris
2	744	65	allée	de la Libération	75000	paris
1	745	16	place	de la République	52000	chaumont
2	745	37	impasse	de la République	06000	nice
1	746	58	impasse	de la Libération	52000	chaumont
2	746	7	boulevard	Jean Mermoz	10000	troyes
1	747	62	place	Victor Hugo	74000	annecy
2	747	4	boulevard	de la République	10000	troyes
1	748	70	boulevard	Jules Verne	10000	troyes
2	748	38	boulevard	des Accacias	52000	chaumont
1	749	31	allée	des Accacias	06000	nice
1	750	31	impasse	Jean Mermoz	06000	nice
2	750	37	allée	Jean Mermoz	52000	chaumont
1	751	51	impasse	de la République	52000	chaumont
2	751	12	rue	Jean Mermoz	10000	troyes
3	751	41	boulevard	de la Libération	51100	reims
1	752	48	rue	de la Libération	51100	reims
2	752	25	avenue	de la Libération	06000	nice
1	753	77	allée	Jules Verne	74000	annecy
2	753	13	avenue	des Accacias	10000	troyes
3	753	59	boulevard	Victor Hugo	10000	troyes
1	754	69	avenue	Jean Mermoz	06000	nice
2	754	47	avenue	du Paradis	51100	reims
1	755	59	avenue	de la République	10000	troyes
2	755	9	impasse	de la République	10000	troyes
3	755	18	impasse	du Paradis	74000	annecy
1	756	34	boulevard	Victor Hugo	10000	troyes
1	757	70	impasse	de la République	51100	reims
2	757	40	place	du Paradis	52000	chaumont
1	758	41	impasse	Jules Verne	10000	troyes
2	758	73	place	de la République	51100	reims
1	759	44	impasse	Victor Hugo	10000	troyes
1	760	29	place	des Accacias	52000	chaumont
2	760	46	allée	Jules Verne	74000	annecy
3	760	77	boulevard	des Accacias	52000	chaumont
1	761	50	boulevard	des Accacias	06000	nice
2	761	20	impasse	du Paradis	74000	annecy
1	762	8	impasse	Jules Verne	52000	chaumont
2	762	1	impasse	Victor Hugo	75000	paris
1	763	78	impasse	de la Libération	10000	troyes
2	763	62	place	Victor Hugo	51100	reims
3	763	35	impasse	Jean Mermoz	75000	paris
1	764	56	rue	Jean Mermoz	52000	chaumont
2	764	42	impasse	des Accacias	74000	annecy
3	764	12	impasse	du Marché	10000	troyes
1	765	64	place	Jules Verne	75000	paris
2	765	5	rue	Jean Mermoz	06000	nice
1	766	17	impasse	Jean Mermoz	10000	troyes
2	766	29	boulevard	du Paradis	51100	reims
1	767	22	boulevard	des Accacias	74000	annecy
2	767	18	avenue	Jules Verne	10000	troyes
3	767	27	place	de la République	75000	paris
1	768	31	allée	du Paradis	10000	troyes
2	768	5	boulevard	de la Libération	52000	chaumont
1	769	13	impasse	du Paradis	51100	reims
2	769	56	avenue	Victor Hugo	51100	reims
1	770	51	impasse	Jules Verne	52000	chaumont
2	770	50	avenue	de la Libération	74000	annecy
1	771	30	avenue	Jules Verne	51100	reims
2	771	2	avenue	Victor Hugo	51100	reims
1	772	23	allée	Jean Mermoz	51100	reims
2	772	45	boulevard	de la République	52000	chaumont
1	773	54	avenue	Victor Hugo	51100	reims
2	773	11	avenue	des Accacias	51100	reims
3	773	71	place	Victor Hugo	52000	chaumont
1	774	23	avenue	Victor Hugo	06000	nice
1	775	9	place	Jean Mermoz	75000	paris
2	775	18	place	de la Libération	10000	troyes
1	776	2	boulevard	Victor Hugo	10000	troyes
2	776	47	boulevard	Jean Mermoz	52000	chaumont
1	777	27	rue	de la République	06000	nice
2	777	33	avenue	du Paradis	51100	reims
1	778	74	avenue	du Paradis	52000	chaumont
1	779	79	boulevard	Jean Mermoz	74000	annecy
2	779	57	avenue	du Marché	10000	troyes
3	779	57	boulevard	Jean Mermoz	74000	annecy
1	780	54	place	Jean Mermoz	10000	troyes
2	780	43	impasse	Victor Hugo	75000	paris
1	781	12	rue	Jules Verne	52000	chaumont
2	781	64	impasse	du Marché	06000	nice
3	781	60	avenue	Jean Mermoz	52000	chaumont
1	782	59	avenue	des Accacias	10000	troyes
2	782	66	avenue	de la Libération	52000	chaumont
1	783	31	avenue	du Paradis	75000	paris
1	784	25	impasse	du Paradis	51100	reims
2	784	78	impasse	Jean Mermoz	06000	nice
1	785	32	avenue	de la République	10000	troyes
2	785	32	impasse	des Accacias	10000	troyes
1	786	42	avenue	de la République	74000	annecy
2	786	20	boulevard	Jean Mermoz	06000	nice
3	786	50	impasse	de la République	75000	paris
1	787	52	place	de la République	74000	annecy
2	787	26	allée	des Accacias	74000	annecy
1	788	22	boulevard	de la République	74000	annecy
2	788	21	impasse	du Paradis	51100	reims
1	789	73	avenue	du Paradis	75000	paris
2	789	11	boulevard	de la République	52000	chaumont
3	789	9	avenue	du Marché	74000	annecy
1	790	31	avenue	Jean Mermoz	06000	nice
2	790	71	impasse	de la Libération	74000	annecy
1	791	22	place	Jules Verne	10000	troyes
2	791	42	place	Jules Verne	06000	nice
3	791	20	rue	du Paradis	06000	nice
1	792	63	impasse	du Paradis	52000	chaumont
2	792	57	boulevard	de la République	74000	annecy
1	793	18	place	Jean Mermoz	52000	chaumont
2	793	61	boulevard	Jules Verne	74000	annecy
3	793	19	impasse	des Accacias	51100	reims
1	794	56	boulevard	des Accacias	10000	troyes
2	794	13	boulevard	de la Libération	74000	annecy
3	794	31	avenue	Jules Verne	52000	chaumont
1	795	12	impasse	de la Libération	74000	annecy
2	795	40	impasse	de la Libération	06000	nice
1	796	47	avenue	Jean Mermoz	06000	nice
2	796	32	impasse	Victor Hugo	51100	reims
1	797	4	place	de la République	75000	paris
1	798	26	place	Jules Verne	10000	troyes
1	799	14	boulevard	des Accacias	75000	paris
2	799	31	allée	du Paradis	74000	annecy
1	800	60	place	de la Libération	75000	paris
2	800	1	place	Jules Verne	06000	nice
3	800	63	boulevard	de la Libération	10000	troyes
1	801	28	boulevard	Victor Hugo	10000	troyes
2	801	56	avenue	Jean Mermoz	10000	troyes
1	802	66	boulevard	de la République	74000	annecy
1	803	41	avenue	Jules Verne	10000	troyes
2	803	26	impasse	Jules Verne	51100	reims
1	804	58	allée	Victor Hugo	74000	annecy
1	805	74	place	Jules Verne	75000	paris
2	805	67	place	Victor Hugo	74000	annecy
3	805	64	place	de la Libération	75000	paris
1	806	79	place	de la Libération	75000	paris
1	807	49	place	Jean Mermoz	06000	nice
2	807	8	boulevard	du Paradis	75000	paris
1	808	23	place	Jean Mermoz	52000	chaumont
2	808	13	place	Jules Verne	74000	annecy
1	809	18	place	Victor Hugo	74000	annecy
1	810	53	place	du Paradis	75000	paris
2	810	67	impasse	Jean Mermoz	75000	paris
1	811	79	impasse	de la République	52000	chaumont
1	812	29	place	Jules Verne	52000	chaumont
2	812	62	impasse	Victor Hugo	74000	annecy
3	812	26	avenue	de la Libération	75000	paris
1	813	68	impasse	de la République	10000	troyes
2	813	26	impasse	Jules Verne	06000	nice
1	814	46	impasse	de la République	52000	chaumont
2	814	35	avenue	Jules Verne	74000	annecy
1	815	29	place	du Paradis	52000	chaumont
2	815	59	allée	des Accacias	06000	nice
3	815	2	avenue	du Marché	74000	annecy
1	816	23	boulevard	du Marché	10000	troyes
2	816	56	allée	du Paradis	10000	troyes
3	816	69	boulevard	de la Libération	52000	chaumont
1	817	46	allée	de la Libération	10000	troyes
1	818	30	avenue	du Paradis	52000	chaumont
2	818	80	boulevard	Jean Mermoz	51100	reims
3	818	68	avenue	de la République	52000	chaumont
1	819	74	avenue	Jean Mermoz	74000	annecy
2	819	22	impasse	du Paradis	52000	chaumont
3	819	61	allée	du Paradis	52000	chaumont
1	820	7	impasse	Victor Hugo	10000	troyes
2	820	22	allée	de la République	10000	troyes
1	821	49	place	Jean Mermoz	74000	annecy
2	821	14	avenue	Jean Mermoz	10000	troyes
3	821	50	place	de la République	52000	chaumont
1	822	21	rue	Jules Verne	52000	chaumont
2	822	31	impasse	Jules Verne	75000	paris
1	823	24	boulevard	du Marché	52000	chaumont
2	823	52	impasse	Jules Verne	74000	annecy
1	824	75	avenue	Jean Mermoz	06000	nice
1	825	28	boulevard	de la Libération	10000	troyes
2	825	13	impasse	Jules Verne	10000	troyes
3	825	10	allée	du Marché	52000	chaumont
1	826	38	place	du Paradis	06000	nice
2	826	28	boulevard	de la Libération	52000	chaumont
3	826	59	boulevard	du Marché	52000	chaumont
1	827	35	allée	de la Libération	74000	annecy
2	827	56	rue	Jules Verne	10000	troyes
1	828	58	impasse	du Marché	51100	reims
1	829	37	avenue	du Paradis	52000	chaumont
1	830	39	avenue	de la République	75000	paris
1	831	21	allée	du Marché	52000	chaumont
1	832	11	impasse	Jean Mermoz	52000	chaumont
2	832	16	rue	Jules Verne	51100	reims
3	832	64	boulevard	Victor Hugo	52000	chaumont
1	833	11	boulevard	de la République	06000	nice
2	833	17	impasse	de la République	74000	annecy
1	834	21	boulevard	de la République	52000	chaumont
2	834	23	avenue	du Paradis	06000	nice
1	835	73	avenue	Jean Mermoz	06000	nice
1	836	41	avenue	de la Libération	06000	nice
2	836	52	boulevard	Victor Hugo	75000	paris
1	837	58	avenue	du Paradis	06000	nice
2	837	30	boulevard	Jules Verne	52000	chaumont
3	837	41	boulevard	du Paradis	10000	troyes
1	838	44	avenue	des Accacias	74000	annecy
1	839	30	place	du Paradis	10000	troyes
2	839	77	place	Jules Verne	74000	annecy
1	840	34	rue	Victor Hugo	52000	chaumont
1	841	3	impasse	du Marché	06000	nice
2	841	5	allée	de la Libération	74000	annecy
1	842	39	avenue	du Paradis	51100	reims
2	842	31	boulevard	des Accacias	10000	troyes
1	843	43	impasse	Jules Verne	10000	troyes
2	843	39	place	Victor Hugo	74000	annecy
1	844	68	avenue	des Accacias	10000	troyes
2	844	59	boulevard	de la Libération	75000	paris
1	845	36	allée	du Marché	52000	chaumont
2	845	68	boulevard	Jules Verne	51100	reims
3	845	74	avenue	de la République	10000	troyes
1	846	68	avenue	des Accacias	51100	reims
2	846	47	boulevard	de la Libération	75000	paris
1	847	61	avenue	de la Libération	75000	paris
2	847	65	place	de la République	74000	annecy
1	848	18	place	Victor Hugo	06000	nice
1	849	9	avenue	Jules Verne	06000	nice
2	849	61	boulevard	de la Libération	06000	nice
1	850	42	allée	Victor Hugo	06000	nice
2	850	14	boulevard	Jean Mermoz	52000	chaumont
1	851	36	place	du Paradis	52000	chaumont
2	851	4	impasse	Victor Hugo	52000	chaumont
3	851	37	rue	du Marché	52000	chaumont
1	852	37	rue	de la Libération	75000	paris
2	852	18	allée	des Accacias	74000	annecy
1	853	51	avenue	des Accacias	06000	nice
2	853	74	impasse	Jules Verne	75000	paris
3	853	4	place	Jules Verne	51100	reims
1	854	40	rue	du Paradis	51100	reims
1	855	50	avenue	Victor Hugo	51100	reims
2	855	43	impasse	du Paradis	06000	nice
3	855	48	avenue	de la Libération	74000	annecy
1	856	39	avenue	de la Libération	10000	troyes
2	856	1	place	Jean Mermoz	74000	annecy
1	857	57	rue	du Paradis	10000	troyes
2	857	31	place	de la République	52000	chaumont
1	858	61	avenue	du Paradis	06000	nice
1	859	18	rue	du Paradis	74000	annecy
2	859	30	rue	Victor Hugo	51100	reims
1	860	21	allée	Jean Mermoz	75000	paris
2	860	21	impasse	des Accacias	75000	paris
1	861	32	impasse	de la République	51100	reims
2	861	3	impasse	Jean Mermoz	51100	reims
1	862	59	impasse	Jean Mermoz	51100	reims
2	862	61	place	de la République	10000	troyes
1	863	40	place	de la Libération	06000	nice
2	863	58	impasse	du Paradis	74000	annecy
1	864	14	impasse	Jules Verne	52000	chaumont
1	865	23	impasse	du Paradis	52000	chaumont
2	865	49	avenue	du Marché	10000	troyes
1	866	21	place	de la République	52000	chaumont
2	866	80	boulevard	Jules Verne	10000	troyes
3	866	53	avenue	du Paradis	10000	troyes
1	867	21	place	Jean Mermoz	06000	nice
2	867	30	avenue	du Paradis	52000	chaumont
3	867	39	boulevard	des Accacias	52000	chaumont
1	868	7	avenue	Jules Verne	10000	troyes
1	869	19	place	Jean Mermoz	10000	troyes
1	870	69	place	de la République	74000	annecy
2	870	24	place	Jules Verne	06000	nice
1	871	75	rue	de la Libération	10000	troyes
2	871	77	impasse	Jules Verne	52000	chaumont
1	872	73	rue	de la Libération	10000	troyes
2	872	31	boulevard	Jules Verne	06000	nice
1	873	28	rue	des Accacias	52000	chaumont
2	873	53	place	de la Libération	51100	reims
3	873	76	place	Victor Hugo	75000	paris
1	874	49	impasse	Jules Verne	74000	annecy
2	874	71	avenue	des Accacias	06000	nice
1	875	36	boulevard	du Paradis	06000	nice
1	876	47	impasse	Jules Verne	75000	paris
2	876	21	avenue	des Accacias	52000	chaumont
1	877	39	boulevard	Jean Mermoz	74000	annecy
2	877	47	avenue	Jules Verne	10000	troyes
1	878	49	impasse	de la République	10000	troyes
2	878	25	boulevard	Victor Hugo	51100	reims
1	879	7	rue	de la Libération	74000	annecy
1	880	9	allée	de la Libération	52000	chaumont
1	881	8	avenue	des Accacias	10000	troyes
2	881	52	place	du Paradis	10000	troyes
3	881	67	impasse	des Accacias	74000	annecy
1	882	59	allée	de la Libération	10000	troyes
1	883	65	impasse	Jules Verne	52000	chaumont
2	883	17	allée	de la République	74000	annecy
3	883	9	place	Jean Mermoz	10000	troyes
1	884	6	avenue	Victor Hugo	52000	chaumont
2	884	40	avenue	Victor Hugo	52000	chaumont
1	885	71	impasse	Jules Verne	75000	paris
1	886	59	impasse	Jean Mermoz	74000	annecy
2	886	60	boulevard	Jean Mermoz	52000	chaumont
1	887	55	impasse	Jules Verne	74000	annecy
2	887	50	avenue	de la République	75000	paris
1	888	41	impasse	des Accacias	74000	annecy
2	888	62	boulevard	Jules Verne	06000	nice
3	888	35	avenue	Jules Verne	75000	paris
1	889	51	boulevard	du Paradis	06000	nice
2	889	37	avenue	de la République	52000	chaumont
1	890	76	allée	des Accacias	06000	nice
1	891	62	boulevard	Victor Hugo	10000	troyes
2	891	75	allée	Victor Hugo	51100	reims
3	891	45	rue	du Paradis	51100	reims
1	892	9	boulevard	du Paradis	52000	chaumont
2	892	15	boulevard	du Paradis	75000	paris
1	893	22	impasse	Jules Verne	75000	paris
2	893	1	allée	de la République	10000	troyes
3	893	20	place	Jules Verne	10000	troyes
1	894	48	avenue	du Paradis	10000	troyes
2	894	55	avenue	du Marché	74000	annecy
1	895	3	avenue	Jean Mermoz	06000	nice
2	895	53	place	Victor Hugo	06000	nice
1	896	2	rue	des Accacias	06000	nice
2	896	52	place	Jules Verne	51100	reims
1	897	10	boulevard	de la Libération	75000	paris
2	897	23	impasse	du Paradis	74000	annecy
1	898	53	place	Jules Verne	52000	chaumont
2	898	44	impasse	Jules Verne	06000	nice
1	899	21	allée	Jules Verne	51100	reims
2	899	37	boulevard	de la Libération	10000	troyes
1	900	60	boulevard	Jules Verne	51100	reims
2	900	1	rue	de la Libération	52000	chaumont
3	900	12	boulevard	Jules Verne	10000	troyes
1	901	45	place	des Accacias	74000	annecy
2	901	47	impasse	Jules Verne	74000	annecy
1	902	44	impasse	du Paradis	10000	troyes
2	902	13	boulevard	Jules Verne	75000	paris
1	903	31	place	des Accacias	52000	chaumont
2	903	48	impasse	de la Libération	10000	troyes
1	904	72	impasse	de la Libération	75000	paris
2	904	22	boulevard	Jules Verne	52000	chaumont
1	905	31	place	Jules Verne	74000	annecy
2	905	63	boulevard	Victor Hugo	06000	nice
3	905	20	impasse	Jules Verne	52000	chaumont
1	906	2	place	du Marché	75000	paris
2	906	30	boulevard	Jean Mermoz	06000	nice
1	907	35	boulevard	Jean Mermoz	51100	reims
2	907	49	place	Jean Mermoz	06000	nice
3	907	31	avenue	du Paradis	52000	chaumont
1	908	65	allée	de la République	06000	nice
2	908	51	rue	Jean Mermoz	06000	nice
1	909	79	place	de la République	74000	annecy
2	909	12	boulevard	de la Libération	74000	annecy
1	910	5	boulevard	du Paradis	74000	annecy
2	910	65	boulevard	Jules Verne	06000	nice
1	911	74	impasse	de la Libération	52000	chaumont
2	911	35	avenue	des Accacias	51100	reims
3	911	26	boulevard	de la Libération	10000	troyes
1	912	42	impasse	des Accacias	74000	annecy
2	912	67	avenue	Jean Mermoz	10000	troyes
1	913	68	impasse	Jules Verne	52000	chaumont
2	913	76	allée	Jules Verne	74000	annecy
3	913	12	place	du Paradis	52000	chaumont
1	914	69	boulevard	Jules Verne	74000	annecy
2	914	46	boulevard	des Accacias	51100	reims
1	915	9	place	des Accacias	06000	nice
2	915	54	boulevard	des Accacias	06000	nice
1	916	9	impasse	du Paradis	74000	annecy
2	916	68	rue	Victor Hugo	10000	troyes
3	916	64	rue	du Marché	52000	chaumont
1	917	46	allée	Jean Mermoz	52000	chaumont
1	918	39	place	du Paradis	74000	annecy
1	919	5	avenue	Victor Hugo	51100	reims
1	920	6	avenue	Jean Mermoz	74000	annecy
1	921	59	rue	Jean Mermoz	52000	chaumont
1	922	14	avenue	Jules Verne	74000	annecy
1	923	40	avenue	de la République	06000	nice
2	923	50	place	du Marché	74000	annecy
1	924	29	place	de la République	52000	chaumont
2	924	67	avenue	Victor Hugo	52000	chaumont
3	924	32	avenue	Victor Hugo	51100	reims
1	925	38	boulevard	de la République	51100	reims
1	926	9	impasse	du Marché	10000	troyes
1	927	49	avenue	Victor Hugo	51100	reims
1	928	36	boulevard	Victor Hugo	52000	chaumont
2	928	34	boulevard	du Paradis	06000	nice
1	929	13	avenue	Jean Mermoz	52000	chaumont
2	929	24	avenue	de la Libération	06000	nice
1	930	73	rue	Victor Hugo	75000	paris
2	930	23	allée	des Accacias	10000	troyes
1	931	64	place	du Paradis	51100	reims
2	931	22	allée	Victor Hugo	52000	chaumont
1	932	68	rue	Victor Hugo	52000	chaumont
1	933	8	impasse	des Accacias	74000	annecy
2	933	73	impasse	Jean Mermoz	10000	troyes
1	934	15	impasse	des Accacias	75000	paris
2	934	49	impasse	de la Libération	06000	nice
1	935	1	place	Victor Hugo	52000	chaumont
2	935	50	avenue	du Paradis	74000	annecy
1	936	26	avenue	Jules Verne	75000	paris
2	936	3	place	Jules Verne	52000	chaumont
1	937	11	boulevard	du Paradis	74000	annecy
2	937	68	allée	Jean Mermoz	10000	troyes
3	937	33	boulevard	Victor Hugo	06000	nice
1	938	15	place	Jules Verne	52000	chaumont
2	938	74	allée	Jean Mermoz	74000	annecy
3	938	5	avenue	Jean Mermoz	75000	paris
1	939	17	place	Jules Verne	06000	nice
2	939	77	rue	Victor Hugo	06000	nice
1	940	73	impasse	Jean Mermoz	51100	reims
2	940	17	impasse	Jean Mermoz	52000	chaumont
1	941	38	place	du Paradis	74000	annecy
2	941	62	place	du Paradis	06000	nice
1	942	4	place	du Paradis	10000	troyes
2	942	0	avenue	du Marché	51100	reims
1	943	77	allée	du Marché	10000	troyes
2	943	51	boulevard	du Paradis	06000	nice
1	944	59	allée	des Accacias	51100	reims
2	944	35	place	de la Libération	51100	reims
1	945	24	impasse	Victor Hugo	52000	chaumont
1	946	22	impasse	des Accacias	06000	nice
2	946	9	boulevard	du Marché	74000	annecy
1	947	1	place	de la République	06000	nice
2	947	43	place	Jules Verne	06000	nice
3	947	72	impasse	de la République	74000	annecy
1	948	66	avenue	des Accacias	75000	paris
1	949	72	boulevard	du Paradis	06000	nice
1	950	42	impasse	du Paradis	75000	paris
1	951	60	allée	Victor Hugo	10000	troyes
2	951	63	avenue	Jules Verne	51100	reims
3	951	19	impasse	Jules Verne	74000	annecy
1	952	63	boulevard	de la Libération	10000	troyes
2	952	62	impasse	de la République	10000	troyes
1	953	53	avenue	de la Libération	52000	chaumont
1	954	8	place	du Marché	51100	reims
2	954	23	impasse	du Paradis	51100	reims
1	955	37	impasse	de la Libération	74000	annecy
2	955	61	rue	Jules Verne	10000	troyes
3	955	72	impasse	Victor Hugo	06000	nice
1	956	59	rue	Victor Hugo	75000	paris
1	957	69	impasse	Victor Hugo	74000	annecy
2	957	45	place	Victor Hugo	74000	annecy
3	957	35	place	de la République	74000	annecy
1	958	45	place	Jules Verne	52000	chaumont
1	959	35	impasse	Jules Verne	52000	chaumont
2	959	29	avenue	Jules Verne	52000	chaumont
3	959	69	impasse	Victor Hugo	75000	paris
1	960	24	allée	du Paradis	51100	reims
2	960	33	impasse	Jean Mermoz	10000	troyes
1	961	62	boulevard	Jules Verne	51100	reims
2	961	46	rue	Victor Hugo	06000	nice
3	961	29	place	Victor Hugo	06000	nice
1	962	43	impasse	Victor Hugo	06000	nice
2	962	44	boulevard	de la République	75000	paris
3	962	18	impasse	de la Libération	06000	nice
1	963	30	impasse	du Marché	74000	annecy
2	963	62	impasse	Jules Verne	74000	annecy
3	963	51	boulevard	Victor Hugo	75000	paris
1	964	5	avenue	de la Libération	51100	reims
2	964	45	avenue	Victor Hugo	51100	reims
3	964	23	place	Jean Mermoz	10000	troyes
1	965	13	allée	Jean Mermoz	10000	troyes
2	965	31	boulevard	de la République	51100	reims
3	965	80	rue	Jean Mermoz	52000	chaumont
1	966	78	impasse	du Paradis	75000	paris
2	966	26	allée	Victor Hugo	10000	troyes
1	967	50	avenue	de la Libération	74000	annecy
1	968	70	rue	du Marché	75000	paris
2	968	9	impasse	du Marché	51100	reims
3	968	26	impasse	du Paradis	10000	troyes
1	969	34	avenue	de la Libération	10000	troyes
2	969	43	avenue	des Accacias	06000	nice
1	970	65	place	Victor Hugo	06000	nice
1	971	17	place	Jean Mermoz	06000	nice
2	971	66	impasse	Victor Hugo	10000	troyes
1	972	22	rue	du Paradis	51100	reims
1	973	17	impasse	Jean Mermoz	10000	troyes
2	973	39	place	Jules Verne	74000	annecy
1	974	49	boulevard	Victor Hugo	10000	troyes
2	974	58	allée	Victor Hugo	74000	annecy
1	975	39	place	du Marché	74000	annecy
1	976	16	impasse	du Marché	52000	chaumont
2	976	16	allée	du Marché	51100	reims
1	977	53	place	Jules Verne	52000	chaumont
1	978	33	allée	des Accacias	75000	paris
2	978	5	rue	Jean Mermoz	75000	paris
1	979	51	impasse	du Paradis	51100	reims
2	979	39	allée	des Accacias	06000	nice
3	979	59	boulevard	du Paradis	75000	paris
1	980	39	avenue	des Accacias	51100	reims
2	980	32	allée	Jean Mermoz	51100	reims
1	981	79	impasse	du Marché	74000	annecy
2	981	17	avenue	Jules Verne	10000	troyes
1	982	57	place	Victor Hugo	74000	annecy
2	982	76	place	du Paradis	10000	troyes
3	982	22	place	de la République	74000	annecy
1	983	29	impasse	de la République	52000	chaumont
2	983	12	place	Jean Mermoz	52000	chaumont
1	984	9	allée	de la Libération	06000	nice
2	984	27	avenue	Jules Verne	06000	nice
1	985	9	rue	des Accacias	10000	troyes
2	985	66	impasse	de la République	74000	annecy
1	986	10	place	de la République	10000	troyes
2	986	17	allée	Jean Mermoz	06000	nice
1	987	34	place	Victor Hugo	52000	chaumont
2	987	22	place	de la République	52000	chaumont
3	987	23	avenue	du Paradis	06000	nice
1	988	15	boulevard	de la République	74000	annecy
1	989	14	place	Jean Mermoz	52000	chaumont
2	989	18	rue	de la Libération	75000	paris
1	990	60	impasse	Jean Mermoz	06000	nice
2	990	39	place	de la République	10000	troyes
1	991	30	impasse	du Paradis	74000	annecy
2	991	4	boulevard	de la République	52000	chaumont
1	992	8	impasse	du Paradis	75000	paris
2	992	11	allée	Jean Mermoz	74000	annecy
1	993	73	place	de la République	74000	annecy
2	993	7	impasse	de la Libération	75000	paris
1	994	22	avenue	Victor Hugo	10000	troyes
2	994	56	impasse	de la République	75000	paris
1	995	59	boulevard	Jean Mermoz	51100	reims
2	995	3	place	de la Libération	75000	paris
3	995	71	impasse	de la Libération	10000	troyes
1	996	26	rue	Victor Hugo	74000	annecy
2	996	57	avenue	Jean Mermoz	52000	chaumont
1	997	47	avenue	de la Libération	51100	reims
1	998	40	impasse	du Paradis	06000	nice
2	998	35	impasse	Jean Mermoz	06000	nice
3	998	16	impasse	du Paradis	10000	troyes
1	999	36	impasse	du Paradis	52000	chaumont
1	1000	3	boulevard	des Accacias	75000	paris
2	1000	20	avenue	du Marché	10000	troyes
\.


--
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorie (id, libelle) FROM stdin;
1	perceuse
2	tournevis
3	scie
4	marteau
5	clé
6	meuleuse
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, nom, prenom, datenaissance, sexe, parrain) FROM stdin;
2	ANZIANI	Laurence	1961-10-20	f	\N
4	CARPIER	Stéphanie	1953-01-28	f	\N
5	PATISSOU	Françoise	1988-11-03	f	\N
6	JOUANET	Philippe	1981-04-02	h	\N
7	HOC	Marie	1971-11-13	f	\N
8	VINGERT	Sandrine	1941-11-21	f	\N
9	LERABLE	Carole	1966-06-10	f	\N
10	ARMAING	Michel	1978-09-02	h	\N
11	TAHIR	Claude	1955-06-04	f	\N
12	LADUNE	Marie	1944-11-14	f	\N
13	CHAILLAN	Mélanie	1952-10-02	f	\N
14	COINTRE	Stanislas	1955-03-03	h	\N
15	LEUWERS	Stéphanie	1942-05-31	f	\N
16	PIEDBOIS	François	1965-08-04	h	\N
17	FISSEUX	Stanislas	1970-12-27	h	\N
18	POILLY	Sophie	1984-10-09	f	\N
19	CABAILLOT	Bernard	1959-01-24	h	\N
20	LAGER	Carole	1965-06-26	f	\N
21	SIBERIL	Véronique	1975-12-08	f	\N
22	DUMOLIN	Gladys	1968-04-11	f	\N
23	LAMAUVE	Bernard	1982-03-09	h	\N
24	DOUBLIER	Stéphane	1974-02-10	h	\N
25	CALENDRIER	Sophie	1973-09-25	f	\N
26	LECOUBLET	Stéphane	1940-03-24	h	\N
27	REBOULET	Raymond	1965-05-06	h	\N
28	BOHEC	Michèle	1946-08-08	f	\N
29	PIATTI	Nathalie	1947-04-01	f	\N
31	SINSOULIEU	Nathalie	1952-02-09	f	\N
32	DELSAUT	Jacques	1979-12-18	h	\N
33	DELORD	Murielle	1965-05-04	f	\N
34	DEMONGEOT	Mathias	1965-11-29	h	\N
35	MASSOLO	Béatrice	1974-05-30	f	\N
36	VALEZY	Marcel	1944-08-27	h	\N
37	BLAUBLOMME	Paul	1956-01-15	h	\N
38	CHAZEL	Caroline	1967-09-01	f	\N
39	DE LORGERIL	Dominique	1957-04-19	h	\N
40	PARE	Dominique	1981-06-05	h	\N
41	CHAN	Simon	1963-08-06	h	\N
42	GRABER	Bernard	1958-03-17	h	\N
43	CHEYROUX	Maurice	1941-06-10	h	\N
44	PARQUET	Sandrine	1937-08-01	f	\N
45	PIOLLE	Serge	1980-07-26	h	\N
46	VOITURIER	Dominique	1954-05-25	f	\N
47	CASTIGLIONI	Gladys	1937-05-15	f	\N
49	STOCLET	Françoise	1940-02-28	f	\N
50	CHENEVIER	Anne	1961-09-19	f	\N
51	MALVAL	Dominique	1942-02-21	f	\N
52	DELEMOTTE	Michèle	1949-11-26	f	\N
53	GRANDVAL	Marie	1957-02-09	f	\N
54	CANNEVIERE	François	1983-10-08	h	\N
55	FLECHEL	Anne	1962-08-21	f	\N
56	PASCOT	Jean	1955-08-27	h	\N
57	NATHAN	Charles	1949-05-07	h	\N
58	CHABANEL	Bernard	1975-02-26	h	\N
59	LE STUNFF	Marcel	1951-11-18	h	\N
60	LE GUINIEC	Sandrine	1949-06-21	f	\N
61	DROAL	Raoul	1945-09-21	h	\N
62	JUBIER	Stéphane	1956-12-14	h	\N
63	MALROUX	Sandrine	1988-09-30	f	\N
64	HAUTOT	Louise	1973-02-17	f	\N
65	MONCHY	Sophie	1989-06-25	f	\N
66	WITASSE	Christine	1986-12-15	f	\N
67	GUIMIOT	Marc	1968-11-16	h	\N
68	LOVITON	Marine	1954-04-28	f	\N
69	CUDORGE	Christine	1985-01-08	f	\N
70	OFFMANN	Géraldine	1974-08-01	f	\N
71	ROUFFIGNAT	Marcel	1978-02-10	h	\N
72	GISQUET	Pierre	1983-04-16	h	\N
73	HAMITOUCHE	Anne	1986-08-25	f	\N
74	BARKA	Gladys	1947-10-11	f	\N
75	DELIBES	Paul	1948-03-14	h	\N
76	DEMAN	Pierre	1946-01-20	h	\N
77	CAMU	Philippe	1948-02-26	h	\N
78	PELMOINE	Nadine	1958-03-21	f	\N
79	SAINT-MAXIN	Roger	1967-07-13	h	\N
80	BOLE	Louise	1985-08-11	f	\N
81	RANGLARET	Béatrice	1950-04-26	f	\N
83	WINIARSKI	Christophe	1960-09-27	h	\N
84	AMOURIAUX	Stéphanie	1976-10-10	f	\N
85	NERESTAN	Simon	1961-09-24	h	\N
86	RENAUDOT	Louise	1939-04-27	f	\N
87	SOLEILHAVOUP	Pierre	1955-09-03	h	\N
88	BONNION	Véronique	1980-11-22	f	\N
89	GACONNET	Marcel	1965-12-31	h	\N
90	SEGALEN	Christian	1938-06-12	h	\N
91	LACAMBRE	Christophe	1968-02-08	h	\N
92	ARTIGA	Béatrice	1990-01-07	f	\N
93	POUPON	Marc	1961-01-14	h	\N
94	MARIGNAN	Carole	1980-01-12	f	\N
95	GENAND	Claude	1977-06-26	f	\N
96	TRAVERSE	Christelle	1959-09-08	f	\N
97	ROTA	Laurence	1950-05-10	f	\N
98	AUBRAS	Jean	1933-12-29	h	\N
99	DESPLANTES	Simon	1989-03-08	h	\N
100	MAILLES	Caroline	1979-01-19	f	\N
102	YOUNG	Cécile	1955-11-24	f	\N
103	PIAULT	Laurence	1974-09-05	f	\N
104	DULERY	Christine	1985-06-10	f	\N
105	GUIDE	Stanislas	1968-02-13	h	\N
106	BELLO	Marcel	1932-07-07	h	\N
107	SADIN	François	1964-07-09	h	\N
108	BESSEYRIAS	Anne	1979-07-09	f	\N
109	PESLIER	Louise	1934-09-15	f	\N
110	GENEZ	Marcel	1959-08-06	h	\N
111	CLAIROTTE	Nadine	1963-04-19	f	\N
112	PISTOLET	Marcel	1956-04-05	h	\N
114	DUFOURMANTELLE	Céline	1956-05-09	f	\N
115	PROFFIT	Dominique	1961-09-04	h	\N
116	LANDUCCI	Nadine	1966-05-11	f	\N
117	MORENO	Céline	1949-03-12	f	\N
118	WOLOSZYN	Murielle	1975-04-15	f	\N
119	KERUZORE	Jean	1941-11-06	h	\N
120	AFFRE	Gladys	1944-06-04	f	\N
121	LICTEVOUT	Stanislas	1973-09-26	h	\N
123	GISSINGER	Michel	1955-04-29	h	\N
124	MARTINOTTI	Cécile	1985-10-03	f	\N
125	GEAI	Bernard	1939-10-11	h	\N
126	DUJARDIN	Paul	1960-08-29	h	\N
127	KRAWCZYK	Bernard	1976-02-08	h	\N
128	GAVILLON	Raymond	1972-09-23	h	\N
129	DALUZEAU	Marie	1960-02-29	f	\N
130	PEZAIRE	Roger	1953-01-20	h	\N
131	GARGOWITZ	Pierre	1969-01-02	h	\N
132	MEIGNAN	Françoise	1966-03-21	f	\N
133	AVALLET	Stanislas	1987-06-29	h	\N
134	SALGUERO	Christophe	1972-04-24	h	\N
135	MORINET	Marcel	1987-01-28	h	\N
136	ORBAN	Céline	1933-06-03	f	\N
48	VARDIN	Charles	1958-06-09	h	573
30	MONACO	Véronique	1972-03-02	f	894
113	VILLEMONT	Christophe	1962-05-06	h	93
3	GELE	Céline	1979-04-17	f	99
1	NAUDI	Bernard	1969-09-15	h	323
101	RAGNEAU	Maurice	1964-12-31	h	762
137	BUSSONE	Paul	1975-10-21	h	\N
138	HENRIQUE	Marcel	1955-11-24	h	\N
139	ALLIEZ	Véronique	1977-06-02	f	\N
140	DOMITILE	Laurence	1969-09-22	f	\N
141	WOEHREL	Stanislas	1960-01-11	h	\N
142	QUENAULT	Nadine	1972-03-15	f	\N
143	BRESSION	Béatrice	1956-05-16	f	\N
145	HOCHE	Simon	1952-02-29	h	\N
146	CAPPELLI	Bernard	1982-03-04	h	\N
147	BRIONE	Béatrice	1938-02-16	f	\N
148	VOLLARD	Bernard	1956-03-12	h	\N
149	CHARNI	Bernard	1938-12-18	h	\N
150	LATERRADE	Simon	1970-06-26	h	\N
151	GREGOIRE	Carole	1931-12-01	f	\N
152	ROTURIER	Carole	1977-01-05	f	\N
153	NABOT	Serge	1949-02-20	h	\N
154	RANO	Claude	1978-01-13	h	\N
155	PASTEUR	Claude	1934-05-23	f	\N
156	LECRON	Dominique	1935-06-01	f	\N
157	TANFIN	Gladys	1978-06-28	f	\N
158	ILLES	Christian	1957-06-08	h	\N
159	MEOULE	Marie	1966-12-09	f	\N
160	CHAREILLE	Anne	1987-02-19	f	\N
161	WAXIN	Jean	1987-01-08	h	\N
162	AIGRET	Louise	1970-09-16	f	\N
163	DELAFONTAINE	Christine	1944-02-01	f	\N
164	MOCAER	Jean	1961-04-17	h	\N
165	BURDET	Anne	1960-04-18	f	\N
166	ROCHETEAU	Philippe	1964-12-27	h	\N
167	LEMARECHAL	Véronique	1937-02-11	f	\N
168	BOURCY	Anne	1936-05-25	f	\N
169	WILQUIN	Sophie	1981-04-10	f	\N
170	MAUNOIR	Bernard	1971-03-02	h	\N
171	TATINCLAUX	Cécile	1981-10-10	f	\N
172	AVIGNON	Philippe	1984-04-15	h	\N
173	LARTIN	Laurent	1948-05-15	h	\N
174	VERGEAT	Marie	1964-09-28	f	\N
175	DEBERGH	Stéphanie	1972-08-20	f	\N
176	SOUBIRAN	Paul	1978-08-04	h	\N
177	FIEUX	Xavier	1945-04-17	h	\N
178	GALLEZOT	Jean	1986-07-30	h	\N
179	FERRINI	Françoise	1981-07-02	f	\N
180	LAUCOURNET	Laurence	1952-07-12	f	\N
181	LARDET	Christelle	1979-10-11	f	\N
182	SENEZE	Géraldine	1940-11-30	f	\N
183	BLEAS	Dominique	1940-09-09	h	\N
184	TAUDIN	Michèle	1948-06-09	f	\N
185	DEPERY	Béatrice	1964-10-12	f	\N
186	ESCAFIT	Murielle	1962-01-03	f	\N
187	GAUDINOT	Christian	1963-07-14	h	\N
188	NANOT	Marc	1980-11-19	h	\N
189	ABAR	Louise	1963-10-25	f	\N
190	BERMOND	Françoise	1968-12-15	f	\N
191	SERPILLON	Béatrice	1959-11-28	f	\N
192	ROBAS	Béatrice	1977-11-01	f	\N
193	GRIGNE	Xavier	1975-09-12	h	\N
194	PACORY	Christophe	1952-09-25	h	\N
195	WIRTH	Raoul	1943-03-16	h	\N
196	LABRANDE	Serge	1942-11-16	h	\N
197	BOUVERAT	Stanislas	1935-10-11	h	\N
199	DAUM	Murielle	1939-12-27	f	\N
200	NOISETTE	Claude	1940-12-06	f	\N
201	JOIN	Véronique	1952-09-23	f	\N
202	DAGNAS	Gladys	1982-12-03	f	\N
203	CHARONNAT	Raoul	1931-07-24	h	\N
204	LAFERTE	Stéphane	1932-05-07	h	\N
205	DERORY	Murielle	1967-09-25	f	\N
206	SCHNEIDER	Bernard	1934-07-16	h	\N
207	ZETTOR	Maurice	1959-07-03	h	\N
208	ETTER	Maurice	1955-06-21	h	\N
209	MODOT	Marcel	1959-03-07	h	\N
210	BLANDINEAU	Francis	1955-06-21	h	\N
211	FRENEAU	Claude	1980-09-26	f	\N
212	COORNAERT	Pierre	1973-06-03	h	\N
213	LEFAUCONNIER	Christine	1960-09-18	f	\N
214	LECOINTRE	Marcel	1940-09-10	h	\N
215	LISIECKI	Anne	1957-09-29	f	\N
216	CORDOLIANI	Carole	1971-11-10	f	\N
217	GRYSON	Béatrice	1946-10-29	f	\N
218	FURSTOSS	Claude	1981-12-27	h	\N
220	MOUEZA	Murielle	1939-06-25	f	\N
223	DENIER	Dominique	1935-08-19	h	\N
224	REMILIEN	Cécile	1942-07-12	f	\N
225	CORON	Paul	1989-09-13	h	\N
226	BOUILLERE	Géraldine	1959-11-03	f	\N
227	ROUQUIE	Murielle	1951-02-13	f	\N
228	LEBARGY	Carole	1962-10-08	f	\N
229	TAURELLE	Raoul	1971-04-29	h	\N
230	LAHALLE	Claude	1963-04-03	h	\N
231	GRIMOULT	Christophe	1980-12-04	h	\N
232	GRELAT	Murielle	1958-10-08	f	\N
233	LAMET	Christine	1947-10-24	f	\N
234	DELALANDRE	Laurent	1978-01-04	h	\N
235	FRIMAT	Françoise	1951-09-22	f	\N
236	SPILLEBOUT	Marc	1965-05-21	h	\N
237	LAMBERTIN	Béatrice	1967-01-27	f	\N
238	PAGEAUX	Marc	1962-05-18	h	\N
239	BELOU	Charles	1965-12-17	h	\N
240	CIVIDINO	Béatrice	1983-05-23	f	\N
241	LAGNES	Louise	1981-01-23	f	\N
242	DOLEZ	Carole	1968-08-30	f	\N
243	POZNANSKI	Xavier	1988-10-08	h	\N
244	DASSIE	Céline	1936-03-21	f	\N
245	VAILLER	Raoul	1971-07-15	h	\N
246	TROUILH	Mathias	1983-07-14	h	\N
247	ROCHUT	Stanislas	1954-04-02	h	\N
248	COLINMAIRE	Maurice	1938-12-26	h	\N
249	DOREL	Sophie	1968-10-14	f	\N
250	LE PICARD	Marc	1943-03-04	h	\N
251	TABOUREAU	Marcel	1975-11-04	h	\N
252	MOECKES	Philippe	1934-07-06	h	\N
253	CLEAU	Françoise	1951-12-05	f	\N
254	ROHNER	Raoul	1942-11-15	h	\N
255	CORNEN	Gladys	1986-04-08	f	\N
256	LANGRY	Véronique	1937-12-26	f	\N
257	FOURCHE	Stéphane	1931-02-21	h	\N
258	TALEUX	Mathias	1987-11-29	h	\N
259	MESMIN	François	1974-03-20	h	\N
260	CAROLI	Mathias	1951-11-21	h	\N
261	GEOFFRE	Stéphanie	1949-05-16	f	\N
262	VANLIERDE	Bernard	1933-12-16	h	\N
263	BAUTISTA	Dominique	1963-05-07	h	\N
264	DEHAME	Carole	1960-06-26	f	\N
266	COCU	Nathalie	1986-06-26	f	\N
267	GODEL	Gladys	1973-11-21	f	\N
268	JUSTE	Roger	1945-01-03	h	\N
269	SASSUS	Géraldine	1945-06-12	f	\N
270	TUFFIER	Charles	1981-10-11	h	\N
271	CHAUFFOURIER	Marc	1989-06-27	h	\N
272	BESSODES	Francis	1944-05-30	h	\N
273	DUBOUE	Roger	1970-09-12	h	\N
265	LE DOUARAN	Maurice	1947-11-12	h	788
222	SIDA	Laurence	1935-10-24	f	38
221	LIVOLSI	Cécile	1960-04-03	f	217
219	CHIEZE	Anne	1943-10-12	f	864
274	MOUCHART	Simon	1941-02-15	h	\N
275	CHARLES	Anne	1972-07-05	f	\N
276	FIORE	Michèle	1978-03-18	f	\N
277	PASSAS	Serge	1983-07-17	h	\N
278	DELNATTE	Michel	1945-07-06	h	\N
279	LIMOUSY	Christian	1944-12-12	h	\N
280	AUGUSTYNIAK	Christine	1973-09-18	f	\N
281	RAINGEARD	Géraldine	1942-06-26	f	\N
282	VEYSSET	Stéphanie	1974-11-17	f	\N
283	DUBANCHET	Maurice	1931-04-01	h	\N
284	VERMARE	Philippe	1949-02-17	h	\N
285	JOURDAS	Claude	1941-04-03	h	\N
286	DEBUIGNY	Philippe	1974-07-02	h	\N
287	FRAPART	Michèle	1938-03-25	f	\N
288	POURREYRON	Stéphane	1966-03-03	h	\N
289	LONGIERAS	Mélanie	1944-01-30	f	\N
291	LE NOE	Philippe	1972-11-13	h	\N
292	ROGGE	Jean	1979-04-14	h	\N
293	SEICHEPINE	Sandrine	1967-07-12	f	\N
294	MASSENA	Carole	1934-08-02	f	\N
295	LENOURRY	Cécile	1958-10-27	f	\N
296	DOMMANGET	Jean	1984-03-04	h	\N
297	ROBELIN	Nadine	1942-01-07	f	\N
298	FOUCARD	Claude	1984-11-12	f	\N
299	BENHADDOUCHE	Simon	1951-09-12	h	\N
300	DACLINAT	Maurice	1962-06-06	h	\N
301	CONDAMINE	Géraldine	1941-08-01	f	\N
302	MAZZA	Stéphanie	1954-11-26	f	\N
303	BIQUET	Céline	1941-09-06	f	\N
304	ERCOLANI	Caroline	1961-04-09	f	\N
305	ALMAR	Bernard	1974-08-04	h	\N
306	BOUSSELIN	Laurent	1944-06-20	h	\N
307	HASSAN	Mathias	1945-03-13	h	\N
308	MAYADE	Michèle	1975-05-24	f	\N
310	GARAUD	Stanislas	1984-10-02	h	\N
311	BOUILLIEZ	Jacques	1961-06-15	h	\N
312	DELACHAT	Stanislas	1951-01-04	h	\N
313	FLEURIDAS	Gladys	1956-11-26	f	\N
314	CAREY	Françoise	1984-05-24	f	\N
315	PATRU	Nathalie	1959-04-07	f	\N
316	GIROND	Stéphane	1983-03-29	h	\N
317	FABUREL	Pierre	1936-02-04	h	\N
319	MORAZZANI	Céline	1941-11-02	f	\N
320	GANDOLPHE	Stanislas	1968-08-25	h	\N
321	CRESCI	Dominique	1931-12-14	h	\N
322	SEKKAI	Serge	1973-05-06	h	\N
323	RIGAUT	Maurice	1956-09-24	h	\N
324	DESAIVRE	Sophie	1952-03-14	f	\N
325	BONNEFONT	Raoul	1987-02-14	h	\N
327	FETET	Charles	1980-01-25	h	\N
328	GANS	Christian	1963-12-28	h	\N
329	CROUE	Géraldine	1975-03-21	f	\N
330	MARICHEZ	Sandrine	1963-09-07	f	\N
331	FANDARD	Marc	1963-07-18	h	\N
332	COURROY	Dominique	1968-04-17	f	\N
333	LAZARETH	Jean	1937-04-24	h	\N
334	COHAS	Marcel	1937-10-18	h	\N
335	BONALDO	Gladys	1983-04-03	f	\N
336	DEROZIER	Sandrine	1931-01-23	f	\N
337	DOMIN	Marie	1933-10-02	f	\N
338	GAUGY	Jean	1936-11-15	h	\N
339	PANETTA	Xavier	1953-02-27	h	\N
340	TAGOT	Jean	1983-12-30	h	\N
341	TOBIA	Michèle	1938-10-11	f	\N
342	PITROU	Nathalie	1985-03-13	f	\N
343	WICK	Nadine	1961-06-11	f	\N
344	ERNY	Caroline	1951-12-07	f	\N
345	JABOULAY	Laurent	1968-04-16	h	\N
346	GROMAIRE	Carole	1967-02-08	f	\N
347	AVERNE	Raoul	1969-12-27	h	\N
348	ALLAVOINE	Véronique	1946-04-25	f	\N
349	MADAR	Raoul	1943-06-08	h	\N
350	DOCTEUR	Céline	1939-06-05	f	\N
351	HOSSANN	Serge	1968-10-12	h	\N
352	LECLERQ	Laurence	1981-07-12	f	\N
353	RAPEAU	Marie	1957-07-19	f	\N
354	GINIBRE	Stéphanie	1961-07-04	f	\N
355	BEAUBOUCHER	Christophe	1961-10-07	h	\N
356	DELZOR	Jacques	1965-05-17	h	\N
357	L HEVEDER	Maurice	1938-10-30	h	\N
358	GOMINET	Murielle	1950-02-12	f	\N
359	DEBART	Françoise	1984-01-27	f	\N
360	GIMAT	Xavier	1967-05-08	h	\N
361	CERESA	Bernard	1959-11-07	h	\N
362	PLUMEL	Louise	1950-03-17	f	\N
363	SAUBESTY	Béatrice	1969-04-03	f	\N
364	DAVOLI	Xavier	1971-08-17	h	\N
365	MAIER	Nathalie	1960-04-01	f	\N
366	ALLIRAND	Véronique	1965-05-02	f	\N
367	BAREA	Raymond	1942-01-27	h	\N
368	PROULT	Dominique	1956-09-06	h	\N
369	MOTYL	Sophie	1942-12-26	f	\N
370	MILLO	Jacques	1941-01-03	h	\N
371	MORNET	Françoise	1935-11-21	f	\N
372	PELADAN	Mathias	1972-05-21	h	\N
373	BRESSAN	Philippe	1977-02-19	h	\N
374	DE SCHEPPER	Bernard	1957-07-07	h	\N
375	MAZZONI	Anne	1954-05-07	f	\N
376	FAISANT	Jacques	1934-01-04	h	\N
377	PATA	Marie	1979-04-13	f	\N
378	TOBIE	Francis	1959-09-08	h	\N
379	JOUE	Véronique	1989-05-28	f	\N
380	FREDY	Nadine	1936-07-26	f	\N
381	BRIOUDES	Carole	1948-07-18	f	\N
382	DORIOT	Jean	1959-11-14	h	\N
383	DUDOGNON	Cécile	1944-08-30	f	\N
385	ABELLI	Stéphanie	1957-08-23	f	\N
386	LARREY	Christelle	1956-05-04	f	\N
387	FLORIANT	Bernard	1980-01-16	h	\N
388	BOUTOLLEAU	Carole	1931-09-13	f	\N
389	GOUTINES	Stanislas	1947-07-09	h	\N
391	DUCATILLION	Michel	1940-06-07	h	\N
392	LE CLEC'H	Claude	1982-06-28	h	\N
393	COILLOT	Christine	1963-12-01	f	\N
394	BLARD	Mélanie	1947-07-29	f	\N
395	COTS	Christophe	1969-12-10	h	\N
396	CANS	Louise	1986-10-10	f	\N
397	MAILLON	Géraldine	1946-08-09	f	\N
398	OGES	Carole	1934-06-18	f	\N
400	ESTOUP	Michel	1970-11-07	h	\N
401	BONDOT	Véronique	1944-05-17	f	\N
403	BENAC	Marc	1983-11-27	h	\N
404	COMPEYRON	Marine	1985-06-01	f	\N
405	PERNETTE	Christine	1960-08-29	f	\N
406	KREUTZ	Bernard	1971-08-27	h	\N
407	TALLOBRE	Maurice	1958-05-30	h	\N
408	TOURELLE	Stéphanie	1938-12-09	f	\N
399	BOURBONNAIS	Géraldine	1969-04-23	f	26
290	PASQUER	Céline	1943-02-21	f	955
390	HERON	Christelle	1938-03-13	f	232
384	MELLOUK	Béatrice	1951-12-11	f	983
326	MERGEL	Simon	1945-05-02	h	486
318	LAGIER	Xavier	1957-09-05	h	267
409	BOUGON	François	1984-10-29	h	344
410	MEILLER	Xavier	1954-01-02	h	\N
412	MORELET	Laurence	1968-07-28	f	\N
413	VOURCH	Caroline	1956-01-14	f	\N
414	DUCHENNE	Béatrice	1981-04-20	f	\N
415	REILLES	François	1944-08-21	h	\N
416	TRUFFOT	Christine	1940-08-24	f	\N
417	GUITTET	Anne	1956-11-24	f	\N
418	JONCHERAY	Dominique	1972-10-16	h	\N
419	GOSTIAU	Murielle	1938-04-02	f	\N
420	NELY	Claude	1948-02-02	h	\N
421	HERENGUEL	Claude	1957-11-12	h	\N
422	CREOFF	Raymond	1948-08-22	h	\N
423	AURELLE	Michèle	1972-08-07	f	\N
424	MEHIAOUI	Françoise	1964-07-11	f	\N
425	ARIBOT	Cécile	1988-01-14	f	\N
426	RUST	Sandrine	1972-05-15	f	\N
427	ADELL	Mélanie	1984-08-13	f	\N
428	KTORZA	Raoul	1985-08-07	h	\N
429	GOMBEAU	Géraldine	1972-11-03	f	\N
430	BEREAUD	Maurice	1942-06-06	h	\N
431	BARIDON	Marie	1963-08-22	f	\N
432	POMIES	Dominique	1942-01-02	f	\N
433	WALLON	Dominique	1947-06-28	h	\N
434	BEAUSSIRE	Mathias	1946-08-05	h	\N
435	GAILLAGUET	Laurence	1957-02-07	f	\N
436	PASSY	Marie	1970-06-17	f	\N
437	BELLARDANT	Christine	1946-03-28	f	\N
438	LABE	Cécile	1983-09-16	f	\N
439	DUTARTRE	Louise	1963-12-29	f	\N
440	GUYENET	Véronique	1979-03-21	f	\N
441	AUTRIVE	Pierre	1945-03-24	h	\N
442	KERFERS	Raoul	1960-03-02	h	\N
443	BOTET	Cécile	1958-01-15	f	\N
444	PATOIS	Caroline	1943-07-04	f	\N
445	PIVETTA	Laurent	1983-10-11	h	\N
446	THEULIER	Béatrice	1956-12-23	f	\N
447	AIGON	Roger	1945-01-09	h	\N
448	CHILARD	Carole	1951-04-24	f	\N
449	MONBEL	Géraldine	1943-12-10	f	\N
450	PERINEL	Nadine	1948-09-21	f	\N
451	GUILIANI	Bernard	1965-11-24	h	\N
452	BORGAT	Stéphane	1967-08-18	h	\N
453	JOAQUIM	Françoise	1940-01-08	f	\N
454	DELVILLE	Laurence	1938-03-19	f	\N
455	WALBECQ	Christophe	1941-08-01	h	\N
456	PILLAC	Sophie	1936-03-13	f	\N
458	CHAUMAT	Caroline	1983-10-28	f	\N
459	BREUILLOT	Paul	1967-01-22	h	\N
460	CHARRETTE	Sophie	1944-06-08	f	\N
461	VAGNEUR	François	1979-11-04	h	\N
462	ROVER	Roger	1940-02-10	h	\N
463	BOURRIN	Maurice	1949-02-03	h	\N
464	DELAVIER	Gladys	1988-11-13	f	\N
465	PARYS	Christine	1944-02-28	f	\N
466	PLANCKE	Sophie	1967-08-25	f	\N
467	SAMBIN	Claude	1981-04-02	h	\N
468	AYASSAMY	Xavier	1976-07-26	h	\N
469	BORGETTO	Raoul	1940-05-08	h	\N
470	HETTE	Roger	1971-12-26	h	\N
471	MILHOMME	Charles	1961-05-23	h	\N
472	BOUZON	Carole	1977-01-22	f	\N
473	CHELLE	Sophie	1985-03-15	f	\N
474	GUCKERT	Marine	1972-02-01	f	\N
475	PORZIO	Sandrine	1973-12-04	f	\N
476	CLOATRE	Christophe	1956-10-09	h	\N
477	TRIPARD	Véronique	1944-10-11	f	\N
478	MANDROUX	Céline	1967-11-07	f	\N
479	LE RUDULIER	Dominique	1975-02-21	h	\N
480	CHOMET	François	1950-03-04	h	\N
481	PERSIL	Jean	1955-03-02	h	\N
482	USUREAU	Laurence	1979-12-22	f	\N
483	VITRE	Sophie	1990-03-03	f	\N
484	LE BORGNE	Charles	1982-07-10	h	\N
485	MAUGUEN	Murielle	1952-04-17	f	\N
487	BOUQUEY	Christophe	1940-10-27	h	\N
488	DESSAGNE	Claude	1949-06-08	h	\N
489	MOUTIER	Carole	1953-04-28	f	\N
490	OUAHAB	Michel	1979-03-16	h	\N
491	DESCOINS	Marcel	1953-11-18	h	\N
492	CLAPPIER	Christine	1962-08-07	f	\N
493	RENNEVILLE	Jean	1989-01-08	h	\N
494	MELAYE	Claude	1942-11-03	h	\N
495	ISLER	Bernard	1944-11-21	h	\N
496	MARZI	Christophe	1940-08-17	h	\N
497	ANGOULVANT	Nathalie	1934-09-04	f	\N
498	LAMBIN	Pierre	1937-04-28	h	\N
499	BALLOY	Paul	1953-04-30	h	\N
500	RAVIGNOT	Maurice	1956-02-08	h	\N
501	LAFAURE	Bernard	1984-01-01	h	\N
502	WITCZAK	Mathias	1971-03-14	h	\N
503	ANJOT	Stanislas	1984-09-29	h	\N
504	KARL	Mélanie	1987-07-07	f	\N
505	LANDINI	Carole	1949-08-28	f	\N
506	JAGUELIN	Stanislas	1938-05-14	h	\N
507	GUTTER	Murielle	1944-02-14	f	\N
508	LOCHET	Claude	1948-02-22	h	\N
509	NOUE	Simon	1977-07-16	h	\N
510	ZEGGAI	Simon	1957-05-31	h	\N
511	ABATI	Maurice	1967-07-15	h	\N
512	PARISSE	Claude	1981-05-15	f	\N
515	GARINOT	Laurence	1979-02-22	f	\N
516	FAISANDIER	Raoul	1941-10-22	h	\N
517	DEVYS	Sophie	1962-01-13	f	\N
518	BROQUIN	Marcel	1962-04-11	h	\N
519	FAUTRAT	Laurence	1984-12-29	f	\N
520	MIRANDE	Nadine	1938-03-30	f	\N
521	MACIAG	Sophie	1984-07-09	f	\N
522	GORCZYCA	Bernard	1974-08-15	h	\N
523	NARDON	Marine	1948-02-15	f	\N
524	PAULARD	Jean	1934-10-28	h	\N
525	SIFFERLEN	Christophe	1965-04-21	h	\N
526	BEAREZ	Sophie	1959-06-19	f	\N
527	BALMISSE	Dominique	1952-09-09	f	\N
528	ROUAUX	Marc	1932-12-10	h	\N
529	DELMARE	Philippe	1967-09-23	h	\N
530	HESTIN	Nathalie	1955-11-14	f	\N
531	CHENAUX	Mathias	1963-06-13	h	\N
532	SIGAUT	Michel	1971-09-23	h	\N
533	NOUI	Laurent	1932-02-06	h	\N
534	GORSSE	Mathias	1973-06-04	h	\N
535	ROBACH	Anne	1959-06-27	f	\N
536	MOUYSSET	Nadine	1942-07-17	f	\N
537	GUINCHARD	Philippe	1955-06-29	h	\N
539	LIMBOURG	Raymond	1972-09-25	h	\N
540	LAUILHE	Sandrine	1966-03-26	f	\N
542	ROLLIN	Stéphanie	1985-03-17	f	\N
543	FLAMEIN	Céline	1952-04-28	f	\N
544	FEYT	François	1945-04-27	h	\N
545	DUBLIN	Marcel	1939-12-06	h	\N
546	BARTHELAT	Sophie	1985-06-25	f	\N
541	JEAY	Françoise	1982-11-17	f	770
538	ALBANO	Sophie	1958-04-05	f	466
514	MOUNIER	Stéphanie	1945-01-03	f	469
513	CRUNELLE	Nadine	1932-07-17	f	4
411	AGNELLO	Roger	1973-04-04	h	4
547	YVERNEAU	Céline	1945-06-14	f	\N
548	PROSPER	Christian	1988-03-10	h	\N
549	LETOUBLON	Charles	1959-12-11	h	\N
550	VLERICK	Laurent	1955-04-22	h	\N
551	GRAND	Béatrice	1989-07-27	f	\N
552	D'AURIA	Michèle	1944-10-19	f	\N
553	TRICONNET	Cécile	1982-09-30	f	\N
554	PECRON	Pierre	1969-12-25	h	\N
555	DUGENY	Claude	1953-01-07	f	\N
556	CAMAN	Marie	1976-10-24	f	\N
557	BIN	Dominique	1961-05-01	f	\N
558	ALLOIN	Bernard	1964-11-17	h	\N
559	TROYON	Gladys	1987-11-16	f	\N
560	PENDARIES	Nathalie	1970-07-01	f	\N
561	PURENNE	Jacques	1964-09-19	h	\N
562	BORNE	Marcel	1951-10-07	h	\N
563	KADDOUR	François	1956-11-08	h	\N
564	HURSTEL	Carole	1942-10-07	f	\N
565	DELELIS	Xavier	1967-08-20	h	\N
566	BASQUAISE	Louise	1947-01-19	f	\N
567	HALLOT	Maurice	1953-01-03	h	\N
568	PAUMELLE	Carole	1950-09-23	f	\N
569	LECLAIR	Cécile	1962-07-19	f	\N
570	WASCHEUL	Nadine	1989-12-15	f	\N
571	PANERO	Maurice	1940-09-12	h	\N
572	PESSY	Christian	1988-09-04	h	\N
573	CHARNAY	Nathalie	1955-01-25	f	\N
574	FREUCHET	Francis	1955-11-14	h	\N
575	ETCHEBEST	Christian	1944-10-19	h	\N
576	MALLEVIALLE	Laurent	1947-01-06	h	\N
577	SELINGUE	Dominique	1954-04-12	f	\N
578	BELSON	Caroline	1984-03-09	f	\N
579	CLAVEQUIN	Roger	1942-07-15	h	\N
580	GABARRI	Géraldine	1959-01-18	f	\N
581	DUROU	Carole	1982-09-03	f	\N
582	BERTHAUT	Charles	1937-09-12	h	\N
583	PRINCELLE	Louise	1931-07-15	f	\N
584	GRINE	Céline	1946-07-08	f	\N
585	LE TOHIC	Pierre	1956-04-13	h	\N
586	PESCH	Charles	1977-05-02	h	\N
587	LANNEE	Francis	1943-04-15	h	\N
588	DARJO	Laurence	1933-12-12	f	\N
589	BILLAUX	Béatrice	1934-11-01	f	\N
590	GUIL	Jean	1952-01-05	h	\N
591	CYRILLE	Claude	1949-09-04	h	\N
592	GRAVOUILLE	Céline	1983-05-15	f	\N
593	LE CANU	Françoise	1986-04-18	f	\N
594	LEVIEUX	Mathias	1956-12-09	h	\N
595	RAUD	Cécile	1959-06-27	f	\N
596	POITRENAUD	Laurent	1938-03-14	h	\N
597	RIAT	Laurence	1975-09-28	f	\N
598	PICCIRILLO	Philippe	1985-10-12	h	\N
599	MONFRONT	Gladys	1954-05-23	f	\N
600	LECLEIRE	Marc	1973-03-07	h	\N
602	LEPILEUR	Nadine	1959-03-22	f	\N
603	QUERAUD	Simon	1936-03-22	h	\N
604	CAIRE	Xavier	1988-05-26	h	\N
605	COLLEY	Sophie	1973-04-16	f	\N
606	ADELIS	Philippe	1942-10-06	h	\N
607	LUMINET	Mathias	1934-11-29	h	\N
608	RACHEL	Murielle	1967-05-30	f	\N
609	POITEVIN	Claude	1984-09-06	f	\N
610	CARLAT	François	1947-11-16	h	\N
611	PIRO	Stéphanie	1955-09-08	f	\N
612	BREST	Christine	1940-12-05	f	\N
613	GLANDIERES	Laurent	1973-04-05	h	\N
614	RUYET	Céline	1969-01-17	f	\N
615	BUHL	Caroline	1980-08-01	f	\N
616	ARSENE	Marine	1934-05-21	f	\N
617	FOURGOUS	Marc	1936-02-04	h	\N
618	ARRESTIER	Laurence	1974-08-24	f	\N
619	DEMACON	Cécile	1940-08-21	f	\N
620	GISBERT	Philippe	1988-10-16	h	\N
621	HIBLOT	François	1935-10-16	h	\N
622	LESTAVEL	Paul	1966-12-03	h	\N
623	VERNADAT	Jacques	1989-10-05	h	\N
624	DIGEON	Raoul	1931-11-01	h	\N
625	TAFIAL	Céline	1981-07-02	f	\N
626	THOUMIRE	Stéphanie	1940-01-22	f	\N
627	LARCHET	Sophie	1975-09-06	f	\N
628	BAUDRAS	Dominique	1952-01-12	f	\N
629	SCHAMING	Michèle	1949-10-09	f	\N
630	CAVIN	Stéphane	1943-04-18	h	\N
631	PANAFIEU	Françoise	1938-06-29	f	\N
632	FRANCONY	Christian	1964-11-02	h	\N
634	ESPITALLIER	Christine	1962-08-15	f	\N
635	JAIME	Charles	1951-02-02	h	\N
636	MARKO	Cécile	1965-06-11	f	\N
637	VARNEY	Stéphane	1962-08-22	h	\N
638	BUTTARD	Xavier	1972-04-23	h	\N
639	DUFFIEUX	Christophe	1950-01-29	h	\N
640	PINEL	Claude	1988-05-16	f	\N
641	ZOONEKYND	Christophe	1933-12-15	h	\N
642	CYR	Louise	1979-01-08	f	\N
643	ASSON	François	1975-11-11	h	\N
644	ESPI	Maurice	1987-01-07	h	\N
645	VEYRUNES	Raymond	1968-07-03	h	\N
646	HOUBRON	Nathalie	1935-03-05	f	\N
647	MALBRANQUE	Murielle	1979-11-07	f	\N
648	LIGEON	Maurice	1945-04-24	h	\N
649	TITEUX	Mathias	1953-07-05	h	\N
650	MAYO	Stanislas	1977-05-19	h	\N
651	SIDANER	Claude	1962-07-20	f	\N
652	BETHUS	Sophie	1968-10-07	f	\N
653	HORCHOLLE	Raoul	1959-10-09	h	\N
654	VERSCHAVE	Nathalie	1931-03-25	f	\N
655	HIRSON	Jean	1958-11-23	h	\N
656	AUSSARESSES	Sandrine	1972-06-11	f	\N
657	BRYCKAERT	Caroline	1940-07-10	f	\N
658	FILLIATRE	Francis	1988-04-17	h	\N
659	SAINT POL	Jacques	1971-03-10	h	\N
660	MESSER	Christian	1977-01-07	h	\N
661	MANRIQUE	Véronique	1950-05-26	f	\N
662	PANI	Caroline	1976-04-28	f	\N
663	COUPEZ	Christian	1938-05-19	h	\N
664	EMMANUEL	Anne	1939-11-29	f	\N
665	LIGEROT	Anne	1980-02-12	f	\N
666	FRIOT	Dominique	1959-12-31	h	\N
667	GALIOT	Mathias	1988-06-26	h	\N
668	PATILLON	Mathias	1955-07-21	h	\N
669	NELLE	Anne	1963-10-24	f	\N
671	CASSI	Claude	1941-05-17	f	\N
672	PEYROTTE	Dominique	1948-11-22	h	\N
673	BEAUDRIER	Mathias	1944-01-13	h	\N
674	SADKI	Pierre	1942-12-05	h	\N
675	SANTOS	Jean	1968-12-02	h	\N
676	AUBUGEAU	Stéphanie	1965-09-09	f	\N
677	SCHUFT	Jacques	1964-06-30	h	\N
678	DABOUDET	Raoul	1933-04-23	h	\N
679	CHERFAOUI	Bernard	1969-05-03	h	\N
680	CUISSE	Nadine	1975-06-10	f	\N
681	RIBE	Claude	1958-02-15	f	\N
682	MOINS	Carole	1931-03-29	f	\N
670	ANGAMA	Laurence	1933-09-21	f	587
633	LACOSSE	Françoise	1961-06-30	f	887
683	BROUSSOUX	Marie	1976-05-10	f	\N
684	MESTIVIER	Dominique	1973-08-10	f	\N
685	CAMAN	Raymond	1959-08-29	h	\N
686	MOYNIER	Gladys	1937-02-01	f	\N
687	MALFONDET	Pierre	1932-02-11	h	\N
688	JOUVEL	Anne	1954-05-03	f	\N
689	MEQUINION	Caroline	1956-11-01	f	\N
690	PRADAYROL	Christine	1981-04-21	f	\N
691	BATBEDAT	François	1953-01-07	h	\N
692	VELLEINE	Véronique	1953-05-31	f	\N
693	LATXAGUE	Sandrine	1932-07-31	f	\N
694	VILLACAMPA	Stéphane	1982-11-17	h	\N
695	ETOUARIA	Christian	1942-08-25	h	\N
696	KEDZIERSKI	Céline	1950-12-02	f	\N
697	LAGUEYRIE	Christine	1970-07-07	f	\N
698	MEDER	Béatrice	1941-12-02	f	\N
699	COMBAZ	Raoul	1968-07-29	h	\N
700	DOOM	Géraldine	1962-12-15	f	\N
701	TAGOT	Carole	1932-03-23	f	\N
702	MARX	Caroline	1960-06-27	f	\N
703	MONIQUE	Stéphanie	1956-04-09	f	\N
704	MIRMONT	Raymond	1945-03-06	h	\N
705	JANNET	Christian	1933-05-15	h	\N
706	GELINAUD	Marie	1934-08-13	f	\N
707	RONCIER	Nadine	1981-05-19	f	\N
708	LE NOC	Anne	1971-07-15	f	\N
709	DECAN	Francis	1958-01-30	h	\N
710	SAULOU	Pierre	1943-09-25	h	\N
711	CINQUINI	Christine	1983-01-25	f	\N
712	CHAUDAGNE	Dominique	1965-11-15	f	\N
713	AUDIARD	Claude	1977-04-08	h	\N
714	CONSIL	Françoise	1954-11-05	f	\N
715	VUYLSTEKER	Mathias	1959-05-10	h	\N
716	DUPLOYER	Christophe	1955-06-07	h	\N
717	FRANCHITTO	Christelle	1955-12-12	f	\N
718	BEIGNON	Christian	1950-06-19	h	\N
719	HACQUET	Stéphane	1975-11-27	h	\N
720	MAZIER	Véronique	1985-01-13	f	\N
721	BONHOMMET	Gladys	1939-01-04	f	\N
722	ALLUE	Bernard	1935-12-26	h	\N
723	DEVINEAU	Simon	1988-03-11	h	\N
725	COUTOUIS	Paul	1965-10-05	h	\N
726	DOTTI	Dominique	1964-03-13	f	\N
727	YACOUBI	Louise	1954-07-28	f	\N
728	DOLLO	Philippe	1964-09-04	h	\N
729	LE FLANCHEC	Céline	1980-02-21	f	\N
730	JUVENAL	Marc	1941-11-05	h	\N
731	BLOCHER	Caroline	1960-12-18	f	\N
732	TASSEZ	Michel	1947-07-22	h	\N
733	ORARD	Dominique	1983-11-24	h	\N
734	CAMPET	Cécile	1976-06-19	f	\N
735	WIDIEZ	Gladys	1935-07-01	f	\N
736	PREZIOSI	Marc	1972-04-07	h	\N
737	GUILVARD	Anne	1942-09-22	f	\N
738	HALLOT	Stanislas	1938-03-26	h	\N
739	LE GRILL	Véronique	1956-03-27	f	\N
740	LE BARBIER	Christine	1984-12-07	f	\N
741	COSTON	Marcel	1983-05-26	h	\N
742	HETIER	Marc	1987-11-27	h	\N
743	CHARRIE	Gladys	1966-12-25	f	\N
744	GARDON	Caroline	1972-08-21	f	\N
745	TAQUIN	Francis	1938-08-22	h	\N
746	HURST	Stéphane	1963-06-14	h	\N
747	BOULLE	Géraldine	1961-08-17	f	\N
748	LEBREUIL	Christian	1936-05-13	h	\N
749	BURLON	Louise	1959-12-22	f	\N
750	FOURMANOIR	Raoul	1953-09-27	h	\N
751	CHAPALAIN	Caroline	1931-08-23	f	\N
752	FOURIS	Béatrice	1938-04-15	f	\N
754	HABLOT	Marie	1969-05-02	f	\N
755	BOUCHAMA	Michèle	1971-11-23	f	\N
756	DAROUX	Michel	1974-06-20	h	\N
757	AGNES	Anne	1984-02-02	f	\N
758	GOUDENHOOFT	Mathias	1933-03-27	h	\N
759	TRUCCHI	Michèle	1972-06-23	f	\N
760	LECHEVALLIER	Simon	1944-11-11	h	\N
761	GOUMARD	Laurent	1981-06-19	h	\N
762	VERNADE	Béatrice	1949-04-15	f	\N
764	DELENCLOS	Claude	1940-10-18	h	\N
765	FIEVE	Nadine	1945-03-01	f	\N
766	GUILLEMET	Xavier	1935-06-23	h	\N
767	JAGGI	Cécile	1981-01-11	f	\N
768	VALENZUELA	Claude	1962-10-18	h	\N
769	COUCHET	Carole	1948-09-01	f	\N
770	SOLLIEC	Stanislas	1982-01-23	h	\N
771	ROQUEFORT	Françoise	1968-04-20	f	\N
772	MARCHYLLIE	Francis	1989-09-12	h	\N
773	MARTINEL	Nadine	1951-02-26	f	\N
774	NOSLEN	Véronique	1951-12-28	f	\N
775	LORCY	Stéphane	1976-10-09	h	\N
776	REGEARD	Mélanie	1937-05-22	f	\N
779	WULLENS	Christophe	1948-03-07	h	\N
780	DELZOR	Stéphanie	1957-03-15	f	\N
781	JUSTEAU	Marcel	1976-01-04	h	\N
782	BALLIET	Philippe	1939-06-19	h	\N
783	BOMBOIS	Nathalie	1978-04-11	f	\N
784	MALLINGER	Xavier	1983-10-12	h	\N
785	BOURY	Stéphane	1985-08-30	h	\N
786	BEAUCHESNE	Raymond	1981-08-01	h	\N
787	DANJOUX	François	1944-03-09	h	\N
788	LE BIHANNIC	Marine	1971-09-18	f	\N
789	NACHIN	Marie	1942-02-21	f	\N
790	RIAUDEL	Claude	1938-02-03	f	\N
791	ORS	Laurent	1989-02-04	h	\N
792	LEGON	Marine	1972-04-22	f	\N
794	FRANIATTE	Raoul	1954-10-11	h	\N
795	MAETZ	Mathias	1944-05-26	h	\N
796	LE GURUN	Carole	1971-11-11	f	\N
797	COLETTA	Christian	1986-04-14	h	\N
798	KROL	Bernard	1954-11-04	h	\N
799	TURLOT	Pierre	1968-04-08	h	\N
800	GUIDO	Paul	1956-07-12	h	\N
801	GOZLAN	Jacques	1952-06-17	h	\N
802	PIGNAUD	Louise	1949-08-26	f	\N
803	KRAU	Raoul	1937-06-11	h	\N
804	THON	Christine	1972-07-14	f	\N
805	VERDET	Christelle	1962-10-24	f	\N
806	URBANI	Marc	1933-07-27	h	\N
807	SAGNET	Françoise	1953-08-18	f	\N
808	BOURRIGAULT	Raoul	1949-09-11	h	\N
809	ORAND	Sophie	1951-11-08	f	\N
810	DUMAZEAU	Francis	1947-08-15	h	\N
811	MOURGUES	Murielle	1980-08-28	f	\N
812	POUPINOT	Nadine	1943-02-07	f	\N
813	M'BAREK	Christine	1987-04-26	f	\N
814	RIBIS	Raoul	1984-04-10	h	\N
815	LELIEVRE	Gladys	1948-03-11	f	\N
816	FORTES	François	1957-05-30	h	\N
817	NAPOL	Nathalie	1951-01-25	f	\N
818	DUBROCA	Gladys	1947-06-16	f	\N
778	MESMIN	Laurent	1984-11-03	h	604
777	BEAUFRETON	Cécile	1971-04-01	f	868
763	BOURDAT	Béatrice	1948-10-31	f	109
753	CRAPOULET	Nadine	1971-12-10	f	28
819	GETTO	Stéphanie	1962-02-01	f	\N
820	MARTINUZZI	Murielle	1967-03-06	f	\N
821	ANGLERAUD	Stéphanie	1933-01-24	f	\N
822	GAUTRAT	Serge	1983-07-11	h	\N
823	MERAS	Laurence	1967-02-22	f	\N
824	DEPUILLE	Laurent	1936-06-17	h	\N
825	CRAVERO	Cécile	1974-10-23	f	\N
826	PRESTAT	Mathias	1954-05-07	h	\N
827	HIGNARD	Céline	1969-07-01	f	\N
828	ARDISSON	Céline	1947-11-24	f	\N
829	MOURGUET	Maurice	1959-07-11	h	\N
830	BABUT	Carole	1940-02-02	f	\N
831	DE MONTGOLFIER	Francis	1966-12-07	h	\N
832	NAUDEAU	Marc	1964-08-19	h	\N
834	GURNAUD	Xavier	1954-10-23	h	\N
835	MONTLOUIS	Sandrine	1963-12-08	f	\N
836	CACHERA	Christelle	1938-04-20	f	\N
837	GAYDU	Sandrine	1988-11-06	f	\N
838	BOSMAN	Béatrice	1986-11-12	f	\N
839	JAFFUEL	Laurent	1966-07-02	h	\N
840	BOURGOGNE	Nadine	1969-01-27	f	\N
841	PELLAN	Nadine	1968-05-31	f	\N
842	AICH	Charles	1936-04-13	h	\N
843	CAMBOT	Murielle	1959-01-06	f	\N
844	SASIA	Béatrice	1951-08-11	f	\N
845	PASQUA	Christine	1945-01-28	f	\N
846	CHEVALET	Claude	1985-04-26	h	\N
847	MECHERI	Marine	1969-08-03	f	\N
848	MANCIAUX	Marie	1939-12-24	f	\N
849	ROUZIERE	Cécile	1960-01-30	f	\N
850	WALDVOGEL	Béatrice	1939-01-13	f	\N
851	WELTE	François	1953-04-28	h	\N
854	RUTH	Michèle	1962-11-23	f	\N
855	RUGGIERO	Pierre	1946-06-18	h	\N
856	BEN BRAHIM	Murielle	1936-01-07	f	\N
857	LEAR	Céline	1960-05-08	f	\N
858	HUNOT	Marcel	1965-03-09	h	\N
859	FERRUS	François	1977-04-26	h	\N
860	LACOTTE	Roger	1934-07-26	h	\N
861	PECASTAINGS	Carole	1966-03-16	f	\N
862	CHARMONT	Claude	1981-01-04	h	\N
863	JOYARD	Marie	1941-06-19	f	\N
865	MANGARD	Laurent	1945-03-25	h	\N
866	CARLINO	François	1942-07-27	h	\N
867	MARNET	Claude	1958-12-09	f	\N
868	TARLE	Francis	1982-09-01	h	\N
870	YOYOTTE	Paul	1944-01-11	h	\N
871	BOI	Simon	1932-09-01	h	\N
872	FURNARI	Michèle	1978-05-25	f	\N
873	SANTERNE	Laurence	1952-09-05	f	\N
874	GERTOSIO	Michèle	1950-05-02	f	\N
875	SIVIGNON	François	1944-03-04	h	\N
876	RESSICAUD	Françoise	1962-02-12	f	\N
877	MARATRAY	Anne	1971-02-14	f	\N
878	MAZE	Philippe	1969-09-19	h	\N
879	BAZEILLE	Anne	1948-05-19	f	\N
880	BLONBOU	Sophie	1967-05-02	f	\N
881	DEON	François	1933-12-02	h	\N
882	COURONNE	Michel	1951-05-30	h	\N
883	BAULT	Stéphanie	1981-04-19	f	\N
884	CAUMARTIN	Claude	1964-02-20	h	\N
885	DAMBRICOURT	Michel	1982-07-22	h	\N
886	MARIE-MAGDELAINE	Céline	1970-11-27	f	\N
887	VAILLS	Nadine	1948-08-22	f	\N
888	SAILLAN	Michèle	1953-02-15	f	\N
889	CALDERON	Cécile	1963-12-22	f	\N
890	BOURILLON	Stéphane	1947-11-27	h	\N
891	CHATTE	Sophie	1951-07-11	f	\N
892	KUBICKI	Laurent	1938-04-15	h	\N
893	AGOPIAN	Louise	1975-10-24	f	\N
894	SCHOTT	Louise	1977-04-22	f	\N
895	QUIQUEMPOIS	Marie	1969-07-05	f	\N
896	REYDEL	Laurent	1947-07-02	h	\N
897	TANTALE	Claude	1941-08-24	f	\N
898	RAFFNER	Nadine	1959-10-28	f	\N
899	RETAILLAUD	Francis	1985-05-17	h	\N
900	BOUCANSAUD	Céline	1981-07-17	f	\N
901	PECCOUD	Charles	1983-04-21	h	\N
902	CLOVIS	Michèle	1945-08-02	f	\N
903	RAPPE	Maurice	1987-10-28	h	\N
904	DIONET	Michèle	1980-07-10	f	\N
905	POUSSARDIN	Christian	1982-05-17	h	\N
906	DEGERINE	Sophie	1978-02-25	f	\N
907	FONTBONNE	Françoise	1958-07-30	f	\N
908	SCHARF	Laurent	1956-08-28	h	\N
909	MEREY	Marine	1984-12-30	f	\N
911	MALY	Dominique	1957-05-01	f	\N
912	VOULAND	Roger	1989-07-08	h	\N
913	RETHORE	Stéphanie	1956-08-24	f	\N
914	DJEBLI	Roger	1979-09-28	h	\N
915	JOUAN	Marie	1937-04-04	f	\N
916	LANASPEZE	Laurence	1954-10-05	f	\N
917	LOUVAT	Sandrine	1958-08-01	f	\N
918	ABAD	Laurence	1930-11-13	f	\N
919	BOUDALI	Sophie	1973-06-16	f	\N
920	QUAINON	Pierre	1968-07-09	h	\N
921	GACHASSIN	Céline	1985-11-03	f	\N
923	PAREZ	Michèle	1958-02-09	f	\N
924	AMOR	Christelle	1934-08-21	f	\N
925	CORDELLIER	Sandrine	1933-10-06	f	\N
926	GOURRIN	Pierre	1982-03-06	h	\N
927	MEILLIEZ	Michel	1988-09-04	h	\N
928	GOEHRY	Raoul	1949-10-08	h	\N
929	VILLECHANOUX	Céline	1937-05-22	f	\N
930	LE SOMMER	François	1935-09-17	h	\N
931	CARNET	Dominique	1956-08-14	f	\N
932	ROMINGER	Roger	1986-06-09	h	\N
933	LESAINT	Simon	1964-12-23	h	\N
934	RUFFIER DES AIMES	Laurence	1967-04-16	f	\N
935	BERLIER	Stéphanie	1972-06-21	f	\N
936	HERNAULT	Dominique	1937-11-25	f	\N
937	HENRIQUES	Caroline	1961-05-30	f	\N
938	DUREISSEIX	Marcel	1932-01-14	h	\N
939	LEFAUX	Marcel	1949-11-27	h	\N
940	SEYNAEVE	Christian	1954-01-15	h	\N
941	JUMELAIS	Louise	1978-03-05	f	\N
942	PASQUAY	Laurent	1951-09-26	h	\N
943	SEBILEAU	Christian	1937-04-27	h	\N
944	RAFFAITIN	Nathalie	1934-05-23	f	\N
945	OLERON	Stéphanie	1981-12-24	f	\N
946	COTEL	François	1983-05-07	h	\N
947	GERARDI	Bernard	1941-06-14	h	\N
948	CHARNY	François	1956-08-24	h	\N
949	SELLEM	Bernard	1932-09-02	h	\N
950	HOURMAN	Christophe	1935-07-13	h	\N
951	OUERGHI	Charles	1959-09-06	h	\N
952	EFFRAY	Françoise	1981-05-12	f	\N
953	BARIDON	Sandrine	1959-11-22	f	\N
864	MORIAME	Stéphane	1981-06-15	h	755
852	FERRARY	Francis	1983-10-31	h	760
833	BREART	Véronique	1976-07-15	f	848
922	CHAMONTIN	Stanislas	1977-05-25	h	170
910	HOSTEINS	Gladys	1934-08-02	f	11
955	CLEMENCEAU	Marcel	1959-05-22	h	\N
956	GADONNA	Véronique	1967-11-12	f	\N
957	CHASSAGNY	Christelle	1988-06-29	f	\N
958	RAGARU	Raymond	1932-08-17	h	\N
959	VALSECCHI	Véronique	1965-04-17	f	\N
960	BERTERO	Stanislas	1981-08-03	h	\N
961	LAIRY	Carole	1978-07-08	f	\N
962	BANCKAERT	Cécile	1986-10-04	f	\N
963	BROD	Jean	1979-07-17	h	\N
964	FYOT	François	1938-11-13	h	\N
965	MARUT	Xavier	1987-09-14	h	\N
966	MIROUX	Caroline	1945-07-23	f	\N
967	BALS	Véronique	1941-07-02	f	\N
968	CACAUD	Marie	1931-12-20	f	\N
969	PONTON	Jean	1939-04-07	h	\N
970	CAMPISTRON	Stéphanie	1980-09-12	f	\N
971	DELOZANNE	Laurence	1967-10-22	f	\N
973	ROSSIER	Bernard	1952-02-18	h	\N
974	BUSSONNAIS	Michèle	1980-11-14	f	\N
975	HEROULT	Laurence	1969-12-17	f	\N
976	FRICHETEAU	Christian	1932-07-28	h	\N
977	FOSSIER	Stéphane	1951-11-16	h	\N
978	ORIOL	Caroline	1931-03-24	f	\N
979	GROC	Nathalie	1971-08-14	f	\N
980	VIGNAND	Laurence	1971-12-25	f	\N
981	DRAVET	Sandrine	1942-02-27	f	\N
982	GABLE	Sandrine	1968-10-25	f	\N
983	DEGREMONT	Michèle	1944-01-06	f	\N
984	ZAGULA	Simon	1953-02-11	h	\N
985	IZOULET	Laurence	1933-06-23	f	\N
987	VILLELONGUE	Philippe	1972-01-24	h	\N
988	ASTRIE	Dominique	1968-11-26	h	\N
989	PANICHI	Louise	1943-02-06	f	\N
990	VRAIN	Géraldine	1981-06-22	f	\N
991	MAIANO	Céline	1943-01-06	f	\N
992	GIRERD	Cécile	1932-07-04	f	\N
993	FALCOU	Claude	1936-08-18	f	\N
994	BELARD	Francis	1945-02-18	h	\N
995	BALESTRIERI	Caroline	1987-09-03	f	\N
996	DELACHERIE	Stéphane	1935-12-14	h	\N
997	VALNET	Bernard	1980-01-14	h	\N
998	TODARO	Sandrine	1971-07-14	f	\N
999	PASSICOS	Jacques	1954-10-23	h	\N
1000	PEYRARD	Michel	1975-12-04	h	\N
402	BERNADAC	Michèle	1980-09-19	f	805
198	SCAGLIOLA	Gladys	1976-04-11	f	845
601	STEPANIAN	Marcel	1938-08-25	h	712
793	NAIME	Simon	1966-11-24	h	761
82	JANY	Francis	1977-12-28	h	556
486	GARRIC	Paul	1957-02-28	h	840
986	MONJARET	Béatrice	1955-08-07	f	353
972	DIEUSAERT	Nathalie	1964-02-19	f	187
869	BOUVRANDE	Carole	1987-12-12	f	338
457	FARINE	Christophe	1985-06-29	h	459
954	BRISTOL	Claude	1978-02-08	h	397
853	DEROUDILHE	Véronique	1937-04-04	f	307
144	BETRANCOURT	Stanislas	1962-06-13	h	704
122	POURTALET	Nathalie	1959-05-13	f	499
724	CAPOCCI	Géraldine	1971-01-21	f	463
309	FONTAS	Véronique	1987-12-10	f	357
\.


--
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commande (id, idclient, ladate, idadrlivraison, idpaiement) FROM stdin;
1	1	2020-04-15	2	1
2	1	2020-04-15	2	2
3	1	2020-04-25	2	1
4	2	2020-04-21	2	2
5	2	2020-04-04	2	2
6	2	2020-04-06	2	2
7	3	2020-04-05	2	1
8	3	2020-04-08	1	2
9	3	2020-04-29	2	1
10	3	2020-04-26	2	2
11	3	2020-04-20	1	2
12	4	2020-04-22	3	2
13	4	2020-04-09	1	1
14	5	2020-04-23	1	1
15	5	2020-04-29	2	3
16	5	2020-04-22	2	1
17	6	2020-04-13	1	2
18	7	2020-04-27	3	2
19	7	2020-04-12	2	3
20	7	2020-04-17	2	3
21	8	2020-04-04	2	2
22	8	2020-04-09	2	2
23	8	2020-04-14	3	2
24	8	2020-04-19	3	1
25	8	2020-04-25	1	1
26	9	2020-04-18	1	2
27	9	2020-04-04	1	3
28	10	2020-04-05	1	2
29	10	2020-04-08	1	1
30	10	2020-04-24	2	2
31	10	2020-04-01	1	3
32	11	2020-04-10	2	2
33	11	2020-04-14	2	2
34	11	2020-04-21	2	2
35	12	2020-04-19	2	3
36	12	2020-04-01	2	2
37	12	2020-04-27	2	2
38	12	2020-04-07	2	1
39	12	2020-04-08	2	2
40	12	2020-04-27	2	1
41	13	2020-04-18	1	2
42	13	2020-04-23	1	3
43	13	2020-04-24	1	3
44	13	2020-04-07	1	1
45	14	2020-04-05	3	2
46	14	2020-04-22	2	1
47	14	2020-04-13	1	1
48	15	2020-04-01	2	1
49	15	2020-04-05	2	2
50	15	2020-04-10	1	2
51	15	2020-04-10	2	1
52	16	2020-04-17	1	3
53	16	2020-04-15	2	3
54	16	2020-04-24	2	3
55	16	2020-04-02	1	1
56	16	2020-04-02	2	3
57	16	2020-04-01	1	3
58	17	2020-04-09	1	2
59	17	2020-04-25	2	3
60	18	2020-04-11	1	1
61	18	2020-04-01	1	2
62	18	2020-04-17	1	1
63	18	2020-04-19	1	1
64	19	2020-04-25	1	1
65	19	2020-04-05	1	1
66	19	2020-04-01	1	3
67	19	2020-04-18	2	2
68	19	2020-04-09	2	3
69	19	2020-04-07	2	2
70	20	2020-04-22	1	2
71	20	2020-04-06	1	3
72	20	2020-04-13	1	2
73	20	2020-04-13	1	1
74	20	2020-04-12	1	1
75	21	2020-04-18	2	2
76	21	2020-04-07	1	2
77	22	2020-04-06	1	1
78	23	2020-04-14	1	2
79	23	2020-04-02	1	3
80	24	2020-04-10	1	2
81	24	2020-04-03	1	1
82	24	2020-04-19	1	3
83	24	2020-04-14	1	2
84	24	2020-04-23	1	1
85	25	2020-04-24	2	3
86	25	2020-04-09	2	1
87	25	2020-04-17	1	2
88	26	2020-04-09	1	2
89	26	2020-04-12	1	3
90	26	2020-04-03	1	3
91	26	2020-04-26	1	2
92	26	2020-04-24	3	1
93	27	2020-04-05	1	2
94	27	2020-04-25	1	2
95	27	2020-04-04	1	2
96	28	2020-04-14	2	1
97	28	2020-04-16	2	3
98	28	2020-04-11	1	2
99	29	2020-04-10	2	1
100	30	2020-04-17	2	2
101	31	2020-04-25	2	1
102	31	2020-04-22	1	3
103	32	2020-04-19	1	2
104	32	2020-04-10	1	1
105	32	2020-04-06	1	3
106	33	2020-04-27	1	3
107	33	2020-04-03	2	2
108	34	2020-04-08	1	3
109	34	2020-04-17	2	3
110	35	2020-04-10	2	2
111	35	2020-04-25	1	3
112	36	2020-04-21	2	2
113	36	2020-04-02	2	2
114	36	2020-04-14	2	2
115	36	2020-04-11	1	2
116	37	2020-04-01	2	3
117	37	2020-04-08	2	3
118	37	2020-04-20	3	2
119	38	2020-04-14	1	2
120	38	2020-04-19	2	3
121	38	2020-04-26	2	2
122	38	2020-04-11	3	2
123	38	2020-04-20	1	2
124	38	2020-04-20	2	2
125	39	2020-04-11	1	2
126	39	2020-04-18	1	2
127	39	2020-04-11	1	1
128	40	2020-04-09	1	2
129	40	2020-04-02	1	1
130	40	2020-04-14	1	2
131	41	2020-04-26	1	1
132	41	2020-04-11	2	3
133	42	2020-04-03	2	2
134	42	2020-04-26	3	2
135	43	2020-04-18	1	1
136	43	2020-04-20	2	3
137	43	2020-04-07	1	1
138	43	2020-04-08	2	1
139	43	2020-04-06	2	1
140	44	2020-04-12	1	1
141	44	2020-04-26	2	1
142	44	2020-04-23	2	1
143	45	2020-04-07	1	1
144	45	2020-04-29	1	2
145	46	2020-04-15	1	2
146	46	2020-04-09	1	2
147	46	2020-04-02	1	3
148	46	2020-04-03	1	3
149	46	2020-04-18	1	1
150	47	2020-04-01	3	2
151	47	2020-04-18	1	2
152	47	2020-04-06	3	1
153	47	2020-04-03	2	1
154	47	2020-04-27	1	3
155	47	2020-04-13	2	3
156	48	2020-04-05	1	3
157	48	2020-04-16	1	2
158	48	2020-04-14	1	1
159	48	2020-04-17	1	1
160	48	2020-04-28	1	2
161	49	2020-04-05	1	2
162	49	2020-04-23	1	3
163	49	2020-04-13	1	2
164	49	2020-04-06	1	2
165	49	2020-04-06	1	2
166	50	2020-04-03	3	2
167	50	2020-04-21	3	3
168	51	2020-04-23	2	3
169	51	2020-04-25	2	2
170	51	2020-04-06	2	1
171	52	2020-04-02	2	2
172	52	2020-04-12	1	1
173	52	2020-04-29	1	2
174	52	2020-04-10	2	1
175	53	2020-04-07	1	1
176	53	2020-04-25	1	3
177	53	2020-04-05	1	2
178	53	2020-04-11	1	2
179	53	2020-04-15	1	3
180	54	2020-04-25	1	3
181	54	2020-04-27	2	2
182	54	2020-04-29	1	1
183	54	2020-04-16	2	2
184	54	2020-04-14	1	2
185	55	2020-04-03	1	3
186	56	2020-04-11	1	2
187	56	2020-04-06	2	3
188	57	2020-04-22	1	2
189	57	2020-04-15	1	2
190	58	2020-04-16	1	2
191	59	2020-04-10	1	1
192	60	2020-04-24	1	3
193	60	2020-04-09	1	2
194	60	2020-04-18	1	2
195	60	2020-04-04	1	1
196	61	2020-04-04	1	2
197	61	2020-04-20	2	2
198	61	2020-04-05	1	2
199	61	2020-04-08	1	2
200	61	2020-04-06	2	3
201	62	2020-04-21	1	1
202	62	2020-04-29	1	2
203	62	2020-04-21	1	2
204	62	2020-04-21	1	1
205	63	2020-04-13	1	2
206	63	2020-04-29	2	2
207	63	2020-04-11	2	2
208	63	2020-04-22	2	3
209	63	2020-04-29	1	1
210	64	2020-04-15	2	2
211	64	2020-04-22	3	3
212	64	2020-04-22	2	1
213	64	2020-04-23	3	3
214	64	2020-04-06	2	1
215	65	2020-04-06	2	2
216	65	2020-04-14	1	1
217	65	2020-04-16	2	3
218	66	2020-04-07	1	3
219	67	2020-04-27	2	2
220	67	2020-04-15	3	2
221	67	2020-04-02	2	1
222	67	2020-04-04	2	2
223	68	2020-04-10	1	1
224	68	2020-04-29	1	2
225	68	2020-04-20	1	2
226	68	2020-04-22	1	2
227	69	2020-04-15	2	2
228	69	2020-04-02	2	2
229	69	2020-04-26	2	3
230	70	2020-04-19	2	1
231	70	2020-04-25	2	3
232	70	2020-04-24	1	1
233	71	2020-04-05	1	1
234	71	2020-04-13	1	2
235	71	2020-04-06	1	3
236	71	2020-04-28	1	1
237	71	2020-04-11	1	3
238	72	2020-04-17	2	2
239	72	2020-04-28	2	2
240	73	2020-04-19	1	3
241	73	2020-04-13	2	1
242	73	2020-04-07	1	1
243	73	2020-04-02	1	2
244	74	2020-04-22	2	1
245	74	2020-04-15	2	1
246	74	2020-04-10	2	1
247	74	2020-04-09	1	3
248	74	2020-04-08	1	2
249	75	2020-04-07	1	2
250	75	2020-04-03	1	2
251	76	2020-04-07	1	1
252	76	2020-04-15	1	1
253	76	2020-04-09	1	1
254	77	2020-04-12	2	1
255	77	2020-04-27	2	2
256	77	2020-04-19	2	2
257	78	2020-04-17	2	3
258	78	2020-04-09	1	3
259	79	2020-04-26	2	1
260	79	2020-04-20	1	2
261	80	2020-04-10	2	1
262	80	2020-04-17	2	1
263	81	2020-04-13	2	1
264	81	2020-04-13	1	1
265	81	2020-04-28	2	2
266	81	2020-04-09	1	3
267	82	2020-04-17	1	2
268	82	2020-04-24	2	3
269	82	2020-04-25	2	2
270	82	2020-04-09	2	2
271	82	2020-04-01	1	2
272	82	2020-04-26	1	2
273	83	2020-04-23	1	2
274	83	2020-04-17	1	2
275	83	2020-04-15	1	2
276	83	2020-04-21	1	2
277	83	2020-04-10	1	3
278	83	2020-04-14	1	3
279	84	2020-04-14	1	3
280	84	2020-04-08	1	1
281	85	2020-04-11	1	1
282	85	2020-04-18	1	2
283	85	2020-04-19	1	1
284	86	2020-04-19	1	1
285	86	2020-04-04	2	2
286	86	2020-04-26	3	2
287	86	2020-04-24	2	2
288	86	2020-04-24	2	2
289	87	2020-04-29	2	1
290	87	2020-04-24	1	2
291	87	2020-04-04	1	3
292	88	2020-04-09	1	3
293	88	2020-04-09	1	2
294	88	2020-04-02	2	1
295	89	2020-04-03	2	1
296	89	2020-04-25	3	3
297	89	2020-04-29	1	1
298	89	2020-04-11	3	2
299	89	2020-04-24	1	2
300	89	2020-04-20	3	1
301	90	2020-04-06	3	2
302	90	2020-04-05	2	2
303	90	2020-04-08	3	3
304	90	2020-04-07	3	3
305	90	2020-04-29	2	2
306	91	2020-04-02	1	1
307	91	2020-04-12	1	2
308	91	2020-04-03	1	2
309	92	2020-04-22	1	3
310	92	2020-04-02	1	2
311	92	2020-04-26	1	2
312	92	2020-04-10	1	3
313	92	2020-04-11	1	2
314	93	2020-04-22	1	2
315	93	2020-04-21	2	1
316	93	2020-04-12	1	2
317	93	2020-04-16	1	3
318	93	2020-04-24	1	2
319	94	2020-04-24	1	3
320	94	2020-04-05	1	2
321	94	2020-04-07	1	2
322	94	2020-04-14	1	3
323	94	2020-04-11	1	2
324	94	2020-04-04	1	3
325	95	2020-04-26	1	2
326	96	2020-04-29	2	2
327	96	2020-04-04	1	2
328	96	2020-04-03	2	3
329	96	2020-04-21	1	2
330	97	2020-04-01	1	2
331	97	2020-04-01	2	3
332	97	2020-04-03	3	1
333	97	2020-04-28	3	2
334	98	2020-04-29	1	1
335	98	2020-04-25	1	3
336	98	2020-04-15	1	2
337	98	2020-04-29	1	1
338	98	2020-04-08	1	3
339	99	2020-04-17	2	2
340	99	2020-04-25	2	2
341	99	2020-04-24	1	3
342	99	2020-04-29	2	2
343	99	2020-04-15	1	1
344	100	2020-04-16	1	3
345	100	2020-04-03	1	1
346	100	2020-04-17	1	2
347	100	2020-04-09	1	3
348	100	2020-04-21	1	3
349	101	2020-04-18	1	2
350	101	2020-04-21	1	2
351	101	2020-04-15	1	2
352	101	2020-04-04	1	2
353	102	2020-04-25	2	1
354	102	2020-04-24	2	2
355	103	2020-04-10	1	1
356	103	2020-04-16	1	2
357	103	2020-04-29	1	1
358	104	2020-04-06	3	2
359	104	2020-04-14	2	2
360	104	2020-04-15	1	3
361	104	2020-04-24	1	1
362	104	2020-04-20	3	2
363	105	2020-04-24	2	3
364	105	2020-04-14	1	2
365	105	2020-04-28	2	3
366	105	2020-04-03	2	1
367	105	2020-04-14	1	2
368	106	2020-04-07	1	2
369	106	2020-04-28	1	3
370	106	2020-04-25	1	3
371	106	2020-04-01	2	1
372	106	2020-04-21	1	2
373	107	2020-04-23	1	1
374	107	2020-04-14	2	2
375	108	2020-04-27	1	3
376	108	2020-04-03	3	2
377	108	2020-04-01	1	1
378	108	2020-04-15	1	2
379	109	2020-04-26	2	1
380	109	2020-04-28	1	3
381	109	2020-04-25	1	2
382	109	2020-04-15	2	2
383	109	2020-04-18	1	3
384	110	2020-04-20	2	1
385	110	2020-04-21	1	3
386	110	2020-04-19	1	3
387	110	2020-04-06	1	2
388	111	2020-04-09	1	2
389	111	2020-04-22	1	2
390	111	2020-04-24	1	1
391	111	2020-04-21	1	1
392	112	2020-04-22	1	1
393	112	2020-04-28	1	3
394	112	2020-04-03	1	2
395	112	2020-04-23	1	1
396	113	2020-04-01	1	2
397	113	2020-04-22	1	2
398	113	2020-04-24	1	2
399	113	2020-04-08	1	2
400	113	2020-04-25	1	2
401	114	2020-04-20	2	3
402	114	2020-04-02	1	1
403	114	2020-04-16	1	3
404	114	2020-04-20	2	2
405	114	2020-04-03	2	1
406	114	2020-04-10	2	3
407	115	2020-04-26	1	3
408	115	2020-04-14	1	2
409	115	2020-04-26	1	1
410	115	2020-04-15	2	3
411	116	2020-04-09	1	2
412	116	2020-04-27	1	3
413	116	2020-04-09	1	3
414	117	2020-04-28	2	2
415	117	2020-04-12	1	2
416	117	2020-04-10	2	2
417	117	2020-04-24	2	2
418	117	2020-04-14	1	1
419	118	2020-04-18	1	2
420	118	2020-04-12	1	2
421	118	2020-04-20	1	1
422	118	2020-04-10	1	3
423	118	2020-04-20	1	3
424	119	2020-04-29	2	1
425	119	2020-04-17	2	2
426	119	2020-04-02	2	1
427	120	2020-04-21	1	2
428	120	2020-04-29	2	2
429	120	2020-04-11	2	1
430	120	2020-04-08	2	2
431	120	2020-04-27	1	1
432	120	2020-04-21	2	2
433	121	2020-04-10	2	3
434	121	2020-04-28	1	2
435	121	2020-04-01	1	1
436	121	2020-04-26	1	1
437	122	2020-04-02	1	3
438	122	2020-04-28	1	2
439	122	2020-04-15	1	1
440	123	2020-04-29	2	2
441	123	2020-04-06	1	2
442	123	2020-04-17	1	1
443	124	2020-04-13	2	2
444	124	2020-04-12	1	2
445	124	2020-04-26	1	2
446	124	2020-04-17	2	2
447	124	2020-04-06	1	2
448	124	2020-04-05	2	3
449	125	2020-04-08	1	1
450	125	2020-04-17	1	3
451	126	2020-04-01	1	2
452	126	2020-04-03	2	2
453	126	2020-04-13	2	2
454	127	2020-04-15	3	2
455	127	2020-04-04	2	2
456	127	2020-04-14	3	1
457	127	2020-04-25	1	3
458	128	2020-04-07	2	1
459	129	2020-04-06	1	1
460	129	2020-04-07	3	2
461	129	2020-04-22	3	1
462	129	2020-04-28	2	1
463	129	2020-04-15	2	3
464	130	2020-04-15	2	2
465	131	2020-04-20	1	1
466	131	2020-04-11	1	1
467	131	2020-04-23	2	1
468	131	2020-04-09	2	3
469	131	2020-04-01	1	2
470	131	2020-04-15	2	3
471	132	2020-04-29	1	2
472	132	2020-04-10	2	2
473	132	2020-04-10	2	2
474	132	2020-04-02	1	2
475	133	2020-04-11	1	2
476	133	2020-04-29	1	1
477	133	2020-04-12	1	1
478	134	2020-04-19	1	1
479	134	2020-04-12	1	3
480	134	2020-04-08	1	2
481	134	2020-04-21	1	2
482	135	2020-04-12	1	2
483	135	2020-04-08	1	1
484	135	2020-04-17	1	2
485	136	2020-04-15	2	2
486	136	2020-04-09	1	3
487	136	2020-04-19	2	3
488	136	2020-04-08	2	2
489	136	2020-04-21	2	3
490	136	2020-04-28	2	2
491	137	2020-04-27	1	2
492	137	2020-04-02	1	1
493	137	2020-04-21	1	2
494	137	2020-04-15	1	2
495	138	2020-04-22	1	2
496	138	2020-04-18	1	2
497	138	2020-04-04	2	2
498	139	2020-04-13	1	3
499	139	2020-04-28	2	1
500	140	2020-04-17	1	2
501	140	2020-04-06	1	2
502	140	2020-04-10	1	3
503	140	2020-04-07	1	1
504	141	2020-04-02	1	1
505	141	2020-04-17	1	1
506	141	2020-04-26	1	2
507	142	2020-04-19	2	3
508	142	2020-04-22	1	2
509	142	2020-04-08	2	1
510	142	2020-04-23	2	2
511	142	2020-04-15	2	3
512	143	2020-04-26	1	2
513	143	2020-04-14	2	2
514	143	2020-04-08	2	2
515	144	2020-04-28	1	3
516	144	2020-04-09	1	3
517	144	2020-04-27	1	1
518	145	2020-04-07	2	3
519	145	2020-04-22	2	2
520	145	2020-04-02	1	2
521	145	2020-04-26	2	1
522	145	2020-04-03	2	2
523	146	2020-04-21	3	3
524	147	2020-04-17	1	3
525	147	2020-04-11	1	2
526	147	2020-04-24	1	2
527	147	2020-04-19	1	1
528	147	2020-04-07	1	1
529	148	2020-04-06	2	3
530	148	2020-04-05	2	2
531	148	2020-04-13	3	2
532	148	2020-04-25	2	2
533	149	2020-04-01	2	2
534	150	2020-04-03	1	1
535	150	2020-04-21	2	3
536	150	2020-04-22	2	3
537	150	2020-04-13	2	2
538	150	2020-04-06	2	3
539	151	2020-04-19	1	3
540	152	2020-04-09	1	1
541	152	2020-04-22	2	2
542	153	2020-04-04	1	3
543	153	2020-04-20	1	1
544	153	2020-04-11	1	2
545	154	2020-04-12	1	1
546	154	2020-04-17	2	1
547	154	2020-04-24	1	1
548	155	2020-04-22	1	2
549	155	2020-04-07	1	2
550	155	2020-04-05	1	2
551	155	2020-04-15	1	3
552	156	2020-04-02	2	2
553	156	2020-04-06	2	1
554	157	2020-04-25	1	2
555	157	2020-04-25	1	2
556	157	2020-04-05	1	3
557	157	2020-04-01	1	1
558	157	2020-04-19	1	2
559	158	2020-04-10	1	2
560	158	2020-04-22	1	1
561	158	2020-04-10	1	1
562	158	2020-04-04	1	2
563	159	2020-04-23	2	1
564	159	2020-04-08	1	3
565	159	2020-04-18	1	3
566	159	2020-04-24	2	1
567	159	2020-04-21	1	2
568	160	2020-04-28	1	2
569	160	2020-04-03	1	2
570	160	2020-04-08	2	1
571	160	2020-04-03	2	1
572	160	2020-04-01	2	2
573	161	2020-04-23	1	3
574	161	2020-04-22	3	1
575	162	2020-04-09	2	2
576	162	2020-04-25	1	1
577	163	2020-04-13	2	1
578	163	2020-04-23	2	1
579	163	2020-04-13	1	2
580	163	2020-04-06	2	1
581	164	2020-04-15	2	3
582	164	2020-04-25	1	3
583	164	2020-04-05	3	3
584	164	2020-04-08	1	3
585	164	2020-04-02	3	3
586	165	2020-04-14	2	1
587	165	2020-04-20	2	2
588	165	2020-04-06	3	2
589	165	2020-04-12	2	2
590	165	2020-04-04	2	2
591	166	2020-04-01	2	2
592	166	2020-04-23	1	3
593	166	2020-04-12	1	2
594	166	2020-04-26	1	2
595	167	2020-04-02	1	2
596	167	2020-04-09	1	3
597	167	2020-04-15	1	3
598	168	2020-04-09	1	1
599	168	2020-04-01	1	2
600	168	2020-04-20	1	3
601	168	2020-04-16	1	3
602	169	2020-04-15	3	2
603	169	2020-04-05	3	2
604	169	2020-04-03	1	2
605	169	2020-04-22	3	2
606	170	2020-04-23	1	2
607	170	2020-04-13	2	2
608	170	2020-04-05	2	2
609	170	2020-04-02	2	2
610	170	2020-04-24	2	2
611	171	2020-04-01	1	1
612	171	2020-04-17	1	1
613	171	2020-04-04	1	1
614	171	2020-04-09	1	2
615	172	2020-04-26	1	2
616	172	2020-04-13	2	1
617	172	2020-04-28	1	1
618	172	2020-04-05	2	3
619	173	2020-04-05	1	1
620	173	2020-04-12	1	3
621	173	2020-04-08	1	3
622	173	2020-04-23	2	2
623	174	2020-04-13	1	2
624	174	2020-04-28	1	2
625	174	2020-04-09	1	2
626	174	2020-04-24	1	3
627	174	2020-04-12	1	3
628	174	2020-04-06	1	1
629	175	2020-04-12	3	2
630	175	2020-04-25	2	3
631	175	2020-04-27	3	3
632	175	2020-04-27	3	1
633	176	2020-04-22	2	2
634	176	2020-04-10	2	1
635	177	2020-04-11	3	2
636	177	2020-04-14	2	2
637	178	2020-04-06	2	3
638	178	2020-04-02	2	2
639	178	2020-04-06	2	2
640	179	2020-04-05	1	2
641	179	2020-04-27	1	3
642	179	2020-04-11	1	1
643	179	2020-04-01	1	1
644	179	2020-04-28	1	1
645	180	2020-04-24	1	2
646	181	2020-04-21	1	2
647	181	2020-04-10	1	3
648	181	2020-04-12	1	1
649	181	2020-04-04	1	3
650	181	2020-04-15	1	3
651	182	2020-04-28	1	2
652	182	2020-04-21	1	1
653	182	2020-04-23	1	1
654	182	2020-04-17	1	3
655	183	2020-04-19	2	3
656	183	2020-04-10	1	2
657	183	2020-04-29	2	3
658	183	2020-04-02	2	2
659	183	2020-04-07	1	1
660	184	2020-04-06	1	2
661	184	2020-04-02	2	2
662	184	2020-04-22	1	3
663	184	2020-04-01	1	2
664	185	2020-04-11	2	1
665	186	2020-04-29	1	2
666	186	2020-04-01	1	2
667	187	2020-04-27	2	2
668	187	2020-04-22	2	3
669	187	2020-04-06	2	1
670	187	2020-04-16	2	1
671	188	2020-04-28	2	2
672	188	2020-04-29	1	3
673	188	2020-04-15	2	2
674	188	2020-04-08	2	2
675	188	2020-04-13	1	1
676	189	2020-04-07	1	1
677	189	2020-04-20	3	2
678	189	2020-04-26	3	2
679	189	2020-04-18	2	2
680	189	2020-04-27	2	3
681	190	2020-04-21	2	3
682	190	2020-04-10	1	2
683	191	2020-04-22	1	2
684	192	2020-04-03	1	2
685	192	2020-04-04	2	2
686	192	2020-04-07	1	2
687	193	2020-04-03	1	2
688	193	2020-04-25	2	1
689	193	2020-04-22	2	3
690	193	2020-04-19	2	1
691	194	2020-04-22	2	2
692	195	2020-04-14	2	1
693	195	2020-04-18	1	1
694	195	2020-04-22	1	3
695	195	2020-04-23	2	2
696	196	2020-04-02	1	3
697	196	2020-04-03	2	2
698	196	2020-04-10	2	3
699	196	2020-04-01	2	2
700	197	2020-04-23	2	2
701	198	2020-04-06	1	2
702	198	2020-04-14	1	3
703	198	2020-04-01	1	2
704	198	2020-04-08	1	2
705	199	2020-04-09	2	3
706	199	2020-04-14	2	2
707	199	2020-04-24	1	1
708	200	2020-04-23	2	3
709	200	2020-04-10	3	3
710	200	2020-04-14	2	2
711	201	2020-04-09	1	3
712	201	2020-04-24	2	3
713	201	2020-04-20	1	1
714	201	2020-04-26	1	3
715	201	2020-04-02	1	2
716	202	2020-04-18	2	1
717	202	2020-04-05	2	3
718	202	2020-04-16	1	2
719	202	2020-04-02	2	1
720	203	2020-04-19	1	2
721	203	2020-04-19	1	2
722	203	2020-04-15	1	2
723	203	2020-04-25	1	3
724	204	2020-04-29	1	2
725	205	2020-04-22	1	1
726	205	2020-04-26	1	2
727	206	2020-04-03	2	2
728	206	2020-04-06	2	3
729	206	2020-04-27	2	2
730	206	2020-04-19	2	3
731	206	2020-04-05	2	1
732	207	2020-04-21	3	2
733	207	2020-04-06	2	3
734	208	2020-04-04	2	3
735	208	2020-04-09	1	3
736	209	2020-04-07	2	3
737	209	2020-04-22	1	2
738	210	2020-04-15	2	1
739	210	2020-04-04	2	2
740	210	2020-04-17	2	1
741	210	2020-04-14	2	1
742	210	2020-04-24	2	3
743	211	2020-04-27	2	1
744	211	2020-04-25	1	3
745	211	2020-04-05	2	2
746	211	2020-04-29	2	2
747	211	2020-04-13	2	1
748	211	2020-04-01	2	2
749	212	2020-04-25	1	2
750	212	2020-04-18	2	1
751	212	2020-04-17	2	3
752	212	2020-04-07	1	3
753	213	2020-04-22	1	1
754	213	2020-04-12	2	1
755	213	2020-04-03	2	2
756	213	2020-04-21	1	2
757	214	2020-04-19	1	2
758	214	2020-04-09	1	2
759	214	2020-04-16	1	1
760	215	2020-04-23	2	2
761	215	2020-04-02	2	2
762	215	2020-04-02	2	2
763	216	2020-04-11	1	2
764	216	2020-04-23	2	3
765	216	2020-04-11	2	1
766	216	2020-04-27	2	2
767	216	2020-04-21	1	3
768	216	2020-04-02	1	3
769	217	2020-04-26	2	2
770	217	2020-04-26	3	1
771	217	2020-04-24	3	2
772	217	2020-04-08	3	2
773	217	2020-04-03	3	1
774	217	2020-04-14	2	2
775	218	2020-04-11	1	1
776	218	2020-04-02	1	2
777	219	2020-04-07	2	2
778	219	2020-04-29	2	2
779	219	2020-04-15	2	2
780	220	2020-04-07	2	2
781	220	2020-04-27	1	1
782	220	2020-04-22	2	2
783	220	2020-04-18	2	2
784	221	2020-04-23	2	1
785	221	2020-04-15	2	1
786	221	2020-04-15	2	1
787	221	2020-04-23	2	3
788	222	2020-04-27	2	3
789	222	2020-04-14	2	3
790	223	2020-04-13	1	3
791	223	2020-04-04	1	3
792	224	2020-04-27	1	2
793	224	2020-04-26	1	3
794	225	2020-04-22	1	3
795	225	2020-04-11	1	2
796	226	2020-04-13	1	2
797	226	2020-04-19	1	2
798	226	2020-04-19	1	2
799	226	2020-04-16	1	2
800	226	2020-04-17	1	1
801	226	2020-04-04	1	3
802	227	2020-04-18	2	2
803	228	2020-04-25	3	1
804	228	2020-04-19	3	2
805	228	2020-04-22	1	3
806	228	2020-04-03	2	3
807	228	2020-04-23	2	2
808	229	2020-04-05	1	2
809	229	2020-04-16	2	1
810	229	2020-04-14	1	3
811	229	2020-04-10	2	1
812	229	2020-04-20	1	1
813	229	2020-04-16	1	1
814	230	2020-04-10	2	2
815	230	2020-04-17	1	2
816	230	2020-04-24	2	2
817	231	2020-04-04	1	2
818	231	2020-04-03	2	1
819	232	2020-04-21	2	2
820	232	2020-04-23	1	3
821	233	2020-04-29	2	2
822	233	2020-04-18	1	1
823	233	2020-04-16	2	1
824	233	2020-04-24	1	1
825	233	2020-04-14	1	3
826	234	2020-04-20	1	2
827	234	2020-04-26	2	3
828	234	2020-04-02	1	2
829	234	2020-04-03	2	3
830	235	2020-04-18	1	2
831	235	2020-04-15	1	3
832	235	2020-04-24	1	2
833	235	2020-04-10	1	2
834	235	2020-04-29	1	2
835	236	2020-04-21	2	2
836	236	2020-04-25	2	2
837	236	2020-04-12	2	2
838	236	2020-04-28	2	1
839	237	2020-04-29	1	3
840	237	2020-04-12	1	3
841	237	2020-04-08	1	3
842	237	2020-04-21	1	2
843	237	2020-04-07	1	1
844	237	2020-04-05	1	1
845	238	2020-04-22	1	2
846	238	2020-04-09	1	3
847	238	2020-04-27	1	2
848	238	2020-04-08	1	2
849	238	2020-04-15	2	2
850	239	2020-04-27	2	1
851	239	2020-04-29	2	1
852	239	2020-04-11	1	2
853	240	2020-04-29	1	3
854	240	2020-04-07	2	1
855	240	2020-04-10	1	2
856	240	2020-04-06	2	3
857	240	2020-04-17	1	2
858	240	2020-04-06	1	2
859	241	2020-04-18	2	2
860	241	2020-04-18	1	1
861	241	2020-04-21	1	1
862	242	2020-04-17	1	2
863	242	2020-04-24	1	3
864	242	2020-04-01	1	2
865	242	2020-04-13	1	3
866	243	2020-04-26	1	1
867	243	2020-04-09	3	2
868	243	2020-04-22	3	2
869	243	2020-04-02	1	1
870	243	2020-04-13	2	3
871	244	2020-04-27	2	1
872	245	2020-04-18	1	2
873	245	2020-04-14	1	1
874	245	2020-04-21	1	1
875	245	2020-04-24	1	3
876	245	2020-04-25	1	3
877	246	2020-04-16	1	3
878	246	2020-04-22	2	3
879	247	2020-04-23	1	1
880	247	2020-04-09	1	2
881	247	2020-04-17	2	3
882	247	2020-04-11	2	3
883	247	2020-04-06	1	3
884	248	2020-04-14	1	2
885	248	2020-04-24	1	1
886	248	2020-04-14	1	2
887	249	2020-04-29	1	2
888	249	2020-04-08	1	1
889	249	2020-04-21	1	1
890	249	2020-04-16	1	1
891	250	2020-04-02	2	2
892	250	2020-04-25	3	1
893	251	2020-04-28	1	1
894	251	2020-04-27	3	1
895	252	2020-04-23	1	2
896	252	2020-04-12	1	2
897	252	2020-04-20	1	3
898	252	2020-04-10	1	2
899	253	2020-04-11	2	1
900	253	2020-04-14	2	3
901	253	2020-04-22	2	1
902	253	2020-04-01	1	3
903	253	2020-04-06	3	1
904	254	2020-04-20	1	2
905	254	2020-04-02	1	3
906	254	2020-04-21	2	3
907	254	2020-04-18	2	3
908	255	2020-04-11	2	2
909	255	2020-04-07	1	2
910	255	2020-04-08	1	3
911	256	2020-04-24	2	2
912	256	2020-04-20	1	3
913	256	2020-04-04	1	2
914	256	2020-04-27	1	3
915	256	2020-04-01	1	2
916	256	2020-04-24	2	1
917	257	2020-04-07	1	3
918	257	2020-04-24	2	3
919	257	2020-04-07	1	1
920	257	2020-04-18	2	2
921	257	2020-04-20	2	2
922	258	2020-04-15	2	2
923	258	2020-04-16	2	2
924	258	2020-04-07	1	2
925	259	2020-04-16	1	3
926	259	2020-04-29	2	3
927	259	2020-04-27	1	2
928	259	2020-04-16	2	1
929	260	2020-04-21	1	3
930	260	2020-04-10	2	3
931	260	2020-04-08	1	1
932	261	2020-04-13	1	1
933	261	2020-04-23	1	1
934	261	2020-04-07	2	3
935	261	2020-04-19	2	2
936	261	2020-04-06	1	2
937	262	2020-04-12	1	1
938	262	2020-04-04	1	3
939	262	2020-04-21	1	2
940	262	2020-04-19	1	3
941	262	2020-04-09	1	3
942	263	2020-04-03	1	1
943	263	2020-04-29	1	2
944	263	2020-04-07	1	2
945	263	2020-04-05	1	2
946	263	2020-04-15	1	2
947	264	2020-04-27	1	2
948	264	2020-04-02	1	2
949	265	2020-04-09	1	1
950	265	2020-04-29	1	1
951	265	2020-04-16	1	2
952	265	2020-04-19	1	2
953	265	2020-04-10	1	2
954	265	2020-04-24	1	3
955	266	2020-04-10	1	2
956	266	2020-04-13	1	2
957	266	2020-04-15	1	3
958	266	2020-04-09	1	2
959	267	2020-04-22	2	2
960	267	2020-04-14	3	2
961	267	2020-04-12	2	2
962	268	2020-04-10	2	1
963	269	2020-04-10	1	1
964	269	2020-04-27	1	2
965	269	2020-04-23	1	2
966	269	2020-04-25	1	3
967	269	2020-04-10	1	3
968	269	2020-04-18	1	3
969	270	2020-04-08	1	3
970	270	2020-04-20	1	1
971	270	2020-04-12	1	3
972	270	2020-04-16	1	2
973	270	2020-04-04	1	2
974	271	2020-04-13	2	3
975	271	2020-04-29	3	2
976	271	2020-04-10	2	2
977	271	2020-04-11	2	1
978	272	2020-04-09	1	1
979	272	2020-04-06	1	1
980	272	2020-04-27	1	2
981	272	2020-04-08	1	2
982	272	2020-04-21	1	3
983	273	2020-04-14	1	2
984	273	2020-04-14	2	1
985	274	2020-04-12	3	2
986	274	2020-04-11	2	3
987	274	2020-04-19	3	2
988	274	2020-04-07	2	2
989	274	2020-04-06	2	1
990	275	2020-04-28	1	3
991	275	2020-04-10	1	2
992	276	2020-04-12	1	2
993	276	2020-04-06	1	2
994	277	2020-04-17	1	1
995	277	2020-04-17	1	3
996	278	2020-04-23	2	2
997	278	2020-04-01	1	3
998	278	2020-04-20	1	2
999	278	2020-04-12	2	2
1000	278	2020-04-26	2	2
1001	278	2020-04-17	2	2
1002	279	2020-04-15	1	1
1003	280	2020-04-12	2	1
1004	280	2020-04-21	2	3
1005	280	2020-04-24	2	1
1006	280	2020-04-27	2	2
1007	280	2020-04-27	2	3
1008	281	2020-04-13	1	2
1009	281	2020-04-15	1	2
1010	281	2020-04-12	2	1
1011	281	2020-04-29	1	3
1012	281	2020-04-04	1	2
1013	282	2020-04-24	1	1
1014	282	2020-04-25	1	3
1015	282	2020-04-21	1	2
1016	282	2020-04-26	1	3
1017	283	2020-04-21	3	2
1018	283	2020-04-09	2	3
1019	283	2020-04-15	2	3
1020	283	2020-04-06	3	2
1021	284	2020-04-29	1	1
1022	284	2020-04-26	1	1
1023	285	2020-04-03	1	1
1024	285	2020-04-26	2	1
1025	285	2020-04-12	2	2
1026	285	2020-04-29	2	3
1027	285	2020-04-23	1	2
1028	286	2020-04-29	2	1
1029	286	2020-04-29	1	3
1030	286	2020-04-02	2	2
1031	286	2020-04-01	1	2
1032	287	2020-04-15	1	2
1033	287	2020-04-04	2	2
1034	287	2020-04-03	2	2
1035	287	2020-04-07	1	3
1036	287	2020-04-05	2	3
1037	287	2020-04-28	2	1
1038	288	2020-04-03	2	3
1039	289	2020-04-02	1	3
1040	290	2020-04-05	1	2
1041	290	2020-04-13	1	2
1042	290	2020-04-02	1	1
1043	290	2020-04-02	1	1
1044	291	2020-04-03	1	2
1045	292	2020-04-19	1	2
1046	292	2020-04-13	1	2
1047	292	2020-04-01	1	1
1048	292	2020-04-04	1	2
1049	293	2020-04-18	2	3
1050	293	2020-04-22	2	2
1051	293	2020-04-14	3	3
1052	294	2020-04-04	1	3
1053	294	2020-04-09	2	2
1054	295	2020-04-17	2	2
1055	295	2020-04-16	2	1
1056	296	2020-04-18	3	2
1057	296	2020-04-13	2	2
1058	296	2020-04-24	2	2
1059	297	2020-04-02	1	1
1060	297	2020-04-14	2	2
1061	297	2020-04-14	2	3
1062	298	2020-04-03	1	2
1063	298	2020-04-14	3	1
1064	298	2020-04-23	2	3
1065	298	2020-04-10	2	2
1066	299	2020-04-10	2	3
1067	299	2020-04-19	2	2
1068	299	2020-04-17	2	1
1069	299	2020-04-29	1	2
1070	299	2020-04-24	2	3
1071	300	2020-04-07	1	2
1072	300	2020-04-24	2	2
1073	300	2020-04-21	2	3
1074	300	2020-04-15	1	2
1075	301	2020-04-18	3	3
1076	301	2020-04-08	1	2
1077	301	2020-04-10	2	3
1078	302	2020-04-06	2	2
1079	302	2020-04-27	2	1
1080	302	2020-04-09	1	1
1081	302	2020-04-04	2	1
1082	303	2020-04-12	2	2
1083	303	2020-04-28	3	1
1084	304	2020-04-22	1	3
1085	305	2020-04-15	1	2
1086	305	2020-04-06	1	2
1087	305	2020-04-05	2	2
1088	305	2020-04-26	1	2
1089	306	2020-04-25	1	1
1090	306	2020-04-09	1	3
1091	306	2020-04-28	1	2
1092	306	2020-04-10	1	3
1093	307	2020-04-09	2	1
1094	307	2020-04-10	1	2
1095	307	2020-04-27	2	3
1096	307	2020-04-10	1	2
1097	307	2020-04-07	1	2
1098	308	2020-04-10	1	2
1099	308	2020-04-16	2	3
1100	308	2020-04-01	2	1
1101	308	2020-04-28	1	2
1102	309	2020-04-16	2	2
1103	309	2020-04-12	2	2
1104	310	2020-04-02	2	2
1105	310	2020-04-13	1	1
1106	310	2020-04-02	1	2
1107	311	2020-04-24	2	3
1108	311	2020-04-25	2	1
1109	311	2020-04-28	2	3
1110	312	2020-04-17	1	2
1111	312	2020-04-12	1	3
1112	312	2020-04-28	1	1
1113	312	2020-04-03	1	1
1114	312	2020-04-22	1	2
1115	312	2020-04-19	1	1
1116	313	2020-04-02	2	2
1117	313	2020-04-22	1	3
1118	313	2020-04-10	2	2
1119	313	2020-04-26	1	3
1120	313	2020-04-15	1	3
1121	313	2020-04-19	1	3
1122	314	2020-04-07	1	3
1123	314	2020-04-22	2	1
1124	314	2020-04-08	1	3
1125	314	2020-04-14	1	2
1126	314	2020-04-27	2	2
1127	315	2020-04-07	3	2
1128	315	2020-04-19	1	2
1129	315	2020-04-27	2	3
1130	316	2020-04-20	1	3
1131	316	2020-04-18	1	3
1132	316	2020-04-06	1	1
1133	316	2020-04-02	1	3
1134	316	2020-04-17	2	3
1135	316	2020-04-15	2	3
1136	317	2020-04-01	1	2
1137	317	2020-04-05	2	1
1138	317	2020-04-19	2	1
1139	317	2020-04-23	1	1
1140	317	2020-04-13	1	3
1141	318	2020-04-22	2	2
1142	318	2020-04-20	2	3
1143	318	2020-04-06	2	2
1144	318	2020-04-11	2	3
1145	319	2020-04-06	1	2
1146	319	2020-04-20	1	2
1147	320	2020-04-17	2	3
1148	320	2020-04-03	1	1
1149	321	2020-04-17	1	3
1150	321	2020-04-01	2	3
1151	321	2020-04-27	2	1
1152	321	2020-04-27	2	2
1153	321	2020-04-12	1	1
1154	321	2020-04-07	1	2
1155	322	2020-04-21	1	2
1156	322	2020-04-09	1	3
1157	322	2020-04-01	1	1
1158	322	2020-04-22	1	3
1159	323	2020-04-17	1	2
1160	323	2020-04-16	2	2
1161	324	2020-04-18	1	3
1162	324	2020-04-04	3	3
1163	325	2020-04-13	1	2
1164	325	2020-04-22	1	2
1165	326	2020-04-29	2	1
1166	326	2020-04-27	2	1
1167	326	2020-04-01	1	2
1168	326	2020-04-03	2	3
1169	326	2020-04-07	2	3
1170	327	2020-04-11	1	2
1171	327	2020-04-15	1	2
1172	327	2020-04-20	1	1
1173	327	2020-04-27	1	2
1174	328	2020-04-07	1	2
1175	328	2020-04-14	2	2
1176	328	2020-04-21	2	2
1177	328	2020-04-05	2	1
1178	328	2020-04-16	1	1
1179	329	2020-04-10	1	1
1180	329	2020-04-14	1	2
1181	329	2020-04-17	1	2
1182	329	2020-04-17	1	2
1183	329	2020-04-15	1	2
1184	330	2020-04-22	1	1
1185	330	2020-04-16	1	2
1186	330	2020-04-14	1	2
1187	331	2020-04-16	1	2
1188	332	2020-04-20	1	3
1189	332	2020-04-08	1	2
1190	332	2020-04-05	1	3
1191	332	2020-04-26	1	2
1192	332	2020-04-06	1	1
1193	333	2020-04-27	1	2
1194	333	2020-04-15	1	2
1195	333	2020-04-18	1	2
1196	333	2020-04-17	1	1
1197	333	2020-04-05	1	3
1198	334	2020-04-14	3	2
1199	335	2020-04-20	1	2
1200	336	2020-04-07	1	2
1201	336	2020-04-01	2	2
1202	336	2020-04-29	1	3
1203	337	2020-04-13	2	1
1204	337	2020-04-18	2	2
1205	337	2020-04-16	2	2
1206	337	2020-04-29	1	1
1207	337	2020-04-17	2	2
1208	338	2020-04-14	1	2
1209	338	2020-04-14	1	3
1210	338	2020-04-22	1	2
1211	338	2020-04-20	1	1
1212	338	2020-04-20	1	1
1213	339	2020-04-16	1	1
1214	339	2020-04-26	2	2
1215	339	2020-04-27	1	2
1216	339	2020-04-09	1	2
1217	340	2020-04-29	1	1
1218	340	2020-04-09	2	3
1219	340	2020-04-22	2	2
1220	341	2020-04-17	2	2
1221	341	2020-04-10	2	2
1222	342	2020-04-21	1	3
1223	342	2020-04-19	1	2
1224	342	2020-04-23	1	2
1225	343	2020-04-20	1	3
1226	343	2020-04-09	1	3
1227	343	2020-04-11	1	2
1228	343	2020-04-06	1	2
1229	344	2020-04-09	3	1
1230	344	2020-04-07	1	2
1231	344	2020-04-05	3	1
1232	344	2020-04-15	1	1
1233	344	2020-04-20	1	1
1234	344	2020-04-08	1	2
1235	345	2020-04-14	2	2
1236	345	2020-04-04	2	2
1237	345	2020-04-26	1	2
1238	345	2020-04-19	2	2
1239	346	2020-04-07	1	2
1240	347	2020-04-26	1	1
1241	347	2020-04-03	1	1
1242	347	2020-04-14	2	2
1243	348	2020-04-19	1	2
1244	348	2020-04-09	2	1
1245	349	2020-04-03	1	3
1246	349	2020-04-14	1	1
1247	350	2020-04-08	1	2
1248	350	2020-04-25	1	2
1249	351	2020-04-25	2	1
1250	352	2020-04-18	2	2
1251	352	2020-04-26	1	2
1252	352	2020-04-14	2	3
1253	352	2020-04-29	2	2
1254	353	2020-04-21	1	1
1255	353	2020-04-21	1	2
1256	354	2020-04-25	1	2
1257	354	2020-04-17	1	2
1258	355	2020-04-01	1	3
1259	355	2020-04-07	2	2
1260	355	2020-04-04	1	1
1261	356	2020-04-25	2	1
1262	356	2020-04-06	1	1
1263	356	2020-04-24	1	3
1264	356	2020-04-26	1	3
1265	357	2020-04-22	1	2
1266	357	2020-04-01	2	1
1267	357	2020-04-05	1	2
1268	357	2020-04-17	1	3
1269	357	2020-04-22	1	3
1270	358	2020-04-07	1	3
1271	358	2020-04-21	1	2
1272	358	2020-04-17	1	3
1273	358	2020-04-19	1	2
1274	358	2020-04-28	1	1
1275	359	2020-04-19	2	3
1276	359	2020-04-29	1	2
1277	360	2020-04-18	2	2
1278	360	2020-04-22	2	2
1279	360	2020-04-23	1	1
1280	360	2020-04-13	1	3
1281	360	2020-04-04	2	1
1282	360	2020-04-18	1	2
1283	361	2020-04-06	2	2
1284	361	2020-04-14	2	2
1285	361	2020-04-09	1	1
1286	362	2020-04-17	3	3
1287	362	2020-04-19	3	2
1288	363	2020-04-10	1	3
1289	363	2020-04-23	2	1
1290	363	2020-04-27	1	2
1291	364	2020-04-25	1	3
1292	364	2020-04-12	1	2
1293	364	2020-04-02	2	2
1294	365	2020-04-08	1	3
1295	365	2020-04-22	2	1
1296	365	2020-04-15	2	3
1297	366	2020-04-24	1	1
1298	366	2020-04-01	2	3
1299	367	2020-04-10	1	2
1300	367	2020-04-22	1	1
1301	368	2020-04-19	1	2
1302	368	2020-04-15	1	2
1303	368	2020-04-16	1	1
1304	368	2020-04-14	1	3
1305	369	2020-04-12	1	1
1306	369	2020-04-23	2	1
1307	370	2020-04-15	2	3
1308	370	2020-04-03	2	2
1309	370	2020-04-29	2	3
1310	371	2020-04-07	2	2
1311	371	2020-04-03	2	2
1312	371	2020-04-26	3	3
1313	371	2020-04-19	2	3
1314	372	2020-04-18	1	2
1315	372	2020-04-09	1	3
1316	372	2020-04-27	1	2
1317	373	2020-04-08	2	2
1318	373	2020-04-21	2	1
1319	373	2020-04-16	2	2
1320	373	2020-04-01	1	2
1321	373	2020-04-27	2	1
1322	374	2020-04-06	2	2
1323	374	2020-04-14	1	2
1324	374	2020-04-07	1	2
1325	374	2020-04-13	2	2
1326	374	2020-04-06	1	2
1327	375	2020-04-27	1	1
1328	375	2020-04-22	1	1
1329	375	2020-04-12	1	1
1330	375	2020-04-01	1	2
1331	375	2020-04-22	1	1
1332	376	2020-04-22	2	3
1333	376	2020-04-05	2	1
1334	376	2020-04-06	2	2
1335	376	2020-04-11	2	2
1336	376	2020-04-17	2	3
1337	377	2020-04-02	1	3
1338	377	2020-04-18	1	3
1339	377	2020-04-05	2	2
1340	377	2020-04-02	1	3
1341	378	2020-04-19	1	2
1342	379	2020-04-26	1	3
1343	380	2020-04-06	1	2
1344	380	2020-04-17	1	2
1345	381	2020-04-05	1	2
1346	381	2020-04-21	1	3
1347	381	2020-04-14	1	2
1348	381	2020-04-22	1	2
1349	382	2020-04-19	2	2
1350	383	2020-04-21	2	2
1351	383	2020-04-16	2	2
1352	383	2020-04-20	2	2
1353	383	2020-04-14	1	2
1354	383	2020-04-08	1	1
1355	384	2020-04-05	2	3
1356	384	2020-04-15	1	2
1357	384	2020-04-21	2	2
1358	384	2020-04-06	1	2
1359	384	2020-04-12	1	3
1360	384	2020-04-22	1	2
1361	385	2020-04-21	1	2
1362	385	2020-04-15	1	3
1363	385	2020-04-28	1	2
1364	385	2020-04-08	1	1
1365	385	2020-04-03	1	1
1366	386	2020-04-22	1	1
1367	387	2020-04-05	1	3
1368	387	2020-04-15	1	2
1369	387	2020-04-12	1	3
1370	387	2020-04-29	1	3
1371	388	2020-04-29	2	2
1372	388	2020-04-22	1	1
1373	388	2020-04-08	1	2
1374	389	2020-04-03	1	1
1375	390	2020-04-17	2	2
1376	391	2020-04-06	1	1
1377	391	2020-04-26	1	2
1378	392	2020-04-10	2	3
1379	392	2020-04-28	2	3
1380	393	2020-04-21	1	3
1381	393	2020-04-04	2	2
1382	393	2020-04-06	2	3
1383	393	2020-04-10	2	3
1384	394	2020-04-13	1	2
1385	394	2020-04-14	2	2
1386	394	2020-04-22	2	2
1387	394	2020-04-05	1	3
1388	395	2020-04-20	2	3
1389	395	2020-04-22	1	2
1390	395	2020-04-15	2	2
1391	395	2020-04-21	1	2
1392	395	2020-04-06	2	2
1393	396	2020-04-19	1	2
1394	396	2020-04-11	3	3
1395	397	2020-04-20	3	3
1396	397	2020-04-10	3	2
1397	397	2020-04-22	2	2
1398	398	2020-04-09	1	2
1399	398	2020-04-16	1	2
1400	399	2020-04-06	2	2
1401	399	2020-04-13	2	3
1402	400	2020-04-23	1	1
1403	400	2020-04-01	2	2
1404	401	2020-04-14	1	3
1405	401	2020-04-12	1	2
1406	401	2020-04-21	1	2
1407	401	2020-04-28	1	3
1408	402	2020-04-08	1	1
1409	402	2020-04-15	1	3
1410	402	2020-04-01	1	3
1411	402	2020-04-24	1	2
1412	403	2020-04-09	1	1
1413	404	2020-04-06	2	1
1414	404	2020-04-16	2	2
1415	404	2020-04-01	2	2
1416	405	2020-04-11	2	3
1417	405	2020-04-13	2	2
1418	405	2020-04-13	1	2
1419	405	2020-04-05	1	2
1420	406	2020-04-27	2	2
1421	406	2020-04-18	3	2
1422	406	2020-04-05	3	2
1423	406	2020-04-13	2	2
1424	407	2020-04-25	1	2
1425	407	2020-04-26	2	3
1426	407	2020-04-04	2	1
1427	407	2020-04-16	1	1
1428	408	2020-04-22	2	2
1429	409	2020-04-21	2	3
1430	410	2020-04-07	1	2
1431	410	2020-04-09	1	3
1432	410	2020-04-19	1	2
1433	410	2020-04-04	1	3
1434	410	2020-04-01	1	2
1435	410	2020-04-14	1	1
1436	411	2020-04-23	1	3
1437	411	2020-04-16	3	1
1438	412	2020-04-02	1	1
1439	413	2020-04-24	1	2
1440	413	2020-04-15	1	2
1441	413	2020-04-21	2	2
1442	413	2020-04-15	2	2
1443	413	2020-04-12	2	2
1444	414	2020-04-23	1	2
1445	414	2020-04-08	1	3
1446	414	2020-04-03	1	3
1447	414	2020-04-07	1	1
1448	415	2020-04-19	1	1
1449	415	2020-04-29	1	2
1450	416	2020-04-02	1	2
1451	416	2020-04-06	1	2
1452	416	2020-04-03	1	3
1453	416	2020-04-03	1	3
1454	417	2020-04-23	1	2
1455	417	2020-04-05	1	1
1456	417	2020-04-29	1	2
1457	418	2020-04-29	1	3
1458	418	2020-04-20	2	2
1459	418	2020-04-20	2	3
1460	418	2020-04-23	2	3
1461	419	2020-04-25	3	2
1462	419	2020-04-20	2	3
1463	419	2020-04-18	2	1
1464	419	2020-04-22	1	2
1465	420	2020-04-16	1	1
1466	420	2020-04-06	1	2
1467	420	2020-04-17	1	3
1468	420	2020-04-27	1	1
1469	421	2020-04-22	1	2
1470	422	2020-04-11	1	3
1471	422	2020-04-12	1	1
1472	422	2020-04-04	2	1
1473	422	2020-04-18	3	3
1474	422	2020-04-13	2	2
1475	422	2020-04-10	1	2
1476	423	2020-04-25	1	2
1477	423	2020-04-17	2	1
1478	423	2020-04-19	1	3
1479	423	2020-04-19	2	1
1480	424	2020-04-02	1	3
1481	424	2020-04-04	1	2
1482	425	2020-04-24	1	2
1483	426	2020-04-08	2	2
1484	426	2020-04-04	2	3
1485	426	2020-04-15	3	2
1486	426	2020-04-05	3	3
1487	427	2020-04-17	1	1
1488	427	2020-04-26	1	3
1489	428	2020-04-26	1	2
1490	428	2020-04-15	2	1
1491	428	2020-04-01	2	2
1492	428	2020-04-16	2	2
1493	428	2020-04-08	1	1
1494	428	2020-04-06	2	3
1495	429	2020-04-17	1	2
1496	430	2020-04-08	1	1
1497	430	2020-04-14	1	3
1498	430	2020-04-10	1	1
1499	430	2020-04-13	1	2
1500	431	2020-04-17	1	2
1501	431	2020-04-07	1	2
1502	431	2020-04-22	1	1
1503	431	2020-04-03	1	2
1504	432	2020-04-22	1	1
1505	432	2020-04-04	1	1
1506	432	2020-04-18	2	2
1507	432	2020-04-10	1	1
1508	433	2020-04-29	2	1
1509	433	2020-04-03	1	3
1510	433	2020-04-11	1	2
1511	433	2020-04-21	1	3
1512	433	2020-04-27	2	2
1513	433	2020-04-14	1	2
1514	434	2020-04-09	1	3
1515	434	2020-04-06	1	3
1516	435	2020-04-19	1	3
1517	435	2020-04-13	1	1
1518	435	2020-04-01	1	3
1519	435	2020-04-09	1	2
1520	435	2020-04-03	1	3
1521	436	2020-04-04	1	2
1522	436	2020-04-25	2	2
1523	436	2020-04-23	2	1
1524	436	2020-04-24	2	1
1525	436	2020-04-29	2	2
1526	437	2020-04-07	2	2
1527	437	2020-04-25	1	1
1528	437	2020-04-06	1	2
1529	437	2020-04-06	2	1
1530	437	2020-04-10	2	2
1531	438	2020-04-20	1	1
1532	438	2020-04-13	2	2
1533	438	2020-04-03	2	3
1534	438	2020-04-02	1	2
1535	438	2020-04-08	2	3
1536	439	2020-04-15	1	2
1537	440	2020-04-24	1	1
1538	440	2020-04-16	1	2
1539	440	2020-04-17	1	2
1540	440	2020-04-21	2	1
1541	440	2020-04-15	1	1
1542	441	2020-04-21	1	3
1543	441	2020-04-09	1	2
1544	441	2020-04-23	1	2
1545	441	2020-04-14	1	2
1546	442	2020-04-26	1	1
1547	442	2020-04-11	1	1
1548	442	2020-04-29	1	1
1549	443	2020-04-19	1	2
1550	443	2020-04-08	2	2
1551	443	2020-04-16	1	2
1552	443	2020-04-22	2	1
1553	443	2020-04-22	2	1
1554	443	2020-04-14	1	1
1555	444	2020-04-01	2	2
1556	444	2020-04-28	2	2
1557	444	2020-04-26	1	2
1558	444	2020-04-25	3	1
1559	444	2020-04-01	2	3
1560	444	2020-04-09	2	3
1561	445	2020-04-27	2	1
1562	445	2020-04-08	1	1
1563	445	2020-04-25	2	3
1564	445	2020-04-01	2	3
1565	446	2020-04-11	2	3
1566	446	2020-04-20	2	2
1567	446	2020-04-01	2	2
1568	446	2020-04-07	1	3
1569	446	2020-04-25	2	2
1570	447	2020-04-13	1	1
1571	447	2020-04-07	1	2
1572	447	2020-04-19	3	2
1573	447	2020-04-17	3	1
1574	447	2020-04-10	3	1
1575	448	2020-04-16	2	1
1576	448	2020-04-09	2	1
1577	448	2020-04-04	1	3
1578	448	2020-04-28	2	2
1579	448	2020-04-13	1	2
1580	449	2020-04-10	2	1
1581	449	2020-04-13	1	1
1582	449	2020-04-07	2	2
1583	449	2020-04-27	2	3
1584	449	2020-04-23	2	1
1585	450	2020-04-21	2	3
1586	450	2020-04-05	3	1
1587	450	2020-04-08	1	3
1588	450	2020-04-19	2	2
1589	450	2020-04-05	2	2
1590	450	2020-04-25	1	3
1591	451	2020-04-01	1	2
1592	451	2020-04-29	1	3
1593	451	2020-04-07	2	2
1594	451	2020-04-17	1	2
1595	451	2020-04-10	2	2
1596	452	2020-04-21	1	2
1597	452	2020-04-27	1	2
1598	452	2020-04-26	1	2
1599	452	2020-04-16	1	2
1600	452	2020-04-25	1	2
1601	453	2020-04-13	1	3
1602	453	2020-04-12	1	1
1603	454	2020-04-05	1	2
1604	454	2020-04-05	1	2
1605	454	2020-04-13	1	1
1606	454	2020-04-02	1	2
1607	455	2020-04-06	1	3
1608	455	2020-04-13	2	2
1609	455	2020-04-01	1	2
1610	455	2020-04-15	2	1
1611	455	2020-04-29	1	3
1612	456	2020-04-03	2	2
1613	456	2020-04-10	2	1
1614	456	2020-04-04	3	3
1615	457	2020-04-15	1	1
1616	458	2020-04-15	2	1
1617	458	2020-04-07	2	1
1618	458	2020-04-06	1	2
1619	458	2020-04-13	1	2
1620	458	2020-04-29	2	2
1621	458	2020-04-09	2	3
1622	459	2020-04-03	1	2
1623	459	2020-04-28	1	3
1624	459	2020-04-04	1	1
1625	460	2020-04-20	1	3
1626	460	2020-04-27	2	1
1627	460	2020-04-21	1	3
1628	461	2020-04-07	2	2
1629	461	2020-04-26	3	2
1630	461	2020-04-24	1	2
1631	461	2020-04-08	1	3
1632	462	2020-04-23	1	2
1633	462	2020-04-23	1	1
1634	462	2020-04-17	1	3
1635	462	2020-04-13	1	2
1636	463	2020-04-07	2	2
1637	464	2020-04-14	1	3
1638	464	2020-04-17	1	1
1639	465	2020-04-18	2	3
1640	465	2020-04-17	1	2
1641	465	2020-04-17	1	3
1642	466	2020-04-24	2	2
1643	466	2020-04-29	2	3
1644	467	2020-04-27	1	2
1645	467	2020-04-13	1	2
1646	467	2020-04-10	1	3
1647	467	2020-04-16	1	2
1648	467	2020-04-04	1	1
1649	468	2020-04-20	1	1
1650	468	2020-04-19	1	1
1651	468	2020-04-25	1	1
1652	468	2020-04-18	1	1
1653	469	2020-04-09	1	2
1654	469	2020-04-29	1	2
1655	469	2020-04-10	2	3
1656	470	2020-04-29	1	1
1657	470	2020-04-07	1	2
1658	470	2020-04-22	1	1
1659	471	2020-04-07	1	2
1660	471	2020-04-25	1	2
1661	471	2020-04-21	1	3
1662	471	2020-04-10	1	1
1663	472	2020-04-08	2	2
1664	472	2020-04-14	1	2
1665	473	2020-04-07	1	3
1666	473	2020-04-28	1	2
1667	473	2020-04-10	1	2
1668	473	2020-04-10	1	3
1669	474	2020-04-06	2	2
1670	474	2020-04-21	1	2
1671	474	2020-04-25	2	2
1672	475	2020-04-13	1	2
1673	475	2020-04-05	1	1
1674	475	2020-04-16	1	2
1675	475	2020-04-03	1	2
1676	475	2020-04-02	1	2
1677	475	2020-04-03	1	3
1678	476	2020-04-06	3	1
1679	476	2020-04-23	2	2
1680	476	2020-04-18	2	2
1681	477	2020-04-14	1	1
1682	477	2020-04-19	1	2
1683	477	2020-04-14	1	2
1684	477	2020-04-26	1	3
1685	477	2020-04-07	1	3
1686	478	2020-04-26	1	2
1687	478	2020-04-24	3	2
1688	479	2020-04-09	3	1
1689	479	2020-04-28	3	2
1690	479	2020-04-01	3	2
1691	480	2020-04-09	1	2
1692	480	2020-04-04	1	2
1693	480	2020-04-14	1	1
1694	481	2020-04-18	1	3
1695	482	2020-04-27	1	2
1696	482	2020-04-04	2	2
1697	482	2020-04-02	2	3
1698	482	2020-04-25	1	2
1699	482	2020-04-28	3	2
1700	483	2020-04-21	2	2
1701	483	2020-04-21	2	2
1702	484	2020-04-22	1	2
1703	484	2020-04-23	1	2
1704	484	2020-04-20	1	3
1705	485	2020-04-23	1	2
1706	486	2020-04-19	1	3
1707	486	2020-04-20	1	1
1708	487	2020-04-15	1	1
1709	487	2020-04-08	2	1
1710	487	2020-04-16	1	2
1711	488	2020-04-15	2	2
1712	488	2020-04-02	1	2
1713	488	2020-04-11	2	3
1714	489	2020-04-09	1	1
1715	489	2020-04-10	2	2
1716	490	2020-04-26	2	3
1717	490	2020-04-26	2	1
1718	490	2020-04-07	1	2
1719	490	2020-04-07	2	3
1720	490	2020-04-12	1	2
1721	491	2020-04-18	2	3
1722	491	2020-04-25	3	2
1723	492	2020-04-20	1	1
1724	492	2020-04-16	2	3
1725	493	2020-04-08	2	2
1726	493	2020-04-25	3	2
1727	493	2020-04-08	3	3
1728	493	2020-04-11	1	3
1729	494	2020-04-20	1	1
1730	495	2020-04-02	2	3
1731	495	2020-04-21	1	2
1732	495	2020-04-03	3	1
1733	496	2020-04-14	2	1
1734	496	2020-04-01	1	2
1735	496	2020-04-26	2	2
1736	497	2020-04-15	2	2
1737	497	2020-04-18	1	1
1738	498	2020-04-04	1	2
1739	498	2020-04-29	3	2
1740	499	2020-04-28	2	1
1741	499	2020-04-23	2	1
1742	499	2020-04-09	1	2
1743	499	2020-04-17	1	3
1744	499	2020-04-23	2	2
1745	499	2020-04-05	2	2
1746	500	2020-04-01	2	3
1747	500	2020-04-17	1	2
1748	500	2020-04-11	2	2
1749	500	2020-04-26	1	2
1750	500	2020-04-02	1	2
1751	500	2020-04-03	1	2
1752	501	2020-04-25	1	3
1753	501	2020-04-02	1	2
1754	501	2020-04-07	1	2
1755	502	2020-04-25	1	2
1756	503	2020-04-11	1	2
1757	503	2020-04-21	2	3
1758	503	2020-04-11	2	2
1759	504	2020-04-13	3	2
1760	505	2020-04-26	1	2
1761	505	2020-04-01	1	3
1762	505	2020-04-15	1	2
1763	505	2020-04-16	1	2
1764	505	2020-04-08	1	2
1765	506	2020-04-08	2	2
1766	506	2020-04-10	2	2
1767	506	2020-04-29	1	1
1768	506	2020-04-27	1	3
1769	506	2020-04-10	2	2
1770	506	2020-04-09	1	2
1771	507	2020-04-01	1	3
1772	507	2020-04-16	1	2
1773	507	2020-04-08	1	2
1774	507	2020-04-28	1	2
1775	508	2020-04-16	1	3
1776	508	2020-04-16	1	2
1777	508	2020-04-25	1	2
1778	508	2020-04-05	2	2
1779	509	2020-04-07	1	1
1780	510	2020-04-08	2	3
1781	510	2020-04-22	2	3
1782	510	2020-04-20	2	2
1783	510	2020-04-28	2	1
1784	511	2020-04-15	3	3
1785	511	2020-04-13	3	3
1786	512	2020-04-18	2	2
1787	512	2020-04-08	2	2
1788	512	2020-04-14	1	1
1789	512	2020-04-24	1	1
1790	513	2020-04-06	2	2
1791	513	2020-04-01	1	1
1792	513	2020-04-05	2	3
1793	514	2020-04-19	1	1
1794	514	2020-04-11	2	3
1795	514	2020-04-02	1	3
1796	515	2020-04-10	3	2
1797	515	2020-04-25	2	2
1798	515	2020-04-18	3	2
1799	516	2020-04-24	2	1
1800	517	2020-04-08	2	3
1801	518	2020-04-27	1	1
1802	518	2020-04-05	2	2
1803	518	2020-04-22	2	2
1804	518	2020-04-10	1	2
1805	518	2020-04-01	1	2
1806	519	2020-04-11	1	2
1807	519	2020-04-19	1	1
1808	519	2020-04-16	2	1
1809	519	2020-04-10	2	1
1810	520	2020-04-26	2	1
1811	520	2020-04-17	1	2
1812	520	2020-04-01	2	2
1813	520	2020-04-01	1	2
1814	521	2020-04-08	2	3
1815	521	2020-04-26	1	2
1816	522	2020-04-11	1	2
1817	522	2020-04-25	1	1
1818	523	2020-04-20	1	3
1819	523	2020-04-29	1	3
1820	523	2020-04-12	1	2
1821	523	2020-04-22	1	2
1822	523	2020-04-15	1	2
1823	524	2020-04-18	2	3
1824	524	2020-04-26	3	3
1825	525	2020-04-14	3	1
1826	526	2020-04-11	2	3
1827	526	2020-04-26	1	1
1828	527	2020-04-27	2	1
1829	527	2020-04-17	2	2
1830	527	2020-04-09	1	2
1831	527	2020-04-20	1	1
1832	528	2020-04-26	3	2
1833	528	2020-04-05	1	2
1834	528	2020-04-26	2	2
1835	529	2020-04-16	1	2
1836	529	2020-04-22	2	1
1837	529	2020-04-21	1	1
1838	529	2020-04-13	1	2
1839	529	2020-04-24	1	1
1840	529	2020-04-22	1	2
1841	530	2020-04-04	1	2
1842	530	2020-04-09	2	3
1843	530	2020-04-19	1	2
1844	530	2020-04-16	1	2
1845	530	2020-04-28	2	2
1846	530	2020-04-12	2	2
1847	531	2020-04-28	1	2
1848	531	2020-04-02	1	1
1849	531	2020-04-16	1	2
1850	531	2020-04-27	1	3
1851	531	2020-04-19	1	2
1852	532	2020-04-19	2	3
1853	532	2020-04-16	1	3
1854	532	2020-04-25	1	3
1855	532	2020-04-17	2	2
1856	532	2020-04-23	1	3
1857	533	2020-04-03	1	1
1858	533	2020-04-11	1	2
1859	533	2020-04-25	1	3
1860	534	2020-04-01	1	2
1861	534	2020-04-09	1	3
1862	534	2020-04-14	1	1
1863	535	2020-04-18	2	3
1864	535	2020-04-26	1	3
1865	535	2020-04-21	2	2
1866	535	2020-04-25	2	1
1867	535	2020-04-08	2	3
1868	535	2020-04-17	2	2
1869	536	2020-04-29	1	2
1870	536	2020-04-14	1	2
1871	536	2020-04-10	1	3
1872	536	2020-04-23	1	2
1873	537	2020-04-08	1	1
1874	537	2020-04-27	1	3
1875	537	2020-04-22	2	3
1876	538	2020-04-05	2	2
1877	538	2020-04-14	1	3
1878	539	2020-04-24	3	2
1879	539	2020-04-11	3	2
1880	539	2020-04-22	3	3
1881	539	2020-04-06	1	3
1882	540	2020-04-14	1	2
1883	540	2020-04-10	1	3
1884	540	2020-04-07	1	1
1885	540	2020-04-28	1	2
1886	540	2020-04-22	1	2
1887	541	2020-04-14	1	2
1888	542	2020-04-19	1	2
1889	543	2020-04-25	1	3
1890	543	2020-04-18	1	2
1891	543	2020-04-12	1	2
1892	543	2020-04-12	1	2
1893	544	2020-04-20	3	2
1894	544	2020-04-28	2	1
1895	544	2020-04-26	2	2
1896	545	2020-04-09	1	2
1897	545	2020-04-18	1	1
1898	545	2020-04-26	1	2
1899	545	2020-04-24	1	1
1900	546	2020-04-22	1	1
1901	546	2020-04-07	1	1
1902	546	2020-04-13	1	1
1903	547	2020-04-01	2	2
1904	547	2020-04-09	1	3
1905	547	2020-04-10	2	1
1906	547	2020-04-22	1	2
1907	548	2020-04-22	1	1
1908	548	2020-04-11	1	2
1909	549	2020-04-17	1	1
1910	549	2020-04-20	1	3
1911	549	2020-04-02	1	1
1912	550	2020-04-29	1	2
1913	550	2020-04-01	1	2
1914	551	2020-04-15	1	1
1915	551	2020-04-18	1	2
1916	551	2020-04-05	1	3
1917	551	2020-04-19	1	1
1918	552	2020-04-24	1	3
1919	552	2020-04-11	1	2
1920	552	2020-04-18	1	2
1921	552	2020-04-03	1	1
1922	552	2020-04-24	1	3
1923	553	2020-04-22	1	1
1924	554	2020-04-13	1	2
1925	554	2020-04-25	2	1
1926	554	2020-04-15	2	1
1927	554	2020-04-04	1	2
1928	554	2020-04-15	2	3
1929	554	2020-04-07	1	1
1930	555	2020-04-20	1	2
1931	555	2020-04-12	1	1
1932	555	2020-04-05	1	2
1933	555	2020-04-18	1	1
1934	556	2020-04-16	3	1
1935	556	2020-04-09	1	2
1936	557	2020-04-20	1	2
1937	557	2020-04-04	2	2
1938	557	2020-04-01	1	1
1939	558	2020-04-28	3	3
1940	558	2020-04-05	2	3
1941	558	2020-04-15	2	2
1942	558	2020-04-07	2	1
1943	559	2020-04-13	2	2
1944	559	2020-04-20	1	2
1945	559	2020-04-03	1	1
1946	559	2020-04-14	1	2
1947	559	2020-04-19	2	1
1948	560	2020-04-25	2	3
1949	560	2020-04-22	2	2
1950	560	2020-04-26	3	2
1951	560	2020-04-20	2	3
1952	560	2020-04-17	2	2
1953	560	2020-04-06	3	3
1954	561	2020-04-16	1	3
1955	561	2020-04-02	1	2
1956	561	2020-04-21	1	2
1957	562	2020-04-11	2	2
1958	562	2020-04-05	2	2
1959	562	2020-04-22	1	3
1960	563	2020-04-05	1	2
1961	563	2020-04-21	2	1
1962	564	2020-04-23	2	1
1963	564	2020-04-23	1	2
1964	564	2020-04-25	2	3
1965	565	2020-04-17	1	1
1966	565	2020-04-17	1	2
1967	565	2020-04-27	1	1
1968	565	2020-04-11	1	2
1969	565	2020-04-06	1	2
1970	565	2020-04-18	1	1
1971	566	2020-04-02	2	2
1972	566	2020-04-11	1	1
1973	567	2020-04-13	1	2
1974	567	2020-04-09	2	1
1975	567	2020-04-10	2	2
1976	567	2020-04-24	1	2
1977	567	2020-04-28	2	2
1978	567	2020-04-22	1	2
1979	568	2020-04-15	1	2
1980	568	2020-04-24	1	2
1981	568	2020-04-18	1	1
1982	568	2020-04-07	1	2
1983	569	2020-04-22	1	1
1984	569	2020-04-14	1	2
1985	570	2020-04-10	3	2
1986	570	2020-04-01	3	1
1987	570	2020-04-26	2	3
1988	571	2020-04-12	3	3
1989	571	2020-04-29	2	2
1990	571	2020-04-14	3	2
1991	571	2020-04-16	3	2
1992	572	2020-04-17	2	2
1993	572	2020-04-20	2	2
1994	572	2020-04-24	3	1
1995	572	2020-04-19	2	2
1996	572	2020-04-23	2	1
1997	573	2020-04-04	2	1
1998	573	2020-04-06	2	1
1999	573	2020-04-29	1	2
2000	573	2020-04-21	1	1
2001	574	2020-04-17	2	3
2002	574	2020-04-04	2	3
2003	574	2020-04-27	2	1
2004	574	2020-04-28	2	2
2005	575	2020-04-22	1	2
2006	576	2020-04-25	1	1
2007	576	2020-04-02	1	2
2008	576	2020-04-09	1	3
2009	576	2020-04-29	1	1
2010	577	2020-04-15	1	2
2011	577	2020-04-02	2	2
2012	577	2020-04-24	2	3
2013	577	2020-04-20	2	2
2014	578	2020-04-29	1	3
2015	578	2020-04-21	1	1
2016	578	2020-04-11	1	3
2017	578	2020-04-15	1	2
2018	578	2020-04-23	1	3
2019	579	2020-04-06	1	1
2020	579	2020-04-25	1	3
2021	579	2020-04-18	1	3
2022	580	2020-04-02	2	2
2023	580	2020-04-25	2	1
2024	581	2020-04-22	2	2
2025	581	2020-04-14	3	1
2026	581	2020-04-05	3	1
2027	581	2020-04-04	2	1
2028	582	2020-04-23	2	3
2029	582	2020-04-17	1	1
2030	583	2020-04-07	1	2
2031	583	2020-04-04	2	2
2032	583	2020-04-16	2	3
2033	584	2020-04-06	1	1
2034	584	2020-04-11	1	2
2035	584	2020-04-23	1	2
2036	584	2020-04-12	1	2
2037	584	2020-04-10	1	1
2038	585	2020-04-25	2	1
2039	585	2020-04-18	1	1
2040	585	2020-04-07	1	1
2041	585	2020-04-21	2	1
2042	585	2020-04-14	2	2
2043	586	2020-04-14	1	3
2044	586	2020-04-13	1	2
2045	587	2020-04-19	1	2
2046	587	2020-04-10	1	1
2047	587	2020-04-18	1	3
2048	587	2020-04-20	1	2
2049	587	2020-04-18	1	3
2050	588	2020-04-28	1	3
2051	588	2020-04-17	2	1
2052	588	2020-04-17	1	1
2053	589	2020-04-26	1	2
2054	589	2020-04-22	2	2
2055	589	2020-04-28	2	3
2056	589	2020-04-11	1	2
2057	589	2020-04-01	1	1
2058	590	2020-04-07	2	2
2059	590	2020-04-07	1	2
2060	590	2020-04-09	1	2
2061	590	2020-04-28	2	1
2062	590	2020-04-21	1	3
2063	590	2020-04-08	2	3
2064	591	2020-04-10	1	3
2065	591	2020-04-05	2	1
2066	592	2020-04-18	2	2
2067	592	2020-04-05	2	1
2068	592	2020-04-04	1	3
2069	592	2020-04-11	2	2
2070	592	2020-04-28	1	3
2071	592	2020-04-25	3	1
2072	593	2020-04-13	1	3
2073	593	2020-04-10	1	2
2074	594	2020-04-11	1	1
2075	594	2020-04-29	2	2
2076	594	2020-04-07	1	2
2077	595	2020-04-17	1	1
2078	595	2020-04-08	1	2
2079	595	2020-04-26	1	3
2080	595	2020-04-25	1	3
2081	596	2020-04-09	1	2
2082	596	2020-04-22	1	3
2083	597	2020-04-08	1	2
2084	597	2020-04-21	3	2
2085	597	2020-04-25	3	2
2086	598	2020-04-02	1	2
2087	599	2020-04-25	2	1
2088	599	2020-04-12	2	2
2089	599	2020-04-21	3	2
2090	599	2020-04-11	1	2
2091	600	2020-04-08	2	3
2092	600	2020-04-22	2	3
2093	601	2020-04-14	1	1
2094	601	2020-04-17	2	2
2095	602	2020-04-24	1	2
2096	602	2020-04-20	1	3
2097	603	2020-04-15	1	1
2098	603	2020-04-23	2	2
2099	603	2020-04-17	2	2
2100	603	2020-04-04	2	2
2101	604	2020-04-07	1	2
2102	604	2020-04-05	1	2
2103	604	2020-04-16	1	2
2104	604	2020-04-19	1	1
2105	605	2020-04-19	2	1
2106	606	2020-04-10	2	3
2107	606	2020-04-01	2	2
2108	607	2020-04-23	1	2
2109	607	2020-04-23	1	2
2110	607	2020-04-27	1	2
2111	607	2020-04-04	1	3
2112	608	2020-04-11	3	3
2113	608	2020-04-25	2	3
2114	608	2020-04-10	2	3
2115	608	2020-04-21	2	1
2116	608	2020-04-16	3	3
2117	609	2020-04-13	1	3
2118	609	2020-04-27	1	1
2119	609	2020-04-20	2	2
2120	609	2020-04-02	1	1
2121	610	2020-04-05	1	2
2122	610	2020-04-01	1	1
2123	611	2020-04-06	1	1
2124	611	2020-04-19	1	1
2125	611	2020-04-23	2	2
2126	612	2020-04-19	1	1
2127	612	2020-04-02	1	2
2128	612	2020-04-23	1	2
2129	612	2020-04-23	1	2
2130	613	2020-04-29	1	1
2131	614	2020-04-05	1	3
2132	615	2020-04-27	1	3
2133	615	2020-04-11	1	3
2134	615	2020-04-01	2	1
2135	615	2020-04-01	2	3
2136	615	2020-04-26	2	2
2137	615	2020-04-12	1	2
2138	616	2020-04-17	2	2
2139	616	2020-04-15	2	3
2140	617	2020-04-07	1	2
2141	617	2020-04-15	1	2
2142	617	2020-04-20	1	2
2143	617	2020-04-27	1	2
2144	618	2020-04-03	1	2
2145	618	2020-04-17	2	3
2146	619	2020-04-17	2	2
2147	619	2020-04-07	2	1
2148	619	2020-04-25	1	2
2149	619	2020-04-19	2	1
2150	619	2020-04-22	2	2
2151	620	2020-04-24	1	3
2152	620	2020-04-07	1	2
2153	620	2020-04-28	2	1
2154	620	2020-04-07	1	3
2155	621	2020-04-25	1	1
2156	621	2020-04-08	1	1
2157	621	2020-04-28	1	1
2158	622	2020-04-04	2	2
2159	622	2020-04-17	2	3
2160	622	2020-04-13	1	3
2161	623	2020-04-02	1	1
2162	623	2020-04-21	2	3
2163	623	2020-04-29	2	1
2164	623	2020-04-04	1	1
2165	623	2020-04-02	1	2
2166	623	2020-04-20	2	1
2167	624	2020-04-02	2	1
2168	624	2020-04-15	1	1
2169	624	2020-04-06	2	1
2170	625	2020-04-28	2	2
2171	625	2020-04-27	1	3
2172	626	2020-04-25	2	2
2173	626	2020-04-25	3	2
2174	626	2020-04-05	1	2
2175	626	2020-04-12	2	3
2176	626	2020-04-05	1	2
2177	626	2020-04-29	2	3
2178	627	2020-04-10	2	2
2179	628	2020-04-18	2	1
2180	628	2020-04-06	2	3
2181	628	2020-04-20	2	2
2182	628	2020-04-25	2	2
2183	628	2020-04-16	2	1
2184	629	2020-04-21	1	2
2185	629	2020-04-21	1	1
2186	629	2020-04-26	1	2
2187	629	2020-04-16	1	1
2188	629	2020-04-14	1	2
2189	629	2020-04-20	1	2
2190	630	2020-04-10	1	2
2191	630	2020-04-06	1	1
2192	631	2020-04-10	1	3
2193	631	2020-04-04	1	3
2194	632	2020-04-17	1	1
2195	632	2020-04-18	1	2
2196	632	2020-04-28	2	2
2197	632	2020-04-07	2	2
2198	632	2020-04-08	1	2
2199	633	2020-04-18	1	2
2200	633	2020-04-22	2	2
2201	634	2020-04-02	2	2
2202	634	2020-04-21	3	2
2203	635	2020-04-19	1	2
2204	635	2020-04-12	1	2
2205	635	2020-04-10	1	2
2206	636	2020-04-13	1	3
2207	636	2020-04-13	1	3
2208	636	2020-04-29	1	2
2209	636	2020-04-21	1	2
2210	636	2020-04-28	1	1
2211	637	2020-04-13	1	1
2212	637	2020-04-27	1	3
2213	637	2020-04-21	1	1
2214	637	2020-04-10	1	2
2215	638	2020-04-13	2	3
2216	638	2020-04-27	2	3
2217	638	2020-04-19	3	1
2218	638	2020-04-21	1	2
2219	638	2020-04-14	2	2
2220	638	2020-04-02	1	1
2221	639	2020-04-14	1	3
2222	640	2020-04-20	1	3
2223	640	2020-04-14	1	2
2224	640	2020-04-18	2	2
2225	640	2020-04-14	1	1
2226	640	2020-04-24	2	2
2227	641	2020-04-19	1	2
2228	641	2020-04-18	1	3
2229	642	2020-04-28	1	1
2230	643	2020-04-26	2	1
2231	644	2020-04-26	2	3
2232	644	2020-04-28	2	1
2233	644	2020-04-17	2	2
2234	645	2020-04-07	1	1
2235	645	2020-04-14	1	1
2236	645	2020-04-12	1	2
2237	646	2020-04-20	1	1
2238	646	2020-04-26	1	1
2239	646	2020-04-18	1	2
2240	646	2020-04-24	1	2
2241	647	2020-04-10	1	2
2242	647	2020-04-07	2	2
2243	647	2020-04-23	1	3
2244	647	2020-04-18	2	2
2245	647	2020-04-15	1	2
2246	647	2020-04-14	2	2
2247	648	2020-04-04	2	2
2248	648	2020-04-12	1	1
2249	648	2020-04-03	1	1
2250	648	2020-04-18	2	1
2251	648	2020-04-01	2	1
2252	649	2020-04-26	1	2
2253	649	2020-04-26	2	2
2254	649	2020-04-20	3	2
2255	649	2020-04-22	3	2
2256	649	2020-04-25	3	3
2257	650	2020-04-05	1	3
2258	650	2020-04-05	2	2
2259	650	2020-04-19	1	2
2260	650	2020-04-10	2	3
2261	651	2020-04-28	1	2
2262	651	2020-04-03	2	1
2263	651	2020-04-28	1	2
2264	651	2020-04-09	2	1
2265	652	2020-04-18	1	3
2266	652	2020-04-04	2	3
2267	652	2020-04-01	2	1
2268	653	2020-04-22	3	3
2269	653	2020-04-19	2	3
2270	653	2020-04-04	1	1
2271	653	2020-04-11	2	1
2272	654	2020-04-21	1	2
2273	654	2020-04-03	1	3
2274	654	2020-04-16	1	2
2275	655	2020-04-15	1	3
2276	655	2020-04-07	1	2
2277	655	2020-04-14	2	2
2278	656	2020-04-28	1	3
2279	656	2020-04-19	1	2
2280	657	2020-04-15	2	1
2281	657	2020-04-18	2	1
2282	657	2020-04-21	1	2
2283	657	2020-04-16	2	2
2284	658	2020-04-24	1	1
2285	658	2020-04-08	2	1
2286	659	2020-04-21	1	2
2287	659	2020-04-09	2	2
2288	659	2020-04-25	1	2
2289	660	2020-04-13	1	2
2290	660	2020-04-14	1	2
2291	661	2020-04-20	1	2
2292	661	2020-04-12	1	3
2293	661	2020-04-01	1	3
2294	662	2020-04-04	1	2
2295	662	2020-04-15	2	2
2296	662	2020-04-13	1	2
2297	663	2020-04-03	1	3
2298	663	2020-04-23	2	2
2299	663	2020-04-26	1	2
2300	664	2020-04-27	1	2
2301	664	2020-04-28	1	1
2302	665	2020-04-14	2	1
2303	665	2020-04-26	2	1
2304	666	2020-04-24	2	1
2305	666	2020-04-05	2	1
2306	666	2020-04-03	2	2
2307	666	2020-04-05	3	2
2308	667	2020-04-22	2	1
2309	667	2020-04-27	2	3
2310	667	2020-04-23	1	3
2311	667	2020-04-26	1	2
2312	667	2020-04-19	1	2
2313	667	2020-04-19	2	3
2314	668	2020-04-08	2	3
2315	668	2020-04-15	1	1
2316	668	2020-04-11	3	2
2317	668	2020-04-26	2	2
2318	669	2020-04-02	2	2
2319	669	2020-04-17	2	2
2320	669	2020-04-23	2	3
2321	669	2020-04-09	2	3
2322	669	2020-04-13	1	2
2323	670	2020-04-10	2	2
2324	670	2020-04-17	2	1
2325	670	2020-04-22	1	3
2326	670	2020-04-19	2	3
2327	671	2020-04-13	2	2
2328	671	2020-04-25	1	1
2329	671	2020-04-13	1	1
2330	671	2020-04-26	1	3
2331	672	2020-04-20	2	2
2332	672	2020-04-28	2	2
2333	672	2020-04-18	1	1
2334	672	2020-04-06	1	2
2335	672	2020-04-29	2	3
2336	673	2020-04-22	1	3
2337	673	2020-04-13	1	2
2338	673	2020-04-10	1	2
2339	673	2020-04-07	1	1
2340	673	2020-04-03	1	3
2341	673	2020-04-06	1	2
2342	674	2020-04-21	2	2
2343	675	2020-04-07	2	2
2344	675	2020-04-06	2	3
2345	675	2020-04-12	2	3
2346	675	2020-04-27	2	2
2347	675	2020-04-29	2	2
2348	676	2020-04-27	1	2
2349	676	2020-04-04	1	1
2350	676	2020-04-21	3	3
2351	676	2020-04-19	3	2
2352	676	2020-04-18	2	2
2353	677	2020-04-29	1	1
2354	677	2020-04-07	2	2
2355	677	2020-04-26	2	1
2356	678	2020-04-23	1	2
2357	678	2020-04-26	1	2
2358	678	2020-04-03	1	2
2359	678	2020-04-02	2	1
2360	679	2020-04-25	3	3
2361	679	2020-04-14	2	2
2362	679	2020-04-16	2	2
2363	680	2020-04-04	3	3
2364	680	2020-04-14	1	2
2365	680	2020-04-08	2	1
2366	680	2020-04-06	2	2
2367	681	2020-04-08	2	1
2368	681	2020-04-06	1	1
2369	681	2020-04-17	1	2
2370	681	2020-04-10	1	2
2371	682	2020-04-26	1	3
2372	682	2020-04-05	2	2
2373	683	2020-04-25	1	1
2374	683	2020-04-13	2	2
2375	684	2020-04-13	2	2
2376	685	2020-04-28	3	2
2377	685	2020-04-03	2	3
2378	685	2020-04-17	3	2
2379	686	2020-04-03	1	1
2380	686	2020-04-04	1	2
2381	686	2020-04-15	1	3
2382	686	2020-04-02	1	1
2383	687	2020-04-01	3	2
2384	687	2020-04-21	1	1
2385	687	2020-04-03	2	1
2386	687	2020-04-03	2	2
2387	687	2020-04-24	2	2
2388	687	2020-04-24	3	3
2389	688	2020-04-01	2	3
2390	688	2020-04-24	2	3
2391	688	2020-04-16	2	2
2392	688	2020-04-04	2	2
2393	689	2020-04-19	2	2
2394	689	2020-04-07	1	3
2395	689	2020-04-03	2	2
2396	689	2020-04-12	1	2
2397	690	2020-04-18	2	2
2398	690	2020-04-07	1	3
2399	690	2020-04-20	2	3
2400	690	2020-04-16	2	2
2401	690	2020-04-21	2	2
2402	690	2020-04-10	2	3
2403	691	2020-04-21	1	2
2404	691	2020-04-11	1	2
2405	691	2020-04-01	1	1
2406	691	2020-04-05	1	3
2407	691	2020-04-20	1	2
2408	692	2020-04-14	1	1
2409	692	2020-04-15	1	2
2410	692	2020-04-14	1	1
2411	693	2020-04-26	2	2
2412	693	2020-04-10	2	1
2413	693	2020-04-06	2	3
2414	693	2020-04-14	2	2
2415	693	2020-04-07	1	2
2416	694	2020-04-26	1	2
2417	694	2020-04-09	1	2
2418	694	2020-04-17	1	2
2419	694	2020-04-17	1	2
2420	695	2020-04-24	2	2
2421	695	2020-04-03	2	2
2422	695	2020-04-20	2	3
2423	695	2020-04-21	2	3
2424	695	2020-04-28	2	2
2425	695	2020-04-07	3	2
2426	696	2020-04-21	1	2
2427	696	2020-04-16	1	2
2428	696	2020-04-21	1	1
2429	697	2020-04-04	3	1
2430	697	2020-04-28	2	1
2431	697	2020-04-21	2	2
2432	697	2020-04-29	3	3
2433	697	2020-04-01	1	2
2434	698	2020-04-04	1	2
2435	698	2020-04-14	2	1
2436	699	2020-04-06	1	2
2437	699	2020-04-28	1	3
2438	699	2020-04-06	2	2
2439	699	2020-04-29	1	2
2440	699	2020-04-18	2	2
2441	699	2020-04-23	2	1
2442	700	2020-04-26	1	2
2443	701	2020-04-10	1	3
2444	701	2020-04-02	1	2
2445	701	2020-04-15	1	1
2446	701	2020-04-27	1	3
2447	702	2020-04-01	1	1
2448	702	2020-04-07	1	2
2449	702	2020-04-21	1	1
2450	702	2020-04-09	1	2
2451	702	2020-04-24	1	3
2452	703	2020-04-05	2	3
2453	703	2020-04-13	2	3
2454	704	2020-04-28	1	2
2455	704	2020-04-04	1	3
2456	704	2020-04-13	1	2
2457	704	2020-04-15	1	2
2458	704	2020-04-13	1	2
2459	705	2020-04-20	1	2
2460	705	2020-04-13	1	2
2461	705	2020-04-26	1	2
2462	705	2020-04-21	1	1
2463	706	2020-04-24	1	2
2464	706	2020-04-29	2	3
2465	706	2020-04-11	3	1
2466	706	2020-04-16	1	1
2467	706	2020-04-07	3	2
2468	707	2020-04-01	1	1
2469	707	2020-04-01	2	2
2470	707	2020-04-16	2	3
2471	707	2020-04-03	1	2
2472	707	2020-04-16	2	2
2473	707	2020-04-26	2	2
2474	708	2020-04-08	2	1
2475	708	2020-04-02	1	3
2476	708	2020-04-18	2	3
2477	708	2020-04-12	2	3
2478	708	2020-04-07	2	2
2479	709	2020-04-19	1	2
2480	709	2020-04-02	3	1
2481	709	2020-04-03	1	1
2482	709	2020-04-22	2	1
2483	710	2020-04-05	1	2
2484	710	2020-04-11	1	2
2485	711	2020-04-20	3	2
2486	711	2020-04-15	2	3
2487	712	2020-04-21	1	2
2488	712	2020-04-03	1	2
2489	712	2020-04-05	1	2
2490	712	2020-04-02	1	1
2491	712	2020-04-19	1	2
2492	712	2020-04-29	1	2
2493	713	2020-04-21	1	1
2494	713	2020-04-14	1	3
2495	713	2020-04-03	1	2
2496	713	2020-04-27	1	1
2497	713	2020-04-18	1	2
2498	714	2020-04-14	1	3
2499	714	2020-04-13	1	2
2500	714	2020-04-01	1	2
2501	714	2020-04-12	1	2
2502	714	2020-04-01	1	2
2503	715	2020-04-17	1	1
2504	716	2020-04-03	1	1
2505	716	2020-04-22	2	2
2506	716	2020-04-29	1	2
2507	716	2020-04-14	2	2
2508	717	2020-04-25	2	1
2509	717	2020-04-27	1	2
2510	717	2020-04-11	2	1
2511	717	2020-04-22	1	2
2512	717	2020-04-20	1	3
2513	717	2020-04-19	3	3
2514	718	2020-04-15	1	2
2515	718	2020-04-26	1	3
2516	718	2020-04-10	2	1
2517	719	2020-04-24	1	1
2518	720	2020-04-14	2	2
2519	720	2020-04-19	3	1
2520	720	2020-04-17	3	2
2521	720	2020-04-08	2	2
2522	720	2020-04-10	2	1
2523	720	2020-04-22	3	2
2524	721	2020-04-02	1	2
2525	721	2020-04-28	1	2
2526	721	2020-04-24	1	2
2527	721	2020-04-23	1	1
2528	721	2020-04-21	1	2
2529	722	2020-04-13	2	2
2530	723	2020-04-04	1	2
2531	723	2020-04-10	1	2
2532	723	2020-04-06	2	1
2533	724	2020-04-27	1	2
2534	724	2020-04-10	1	3
2535	725	2020-04-08	1	3
2536	725	2020-04-29	2	1
2537	725	2020-04-25	1	1
2538	725	2020-04-07	2	2
2539	726	2020-04-18	1	2
2540	726	2020-04-17	1	2
2541	726	2020-04-04	1	1
2542	726	2020-04-05	1	3
2543	727	2020-04-25	2	1
2544	727	2020-04-12	2	2
2545	727	2020-04-02	2	3
2546	728	2020-04-21	2	3
2547	728	2020-04-20	2	2
2548	728	2020-04-27	2	3
2549	729	2020-04-12	1	3
2550	729	2020-04-07	1	2
2551	729	2020-04-16	1	1
2552	730	2020-04-23	1	2
2553	730	2020-04-06	1	2
2554	730	2020-04-25	1	3
2555	730	2020-04-10	1	2
2556	731	2020-04-27	1	2
2557	731	2020-04-05	2	3
2558	731	2020-04-08	2	3
2559	731	2020-04-06	2	1
2560	732	2020-04-01	1	2
2561	732	2020-04-01	1	1
2562	732	2020-04-02	1	2
2563	732	2020-04-18	1	2
2564	732	2020-04-18	1	1
2565	733	2020-04-11	2	3
2566	733	2020-04-18	1	2
2567	733	2020-04-25	2	2
2568	734	2020-04-08	1	1
2569	734	2020-04-10	2	2
2570	735	2020-04-12	2	3
2571	735	2020-04-26	2	3
2572	735	2020-04-16	2	2
2573	735	2020-04-07	2	1
2574	736	2020-04-07	2	2
2575	736	2020-04-28	3	2
2576	736	2020-04-04	1	1
2577	736	2020-04-27	3	3
2578	737	2020-04-21	1	2
2579	737	2020-04-28	3	1
2580	737	2020-04-16	1	2
2581	737	2020-04-11	2	1
2582	738	2020-04-06	2	2
2583	738	2020-04-13	2	2
2584	738	2020-04-18	1	1
2585	738	2020-04-27	2	2
2586	738	2020-04-12	1	1
2587	738	2020-04-16	1	2
2588	739	2020-04-04	2	3
2589	739	2020-04-26	2	2
2590	739	2020-04-13	2	2
2591	740	2020-04-22	2	2
2592	741	2020-04-14	1	2
2593	741	2020-04-05	1	3
2594	741	2020-04-06	1	1
2595	741	2020-04-14	1	2
2596	742	2020-04-29	3	2
2597	742	2020-04-29	2	3
2598	742	2020-04-21	2	3
2599	742	2020-04-16	1	2
2600	743	2020-04-10	1	1
2601	743	2020-04-28	1	2
2602	744	2020-04-13	2	1
2603	744	2020-04-23	1	1
2604	744	2020-04-11	1	1
2605	744	2020-04-06	2	2
2606	744	2020-04-14	2	2
2607	745	2020-04-13	2	1
2608	745	2020-04-16	1	1
2609	745	2020-04-15	2	2
2610	745	2020-04-03	2	2
2611	745	2020-04-29	2	1
2612	746	2020-04-07	2	1
2613	746	2020-04-02	2	2
2614	746	2020-04-07	1	2
2615	746	2020-04-23	2	3
2616	746	2020-04-02	2	2
2617	746	2020-04-01	2	3
2618	747	2020-04-14	2	2
2619	747	2020-04-05	2	2
2620	747	2020-04-13	1	1
2621	747	2020-04-06	2	3
2622	747	2020-04-07	2	2
2623	747	2020-04-03	1	2
2624	748	2020-04-24	2	2
2625	748	2020-04-07	1	2
2626	748	2020-04-19	1	2
2627	749	2020-04-15	1	2
2628	749	2020-04-01	1	3
2629	749	2020-04-05	1	3
2630	749	2020-04-17	1	3
2631	749	2020-04-10	1	2
2632	750	2020-04-09	2	3
2633	750	2020-04-05	1	3
2634	750	2020-04-24	1	3
2635	750	2020-04-15	2	2
2636	751	2020-04-11	2	3
2637	751	2020-04-07	3	2
2638	751	2020-04-18	3	2
2639	751	2020-04-08	3	1
2640	751	2020-04-24	1	2
2641	752	2020-04-12	1	2
2642	752	2020-04-23	2	1
2643	752	2020-04-28	1	3
2644	752	2020-04-05	2	2
2645	752	2020-04-22	1	2
2646	753	2020-04-08	2	2
2647	753	2020-04-11	1	2
2648	753	2020-04-03	2	1
2649	753	2020-04-21	1	2
2650	753	2020-04-22	2	2
2651	754	2020-04-20	1	2
2652	754	2020-04-07	2	3
2653	755	2020-04-16	1	2
2654	755	2020-04-25	1	2
2655	756	2020-04-05	1	1
2656	756	2020-04-12	1	2
2657	756	2020-04-14	1	3
2658	757	2020-04-08	1	1
2659	757	2020-04-14	2	2
2660	758	2020-04-03	1	1
2661	758	2020-04-19	1	1
2662	758	2020-04-19	2	1
2663	758	2020-04-10	1	2
2664	758	2020-04-07	1	2
2665	759	2020-04-13	1	3
2666	759	2020-04-07	1	2
2667	759	2020-04-25	1	2
2668	760	2020-04-08	2	1
2669	760	2020-04-02	2	1
2670	760	2020-04-01	3	2
2671	760	2020-04-18	2	3
2672	760	2020-04-20	2	3
2673	761	2020-04-23	1	2
2674	761	2020-04-22	1	2
2675	761	2020-04-20	1	1
2676	762	2020-04-07	1	3
2677	762	2020-04-25	1	2
2678	762	2020-04-21	2	1
2679	762	2020-04-12	1	3
2680	763	2020-04-22	2	1
2681	764	2020-04-07	1	1
2682	764	2020-04-25	2	1
2683	764	2020-04-19	2	2
2684	765	2020-04-28	1	2
2685	765	2020-04-07	2	3
2686	765	2020-04-08	2	3
2687	765	2020-04-22	1	2
2688	766	2020-04-02	2	1
2689	766	2020-04-27	1	3
2690	767	2020-04-10	1	2
2691	767	2020-04-05	3	2
2692	768	2020-04-04	2	2
2693	769	2020-04-16	2	2
2694	769	2020-04-27	2	2
2695	769	2020-04-26	2	2
2696	769	2020-04-15	1	1
2697	770	2020-04-16	2	3
2698	771	2020-04-29	2	2
2699	771	2020-04-24	2	1
2700	771	2020-04-12	1	1
2701	771	2020-04-19	1	2
2702	771	2020-04-17	2	3
2703	772	2020-04-02	1	3
2704	772	2020-04-19	2	2
2705	772	2020-04-18	2	2
2706	773	2020-04-23	2	2
2707	774	2020-04-25	1	2
2708	774	2020-04-07	1	1
2709	774	2020-04-10	1	2
2710	775	2020-04-18	1	2
2711	775	2020-04-22	2	3
2712	776	2020-04-05	2	2
2713	776	2020-04-16	2	2
2714	777	2020-04-08	2	1
2715	777	2020-04-27	2	1
2716	778	2020-04-05	1	1
2717	778	2020-04-15	1	2
2718	779	2020-04-18	2	2
2719	779	2020-04-21	1	2
2720	779	2020-04-02	1	2
2721	779	2020-04-18	2	3
2722	780	2020-04-12	1	2
2723	780	2020-04-06	2	1
2724	780	2020-04-13	1	3
2725	780	2020-04-01	2	1
2726	780	2020-04-19	2	2
2727	781	2020-04-15	1	2
2728	782	2020-04-05	1	3
2729	782	2020-04-27	2	2
2730	782	2020-04-29	2	1
2731	782	2020-04-16	1	2
2732	782	2020-04-05	1	1
2733	783	2020-04-12	1	3
2734	783	2020-04-19	1	1
2735	783	2020-04-22	1	2
2736	783	2020-04-14	1	2
2737	783	2020-04-26	1	1
2738	784	2020-04-22	1	3
2739	784	2020-04-02	1	2
2740	784	2020-04-12	2	2
2741	784	2020-04-21	2	2
2742	784	2020-04-17	2	3
2743	785	2020-04-26	2	1
2744	785	2020-04-12	2	3
2745	785	2020-04-26	2	3
2746	785	2020-04-05	2	1
2747	786	2020-04-02	2	3
2748	786	2020-04-16	3	2
2749	786	2020-04-16	1	3
2750	786	2020-04-02	1	2
2751	787	2020-04-01	2	3
2752	787	2020-04-07	1	2
2753	787	2020-04-21	1	2
2754	787	2020-04-22	2	3
2755	787	2020-04-29	1	1
2756	787	2020-04-01	1	2
2757	788	2020-04-10	1	2
2758	788	2020-04-07	1	2
2759	788	2020-04-25	2	2
2760	789	2020-04-10	2	2
2761	789	2020-04-12	2	2
2762	789	2020-04-08	2	2
2763	789	2020-04-10	2	2
2764	789	2020-04-09	3	1
2765	790	2020-04-21	1	2
2766	790	2020-04-15	1	2
2767	791	2020-04-13	3	3
2768	791	2020-04-20	2	3
2769	791	2020-04-21	1	3
2770	792	2020-04-05	2	2
2771	792	2020-04-15	1	2
2772	792	2020-04-01	2	2
2773	793	2020-04-10	2	1
2774	793	2020-04-20	1	2
2775	793	2020-04-02	1	3
2776	793	2020-04-04	2	2
2777	793	2020-04-07	1	2
2778	794	2020-04-04	3	1
2779	794	2020-04-20	1	2
2780	795	2020-04-13	2	2
2781	795	2020-04-18	2	3
2782	795	2020-04-27	2	2
2783	795	2020-04-24	2	2
2784	796	2020-04-28	2	1
2785	796	2020-04-04	2	1
2786	796	2020-04-11	2	1
2787	797	2020-04-02	1	2
2788	798	2020-04-18	1	3
2789	798	2020-04-22	1	3
2790	799	2020-04-08	1	3
2791	800	2020-04-25	2	3
2792	800	2020-04-25	2	2
2793	800	2020-04-11	3	2
2794	800	2020-04-10	3	1
2795	801	2020-04-01	1	3
2796	801	2020-04-12	2	3
2797	801	2020-04-23	2	2
2798	801	2020-04-18	1	2
2799	801	2020-04-01	2	1
2800	802	2020-04-06	1	2
2801	803	2020-04-17	1	2
2802	803	2020-04-07	2	2
2803	803	2020-04-06	2	1
2804	803	2020-04-14	2	1
2805	803	2020-04-12	1	2
2806	803	2020-04-26	2	2
2807	804	2020-04-26	1	3
2808	804	2020-04-20	1	2
2809	805	2020-04-22	2	3
2810	805	2020-04-22	2	1
2811	805	2020-04-11	1	2
2812	806	2020-04-22	1	3
2813	806	2020-04-09	1	2
2814	806	2020-04-29	1	2
2815	807	2020-04-11	1	2
2816	807	2020-04-27	2	1
2817	808	2020-04-22	1	2
2818	808	2020-04-21	1	3
2819	808	2020-04-02	2	2
2820	809	2020-04-06	1	3
2821	809	2020-04-10	1	3
2822	810	2020-04-06	2	2
2823	810	2020-04-04	2	2
2824	810	2020-04-20	1	3
2825	811	2020-04-18	1	2
2826	812	2020-04-27	2	2
2827	812	2020-04-22	2	2
2828	812	2020-04-01	3	1
2829	813	2020-04-17	1	2
2830	813	2020-04-14	1	1
2831	813	2020-04-14	2	1
2832	813	2020-04-11	2	2
2833	813	2020-04-20	2	3
2834	813	2020-04-20	1	2
2835	814	2020-04-24	1	3
2836	814	2020-04-19	2	2
2837	815	2020-04-14	2	1
2838	815	2020-04-07	1	2
2839	815	2020-04-03	2	3
2840	815	2020-04-20	2	2
2841	816	2020-04-23	2	2
2842	816	2020-04-04	2	2
2843	817	2020-04-22	1	3
2844	818	2020-04-18	1	2
2845	818	2020-04-19	1	3
2846	818	2020-04-22	2	3
2847	819	2020-04-16	2	2
2848	819	2020-04-03	1	2
2849	820	2020-04-13	1	2
2850	820	2020-04-03	2	3
2851	820	2020-04-15	1	1
2852	821	2020-04-15	1	2
2853	822	2020-04-21	2	2
2854	822	2020-04-21	2	2
2855	823	2020-04-03	1	2
2856	823	2020-04-10	2	2
2857	823	2020-04-13	2	3
2858	823	2020-04-01	2	2
2859	823	2020-04-10	2	2
2860	824	2020-04-01	1	3
2861	824	2020-04-14	1	3
2862	824	2020-04-23	1	2
2863	824	2020-04-13	1	2
2864	824	2020-04-05	1	2
2865	825	2020-04-02	2	2
2866	825	2020-04-08	3	3
2867	825	2020-04-28	2	3
2868	826	2020-04-07	2	2
2869	826	2020-04-22	1	3
2870	826	2020-04-08	1	1
2871	826	2020-04-27	2	1
2872	826	2020-04-10	1	2
2873	826	2020-04-02	2	3
2874	827	2020-04-12	1	2
2875	827	2020-04-17	1	2
2876	827	2020-04-10	1	2
2877	827	2020-04-01	1	3
2878	828	2020-04-08	1	3
2879	828	2020-04-05	1	1
2880	828	2020-04-13	1	3
2881	828	2020-04-07	1	1
2882	829	2020-04-07	1	2
2883	829	2020-04-17	1	2
2884	830	2020-04-14	1	2
2885	830	2020-04-17	1	3
2886	830	2020-04-29	1	1
2887	830	2020-04-22	1	2
2888	830	2020-04-19	1	1
2889	831	2020-04-29	1	2
2890	831	2020-04-15	1	2
2891	831	2020-04-18	1	3
2892	831	2020-04-03	1	1
2893	832	2020-04-29	1	3
2894	832	2020-04-10	3	1
2895	832	2020-04-28	2	2
2896	832	2020-04-09	1	1
2897	832	2020-04-18	2	1
2898	833	2020-04-09	2	2
2899	833	2020-04-10	2	3
2900	833	2020-04-04	2	3
2901	833	2020-04-03	2	1
2902	834	2020-04-09	1	2
2903	835	2020-04-27	1	3
2904	835	2020-04-09	1	3
2905	835	2020-04-07	1	3
2906	836	2020-04-07	1	2
2907	836	2020-04-01	2	2
2908	837	2020-04-23	2	2
2909	837	2020-04-01	2	1
2910	837	2020-04-27	1	1
2911	837	2020-04-19	1	1
2912	837	2020-04-19	1	2
2913	837	2020-04-05	2	3
2914	838	2020-04-02	1	1
2915	838	2020-04-23	1	1
2916	838	2020-04-07	1	1
2917	838	2020-04-28	1	1
2918	839	2020-04-14	2	2
2919	839	2020-04-24	2	1
2920	840	2020-04-27	1	2
2921	840	2020-04-03	1	3
2922	840	2020-04-03	1	1
2923	840	2020-04-15	1	2
2924	840	2020-04-10	1	2
2925	841	2020-04-24	2	1
2926	841	2020-04-12	2	1
2927	841	2020-04-22	2	1
2928	841	2020-04-15	1	2
2929	841	2020-04-02	2	1
2930	842	2020-04-17	2	2
2931	842	2020-04-11	2	2
2932	842	2020-04-14	1	3
2933	842	2020-04-15	2	1
2934	843	2020-04-22	2	3
2935	843	2020-04-10	1	2
2936	843	2020-04-13	2	1
2937	844	2020-04-19	2	1
2938	844	2020-04-01	2	3
2939	844	2020-04-20	1	2
2940	845	2020-04-16	3	2
2941	845	2020-04-25	2	2
2942	846	2020-04-03	2	2
2943	846	2020-04-20	1	2
2944	846	2020-04-17	2	2
2945	846	2020-04-07	1	3
2946	846	2020-04-06	1	3
2947	847	2020-04-26	2	2
2948	847	2020-04-20	1	1
2949	847	2020-04-09	1	2
2950	847	2020-04-15	2	2
2951	847	2020-04-04	2	3
2952	848	2020-04-14	1	2
2953	848	2020-04-08	1	2
2954	848	2020-04-05	1	3
2955	849	2020-04-27	2	2
2956	849	2020-04-20	2	1
2957	850	2020-04-25	1	2
2958	850	2020-04-12	1	2
2959	850	2020-04-09	1	2
2960	851	2020-04-10	1	1
2961	851	2020-04-01	1	2
2962	852	2020-04-08	2	1
2963	852	2020-04-12	1	1
2964	852	2020-04-21	1	2
2965	852	2020-04-09	1	2
2966	852	2020-04-07	1	3
2967	852	2020-04-23	1	2
2968	853	2020-04-07	2	2
2969	853	2020-04-13	1	1
2970	854	2020-04-08	1	2
2971	854	2020-04-21	1	3
2972	854	2020-04-01	1	3
2973	855	2020-04-24	2	3
2974	855	2020-04-03	1	3
2975	855	2020-04-02	2	2
2976	855	2020-04-13	1	3
2977	855	2020-04-13	1	1
2978	856	2020-04-27	2	3
2979	856	2020-04-17	1	3
2980	857	2020-04-16	1	2
2981	857	2020-04-01	2	2
2982	857	2020-04-14	1	3
2983	858	2020-04-24	1	2
2984	858	2020-04-04	1	2
2985	859	2020-04-19	1	2
2986	859	2020-04-03	2	1
2987	859	2020-04-14	2	3
2988	859	2020-04-15	1	2
2989	859	2020-04-25	2	1
2990	860	2020-04-17	2	2
2991	860	2020-04-14	1	2
2992	860	2020-04-20	2	1
2993	860	2020-04-19	2	1
2994	860	2020-04-17	2	2
2995	861	2020-04-21	2	3
2996	861	2020-04-19	1	1
2997	861	2020-04-21	1	2
2998	861	2020-04-02	2	3
2999	862	2020-04-26	2	2
3000	862	2020-04-11	1	2
3001	863	2020-04-25	1	1
3002	863	2020-04-12	1	2
3003	863	2020-04-07	2	2
3004	863	2020-04-27	2	2
3005	864	2020-04-07	1	1
3006	864	2020-04-18	1	3
3007	865	2020-04-25	1	3
3008	865	2020-04-23	1	2
3009	865	2020-04-16	2	1
3010	866	2020-04-20	3	1
3011	866	2020-04-19	1	3
3012	867	2020-04-15	1	2
3013	867	2020-04-07	1	1
3014	868	2020-04-18	1	2
3015	868	2020-04-03	1	2
3016	868	2020-04-09	1	1
3017	868	2020-04-02	1	1
3018	869	2020-04-01	1	2
3019	869	2020-04-14	1	3
3020	869	2020-04-20	1	2
3021	869	2020-04-09	1	3
3022	869	2020-04-04	1	2
3023	870	2020-04-07	2	2
3024	870	2020-04-02	2	2
3025	871	2020-04-09	1	2
3026	871	2020-04-10	2	2
3027	871	2020-04-20	2	2
3028	871	2020-04-15	2	3
3029	871	2020-04-17	1	1
3030	872	2020-04-27	1	2
3031	872	2020-04-15	1	2
3032	873	2020-04-05	1	2
3033	873	2020-04-16	1	2
3034	873	2020-04-24	2	3
3035	873	2020-04-07	2	2
3036	873	2020-04-17	1	3
3037	874	2020-04-22	2	3
3038	874	2020-04-23	1	2
3039	875	2020-04-19	1	2
3040	875	2020-04-20	1	3
3041	876	2020-04-12	1	2
3042	876	2020-04-28	1	3
3043	876	2020-04-07	2	1
3044	877	2020-04-09	2	2
3045	878	2020-04-19	1	1
3046	878	2020-04-04	1	1
3047	879	2020-04-13	1	1
3048	879	2020-04-06	1	1
3049	880	2020-04-12	1	2
3050	880	2020-04-14	1	3
3051	880	2020-04-23	1	3
3052	880	2020-04-26	1	3
3053	880	2020-04-22	1	3
3054	880	2020-04-05	1	2
3055	881	2020-04-01	3	3
3056	881	2020-04-16	2	2
3057	881	2020-04-17	1	1
3058	881	2020-04-27	2	1
3059	881	2020-04-03	1	2
3060	881	2020-04-11	2	3
3061	882	2020-04-26	1	1
3062	882	2020-04-22	1	3
3063	882	2020-04-12	1	2
3064	882	2020-04-08	1	2
3065	883	2020-04-05	2	3
3066	884	2020-04-28	1	2
3067	884	2020-04-26	1	2
3068	885	2020-04-28	1	2
3069	885	2020-04-06	1	2
3070	885	2020-04-22	1	3
3071	885	2020-04-15	1	2
3072	886	2020-04-20	2	3
3073	886	2020-04-25	2	2
3074	886	2020-04-25	2	1
3075	886	2020-04-10	2	1
3076	886	2020-04-21	2	1
3077	886	2020-04-23	1	1
3078	887	2020-04-24	1	1
3079	887	2020-04-13	2	1
3080	887	2020-04-29	1	1
3081	887	2020-04-16	1	3
3082	887	2020-04-14	1	2
3083	887	2020-04-19	1	2
3084	888	2020-04-01	2	2
3085	888	2020-04-03	2	2
3086	888	2020-04-22	3	2
3087	888	2020-04-20	3	2
3088	888	2020-04-24	2	2
3089	889	2020-04-22	2	1
3090	889	2020-04-13	2	2
3091	890	2020-04-19	1	3
3092	890	2020-04-25	1	3
3093	890	2020-04-18	1	1
3094	890	2020-04-09	1	2
3095	890	2020-04-26	1	1
3096	890	2020-04-09	1	2
3097	891	2020-04-04	2	3
3098	891	2020-04-04	3	3
3099	891	2020-04-10	2	2
3100	892	2020-04-29	1	2
3101	892	2020-04-14	2	1
3102	892	2020-04-02	1	2
3103	892	2020-04-17	2	2
3104	892	2020-04-18	1	1
3105	893	2020-04-19	3	2
3106	893	2020-04-20	1	1
3107	893	2020-04-19	2	3
3108	893	2020-04-15	2	2
3109	893	2020-04-02	1	1
3110	894	2020-04-23	1	2
3111	894	2020-04-24	2	1
3112	894	2020-04-22	2	2
3113	895	2020-04-23	2	1
3114	895	2020-04-03	1	3
3115	895	2020-04-15	2	2
3116	896	2020-04-03	1	2
3117	896	2020-04-16	2	1
3118	896	2020-04-25	1	2
3119	896	2020-04-12	2	2
3120	897	2020-04-24	1	2
3121	897	2020-04-13	1	3
3122	897	2020-04-23	2	2
3123	898	2020-04-07	2	1
3124	898	2020-04-04	1	3
3125	898	2020-04-16	1	2
3126	898	2020-04-18	1	1
3127	898	2020-04-07	2	2
3128	899	2020-04-17	1	3
3129	899	2020-04-12	1	2
3130	899	2020-04-06	2	2
3131	899	2020-04-28	2	3
3132	899	2020-04-08	1	2
3133	900	2020-04-02	2	1
3134	900	2020-04-14	1	2
3135	901	2020-04-13	1	3
3136	901	2020-04-11	1	2
3137	901	2020-04-18	2	2
3138	901	2020-04-25	2	2
3139	902	2020-04-16	1	3
3140	902	2020-04-26	2	1
3141	902	2020-04-08	1	1
3142	903	2020-04-18	2	1
3143	903	2020-04-03	2	3
3144	904	2020-04-21	1	2
3145	904	2020-04-22	2	2
3146	904	2020-04-14	1	1
3147	904	2020-04-29	1	3
3148	905	2020-04-26	3	2
3149	906	2020-04-26	1	2
3150	906	2020-04-20	1	1
3151	907	2020-04-04	1	3
3152	908	2020-04-14	1	2
3153	908	2020-04-10	1	3
3154	908	2020-04-02	1	2
3155	909	2020-04-07	1	3
3156	910	2020-04-25	1	3
3157	910	2020-04-01	1	3
3158	910	2020-04-19	1	2
3159	910	2020-04-07	2	2
3160	910	2020-04-14	2	3
3161	911	2020-04-14	1	2
3162	911	2020-04-20	2	1
3163	912	2020-04-22	1	3
3164	912	2020-04-08	2	2
3165	912	2020-04-13	1	2
3166	912	2020-04-14	1	2
3167	912	2020-04-11	1	1
3168	913	2020-04-06	2	3
3169	913	2020-04-25	2	3
3170	913	2020-04-14	2	2
3171	914	2020-04-15	1	1
3172	914	2020-04-27	1	2
3173	914	2020-04-16	2	1
3174	914	2020-04-03	2	2
3175	914	2020-04-25	2	2
3176	915	2020-04-13	2	3
3177	915	2020-04-16	1	2
3178	915	2020-04-18	1	1
3179	915	2020-04-01	1	2
3180	915	2020-04-09	2	2
3181	915	2020-04-03	2	2
3182	916	2020-04-09	2	3
3183	916	2020-04-16	3	2
3184	916	2020-04-15	2	2
3185	917	2020-04-19	1	2
3186	917	2020-04-04	1	2
3187	918	2020-04-08	1	2
3188	918	2020-04-17	1	2
3189	918	2020-04-21	1	1
3190	918	2020-04-10	1	2
3191	919	2020-04-12	1	3
3192	919	2020-04-07	1	2
3193	919	2020-04-29	1	2
3194	920	2020-04-02	1	1
3195	920	2020-04-05	1	2
3196	920	2020-04-15	1	2
3197	920	2020-04-06	1	3
3198	920	2020-04-02	1	3
3199	921	2020-04-17	1	1
3200	921	2020-04-04	1	2
3201	921	2020-04-08	1	2
3202	921	2020-04-01	1	2
3203	921	2020-04-10	1	2
3204	922	2020-04-17	1	2
3205	923	2020-04-21	2	2
3206	923	2020-04-29	2	1
3207	923	2020-04-25	2	1
3208	923	2020-04-18	1	2
3209	923	2020-04-09	2	2
3210	923	2020-04-14	1	2
3211	924	2020-04-09	2	2
3212	924	2020-04-02	2	2
3213	924	2020-04-14	2	2
3214	924	2020-04-27	3	2
3215	925	2020-04-14	1	1
3216	925	2020-04-19	1	1
3217	925	2020-04-18	1	2
3218	926	2020-04-11	1	2
3219	926	2020-04-06	1	2
3220	927	2020-04-18	1	3
3221	927	2020-04-10	1	2
3222	928	2020-04-08	2	3
3223	928	2020-04-13	2	3
3224	928	2020-04-25	2	2
3225	928	2020-04-16	2	3
3226	928	2020-04-17	2	1
3227	928	2020-04-11	1	2
3228	929	2020-04-17	2	2
3229	929	2020-04-25	1	2
3230	929	2020-04-16	1	3
3231	929	2020-04-13	1	3
3232	929	2020-04-15	2	1
3233	930	2020-04-15	2	2
3234	930	2020-04-26	2	2
3235	930	2020-04-07	1	2
3236	931	2020-04-20	1	2
3237	931	2020-04-01	1	2
3238	931	2020-04-01	2	3
3239	931	2020-04-17	1	2
3240	931	2020-04-15	2	1
3241	932	2020-04-27	1	3
3242	932	2020-04-17	1	2
3243	933	2020-04-27	2	2
3244	933	2020-04-18	2	2
3245	933	2020-04-02	1	3
3246	933	2020-04-18	2	2
3247	934	2020-04-05	2	2
3248	934	2020-04-19	2	3
3249	934	2020-04-27	1	2
3250	934	2020-04-16	2	2
3251	934	2020-04-07	2	3
3252	934	2020-04-14	2	2
3253	935	2020-04-04	2	2
3254	935	2020-04-26	2	2
3255	935	2020-04-01	1	2
3256	936	2020-04-08	2	2
3257	936	2020-04-26	1	2
3258	937	2020-04-20	2	1
3259	937	2020-04-25	2	2
3260	937	2020-04-12	3	3
3261	937	2020-04-06	2	1
3262	938	2020-04-21	1	3
3263	938	2020-04-17	1	3
3264	939	2020-04-03	1	2
3265	939	2020-04-14	2	1
3266	939	2020-04-27	2	3
3267	939	2020-04-20	1	3
3268	939	2020-04-10	1	1
3269	940	2020-04-22	1	2
3270	940	2020-04-16	2	3
3271	940	2020-04-16	1	3
3272	940	2020-04-27	2	3
3273	940	2020-04-02	2	3
3274	940	2020-04-24	2	1
3275	941	2020-04-17	1	2
3276	941	2020-04-16	1	2
3277	941	2020-04-19	2	1
3278	942	2020-04-15	1	2
3279	942	2020-04-10	1	1
3280	942	2020-04-19	1	3
3281	943	2020-04-14	1	1
3282	943	2020-04-11	2	3
3283	943	2020-04-13	1	2
3284	943	2020-04-03	2	2
3285	943	2020-04-04	2	2
3286	944	2020-04-11	1	2
3287	944	2020-04-23	1	2
3288	944	2020-04-22	1	2
3289	944	2020-04-26	2	1
3290	944	2020-04-28	2	2
3291	945	2020-04-21	1	1
3292	945	2020-04-11	1	1
3293	945	2020-04-18	1	1
3294	945	2020-04-09	1	1
3295	945	2020-04-05	1	2
3296	945	2020-04-08	1	2
3297	946	2020-04-11	1	3
3298	946	2020-04-15	1	1
3299	946	2020-04-04	1	2
3300	947	2020-04-26	1	2
3301	947	2020-04-23	1	2
3302	947	2020-04-12	2	2
3303	948	2020-04-29	1	3
3304	948	2020-04-22	1	2
3305	948	2020-04-28	1	2
3306	949	2020-04-05	1	2
3307	949	2020-04-03	1	2
3308	949	2020-04-29	1	1
3309	949	2020-04-08	1	2
3310	949	2020-04-22	1	1
3311	950	2020-04-16	1	3
3312	950	2020-04-20	1	1
3313	950	2020-04-18	1	3
3314	950	2020-04-06	1	3
3315	951	2020-04-06	2	2
3316	951	2020-04-05	2	3
3317	951	2020-04-09	3	2
3318	952	2020-04-21	1	3
3319	952	2020-04-08	2	1
3320	952	2020-04-03	1	2
3321	953	2020-04-20	1	1
3322	954	2020-04-19	2	3
3323	955	2020-04-04	2	3
3324	956	2020-04-07	1	2
3325	956	2020-04-15	1	2
3326	956	2020-04-21	1	1
3327	956	2020-04-26	1	3
3328	957	2020-04-28	2	2
3329	957	2020-04-15	2	2
3330	957	2020-04-24	2	2
3331	957	2020-04-02	1	3
3332	958	2020-04-09	1	1
3333	958	2020-04-21	1	2
3334	958	2020-04-09	1	1
3335	958	2020-04-08	1	2
3336	958	2020-04-12	1	2
3337	959	2020-04-05	2	1
3338	959	2020-04-28	2	2
3339	959	2020-04-26	3	2
3340	959	2020-04-05	2	3
3341	960	2020-04-21	1	1
3342	960	2020-04-26	2	2
3343	960	2020-04-12	1	2
3344	960	2020-04-27	1	2
3345	961	2020-04-20	3	2
3346	961	2020-04-27	1	2
3347	962	2020-04-03	3	2
3348	962	2020-04-08	2	3
3349	962	2020-04-07	2	1
3350	963	2020-04-07	3	3
3351	963	2020-04-16	3	2
3352	963	2020-04-08	2	3
3353	963	2020-04-25	2	1
3354	964	2020-04-02	2	3
3355	964	2020-04-11	2	2
3356	964	2020-04-19	1	2
3357	964	2020-04-29	2	2
3358	965	2020-04-01	2	2
3359	965	2020-04-10	1	2
3360	965	2020-04-14	1	1
3361	965	2020-04-11	2	2
3362	965	2020-04-02	3	3
3363	965	2020-04-14	2	2
3364	966	2020-04-26	1	3
3365	966	2020-04-21	1	3
3366	967	2020-04-07	1	3
3367	967	2020-04-11	1	2
3368	967	2020-04-04	1	2
3369	967	2020-04-02	1	2
3370	967	2020-04-21	1	2
3371	967	2020-04-14	1	2
3372	968	2020-04-17	3	1
3373	968	2020-04-21	1	1
3374	969	2020-04-03	1	2
3375	969	2020-04-07	2	3
3376	969	2020-04-16	2	2
3377	969	2020-04-02	2	2
3378	969	2020-04-04	1	1
3379	969	2020-04-28	2	1
3380	970	2020-04-25	1	3
3381	970	2020-04-23	1	1
3382	971	2020-04-19	1	2
3383	971	2020-04-01	1	1
3384	971	2020-04-06	2	2
3385	971	2020-04-12	1	2
3386	972	2020-04-20	1	2
3387	972	2020-04-24	1	2
3388	972	2020-04-24	1	3
3389	972	2020-04-11	1	3
3390	973	2020-04-07	1	1
3391	973	2020-04-24	2	3
3392	973	2020-04-19	1	2
3393	974	2020-04-18	1	2
3394	974	2020-04-12	2	3
3395	974	2020-04-11	2	2
3396	974	2020-04-11	1	2
3397	974	2020-04-03	2	2
3398	974	2020-04-07	1	2
3399	975	2020-04-12	1	2
3400	975	2020-04-11	1	3
3401	976	2020-04-17	1	1
3402	976	2020-04-21	1	3
3403	976	2020-04-08	1	2
3404	976	2020-04-29	2	3
3405	976	2020-04-12	1	2
3406	976	2020-04-03	1	3
3407	977	2020-04-21	1	2
3408	977	2020-04-20	1	1
3409	977	2020-04-06	1	2
3410	977	2020-04-07	1	1
3411	977	2020-04-21	1	3
3412	977	2020-04-08	1	3
3413	978	2020-04-07	1	3
3414	978	2020-04-17	2	3
3415	979	2020-04-24	2	3
3416	979	2020-04-22	1	2
3417	979	2020-04-08	3	3
3418	979	2020-04-12	3	2
3419	979	2020-04-25	2	2
3420	979	2020-04-02	1	2
3421	980	2020-04-27	2	2
3422	980	2020-04-17	2	3
3423	981	2020-04-28	1	2
3424	981	2020-04-07	1	2
3425	981	2020-04-10	2	3
3426	982	2020-04-17	3	2
3427	982	2020-04-22	3	1
3428	982	2020-04-15	1	2
3429	982	2020-04-10	1	1
3430	982	2020-04-17	1	2
3431	983	2020-04-02	1	1
3432	984	2020-04-21	1	1
3433	984	2020-04-09	1	3
3434	985	2020-04-21	1	3
3435	985	2020-04-02	1	2
3436	986	2020-04-22	1	2
3437	987	2020-04-27	3	2
3438	987	2020-04-05	3	2
3439	987	2020-04-15	2	2
3440	988	2020-04-20	1	3
3441	988	2020-04-24	1	2
3442	988	2020-04-11	1	2
3443	988	2020-04-29	1	3
3444	988	2020-04-06	1	2
3445	989	2020-04-19	1	2
3446	989	2020-04-24	2	1
3447	989	2020-04-27	1	2
3448	989	2020-04-12	2	2
3449	989	2020-04-08	1	3
3450	990	2020-04-09	1	3
3451	990	2020-04-26	1	1
3452	990	2020-04-09	2	1
3453	990	2020-04-07	2	1
3454	990	2020-04-23	2	1
3455	990	2020-04-24	1	2
3456	991	2020-04-10	2	2
3457	991	2020-04-18	2	1
3458	991	2020-04-20	1	1
3459	991	2020-04-13	1	1
3460	992	2020-04-19	1	2
3461	992	2020-04-07	2	2
3462	993	2020-04-01	2	2
3463	993	2020-04-05	1	2
3464	993	2020-04-26	1	1
3465	993	2020-04-29	1	3
3466	994	2020-04-08	1	1
3467	994	2020-04-24	1	3
3468	995	2020-04-14	2	2
3469	995	2020-04-15	1	1
3470	995	2020-04-25	3	3
3471	996	2020-04-27	1	2
3472	996	2020-04-16	1	2
3473	996	2020-04-29	2	2
3474	997	2020-04-07	1	3
3475	997	2020-04-06	1	1
3476	997	2020-04-13	1	1
3477	997	2020-04-24	1	2
3478	997	2020-04-17	1	2
3479	998	2020-04-16	2	2
3480	998	2020-04-22	2	2
3481	998	2020-04-28	1	2
3482	998	2020-04-02	1	2
3483	998	2020-04-18	1	3
3484	999	2020-04-12	1	2
3485	999	2020-04-27	1	2
3486	999	2020-04-03	1	2
3487	1000	2020-04-25	2	3
3488	1000	2020-04-06	1	2
3489	1000	2020-04-26	1	2
\.


--
-- Data for Name: paiement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paiement (id, libelle) FROM stdin;
1	Carte bancaire
2	Chèque
3	Contre remboursement
\.


--
-- Data for Name: porter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.porter (idcommande, refproduit, quantite) FROM stdin;
1	551320	5
1	354619	4
1	540828	2
2	729979	2
2	150181	3
2	169537	3
2	584502	4
2	494940	4
3	209180	2
3	765884	5
3	150161	4
4	776626	2
4	322677	4
4	209180	4
4	622500	4
5	617776	3
5	404719	3
5	302850	3
5	591311	1
5	296215	3
6	752387	1
6	343041	2
7	729979	2
7	551320	4
7	657852	3
7	776626	4
7	494940	3
8	591311	5
8	584502	4
8	776626	2
8	464331	2
8	690765	3
8	680088	3
9	727024	3
9	690765	3
9	214399	4
9	676078	4
10	749887	5
10	591311	5
11	278562	2
11	540828	4
11	149183	3
11	354619	3
11	238569	5
11	118277	3
12	464331	4
12	690765	4
12	316097	5
12	776626	5
12	551320	2
13	622500	3
13	591311	1
13	537539	1
13	640479	3
14	591311	3
14	749887	5
14	118277	2
15	325139	4
15	149183	3
15	209180	3
15	591311	4
16	540828	4
16	354619	1
16	343041	5
16	640479	3
17	349129	4
17	640479	2
17	540828	5
17	729979	1
17	749887	3
18	602951	4
18	226251	4
18	150181	3
18	551320	2
18	540828	3
18	657852	3
19	383805	2
19	319977	4
19	494940	1
19	404719	4
20	752387	2
20	160692	2
20	622500	1
20	349129	3
20	584502	5
20	729979	4
21	765884	3
21	343041	1
21	584502	1
21	278562	5
22	316097	3
22	296215	4
23	214399	1
23	238569	4
24	209180	3
24	591311	3
24	602951	2
25	278562	1
25	584502	2
25	296215	2
25	149183	2
25	160692	1
26	296215	1
27	296215	4
27	537539	3
27	278562	3
27	302850	4
28	118277	4
29	123036	2
29	540828	4
29	349129	4
29	169537	3
30	319977	5
31	749887	1
31	325139	4
31	657852	2
32	663789	2
32	354619	3
32	776626	3
32	680088	3
32	765884	3
33	349129	2
33	551320	2
33	464331	5
33	226251	4
34	537539	4
34	383805	3
34	214399	4
34	169537	4
35	150161	3
35	540828	2
35	325139	4
36	765884	3
36	640479	1
36	663789	3
37	238569	3
37	765884	5
37	150161	3
37	404719	3
38	540828	3
38	383805	2
38	150181	4
38	749887	4
38	322677	2
38	690765	3
39	602951	4
39	560017	2
40	343041	5
41	118277	4
41	591311	3
41	663789	3
41	727024	5
42	238569	3
42	150181	2
42	209180	5
43	149183	2
43	560017	4
43	584502	1
43	150161	5
44	622500	5
44	404719	2
44	150161	3
44	149183	2
44	565245	4
45	663789	1
45	494940	2
46	676078	2
46	657852	3
47	640479	3
47	765884	1
47	584502	5
48	657852	4
48	383805	4
48	238569	4
48	676078	3
49	591311	2
49	214399	4
49	537539	3
49	584502	3
49	663789	3
50	464331	4
50	123036	5
50	727024	4
51	209180	5
51	676078	2
51	150161	3
52	354619	5
52	476299	3
52	617776	3
52	727024	1
52	278562	5
52	302850	2
53	640479	5
53	464331	5
53	123036	3
53	712605	1
54	118277	2
54	238569	4
55	383805	1
55	316097	4
55	226251	1
55	349129	4
55	560017	2
55	169537	3
56	712605	3
57	560017	3
57	209180	3
57	160692	3
58	494940	5
58	476299	2
59	690765	1
59	551320	4
59	404719	1
59	354619	3
59	319977	1
59	296215	5
60	325139	1
60	214399	4
61	727024	4
61	209180	1
62	404719	4
62	238569	1
63	752387	4
63	565245	2
63	617776	1
63	354619	3
64	214399	2
64	238569	3
64	150161	4
65	169537	5
65	296215	1
66	278562	3
66	765884	4
66	464331	4
66	296215	2
67	776626	1
68	278562	3
68	591311	2
68	551320	1
68	383805	2
68	296215	2
69	602951	2
69	150181	2
69	149183	5
70	727024	2
70	150181	3
71	319977	5
71	622500	3
71	494940	2
71	565245	2
71	617776	4
72	149183	3
72	209180	4
72	680088	4
73	278562	1
73	727024	5
74	662181	4
74	640479	2
75	690765	3
75	551320	2
75	560017	2
76	123036	2
76	494940	1
77	727024	3
77	560017	3
78	765884	4
78	662181	4
79	149183	3
79	150161	4
80	322677	3
80	349129	3
81	214399	3
82	316097	5
82	404719	1
82	765884	3
82	537539	4
82	560017	3
83	640479	3
83	209180	3
83	752387	3
83	383805	4
83	169537	5
83	765884	1
84	752387	2
84	169537	5
84	712605	1
85	209180	4
85	296215	3
85	404719	2
85	727024	5
86	640479	4
86	302850	4
86	680088	1
86	494940	4
86	617776	3
87	540828	3
87	640479	1
87	238569	1
88	551320	1
89	316097	4
89	662181	3
89	551320	5
89	354619	5
89	565245	4
90	537539	2
91	540828	3
91	680088	2
91	727024	3
91	729979	2
91	591311	1
92	729979	4
92	551320	1
92	663789	2
92	676078	3
92	560017	1
93	680088	2
94	494940	2
95	727024	1
95	325139	2
95	537539	5
96	680088	1
96	712605	2
97	160692	2
97	584502	1
98	729979	1
98	663789	2
98	662181	1
98	238569	2
98	322677	4
98	325139	5
99	676078	2
99	662181	3
99	160692	3
100	727024	1
100	349129	2
100	383805	3
100	149183	1
100	776626	2
101	123036	5
101	319977	4
101	325139	4
102	316097	2
102	690765	3
102	464331	5
102	752387	1
102	238569	3
103	727024	2
103	494940	3
103	169537	2
104	657852	2
104	622500	3
104	551320	2
104	150181	3
105	690765	2
105	540828	2
105	776626	5
105	765884	2
105	343041	2
106	238569	2
106	169537	5
106	617776	2
106	349129	1
107	602951	4
107	169537	3
107	565245	4
108	316097	2
108	322677	2
108	622500	2
108	209180	5
108	640479	2
108	765884	4
109	680088	1
109	404719	1
110	727024	5
110	476299	2
111	617776	3
111	325139	2
111	640479	2
111	354619	2
111	690765	2
111	296215	3
112	584502	5
112	476299	1
112	302850	5
112	322677	1
112	602951	5
113	551320	3
113	238569	4
113	123036	2
113	325139	2
114	657852	5
114	354619	3
114	776626	2
114	662181	1
115	662181	2
115	622500	2
115	404719	5
115	537539	2
116	690765	3
116	565245	2
116	238569	4
116	776626	1
116	584502	3
117	622500	5
117	663789	3
117	296215	2
118	316097	1
118	278562	3
118	622500	4
118	383805	2
118	776626	3
119	123036	5
119	238569	1
119	278562	4
119	160692	2
120	226251	3
120	343041	3
120	712605	4
120	662181	3
120	690765	2
121	238569	4
121	727024	3
122	354619	5
122	584502	2
122	464331	4
122	551320	1
122	690765	4
123	238569	3
123	565245	3
123	749887	5
123	118277	4
124	383805	4
124	565245	2
124	776626	3
124	537539	2
125	325139	2
125	316097	4
125	296215	3
125	565245	3
126	325139	5
126	226251	2
126	123036	2
127	591311	2
128	752387	5
128	349129	2
129	712605	4
129	657852	5
129	322677	1
129	325139	3
129	540828	5
129	319977	3
130	349129	5
130	476299	4
130	622500	2
130	591311	4
131	118277	4
131	349129	2
132	776626	1
132	540828	1
133	149183	1
133	214399	5
133	476299	2
134	169537	2
134	316097	1
135	209180	5
135	149183	4
135	727024	3
135	712605	5
135	729979	3
136	663789	2
136	404719	3
136	214399	4
136	584502	2
137	349129	5
137	238569	3
138	319977	1
138	729979	5
138	209180	2
138	776626	5
139	226251	4
139	551320	2
139	404719	2
139	729979	5
140	278562	3
140	640479	4
140	349129	1
140	680088	4
140	752387	4
141	149183	4
141	238569	2
141	404719	4
141	226251	3
141	537539	2
142	752387	1
142	214399	2
143	464331	2
143	118277	2
144	663789	2
144	476299	3
144	729979	1
145	765884	2
146	354619	1
146	622500	1
146	749887	5
147	560017	4
147	591311	2
147	476299	1
147	752387	1
147	118277	3
148	591311	4
148	640479	3
148	150181	3
149	560017	5
149	343041	2
150	680088	3
150	776626	2
150	617776	4
151	296215	3
152	118277	4
152	729979	4
153	343041	2
153	214399	2
153	150161	3
153	494940	2
154	214399	4
154	765884	4
154	354619	4
154	238569	5
154	316097	4
154	551320	3
155	662181	3
155	319977	1
155	729979	4
155	316097	2
155	214399	3
156	676078	5
156	316097	4
156	602951	4
156	540828	4
156	765884	2
156	494940	3
157	680088	5
157	640479	3
157	349129	3
157	551320	3
158	680088	5
158	662181	4
158	727024	1
158	383805	4
158	540828	4
159	690765	2
159	551320	2
159	752387	2
159	354619	3
160	118277	1
160	622500	5
160	551320	3
161	296215	3
161	343041	2
161	752387	4
161	584502	4
161	602951	5
162	169537	5
162	149183	1
162	123036	3
162	591311	1
162	476299	4
163	302850	4
163	209180	4
164	404719	4
164	663789	3
164	657852	3
165	662181	2
165	160692	3
165	749887	4
165	565245	2
165	226251	2
166	343041	2
166	349129	1
167	319977	5
168	316097	3
169	749887	3
169	226251	5
169	560017	3
169	494940	2
169	118277	4
170	123036	4
171	591311	1
171	494940	2
171	729979	4
171	150181	5
171	657852	3
171	551320	5
172	160692	2
172	150161	4
172	118277	2
172	560017	4
173	663789	3
173	657852	3
173	209180	3
173	150161	4
173	322677	1
174	617776	4
174	383805	3
174	404719	2
174	123036	5
174	349129	3
175	319977	3
175	322677	1
175	537539	2
175	776626	2
175	316097	3
176	662181	4
176	622500	5
176	591311	4
176	169537	4
177	150161	2
178	349129	5
178	680088	3
179	729979	5
179	150181	4
179	464331	4
179	343041	3
180	676078	4
180	354619	1
180	617776	1
180	383805	5
180	657852	1
181	150181	4
181	729979	5
181	302850	4
182	316097	2
182	322677	3
182	776626	3
182	663789	3
182	622500	3
182	209180	3
183	118277	2
183	209180	5
183	325139	3
184	617776	1
184	302850	3
184	476299	4
184	319977	2
185	476299	4
185	640479	3
185	776626	2
185	319977	2
186	476299	2
186	494940	4
186	591311	4
186	537539	5
186	690765	4
187	662181	4
187	537539	2
187	565245	4
188	690765	3
188	494940	2
188	676078	2
189	676078	3
189	325139	2
189	680088	5
190	226251	1
190	591311	1
190	752387	2
190	278562	4
190	464331	2
191	640479	2
191	752387	2
191	560017	3
192	464331	1
193	729979	3
193	319977	1
193	765884	1
193	404719	3
193	322677	4
194	712605	1
194	150181	2
195	322677	3
195	383805	3
195	349129	5
195	226251	2
195	617776	3
196	118277	3
196	591311	5
196	464331	3
196	565245	3
196	712605	2
197	551320	5
197	584502	4
197	712605	4
197	343041	2
198	464331	3
198	765884	3
198	322677	3
199	349129	3
199	150181	5
199	776626	4
199	752387	3
199	343041	1
199	226251	5
200	278562	4
200	729979	5
200	657852	1
200	226251	4
201	209180	4
201	584502	4
201	302850	4
201	560017	3
202	591311	2
203	322677	3
203	278562	3
203	464331	5
203	226251	3
203	118277	3
204	749887	5
204	169537	5
205	729979	2
205	494940	4
205	765884	3
205	752387	3
206	214399	2
206	560017	1
207	226251	4
207	296215	1
208	727024	4
208	150161	4
209	765884	4
209	727024	4
209	622500	1
210	676078	3
210	464331	3
210	617776	3
210	150161	5
211	118277	4
212	663789	2
212	657852	3
212	765884	3
213	565245	1
213	602951	4
213	712605	2
213	383805	2
213	749887	3
213	322677	2
214	729979	4
214	662181	5
214	322677	3
214	690765	4
214	169537	3
214	150161	5
215	729979	2
215	602951	3
215	296215	4
215	278562	2
216	591311	4
216	123036	2
216	354619	4
216	169537	3
217	749887	1
217	622500	4
217	404719	4
217	118277	3
217	662181	3
217	690765	3
218	494940	4
218	537539	4
219	584502	4
219	712605	5
219	464331	1
219	349129	2
219	749887	4
219	776626	4
220	727024	4
220	591311	3
221	349129	4
221	278562	3
221	602951	3
221	591311	1
221	712605	3
222	776626	3
222	565245	2
222	727024	2
222	226251	1
223	322677	3
223	325139	2
223	602951	5
223	319977	2
224	383805	1
224	537539	1
224	494940	5
224	565245	3
225	640479	5
225	238569	5
225	383805	1
225	354619	2
226	383805	2
226	209180	2
226	214399	4
227	349129	2
227	551320	4
227	765884	5
227	749887	5
228	226251	2
228	354619	1
228	617776	1
228	551320	4
229	622500	5
229	752387	4
229	354619	4
229	169537	4
230	494940	3
230	169537	4
230	663789	4
230	118277	5
231	776626	5
231	316097	1
231	602951	1
232	343041	5
232	209180	3
232	322677	3
232	727024	2
232	565245	3
233	584502	4
233	676078	1
234	476299	3
234	749887	4
234	657852	5
234	551320	1
234	354619	5
235	729979	1
235	118277	3
235	680088	3
236	383805	3
236	560017	2
236	226251	2
236	214399	4
237	404719	4
237	617776	4
238	537539	5
238	657852	4
238	150181	5
239	663789	2
239	322677	3
239	160692	4
239	123036	2
239	476299	1
240	494940	4
240	776626	3
240	316097	4
240	657852	3
240	209180	2
241	776626	2
241	676078	5
241	343041	2
241	226251	3
241	169537	3
241	537539	4
242	662181	3
242	149183	5
242	278562	2
242	640479	4
242	765884	1
243	319977	5
243	343041	5
244	278562	3
244	729979	5
244	662181	3
244	319977	1
245	296215	4
245	729979	2
245	322677	3
245	565245	3
246	765884	4
246	476299	5
246	640479	5
247	226251	1
247	622500	1
247	209180	4
247	729979	3
248	316097	2
248	752387	2
248	169537	2
248	584502	4
249	640479	4
249	149183	4
249	150181	4
250	238569	4
250	296215	2
250	749887	3
251	214399	4
251	591311	2
251	343041	5
251	296215	1
251	565245	1
252	680088	5
252	343041	2
252	349129	2
252	727024	2
252	322677	1
253	617776	2
253	316097	3
253	118277	4
254	602951	1
254	640479	2
255	169537	2
255	540828	4
255	319977	4
256	657852	2
256	476299	2
257	494940	5
257	278562	1
257	640479	4
258	296215	4
258	729979	1
258	752387	3
258	602951	2
259	238569	4
259	565245	3
260	325139	3
260	150181	3
260	584502	5
260	322677	2
261	169537	3
261	565245	4
262	123036	2
262	150161	4
262	657852	4
262	169537	3
262	729979	2
263	476299	3
263	765884	3
263	602951	1
263	383805	4
264	680088	3
264	622500	1
265	622500	2
265	302850	3
266	663789	3
266	343041	3
266	319977	5
266	540828	5
266	149183	4
266	690765	5
267	214399	2
267	591311	4
267	296215	2
267	551320	2
267	657852	5
268	640479	3
268	296215	4
268	749887	2
269	149183	2
269	476299	4
269	302850	2
269	278562	3
269	551320	4
270	238569	4
271	537539	4
271	690765	2
271	622500	4
271	617776	3
271	727024	1
271	150181	2
272	591311	2
272	316097	4
272	540828	4
273	622500	5
273	226251	2
273	560017	2
273	540828	3
273	657852	3
274	657852	2
274	776626	1
275	663789	5
275	729979	1
275	749887	4
275	118277	3
275	160692	3
275	712605	2
276	354619	1
276	729979	4
276	150181	2
276	476299	2
277	712605	5
277	617776	4
277	591311	3
278	404719	2
278	476299	2
278	464331	4
278	565245	3
278	349129	3
279	476299	1
279	537539	2
279	680088	2
279	349129	3
280	712605	5
280	663789	3
280	676078	3
280	560017	2
281	662181	3
281	404719	1
281	169537	2
281	752387	4
282	118277	5
282	404719	2
282	662181	2
283	354619	1
283	662181	5
283	123036	3
284	209180	4
284	540828	4
285	551320	5
285	149183	2
285	325139	2
286	226251	2
286	149183	3
287	354619	1
287	540828	1
287	149183	1
287	226251	1
287	565245	5
287	537539	3
288	776626	3
288	680088	4
289	226251	4
289	464331	3
289	591311	2
289	640479	1
289	476299	3
289	752387	2
290	296215	4
290	316097	1
290	602951	1
290	622500	5
290	537539	3
290	662181	2
291	663789	1
291	464331	4
291	776626	2
291	325139	3
291	150161	3
292	752387	2
292	226251	4
292	657852	5
292	316097	1
293	319977	1
293	150161	2
293	296215	2
293	690765	2
293	316097	2
294	322677	4
294	316097	3
294	404719	4
295	712605	2
295	150181	2
296	752387	3
296	727024	4
296	657852	5
296	494940	3
297	319977	2
297	752387	3
297	540828	4
298	749887	2
298	325139	2
298	118277	2
298	729979	5
299	729979	4
299	584502	1
300	322677	2
300	560017	4
301	565245	2
301	476299	4
302	729979	3
302	662181	3
302	776626	2
303	383805	5
303	464331	2
304	349129	1
304	657852	1
304	383805	3
304	322677	1
305	354619	2
305	150161	1
305	640479	5
305	752387	3
306	319977	2
306	680088	4
306	302850	2
307	602951	1
307	214399	4
307	209180	2
308	729979	5
308	150181	2
309	657852	2
309	752387	3
309	383805	3
309	617776	3
310	657852	1
311	476299	1
311	464331	5
311	584502	3
311	494940	4
311	322677	2
312	617776	1
312	584502	2
312	657852	2
313	727024	5
313	238569	4
313	565245	2
313	349129	3
313	551320	1
313	676078	2
314	680088	2
314	551320	4
314	296215	4
314	676078	3
314	476299	2
315	676078	4
315	551320	4
315	560017	2
315	584502	3
316	617776	1
316	749887	2
316	226251	1
316	752387	3
316	354619	3
317	749887	3
317	214399	3
318	209180	2
318	662181	4
318	602951	4
318	729979	2
318	690765	4
319	676078	3
319	690765	3
320	617776	2
320	602951	3
320	680088	4
320	343041	2
320	560017	4
321	169537	2
322	316097	3
322	349129	2
322	278562	5
322	226251	1
322	776626	3
322	537539	3
323	765884	4
323	296215	4
323	617776	4
323	540828	5
324	169537	4
325	591311	3
325	752387	1
325	464331	3
325	565245	4
325	349129	4
326	752387	2
326	640479	3
326	676078	2
326	150161	4
326	319977	4
327	657852	3
327	494940	4
328	150181	3
328	537539	1
328	560017	3
328	209180	2
329	663789	5
329	676078	2
330	160692	4
330	278562	3
330	354619	2
331	657852	2
331	565245	2
331	214399	4
331	296215	5
332	354619	3
332	296215	4
333	690765	4
333	238569	4
333	565245	5
333	160692	2
333	343041	2
334	537539	3
334	404719	4
334	663789	1
334	150161	2
335	662181	1
335	551320	2
336	640479	1
336	712605	4
336	476299	3
336	278562	2
337	322677	2
337	349129	3
337	690765	3
337	302850	3
338	169537	5
338	296215	2
338	123036	4
338	584502	3
339	278562	5
339	150161	3
339	169537	4
339	118277	4
340	765884	4
340	663789	3
341	712605	2
341	617776	4
341	214399	2
341	560017	3
341	226251	3
342	591311	4
342	640479	2
342	464331	2
342	150181	1
343	278562	1
343	150181	5
343	349129	3
343	690765	3
344	494940	5
344	238569	1
344	540828	4
344	727024	5
344	640479	4
345	540828	1
345	676078	4
345	476299	4
345	584502	4
345	383805	5
346	150181	4
346	238569	4
346	749887	3
347	765884	5
347	776626	5
347	565245	4
347	727024	4
348	712605	3
348	325139	4
348	690765	3
348	169537	1
349	591311	5
349	319977	2
349	404719	2
349	765884	2
349	226251	4
350	690765	4
350	325139	3
350	729979	5
351	354619	5
352	752387	3
352	560017	5
353	565245	3
353	278562	1
353	584502	5
353	663789	4
353	160692	2
353	464331	2
354	727024	3
354	150181	1
354	343041	2
354	404719	5
354	729979	3
355	640479	4
355	663789	2
356	690765	4
356	591311	1
356	765884	1
356	149183	3
357	676078	4
357	537539	2
358	349129	5
358	464331	4
358	565245	4
359	776626	3
359	540828	1
359	226251	3
359	560017	5
360	584502	4
360	319977	5
360	150161	2
360	160692	3
360	354619	2
361	319977	1
361	404719	2
361	584502	2
362	123036	1
362	584502	4
362	622500	5
363	214399	3
363	349129	5
364	657852	3
364	640479	2
364	622500	4
365	160692	1
365	765884	1
365	690765	1
365	476299	1
366	319977	3
366	209180	3
366	118277	5
366	354619	3
367	322677	2
367	302850	1
367	602951	1
367	690765	4
367	676078	3
368	319977	5
368	296215	5
368	343041	3
369	712605	5
369	676078	4
369	404719	4
369	640479	5
370	617776	5
370	343041	4
370	238569	2
370	226251	3
370	663789	3
371	776626	4
371	343041	1
372	322677	4
372	776626	4
372	149183	3
372	591311	4
372	494940	5
372	343041	5
373	494940	3
373	322677	4
374	551320	4
374	118277	1
374	169537	4
374	617776	3
374	383805	2
375	150181	3
375	319977	2
375	209180	3
375	584502	1
375	676078	1
376	383805	2
377	169537	3
377	537539	1
377	349129	3
378	540828	2
378	296215	4
378	712605	4
378	662181	3
378	565245	2
379	663789	2
379	302850	5
379	617776	5
380	690765	4
380	712605	1
380	322677	5
380	150161	2
381	404719	4
381	150181	2
381	749887	1
382	584502	4
382	494940	2
382	322677	4
383	118277	5
383	464331	4
383	149183	4
383	316097	1
384	464331	2
384	149183	5
384	343041	5
384	494940	3
384	322677	3
385	690765	2
385	325139	1
385	676078	2
385	663789	3
386	238569	3
386	322677	2
386	540828	2
386	727024	2
386	150181	2
387	149183	3
387	560017	2
388	565245	2
388	662181	1
388	551320	4
389	302850	2
389	316097	4
389	238569	2
389	727024	2
389	214399	2
389	662181	5
390	551320	2
390	123036	3
391	296215	4
391	209180	3
391	537539	3
391	752387	4
391	238569	3
391	150161	2
392	680088	4
392	349129	3
392	752387	4
392	354619	5
392	662181	3
392	640479	2
393	209180	2
393	238569	3
393	160692	3
393	680088	1
394	640479	2
395	322677	2
396	749887	3
396	565245	5
396	404719	3
396	150161	2
396	537539	2
396	464331	4
397	343041	3
397	296215	2
398	662181	3
398	150161	2
399	729979	3
399	278562	2
399	464331	4
399	118277	3
399	226251	4
400	123036	3
401	349129	2
402	657852	2
403	776626	2
403	476299	2
403	680088	2
403	540828	2
403	663789	4
404	296215	4
404	662181	5
404	149183	4
404	316097	2
405	238569	1
405	150181	4
405	662181	1
405	123036	1
405	749887	1
405	404719	3
406	551320	5
406	584502	3
406	150161	5
406	729979	2
407	238569	2
407	169537	3
408	560017	5
408	602951	4
409	226251	3
409	676078	4
410	560017	3
410	476299	4
410	640479	2
411	149183	2
411	591311	3
411	302850	2
412	404719	2
412	302850	1
413	591311	1
413	464331	4
414	663789	4
414	776626	3
414	316097	4
414	278562	3
415	591311	2
415	343041	4
415	464331	3
415	640479	3
415	316097	5
416	640479	1
416	160692	3
417	560017	5
417	322677	3
418	657852	3
418	325139	1
418	776626	2
418	150181	4
418	149183	3
419	727024	2
419	149183	2
419	123036	3
419	343041	3
419	676078	4
419	325139	2
420	209180	3
420	118277	2
420	712605	4
420	169537	1
421	226251	2
421	676078	4
421	476299	5
422	494940	3
422	640479	4
422	354619	4
423	343041	4
424	325139	1
424	663789	2
424	494940	2
424	657852	4
424	584502	4
425	765884	2
425	729979	4
425	160692	1
426	169537	2
426	343041	5
427	729979	4
427	209180	2
427	749887	4
427	727024	1
427	560017	4
427	537539	2
428	591311	4
428	160692	1
428	727024	1
428	302850	5
428	540828	2
429	494940	2
429	296215	2
429	560017	4
429	118277	2
429	537539	2
429	160692	1
430	238569	2
430	322677	4
431	617776	5
431	354619	2
431	749887	1
431	118277	5
432	404719	5
432	749887	2
432	690765	2
432	727024	4
432	354619	2
433	729979	1
433	551320	2
433	316097	4
434	537539	5
434	325139	3
434	663789	2
434	765884	2
434	640479	5
435	316097	1
435	560017	1
435	214399	1
436	476299	2
436	591311	4
436	343041	4
436	354619	4
436	712605	5
437	551320	2
438	749887	1
438	657852	2
438	663789	2
438	729979	5
439	118277	3
440	464331	2
440	404719	3
441	765884	5
441	640479	3
441	551320	1
441	296215	4
442	325139	1
442	226251	3
442	322677	2
442	349129	2
442	319977	4
442	537539	1
443	622500	4
443	383805	2
443	602951	4
443	617776	2
444	727024	4
444	160692	3
445	383805	2
445	278562	4
445	690765	5
445	560017	5
445	584502	3
446	494940	2
446	537539	2
446	565245	1
447	226251	2
447	540828	2
447	319977	3
448	169537	2
448	404719	3
448	464331	3
448	591311	1
448	622500	4
449	149183	2
449	209180	3
449	322677	2
449	617776	5
450	729979	4
451	749887	5
451	752387	2
451	551320	2
452	404719	4
452	296215	3
453	238569	2
453	494940	2
453	540828	3
453	560017	4
454	322677	3
454	316097	2
454	690765	4
454	727024	3
455	776626	3
455	676078	3
455	319977	3
455	591311	2
456	214399	4
456	640479	2
457	765884	1
457	325139	3
458	560017	3
458	565245	4
458	727024	2
458	118277	3
458	325139	3
458	302850	1
459	209180	3
459	565245	4
459	560017	4
459	476299	4
460	209180	3
461	319977	2
461	591311	3
462	349129	2
462	476299	3
462	663789	3
463	776626	2
463	322677	1
463	278562	5
463	752387	4
463	765884	4
464	584502	3
464	278562	4
464	540828	2
464	149183	3
464	118277	3
465	209180	2
465	584502	4
465	354619	3
465	727024	1
466	657852	3
466	319977	4
466	238569	3
466	663789	4
466	150161	2
466	349129	3
467	617776	2
467	560017	3
467	640479	2
468	383805	4
469	727024	4
469	749887	4
469	343041	4
469	150161	3
470	657852	3
470	169537	5
470	118277	4
471	214399	4
471	160692	2
471	383805	2
472	238569	4
472	316097	5
472	322677	4
472	404719	4
473	476299	2
473	319977	4
473	712605	4
473	494940	1
473	123036	4
474	343041	4
474	727024	4
474	316097	3
475	712605	1
475	354619	3
475	226251	4
475	752387	1
475	325139	4
475	617776	4
476	537539	3
476	226251	4
477	622500	1
477	214399	3
477	537539	2
478	663789	4
478	680088	4
479	540828	3
479	325139	2
479	476299	3
479	383805	4
479	591311	1
480	238569	2
480	776626	3
480	322677	5
480	565245	2
481	622500	5
481	226251	3
481	752387	2
481	565245	3
482	622500	5
482	214399	2
482	464331	5
482	169537	1
483	343041	1
483	118277	1
483	602951	4
483	676078	4
483	214399	4
483	354619	2
484	560017	3
484	123036	5
485	540828	2
485	749887	3
486	776626	3
486	765884	1
487	657852	3
487	226251	4
487	602951	5
487	160692	1
488	752387	1
488	551320	3
488	319977	2
489	354619	2
489	160692	3
490	169537	3
490	123036	2
491	322677	4
491	302850	3
491	565245	3
491	160692	2
491	680088	1
491	123036	4
492	278562	4
492	476299	4
492	226251	3
492	149183	2
492	657852	1
492	494940	4
493	476299	3
493	278562	4
493	238569	5
493	551320	2
494	727024	2
494	565245	4
494	657852	4
495	319977	2
495	316097	3
496	296215	5
496	169537	2
496	322677	2
496	325139	3
496	657852	4
496	537539	4
497	537539	1
497	322677	1
497	676078	5
497	560017	1
497	622500	2
497	729979	1
498	322677	2
498	663789	4
498	551320	2
498	657852	3
498	343041	4
498	150161	3
499	404719	4
499	316097	3
499	296215	4
500	560017	3
500	316097	3
500	349129	1
500	383805	2
500	494940	5
501	238569	2
501	663789	5
501	383805	4
501	226251	4
502	149183	4
503	150181	4
503	149183	3
504	149183	1
504	322677	4
504	662181	1
504	319977	3
504	464331	5
505	765884	3
505	209180	3
505	238569	4
505	322677	5
505	383805	3
505	584502	3
506	591311	3
506	209180	2
506	150181	3
506	752387	4
507	676078	4
508	537539	2
508	749887	2
508	302850	2
508	765884	4
509	749887	2
509	319977	2
509	765884	1
509	584502	2
510	476299	3
510	354619	3
511	150161	4
511	537539	4
511	150181	3
511	214399	3
512	727024	5
512	690765	4
512	662181	4
512	150161	4
512	540828	2
513	591311	2
513	404719	4
513	278562	2
514	765884	4
514	662181	1
514	316097	4
515	464331	4
515	540828	3
515	622500	5
515	214399	4
515	662181	5
516	118277	2
516	343041	3
516	680088	2
517	712605	4
517	540828	1
517	640479	3
517	565245	5
518	680088	4
519	662181	4
520	383805	3
520	640479	5
520	676078	2
520	464331	5
520	302850	3
521	123036	1
522	560017	1
522	325139	4
523	343041	4
523	617776	2
523	540828	1
524	343041	1
524	617776	3
524	349129	1
524	169537	4
524	712605	4
525	226251	4
525	150181	2
525	749887	2
526	657852	2
526	551320	3
526	690765	2
526	776626	3
526	118277	1
526	712605	1
527	302850	2
527	296215	1
527	494940	4
527	278562	2
528	584502	3
528	765884	4
529	622500	1
529	752387	3
529	150161	4
529	343041	5
529	464331	5
530	765884	1
530	150181	3
530	354619	4
530	565245	4
531	214399	4
531	584502	3
532	752387	2
532	680088	4
532	551320	4
533	118277	1
533	591311	3
534	226251	3
534	680088	5
534	349129	4
534	325139	2
534	560017	3
535	727024	2
535	537539	2
535	343041	1
535	325139	1
535	149183	4
535	622500	3
536	150161	2
536	354619	3
537	302850	3
537	149183	2
537	169537	2
537	296215	1
537	776626	5
538	325139	3
538	343041	3
538	727024	1
538	322677	1
538	680088	5
539	464331	5
539	560017	4
539	680088	2
539	676078	4
539	584502	4
539	476299	1
540	354619	5
540	712605	4
541	537539	2
541	640479	3
541	712605	2
541	676078	2
541	476299	2
541	160692	5
542	494940	1
542	123036	2
542	354619	3
542	663789	4
542	676078	4
542	160692	4
543	663789	3
543	622500	2
544	343041	4
544	663789	2
544	209180	5
544	214399	5
545	214399	4
545	354619	3
546	540828	3
546	476299	2
547	727024	4
547	214399	3
548	476299	5
548	149183	2
548	343041	3
548	319977	3
548	354619	1
549	464331	2
549	322677	2
549	657852	3
550	169537	4
550	676078	4
551	727024	1
552	662181	2
553	776626	1
553	118277	2
553	316097	3
553	160692	5
554	404719	1
554	551320	4
555	325139	2
555	537539	2
555	584502	4
555	296215	4
556	622500	5
556	296215	1
556	551320	2
556	749887	3
556	118277	2
557	690765	1
557	680088	2
557	150181	3
557	349129	4
557	150161	3
558	591311	5
558	150161	4
559	640479	3
559	316097	3
559	602951	2
559	319977	4
559	765884	2
560	123036	3
560	354619	4
560	540828	4
560	690765	1
561	476299	3
561	296215	2
561	657852	3
561	622500	3
562	617776	3
562	296215	2
562	680088	3
563	680088	5
563	676078	5
563	322677	5
564	238569	4
564	319977	2
564	749887	2
564	150161	3
565	476299	2
565	551320	3
565	354619	1
565	149183	2
565	118277	3
565	238569	3
566	727024	5
566	209180	2
566	149183	3
566	540828	2
566	214399	5
567	209180	4
567	296215	4
568	676078	3
568	319977	4
568	622500	3
569	749887	2
569	680088	2
569	765884	4
570	214399	3
570	226251	4
570	565245	3
570	537539	4
570	316097	3
571	560017	2
571	676078	2
572	640479	5
572	354619	5
573	354619	2
573	404719	1
573	662181	5
573	226251	3
573	464331	1
574	476299	4
574	322677	3
574	118277	4
574	676078	4
574	565245	4
575	354619	4
575	118277	5
575	325139	3
575	322677	5
576	712605	3
576	776626	3
576	729979	3
576	319977	3
577	316097	2
577	118277	3
577	123036	4
578	319977	3
578	622500	2
578	296215	4
579	123036	2
579	322677	3
579	169537	3
579	565245	2
579	149183	2
580	464331	3
580	169537	4
580	752387	4
581	226251	4
581	727024	1
581	663789	1
581	404719	1
582	325139	2
582	662181	3
582	476299	2
582	727024	2
583	296215	4
583	657852	4
583	662181	2
584	690765	5
584	551320	3
584	226251	1
584	343041	3
584	662181	4
585	551320	4
585	602951	2
585	325139	3
585	123036	2
585	494940	5
586	690765	4
586	383805	3
587	278562	2
587	238569	2
588	278562	1
588	565245	2
589	383805	5
589	584502	3
589	657852	4
589	565245	2
590	325139	2
590	663789	2
590	617776	3
590	662181	5
591	118277	1
591	383805	3
592	325139	4
592	343041	5
592	584502	3
592	617776	4
593	640479	4
593	322677	4
593	404719	1
593	343041	5
594	560017	5
594	476299	3
594	322677	3
595	662181	2
595	354619	3
595	238569	3
595	752387	4
596	238569	4
596	150181	3
597	214399	1
597	537539	1
597	278562	2
597	322677	2
598	584502	4
598	383805	2
598	680088	4
598	278562	1
598	551320	2
599	354619	3
599	640479	4
599	622500	2
599	617776	3
599	322677	2
599	663789	1
600	537539	5
600	226251	2
600	383805	5
600	617776	2
601	662181	2
601	383805	2
601	494940	1
602	622500	4
602	584502	3
602	640479	1
603	657852	2
603	354619	4
603	123036	1
603	319977	1
603	118277	2
604	150181	3
604	325139	1
604	160692	2
604	690765	1
604	657852	5
604	319977	3
605	118277	4
605	640479	4
605	690765	2
605	464331	3
606	657852	5
606	765884	5
607	560017	5
607	662181	4
607	322677	3
607	712605	4
608	690765	2
608	214399	3
609	617776	5
609	776626	2
609	551320	4
610	540828	4
610	316097	2
611	537539	5
611	302850	4
611	690765	3
612	383805	5
612	404719	3
612	663789	2
612	591311	3
613	319977	4
613	118277	5
613	226251	2
613	149183	3
614	617776	4
614	729979	4
614	662181	4
614	752387	4
614	296215	4
615	296215	2
615	680088	3
615	712605	3
616	226251	4
617	676078	4
617	494940	2
618	476299	5
618	565245	1
618	540828	2
618	752387	5
618	149183	5
619	617776	1
619	712605	2
620	591311	5
621	169537	5
621	354619	2
622	343041	2
622	296215	3
622	319977	4
622	680088	5
623	464331	2
623	118277	4
624	383805	2
624	319977	2
624	296215	3
625	322677	1
625	663789	3
625	680088	3
625	404719	1
625	690765	4
626	209180	4
626	680088	3
626	123036	1
626	150161	2
627	296215	2
627	214399	2
627	325139	4
627	160692	4
627	404719	5
628	537539	4
628	657852	1
628	712605	1
629	494940	2
629	657852	5
629	160692	2
629	560017	1
629	680088	4
629	123036	2
630	776626	3
630	322677	4
630	149183	1
630	150161	2
630	150181	2
631	749887	4
632	749887	2
632	765884	3
632	712605	3
633	551320	3
633	752387	5
634	584502	5
634	622500	3
634	238569	2
635	214399	5
635	662181	2
635	302850	3
635	729979	4
635	537539	4
636	729979	2
636	537539	2
636	278562	3
636	494940	4
636	316097	4
637	584502	2
637	383805	1
638	657852	3
639	662181	2
639	551320	2
639	354619	2
639	383805	2
639	622500	2
640	729979	2
641	537539	1
641	565245	3
641	591311	3
642	404719	3
642	123036	3
642	565245	1
642	150181	3
642	302850	4
642	325139	5
643	296215	2
644	676078	2
644	322677	4
644	302850	4
644	349129	5
644	316097	3
644	680088	4
645	752387	1
645	464331	3
645	149183	4
646	123036	1
646	316097	1
647	657852	1
647	476299	2
648	776626	3
648	565245	4
649	752387	5
649	343041	3
649	319977	2
650	169537	5
650	209180	3
650	325139	5
651	765884	3
651	676078	4
652	349129	4
652	343041	4
652	150181	1
652	238569	3
653	540828	4
653	712605	2
653	494940	3
653	278562	4
654	302850	3
654	316097	3
654	118277	1
654	150161	1
654	325139	1
655	296215	4
655	662181	4
655	712605	2
655	727024	2
655	160692	2
656	776626	5
656	622500	2
656	749887	3
657	537539	2
657	712605	1
658	540828	4
659	319977	2
659	690765	1
660	551320	4
660	383805	4
660	765884	2
660	680088	2
661	622500	2
661	663789	4
661	150161	4
661	169537	4
661	560017	1
662	322677	3
662	296215	4
662	565245	2
663	690765	3
663	319977	3
663	476299	4
663	680088	1
663	622500	5
664	476299	3
664	662181	3
664	209180	3
664	319977	4
665	349129	4
666	464331	3
666	150161	4
666	662181	4
666	296215	2
666	551320	5
666	316097	1
667	160692	4
667	476299	5
667	319977	4
667	663789	5
667	749887	2
668	752387	2
668	123036	2
668	404719	4
668	302850	1
668	349129	2
668	712605	1
669	537539	3
669	118277	2
670	749887	5
670	560017	5
670	537539	3
671	752387	2
671	464331	4
671	476299	2
671	150181	2
671	118277	2
672	319977	1
672	617776	5
672	565245	3
672	752387	5
673	354619	5
673	617776	3
673	680088	1
674	765884	3
674	690765	3
674	150181	2
674	551320	3
674	494940	3
675	383805	2
675	765884	3
676	537539	5
676	238569	4
676	169537	4
676	349129	2
677	404719	1
678	238569	1
678	349129	3
679	464331	5
679	214399	1
679	325139	4
679	404719	3
679	690765	5
679	640479	1
680	617776	2
680	302850	5
680	150181	3
680	238569	3
680	749887	4
681	494940	3
681	296215	4
681	278562	3
681	540828	5
681	657852	4
682	226251	2
682	169537	2
682	404719	4
682	494940	4
683	322677	3
683	560017	3
683	712605	3
683	238569	4
684	584502	4
684	540828	5
684	551320	1
685	296215	2
685	680088	4
686	560017	3
686	676078	3
686	278562	4
686	316097	4
686	160692	5
686	123036	3
687	160692	5
688	690765	2
688	278562	3
688	676078	2
688	729979	1
689	209180	2
689	591311	2
689	584502	1
689	150181	4
689	680088	3
689	149183	5
690	349129	2
691	322677	3
691	123036	4
691	560017	2
691	476299	4
691	712605	1
692	476299	4
692	316097	3
692	663789	1
692	752387	2
692	680088	3
693	591311	4
693	617776	3
693	123036	2
693	712605	5
694	494940	1
694	584502	2
695	752387	1
695	476299	2
695	238569	3
695	680088	5
696	494940	2
696	343041	3
697	617776	3
697	383805	3
697	238569	4
698	150161	3
699	150181	2
699	150161	2
699	712605	4
700	752387	2
701	343041	5
701	322677	1
701	169537	2
701	226251	3
701	118277	4
702	752387	3
702	584502	4
702	776626	3
702	662181	4
703	551320	2
703	622500	2
703	776626	5
703	676078	4
704	680088	5
704	150181	1
704	749887	4
704	537539	4
704	584502	3
705	404719	5
705	343041	3
705	617776	2
705	278562	5
705	676078	1
706	776626	4
706	343041	2
707	551320	3
707	680088	3
707	494940	2
707	354619	2
707	123036	5
708	591311	4
708	676078	4
709	404719	3
709	383805	5
709	118277	1
709	680088	4
709	349129	4
710	617776	4
711	494940	2
711	169537	4
712	319977	4
712	464331	1
712	540828	2
712	343041	5
713	238569	1
713	464331	4
713	349129	1
713	278562	4
714	776626	3
714	752387	4
714	150181	2
714	160692	1
714	622500	1
714	383805	3
715	584502	2
715	617776	4
715	551320	2
715	149183	2
715	540828	4
716	150181	3
716	278562	5
716	354619	3
716	123036	4
717	622500	1
717	776626	1
717	316097	3
718	640479	2
719	729979	4
719	752387	5
720	322677	3
720	150181	3
720	118277	1
720	302850	2
721	690765	3
721	464331	2
721	150181	3
722	238569	2
722	209180	4
723	729979	3
723	657852	3
723	727024	2
724	752387	5
724	640479	2
724	551320	3
725	150161	5
725	476299	1
725	551320	4
726	712605	3
726	537539	4
726	343041	4
727	662181	5
727	464331	1
727	680088	3
727	150161	1
727	537539	2
728	278562	2
728	302850	1
728	494940	2
728	150161	1
729	584502	5
729	640479	4
729	617776	4
729	663789	3
730	123036	4
730	322677	2
730	765884	1
730	752387	3
730	226251	5
731	319977	1
731	150181	1
731	209180	4
731	640479	4
731	680088	2
731	316097	3
732	776626	3
732	565245	1
732	316097	3
732	349129	5
733	540828	4
733	727024	2
733	662181	3
734	729979	3
734	319977	4
735	680088	1
735	214399	1
736	226251	1
736	565245	3
736	296215	4
737	123036	3
737	676078	3
737	602951	2
737	565245	3
738	765884	3
738	602951	5
738	540828	2
738	349129	2
739	494940	4
739	712605	2
740	680088	2
740	150161	5
741	319977	1
741	123036	5
742	476299	1
742	319977	3
742	118277	2
742	749887	4
743	776626	4
743	640479	1
743	169537	1
743	319977	4
743	343041	3
744	712605	1
744	343041	2
744	584502	3
744	464331	1
745	160692	4
745	663789	3
745	602951	2
745	752387	1
745	296215	3
745	343041	3
746	476299	2
747	226251	2
747	663789	3
747	729979	5
747	150161	2
747	296215	4
747	727024	4
748	622500	4
748	169537	3
749	476299	4
749	214399	1
749	383805	4
749	680088	3
750	160692	4
750	690765	4
750	404719	2
750	560017	3
750	494940	3
750	537539	5
751	226251	3
751	464331	4
751	404719	5
751	584502	2
751	383805	5
752	657852	4
752	322677	1
752	729979	2
752	325139	1
752	238569	3
753	676078	2
753	354619	5
753	226251	4
753	727024	4
754	565245	2
754	150181	1
754	749887	4
754	118277	2
754	662181	3
754	584502	3
755	296215	1
755	316097	5
756	676078	4
756	118277	2
757	343041	2
757	316097	1
757	354619	2
758	464331	2
758	551320	3
759	662181	4
759	226251	5
759	617776	5
759	319977	5
759	680088	1
759	602951	4
760	494940	5
760	226251	5
760	602951	5
760	729979	1
760	383805	4
761	565245	3
761	149183	2
761	560017	3
761	296215	2
761	712605	1
761	622500	1
762	494940	4
763	676078	2
763	383805	3
763	494940	4
763	278562	3
764	296215	4
765	551320	1
765	316097	2
765	354619	2
765	749887	1
766	765884	1
766	727024	5
766	749887	5
766	169537	2
766	537539	5
767	622500	4
767	494940	3
768	123036	3
768	540828	2
769	663789	1
769	662181	4
770	278562	3
770	476299	4
770	494940	4
770	118277	3
770	591311	2
771	214399	1
771	150161	4
771	640479	2
771	238569	2
772	640479	5
772	278562	4
772	565245	2
772	729979	3
772	622500	3
773	349129	4
773	169537	2
773	591311	2
774	680088	5
775	278562	5
775	464331	4
775	560017	4
775	602951	4
776	354619	1
776	591311	2
777	160692	3
777	278562	2
777	343041	3
777	123036	1
777	209180	4
778	676078	4
778	729979	5
778	404719	2
779	749887	3
779	602951	4
780	749887	4
780	690765	3
781	680088	3
781	123036	3
781	150161	5
781	278562	2
781	776626	5
782	676078	3
782	150161	4
782	776626	5
782	123036	3
783	657852	2
783	476299	4
783	640479	4
783	349129	1
784	226251	2
784	551320	4
785	123036	4
785	118277	2
785	476299	3
786	302850	2
786	680088	2
786	676078	3
786	322677	2
787	617776	2
787	149183	2
787	663789	2
787	712605	3
788	591311	3
789	690765	4
789	712605	5
789	226251	2
789	680088	2
789	662181	5
790	383805	5
790	540828	5
790	602951	2
790	118277	4
790	752387	5
791	296215	5
791	123036	3
791	663789	1
791	160692	2
791	349129	3
792	537539	4
792	494940	1
792	296215	3
792	551320	3
792	209180	4
793	150161	2
793	551320	2
794	676078	2
794	749887	1
794	584502	3
794	622500	2
795	354619	5
795	560017	4
795	537539	3
795	749887	2
796	712605	4
796	622500	3
796	149183	4
796	123036	2
796	657852	2
796	238569	2
797	749887	2
797	278562	2
797	584502	3
797	118277	1
798	325139	4
798	278562	4
798	749887	2
799	325139	3
799	540828	5
800	325139	4
800	680088	1
800	238569	1
800	349129	1
800	322677	3
801	540828	3
801	676078	2
801	118277	2
802	150161	2
802	160692	2
802	752387	5
802	560017	4
803	622500	2
803	278562	5
803	354619	4
803	680088	3
803	712605	4
804	729979	5
805	584502	4
805	640479	3
805	226251	5
805	150181	2
806	602951	2
806	118277	3
807	476299	5
807	622500	4
808	322677	2
808	476299	4
808	676078	2
808	118277	4
808	749887	2
809	680088	2
809	565245	3
809	729979	4
809	476299	2
810	560017	4
810	209180	5
810	322677	3
810	537539	4
810	343041	3
811	680088	4
812	404719	3
812	226251	5
812	657852	5
812	354619	3
812	296215	2
813	404719	2
813	602951	4
813	226251	2
813	776626	2
813	729979	4
813	296215	4
814	325139	1
814	169537	4
814	617776	4
814	551320	4
814	123036	3
815	690765	4
815	617776	2
816	169537	5
816	209180	2
816	354619	4
816	214399	4
816	150161	3
817	657852	2
817	349129	2
817	776626	2
817	494940	4
817	537539	5
817	278562	2
818	464331	2
818	712605	5
818	302850	4
818	765884	2
818	551320	2
818	169537	4
819	560017	2
820	765884	1
821	749887	3
821	663789	1
821	209180	2
821	680088	5
821	354619	4
822	591311	3
822	404719	4
822	662181	4
822	676078	1
822	209180	4
822	537539	4
823	238569	3
824	657852	3
825	727024	2
826	160692	5
826	476299	3
827	118277	2
827	209180	5
827	565245	2
827	464331	3
828	676078	3
828	349129	2
828	214399	3
828	150161	2
829	464331	3
829	118277	4
830	464331	2
830	617776	4
830	404719	5
830	752387	4
830	278562	3
830	765884	5
831	404719	5
831	150181	4
832	727024	4
832	354619	4
833	354619	5
833	712605	3
833	238569	5
833	640479	5
833	663789	2
834	565245	4
834	149183	5
834	302850	3
835	776626	1
835	118277	2
835	617776	4
835	663789	1
836	209180	5
836	551320	5
836	565245	3
836	622500	3
836	476299	2
837	712605	2
837	464331	2
838	727024	1
838	551320	2
838	149183	4
838	540828	3
839	591311	1
839	316097	3
839	622500	5
840	296215	5
840	238569	5
840	662181	2
840	149183	5
841	591311	3
841	319977	3
842	765884	3
842	640479	2
842	322677	4
843	540828	1
843	354619	3
843	325139	2
843	712605	4
843	169537	2
844	494940	2
844	123036	3
844	296215	3
844	727024	1
845	209180	2
845	319977	1
845	118277	2
845	322677	4
846	316097	4
846	680088	3
847	584502	5
847	591311	5
847	278562	2
847	322677	3
847	118277	4
848	238569	2
848	752387	4
848	123036	2
849	238569	2
849	565245	3
850	118277	2
850	662181	2
851	123036	2
851	749887	4
851	776626	3
851	712605	2
852	676078	3
852	169537	5
852	322677	5
852	727024	2
852	316097	1
853	383805	4
853	749887	3
853	537539	4
854	150161	3
854	149183	3
854	537539	2
855	150181	2
855	565245	2
855	296215	3
855	591311	4
855	727024	5
856	464331	2
856	729979	4
856	752387	4
856	540828	2
856	214399	5
856	776626	4
857	727024	5
857	160692	4
857	149183	1
858	322677	5
859	591311	3
859	322677	2
860	296215	1
860	584502	5
860	776626	4
860	214399	4
861	540828	2
861	226251	3
861	640479	2
862	150161	3
862	565245	3
862	729979	3
862	617776	3
862	169537	2
863	150161	3
863	765884	2
864	776626	2
864	680088	5
864	118277	4
864	464331	4
865	343041	3
865	765884	1
865	617776	2
865	690765	5
866	160692	5
866	343041	5
866	749887	3
866	149183	2
866	657852	3
867	622500	5
867	749887	1
868	494940	3
868	169537	3
869	657852	4
869	319977	3
869	118277	2
870	118277	1
870	354619	4
870	749887	5
871	238569	1
871	354619	5
872	640479	3
872	354619	1
872	150161	4
872	150181	3
873	565245	5
873	476299	4
874	349129	3
874	494940	5
874	622500	2
874	776626	5
875	214399	5
875	118277	4
876	354619	3
876	662181	2
876	776626	1
877	316097	5
877	494940	3
877	214399	1
878	662181	2
878	584502	2
879	752387	3
879	551320	3
879	749887	2
879	238569	4
880	657852	3
881	584502	4
881	729979	4
882	765884	3
882	238569	4
882	565245	4
882	209180	3
882	690765	3
883	118277	5
883	551320	4
884	752387	3
884	494940	3
885	602951	4
885	680088	1
885	584502	1
885	640479	5
885	160692	2
886	319977	4
887	551320	3
887	537539	2
887	209180	5
888	540828	2
889	690765	2
889	712605	4
889	729979	3
889	316097	5
890	150161	2
890	325139	3
890	540828	2
891	617776	4
891	476299	4
892	149183	1
892	565245	3
893	729979	3
893	150181	4
893	537539	2
893	657852	3
894	150181	1
894	657852	3
894	464331	3
895	464331	3
896	657852	5
896	278562	3
896	169537	3
896	118277	2
896	150161	3
897	676078	3
897	123036	2
897	617776	2
897	150181	5
898	296215	4
898	729979	2
898	560017	1
898	214399	5
899	622500	4
899	169537	3
899	551320	4
899	765884	3
899	343041	2
899	540828	5
900	118277	5
900	690765	1
900	476299	2
900	537539	4
900	149183	1
900	226251	3
901	149183	2
901	560017	2
901	464331	4
901	676078	2
901	551320	4
902	322677	3
902	640479	4
902	494940	5
902	325139	5
903	749887	5
903	765884	4
903	149183	2
903	464331	3
903	560017	4
904	749887	3
904	150181	1
905	118277	3
905	776626	5
905	640479	3
905	752387	4
905	622500	5
906	349129	5
906	729979	4
906	551320	4
907	319977	2
908	729979	2
908	354619	1
908	209180	2
908	540828	5
908	680088	1
909	494940	3
909	663789	3
909	118277	4
910	560017	2
910	316097	4
910	160692	2
911	752387	4
911	622500	5
911	325139	2
911	118277	4
911	123036	5
912	657852	5
912	752387	4
913	657852	2
913	296215	2
914	657852	5
914	278562	2
914	209180	3
914	727024	3
914	160692	3
914	464331	5
915	169537	2
915	322677	3
915	662181	4
915	160692	2
915	349129	4
916	325139	3
916	712605	4
916	540828	2
916	622500	2
916	343041	1
917	149183	3
917	494940	4
917	316097	5
917	322677	2
917	296215	5
918	690765	1
918	663789	2
918	214399	1
918	540828	3
918	765884	3
919	383805	3
919	322677	4
919	537539	2
919	118277	2
919	765884	3
920	214399	3
920	602951	2
920	690765	2
920	383805	2
920	404719	2
920	354619	2
921	727024	4
921	494940	2
921	749887	1
921	169537	2
921	302850	3
921	322677	3
922	226251	4
922	662181	4
922	776626	1
923	729979	2
923	749887	5
923	343041	3
924	617776	3
924	322677	2
924	749887	3
924	591311	5
925	209180	3
925	663789	2
925	238569	4
925	537539	4
925	676078	1
926	476299	1
926	316097	1
926	584502	4
926	540828	5
927	322677	4
928	602951	3
928	662181	1
929	214399	2
929	343041	3
929	118277	5
929	640479	4
930	776626	5
930	349129	1
930	316097	3
930	617776	2
930	150181	4
931	640479	3
931	319977	2
932	584502	3
932	622500	5
933	150161	5
933	209180	5
934	464331	2
934	776626	2
934	278562	3
934	160692	1
935	209180	4
936	278562	2
936	354619	3
936	663789	4
936	150181	1
936	560017	2
937	494940	4
938	383805	2
938	690765	2
938	343041	2
939	749887	2
939	560017	2
939	296215	3
939	537539	2
939	160692	4
939	343041	4
940	617776	2
940	238569	4
940	160692	1
940	322677	3
941	226251	3
941	118277	4
941	663789	4
941	349129	3
942	662181	3
942	316097	1
943	383805	3
943	209180	5
943	226251	4
943	319977	1
943	663789	3
944	150161	2
944	160692	4
944	690765	2
945	663789	5
946	752387	5
946	319977	3
946	123036	4
946	209180	2
946	278562	4
946	476299	1
947	729979	3
947	319977	4
947	765884	1
947	349129	5
948	494940	1
948	727024	5
948	676078	3
948	322677	3
948	640479	5
948	226251	2
949	464331	4
949	343041	3
949	690765	1
949	752387	4
949	325139	3
949	765884	2
950	209180	2
950	322677	1
950	551320	5
950	296215	4
951	464331	4
951	565245	5
951	316097	5
951	749887	1
951	662181	3
952	690765	2
952	752387	3
952	540828	4
952	676078	3
952	464331	5
953	404719	4
953	214399	2
954	123036	1
954	662181	5
954	494940	2
954	238569	3
955	160692	4
955	325139	3
955	680088	2
955	404719	2
956	209180	1
956	765884	1
956	316097	4
956	617776	3
956	322677	4
956	540828	3
957	322677	4
957	169537	5
957	354619	4
957	160692	2
958	383805	2
959	676078	1
959	319977	4
959	118277	5
959	150181	2
959	325139	3
960	278562	3
960	690765	4
960	680088	5
960	662181	1
961	537539	3
961	349129	5
961	565245	3
961	214399	4
961	464331	1
962	591311	2
962	296215	3
962	712605	5
962	640479	4
962	354619	4
963	123036	3
964	118277	2
964	622500	4
964	349129	1
965	149183	2
965	319977	3
965	591311	1
965	663789	5
966	214399	3
966	476299	2
966	551320	4
966	150161	4
966	354619	4
967	316097	4
967	591311	5
967	214399	5
967	349129	2
967	712605	3
967	118277	4
968	214399	3
968	278562	3
968	540828	4
968	226251	4
968	319977	1
968	640479	3
969	349129	1
970	657852	2
970	537539	1
971	663789	4
971	727024	4
971	540828	3
972	657852	3
972	349129	5
972	404719	4
972	238569	4
973	584502	2
974	383805	1
974	727024	1
975	238569	4
975	316097	2
976	118277	4
977	765884	2
977	690765	3
977	319977	2
977	565245	2
977	540828	1
978	319977	4
978	676078	4
978	765884	5
978	680088	4
978	464331	1
979	560017	2
979	319977	2
980	464331	1
980	657852	2
980	749887	4
981	118277	4
981	476299	5
981	354619	5
982	663789	2
982	565245	1
982	640479	2
982	209180	2
982	749887	4
983	663789	5
983	354619	5
984	354619	5
984	149183	4
984	622500	4
984	209180	5
985	383805	1
985	727024	2
985	349129	3
985	209180	4
985	584502	2
986	302850	2
986	712605	2
987	325139	3
987	354619	2
988	584502	3
988	640479	5
988	752387	5
988	537539	2
988	169537	2
988	617776	3
989	316097	5
989	160692	5
989	617776	2
990	349129	4
990	565245	5
990	729979	2
990	749887	2
991	752387	3
991	765884	1
991	680088	5
992	565245	4
992	640479	4
993	537539	5
993	729979	5
993	316097	1
993	584502	2
994	560017	2
995	349129	5
995	150181	4
995	214399	3
996	584502	3
996	404719	3
996	319977	4
997	765884	3
998	150161	5
998	209180	1
998	729979	5
999	749887	3
999	776626	3
1000	404719	1
1000	238569	1
1000	752387	4
1000	226251	4
1000	749887	1
1000	617776	3
1001	765884	3
1001	752387	2
1001	209180	3
1002	209180	2
1002	727024	5
1002	118277	4
1002	584502	3
1003	617776	4
1003	150161	3
1003	729979	3
1004	226251	3
1004	322677	1
1004	752387	2
1004	118277	3
1004	150181	5
1004	160692	3
1005	150161	2
1005	617776	4
1005	404719	5
1005	676078	3
1006	765884	4
1007	214399	3
1007	537539	3
1007	209180	2
1007	123036	4
1007	752387	5
1008	690765	1
1008	226251	2
1008	238569	4
1008	150161	5
1008	749887	3
1008	617776	1
1009	322677	1
1009	584502	4
1009	776626	3
1009	622500	4
1009	149183	2
1009	296215	4
1010	752387	2
1010	676078	1
1010	540828	4
1011	118277	3
1012	209180	2
1012	752387	1
1013	214399	5
1013	617776	4
1014	325139	3
1014	540828	5
1014	214399	4
1015	729979	2
1015	591311	2
1015	476299	3
1015	149183	2
1016	622500	5
1016	591311	4
1016	560017	5
1017	729979	2
1018	343041	2
1018	749887	4
1019	662181	2
1019	160692	2
1019	765884	5
1019	149183	5
1019	776626	1
1020	214399	4
1020	727024	1
1020	118277	3
1021	464331	4
1021	640479	3
1021	551320	3
1021	657852	1
1022	657852	3
1023	476299	3
1023	712605	3
1023	676078	5
1023	591311	3
1024	383805	3
1024	729979	3
1024	349129	2
1025	349129	4
1025	404719	2
1025	325139	3
1025	551320	3
1026	663789	4
1026	622500	4
1026	776626	2
1027	565245	5
1027	349129	5
1027	238569	5
1027	560017	3
1027	209180	4
1028	278562	3
1028	476299	2
1028	160692	4
1029	537539	3
1029	551320	5
1029	584502	5
1029	729979	3
1029	657852	2
1029	565245	3
1030	765884	2
1030	560017	5
1031	494940	4
1031	602951	1
1032	494940	3
1032	150181	3
1032	319977	3
1032	476299	3
1033	494940	4
1033	214399	2
1033	316097	4
1034	622500	5
1035	319977	3
1035	565245	3
1036	118277	2
1036	354619	3
1036	316097	4
1037	238569	3
1037	776626	3
1037	118277	2
1037	560017	2
1037	169537	4
1038	296215	5
1038	551320	4
1038	712605	5
1039	325139	4
1039	622500	4
1039	560017	4
1039	657852	2
1039	752387	5
1039	662181	2
1040	354619	4
1040	226251	1
1041	765884	4
1041	150161	2
1041	584502	1
1042	169537	2
1042	123036	2
1042	343041	3
1042	316097	1
1043	540828	2
1043	676078	3
1044	663789	3
1044	150161	2
1044	622500	5
1045	343041	3
1046	752387	3
1046	118277	5
1047	214399	4
1047	123036	4
1047	169537	5
1048	349129	4
1049	278562	4
1049	765884	3
1049	302850	4
1049	752387	4
1050	226251	4
1050	749887	3
1050	752387	3
1050	319977	1
1050	727024	4
1051	537539	2
1051	150181	1
1052	560017	4
1052	319977	4
1053	160692	2
1053	123036	3
1054	657852	2
1054	560017	1
1054	765884	4
1054	296215	2
1054	322677	4
1054	354619	4
1055	302850	3
1055	494940	5
1055	404719	4
1055	319977	1
1055	622500	3
1056	712605	2
1056	118277	2
1057	494940	4
1057	296215	2
1058	123036	2
1058	690765	3
1058	662181	3
1058	149183	4
1058	404719	3
1059	663789	2
1059	383805	4
1060	226251	1
1060	149183	3
1060	238569	3
1060	565245	2
1061	476299	4
1061	776626	1
1062	765884	3
1062	729979	2
1063	622500	3
1063	640479	5
1063	169537	3
1063	540828	1
1064	662181	4
1064	123036	1
1064	690765	3
1064	296215	4
1064	354619	5
1064	169537	3
1065	316097	2
1065	209180	3
1065	776626	4
1065	690765	2
1065	551320	3
1065	640479	2
1066	209180	4
1066	662181	3
1066	663789	4
1067	296215	3
1067	622500	2
1067	727024	2
1068	169537	5
1068	322677	3
1068	404719	2
1068	354619	2
1068	209180	3
1068	680088	3
1069	676078	3
1070	712605	3
1070	160692	2
1071	316097	2
1071	749887	4
1071	383805	4
1071	150181	5
1072	776626	3
1072	464331	3
1072	640479	3
1072	540828	2
1072	322677	5
1072	278562	5
1073	712605	2
1073	663789	3
1073	565245	2
1073	676078	3
1073	160692	4
1074	752387	5
1074	776626	1
1074	404719	4
1074	551320	2
1075	494940	2
1075	765884	5
1075	565245	3
1075	591311	2
1076	690765	4
1076	169537	3
1076	727024	3
1076	551320	1
1076	160692	3
1076	354619	4
1077	343041	4
1077	169537	4
1077	690765	2
1077	238569	3
1077	540828	2
1078	214399	4
1078	383805	2
1078	296215	3
1078	749887	5
1078	540828	2
1079	494940	2
1079	238569	2
1079	727024	5
1079	776626	3
1079	226251	4
1080	319977	4
1080	662181	1
1081	540828	2
1081	712605	4
1081	537539	3
1081	150161	2
1081	752387	2
1082	565245	2
1082	776626	5
1082	617776	1
1083	278562	4
1083	296215	3
1083	537539	4
1084	584502	4
1084	749887	1
1084	209180	3
1085	209180	3
1085	354619	2
1086	776626	3
1087	150161	3
1087	383805	3
1087	765884	1
1088	662181	2
1088	349129	1
1088	209180	4
1088	749887	5
1089	584502	5
1090	169537	2
1090	565245	2
1090	776626	3
1090	551320	5
1091	617776	3
1091	209180	5
1091	354619	1
1092	302850	3
1092	540828	5
1092	662181	3
1093	209180	2
1094	749887	3
1094	729979	3
1095	343041	4
1096	712605	3
1096	343041	4
1096	617776	3
1097	464331	5
1097	383805	2
1097	209180	2
1097	494940	3
1097	302850	4
1098	316097	2
1099	749887	4
1099	690765	3
1099	727024	5
1099	160692	5
1100	663789	2
1100	209180	3
1100	560017	5
1100	464331	5
1100	123036	5
1101	602951	3
1101	565245	2
1101	296215	1
1101	278562	2
1102	325139	1
1102	160692	4
1102	296215	5
1102	343041	1
1102	278562	3
1103	160692	3
1104	383805	3
1104	343041	5
1104	540828	2
1105	118277	4
1105	278562	2
1106	404719	2
1107	551320	3
1107	296215	2
1108	226251	3
1109	680088	4
1109	676078	2
1109	123036	5
1109	319977	2
1109	209180	2
1109	622500	2
1110	749887	2
1110	150161	3
1110	584502	4
1110	657852	2
1110	322677	3
1110	325139	2
1111	209180	2
1111	749887	5
1111	617776	5
1111	316097	2
1111	150181	3
1112	663789	1
1113	680088	2
1113	150181	4
1114	537539	4
1114	776626	5
1114	617776	2
1115	765884	3
1116	150181	4
1116	680088	3
1116	322677	2
1116	591311	1
1117	551320	5
1117	319977	3
1117	752387	3
1118	316097	3
1118	584502	5
1118	680088	2
1118	565245	2
1119	464331	4
1119	752387	5
1119	383805	1
1120	325139	2
1121	622500	2
1121	238569	1
1122	537539	4
1122	690765	4
1122	752387	4
1122	209180	3
1122	729979	3
1123	729979	5
1123	662181	5
1124	617776	2
1124	727024	3
1124	476299	2
1125	551320	1
1125	676078	3
1125	540828	3
1125	343041	3
1125	150161	3
1126	560017	4
1126	226251	4
1126	464331	1
1126	765884	3
1126	640479	1
1127	657852	3
1127	540828	3
1128	150161	1
1128	680088	3
1129	551320	4
1129	765884	1
1129	617776	2
1129	540828	3
1129	712605	3
1129	214399	1
1130	464331	3
1131	565245	1
1131	296215	2
1131	551320	3
1132	776626	3
1132	680088	2
1132	278562	3
1132	214399	4
1132	617776	4
1133	662181	1
1133	690765	4
1133	680088	3
1134	404719	1
1134	325139	2
1134	776626	1
1134	316097	5
1134	354619	2
1135	565245	2
1135	540828	2
1135	680088	3
1135	349129	2
1135	765884	3
1136	776626	1
1136	749887	1
1136	591311	2
1136	150181	2
1136	319977	2
1137	209180	5
1137	464331	3
1138	302850	2
1139	749887	5
1139	551320	3
1139	343041	2
1140	238569	1
1140	591311	2
1140	727024	2
1140	150161	2
1140	776626	3
1140	560017	1
1141	325139	2
1141	591311	3
1142	123036	4
1142	476299	2
1143	602951	4
1143	209180	4
1143	226251	2
1143	319977	3
1144	749887	2
1144	349129	5
1144	343041	1
1144	537539	2
1144	404719	4
1145	325139	5
1145	657852	1
1145	214399	2
1145	662181	1
1145	617776	1
1146	540828	4
1146	657852	2
1146	354619	2
1146	494940	3
1146	776626	2
1147	602951	4
1147	690765	5
1147	712605	2
1147	278562	1
1147	565245	5
1148	354619	2
1148	319977	4
1149	404719	3
1149	150181	4
1149	238569	2
1150	319977	5
1150	560017	2
1150	322677	2
1150	749887	2
1150	476299	2
1151	354619	2
1151	150181	4
1151	149183	1
1151	657852	4
1151	278562	3
1152	302850	2
1152	752387	2
1152	169537	4
1153	537539	1
1153	296215	4
1153	169537	2
1154	622500	1
1154	476299	5
1155	640479	1
1155	404719	3
1155	209180	3
1155	749887	4
1155	776626	2
1156	663789	2
1156	729979	4
1156	640479	5
1156	712605	3
1157	278562	3
1157	680088	3
1157	354619	5
1157	560017	4
1158	226251	3
1158	325139	4
1158	537539	5
1158	349129	4
1158	302850	3
1158	752387	4
1159	622500	3
1159	591311	3
1159	238569	3
1160	765884	3
1160	749887	3
1160	560017	1
1160	383805	2
1161	118277	4
1161	476299	1
1161	325139	3
1161	749887	3
1161	354619	1
1162	640479	5
1162	584502	2
1162	160692	5
1162	551320	2
1162	540828	3
1163	476299	3
1163	123036	4
1163	354619	1
1164	602951	1
1165	325139	3
1165	565245	5
1165	676078	1
1165	537539	2
1166	169537	2
1166	150161	4
1166	712605	3
1166	551320	4
1166	591311	2
1167	464331	3
1167	302850	5
1167	551320	3
1167	118277	4
1167	657852	5
1168	319977	4
1168	749887	5
1168	622500	3
1169	226251	4
1169	565245	4
1169	349129	3
1169	476299	5
1170	752387	3
1170	118277	4
1170	765884	4
1171	316097	3
1171	752387	2
1171	226251	2
1171	238569	2
1171	319977	2
1171	278562	4
1172	319977	2
1172	316097	5
1172	123036	4
1172	663789	3
1173	150181	5
1173	690765	4
1173	349129	3
1173	319977	3
1173	617776	4
1174	765884	3
1175	160692	2
1175	712605	4
1175	316097	3
1175	214399	2
1175	319977	2
1176	150161	4
1176	226251	2
1176	663789	4
1177	123036	3
1177	160692	1
1177	727024	3
1177	765884	5
1178	226251	3
1178	657852	2
1179	727024	3
1179	729979	5
1179	383805	5
1179	680088	3
1180	752387	3
1180	749887	3
1180	296215	2
1181	617776	1
1181	584502	5
1181	560017	3
1181	551320	4
1181	752387	1
1182	383805	1
1182	662181	4
1183	354619	2
1183	640479	1
1183	617776	3
1183	657852	3
1183	316097	2
1184	169537	3
1185	383805	2
1185	319977	3
1185	209180	1
1185	214399	4
1185	690765	2
1185	752387	3
1186	319977	4
1186	238569	4
1186	537539	5
1186	676078	2
1187	565245	4
1187	640479	5
1187	296215	3
1187	591311	5
1188	118277	1
1188	657852	5
1188	540828	5
1188	640479	1
1189	565245	4
1189	226251	3
1189	494940	5
1189	354619	2
1189	296215	3
1190	319977	2
1191	591311	2
1191	150161	5
1191	560017	3
1191	319977	3
1192	149183	5
1192	296215	5
1193	676078	3
1193	214399	3
1193	354619	3
1193	776626	3
1193	729979	1
1194	150161	2
1194	676078	2
1194	729979	1
1194	565245	4
1194	584502	4
1195	680088	3
1195	322677	2
1196	560017	3
1196	565245	4
1196	169537	5
1196	349129	3
1196	354619	3
1197	214399	2
1197	657852	3
1197	404719	3
1197	383805	4
1198	537539	4
1198	584502	3
1198	712605	2
1198	727024	4
1198	354619	3
1198	150181	2
1199	560017	3
1199	551320	3
1199	729979	4
1199	617776	3
1199	622500	4
1199	752387	4
1200	316097	3
1200	209180	1
1200	663789	2
1200	278562	1
1200	537539	5
1201	727024	2
1201	149183	4
1201	749887	3
1202	752387	3
1202	316097	3
1202	560017	4
1202	169537	1
1202	383805	3
1203	149183	1
1204	640479	4
1204	663789	2
1204	296215	1
1205	560017	5
1205	296215	3
1206	150181	3
1206	663789	2
1206	123036	1
1206	584502	1
1206	118277	4
1207	123036	4
1207	343041	2
1207	765884	1
1207	160692	3
1207	602951	4
1208	765884	1
1208	296215	2
1209	123036	4
1209	749887	1
1209	354619	3
1210	640479	3
1210	622500	4
1211	551320	2
1212	316097	4
1213	663789	2
1213	551320	3
1213	591311	3
1213	319977	4
1213	494940	3
1214	464331	2
1214	209180	2
1214	676078	4
1215	565245	2
1215	476299	4
1215	354619	4
1215	551320	1
1216	690765	2
1217	765884	3
1217	584502	1
1218	226251	2
1218	214399	4
1219	322677	4
1219	560017	2
1219	149183	4
1219	752387	2
1219	622500	2
1220	464331	2
1220	476299	4
1220	749887	3
1220	278562	2
1221	343041	2
1221	662181	3
1221	169537	3
1221	238569	4
1221	226251	2
1222	209180	4
1222	149183	2
1222	712605	4
1222	617776	4
1223	540828	2
1223	602951	4
1223	316097	1
1223	169537	3
1224	565245	3
1224	729979	5
1224	319977	5
1224	712605	4
1225	226251	4
1225	565245	5
1226	776626	3
1227	214399	4
1227	765884	2
1227	150181	2
1227	226251	2
1228	316097	2
1228	296215	5
1228	540828	1
1228	464331	2
1228	404719	4
1229	602951	3
1229	226251	1
1229	727024	3
1230	690765	5
1230	150181	5
1230	551320	4
1230	343041	1
1231	383805	2
1231	752387	2
1231	551320	3
1232	602951	3
1232	591311	4
1232	349129	2
1232	662181	5
1232	325139	4
1233	383805	3
1233	349129	3
1233	343041	5
1233	537539	3
1233	319977	4
1234	537539	2
1234	712605	3
1234	118277	5
1234	591311	5
1235	676078	2
1235	680088	5
1236	123036	1
1236	226251	5
1236	591311	2
1236	551320	2
1237	680088	3
1237	383805	3
1237	727024	3
1237	690765	4
1237	343041	5
1238	622500	2
1238	209180	2
1238	322677	3
1238	749887	3
1238	776626	3
1239	278562	4
1239	296215	3
1240	657852	2
1240	729979	4
1240	591311	5
1240	296215	4
1240	712605	3
1241	727024	3
1241	354619	4
1241	662181	5
1241	325139	5
1241	622500	5
1242	565245	3
1242	316097	4
1243	617776	1
1243	160692	3
1243	749887	4
1244	680088	2
1244	727024	1
1244	226251	1
1244	464331	3
1244	169537	3
1245	690765	1
1245	540828	5
1245	476299	3
1245	537539	5
1246	591311	5
1246	169537	5
1246	118277	3
1247	383805	2
1247	584502	3
1247	226251	4
1247	680088	2
1248	476299	2
1248	354619	4
1248	729979	4
1249	123036	4
1249	354619	2
1249	316097	4
1249	209180	5
1250	160692	3
1250	551320	3
1250	214399	1
1250	354619	2
1251	343041	2
1251	776626	3
1251	494940	5
1252	540828	3
1252	657852	4
1252	343041	3
1253	150161	3
1253	322677	4
1253	727024	2
1253	663789	4
1253	349129	2
1254	383805	2
1254	617776	4
1254	464331	3
1254	540828	2
1254	662181	5
1255	680088	4
1256	729979	4
1256	560017	3
1257	209180	2
1257	354619	2
1257	537539	1
1257	540828	4
1257	118277	4
1257	622500	4
1258	680088	5
1258	663789	5
1258	354619	4
1259	278562	3
1259	657852	2
1259	663789	5
1260	494940	1
1260	464331	3
1260	727024	4
1260	776626	3
1261	690765	2
1261	226251	1
1261	354619	5
1261	296215	5
1262	657852	1
1262	676078	4
1263	160692	2
1263	752387	5
1263	296215	2
1263	690765	3
1263	226251	2
1264	537539	3
1264	209180	2
1264	584502	2
1264	160692	2
1265	727024	2
1265	690765	2
1265	712605	4
1265	325139	4
1266	149183	2
1266	765884	4
1266	494940	2
1267	617776	3
1267	680088	4
1267	160692	5
1268	160692	3
1268	169537	2
1269	776626	3
1269	617776	4
1270	540828	2
1270	727024	5
1270	322677	3
1270	123036	4
1271	226251	3
1271	657852	4
1271	551320	4
1272	676078	3
1272	160692	5
1273	316097	1
1273	476299	3
1274	591311	2
1274	584502	2
1275	729979	2
1275	727024	2
1275	565245	3
1275	325139	4
1275	169537	3
1275	765884	2
1276	560017	5
1276	676078	3
1276	343041	3
1277	591311	4
1277	584502	1
1278	662181	4
1278	150181	3
1279	729979	4
1279	214399	5
1279	712605	4
1279	150181	3
1279	551320	4
1280	296215	1
1280	494940	3
1280	537539	1
1280	214399	3
1280	662181	4
1281	622500	3
1281	537539	3
1281	765884	2
1281	354619	3
1281	296215	2
1282	149183	1
1282	296215	1
1282	729979	3
1282	676078	2
1282	662181	2
1282	325139	4
1283	404719	1
1283	776626	2
1284	662181	1
1284	404719	4
1284	214399	4
1284	551320	3
1284	591311	5
1284	765884	3
1285	749887	1
1285	464331	3
1285	663789	2
1285	354619	3
1285	322677	5
1286	278562	1
1286	349129	1
1286	226251	3
1287	464331	1
1287	565245	3
1288	727024	4
1288	749887	2
1289	494940	1
1289	537539	4
1289	663789	2
1290	662181	1
1290	640479	3
1290	752387	2
1290	765884	3
1290	727024	1
1291	662181	4
1292	169537	2
1292	325139	2
1293	560017	2
1293	537539	5
1293	749887	3
1293	150161	3
1294	160692	3
1294	602951	1
1294	118277	4
1294	565245	3
1295	591311	3
1295	765884	4
1295	278562	3
1295	464331	1
1296	690765	1
1296	214399	2
1296	537539	5
1296	325139	3
1297	663789	3
1297	150181	2
1297	622500	1
1297	123036	1
1298	349129	3
1298	464331	2
1298	238569	4
1298	118277	3
1298	278562	4
1298	123036	1
1299	278562	5
1300	123036	2
1300	622500	2
1300	662181	5
1301	712605	3
1301	226251	5
1301	560017	1
1301	343041	3
1301	680088	1
1301	349129	2
1302	464331	4
1302	238569	3
1303	765884	1
1303	278562	1
1303	476299	1
1304	226251	4
1304	354619	1
1304	319977	1
1304	537539	2
1305	729979	3
1305	118277	3
1305	343041	4
1305	640479	3
1306	690765	2
1306	209180	4
1306	316097	3
1306	319977	2
1306	776626	4
1307	343041	3
1307	776626	3
1307	676078	5
1307	123036	3
1307	150161	2
1307	169537	2
1308	325139	2
1308	354619	3
1308	680088	2
1308	296215	4
1309	149183	2
1309	565245	2
1309	319977	3
1310	657852	5
1310	169537	3
1310	209180	2
1310	322677	3
1310	319977	3
1310	354619	5
1311	316097	2
1311	150181	3
1311	169537	3
1311	238569	4
1312	325139	5
1312	354619	3
1312	540828	3
1313	319977	4
1313	354619	4
1313	278562	3
1313	150181	4
1313	209180	4
1314	617776	3
1314	622500	4
1314	118277	4
1315	476299	3
1315	752387	4
1316	776626	3
1316	494940	2
1316	727024	4
1317	278562	4
1317	776626	1
1318	765884	4
1318	160692	1
1318	118277	4
1318	727024	1
1319	776626	2
1320	617776	2
1320	319977	4
1321	123036	3
1321	602951	3
1321	676078	4
1322	476299	2
1322	537539	3
1323	584502	3
1323	150181	1
1323	676078	5
1323	123036	2
1323	729979	5
1324	690765	3
1324	160692	3
1324	662181	4
1324	729979	1
1325	690765	4
1326	209180	3
1326	118277	5
1326	617776	3
1326	160692	1
1327	560017	4
1327	278562	1
1327	349129	4
1328	319977	1
1328	226251	2
1328	383805	2
1328	712605	4
1328	494940	4
1329	404719	2
1329	316097	1
1329	226251	2
1329	322677	5
1329	680088	1
1330	617776	3
1330	214399	4
1330	560017	2
1330	322677	2
1330	226251	2
1331	622500	2
1331	464331	2
1331	680088	3
1332	537539	2
1333	776626	1
1333	149183	4
1333	238569	3
1333	322677	2
1333	712605	3
1333	551320	1
1334	537539	2
1334	591311	4
1335	322677	2
1335	278562	1
1335	302850	4
1335	584502	5
1336	729979	3
1336	657852	4
1336	565245	2
1337	349129	2
1337	404719	5
1337	602951	4
1338	752387	5
1338	214399	3
1338	776626	4
1339	150161	2
1339	149183	2
1339	640479	4
1340	319977	2
1340	617776	5
1341	776626	3
1341	150181	3
1341	322677	1
1342	302850	2
1342	752387	4
1342	622500	3
1343	325139	5
1343	322677	2
1343	537539	2
1343	622500	3
1344	727024	3
1344	349129	3
1344	118277	1
1344	476299	2
1344	316097	1
1345	149183	2
1346	169537	5
1347	296215	3
1347	278562	2
1347	150161	5
1347	560017	2
1348	209180	4
1348	404719	5
1348	160692	3
1349	214399	3
1349	354619	5
1349	540828	4
1349	749887	1
1350	160692	4
1350	214399	3
1350	123036	1
1350	690765	3
1350	657852	3
1350	150161	4
1351	591311	4
1351	160692	5
1351	278562	3
1351	464331	4
1351	383805	4
1351	657852	4
1352	765884	4
1352	354619	5
1353	343041	1
1353	150161	4
1353	404719	3
1353	584502	2
1354	150181	3
1354	316097	2
1354	169537	3
1355	349129	4
1355	476299	1
1355	676078	1
1355	354619	3
1355	149183	3
1356	749887	1
1356	560017	5
1357	584502	2
1357	316097	1
1357	727024	3
1357	278562	4
1357	752387	2
1358	322677	5
1358	690765	2
1358	680088	2
1358	226251	4
1359	296215	5
1359	752387	2
1359	278562	1
1359	150161	3
1360	663789	5
1360	537539	1
1360	214399	4
1361	319977	1
1361	325139	3
1362	316097	3
1362	591311	5
1362	149183	1
1362	540828	4
1362	663789	5
1362	584502	3
1363	209180	2
1363	214399	4
1363	617776	1
1363	712605	3
1363	349129	2
1364	690765	2
1364	565245	5
1364	296215	2
1364	676078	3
1365	150181	5
1365	662181	5
1365	169537	2
1366	765884	2
1366	404719	2
1366	712605	4
1367	765884	2
1367	540828	4
1367	238569	2
1367	150181	2
1368	622500	1
1368	729979	3
1368	319977	2
1368	565245	2
1369	226251	2
1369	617776	4
1369	776626	4
1369	729979	1
1370	322677	4
1370	150161	4
1370	494940	3
1370	349129	4
1370	278562	1
1370	617776	3
1371	494940	5
1371	765884	1
1372	322677	1
1372	551320	4
1372	663789	4
1372	238569	5
1372	325139	5
1373	537539	3
1373	464331	2
1373	296215	3
1373	680088	1
1373	302850	5
1373	584502	3
1374	169537	5
1374	560017	2
1374	551320	2
1374	765884	5
1375	727024	2
1375	354619	1
1375	690765	2
1375	150181	4
1375	316097	2
1376	325139	4
1376	752387	2
1376	617776	4
1376	657852	1
1377	149183	3
1377	749887	4
1377	540828	4
1378	540828	3
1378	150181	2
1379	464331	3
1379	640479	3
1380	565245	5
1380	776626	4
1380	680088	3
1380	551320	3
1380	752387	3
1381	296215	3
1381	749887	2
1381	160692	2
1381	322677	4
1382	537539	2
1382	316097	2
1382	712605	1
1382	640479	4
1382	325139	4
1382	602951	3
1383	591311	2
1383	752387	4
1383	319977	2
1383	343041	4
1384	343041	2
1384	776626	3
1384	322677	2
1384	404719	3
1384	169537	1
1384	238569	2
1385	540828	2
1385	464331	5
1385	560017	5
1385	494940	1
1386	662181	1
1386	319977	2
1386	591311	3
1386	749887	4
1387	640479	2
1387	316097	2
1387	749887	3
1387	160692	2
1387	349129	3
1388	765884	5
1388	150181	1
1389	160692	3
1389	663789	2
1390	617776	3
1390	209180	2
1390	319977	5
1390	551320	4
1390	662181	5
1390	676078	4
1391	540828	3
1391	680088	3
1392	209180	5
1392	383805	5
1392	584502	1
1392	591311	3
1392	316097	5
1392	551320	2
1393	160692	1
1393	776626	4
1393	617776	5
1393	537539	3
1393	560017	3
1394	551320	3
1394	622500	1
1394	676078	3
1395	322677	3
1395	238569	4
1396	551320	5
1396	226251	3
1396	118277	4
1396	765884	4
1396	476299	3
1397	602951	5
1397	150161	2
1397	325139	3
1397	662181	3
1398	752387	4
1398	537539	2
1398	657852	4
1398	325139	1
1398	316097	4
1398	349129	4
1399	169537	2
1400	591311	4
1400	123036	5
1400	349129	4
1400	727024	4
1400	622500	3
1401	476299	3
1401	149183	2
1401	752387	3
1401	617776	5
1401	325139	3
1402	149183	2
1403	752387	5
1403	494940	2
1403	149183	4
1403	316097	4
1403	537539	2
1404	150161	4
1404	319977	2
1405	662181	3
1405	537539	4
1405	663789	1
1405	551320	3
1406	316097	4
1407	319977	2
1407	325139	4
1408	214399	3
1408	560017	3
1408	617776	3
1408	591311	4
1408	118277	3
1409	325139	5
1409	349129	3
1409	663789	2
1409	322677	3
1409	537539	4
1410	690765	4
1410	749887	5
1410	776626	3
1410	663789	3
1411	316097	2
1411	540828	3
1411	349129	4
1411	729979	4
1411	662181	2
1412	727024	5
1412	476299	1
1412	749887	1
1413	150181	2
1413	657852	2
1413	565245	4
1413	540828	2
1414	712605	3
1414	123036	1
1414	729979	3
1414	591311	4
1414	765884	1
1414	343041	4
1415	584502	4
1415	676078	3
1415	560017	4
1415	149183	5
1415	118277	4
1416	690765	3
1416	118277	2
1416	494940	4
1416	617776	4
1416	349129	1
1416	322677	1
1417	226251	4
1417	322677	4
1417	319977	5
1417	765884	1
1417	752387	1
1418	325139	3
1419	476299	3
1419	404719	3
1419	560017	3
1419	617776	3
1419	325139	3
1420	680088	4
1420	476299	2
1420	214399	3
1420	123036	2
1421	209180	2
1421	118277	2
1421	602951	4
1421	343041	2
1421	325139	2
1421	354619	2
1422	540828	4
1422	349129	4
1422	149183	1
1422	160692	5
1422	752387	3
1422	680088	4
1423	712605	4
1423	316097	2
1424	749887	1
1424	690765	3
1424	537539	4
1424	238569	2
1424	123036	4
1424	584502	4
1425	676078	4
1425	214399	4
1425	404719	4
1426	214399	1
1426	551320	4
1426	404719	2
1426	325139	3
1427	540828	5
1427	343041	2
1427	354619	5
1427	537539	1
1427	238569	3
1427	494940	3
1428	540828	3
1428	464331	2
1428	776626	1
1428	476299	4
1428	238569	2
1428	316097	3
1429	690765	3
1429	727024	2
1429	238569	5
1429	150181	3
1429	404719	1
1430	296215	3
1430	776626	2
1431	663789	2
1431	302850	2
1431	383805	5
1431	676078	3
1432	383805	5
1433	349129	5
1433	749887	4
1433	712605	4
1434	278562	1
1434	123036	5
1434	749887	2
1434	325139	4
1435	464331	5
1435	676078	4
1435	123036	4
1435	752387	2
1435	712605	3
1436	118277	2
1436	226251	2
1436	540828	4
1436	160692	4
1436	476299	2
1437	591311	1
1437	690765	4
1438	160692	1
1439	226251	2
1439	662181	3
1439	383805	1
1439	118277	3
1439	676078	2
1439	602951	2
1440	354619	2
1440	494940	2
1440	657852	5
1441	662181	5
1442	565245	4
1442	617776	2
1442	584502	2
1442	752387	3
1443	319977	5
1443	209180	1
1443	278562	4
1443	214399	2
1444	617776	3
1445	316097	2
1445	591311	3
1445	214399	3
1445	776626	3
1445	602951	3
1446	622500	4
1446	123036	5
1447	404719	2
1447	622500	2
1447	226251	5
1447	464331	4
1448	476299	5
1448	617776	4
1448	383805	4
1449	238569	3
1449	464331	4
1449	663789	3
1450	349129	1
1450	712605	3
1451	494940	3
1451	160692	3
1451	657852	3
1451	622500	4
1452	584502	1
1452	712605	5
1452	296215	4
1453	640479	1
1453	663789	4
1454	325139	1
1454	494940	5
1454	278562	4
1454	464331	4
1454	749887	2
1454	160692	2
1455	150161	3
1455	622500	3
1455	690765	3
1455	149183	3
1456	118277	4
1456	169537	1
1457	680088	3
1457	727024	3
1457	776626	4
1458	690765	2
1458	150181	3
1458	776626	5
1459	214399	5
1459	343041	5
1460	150181	5
1460	657852	3
1460	296215	2
1460	464331	3
1461	464331	1
1461	319977	4
1461	663789	2
1461	657852	3
1461	662181	3
1461	404719	5
1462	663789	3
1462	657852	3
1462	765884	3
1462	676078	2
1463	602951	3
1463	690765	3
1463	560017	2
1464	776626	4
1464	325139	3
1465	349129	4
1465	316097	1
1465	118277	4
1465	464331	4
1465	476299	4
1465	238569	1
1466	765884	3
1466	680088	5
1466	319977	3
1466	662181	2
1466	404719	3
1467	584502	2
1467	602951	3
1467	319977	4
1468	591311	3
1468	278562	1
1468	565245	1
1468	209180	2
1468	690765	2
1469	214399	2
1469	680088	3
1470	765884	1
1470	169537	4
1470	662181	2
1471	319977	5
1471	690765	4
1471	729979	4
1471	464331	3
1472	540828	2
1472	160692	4
1472	325139	1
1472	551320	2
1473	494940	2
1473	319977	3
1474	325139	2
1474	302850	3
1474	149183	4
1474	602951	2
1474	657852	5
1475	617776	4
1475	319977	3
1475	676078	1
1475	663789	1
1476	354619	4
1476	540828	4
1476	150181	3
1477	729979	4
1477	657852	4
1477	209180	1
1477	404719	5
1477	118277	2
1478	560017	2
1478	565245	4
1478	123036	2
1479	349129	2
1479	226251	2
1479	150161	1
1480	657852	1
1480	602951	4
1480	238569	4
1481	476299	5
1481	551320	4
1482	319977	2
1482	404719	4
1482	752387	3
1482	690765	3
1482	765884	4
1483	322677	2
1483	383805	4
1483	540828	3
1483	226251	5
1484	565245	2
1484	776626	3
1484	322677	5
1484	662181	4
1484	169537	5
1484	765884	2
1485	765884	4
1485	727024	2
1485	584502	2
1486	476299	4
1486	617776	4
1486	690765	3
1486	560017	4
1486	565245	1
1487	602951	2
1487	712605	4
1487	680088	5
1488	640479	4
1488	617776	1
1488	749887	3
1488	676078	4
1488	560017	2
1489	278562	1
1489	238569	3
1490	690765	3
1490	551320	2
1491	540828	4
1491	560017	1
1491	464331	4
1491	712605	1
1491	150161	2
1492	404719	2
1492	662181	2
1492	560017	1
1492	537539	1
1492	640479	5
1492	214399	3
1493	663789	3
1493	160692	5
1493	560017	3
1493	494940	2
1493	540828	3
1494	591311	2
1494	690765	4
1494	749887	3
1495	118277	1
1495	727024	2
1495	343041	1
1495	690765	2
1495	150181	1
1496	322677	5
1496	662181	4
1496	169537	3
1496	150181	5
1497	464331	1
1497	690765	2
1498	118277	4
1498	540828	5
1498	149183	5
1498	214399	4
1499	712605	3
1499	622500	3
1499	464331	1
1499	727024	4
1500	316097	3
1501	302850	2
1501	325139	4
1502	591311	4
1502	322677	1
1502	354619	4
1502	690765	4
1502	302850	3
1502	226251	2
1503	540828	2
1503	727024	1
1504	584502	1
1504	149183	4
1504	727024	4
1504	591311	4
1505	622500	3
1505	640479	5
1505	537539	3
1506	565245	4
1506	729979	3
1506	640479	1
1506	712605	2
1506	322677	5
1506	476299	4
1507	676078	4
1507	727024	4
1507	565245	4
1507	662181	3
1508	749887	3
1508	150161	3
1508	160692	4
1508	118277	4
1508	316097	3
1509	776626	2
1509	209180	2
1509	169537	2
1510	278562	4
1510	404719	2
1510	565245	4
1511	404719	2
1511	640479	4
1511	729979	3
1511	278562	4
1511	302850	5
1511	765884	3
1512	322677	3
1512	169537	1
1513	343041	3
1513	476299	2
1513	676078	4
1514	662181	5
1514	640479	3
1514	404719	3
1514	663789	4
1515	727024	3
1515	209180	1
1515	622500	2
1516	676078	3
1516	657852	3
1516	278562	1
1516	727024	5
1516	584502	4
1517	160692	3
1517	537539	2
1518	657852	4
1519	150161	1
1519	214399	2
1520	343041	3
1520	160692	3
1520	118277	3
1520	537539	2
1520	663789	3
1520	209180	1
1521	602951	4
1521	749887	3
1521	540828	3
1522	622500	5
1522	404719	3
1523	160692	1
1523	565245	5
1523	690765	3
1523	560017	2
1523	354619	4
1524	354619	3
1524	214399	1
1524	464331	4
1524	343041	5
1524	349129	3
1524	149183	1
1525	160692	4
1525	149183	3
1525	464331	3
1525	316097	4
1526	343041	1
1526	150181	3
1526	316097	4
1526	278562	2
1526	540828	3
1527	343041	4
1527	540828	4
1527	169537	5
1527	727024	2
1528	404719	3
1528	560017	2
1528	676078	3
1528	149183	3
1529	325139	4
1529	727024	2
1529	343041	1
1530	657852	2
1530	325139	2
1531	565245	5
1531	591311	3
1531	680088	1
1532	640479	2
1532	663789	1
1532	584502	4
1532	540828	1
1532	765884	3
1533	118277	5
1533	729979	3
1533	662181	4
1533	383805	1
1533	537539	2
1534	319977	2
1534	169537	3
1535	226251	4
1535	343041	1
1535	209180	3
1536	404719	3
1536	560017	2
1536	123036	4
1536	476299	4
1537	676078	5
1537	680088	5
1537	537539	1
1537	226251	2
1537	690765	3
1538	226251	3
1538	296215	3
1538	712605	3
1538	150161	5
1538	680088	2
1538	319977	2
1539	537539	1
1539	676078	2
1539	663789	2
1539	640479	2
1539	727024	4
1539	494940	5
1540	150181	1
1540	322677	3
1540	238569	3
1540	123036	2
1540	537539	2
1541	302850	3
1541	657852	1
1541	214399	3
1541	729979	5
1542	464331	4
1543	322677	4
1543	150161	3
1543	729979	4
1543	676078	4
1543	149183	1
1544	464331	1
1544	118277	1
1544	662181	4
1544	657852	3
1545	622500	2
1545	676078	4
1545	278562	4
1545	343041	3
1546	640479	5
1546	680088	3
1546	729979	2
1546	238569	2
1546	617776	5
1547	680088	1
1548	551320	1
1548	316097	3
1549	319977	3
1549	238569	5
1550	690765	4
1550	123036	5
1551	617776	4
1551	150181	3
1551	540828	3
1551	537539	4
1551	776626	2
1551	729979	3
1552	214399	5
1552	296215	3
1552	663789	4
1552	565245	2
1552	226251	1
1553	476299	4
1553	464331	4
1554	325139	3
1554	169537	1
1554	560017	4
1554	383805	2
1555	169537	2
1555	209180	3
1555	680088	4
1556	464331	2
1556	325139	1
1556	296215	1
1556	169537	2
1557	404719	1
1557	226251	2
1558	464331	4
1558	150161	3
1558	622500	4
1558	404719	2
1558	149183	2
1558	663789	4
1559	657852	4
1559	676078	4
1559	617776	3
1559	591311	3
1559	123036	2
1560	354619	4
1560	617776	1
1561	560017	3
1561	169537	3
1561	354619	4
1562	584502	2
1562	727024	1
1563	354619	4
1563	640479	4
1564	622500	1
1564	209180	2
1564	749887	2
1564	663789	4
1564	302850	5
1564	551320	4
1565	640479	3
1565	316097	4
1565	319977	5
1565	729979	3
1566	494940	5
1566	663789	5
1566	214399	2
1567	325139	3
1567	537539	5
1567	238569	1
1567	296215	4
1568	540828	4
1568	476299	1
1569	591311	2
1569	727024	5
1569	319977	3
1570	657852	3
1570	118277	3
1570	622500	2
1570	214399	3
1571	537539	3
1571	123036	2
1571	150161	3
1571	150181	4
1572	765884	4
1573	729979	4
1573	617776	4
1573	150181	2
1573	325139	2
1573	712605	2
1574	214399	5
1574	602951	2
1574	160692	5
1574	325139	2
1574	657852	2
1575	727024	3
1575	591311	1
1576	226251	3
1576	278562	2
1576	169537	2
1576	118277	5
1576	776626	4
1576	690765	1
1577	354619	3
1578	349129	3
1578	296215	4
1579	343041	4
1579	765884	4
1579	551320	2
1580	640479	5
1580	560017	4
1580	226251	4
1580	354619	3
1580	464331	4
1581	296215	1
1581	680088	4
1582	640479	4
1582	150161	3
1583	765884	3
1583	464331	3
1583	663789	2
1583	383805	3
1583	404719	2
1584	476299	2
1584	316097	2
1584	729979	3
1584	464331	4
1584	343041	1
1585	316097	2
1585	591311	4
1585	560017	4
1585	584502	4
1586	226251	4
1586	540828	3
1586	565245	3
1586	551320	1
1586	238569	3
1587	591311	5
1588	150181	3
1589	551320	4
1590	690765	5
1590	149183	4
1591	476299	2
1591	343041	4
1591	118277	4
1591	464331	4
1591	278562	2
1592	322677	3
1592	537539	3
1592	226251	5
1593	354619	4
1593	537539	3
1594	238569	2
1594	214399	4
1594	776626	3
1594	663789	5
1594	325139	2
1594	617776	4
1595	319977	2
1595	123036	4
1595	560017	1
1595	752387	3
1595	765884	1
1596	349129	4
1596	322677	4
1596	776626	1
1596	150181	4
1597	680088	3
1597	322677	5
1597	383805	5
1597	226251	3
1597	214399	3
1597	343041	2
1598	560017	5
1598	617776	3
1599	349129	4
1599	383805	2
1599	150161	2
1600	617776	4
1600	325139	4
1601	343041	3
1601	476299	1
1601	727024	2
1602	150161	1
1602	537539	2
1602	657852	3
1603	226251	4
1603	565245	4
1603	319977	4
1604	617776	1
1605	537539	2
1605	729979	5
1605	591311	4
1605	727024	2
1605	476299	3
1605	551320	1
1606	494940	4
1606	729979	3
1606	150161	4
1607	565245	3
1607	383805	3
1608	343041	2
1608	322677	2
1608	617776	1
1608	662181	4
1608	150181	3
1608	663789	4
1609	150161	3
1609	663789	2
1609	349129	2
1610	584502	3
1610	150181	2
1610	565245	4
1611	238569	2
1611	383805	5
1611	149183	3
1611	663789	4
1612	560017	2
1612	464331	3
1612	591311	2
1612	343041	5
1612	584502	1
1613	316097	4
1613	617776	1
1613	584502	2
1613	657852	5
1613	776626	4
1614	343041	4
1615	727024	3
1615	560017	4
1615	676078	2
1615	238569	3
1615	160692	3
1616	752387	4
1616	302850	2
1617	663789	4
1617	537539	5
1617	776626	4
1617	565245	3
1618	150181	3
1618	322677	2
1618	494940	4
1618	476299	2
1618	752387	1
1619	640479	1
1619	537539	2
1619	765884	3
1619	617776	4
1619	657852	4
1620	316097	2
1620	476299	4
1620	322677	1
1620	302850	3
1620	565245	3
1621	316097	5
1621	118277	1
1621	663789	3
1621	752387	3
1621	729979	1
1621	214399	3
1622	302850	4
1622	622500	4
1622	209180	4
1622	560017	5
1622	238569	3
1623	690765	2
1623	169537	3
1623	584502	1
1623	476299	3
1624	729979	4
1624	278562	2
1624	540828	2
1625	591311	5
1625	494940	4
1625	383805	4
1626	640479	4
1626	657852	5
1626	662181	2
1627	729979	3
1628	540828	2
1628	729979	2
1628	316097	5
1628	404719	4
1629	476299	4
1630	238569	2
1630	322677	2
1630	622500	4
1630	690765	5
1630	464331	4
1631	319977	2
1631	343041	2
1631	494940	3
1632	464331	5
1632	404719	4
1632	123036	1
1632	302850	4
1632	316097	4
1633	712605	3
1633	690765	3
1633	776626	3
1633	354619	4
1633	657852	2
1634	150161	3
1634	565245	3
1635	729979	2
1635	209180	1
1635	404719	3
1635	727024	4
1635	149183	2
1636	226251	4
1636	169537	2
1636	150161	3
1636	214399	3
1636	325139	2
1636	537539	5
1637	123036	4
1637	752387	3
1637	150161	3
1638	278562	3
1638	118277	4
1638	551320	1
1638	464331	4
1639	118277	3
1640	540828	4
1640	776626	4
1640	296215	1
1640	676078	2
1641	238569	4
1642	296215	4
1642	226251	3
1642	591311	2
1642	404719	3
1642	214399	2
1643	749887	4
1643	325139	4
1643	765884	5
1643	322677	2
1643	278562	3
1644	226251	2
1644	316097	5
1644	494940	2
1645	690765	3
1645	640479	2
1645	752387	2
1645	322677	4
1645	349129	1
1645	540828	3
1646	316097	3
1646	752387	5
1646	383805	2
1646	749887	1
1646	319977	3
1647	476299	3
1647	729979	3
1647	322677	3
1647	118277	4
1648	727024	3
1648	776626	2
1648	226251	2
1648	278562	2
1649	214399	3
1649	150161	2
1649	712605	3
1649	169537	5
1649	680088	2
1650	123036	2
1650	602951	5
1651	565245	3
1651	404719	2
1652	776626	5
1652	591311	2
1652	712605	3
1652	214399	1
1653	160692	3
1653	226251	3
1654	150161	3
1654	150181	1
1654	663789	5
1655	349129	1
1655	560017	4
1655	727024	4
1656	464331	4
1656	226251	3
1656	149183	4
1656	238569	3
1656	640479	3
1656	537539	3
1657	404719	1
1657	765884	4
1657	214399	2
1658	584502	1
1658	123036	1
1659	712605	4
1659	464331	3
1660	464331	4
1660	776626	3
1660	749887	2
1660	123036	3
1661	150181	4
1661	676078	3
1661	622500	3
1661	494940	3
1661	226251	1
1662	617776	2
1662	149183	4
1663	149183	2
1663	662181	5
1663	160692	5
1664	343041	3
1664	752387	3
1665	404719	3
1665	622500	1
1666	765884	4
1666	169537	5
1667	537539	2
1667	238569	2
1668	169537	3
1668	238569	5
1668	680088	4
1669	584502	4
1669	657852	1
1670	325139	4
1670	765884	2
1670	349129	4
1671	354619	2
1671	591311	4
1671	640479	5
1671	551320	2
1671	537539	5
1672	278562	4
1672	752387	2
1673	551320	4
1673	591311	2
1674	657852	3
1674	617776	1
1674	640479	3
1674	343041	3
1675	209180	4
1676	325139	1
1676	209180	2
1676	316097	2
1677	316097	2
1677	765884	1
1677	123036	4
1678	602951	5
1678	662181	3
1678	316097	2
1679	160692	5
1679	680088	5
1679	150161	3
1680	322677	4
1680	150181	4
1680	765884	1
1681	343041	4
1681	602951	4
1681	690765	4
1681	278562	4
1681	551320	4
1681	123036	3
1682	238569	1
1682	354619	4
1682	150181	1
1682	765884	3
1682	209180	1
1682	476299	4
1683	169537	1
1683	712605	4
1683	118277	3
1684	591311	2
1685	278562	4
1685	226251	4
1685	584502	2
1686	214399	4
1686	209180	4
1686	617776	2
1687	749887	1
1687	296215	4
1687	560017	3
1688	226251	3
1688	727024	3
1689	404719	3
1689	565245	2
1690	622500	3
1691	238569	3
1691	476299	5
1692	617776	2
1692	622500	3
1692	278562	3
1692	118277	1
1693	712605	3
1693	540828	1
1693	150181	2
1693	617776	1
1693	749887	2
1694	123036	4
1694	776626	4
1694	560017	1
1694	752387	2
1694	214399	4
1695	494940	2
1695	238569	2
1696	776626	3
1696	349129	4
1696	118277	3
1696	296215	4
1696	622500	2
1696	749887	3
1697	169537	4
1697	540828	1
1697	676078	4
1698	560017	5
1698	123036	2
1698	663789	1
1699	765884	4
1699	560017	4
1699	591311	5
1699	354619	1
1699	617776	4
1699	319977	3
1700	316097	3
1700	226251	1
1700	712605	5
1700	537539	1
1700	662181	2
1701	765884	5
1701	680088	4
1701	712605	5
1701	226251	4
1702	325139	2
1702	640479	4
1703	296215	2
1703	464331	2
1703	404719	4
1703	765884	1
1704	118277	2
1704	662181	3
1704	464331	3
1704	765884	3
1704	349129	5
1704	343041	1
1705	662181	2
1705	551320	3
1705	169537	1
1706	565245	2
1706	123036	2
1706	712605	3
1707	622500	3
1708	118277	3
1708	565245	5
1708	765884	2
1709	729979	3
1709	622500	4
1709	602951	4
1709	160692	1
1709	476299	4
1710	296215	2
1710	560017	3
1711	169537	4
1711	584502	3
1711	765884	3
1711	676078	5
1712	776626	4
1712	322677	2
1712	150181	3
1712	591311	5
1713	150181	4
1713	476299	1
1713	680088	4
1713	238569	3
1714	214399	3
1714	680088	3
1714	383805	5
1715	776626	2
1715	322677	2
1716	349129	1
1716	214399	2
1716	238569	2
1716	729979	4
1716	160692	3
1716	584502	3
1717	727024	4
1718	776626	4
1718	150181	5
1718	537539	4
1718	551320	3
1718	749887	2
1719	776626	4
1719	278562	4
1719	640479	4
1719	226251	4
1719	584502	2
1720	150181	4
1720	749887	4
1720	551320	5
1720	712605	4
1720	591311	1
1721	680088	2
1721	540828	1
1721	617776	1
1721	560017	2
1721	476299	4
1721	349129	2
1722	214399	1
1723	680088	4
1723	727024	4
1723	118277	3
1724	209180	2
1724	464331	2
1724	214399	3
1725	296215	5
1725	354619	4
1725	749887	5
1726	662181	1
1726	663789	1
1726	278562	5
1726	622500	2
1726	752387	4
1727	712605	2
1727	226251	2
1728	316097	5
1728	765884	4
1728	565245	4
1728	209180	4
1729	602951	3
1729	617776	4
1730	118277	2
1730	537539	3
1730	209180	2
1730	322677	3
1731	591311	3
1731	565245	1
1732	226251	1
1732	565245	4
1732	765884	1
1732	209180	4
1732	319977	3
1732	584502	5
1733	169537	2
1733	663789	5
1733	712605	4
1734	560017	2
1734	322677	2
1735	404719	2
1736	560017	3
1736	226251	3
1736	118277	3
1736	676078	3
1736	690765	2
1737	123036	3
1737	464331	4
1737	584502	3
1737	752387	2
1738	319977	4
1738	150161	2
1738	551320	1
1739	537539	4
1739	749887	5
1739	765884	4
1739	150181	4
1740	560017	2
1740	727024	4
1741	464331	3
1741	214399	3
1741	343041	4
1741	663789	5
1742	680088	3
1742	657852	2
1742	354619	4
1742	214399	2
1743	354619	3
1743	150181	3
1743	617776	4
1744	565245	1
1744	662181	4
1744	537539	5
1744	349129	3
1744	494940	4
1744	727024	4
1745	404719	3
1745	602951	2
1746	150181	4
1746	657852	4
1747	662181	2
1747	404719	4
1747	560017	5
1748	494940	5
1748	349129	3
1748	663789	2
1748	662181	4
1749	169537	3
1749	551320	3
1749	749887	4
1749	160692	3
1749	404719	2
1750	238569	3
1750	640479	2
1750	325139	3
1751	149183	3
1751	214399	3
1751	150181	4
1752	404719	5
1752	214399	5
1753	712605	4
1753	150181	3
1753	169537	3
1753	343041	5
1754	349129	3
1754	729979	2
1755	464331	1
1756	662181	2
1756	752387	3
1756	712605	2
1756	476299	3
1757	354619	5
1758	343041	4
1758	150181	2
1759	551320	3
1759	149183	3
1759	591311	3
1760	150161	1
1760	214399	2
1760	727024	4
1760	226251	4
1761	476299	2
1761	169537	5
1761	296215	2
1762	149183	1
1763	565245	4
1763	591311	2
1764	560017	2
1764	118277	2
1765	319977	5
1765	169537	3
1765	752387	1
1765	209180	2
1765	540828	4
1765	676078	2
1766	551320	3
1766	209180	3
1766	560017	2
1766	727024	1
1767	383805	2
1767	591311	2
1768	640479	5
1768	226251	5
1768	551320	1
1769	169537	2
1769	727024	5
1770	551320	3
1770	591311	3
1771	690765	2
1771	354619	2
1771	617776	1
1771	584502	2
1772	565245	3
1772	149183	3
1772	278562	3
1772	343041	5
1773	729979	2
1773	322677	4
1773	118277	3
1773	584502	3
1773	278562	1
1774	584502	1
1774	680088	2
1774	149183	3
1775	476299	2
1775	383805	2
1775	149183	4
1775	662181	4
1775	765884	3
1775	169537	5
1776	123036	2
1776	537539	4
1776	749887	2
1776	551320	3
1776	690765	1
1777	584502	2
1777	343041	3
1778	584502	1
1778	404719	4
1778	322677	3
1778	278562	3
1778	214399	4
1779	476299	2
1779	226251	5
1780	123036	3
1780	729979	1
1780	676078	2
1780	149183	5
1781	690765	5
1781	296215	3
1781	149183	1
1782	226251	4
1782	319977	4
1782	662181	1
1783	160692	5
1783	383805	3
1783	537539	4
1783	584502	2
1784	602951	2
1784	149183	1
1784	349129	1
1785	150161	4
1785	319977	3
1785	537539	5
1785	712605	5
1786	296215	4
1786	226251	4
1787	712605	3
1787	316097	3
1787	354619	5
1788	150161	2
1788	494940	3
1788	476299	2
1789	209180	2
1789	238569	5
1790	749887	2
1790	565245	5
1790	319977	3
1790	765884	2
1790	302850	4
1791	343041	3
1791	209180	2
1792	278562	4
1792	657852	1
1792	238569	3
1792	690765	3
1792	560017	4
1792	676078	4
1793	160692	3
1793	150161	3
1793	680088	1
1794	118277	2
1794	676078	4
1794	296215	4
1795	383805	5
1795	657852	1
1796	160692	3
1797	565245	3
1797	322677	2
1797	540828	3
1798	214399	2
1798	464331	2
1798	160692	4
1799	150181	3
1799	349129	3
1799	160692	1
1799	765884	2
1800	160692	4
1800	123036	5
1800	238569	2
1800	622500	5
1800	118277	5
1801	765884	5
1801	657852	1
1801	537539	3
1801	325139	2
1802	349129	4
1802	325139	5
1803	565245	3
1803	349129	1
1803	354619	2
1803	123036	5
1803	727024	4
1804	160692	5
1804	278562	2
1804	657852	2
1804	214399	4
1805	349129	4
1805	676078	4
1805	712605	3
1805	776626	3
1806	149183	3
1806	640479	4
1806	622500	3
1806	160692	3
1806	316097	4
1807	322677	1
1807	226251	2
1807	123036	5
1807	752387	5
1808	118277	5
1809	150161	3
1809	565245	4
1809	464331	3
1809	727024	5
1809	325139	4
1810	383805	3
1810	349129	5
1810	404719	2
1811	296215	2
1811	680088	4
1811	123036	5
1812	622500	3
1812	322677	2
1813	160692	2
1813	349129	4
1813	214399	3
1813	749887	4
1814	354619	5
1814	680088	5
1814	657852	3
1814	214399	2
1815	150181	3
1815	238569	3
1815	537539	2
1815	160692	3
1815	591311	5
1815	149183	3
1816	118277	5
1816	278562	5
1816	209180	3
1816	752387	3
1817	214399	4
1817	765884	3
1818	296215	4
1819	776626	4
1819	316097	3
1820	319977	2
1820	591311	2
1821	712605	2
1821	123036	1
1822	776626	1
1823	278562	3
1823	617776	5
1823	149183	1
1823	494940	1
1824	123036	3
1824	238569	3
1825	296215	4
1825	540828	2
1825	118277	3
1826	160692	5
1826	663789	3
1826	319977	3
1827	278562	2
1827	343041	3
1828	349129	1
1828	214399	4
1829	690765	3
1829	464331	5
1829	349129	3
1829	776626	5
1829	316097	2
1830	640479	2
1830	749887	1
1830	494940	2
1830	209180	1
1830	319977	3
1831	354619	1
1832	238569	3
1832	349129	4
1832	296215	3
1833	591311	3
1833	551320	4
1833	226251	3
1833	278562	2
1833	663789	3
1834	349129	3
1834	325139	1
1834	591311	5
1835	322677	2
1835	727024	4
1835	149183	5
1835	238569	4
1835	690765	1
1835	278562	2
1836	602951	2
1836	316097	5
1836	118277	3
1836	622500	5
1837	354619	3
1837	349129	4
1838	319977	4
1838	322677	4
1839	690765	5
1839	537539	5
1839	209180	1
1840	404719	4
1840	727024	2
1840	296215	4
1841	537539	3
1841	296215	1
1842	118277	5
1842	565245	2
1842	238569	3
1842	727024	2
1842	476299	2
1843	584502	3
1844	150181	4
1844	617776	4
1844	591311	3
1844	316097	3
1845	727024	4
1845	160692	3
1845	640479	5
1845	540828	3
1846	278562	3
1847	325139	3
1847	551320	2
1847	560017	3
1847	278562	2
1847	712605	2
1847	476299	3
1848	591311	4
1848	118277	3
1848	123036	1
1848	169537	5
1849	676078	5
1849	169537	2
1849	591311	3
1849	123036	3
1849	752387	4
1850	319977	4
1850	560017	2
1850	591311	4
1851	349129	2
1851	238569	4
1851	209180	3
1852	149183	1
1852	752387	1
1852	617776	4
1852	640479	2
1853	343041	4
1853	354619	2
1853	752387	1
1853	537539	2
1853	584502	4
1854	464331	2
1854	749887	4
1854	712605	2
1854	118277	4
1855	729979	2
1855	712605	5
1855	349129	3
1855	657852	4
1856	150181	1
1856	118277	3
1856	602951	2
1856	712605	4
1856	160692	4
1857	296215	2
1857	325139	4
1858	540828	1
1858	322677	2
1858	663789	1
1858	149183	3
1858	354619	5
1858	319977	3
1859	591311	2
1859	765884	3
1859	560017	2
1860	712605	4
1860	476299	4
1860	727024	4
1860	540828	4
1860	214399	4
1860	676078	3
1861	584502	1
1861	383805	2
1861	296215	2
1862	464331	5
1862	560017	3
1862	657852	2
1862	150161	2
1862	404719	4
1862	565245	3
1863	617776	1
1863	209180	1
1863	149183	2
1864	278562	2
1864	752387	1
1864	316097	4
1864	404719	4
1864	749887	2
1865	676078	4
1865	238569	2
1865	663789	4
1866	602951	2
1866	584502	3
1867	663789	2
1868	540828	4
1869	676078	3
1869	551320	2
1869	560017	2
1870	349129	2
1871	727024	1
1871	663789	2
1871	150161	2
1872	214399	3
1872	663789	3
1872	727024	3
1873	663789	5
1873	752387	3
1873	149183	4
1873	214399	5
1874	617776	1
1875	494940	4
1875	325139	4
1875	591311	5
1876	319977	4
1876	765884	3
1876	325139	1
1876	663789	4
1877	238569	2
1877	349129	3
1877	150161	3
1877	209180	2
1877	565245	3
1878	322677	5
1878	727024	4
1878	169537	2
1879	752387	2
1879	540828	2
1879	560017	2
1879	160692	5
1879	565245	1
1879	551320	2
1880	319977	2
1880	343041	1
1881	343041	5
1881	278562	2
1881	123036	3
1881	680088	2
1881	749887	1
1881	169537	3
1882	662181	2
1882	676078	2
1882	765884	5
1882	343041	2
1882	617776	2
1882	349129	3
1883	662181	5
1883	690765	1
1884	226251	5
1885	749887	5
1885	676078	2
1886	494940	2
1886	169537	4
1886	343041	2
1887	349129	1
1887	316097	4
1887	551320	3
1887	123036	5
1887	494940	3
1888	690765	2
1888	602951	2
1888	404719	2
1889	752387	4
1889	551320	2
1889	296215	2
1889	349129	4
1890	149183	4
1890	749887	5
1890	209180	2
1891	296215	2
1891	404719	2
1891	617776	2
1892	302850	2
1892	319977	2
1892	343041	2
1892	238569	3
1892	690765	5
1892	354619	5
1893	296215	1
1893	149183	4
1893	160692	3
1893	302850	4
1893	565245	4
1893	551320	5
1894	476299	3
1894	584502	1
1894	676078	2
1894	118277	5
1894	226251	2
1894	565245	4
1895	712605	4
1895	749887	3
1895	776626	5
1895	640479	2
1895	149183	2
1895	690765	1
1896	662181	1
1896	123036	2
1896	712605	4
1896	494940	2
1896	676078	4
1896	354619	1
1897	209180	4
1897	617776	5
1897	343041	5
1898	354619	4
1899	349129	2
1899	296215	3
1899	776626	1
1900	662181	2
1900	149183	4
1900	325139	3
1900	540828	2
1900	551320	2
1901	640479	5
1901	776626	2
1902	729979	2
1902	676078	4
1902	325139	5
1902	404719	5
1902	565245	3
1902	319977	2
1903	214399	4
1903	226251	3
1903	296215	5
1903	349129	5
1903	591311	4
1903	560017	1
1904	319977	2
1904	150181	1
1904	316097	5
1904	776626	4
1904	537539	4
1905	209180	2
1905	712605	4
1905	765884	1
1906	322677	4
1906	551320	2
1906	776626	4
1906	662181	2
1906	319977	1
1907	540828	4
1907	765884	2
1907	676078	3
1907	712605	2
1907	464331	1
1908	662181	4
1908	617776	1
1908	322677	1
1908	729979	2
1908	383805	5
1909	209180	1
1910	354619	5
1910	617776	4
1910	325139	5
1910	537539	4
1910	343041	3
1910	150161	4
1911	296215	4
1911	657852	4
1911	540828	1
1911	776626	4
1912	690765	5
1912	476299	1
1913	729979	2
1913	302850	3
1914	565245	4
1914	209180	3
1915	214399	3
1915	752387	3
1915	712605	5
1915	617776	5
1916	118277	4
1916	325139	2
1916	319977	3
1916	662181	2
1916	622500	2
1916	602951	2
1917	662181	2
1917	776626	5
1918	476299	3
1918	690765	2
1918	622500	2
1918	209180	4
1918	540828	2
1919	729979	4
1919	238569	5
1919	776626	3
1920	640479	2
1920	765884	3
1920	540828	3
1921	296215	2
1921	343041	2
1921	657852	4
1922	712605	2
1923	150161	1
1923	729979	3
1923	149183	5
1923	296215	1
1924	150181	4
1924	584502	4
1924	349129	3
1924	680088	5
1924	663789	2
1925	537539	3
1926	123036	4
1926	150161	3
1926	584502	4
1926	622500	2
1926	640479	1
1927	296215	3
1927	540828	4
1927	169537	5
1927	302850	2
1927	727024	2
1928	343041	4
1929	640479	1
1929	325139	4
1929	494940	2
1929	749887	4
1930	690765	1
1930	584502	3
1930	214399	2
1931	214399	4
1931	464331	2
1932	383805	3
1932	765884	3
1932	160692	5
1932	118277	3
1933	622500	5
1933	584502	2
1933	322677	4
1933	383805	4
1934	727024	2
1934	238569	5
1934	123036	2
1934	296215	4
1935	149183	2
1935	476299	4
1935	662181	4
1936	602951	5
1936	354619	4
1936	776626	4
1936	226251	4
1937	226251	3
1937	150181	3
1937	150161	3
1937	404719	5
1937	591311	3
1938	296215	4
1938	622500	5
1938	343041	4
1938	680088	2
1939	169537	2
1940	316097	1
1940	238569	4
1940	657852	2
1940	150161	3
1940	663789	3
1941	617776	4
1941	727024	4
1942	565245	1
1942	617776	5
1943	776626	2
1943	383805	2
1944	712605	2
1944	662181	4
1944	690765	2
1944	663789	1
1945	464331	4
1945	319977	5
1945	776626	5
1946	622500	4
1946	464331	3
1946	160692	4
1946	316097	3
1946	584502	3
1946	537539	2
1947	476299	2
1947	584502	3
1947	354619	1
1947	150181	2
1947	149183	3
1948	343041	5
1948	319977	3
1948	123036	1
1948	302850	4
1949	150161	3
1949	591311	2
1949	316097	4
1949	657852	3
1949	383805	3
1950	657852	3
1950	302850	3
1951	729979	4
1951	169537	5
1951	383805	5
1951	464331	2
1952	404719	4
1952	657852	5
1952	123036	5
1953	551320	2
1953	169537	2
1953	537539	2
1953	123036	2
1953	319977	2
1953	343041	4
1954	316097	1
1955	551320	1
1955	663789	4
1956	476299	3
1956	296215	4
1956	662181	5
1957	776626	5
1957	560017	5
1957	319977	4
1957	169537	3
1958	354619	3
1958	404719	2
1958	551320	5
1958	494940	4
1959	150181	2
1959	149183	3
1959	690765	3
1959	238569	4
1959	169537	1
1959	727024	1
1960	118277	3
1960	319977	2
1961	662181	1
1961	640479	2
1961	690765	2
1962	776626	1
1962	752387	4
1962	123036	4
1963	765884	5
1964	680088	3
1965	776626	3
1965	322677	3
1965	591311	4
1965	404719	4
1965	383805	2
1965	464331	4
1966	551320	5
1966	540828	1
1967	322677	4
1967	150161	1
1967	662181	4
1968	565245	3
1968	214399	3
1968	123036	2
1968	319977	3
1968	591311	2
1968	238569	4
1969	476299	1
1969	150161	4
1970	729979	5
1970	383805	3
1970	149183	3
1971	752387	1
1971	123036	4
1971	349129	5
1972	226251	4
1972	657852	4
1972	551320	2
1972	565245	5
1972	765884	4
1973	464331	1
1973	776626	2
1973	727024	2
1973	565245	4
1974	464331	3
1974	118277	3
1974	602951	3
1974	150161	2
1974	663789	3
1975	325139	2
1975	622500	5
1976	622500	4
1976	476299	2
1976	765884	5
1976	209180	4
1977	150181	4
1978	765884	2
1978	464331	4
1978	149183	2
1978	537539	4
1978	749887	5
1979	765884	3
1979	319977	3
1980	150161	4
1981	214399	3
1981	749887	4
1981	209180	4
1981	325139	5
1982	662181	5
1982	354619	4
1982	150181	3
1982	690765	3
1983	325139	2
1983	238569	4
1983	278562	5
1984	226251	5
1984	325139	4
1984	622500	2
1984	169537	1
1985	319977	2
1985	123036	3
1986	160692	3
1986	296215	3
1987	296215	4
1987	476299	4
1988	238569	4
1988	343041	3
1988	752387	2
1989	494940	2
1989	123036	4
1989	680088	3
1989	278562	4
1989	584502	4
1990	617776	4
1990	662181	3
1990	302850	1
1990	322677	4
1990	214399	3
1990	354619	1
1991	150161	1
1991	302850	5
1991	640479	4
1992	302850	3
1993	494940	4
1993	622500	5
1993	214399	2
1993	383805	3
1993	169537	1
1994	657852	2
1994	383805	3
1994	322677	1
1994	404719	3
1994	214399	5
1995	404719	3
1995	640479	2
1995	209180	4
1996	476299	1
1997	494940	3
1997	150161	4
1997	476299	1
1998	476299	2
1998	640479	1
1998	560017	5
1998	325139	3
1998	160692	1
1998	150161	4
1999	169537	1
1999	602951	3
1999	226251	1
1999	584502	2
2000	238569	1
2000	776626	3
2000	662181	3
2000	565245	3
2000	160692	3
2000	617776	3
2001	150181	4
2001	226251	1
2001	404719	4
2002	349129	2
2002	226251	1
2002	602951	2
2002	776626	2
2002	584502	2
2003	214399	2
2004	150181	5
2004	150161	2
2004	118277	3
2004	690765	5
2005	238569	2
2006	322677	3
2006	662181	4
2006	118277	4
2007	662181	4
2007	776626	4
2007	560017	4
2008	316097	4
2008	349129	4
2008	551320	4
2008	118277	4
2009	464331	4
2009	680088	4
2009	690765	3
2009	354619	2
2009	476299	2
2010	662181	4
2010	640479	3
2011	238569	5
2011	537539	3
2011	765884	1
2012	584502	2
2012	749887	2
2012	494940	4
2012	354619	1
2013	464331	2
2013	494940	2
2013	663789	2
2013	765884	5
2013	404719	4
2013	476299	5
2014	752387	4
2014	325139	3
2014	560017	4
2014	404719	5
2014	464331	2
2015	238569	2
2015	123036	4
2015	316097	2
2016	537539	1
2016	560017	4
2016	602951	2
2016	209180	5
2016	622500	3
2016	160692	5
2017	404719	2
2018	325139	3
2018	657852	1
2018	584502	3
2018	316097	2
2019	640479	3
2019	123036	1
2020	278562	2
2020	657852	2
2020	214399	4
2021	354619	1
2021	383805	3
2021	316097	2
2021	296215	3
2022	316097	1
2022	551320	5
2022	617776	2
2022	343041	4
2022	494940	3
2022	540828	1
2023	150181	3
2023	537539	1
2023	680088	4
2023	349129	4
2024	537539	4
2024	464331	4
2024	226251	3
2024	663789	4
2024	551320	4
2024	476299	5
2025	476299	3
2025	584502	4
2026	343041	5
2026	776626	4
2027	662181	3
2027	749887	3
2027	537539	4
2027	278562	3
2028	776626	3
2028	238569	4
2028	278562	1
2028	150181	2
2028	729979	2
2029	278562	3
2029	343041	1
2029	537539	2
2029	676078	2
2029	584502	4
2029	464331	2
2030	238569	5
2030	319977	4
2030	118277	4
2031	160692	3
2031	150161	2
2031	238569	5
2031	617776	2
2031	729979	5
2031	118277	3
2032	662181	4
2032	540828	3
2032	494940	4
2032	169537	5
2032	150161	3
2033	476299	4
2033	118277	3
2033	464331	2
2033	150181	2
2033	238569	5
2034	765884	2
2034	169537	3
2035	617776	2
2035	296215	5
2035	537539	4
2036	316097	4
2036	690765	2
2036	150161	5
2036	591311	5
2036	354619	5
2036	729979	2
2037	776626	2
2037	676078	3
2037	123036	3
2038	383805	2
2038	404719	4
2038	591311	4
2038	278562	2
2038	160692	5
2039	214399	1
2039	565245	2
2039	690765	4
2039	676078	3
2040	209180	4
2040	617776	4
2040	302850	2
2040	278562	3
2040	150181	4
2041	617776	2
2041	776626	1
2042	383805	4
2042	209180	3
2042	729979	2
2042	296215	2
2042	160692	2
2043	238569	5
2043	622500	4
2043	494940	3
2043	209180	1
2043	316097	4
2044	349129	3
2044	680088	1
2044	617776	3
2044	690765	2
2045	591311	1
2045	316097	3
2045	584502	4
2045	765884	2
2046	476299	5
2046	278562	2
2046	296215	4
2046	662181	2
2046	622500	2
2047	404719	1
2048	765884	3
2048	118277	4
2049	322677	4
2049	765884	3
2049	325139	4
2050	160692	2
2050	383805	4
2050	316097	2
2050	729979	1
2051	727024	2
2051	226251	4
2051	749887	3
2052	383805	5
2052	560017	4
2052	680088	2
2053	776626	4
2053	296215	4
2053	278562	4
2053	591311	4
2053	565245	4
2053	383805	2
2054	537539	2
2054	316097	3
2054	325139	2
2054	383805	2
2055	676078	2
2055	149183	3
2055	765884	5
2055	214399	3
2056	149183	1
2056	617776	2
2056	729979	3
2056	169537	4
2056	727024	5
2057	150181	1
2057	565245	3
2057	354619	2
2057	690765	4
2057	591311	3
2058	662181	2
2058	776626	5
2058	278562	1
2058	690765	4
2058	325139	3
2059	214399	2
2059	690765	2
2059	680088	3
2060	302850	3
2060	617776	2
2060	238569	3
2060	765884	3
2060	565245	1
2061	494940	4
2061	325139	3
2061	149183	4
2062	537539	3
2062	349129	4
2062	160692	4
2062	322677	5
2063	752387	4
2063	640479	3
2063	476299	2
2064	226251	3
2064	150181	2
2064	617776	3
2064	640479	2
2064	123036	4
2064	727024	4
2065	476299	1
2065	640479	2
2065	150181	5
2065	537539	3
2065	316097	4
2066	712605	3
2066	676078	5
2066	640479	2
2066	657852	5
2066	209180	1
2066	354619	2
2067	238569	2
2067	749887	3
2067	118277	4
2067	663789	3
2067	657852	3
2068	494940	2
2068	617776	4
2068	296215	1
2068	476299	4
2068	540828	1
2069	316097	1
2069	296215	3
2070	663789	2
2070	160692	5
2070	640479	4
2070	322677	4
2071	476299	1
2071	729979	2
2071	150161	5
2072	160692	3
2072	551320	2
2073	226251	3
2073	676078	4
2074	476299	2
2074	209180	3
2074	602951	3
2075	622500	2
2075	349129	1
2076	749887	4
2076	494940	2
2076	150161	3
2076	537539	2
2076	676078	3
2077	662181	2
2077	640479	4
2077	676078	1
2077	209180	4
2078	383805	3
2078	565245	2
2078	354619	4
2079	584502	2
2079	712605	2
2079	118277	3
2079	662181	3
2079	749887	5
2080	676078	2
2080	729979	2
2081	494940	2
2081	565245	4
2081	319977	1
2082	729979	4
2082	296215	4
2082	343041	4
2083	565245	3
2084	169537	4
2084	322677	1
2084	118277	5
2084	149183	1
2085	494940	2
2085	663789	3
2086	343041	5
2086	296215	2
2086	776626	3
2086	752387	1
2086	354619	3
2086	150181	3
2087	729979	3
2087	325139	1
2087	343041	4
2087	617776	3
2087	238569	3
2087	214399	4
2088	662181	2
2088	727024	2
2088	680088	3
2088	296215	5
2089	169537	4
2089	226251	2
2089	551320	3
2089	617776	5
2089	690765	3
2089	322677	2
2090	150181	2
2090	383805	1
2091	238569	4
2091	404719	4
2091	680088	2
2092	278562	3
2092	325139	2
2093	560017	4
2093	319977	3
2093	663789	3
2093	464331	4
2093	123036	4
2093	776626	1
2094	565245	4
2094	560017	3
2094	476299	4
2094	238569	3
2095	640479	4
2095	354619	4
2095	278562	2
2095	238569	4
2096	118277	3
2096	349129	4
2096	540828	5
2096	278562	2
2097	727024	1
2097	226251	4
2098	776626	2
2098	551320	2
2098	214399	4
2099	209180	4
2100	657852	3
2100	238569	4
2100	302850	1
2100	640479	3
2101	540828	2
2101	476299	4
2101	209180	5
2101	278562	1
2102	383805	3
2102	540828	3
2102	657852	3
2102	537539	5
2103	343041	3
2103	150181	3
2103	663789	1
2104	150181	3
2104	662181	5
2104	640479	3
2104	776626	3
2104	749887	4
2104	622500	4
2105	729979	1
2105	343041	3
2106	404719	2
2106	565245	1
2107	404719	3
2107	476299	3
2107	169537	1
2108	540828	2
2108	150181	4
2108	476299	3
2109	551320	3
2109	150161	3
2110	584502	1
2110	657852	1
2110	494940	4
2110	404719	3
2110	662181	3
2111	663789	2
2111	494940	1
2111	319977	3
2111	354619	4
2112	640479	5
2112	209180	4
2112	565245	3
2113	169537	3
2113	149183	4
2113	591311	2
2113	238569	1
2114	565245	1
2114	776626	2
2114	123036	4
2114	537539	1
2115	663789	2
2115	169537	1
2115	551320	5
2115	214399	3
2115	776626	4
2116	680088	3
2116	464331	3
2117	540828	5
2117	316097	4
2118	325139	4
2118	149183	3
2118	537539	5
2118	617776	4
2119	238569	5
2119	752387	2
2119	540828	5
2120	680088	5
2120	404719	3
2120	776626	2
2120	316097	4
2120	540828	3
2121	749887	3
2121	319977	3
2121	322677	4
2121	540828	2
2122	712605	4
2122	622500	3
2122	476299	4
2122	640479	5
2122	296215	1
2123	149183	4
2123	676078	2
2124	727024	2
2124	383805	1
2124	316097	1
2124	765884	4
2125	160692	2
2125	354619	3
2126	169537	4
2126	118277	4
2126	712605	4
2126	551320	2
2126	404719	2
2127	464331	5
2127	160692	4
2127	584502	5
2127	123036	3
2127	712605	3
2128	591311	2
2129	765884	3
2129	776626	3
2129	209180	1
2130	296215	4
2130	494940	2
2130	150161	1
2130	464331	1
2130	749887	3
2130	560017	5
2131	149183	4
2131	383805	3
2132	316097	3
2132	765884	4
2132	565245	3
2132	404719	4
2132	322677	5
2133	676078	5
2133	226251	4
2134	680088	5
2134	765884	3
2134	690765	4
2134	349129	3
2135	551320	2
2135	712605	5
2135	540828	4
2136	349129	5
2136	150161	3
2136	622500	3
2137	150181	2
2137	118277	2
2137	729979	2
2137	640479	4
2137	123036	3
2138	617776	4
2138	602951	4
2139	584502	3
2139	551320	3
2139	343041	1
2139	150181	3
2140	316097	3
2140	752387	4
2140	765884	3
2140	727024	1
2140	551320	3
2141	749887	3
2141	118277	2
2141	349129	5
2141	322677	2
2142	214399	5
2142	150181	3
2142	209180	2
2142	123036	2
2143	316097	2
2143	657852	3
2143	622500	4
2143	160692	4
2144	752387	4
2144	551320	2
2144	349129	3
2145	712605	4
2146	540828	2
2146	404719	3
2146	591311	2
2146	663789	1
2146	565245	1
2147	325139	4
2147	354619	5
2147	296215	4
2147	640479	2
2147	729979	4
2147	540828	1
2148	680088	3
2148	319977	3
2148	316097	3
2148	640479	1
2148	537539	4
2149	591311	5
2149	494940	4
2150	565245	1
2150	560017	4
2151	343041	5
2151	537539	5
2151	622500	5
2152	238569	5
2152	749887	4
2152	316097	4
2152	657852	3
2152	325139	3
2152	209180	4
2153	727024	3
2153	343041	5
2153	494940	5
2154	118277	2
2154	565245	4
2154	662181	3
2154	765884	2
2155	226251	2
2155	354619	3
2155	123036	5
2156	560017	5
2157	617776	3
2157	149183	5
2157	752387	3
2157	160692	2
2157	118277	4
2158	296215	4
2158	727024	2
2158	118277	1
2159	296215	2
2159	537539	3
2160	617776	2
2160	752387	2
2160	343041	2
2160	729979	4
2161	676078	3
2161	296215	3
2161	278562	4
2162	404719	1
2162	476299	1
2162	540828	3
2163	690765	2
2163	149183	4
2163	209180	2
2164	662181	5
2164	776626	2
2164	325139	4
2165	278562	3
2165	322677	1
2166	662181	2
2166	404719	4
2167	622500	2
2168	749887	1
2168	560017	3
2168	776626	4
2168	322677	1
2168	238569	5
2169	316097	3
2169	343041	4
2169	354619	4
2169	729979	4
2170	214399	4
2170	729979	2
2170	551320	5
2170	749887	4
2170	565245	4
2171	383805	2
2171	663789	1
2171	404719	3
2171	123036	2
2172	537539	1
2172	464331	5
2173	729979	1
2173	776626	3
2173	319977	3
2173	752387	4
2173	602951	3
2173	537539	5
2174	680088	5
2174	565245	4
2174	676078	3
2175	776626	3
2175	680088	3
2176	316097	5
2176	169537	4
2176	322677	4
2177	354619	4
2178	676078	4
2178	680088	2
2178	584502	3
2178	729979	3
2178	591311	4
2178	302850	3
2179	354619	4
2179	663789	3
2179	226251	4
2179	537539	2
2180	584502	4
2180	729979	2
2181	296215	2
2181	680088	4
2181	765884	1
2181	354619	4
2181	123036	1
2181	560017	5
2182	560017	5
2182	729979	3
2182	749887	2
2182	319977	2
2182	464331	2
2182	118277	3
2183	622500	4
2183	690765	3
2183	123036	1
2183	404719	5
2183	537539	2
2184	209180	2
2184	729979	4
2184	150161	3
2184	537539	4
2184	404719	5
2185	494940	3
2185	476299	4
2185	169537	2
2185	584502	4
2185	404719	4
2186	169537	4
2187	591311	2
2187	278562	2
2187	296215	2
2187	676078	1
2187	584502	4
2187	169537	5
2188	591311	4
2188	160692	4
2189	226251	4
2190	494940	4
2190	160692	4
2190	622500	4
2190	383805	3
2191	209180	3
2191	169537	2
2191	302850	3
2191	349129	2
2191	584502	2
2192	749887	4
2192	622500	5
2193	622500	3
2193	123036	2
2193	676078	4
2193	560017	4
2193	540828	3
2194	214399	5
2194	149183	2
2194	690765	4
2194	296215	4
2194	316097	4
2195	617776	4
2195	464331	2
2195	602951	2
2195	209180	2
2196	712605	4
2196	150161	1
2196	278562	5
2196	680088	3
2196	565245	3
2196	322677	2
2197	150161	5
2197	776626	2
2198	565245	4
2198	343041	4
2198	150181	3
2198	383805	4
2199	325139	3
2199	464331	3
2199	690765	5
2199	752387	5
2200	622500	1
2200	349129	3
2200	238569	2
2200	776626	1
2200	302850	4
2200	150181	5
2201	776626	2
2201	118277	3
2201	160692	5
2201	238569	3
2201	464331	3
2201	680088	1
2202	316097	4
2203	622500	3
2203	354619	4
2203	680088	3
2204	316097	1
2204	537539	1
2204	662181	2
2205	169537	3
2205	123036	2
2206	150161	4
2206	729979	3
2206	680088	3
2207	776626	1
2207	476299	2
2207	278562	3
2208	657852	2
2208	560017	2
2209	776626	2
2209	565245	5
2209	169537	1
2210	663789	2
2210	584502	4
2210	752387	3
2211	680088	1
2211	226251	3
2211	584502	2
2211	765884	5
2212	584502	5
2212	729979	4
2212	622500	2
2212	676078	2
2213	316097	4
2213	302850	5
2214	551320	4
2214	749887	3
2214	354619	2
2215	676078	3
2215	591311	3
2215	749887	4
2215	349129	3
2216	149183	5
2216	676078	2
2216	591311	2
2217	663789	5
2217	640479	3
2217	591311	3
2217	752387	5
2218	560017	2
2218	150181	2
2219	640479	4
2219	160692	4
2220	343041	4
2220	160692	4
2221	663789	2
2221	325139	2
2222	776626	5
2222	765884	4
2222	343041	3
2223	591311	5
2223	657852	1
2224	464331	5
2224	752387	1
2224	565245	1
2224	226251	2
2225	149183	4
2225	551320	5
2225	663789	1
2225	729979	3
2225	343041	4
2226	749887	2
2226	663789	3
2227	123036	2
2227	776626	3
2227	729979	2
2227	383805	1
2227	150181	1
2227	752387	1
2228	319977	1
2228	591311	3
2228	476299	4
2229	464331	5
2229	150181	3
2229	149183	1
2229	354619	4
2229	302850	3
2230	476299	2
2230	727024	3
2230	680088	4
2230	383805	1
2230	591311	5
2231	238569	4
2231	712605	3
2231	343041	4
2231	214399	3
2231	494940	2
2232	464331	5
2232	729979	2
2232	322677	2
2233	765884	5
2233	238569	4
2233	591311	2
2233	776626	1
2234	118277	4
2234	343041	5
2234	160692	5
2234	537539	4
2234	729979	3
2235	316097	2
2235	476299	2
2236	123036	2
2236	591311	1
2236	765884	2
2237	729979	3
2237	343041	4
2237	749887	5
2238	765884	2
2238	565245	4
2238	591311	4
2238	602951	2
2238	749887	5
2239	591311	4
2239	209180	2
2239	354619	3
2239	537539	3
2239	322677	4
2240	383805	3
2240	749887	4
2240	160692	2
2240	494940	2
2240	404719	3
2240	150161	2
2241	712605	3
2241	617776	3
2241	640479	3
2241	209180	2
2241	296215	5
2242	776626	1
2242	354619	4
2242	537539	3
2242	663789	5
2243	354619	5
2243	160692	2
2243	343041	4
2243	676078	1
2243	209180	2
2244	663789	1
2244	591311	5
2244	209180	3
2245	319977	3
2245	214399	4
2245	676078	2
2245	765884	2
2246	349129	5
2246	680088	3
2247	149183	3
2247	226251	2
2247	494940	3
2247	540828	5
2248	640479	3
2248	319977	3
2248	690765	1
2249	727024	3
2249	591311	2
2249	322677	5
2250	226251	2
2250	680088	3
2250	617776	4
2251	169537	3
2252	238569	2
2252	160692	3
2252	322677	5
2252	302850	5
2252	729979	1
2252	149183	3
2253	657852	2
2253	662181	5
2254	776626	3
2254	322677	3
2254	319977	1
2254	727024	2
2254	690765	3
2254	118277	1
2255	551320	2
2255	663789	2
2256	537539	4
2256	622500	4
2256	150161	2
2256	690765	2
2256	349129	3
2257	662181	5
2257	343041	2
2257	765884	3
2257	149183	5
2258	657852	2
2258	560017	3
2258	776626	3
2259	149183	2
2259	690765	5
2260	537539	5
2261	226251	4
2261	214399	3
2261	565245	3
2261	354619	2
2261	149183	2
2261	209180	2
2262	349129	3
2262	676078	3
2262	776626	2
2262	226251	4
2262	316097	1
2263	383805	5
2263	404719	1
2263	278562	2
2263	591311	2
2264	354619	4
2264	765884	5
2264	296215	4
2264	349129	1
2265	278562	4
2265	662181	3
2266	316097	5
2266	712605	3
2266	169537	2
2267	354619	5
2267	238569	1
2267	322677	2
2267	690765	4
2267	537539	3
2267	169537	2
2268	765884	2
2268	209180	4
2269	343041	3
2270	476299	1
2271	404719	3
2271	662181	5
2272	169537	3
2272	602951	4
2273	560017	4
2273	617776	4
2273	354619	3
2274	657852	4
2274	238569	3
2275	169537	1
2275	657852	5
2275	584502	5
2275	150161	3
2276	319977	4
2276	752387	3
2277	296215	5
2277	690765	4
2278	537539	4
2278	565245	5
2278	150161	5
2279	584502	4
2279	551320	4
2279	727024	3
2279	464331	3
2280	712605	2
2280	591311	4
2280	476299	3
2280	296215	2
2281	551320	1
2281	383805	4
2281	657852	4
2281	476299	3
2281	565245	3
2282	584502	4
2282	150181	2
2282	238569	3
2282	560017	1
2282	343041	4
2283	214399	2
2283	278562	1
2283	749887	3
2284	676078	1
2284	584502	3
2284	752387	1
2284	319977	3
2284	150161	3
2284	622500	4
2285	278562	1
2285	657852	4
2286	591311	2
2286	150161	4
2286	209180	4
2286	690765	2
2286	676078	1
2286	617776	4
2287	123036	4
2287	690765	3
2288	663789	4
2288	118277	4
2288	752387	1
2288	690765	2
2288	238569	1
2289	118277	3
2289	657852	4
2289	325139	2
2289	640479	2
2289	560017	1
2290	404719	1
2290	322677	3
2290	278562	2
2290	150161	4
2291	209180	4
2291	354619	2
2291	712605	1
2291	150181	3
2292	160692	1
2292	150181	3
2292	617776	4
2292	591311	3
2293	476299	3
2293	662181	3
2293	296215	5
2293	749887	4
2294	383805	5
2294	322677	3
2294	765884	4
2294	150181	1
2294	591311	4
2294	296215	2
2295	214399	3
2295	209180	4
2295	712605	4
2295	226251	5
2295	149183	3
2296	123036	4
2296	278562	1
2296	349129	3
2297	551320	2
2297	676078	2
2297	560017	3
2297	776626	3
2298	565245	4
2298	537539	4
2299	343041	2
2299	278562	5
2299	160692	2
2299	640479	2
2300	560017	5
2300	149183	1
2300	150161	3
2300	565245	2
2300	118277	2
2301	319977	4
2302	729979	4
2302	591311	3
2303	238569	1
2303	776626	3
2304	565245	2
2304	676078	2
2304	349129	4
2305	354619	3
2306	602951	2
2306	727024	2
2307	727024	4
2307	602951	4
2308	343041	5
2308	226251	1
2309	622500	4
2309	676078	4
2309	238569	1
2309	765884	2
2310	226251	5
2310	560017	4
2310	712605	5
2310	464331	2
2310	640479	1
2311	214399	3
2311	325139	4
2311	776626	4
2311	727024	2
2312	404719	4
2312	354619	4
2312	349129	1
2313	640479	2
2313	657852	4
2313	149183	3
2314	565245	3
2314	752387	1
2314	537539	2
2314	322677	3
2314	278562	3
2315	712605	2
2315	214399	3
2316	752387	1
2316	676078	5
2316	316097	4
2316	319977	4
2317	238569	2
2317	640479	2
2318	640479	3
2318	657852	5
2318	118277	1
2318	160692	1
2318	150181	2
2319	712605	2
2319	150161	5
2319	727024	2
2319	123036	4
2320	690765	4
2320	765884	3
2320	494940	3
2320	209180	4
2320	383805	3
2321	325139	2
2321	383805	1
2321	565245	4
2321	150181	1
2322	354619	5
2322	776626	4
2322	537539	4
2323	622500	5
2323	560017	5
2323	325139	2
2323	729979	5
2324	476299	2
2324	680088	4
2324	765884	5
2324	540828	3
2324	150181	4
2325	752387	1
2325	383805	4
2325	537539	2
2325	118277	2
2325	690765	1
2326	776626	1
2326	663789	1
2327	591311	4
2327	464331	2
2327	765884	5
2327	476299	4
2327	150161	4
2328	214399	2
2328	476299	3
2328	118277	4
2329	727024	3
2329	160692	2
2329	690765	4
2329	343041	2
2330	622500	3
2330	150161	4
2330	160692	4
2331	316097	5
2332	343041	3
2333	560017	2
2333	226251	2
2333	404719	3
2333	752387	1
2333	602951	4
2334	749887	4
2334	680088	3
2334	149183	2
2334	325139	4
2334	662181	4
2334	776626	5
2335	551320	5
2335	540828	4
2336	657852	4
2336	354619	1
2336	349129	2
2337	302850	1
2337	640479	2
2337	752387	1
2338	752387	2
2338	316097	4
2339	476299	2
2339	690765	3
2340	209180	5
2340	749887	3
2340	752387	5
2340	278562	3
2340	676078	3
2341	150161	4
2341	676078	3
2341	238569	3
2341	349129	4
2341	226251	3
2341	622500	1
2342	690765	5
2342	584502	3
2342	476299	4
2342	776626	4
2343	214399	3
2343	226251	5
2343	404719	4
2343	149183	5
2343	676078	3
2344	727024	1
2344	494940	2
2344	640479	5
2345	640479	4
2345	238569	3
2346	657852	5
2346	765884	3
2347	591311	3
2347	226251	3
2347	690765	2
2348	602951	2
2348	680088	1
2348	690765	3
2348	325139	2
2349	560017	4
2349	476299	4
2349	383805	2
2349	537539	2
2350	316097	1
2350	712605	1
2350	727024	3
2351	663789	2
2351	476299	4
2351	322677	2
2352	494940	4
2352	729979	3
2352	551320	3
2352	322677	4
2352	404719	2
2352	169537	4
2353	663789	2
2353	319977	2
2353	383805	3
2353	296215	2
2353	540828	4
2354	662181	5
2354	319977	2
2354	238569	4
2354	160692	3
2355	404719	1
2355	226251	2
2355	551320	4
2356	749887	5
2356	565245	2
2357	343041	4
2358	712605	2
2358	676078	4
2358	537539	4
2358	464331	3
2359	464331	3
2359	537539	4
2359	551320	3
2359	727024	2
2359	662181	4
2360	150161	2
2360	676078	1
2361	752387	3
2362	404719	3
2362	602951	4
2362	354619	2
2362	584502	4
2363	591311	3
2363	676078	3
2363	383805	1
2363	749887	3
2363	565245	4
2364	765884	3
2364	712605	2
2364	319977	2
2364	537539	3
2364	640479	3
2364	662181	3
2365	296215	5
2365	591311	3
2365	640479	4
2365	150161	1
2365	729979	3
2366	169537	2
2366	657852	3
2366	214399	2
2367	169537	2
2367	551320	1
2367	622500	3
2367	214399	1
2368	663789	2
2368	209180	4
2368	296215	3
2368	278562	5
2369	565245	2
2369	226251	1
2370	657852	5
2370	464331	2
2371	727024	4
2371	622500	5
2371	123036	2
2371	749887	5
2371	316097	2
2372	123036	5
2373	354619	2
2373	404719	4
2374	349129	4
2374	278562	2
2374	160692	4
2374	319977	3
2374	662181	3
2375	214399	2
2376	729979	3
2376	560017	1
2376	383805	3
2376	464331	1
2376	690765	4
2377	676078	3
2377	296215	2
2377	214399	4
2378	343041	2
2378	226251	2
2378	238569	3
2379	302850	2
2379	160692	3
2379	749887	1
2380	680088	5
2380	617776	4
2380	349129	3
2380	663789	2
2380	214399	3
2381	464331	3
2381	316097	2
2381	617776	1
2381	296215	4
2381	325139	3
2382	560017	3
2382	602951	1
2383	640479	4
2383	560017	4
2384	464331	1
2384	676078	3
2384	622500	2
2385	404719	4
2385	149183	4
2385	383805	3
2385	712605	2
2385	123036	5
2386	319977	5
2386	494940	4
2386	676078	3
2386	729979	2
2386	325139	2
2386	776626	3
2387	354619	4
2387	325139	1
2387	602951	3
2387	278562	3
2387	160692	4
2387	150161	5
2388	150161	5
2389	640479	2
2389	118277	2
2390	209180	4
2390	565245	1
2390	349129	4
2390	540828	3
2391	584502	5
2391	690765	5
2392	565245	3
2392	354619	4
2392	560017	3
2393	560017	1
2393	662181	2
2394	765884	2
2394	214399	4
2395	404719	5
2395	551320	3
2395	476299	1
2396	712605	2
2396	676078	3
2397	591311	2
2398	322677	5
2398	663789	4
2398	676078	4
2399	591311	1
2400	150161	5
2400	149183	4
2400	278562	4
2400	349129	2
2401	712605	4
2401	160692	1
2401	729979	4
2401	169537	5
2401	118277	5
2401	319977	2
2402	316097	2
2402	319977	3
2402	169537	4
2403	690765	2
2403	302850	1
2403	712605	4
2404	540828	4
2404	680088	2
2404	765884	1
2405	169537	3
2405	209180	3
2405	476299	4
2405	622500	5
2406	150181	2
2406	160692	3
2406	123036	1
2406	676078	2
2407	729979	1
2407	169537	2
2407	226251	2
2407	238569	1
2407	149183	2
2408	622500	2
2408	349129	4
2408	278562	1
2408	226251	5
2408	343041	4
2409	712605	1
2409	676078	3
2410	622500	2
2410	209180	2
2410	354619	1
2411	349129	2
2411	729979	4
2411	209180	4
2411	343041	1
2411	551320	5
2411	537539	2
2412	209180	5
2412	354619	3
2412	238569	4
2412	343041	4
2412	622500	4
2412	560017	3
2413	560017	4
2413	464331	1
2413	349129	3
2413	729979	4
2414	349129	3
2414	150161	4
2414	537539	2
2414	640479	3
2414	657852	5
2415	322677	4
2415	494940	2
2415	537539	5
2415	617776	4
2416	640479	5
2416	464331	4
2416	118277	3
2416	560017	2
2416	749887	3
2416	316097	2
2417	150161	4
2417	169537	1
2417	226251	2
2417	476299	5
2417	278562	2
2417	214399	3
2418	690765	2
2419	354619	4
2419	278562	2
2419	238569	3
2419	551320	2
2420	729979	1
2421	343041	1
2421	404719	4
2421	640479	3
2421	209180	2
2421	776626	4
2421	676078	2
2422	565245	3
2422	560017	3
2422	640479	4
2422	494940	1
2423	494940	3
2423	226251	1
2423	657852	3
2423	537539	4
2424	322677	2
2424	765884	3
2425	560017	4
2425	617776	5
2425	160692	3
2426	404719	5
2426	464331	4
2426	226251	4
2426	278562	2
2426	657852	3
2427	296215	1
2427	354619	3
2428	617776	5
2428	537539	2
2428	584502	5
2428	765884	4
2428	149183	2
2429	325139	1
2429	123036	3
2429	118277	1
2429	690765	3
2430	476299	2
2430	727024	2
2430	278562	3
2430	150161	2
2430	349129	2
2430	123036	1
2431	640479	3
2431	657852	1
2432	169537	4
2432	676078	4
2432	537539	1
2432	319977	2
2433	560017	4
2433	150181	2
2434	296215	3
2434	622500	2
2435	118277	2
2435	325139	4
2435	160692	1
2435	676078	4
2436	617776	5
2436	602951	4
2436	238569	2
2436	752387	3
2437	584502	4
2437	551320	3
2437	383805	1
2438	149183	2
2438	765884	3
2438	278562	4
2438	160692	5
2438	602951	2
2438	729979	5
2439	150161	4
2439	540828	4
2439	551320	3
2439	640479	3
2439	749887	3
2440	494940	4
2440	765884	5
2440	150161	2
2440	169537	2
2440	712605	4
2441	551320	3
2441	663789	3
2441	322677	4
2441	676078	3
2442	160692	1
2442	494940	4
2442	584502	4
2443	209180	3
2443	712605	2
2443	680088	4
2443	296215	1
2444	752387	3
2444	383805	3
2444	749887	3
2444	776626	3
2444	680088	2
2445	316097	3
2445	540828	2
2445	209180	2
2445	584502	2
2446	584502	2
2446	383805	1
2446	663789	3
2446	160692	5
2446	690765	4
2447	584502	5
2447	537539	3
2447	150181	4
2448	160692	1
2449	712605	3
2449	238569	5
2450	765884	3
2450	591311	5
2450	560017	1
2450	302850	5
2451	296215	4
2451	383805	2
2451	316097	2
2451	343041	1
2451	622500	2
2452	316097	4
2452	383805	2
2452	617776	2
2452	123036	3
2453	464331	4
2453	749887	5
2454	690765	2
2454	591311	4
2455	640479	5
2455	602951	4
2455	322677	5
2455	662181	4
2455	712605	1
2456	343041	1
2456	565245	2
2456	150181	2
2457	657852	4
2457	680088	3
2457	752387	2
2457	238569	5
2458	657852	4
2458	712605	4
2458	316097	5
2458	662181	3
2458	752387	4
2459	551320	4
2459	238569	4
2459	169537	3
2459	123036	4
2460	622500	4
2460	150161	1
2460	494940	5
2460	278562	3
2460	209180	2
2461	584502	3
2461	663789	2
2461	214399	4
2461	727024	2
2462	494940	3
2462	209180	3
2463	690765	4
2463	749887	2
2463	383805	4
2463	765884	4
2464	537539	4
2464	214399	4
2464	278562	4
2464	749887	3
2464	617776	4
2465	354619	3
2465	302850	2
2466	226251	4
2466	160692	3
2466	617776	3
2467	676078	4
2467	537539	3
2467	657852	5
2467	591311	3
2468	354619	2
2468	150161	5
2469	690765	4
2469	150181	2
2469	226251	4
2469	640479	3
2469	343041	3
2470	169537	1
2470	712605	3
2470	537539	3
2470	729979	4
2471	584502	2
2471	765884	2
2471	727024	4
2472	690765	2
2472	676078	3
2473	160692	2
2473	765884	2
2474	209180	3
2474	383805	3
2475	354619	4
2475	494940	4
2475	118277	2
2476	296215	2
2476	209180	3
2476	690765	4
2476	118277	3
2477	565245	4
2477	383805	3
2477	663789	2
2477	591311	3
2477	404719	3
2478	404719	2
2478	150181	3
2478	712605	3
2478	494940	4
2478	662181	5
2479	118277	4
2479	226251	3
2479	494940	1
2479	316097	4
2479	640479	4
2480	464331	2
2480	383805	2
2480	476299	5
2481	591311	4
2481	238569	4
2481	226251	3
2481	752387	1
2481	540828	1
2482	551320	1
2482	325139	1
2482	150161	4
2483	776626	1
2483	149183	3
2483	551320	4
2483	278562	3
2484	316097	3
2484	690765	4
2484	591311	3
2485	296215	3
2485	316097	2
2486	343041	3
2486	617776	5
2486	319977	3
2486	657852	5
2487	160692	4
2487	560017	4
2487	354619	2
2488	464331	2
2488	663789	4
2488	712605	4
2488	383805	3
2488	494940	2
2489	209180	2
2489	540828	2
2489	565245	3
2489	680088	5
2489	316097	2
2490	278562	1
2491	404719	2
2491	540828	4
2491	149183	4
2491	662181	4
2491	169537	1
2492	123036	4
2493	476299	5
2493	560017	4
2494	404719	2
2494	476299	2
2494	690765	2
2494	565245	4
2494	214399	3
2495	383805	1
2495	118277	3
2495	343041	1
2496	169537	5
2496	690765	3
2496	729979	3
2496	349129	3
2496	160692	1
2497	325139	3
2497	622500	1
2497	640479	2
2497	676078	4
2497	169537	3
2498	383805	4
2498	752387	1
2498	226251	1
2498	640479	2
2498	169537	3
2499	662181	2
2499	752387	3
2500	464331	2
2500	160692	4
2501	118277	5
2501	209180	4
2502	214399	2
2502	354619	5
2502	118277	3
2502	680088	4
2502	712605	3
2503	663789	1
2503	160692	1
2503	238569	4
2503	540828	4
2503	209180	3
2503	123036	3
2504	123036	2
2504	383805	4
2504	476299	4
2505	118277	5
2505	383805	4
2505	584502	1
2505	149183	2
2505	640479	5
2505	123036	3
2506	209180	4
2506	226251	4
2506	680088	4
2506	150161	3
2506	319977	1
2507	565245	2
2508	494940	4
2508	776626	4
2509	494940	3
2509	209180	5
2509	322677	2
2509	278562	3
2509	354619	3
2509	680088	4
2510	712605	3
2510	149183	1
2510	150181	3
2511	602951	4
2511	169537	1
2511	729979	5
2511	123036	2
2511	680088	4
2512	404719	4
2512	622500	4
2513	296215	2
2513	404719	2
2513	749887	3
2514	322677	4
2514	343041	4
2515	537539	2
2515	150161	4
2515	354619	2
2516	214399	3
2516	319977	2
2516	325139	2
2516	622500	2
2516	238569	4
2517	296215	2
2517	749887	4
2517	343041	3
2517	325139	2
2518	404719	2
2518	302850	4
2519	214399	5
2519	150161	3
2520	690765	1
2520	349129	3
2520	663789	1
2520	765884	4
2521	727024	4
2521	123036	4
2521	150161	1
2521	617776	1
2522	118277	3
2522	640479	3
2522	776626	4
2522	712605	5
2522	214399	5
2523	319977	2
2523	150181	3
2523	749887	2
2523	169537	5
2523	226251	4
2523	617776	4
2524	602951	1
2524	537539	4
2524	150161	5
2524	383805	3
2525	343041	3
2525	537539	2
2525	690765	4
2525	354619	3
2525	302850	4
2525	325139	3
2526	319977	3
2526	322677	3
2527	662181	3
2527	752387	2
2528	150181	5
2528	209180	1
2528	226251	4
2528	540828	4
2528	640479	3
2529	160692	3
2529	560017	3
2529	640479	3
2529	494940	4
2529	169537	3
2530	349129	5
2530	712605	2
2530	296215	1
2530	540828	4
2530	214399	3
2531	404719	1
2532	712605	3
2532	749887	2
2532	752387	2
2533	149183	3
2534	729979	5
2534	325139	4
2534	776626	1
2534	617776	1
2535	680088	2
2535	729979	4
2535	150161	4
2535	404719	4
2535	622500	2
2536	383805	1
2536	662181	2
2536	150181	4
2537	160692	5
2537	640479	2
2537	149183	1
2538	729979	4
2538	752387	3
2538	354619	1
2538	765884	2
2538	160692	1
2538	118277	5
2539	749887	3
2539	560017	4
2540	537539	1
2540	325139	4
2540	540828	5
2540	149183	1
2541	169537	3
2541	150161	3
2541	296215	2
2541	676078	4
2542	602951	3
2542	776626	5
2542	680088	2
2543	657852	1
2543	354619	1
2543	209180	2
2543	150181	5
2543	278562	4
2543	622500	2
2544	226251	4
2544	622500	4
2544	663789	3
2545	316097	2
2545	749887	2
2546	729979	5
2546	319977	2
2546	349129	2
2547	383805	1
2548	729979	2
2548	676078	4
2548	319977	2
2548	354619	5
2549	617776	2
2549	238569	4
2550	343041	1
2550	325139	1
2550	560017	4
2550	302850	4
2550	150181	4
2551	749887	4
2552	776626	1
2552	226251	4
2552	150161	4
2552	149183	1
2552	765884	3
2553	296215	4
2553	752387	2
2554	712605	4
2554	749887	2
2554	690765	2
2555	540828	3
2555	383805	3
2556	622500	4
2556	537539	5
2557	209180	1
2557	617776	4
2557	319977	1
2557	690765	3
2558	776626	5
2558	302850	4
2558	118277	5
2558	657852	3
2558	537539	3
2558	727024	1
2559	560017	4
2559	118277	1
2559	776626	2
2559	325139	3
2560	404719	3
2560	622500	5
2560	494940	4
2560	238569	4
2561	712605	2
2561	765884	4
2561	622500	4
2562	680088	5
2562	404719	2
2562	617776	5
2562	540828	4
2562	602951	5
2562	729979	4
2563	404719	4
2563	617776	4
2564	729979	1
2564	662181	2
2564	118277	5
2564	160692	5
2564	622500	3
2565	776626	1
2565	150161	3
2565	657852	2
2565	169537	4
2565	325139	1
2565	214399	4
2566	209180	2
2566	214399	3
2566	404719	2
2566	749887	3
2566	476299	2
2566	729979	3
2567	494940	2
2567	278562	3
2567	537539	4
2567	617776	1
2568	464331	3
2568	150161	2
2568	617776	1
2568	343041	5
2568	209180	3
2569	663789	5
2569	209180	2
2569	278562	4
2570	729979	3
2570	662181	5
2570	343041	4
2570	560017	3
2570	278562	2
2571	657852	2
2572	617776	3
2572	226251	4
2573	662181	5
2573	565245	4
2573	494940	4
2573	169537	4
2573	319977	5
2573	591311	1
2574	319977	5
2574	591311	3
2574	676078	2
2575	149183	2
2575	118277	4
2575	729979	2
2575	169537	3
2575	214399	3
2576	676078	1
2577	776626	5
2577	343041	1
2578	494940	4
2578	160692	4
2579	540828	4
2579	752387	4
2579	464331	3
2579	494940	3
2580	551320	3
2580	226251	3
2580	123036	2
2580	476299	3
2581	617776	4
2581	150161	4
2581	476299	4
2581	680088	3
2582	476299	1
2582	494940	3
2582	226251	2
2582	584502	4
2582	316097	3
2583	560017	2
2583	727024	4
2584	680088	1
2584	226251	3
2585	537539	1
2585	354619	2
2585	584502	2
2585	690765	4
2586	404719	4
2586	680088	5
2587	226251	4
2587	325139	3
2587	354619	4
2587	657852	2
2588	383805	5
2588	662181	4
2589	663789	5
2589	749887	2
2589	123036	1
2590	617776	1
2591	640479	3
2591	657852	3
2591	537539	4
2591	663789	2
2592	617776	3
2592	209180	5
2592	464331	5
2592	662181	2
2592	349129	3
2593	494940	2
2593	663789	2
2593	214399	3
2593	680088	2
2594	752387	5
2594	343041	2
2595	551320	5
2595	591311	3
2595	662181	2
2595	238569	2
2596	662181	4
2596	537539	1
2597	343041	4
2598	123036	1
2598	476299	3
2598	325139	5
2598	622500	2
2599	209180	2
2599	214399	5
2599	591311	5
2600	663789	2
2600	343041	5
2600	325139	2
2600	149183	5
2600	617776	3
2600	319977	2
2601	464331	4
2601	776626	3
2601	169537	3
2601	591311	3
2602	226251	5
2602	584502	4
2603	325139	1
2603	752387	4
2603	727024	4
2603	640479	2
2603	278562	2
2604	316097	5
2604	540828	4
2604	494940	3
2604	150181	2
2605	349129	4
2605	765884	2
2605	325139	2
2605	551320	1
2606	565245	3
2606	278562	1
2606	551320	2
2607	464331	2
2607	149183	4
2607	476299	1
2607	551320	3
2608	494940	1
2608	325139	2
2608	278562	2
2608	322677	2
2608	214399	2
2608	622500	3
2609	123036	3
2609	238569	2
2609	322677	5
2610	551320	1
2611	150161	3
2611	537539	1
2612	662181	3
2612	238569	3
2612	349129	3
2612	383805	3
2613	494940	2
2613	296215	5
2613	727024	3
2613	150181	1
2613	123036	4
2613	238569	4
2614	209180	5
2614	540828	3
2614	278562	4
2614	343041	2
2614	640479	5
2614	349129	3
2615	540828	2
2615	150161	4
2615	149183	3
2615	584502	2
2615	238569	2
2616	680088	2
2616	591311	1
2616	349129	4
2616	584502	2
2616	226251	5
2616	663789	1
2617	690765	2
2617	591311	2
2617	565245	5
2617	349129	5
2618	354619	1
2619	537539	4
2619	663789	4
2620	149183	3
2620	150181	1
2620	322677	4
2620	752387	5
2621	622500	3
2621	149183	4
2621	657852	5
2621	214399	2
2621	319977	4
2622	622500	2
2622	209180	5
2622	584502	4
2622	319977	3
2622	464331	4
2623	278562	1
2623	494940	2
2623	640479	2
2624	150161	3
2624	123036	3
2624	325139	3
2624	226251	2
2624	676078	2
2625	622500	1
2625	316097	1
2625	214399	2
2626	540828	1
2626	383805	1
2626	494940	2
2626	640479	1
2626	657852	3
2627	226251	4
2627	150181	1
2627	584502	2
2628	663789	1
2628	551320	2
2628	476299	4
2628	464331	1
2628	657852	3
2629	169537	4
2629	565245	4
2629	765884	2
2629	150161	3
2630	560017	5
2630	214399	2
2630	537539	2
2630	319977	3
2630	690765	4
2631	622500	4
2631	540828	2
2631	160692	4
2631	640479	5
2631	123036	4
2632	354619	2
2632	662181	5
2633	663789	3
2633	494940	4
2633	209180	4
2633	540828	1
2634	565245	3
2635	551320	4
2635	302850	2
2635	123036	2
2636	640479	3
2636	302850	2
2637	325139	2
2637	622500	2
2638	591311	2
2638	169537	4
2638	118277	3
2638	680088	2
2638	149183	3
2639	662181	4
2639	676078	1
2639	591311	2
2639	663789	2
2639	319977	4
2639	727024	5
2640	214399	4
2640	354619	2
2640	325139	1
2641	150161	1
2641	169537	1
2641	149183	5
2641	226251	1
2642	209180	4
2642	150161	2
2642	749887	4
2642	640479	4
2642	690765	2
2642	680088	1
2643	663789	2
2643	584502	4
2643	690765	2
2643	560017	4
2644	316097	3
2644	657852	3
2645	322677	2
2645	238569	2
2646	591311	3
2646	712605	2
2646	464331	4
2647	118277	3
2647	551320	4
2647	657852	4
2647	680088	4
2647	316097	2
2648	123036	4
2648	343041	3
2648	617776	4
2649	537539	4
2649	584502	3
2649	149183	5
2649	749887	4
2649	622500	5
2649	662181	4
2650	354619	1
2650	676078	5
2651	560017	1
2651	226251	4
2651	727024	2
2652	209180	2
2652	476299	4
2652	349129	4
2652	150161	4
2652	464331	2
2653	150161	4
2653	622500	5
2654	226251	4
2654	537539	1
2655	749887	1
2655	278562	5
2655	690765	3
2656	729979	2
2656	537539	5
2656	476299	4
2656	640479	5
2656	540828	3
2656	680088	2
2657	123036	4
2657	765884	5
2657	657852	4
2657	160692	2
2657	322677	3
2658	676078	4
2658	712605	3
2659	316097	4
2659	226251	2
2659	591311	2
2659	404719	3
2660	404719	4
2661	150181	2
2661	617776	4
2661	319977	2
2661	752387	4
2661	464331	5
2661	565245	1
2662	118277	2
2662	325139	2
2663	169537	1
2663	776626	2
2663	214399	2
2663	343041	4
2663	354619	2
2664	690765	1
2664	149183	1
2664	325139	1
2664	622500	4
2664	123036	2
2665	657852	3
2665	560017	4
2665	663789	5
2665	322677	3
2666	727024	4
2666	319977	2
2667	776626	3
2667	150181	1
2667	663789	3
2667	214399	1
2668	150181	1
2668	214399	2
2668	349129	2
2669	560017	5
2669	278562	4
2669	727024	3
2670	749887	2
2670	617776	4
2670	622500	5
2670	149183	2
2671	540828	3
2671	690765	2
2671	565245	3
2672	657852	4
2672	662181	2
2672	640479	2
2672	343041	4
2672	749887	2
2673	752387	3
2673	319977	5
2673	712605	2
2673	349129	4
2673	540828	1
2674	214399	4
2674	712605	1
2675	343041	3
2675	617776	5
2675	278562	2
2675	551320	2
2675	150181	3
2676	325139	4
2676	727024	3
2676	214399	4
2677	476299	4
2677	560017	4
2677	150161	4
2677	404719	4
2677	729979	3
2678	729979	1
2678	160692	3
2678	657852	4
2678	214399	4
2678	560017	2
2679	602951	3
2679	383805	5
2679	476299	3
2680	316097	3
2680	322677	3
2680	776626	2
2680	752387	1
2680	150161	3
2680	404719	3
2681	209180	2
2681	537539	4
2681	149183	4
2681	150181	1
2682	640479	4
2682	657852	1
2682	663789	5
2682	316097	5
2682	150161	5
2682	296215	4
2683	622500	3
2683	663789	4
2683	150161	3
2683	316097	4
2684	383805	3
2684	494940	1
2684	349129	3
2684	150161	3
2684	343041	3
2684	118277	3
2685	278562	4
2685	349129	2
2685	776626	1
2686	657852	2
2686	680088	4
2686	169537	2
2687	537539	5
2687	765884	3
2687	238569	3
2688	663789	2
2688	160692	2
2688	551320	4
2688	354619	4
2688	676078	2
2688	680088	4
2689	319977	4
2690	354619	2
2690	319977	4
2690	584502	3
2690	209180	4
2690	622500	5
2690	776626	4
2691	690765	4
2692	617776	1
2693	765884	5
2693	123036	4
2694	617776	1
2694	712605	4
2694	214399	3
2695	278562	5
2695	729979	3
2695	343041	3
2695	663789	5
2696	729979	5
2696	476299	4
2696	776626	4
2697	662181	4
2697	354619	2
2697	591311	3
2697	727024	4
2698	663789	2
2698	617776	2
2698	238569	4
2698	160692	4
2698	640479	4
2699	617776	5
2699	476299	5
2699	584502	4
2700	676078	1
2701	238569	2
2701	560017	4
2701	296215	3
2701	657852	3
2701	316097	5
2702	727024	3
2702	540828	2
2703	494940	4
2703	537539	3
2703	118277	3
2703	680088	4
2704	316097	4
2704	591311	3
2704	169537	4
2705	349129	1
2706	150181	1
2706	354619	4
2706	278562	2
2707	663789	4
2707	160692	2
2707	296215	1
2708	319977	4
2708	209180	3
2708	343041	2
2708	383805	4
2708	540828	2
2709	123036	5
2709	160692	5
2709	349129	3
2709	602951	1
2709	209180	2
2710	296215	4
2711	169537	5
2711	776626	1
2712	584502	3
2712	657852	2
2712	322677	3
2712	209180	3
2712	680088	4
2712	316097	3
2713	214399	3
2713	322677	1
2713	752387	5
2713	584502	4
2713	622500	4
2714	464331	2
2714	776626	1
2714	150181	4
2715	296215	3
2715	494940	5
2715	354619	4
2715	617776	5
2715	476299	4
2716	663789	2
2716	476299	1
2717	752387	2
2717	118277	5
2717	349129	3
2717	238569	4
2717	316097	1
2717	278562	4
2718	663789	2
2718	343041	4
2719	591311	4
2719	149183	4
2720	209180	4
2720	584502	4
2720	149183	1
2720	680088	4
2721	118277	3
2722	476299	3
2723	676078	5
2724	617776	3
2724	169537	4
2724	150161	2
2724	729979	2
2724	118277	4
2725	169537	1
2725	150161	3
2725	123036	4
2725	209180	2
2725	354619	3
2726	676078	3
2726	622500	3
2726	319977	3
2726	464331	3
2727	663789	1
2727	296215	3
2727	214399	2
2728	765884	2
2728	729979	4
2728	325139	4
2728	343041	1
2729	657852	4
2729	226251	3
2729	565245	2
2729	325139	5
2730	776626	5
2730	150181	5
2730	316097	1
2731	316097	4
2731	752387	4
2732	551320	4
2732	150161	4
2732	476299	5
2732	537539	4
2732	322677	4
2732	123036	4
2733	464331	3
2733	278562	2
2733	349129	5
2733	404719	2
2733	226251	4
2733	169537	1
2734	118277	2
2734	316097	3
2735	584502	5
2735	383805	4
2735	464331	2
2736	712605	5
2737	560017	4
2738	663789	2
2738	640479	5
2738	278562	3
2739	662181	2
2739	617776	3
2740	657852	4
2740	617776	3
2740	729979	5
2740	540828	5
2741	727024	3
2742	123036	4
2742	238569	4
2742	584502	4
2742	169537	2
2743	776626	2
2743	404719	2
2743	316097	2
2743	214399	4
2743	476299	2
2743	209180	4
2744	657852	4
2744	584502	3
2744	150181	3
2744	617776	2
2744	123036	1
2745	727024	4
2745	640479	2
2745	765884	3
2745	749887	3
2746	226251	4
2746	316097	3
2747	354619	2
2748	123036	2
2748	226251	3
2748	591311	4
2748	464331	3
2749	302850	2
2749	150181	1
2750	494940	5
2750	316097	2
2750	404719	3
2750	765884	4
2751	752387	2
2751	591311	2
2751	729979	1
2751	464331	1
2751	349129	2
2752	150181	4
2753	322677	5
2753	325139	4
2753	749887	4
2753	680088	2
2754	663789	2
2755	226251	3
2755	150181	3
2755	752387	2
2755	349129	3
2755	383805	3
2756	464331	2
2756	591311	2
2757	540828	2
2757	123036	2
2758	464331	3
2758	712605	4
2758	404719	3
2758	657852	4
2758	765884	3
2759	765884	4
2759	123036	4
2760	640479	5
2761	123036	4
2761	540828	5
2761	118277	2
2762	602951	1
2762	540828	3
2762	209180	5
2762	676078	3
2762	729979	5
2763	296215	1
2763	123036	4
2763	349129	2
2763	680088	5
2763	776626	5
2764	765884	4
2764	278562	2
2764	776626	3
2764	727024	3
2764	238569	3
2765	322677	2
2765	749887	1
2765	302850	5
2766	296215	1
2766	640479	5
2766	349129	3
2766	752387	1
2767	296215	3
2767	226251	5
2767	560017	5
2767	123036	3
2767	640479	3
2768	537539	3
2769	319977	4
2769	169537	3
2769	551320	2
2770	752387	5
2770	729979	4
2770	316097	4
2770	343041	5
2770	640479	2
2771	316097	4
2771	657852	1
2772	302850	2
2772	765884	4
2773	150161	1
2773	494940	3
2773	676078	1
2773	214399	3
2773	476299	5
2773	765884	2
2774	602951	2
2775	383805	3
2775	663789	2
2775	325139	4
2776	584502	1
2776	640479	3
2776	383805	2
2776	319977	4
2776	729979	2
2777	676078	5
2778	296215	4
2779	325139	5
2780	150161	1
2780	729979	3
2781	729979	2
2781	680088	3
2781	325139	4
2782	214399	2
2782	278562	2
2783	226251	2
2783	591311	2
2783	776626	3
2784	343041	5
2784	238569	4
2784	349129	2
2785	226251	2
2785	551320	4
2785	150161	3
2785	296215	1
2785	680088	1
2786	150181	4
2786	226251	3
2786	209180	2
2787	565245	3
2787	622500	1
2787	322677	3
2787	712605	3
2787	343041	1
2787	150161	3
2788	214399	2
2788	149183	2
2788	278562	3
2789	349129	2
2789	150161	4
2789	322677	2
2789	123036	2
2789	657852	3
2790	160692	5
2790	617776	5
2790	712605	4
2790	476299	2
2790	343041	2
2791	617776	2
2791	727024	5
2791	209180	1
2792	690765	2
2792	149183	1
2792	657852	4
2793	551320	1
2793	560017	3
2794	663789	3
2794	169537	5
2794	617776	2
2794	150161	4
2795	118277	3
2796	540828	2
2796	325139	5
2796	150181	3
2796	349129	1
2796	602951	5
2796	354619	5
2797	749887	4
2797	690765	2
2797	551320	4
2797	591311	3
2798	727024	4
2799	560017	3
2799	322677	3
2799	149183	3
2799	214399	3
2800	319977	4
2800	150161	1
2800	238569	3
2801	319977	2
2801	602951	3
2802	404719	2
2803	349129	4
2803	617776	2
2803	383805	3
2804	690765	2
2804	404719	4
2804	640479	5
2804	494940	4
2804	584502	3
2805	622500	4
2805	226251	4
2805	676078	2
2805	663789	1
2806	296215	2
2806	729979	4
2806	325139	5
2806	214399	3
2806	123036	4
2807	226251	3
2807	319977	5
2807	622500	3
2807	169537	4
2807	680088	4
2808	540828	3
2809	278562	3
2809	752387	3
2809	584502	3
2809	383805	2
2809	349129	4
2809	322677	5
2810	729979	2
2810	657852	4
2810	591311	4
2810	540828	1
2811	690765	5
2811	622500	5
2811	123036	2
2811	296215	4
2812	752387	3
2812	617776	4
2812	622500	2
2813	404719	1
2814	325139	1
2814	551320	2
2814	765884	4
2814	150161	3
2814	149183	2
2815	123036	4
2816	591311	3
2816	322677	4
2816	150161	3
2816	537539	1
2816	302850	4
2816	551320	3
2817	150181	4
2817	476299	2
2817	584502	2
2818	776626	4
2818	123036	3
2818	690765	4
2819	278562	3
2819	238569	3
2820	349129	5
2820	302850	3
2820	776626	5
2820	690765	3
2821	551320	3
2821	680088	4
2822	296215	5
2822	540828	1
2823	149183	1
2823	349129	4
2824	752387	1
2824	343041	1
2825	322677	1
2825	296215	2
2825	752387	3
2825	676078	2
2825	150181	1
2826	749887	1
2826	278562	5
2826	657852	4
2827	296215	2
2827	680088	3
2827	640479	2
2827	494940	2
2828	325139	1
2828	752387	3
2828	776626	3
2828	617776	4
2828	278562	4
2829	537539	4
2830	663789	1
2830	565245	1
2830	169537	2
2830	343041	3
2830	591311	3
2831	765884	1
2831	149183	5
2831	150161	3
2831	752387	3
2831	729979	3
2831	302850	2
2832	537539	5
2832	729979	3
2832	118277	3
2832	383805	5
2833	149183	3
2833	123036	4
2833	160692	2
2834	169537	5
2834	150161	5
2834	617776	3
2834	565245	3
2835	680088	4
2835	640479	4
2836	169537	1
2836	316097	1
2836	214399	4
2837	565245	1
2837	322677	1
2838	209180	5
2838	591311	5
2838	749887	2
2838	617776	2
2838	325139	2
2839	302850	3
2839	752387	1
2839	464331	4
2839	296215	4
2839	663789	3
2840	226251	3
2840	322677	3
2840	118277	2
2840	591311	5
2840	319977	1
2841	749887	3
2842	537539	5
2842	662181	2
2842	404719	2
2842	349129	3
2843	238569	2
2844	663789	3
2844	226251	4
2845	622500	2
2845	729979	3
2845	676078	3
2845	537539	2
2845	169537	4
2846	169537	4
2846	727024	5
2847	150161	2
2847	123036	1
2847	476299	2
2847	565245	4
2847	160692	5
2847	776626	3
2848	302850	3
2849	238569	2
2849	278562	3
2850	537539	2
2851	551320	3
2851	209180	3
2851	238569	5
2851	676078	2
2852	712605	5
2853	662181	2
2853	765884	4
2853	278562	3
2853	537539	2
2854	118277	4
2854	150161	2
2854	214399	2
2854	663789	3
2854	765884	4
2855	617776	4
2855	749887	3
2855	123036	3
2855	150181	3
2855	584502	3
2855	349129	2
2856	540828	4
2856	325139	3
2856	729979	1
2856	622500	3
2857	551320	3
2857	591311	2
2857	476299	4
2857	540828	1
2857	149183	4
2858	316097	5
2858	729979	5
2858	749887	3
2859	343041	4
2859	602951	2
2859	464331	3
2859	729979	2
2859	296215	1
2859	123036	3
2860	296215	1
2860	765884	4
2860	325139	1
2860	214399	4
2860	343041	2
2861	118277	5
2861	494940	3
2862	238569	4
2862	349129	2
2862	591311	2
2862	676078	4
2863	690765	2
2863	584502	4
2863	238569	1
2863	123036	3
2863	640479	3
2864	319977	2
2864	712605	4
2864	662181	3
2864	776626	5
2865	150161	2
2865	749887	2
2865	296215	3
2866	302850	2
2866	150161	2
2866	296215	4
2866	560017	2
2866	663789	3
2867	296215	1
2867	149183	2
2867	464331	2
2867	729979	1
2868	302850	3
2868	349129	5
2868	383805	2
2868	776626	4
2869	354619	2
2869	349129	2
2870	302850	1
2870	296215	3
2870	537539	2
2870	322677	3
2871	343041	4
2871	319977	2
2871	657852	3
2871	560017	3
2871	617776	2
2872	551320	3
2872	296215	2
2872	349129	3
2873	676078	4
2873	118277	1
2874	617776	3
2874	584502	1
2874	537539	3
2875	752387	2
2875	169537	4
2875	325139	2
2875	537539	2
2876	617776	3
2876	712605	4
2876	349129	1
2877	662181	1
2877	325139	3
2877	690765	2
2878	676078	1
2878	749887	5
2879	169537	3
2879	622500	2
2879	551320	4
2879	476299	3
2880	325139	3
2880	278562	4
2880	383805	3
2880	690765	3
2880	169537	4
2881	118277	4
2881	712605	2
2881	354619	2
2881	226251	2
2882	551320	1
2882	149183	3
2883	663789	2
2883	238569	1
2883	118277	3
2883	322677	3
2884	729979	3
2885	591311	3
2885	749887	5
2886	662181	4
2886	727024	2
2886	150181	4
2886	118277	3
2887	584502	4
2888	591311	3
2888	540828	2
2888	226251	1
2888	322677	4
2889	657852	4
2889	123036	3
2890	551320	1
2890	123036	1
2890	169537	4
2890	776626	2
2891	214399	4
2891	149183	4
2891	349129	3
2891	123036	2
2891	712605	4
2891	160692	1
2892	657852	1
2892	765884	2
2892	690765	2
2892	343041	4
2893	690765	2
2893	278562	4
2893	214399	4
2893	354619	3
2893	118277	1
2894	676078	3
2894	464331	4
2894	169537	2
2894	712605	4
2895	278562	4
2896	551320	1
2896	123036	5
2896	540828	5
2896	560017	3
2897	149183	2
2897	622500	5
2898	319977	1
2898	150161	3
2898	663789	4
2898	749887	2
2899	551320	4
2899	319977	3
2899	160692	5
2900	322677	3
2900	729979	5
2901	622500	2
2901	494940	3
2901	302850	2
2902	640479	4
2902	690765	2
2902	476299	1
2902	169537	2
2902	214399	3
2902	537539	4
2903	765884	5
2904	278562	2
2904	209180	5
2905	209180	1
2905	712605	4
2905	657852	2
2905	319977	2
2906	296215	4
2906	494940	3
2906	322677	2
2906	383805	1
2907	676078	3
2907	663789	4
2908	238569	4
2909	584502	1
2909	149183	5
2910	537539	3
2910	296215	5
2910	560017	2
2910	476299	3
2910	349129	2
2910	727024	1
2911	325139	1
2911	238569	5
2912	316097	2
2912	749887	4
2912	278562	5
2912	663789	3
2912	150181	5
2912	727024	3
2913	540828	2
2913	383805	3
2913	404719	2
2913	209180	3
2914	690765	3
2914	343041	2
2914	278562	4
2915	123036	5
2915	214399	4
2915	617776	5
2915	657852	4
2915	278562	2
2916	560017	2
2916	123036	2
2916	238569	4
2916	727024	5
2917	316097	3
2917	322677	4
2918	319977	4
2918	640479	2
2918	349129	5
2918	209180	2
2919	712605	2
2919	209180	3
2919	494940	4
2920	404719	2
2920	765884	2
2920	565245	4
2921	617776	2
2921	238569	2
2922	494940	3
2922	680088	4
2923	209180	2
2923	617776	1
2923	383805	3
2923	169537	4
2924	640479	2
2924	123036	3
2925	765884	2
2925	494940	5
2925	209180	4
2926	160692	4
2926	537539	2
2926	302850	5
2926	404719	4
2926	622500	4
2927	226251	3
2927	690765	4
2927	278562	2
2927	565245	4
2927	622500	5
2927	238569	4
2928	226251	5
2928	749887	3
2928	690765	2
2928	209180	5
2929	209180	2
2929	149183	4
2930	319977	1
2930	296215	3
2930	494940	2
2930	214399	3
2930	765884	2
2930	560017	5
2931	663789	5
2931	494940	3
2932	622500	3
2933	727024	2
2933	160692	2
2933	169537	2
2933	226251	3
2933	383805	4
2934	591311	2
2934	640479	5
2934	729979	2
2934	319977	3
2935	383805	4
2935	169537	1
2936	537539	4
2936	150161	2
2936	540828	3
2936	209180	3
2937	464331	1
2937	640479	2
2938	690765	5
2938	118277	4
2938	383805	2
2938	729979	1
2938	622500	4
2939	494940	3
2939	540828	3
2939	150181	2
2939	591311	5
2940	617776	3
2941	209180	5
2941	676078	5
2941	591311	2
2942	169537	2
2942	476299	1
2942	537539	3
2942	749887	2
2942	349129	2
2943	118277	5
2943	680088	2
2943	657852	3
2944	343041	2
2944	640479	3
2944	602951	5
2944	354619	2
2945	209180	3
2945	325139	4
2945	622500	3
2946	622500	2
2946	749887	3
2946	617776	1
2946	343041	1
2946	238569	1
2947	640479	2
2947	657852	3
2947	322677	1
2948	150161	4
2949	640479	5
2949	238569	1
2949	349129	2
2949	150181	1
2949	160692	1
2950	749887	4
2950	622500	1
2950	214399	3
2951	591311	4
2951	640479	2
2951	565245	3
2951	551320	3
2952	226251	3
2952	727024	1
2952	657852	3
2953	560017	5
2954	349129	1
2954	676078	3
2954	319977	4
2954	640479	4
2955	349129	4
2955	680088	4
2956	584502	1
2956	752387	2
2956	343041	4
2956	476299	2
2956	622500	1
2956	118277	3
2957	540828	2
2957	657852	5
2958	150161	1
2958	476299	5
2959	617776	3
2959	278562	3
2959	123036	3
2960	169537	2
2960	712605	2
2960	752387	3
2961	749887	2
2961	169537	1
2962	383805	5
2962	640479	2
2962	302850	5
2963	690765	5
2963	118277	4
2963	591311	3
2963	712605	3
2963	319977	5
2964	302850	4
2964	727024	5
2965	680088	1
2965	476299	2
2965	551320	5
2965	584502	4
2966	214399	1
2966	322677	2
2966	319977	5
2966	209180	4
2966	404719	1
2966	354619	3
2967	622500	4
2967	404719	4
2967	640479	3
2967	591311	5
2967	752387	4
2968	540828	4
2968	383805	4
2968	316097	4
2968	690765	3
2968	118277	4
2968	169537	3
2969	657852	5
2969	238569	2
2969	169537	5
2969	118277	5
2970	591311	5
2970	560017	4
2971	209180	3
2972	150181	4
2972	662181	5
2973	540828	4
2973	160692	4
2974	602951	2
2974	749887	2
2974	316097	4
2974	729979	3
2974	622500	3
2974	537539	3
2975	776626	5
2975	540828	2
2975	565245	2
2975	752387	3
2975	169537	3
2976	676078	4
2976	226251	4
2976	322677	4
2976	296215	4
2977	354619	1
2977	316097	2
2977	662181	2
2978	476299	2
2978	354619	1
2978	591311	1
2978	322677	3
2979	296215	3
2979	662181	5
2979	690765	2
2980	319977	1
2980	662181	4
2981	150161	5
2981	765884	2
2981	662181	5
2981	464331	4
2981	602951	2
2982	160692	1
2982	602951	2
2982	752387	1
2982	354619	1
2982	404719	3
2983	296215	4
2983	560017	3
2984	749887	2
2984	383805	3
2984	349129	2
2984	494940	1
2984	690765	1
2984	296215	4
2985	150181	3
2985	209180	3
2985	238569	3
2986	343041	1
2986	322677	3
2986	150181	4
2986	551320	5
2986	617776	3
2986	238569	3
2987	680088	4
2987	640479	3
2987	169537	1
2987	464331	2
2987	383805	2
2987	226251	4
2988	209180	3
2988	765884	3
2988	776626	2
2988	727024	4
2988	591311	3
2988	319977	4
2989	690765	2
2989	476299	5
2989	560017	2
2989	565245	5
2989	150181	1
2990	404719	1
2990	150181	5
2991	209180	4
2991	584502	4
2991	316097	3
2992	663789	3
2992	238569	4
2992	322677	5
2992	169537	4
2992	640479	4
2992	540828	2
2993	209180	2
2993	537539	5
2993	343041	3
2994	319977	4
2994	560017	4
2995	319977	4
2995	729979	4
2996	584502	4
2996	622500	5
2996	676078	3
2996	690765	1
2996	404719	4
2997	680088	3
2997	663789	3
2997	622500	5
2997	640479	5
2997	729979	4
2998	214399	5
2998	584502	2
2998	118277	4
2998	383805	3
2998	712605	4
2999	749887	4
2999	319977	5
3000	540828	3
3000	238569	1
3001	160692	3
3001	322677	3
3001	676078	3
3002	226251	5
3002	551320	4
3002	319977	3
3002	383805	5
3002	404719	4
3003	565245	2
3003	343041	1
3003	118277	3
3004	727024	5
3004	551320	5
3005	663789	1
3005	657852	3
3006	238569	3
3006	657852	5
3007	565245	1
3007	617776	3
3008	776626	2
3008	729979	4
3008	676078	4
3008	118277	2
3008	302850	3
3009	551320	2
3010	729979	4
3010	316097	2
3011	565245	3
3011	729979	2
3011	278562	2
3011	540828	4
3011	354619	2
3012	657852	4
3012	676078	5
3013	565245	5
3013	464331	4
3013	349129	5
3013	676078	2
3013	657852	2
3014	476299	4
3014	663789	1
3014	214399	3
3014	640479	1
3014	123036	3
3014	322677	3
3015	214399	1
3015	464331	3
3015	316097	4
3015	325139	1
3015	343041	2
3016	150181	3
3016	404719	4
3016	617776	2
3016	712605	2
3016	278562	2
3016	169537	2
3017	404719	1
3017	149183	3
3017	663789	1
3017	123036	5
3018	602951	2
3018	296215	4
3018	663789	2
3018	727024	1
3018	551320	3
3018	662181	1
3019	663789	3
3019	118277	3
3020	150161	3
3020	209180	3
3020	729979	3
3021	657852	1
3021	354619	4
3022	712605	2
3022	160692	4
3023	712605	2
3023	316097	2
3023	118277	4
3023	680088	2
3023	150161	1
3024	565245	3
3024	278562	2
3025	765884	3
3025	662181	3
3026	404719	3
3026	316097	4
3026	680088	1
3026	322677	2
3027	383805	2
3027	551320	4
3027	238569	4
3027	727024	1
3027	319977	3
3028	591311	2
3029	278562	4
3029	776626	3
3029	657852	3
3029	319977	4
3029	540828	5
3029	662181	4
3030	591311	2
3031	560017	4
3031	325139	5
3031	169537	4
3031	476299	5
3031	118277	5
3032	617776	3
3032	226251	4
3032	640479	3
3032	160692	1
3033	560017	3
3033	494940	3
3033	464331	1
3033	540828	4
3033	149183	4
3034	149183	1
3035	712605	1
3035	680088	3
3035	349129	2
3035	149183	5
3035	657852	4
3036	214399	2
3037	765884	2
3037	657852	1
3037	591311	4
3037	226251	3
3037	325139	3
3038	537539	4
3038	560017	3
3038	712605	1
3039	354619	3
3039	296215	4
3039	169537	1
3040	622500	1
3041	680088	4
3041	209180	1
3041	537539	3
3042	118277	2
3042	150181	3
3043	278562	4
3043	565245	5
3043	657852	3
3044	149183	4
3044	118277	2
3044	325139	5
3044	690765	1
3045	676078	3
3045	727024	2
3045	776626	2
3045	349129	3
3045	729979	2
3045	322677	3
3046	349129	3
3046	322677	3
3046	727024	5
3046	765884	3
3047	354619	4
3047	540828	4
3047	727024	1
3047	676078	2
3048	160692	3
3048	354619	4
3049	749887	4
3050	591311	4
3050	343041	2
3050	680088	5
3051	118277	4
3052	663789	4
3052	727024	4
3053	238569	5
3053	680088	3
3053	551320	4
3053	657852	4
3053	118277	2
3054	150161	5
3054	680088	4
3054	560017	4
3054	565245	4
3054	584502	2
3055	494940	2
3055	226251	2
3056	169537	4
3056	752387	3
3056	209180	1
3057	349129	3
3057	584502	2
3058	349129	3
3058	150181	3
3058	676078	4
3058	296215	5
3058	404719	3
3058	749887	3
3059	537539	4
3059	640479	4
3059	663789	2
3059	602951	4
3059	149183	3
3060	214399	3
3060	349129	3
3061	238569	1
3061	749887	1
3061	729979	3
3062	765884	5
3062	712605	1
3063	560017	4
3063	325139	3
3064	404719	1
3064	343041	5
3064	749887	4
3064	322677	4
3064	160692	2
3065	727024	3
3065	591311	3
3065	584502	5
3065	404719	3
3065	343041	4
3066	537539	3
3066	214399	4
3067	749887	4
3067	560017	2
3067	752387	1
3068	776626	2
3068	123036	2
3068	584502	4
3069	727024	3
3069	662181	4
3069	622500	2
3069	302850	2
3069	494940	2
3070	494940	3
3070	123036	4
3070	690765	5
3070	343041	2
3070	591311	1
3071	343041	1
3071	278562	2
3071	214399	4
3071	584502	3
3072	662181	3
3072	749887	3
3072	640479	1
3072	354619	2
3073	551320	3
3073	640479	4
3073	150161	5
3073	160692	3
3073	663789	4
3074	729979	2
3074	749887	2
3074	680088	2
3075	662181	4
3075	776626	3
3075	640479	3
3075	602951	2
3076	676078	4
3076	209180	3
3076	325139	2
3076	123036	3
3076	278562	1
3077	617776	3
3077	712605	3
3078	657852	2
3078	123036	3
3079	727024	1
3079	160692	2
3079	617776	2
3079	169537	2
3080	565245	2
3080	322677	2
3080	776626	3
3081	278562	5
3081	662181	3
3082	226251	4
3082	149183	2
3082	729979	1
3082	322677	3
3082	565245	5
3082	765884	1
3083	322677	1
3083	316097	4
3084	226251	2
3085	727024	1
3085	169537	4
3086	676078	4
3087	150181	4
3087	325139	4
3087	322677	5
3087	551320	4
3088	729979	4
3088	540828	1
3088	560017	4
3089	322677	5
3089	123036	1
3089	584502	3
3089	752387	2
3089	278562	3
3090	476299	2
3090	749887	2
3090	404719	1
3091	404719	3
3091	662181	5
3091	663789	1
3092	150181	3
3092	776626	2
3092	226251	3
3092	123036	5
3092	729979	2
3093	617776	4
3093	537539	5
3093	591311	4
3093	640479	4
3093	226251	5
3094	149183	2
3095	749887	5
3095	169537	4
3095	278562	2
3095	494940	4
3095	226251	5
3095	238569	5
3096	169537	4
3097	680088	1
3097	160692	4
3097	551320	4
3097	540828	1
3097	464331	4
3098	325139	2
3098	657852	3
3098	226251	2
3098	160692	5
3098	118277	5
3099	712605	4
3099	676078	4
3099	729979	3
3099	343041	4
3099	657852	2
3100	476299	5
3101	325139	4
3101	663789	3
3101	749887	2
3101	680088	2
3102	680088	3
3102	296215	5
3102	383805	4
3103	657852	3
3103	663789	1
3103	729979	1
3103	676078	4
3103	617776	3
3103	118277	1
3104	214399	4
3104	118277	2
3104	540828	4
3104	680088	5
3104	749887	2
3104	296215	3
3105	383805	5
3105	765884	2
3106	663789	5
3106	617776	4
3107	150181	2
3107	662181	4
3108	690765	3
3108	316097	3
3108	540828	3
3109	494940	3
3109	238569	5
3109	663789	2
3109	214399	3
3109	150181	5
3110	494940	3
3110	149183	3
3110	343041	4
3111	160692	2
3111	325139	3
3111	749887	4
3111	622500	3
3112	150161	3
3112	169537	4
3112	712605	2
3112	617776	3
3113	752387	4
3113	464331	2
3114	118277	2
3114	729979	1
3114	319977	2
3114	494940	3
3114	752387	4
3115	404719	3
3115	322677	5
3115	325139	3
3115	149183	1
3116	657852	1
3116	494940	1
3116	676078	2
3116	169537	3
3117	325139	5
3117	316097	1
3117	540828	4
3117	404719	2
3117	663789	2
3118	319977	2
3118	160692	1
3118	464331	2
3118	278562	3
3118	749887	5
3118	214399	2
3119	238569	2
3119	565245	1
3119	354619	4
3119	169537	4
3120	565245	1
3120	727024	3
3120	160692	1
3120	776626	4
3120	150181	2
3121	349129	2
3121	383805	5
3121	316097	2
3122	354619	3
3122	591311	3
3122	325139	4
3122	296215	2
3123	383805	2
3123	160692	4
3124	749887	1
3124	149183	4
3125	214399	3
3125	150181	1
3125	662181	3
3125	343041	5
3126	316097	4
3126	680088	5
3126	325139	3
3127	540828	4
3127	349129	2
3127	537539	3
3128	150181	2
3128	565245	4
3128	752387	3
3128	149183	3
3129	584502	3
3129	322677	3
3129	494940	5
3129	209180	4
3130	749887	1
3130	150181	1
3131	551320	3
3131	727024	2
3131	663789	3
3131	476299	4
3131	226251	3
3132	617776	5
3132	712605	1
3132	765884	1
3133	169537	3
3133	118277	4
3133	319977	2
3133	149183	4
3133	540828	4
3134	149183	2
3134	343041	2
3134	123036	2
3134	776626	1
3135	316097	5
3135	322677	2
3135	640479	4
3135	214399	1
3135	565245	3
3135	169537	3
3136	657852	4
3136	591311	3
3136	118277	2
3137	729979	2
3138	464331	4
3139	729979	5
3139	712605	3
3139	316097	1
3140	565245	5
3140	149183	2
3140	591311	5
3140	727024	1
3140	752387	2
3140	319977	3
3141	727024	3
3141	226251	3
3141	322677	3
3141	319977	1
3142	540828	5
3142	319977	5
3143	214399	2
3143	319977	4
3143	551320	4
3143	123036	2
3143	657852	1
3144	494940	5
3144	727024	4
3145	765884	3
3145	302850	2
3145	657852	2
3145	238569	5
3146	278562	4
3146	662181	3
3147	226251	5
3147	617776	5
3148	584502	4
3148	160692	3
3149	591311	3
3149	617776	3
3149	325139	1
3150	540828	2
3150	150161	3
3150	464331	2
3151	776626	3
3151	209180	2
3151	226251	5
3151	349129	4
3151	602951	4
3151	712605	1
3152	464331	1
3153	602951	5
3153	319977	2
3154	150181	2
3154	551320	3
3154	322677	3
3155	560017	5
3155	238569	4
3156	404719	5
3156	322677	2
3157	476299	4
3157	354619	3
3157	150181	4
3157	680088	3
3157	226251	5
3157	464331	4
3158	617776	4
3158	123036	2
3159	617776	5
3159	690765	1
3159	404719	4
3159	322677	3
3159	278562	1
3160	319977	3
3160	622500	5
3160	149183	4
3160	565245	2
3160	150161	3
3161	476299	3
3161	551320	3
3161	169537	3
3161	322677	2
3161	617776	1
3162	749887	2
3162	662181	4
3162	296215	4
3162	209180	2
3163	118277	4
3164	494940	1
3164	476299	3
3164	617776	3
3164	765884	3
3165	617776	5
3165	160692	3
3165	343041	4
3165	476299	4
3166	476299	5
3166	729979	5
3166	540828	2
3166	325139	3
3167	662181	4
3167	209180	4
3167	343041	4
3167	617776	1
3167	663789	3
3168	149183	3
3168	749887	4
3168	591311	5
3168	209180	3
3168	765884	2
3169	123036	2
3169	354619	4
3170	617776	3
3170	622500	3
3170	316097	2
3171	584502	2
3171	325139	4
3172	325139	2
3172	551320	3
3172	118277	1
3172	560017	4
3172	476299	4
3173	752387	4
3173	123036	4
3173	602951	2
3173	622500	2
3173	464331	5
3173	560017	4
3174	551320	4
3174	776626	5
3174	296215	1
3175	209180	4
3175	123036	4
3176	354619	2
3176	404719	1
3176	343041	1
3176	150161	2
3176	322677	4
3177	383805	2
3177	749887	2
3178	537539	4
3178	752387	1
3179	150161	3
3179	640479	3
3179	663789	3
3180	322677	5
3180	749887	4
3181	169537	2
3181	565245	2
3182	354619	5
3182	712605	4
3183	537539	1
3183	727024	2
3183	118277	2
3183	169537	3
3183	123036	5
3184	690765	5
3184	464331	5
3184	238569	2
3185	214399	3
3185	354619	3
3185	640479	3
3185	776626	3
3186	591311	3
3186	383805	4
3186	663789	3
3187	591311	3
3187	729979	2
3187	325139	4
3187	149183	3
3188	354619	4
3188	464331	2
3189	676078	2
3189	354619	2
3189	325139	4
3190	729979	4
3190	123036	2
3190	464331	3
3191	169537	3
3191	404719	4
3191	690765	5
3191	322677	3
3191	663789	1
3191	551320	2
3192	749887	3
3192	325139	2
3192	560017	3
3193	476299	4
3193	404719	3
3193	680088	1
3194	214399	3
3194	560017	2
3194	150181	5
3194	209180	1
3194	149183	2
3195	640479	4
3195	296215	2
3195	316097	4
3195	680088	3
3196	238569	3
3196	676078	2
3196	727024	1
3196	560017	4
3196	319977	3
3197	663789	3
3197	150181	4
3197	727024	4
3197	123036	4
3198	150181	2
3198	354619	2
3198	540828	4
3198	657852	4
3199	349129	2
3199	712605	1
3199	551320	5
3200	584502	5
3200	383805	4
3200	214399	1
3200	617776	3
3200	765884	3
3200	712605	5
3201	584502	2
3201	729979	3
3201	169537	4
3202	640479	4
3202	319977	2
3202	123036	3
3202	209180	2
3202	560017	2
3203	464331	2
3203	160692	1
3203	622500	4
3203	296215	1
3204	560017	2
3204	150181	3
3204	749887	3
3204	712605	2
3205	149183	2
3205	464331	4
3205	537539	3
3206	278562	3
3206	343041	4
3206	226251	1
3206	591311	4
3207	150161	1
3207	322677	4
3207	226251	3
3208	602951	4
3208	278562	1
3208	296215	5
3209	278562	2
3209	118277	3
3209	765884	4
3209	540828	1
3209	676078	3
3209	776626	4
3210	622500	3
3210	657852	5
3210	214399	2
3211	464331	4
3211	476299	3
3212	617776	4
3212	752387	4
3212	238569	2
3212	354619	4
3212	214399	2
3213	565245	3
3213	663789	3
3214	319977	4
3214	640479	4
3214	354619	4
3214	150161	4
3214	752387	1
3215	765884	4
3215	349129	3
3215	354619	3
3215	150181	3
3216	476299	5
3216	622500	2
3217	404719	2
3217	296215	3
3218	640479	3
3218	214399	3
3218	150181	4
3219	765884	2
3219	727024	4
3219	464331	1
3220	464331	3
3220	226251	3
3220	727024	3
3221	123036	3
3221	325139	1
3222	354619	4
3222	278562	5
3222	584502	2
3223	591311	4
3223	149183	4
3223	729979	2
3223	551320	3
3223	214399	5
3224	319977	4
3224	565245	5
3224	537539	3
3225	749887	2
3225	729979	2
3225	214399	2
3225	622500	4
3226	150181	4
3227	565245	4
3227	680088	4
3227	617776	2
3227	657852	2
3227	150181	3
3227	214399	3
3228	296215	2
3229	404719	2
3230	404719	1
3230	123036	4
3230	663789	4
3230	296215	3
3230	622500	3
3230	214399	2
3231	383805	3
3231	680088	4
3231	118277	5
3232	752387	4
3232	680088	3
3232	729979	1
3233	349129	5
3233	752387	3
3233	226251	1
3233	494940	2
3233	537539	2
3234	214399	5
3234	150181	1
3234	169537	1
3234	662181	2
3234	565245	4
3235	296215	3
3235	325139	4
3236	322677	5
3236	149183	2
3236	383805	5
3236	663789	4
3237	160692	4
3237	209180	3
3237	537539	2
3237	494940	1
3237	657852	3
3238	712605	4
3238	540828	2
3239	343041	4
3239	690765	2
3240	296215	1
3240	680088	4
3240	226251	4
3240	343041	2
3241	560017	5
3241	209180	2
3241	752387	3
3241	160692	5
3241	584502	5
3241	676078	4
3242	676078	5
3242	404719	4
3242	712605	2
3242	494940	2
3243	640479	4
3244	565245	4
3244	118277	3
3244	226251	1
3244	551320	2
3244	316097	2
3244	765884	4
3245	690765	1
3245	622500	4
3245	354619	3
3245	169537	3
3246	537539	3
3246	657852	2
3246	560017	1
3247	150161	2
3247	712605	4
3247	551320	3
3247	752387	2
3248	464331	3
3248	404719	5
3248	319977	1
3248	680088	2
3248	617776	1
3249	657852	3
3249	325139	5
3249	640479	1
3249	169537	4
3249	278562	1
3250	209180	5
3250	602951	3
3251	551320	3
3251	383805	3
3251	663789	3
3251	322677	2
3251	662181	1
3251	278562	4
3252	316097	3
3252	476299	3
3252	169537	1
3252	226251	5
3253	123036	4
3254	383805	3
3254	565245	3
3254	551320	5
3254	776626	2
3254	226251	3
3255	476299	4
3256	343041	4
3256	404719	4
3256	494940	2
3256	464331	1
3256	602951	4
3257	278562	2
3258	729979	5
3258	640479	3
3258	584502	2
3258	537539	3
3258	727024	5
3259	749887	2
3259	680088	3
3259	662181	2
3260	150161	3
3260	349129	1
3260	325139	2
3260	680088	5
3260	537539	3
3261	690765	3
3261	150181	5
3261	302850	4
3261	565245	4
3261	657852	4
3262	712605	4
3262	404719	4
3262	565245	4
3262	214399	3
3262	676078	4
3263	617776	4
3263	680088	4
3263	404719	4
3263	302850	3
3263	752387	5
3264	765884	4
3264	160692	3
3264	712605	2
3265	464331	2
3266	325139	5
3266	209180	5
3266	776626	5
3267	226251	3
3267	676078	4
3267	640479	1
3268	752387	4
3268	404719	4
3268	160692	4
3269	296215	5
3269	560017	4
3270	214399	2
3271	325139	3
3271	238569	2
3271	727024	4
3271	214399	3
3272	537539	1
3272	584502	2
3272	325139	2
3273	560017	4
3273	752387	2
3273	537539	2
3273	584502	2
3273	727024	2
3273	118277	1
3274	551320	3
3275	727024	2
3275	325139	4
3275	712605	5
3275	209180	3
3276	537539	5
3276	752387	3
3276	680088	1
3276	316097	3
3277	540828	1
3277	640479	3
3278	123036	3
3278	278562	3
3278	322677	4
3279	118277	2
3279	149183	4
3279	150181	2
3279	349129	3
3279	551320	4
3280	565245	2
3281	584502	3
3281	591311	4
3282	584502	3
3282	494940	2
3282	354619	5
3282	150181	3
3282	729979	3
3282	343041	2
3283	622500	4
3283	123036	1
3283	680088	3
3283	690765	2
3283	727024	1
3283	169537	3
3284	464331	2
3284	322677	2
3284	776626	2
3285	729979	5
3285	680088	1
3286	464331	3
3286	749887	5
3287	319977	4
3287	584502	5
3287	712605	5
3287	349129	4
3287	322677	3
3288	602951	3
3288	765884	2
3288	214399	3
3288	354619	3
3288	123036	4
3288	296215	3
3289	149183	3
3289	752387	3
3289	238569	5
3289	464331	1
3289	640479	3
3290	657852	2
3290	150161	3
3290	560017	1
3290	602951	4
3291	622500	2
3291	476299	4
3292	494940	2
3292	551320	2
3293	712605	5
3293	226251	3
3293	150161	2
3293	622500	3
3293	663789	2
3294	617776	2
3294	150161	2
3295	565245	4
3295	690765	4
3295	118277	4
3296	565245	4
3296	383805	4
3296	617776	2
3296	662181	1
3296	226251	3
3297	354619	1
3297	123036	4
3297	657852	2
3298	349129	3
3298	622500	4
3298	560017	3
3298	238569	3
3298	325139	3
3298	690765	3
3299	690765	2
3299	296215	4
3299	584502	1
3299	622500	3
3299	657852	4
3300	729979	3
3300	123036	4
3300	404719	2
3300	617776	4
3300	209180	5
3301	765884	3
3301	712605	3
3301	752387	2
3302	150181	4
3302	729979	3
3302	319977	2
3302	752387	2
3302	383805	3
3303	160692	3
3303	118277	2
3304	662181	1
3304	322677	1
3305	343041	1
3305	354619	2
3305	540828	1
3306	680088	4
3306	676078	2
3306	727024	5
3306	349129	3
3307	343041	4
3307	776626	3
3307	551320	2
3307	118277	1
3307	640479	3
3307	540828	2
3308	123036	5
3308	765884	4
3308	584502	5
3308	319977	1
3309	160692	1
3309	343041	4
3309	316097	5
3309	584502	3
3309	214399	5
3310	727024	5
3310	494940	2
3310	602951	4
3310	676078	2
3310	169537	5
3311	118277	5
3311	354619	4
3311	712605	3
3311	640479	3
3311	776626	4
3311	617776	2
3312	591311	4
3312	278562	5
3312	662181	1
3313	383805	2
3313	752387	1
3313	565245	1
3313	238569	3
3314	494940	4
3314	690765	3
3314	209180	4
3314	712605	3
3315	150181	4
3315	584502	2
3315	169537	4
3315	727024	1
3315	319977	2
3316	383805	5
3316	123036	3
3316	712605	1
3316	622500	3
3316	160692	4
3317	752387	3
3317	680088	5
3317	640479	5
3317	551320	2
3317	325139	3
3317	565245	4
3318	150181	3
3319	729979	4
3319	160692	2
3319	712605	3
3319	776626	5
3320	383805	1
3320	676078	3
3320	322677	3
3320	551320	3
3321	680088	3
3321	150161	3
3321	712605	2
3322	404719	3
3322	322677	3
3323	349129	4
3323	319977	4
3323	617776	4
3323	343041	4
3323	602951	1
3323	322677	2
3324	160692	3
3324	712605	3
3324	150181	1
3324	349129	1
3325	354619	5
3325	343041	3
3325	302850	4
3326	209180	3
3326	226251	2
3326	123036	1
3327	662181	4
3327	214399	5
3327	622500	3
3327	776626	2
3327	169537	3
3328	150161	3
3328	727024	4
3328	278562	2
3329	325139	4
3329	676078	5
3329	404719	4
3329	640479	4
3329	551320	5
3329	662181	2
3330	476299	5
3331	602951	4
3331	591311	2
3331	551320	5
3331	226251	2
3331	584502	4
3332	494940	1
3332	118277	3
3332	238569	3
3333	476299	4
3333	537539	3
3334	617776	2
3334	676078	2
3334	118277	3
3334	494940	2
3334	690765	3
3335	560017	4
3335	278562	3
3335	238569	3
3336	729979	3
3336	540828	5
3337	123036	1
3337	476299	5
3337	537539	1
3337	560017	2
3337	383805	4
3338	296215	2
3338	322677	3
3339	584502	2
3339	302850	3
3340	680088	1
3340	640479	5
3341	150181	5
3341	749887	2
3341	663789	4
3341	765884	2
3341	404719	2
3342	322677	3
3342	238569	4
3342	662181	5
3343	752387	3
3343	302850	3
3344	302850	3
3344	214399	2
3344	383805	4
3345	540828	2
3345	752387	3
3345	325139	3
3346	343041	4
3347	690765	5
3347	160692	4
3347	540828	1
3347	118277	3
3347	680088	2
3348	662181	5
3348	476299	2
3349	622500	2
3350	278562	4
3350	349129	2
3351	640479	5
3352	226251	5
3352	584502	3
3352	349129	2
3352	663789	2
3352	712605	5
3353	617776	3
3353	150161	1
3353	591311	2
3353	149183	1
3354	622500	3
3354	302850	2
3355	150181	5
3355	752387	3
3355	540828	1
3356	383805	2
3356	565245	2
3357	404719	3
3357	118277	1
3357	316097	3
3358	123036	5
3358	325139	4
3358	296215	2
3358	540828	3
3359	476299	3
3359	319977	3
3359	662181	4
3360	537539	2
3360	149183	5
3360	565245	3
3360	383805	2
3361	343041	4
3361	476299	3
3361	560017	2
3362	640479	2
3362	319977	4
3362	617776	4
3362	712605	3
3362	343041	4
3363	680088	4
3363	617776	3
3363	676078	5
3363	160692	4
3363	640479	3
3364	776626	2
3364	584502	4
3365	551320	4
3365	752387	5
3365	316097	1
3365	160692	4
3366	238569	1
3366	765884	2
3366	551320	1
3366	712605	5
3367	322677	3
3367	319977	1
3368	278562	2
3368	712605	2
3368	209180	5
3368	765884	4
3368	238569	4
3369	494940	2
3369	322677	2
3369	752387	4
3370	118277	1
3370	343041	3
3371	622500	3
3371	149183	4
3371	680088	4
3372	169537	2
3372	752387	2
3373	752387	5
3373	343041	2
3374	316097	2
3374	690765	1
3375	325139	5
3375	149183	5
3375	727024	3
3375	690765	2
3375	537539	2
3375	663789	3
3376	169537	5
3377	680088	4
3377	657852	3
3377	565245	4
3378	657852	3
3378	118277	3
3378	494940	2
3378	537539	2
3379	494940	1
3379	343041	2
3380	663789	3
3380	302850	4
3380	680088	3
3381	540828	5
3381	404719	3
3381	160692	4
3382	765884	5
3382	325139	4
3383	354619	4
3383	690765	4
3383	640479	3
3383	214399	4
3384	325139	4
3384	765884	2
3385	602951	3
3385	540828	5
3385	765884	2
3385	776626	1
3385	584502	3
3386	676078	1
3386	584502	3
3386	319977	4
3387	160692	5
3387	560017	2
3387	118277	1
3387	226251	3
3387	551320	4
3387	278562	2
3388	150181	4
3388	494940	4
3388	584502	2
3389	560017	1
3389	404719	2
3389	118277	3
3390	343041	4
3391	349129	3
3391	752387	2
3391	494940	3
3391	551320	4
3391	118277	4
3391	591311	3
3392	302850	4
3392	617776	3
3393	319977	2
3393	383805	2
3393	476299	2
3393	776626	3
3393	540828	4
3393	663789	1
3394	238569	4
3394	560017	3
3394	296215	4
3394	150161	3
3395	123036	3
3395	296215	2
3395	383805	3
3395	663789	3
3396	118277	4
3396	591311	1
3396	150181	2
3396	584502	4
3396	640479	1
3397	349129	3
3397	214399	1
3397	123036	2
3397	752387	3
3397	565245	4
3398	150161	3
3398	617776	2
3398	676078	4
3399	319977	2
3399	537539	3
3399	296215	1
3399	663789	3
3399	494940	3
3399	749887	3
3400	278562	2
3400	150181	3
3401	150161	2
3402	494940	1
3402	617776	2
3403	343041	2
3403	209180	4
3403	765884	3
3404	712605	1
3404	749887	4
3404	752387	2
3404	776626	3
3405	316097	2
3405	617776	4
3405	680088	2
3405	690765	5
3405	226251	4
3406	602951	5
3406	752387	2
3406	749887	1
3406	537539	1
3406	663789	3
3406	680088	2
3407	617776	4
3407	354619	2
3407	214399	5
3408	226251	3
3408	676078	4
3408	727024	3
3408	316097	5
3409	209180	5
3409	118277	1
3409	494940	4
3409	560017	2
3409	319977	4
3410	325139	1
3410	296215	3
3411	349129	2
3411	343041	1
3411	209180	3
3411	565245	3
3411	537539	5
3412	727024	4
3412	622500	2
3413	560017	3
3413	729979	2
3413	278562	2
3414	150181	3
3415	160692	4
3415	551320	2
3415	464331	2
3415	680088	3
3416	663789	5
3416	464331	4
3416	319977	2
3417	727024	1
3417	160692	4
3417	617776	1
3417	676078	4
3417	238569	4
3417	302850	4
3418	540828	4
3418	752387	4
3418	776626	3
3419	226251	3
3419	560017	4
3419	150181	1
3419	752387	3
3419	622500	4
3420	160692	3
3420	551320	2
3421	296215	3
3421	663789	1
3421	322677	4
3422	214399	2
3422	226251	2
3422	278562	2
3422	662181	5
3423	404719	2
3423	776626	4
3423	325139	4
3423	765884	4
3424	752387	2
3424	749887	1
3424	657852	4
3425	749887	5
3425	349129	1
3425	160692	3
3426	584502	2
3426	123036	3
3426	226251	4
3426	663789	4
3427	325139	4
3428	169537	2
3428	316097	3
3429	214399	5
3429	676078	1
3429	602951	3
3430	680088	3
3431	640479	2
3431	302850	5
3432	584502	2
3432	464331	3
3433	316097	3
3433	226251	3
3434	319977	3
3434	349129	5
3434	169537	4
3434	663789	3
3435	316097	2
3435	214399	2
3435	343041	4
3435	776626	4
3436	226251	2
3436	325139	3
3437	680088	2
3437	343041	2
3437	160692	4
3438	319977	2
3438	591311	2
3438	494940	5
3438	727024	3
3439	316097	2
3440	622500	5
3441	712605	4
3441	383805	3
3441	565245	4
3441	540828	3
3441	118277	2
3442	325139	4
3443	464331	2
3443	383805	3
3443	238569	2
3443	123036	4
3444	565245	3
3444	663789	2
3444	149183	1
3445	150161	4
3445	238569	5
3445	551320	2
3446	584502	3
3446	383805	1
3447	663789	1
3447	551320	3
3447	765884	1
3447	349129	5
3447	150161	2
3448	622500	2
3448	160692	4
3448	319977	2
3449	622500	3
3449	729979	3
3450	622500	2
3450	749887	2
3450	123036	2
3450	214399	2
3451	776626	3
3451	149183	4
3451	343041	3
3451	316097	2
3452	565245	1
3452	640479	2
3452	551320	3
3453	494940	3
3453	776626	2
3453	584502	1
3454	349129	2
3454	322677	4
3455	729979	5
3455	640479	3
3455	319977	4
3456	551320	2
3457	752387	1
3457	325139	3
3457	680088	4
3457	584502	5
3458	319977	3
3458	776626	2
3458	296215	1
3459	560017	5
3459	727024	4
3459	316097	1
3460	383805	3
3460	690765	3
3460	749887	4
3460	662181	4
3461	150161	2
3461	494940	2
3461	727024	2
3461	349129	4
3462	123036	2
3462	565245	2
3462	349129	4
3462	296215	4
3463	404719	3
3463	680088	4
3463	591311	2
3463	560017	2
3463	776626	2
3463	494940	2
3464	316097	2
3464	150181	1
3464	560017	3
3464	565245	4
3464	622500	4
3465	540828	3
3465	565245	3
3466	565245	3
3466	150181	3
3466	343041	2
3466	622500	4
3466	690765	1
3467	537539	2
3467	404719	4
3467	662181	4
3468	404719	3
3468	727024	2
3469	752387	3
3469	776626	4
3469	354619	2
3470	494940	3
3470	209180	3
3470	584502	3
3471	319977	2
3472	464331	3
3472	640479	4
3472	565245	4
3472	150181	2
3472	322677	5
3473	584502	1
3473	343041	5
3474	640479	1
3474	663789	2
3474	617776	4
3474	296215	5
3475	354619	2
3475	349129	5
3476	160692	3
3476	776626	3
3476	680088	4
3476	551320	2
3476	214399	1
3477	584502	4
3477	676078	1
3477	343041	2
3477	540828	3
3477	123036	3
3478	584502	2
3478	591311	4
3478	316097	4
3478	565245	3
3478	676078	2
3479	640479	4
3479	690765	4
3479	540828	4
3479	591311	5
3479	622500	2
3480	319977	1
3480	663789	3
3480	680088	3
3480	676078	1
3480	765884	3
3481	118277	5
3482	209180	4
3482	602951	3
3483	729979	4
3483	540828	2
3483	591311	2
3484	160692	3
3484	680088	5
3484	752387	4
3485	316097	3
3485	302850	4
3486	343041	4
3486	118277	3
3487	325139	4
3487	476299	5
3487	354619	2
3487	663789	3
3488	160692	2
3489	494940	3
3489	663789	1
3489	150161	3
3489	343041	2
3489	383805	4
3489	565245	4
\.


--
-- Data for Name: produit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produit (ref, nom, prix, idcategorie) FROM stdin;
602951	small star +	88.8299999999999983	1
296215	thin wolf	1.95999999999999996	2
169537	turbo puma	1	5
749887	super bravo IV	108.079999999999998	5
238569	easy moon +	83.9500000000000028	5
680088	small owl +	1.54000000000000004	2
150161	mega wolf +	52.7800000000000011	5
343041	thin wolf II	3.5	3
160692	easy owl V	3.91000000000000014	4
537539	nano moon	10.2699999999999996	4
325139	super furax pro	5.16999999999999993	3
150181	super bravo pro	6.01999999999999957	2
214399	micro tango	9	4
383805	zen furax pro	34.759999999999998	5
319977	zen cobra III	5.11000000000000032	3
617776	thin colibri +	9.99000000000000021	4
464331	big cobra II	11.8499999999999996	3
765884	super moon IV	5.44000000000000039	2
349129	mini moon 3000	9.64000000000000057	4
209180	super ringo III	11.5500000000000007	4
560017	big star pro	6.46999999999999975	4
118277	super ringo 2000	4.05999999999999961	3
226251	micro bravo +	1.59000000000000008	2
494940	turbo colibri pro	38.1099999999999994	1
123036	turbo fox 2000	3.45999999999999996	2
322677	zen bravo 2000	12.0299999999999994	4
657852	zen furax IV	4.79999999999999982	4
476299	nano cobra IV	4.5	2
690765	easy owl 3000	53.4699999999999989	5
640479	nano fox	12.2400000000000002	3
729979	easy zebra IV	7.91000000000000014	3
149183	mega bravo	4.71999999999999975	3
316097	mega tango +	2.49000000000000021	3
404719	micro star +	116.359999999999999	6
712605	thin tango	67.1299999999999955	5
584502	thin colibri IV	8.13000000000000078	3
551320	nano cobra 3000	7.04000000000000004	2
776626	easy zebra II	21.7100000000000009	5
727024	thin colibri pro	7.40000000000000036	4
663789	turbo colibri 2000	47.5799999999999983	5
622500	zen moon +	11.2599999999999998	5
540828	zen cobra pro	2.2200000000000002	2
662181	turbo wolf	15.1500000000000004	3
676078	turbo colibri III	224.47999999999999	1
565245	super puma II	40.4699999999999989	1
591311	mega alpha +	3.74000000000000021	4
752387	super wolf +	95.6899999999999977	5
278562	zen colibri IV	47.8299999999999983	5
354619	zen moon 2000	11.9399999999999995	4
302850	nano colibri 2000	53.9799999999999969	1
\.


--
-- Name: adresse adresse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pkey PRIMARY KEY (id, idclient);


--
-- Name: categorie categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (id);


--
-- Name: paiement paiement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT paiement_pkey PRIMARY KEY (id);


--
-- Name: porter porter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.porter
    ADD CONSTRAINT porter_pkey PRIMARY KEY (idcommande, refproduit);


--
-- Name: produit produit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_pkey PRIMARY KEY (ref);


--
-- Name: adresse adresse_idclient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_idclient_fkey FOREIGN KEY (idclient) REFERENCES public.client(id);


--
-- Name: client client_parrain_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_parrain_fkey FOREIGN KEY (parrain) REFERENCES public.client(id);


--
-- Name: commande commande_idadrlivraison_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_idadrlivraison_fkey FOREIGN KEY (idadrlivraison, idclient) REFERENCES public.adresse(id, idclient);


--
-- Name: commande commande_idclient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_idclient_fkey FOREIGN KEY (idclient) REFERENCES public.client(id);


--
-- Name: commande commande_idpaiement_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_idpaiement_fkey FOREIGN KEY (idpaiement) REFERENCES public.paiement(id);


--
-- Name: porter porter_idcommande_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.porter
    ADD CONSTRAINT porter_idcommande_fkey FOREIGN KEY (idcommande) REFERENCES public.commande(id);


--
-- Name: porter porter_refproduit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.porter
    ADD CONSTRAINT porter_refproduit_fkey FOREIGN KEY (refproduit) REFERENCES public.produit(ref);


--
-- Name: produit produit_idcategorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_idcategorie_fkey FOREIGN KEY (idcategorie) REFERENCES public.categorie(id);


--
-- Name: TABLE adresse; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.adresse TO uti_gerant;


--
-- Name: TABLE categorie; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.categorie TO uti_gerant;


--
-- Name: TABLE client; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.client TO uti_gerant;


--
-- Name: TABLE commande; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.commande TO uti_gerant;


--
-- Name: TABLE paiement; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.paiement TO uti_gerant;


--
-- Name: TABLE porter; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.porter TO uti_gerant;


--
-- Name: TABLE produit; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.produit TO uti_gerant;


--
-- PostgreSQL database dump complete
--

