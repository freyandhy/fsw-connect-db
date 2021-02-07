--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: articles; Type: TABLE; Schema: public; Owner: frey
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    author integer NOT NULL,
    publish boolean DEFAULT false NOT NULL
);


ALTER TABLE public.articles OWNER TO frey;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: frey
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO frey;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frey
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: frey
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.authors OWNER TO frey;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: frey
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO frey;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frey
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: frey
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: frey
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: frey
--

COPY public.articles (id, title, content, author, publish) FROM stdin;
1	Judul	Isi	1	f
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: frey
--

COPY public.authors (id, name, email) FROM stdin;
1	Frey	frey@gmail.com
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frey
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, true);


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frey
--

SELECT pg_catalog.setval('public.authors_id_seq', 1, true);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: frey
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: frey
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

