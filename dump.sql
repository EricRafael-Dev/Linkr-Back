--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "postId" integer NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: post_trending; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.post_trending (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "trendingId" integer NOT NULL
);


--
-- Name: post_trending_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.post_trending_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: post_trending_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.post_trending_id_seq OWNED BY public.post_trending.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    description text,
    url text NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: trendings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trendings (
    id integer NOT NULL,
    trending text NOT NULL
);


--
-- Name: trendings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trendings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trendings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trendings_id_seq OWNED BY public.trendings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    photo text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: post_trending id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_trending ALTER COLUMN id SET DEFAULT nextval('public.post_trending_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: trendings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trendings ALTER COLUMN id SET DEFAULT nextval('public.trendings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: post_trending; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: trendings; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'fulaninha', 'fulana@fulana.com', '$2b$10$o4cy46ZwpZY.fMAxT8mzjeglf2IXjlq2j3lvDYWWGsUP6m4J9Em8W', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn-aB5brTmpeDnB_5cPXLxQl-j0khXeQl25-xewz8n7M08IFk7mt3BV-TKlK77AgTMhLA&usqp=CAU');
INSERT INTO public.users VALUES (2, 'maylinha', 'mayla@auau.com', '$2b$10$hCx225/7wJ5I3l1GFxhpQ.cbHpPcOvQIhrXHksH/ehgbRMld2jb8G', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsKIUdBQAswVyfHaRA2Koru1BsOH6u3MmdHUOxZLH-Tcg4lux1mUADHrINZ8W66bsvczs&usqp=CAU');
INSERT INTO public.users VALUES (3, 'joao', 'joao@joao.com', '$2b$10$Yp.UJp7ZyUdzKOLZhtt4Ou3C42rPK9itpkt559oec8ix1rh5lNDBa', 'data:image/jpeg;base64,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');


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.likes_id_seq', 1, false);


--
-- Name: post_trending_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.post_trending_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: trendings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trendings_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: post_trending post_trending_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_trending
    ADD CONSTRAINT post_trending_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: trendings trendings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trendings
    ADD CONSTRAINT trendings_pkey PRIMARY KEY (id);


--
-- Name: trendings trendings_trending_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trendings
    ADD CONSTRAINT trendings_trending_key UNIQUE (trending);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: likes likes_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: post_trending post_trending_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_trending
    ADD CONSTRAINT "post_trending_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: post_trending post_trending_trendingId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_trending
    ADD CONSTRAINT "post_trending_trendingId_fkey" FOREIGN KEY ("trendingId") REFERENCES public.trendings(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

