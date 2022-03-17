--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.0

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

DROP DATABASE logistica;
--
-- Name: logistica; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE logistica WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE logistica OWNER TO postgres;

\connect logistica

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: colaborador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaborador (
    idcolaborador integer NOT NULL,
    nome character varying(255) NOT NULL,
    cpf character varying(12) NOT NULL,
    email character varying(100) NOT NULL,
    idcolaborador_situacao integer DEFAULT 1 NOT NULL,
    idfilial integer NOT NULL
);
ALTER TABLE ONLY public.colaborador ALTER COLUMN idcolaborador SET STATISTICS 0;
ALTER TABLE ONLY public.colaborador ALTER COLUMN nome SET STATISTICS 0;
ALTER TABLE ONLY public.colaborador ALTER COLUMN cpf SET STATISTICS 0;
ALTER TABLE ONLY public.colaborador ALTER COLUMN email SET STATISTICS 0;


ALTER TABLE public.colaborador OWNER TO postgres;

--
-- Name: colaborador_idcolaborador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colaborador_idcolaborador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colaborador_idcolaborador_seq OWNER TO postgres;

--
-- Name: colaborador_idcolaborador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colaborador_idcolaborador_seq OWNED BY public.colaborador.idcolaborador;


--
-- Name: colaborador_situacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaborador_situacao (
    idcolaborador_situacao integer NOT NULL,
    descricao character varying(255) NOT NULL
);
ALTER TABLE ONLY public.colaborador_situacao ALTER COLUMN idcolaborador_situacao SET STATISTICS 0;
ALTER TABLE ONLY public.colaborador_situacao ALTER COLUMN descricao SET STATISTICS 0;


ALTER TABLE public.colaborador_situacao OWNER TO postgres;

--
-- Name: colaborador_situacao_idcolaborador_situacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colaborador_situacao_idcolaborador_situacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colaborador_situacao_idcolaborador_situacao_seq OWNER TO postgres;

--
-- Name: colaborador_situacao_idcolaborador_situacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colaborador_situacao_idcolaborador_situacao_seq OWNED BY public.colaborador_situacao.idcolaborador_situacao;


--
-- Name: ferias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ferias (
    idferias integer NOT NULL,
    data_inclusao timestamp(0) without time zone DEFAULT now() NOT NULL,
    data_inicio date NOT NULL,
    data_fim date NOT NULL,
    idcolaborador integer NOT NULL
);
ALTER TABLE ONLY public.ferias ALTER COLUMN idferias SET STATISTICS 0;


ALTER TABLE public.ferias OWNER TO postgres;

--
-- Name: ferias_idferias_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ferias_idferias_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ferias_idferias_seq OWNER TO postgres;

--
-- Name: ferias_idferias_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ferias_idferias_seq OWNED BY public.ferias.idferias;


--
-- Name: filial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filial (
    idfilial integer NOT NULL,
    fantasia character varying(255) NOT NULL
);
ALTER TABLE ONLY public.filial ALTER COLUMN idfilial SET STATISTICS 0;
ALTER TABLE ONLY public.filial ALTER COLUMN fantasia SET STATISTICS 0;


ALTER TABLE public.filial OWNER TO postgres;

--
-- Name: filial_idfilial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filial_idfilial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filial_idfilial_seq OWNER TO postgres;

--
-- Name: filial_idfilial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filial_idfilial_seq OWNED BY public.filial.idfilial;


--
-- Name: colaborador idcolaborador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador ALTER COLUMN idcolaborador SET DEFAULT nextval('public.colaborador_idcolaborador_seq'::regclass);


--
-- Name: colaborador_situacao idcolaborador_situacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador_situacao ALTER COLUMN idcolaborador_situacao SET DEFAULT nextval('public.colaborador_situacao_idcolaborador_situacao_seq'::regclass);


--
-- Name: ferias idferias; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ferias ALTER COLUMN idferias SET DEFAULT nextval('public.ferias_idferias_seq'::regclass);


--
-- Data for Name: colaborador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colaborador (idcolaborador, nome, cpf, email, idcolaborador_situacao, idfilial) FROM stdin;
\.
COPY public.colaborador (idcolaborador, nome, cpf, email, idcolaborador_situacao, idfilial) FROM '$$PATH$$/2940.dat';

--
-- Data for Name: colaborador_situacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colaborador_situacao (idcolaborador_situacao, descricao) FROM stdin;
\.
COPY public.colaborador_situacao (idcolaborador_situacao, descricao) FROM '$$PATH$$/2944.dat';

--
-- Data for Name: ferias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ferias (idferias, data_inclusao, data_inicio, data_fim, idcolaborador) FROM stdin;
\.
COPY public.ferias (idferias, data_inclusao, data_inicio, data_fim, idcolaborador) FROM '$$PATH$$/2942.dat';

--
-- Data for Name: filial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filial (idfilial, fantasia) FROM stdin;
\.
COPY public.filial (idfilial, fantasia) FROM '$$PATH$$/2946.dat';

--
-- Name: colaborador_idcolaborador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colaborador_idcolaborador_seq', 1, true);


--
-- Name: colaborador_situacao_idcolaborador_situacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colaborador_situacao_idcolaborador_situacao_seq', 2, true);


--
-- Name: ferias_idferias_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ferias_idferias_seq', 1, true);


--
-- Name: filial_idfilial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filial_idfilial_seq', 1, false);


--
-- Name: colaborador colaborador_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_cpf_key UNIQUE (cpf);


--
-- Name: colaborador colaborador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_pkey PRIMARY KEY (idcolaborador);


--
-- Name: colaborador_situacao colaborador_situacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador_situacao
    ADD CONSTRAINT colaborador_situacao_pkey PRIMARY KEY (idcolaborador_situacao);


--
-- Name: ferias ferias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ferias
    ADD CONSTRAINT ferias_pkey PRIMARY KEY (idferias);


--
-- Name: filial filial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filial
    ADD CONSTRAINT filial_pkey PRIMARY KEY (idfilial);


--
-- Name: colaborador colaborador_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_fk FOREIGN KEY (idcolaborador_situacao) REFERENCES public.colaborador_situacao(idcolaborador_situacao);


--
-- Name: colaborador colaborador_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_fk1 FOREIGN KEY (idfilial) REFERENCES public.filial(idfilial);


--
-- Name: ferias ferias_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ferias
    ADD CONSTRAINT ferias_fk FOREIGN KEY (idcolaborador) REFERENCES public.colaborador(idcolaborador);


--
-- PostgreSQL database dump complete
--

