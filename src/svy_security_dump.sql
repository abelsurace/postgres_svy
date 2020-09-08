--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-3.pgdg18.04+1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-3.pgdg18.04+1)

-- Started on 2019-11-08 03:12:01 MST

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

SET default_with_oids = false;

--
-- TOC entry 200 (class 1259 OID 16405)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    permission_name character varying(50) NOT NULL,
    creation_datetime timestamp without time zone NOT NULL,
    modification_datetime timestamp without time zone,
    display_name character varying(50),
    creation_user_name character varying(50) NOT NULL,
    modification_user_name character varying(50)
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16395)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_name character varying(50) NOT NULL,
    display_name character varying(255),
    creation_datetime timestamp without time zone NOT NULL,
    modification_datetime timestamp without time zone,
    tenant_name character varying(50) NOT NULL,
    creation_user_name character varying(50) NOT NULL,
    modification_user_name character varying(50)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16415)
-- Name: roles_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_permissions (
    creation_datetime timestamp without time zone NOT NULL,
    modification_datetime timestamp without time zone,
    tenant_name character varying(50) NOT NULL,
    permission_name character varying(50) NOT NULL,
    role_name character varying(50) NOT NULL,
    creation_user_name character varying(50) NOT NULL,
    modification_user_name character varying(50)
);


ALTER TABLE public.roles_permissions OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16400)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(36) NOT NULL,
    session_start timestamp without time zone,
    session_end timestamp without time zone,
    ip_address character varying(50),
    user_agent_string character varying(256),
    last_client_ping timestamp without time zone,
    user_name character varying(50),
    tenant_name character varying(50),
    servoy_client_id character varying(36),
    session_duration integer,
    solution_name character varying(50)
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16390)
-- Name: tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenants (
    tenant_name character varying(50) NOT NULL,
    creation_datetime timestamp without time zone NOT NULL,
    modification_date timestamp without time zone,
    lock_flag integer,
    lock_reason character varying(50),
    lock_expiration timestamp without time zone,
    display_name character varying(50),
    creation_user_name character varying(50) NOT NULL,
    modification_user_name character varying(50),
    master_tenant_name character varying(50)
);


ALTER TABLE public.tenants OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16385)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    creation_datetime timestamp without time zone NOT NULL,
    modification_datetime timestamp without time zone,
    tenant_name character varying(50) NOT NULL,
    user_name character varying(50) NOT NULL,
    role_name character varying(50) NOT NULL,
    creation_user_name character varying(50) NOT NULL,
    modification_user_name character varying(50)
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16410)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_name character varying(50) NOT NULL,
    user_password character varying(64),
    display_name character varying(50),
    creation_datetime timestamp without time zone NOT NULL,
    modification_datetime timestamp without time zone,
    lock_flag integer,
    lock_reason character varying(50),
    lock_expiration timestamp without time zone,
    tenant_name character varying(50) NOT NULL,
    creation_user_name character varying(50) NOT NULL,
    access_token character varying(36),
    access_token_expiration timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 16405)
-- Dependencies: 200
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (permission_name, creation_datetime, modification_datetime, display_name, creation_user_name, modification_user_name) FROM stdin;
Administrators	2017-08-07 13:55:58.647	\N	\N	system_user	\N
SAMPLE-PERMISSION-ACCESS-FINANCIAL-DATA	2017-08-09 09:30:20.783	\N	SAMPLE-PERMISSION-ACCESS-FINANCIAL-DATA	system_user	\N
SAMPLE-PERMISSION-GENRATE-REPORT	2017-08-09 09:30:20.805	\N	SAMPLE-PERMISSION-GENRATE-REPORT	system_user	\N
SAMPLE-PERMISSION-MAINTAIN-CATEGORIES	2017-08-09 09:30:20.813	\N	SAMPLE-PERMISSION-MAINTAIN-CATEGORIES	system_user	\N
SAMPLE-PERMISSION-MANAGE-CATEGORIES	2017-08-09 09:30:20.819	\N	SAMPLE-PERMISSION-MANAGE-CATEGORIES	system_user	\N
SAMPLE-PERMISSION-PARTIAL-UI	2017-08-09 09:30:20.829	\N	SAMPLE-PERMISSION-PARTIAL-UI	system_user	\N
SAMPLE-PERMISSION-RESTRICTED-UI	2017-08-09 09:30:20.837	\N	SAMPLE-PERMISSION-RESTRICTED-UI	system_user	\N
SAMPLE-PERMISSION-UNRESTRICTED-UI	2017-08-09 09:30:20.845	\N	SAMPLE-PERMISSION-UNRESTRICTED-UI	system_user	\N
sister	2019-11-06 07:15:09.425	\N	sister	system_user	\N
\.


--
-- TOC entry 2959 (class 0 OID 16395)
-- Dependencies: 198
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_name, display_name, creation_datetime, modification_datetime, tenant_name, creation_user_name, modification_user_name) FROM stdin;
Managers	Managers Role	2017-08-09 09:32:26.01	2017-08-09 09:32:26.02	AcmeSol	system_user	\N
Clerks	Clerks Role	2017-08-09 09:32:26.054	2017-08-09 09:32:26.059	AcmeSol	system_user	\N
Guests	Guests Role	2017-08-09 09:32:26.091	2017-08-09 09:32:26.095	AcmeSol	system_user	\N
Accounting	Accounting Role	2017-08-09 09:32:26.108	2017-08-09 09:32:26.113	AcmeSol	system_user	\N
Foobar	Foobar	2017-08-22 10:36:35.163	\N	AcmeSol	admin	\N
littlesister	littlesister	2019-11-06 07:15:09.681	\N	womenheart	system_user	\N
\.


--
-- TOC entry 2963 (class 0 OID 16415)
-- Dependencies: 202
-- Data for Name: roles_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_permissions (creation_datetime, modification_datetime, tenant_name, permission_name, role_name, creation_user_name, modification_user_name) FROM stdin;
2017-08-09 09:32:26.029	\N	AcmeSol	SAMPLE-PERMISSION-UNRESTRICTED-UI	Managers	system_user	\N
2017-08-09 09:32:26.039	\N	AcmeSol	SAMPLE-PERMISSION-MANAGE-CATEGORIES	Managers	system_user	\N
2017-08-09 09:32:26.071	\N	AcmeSol	SAMPLE-PERMISSION-PARTIAL-UI	Clerks	system_user	\N
2017-08-09 09:32:26.078	\N	AcmeSol	SAMPLE-PERMISSION-MAINTAIN-CATEGORIES	Clerks	system_user	\N
2017-08-09 09:32:26.086	\N	AcmeSol	SAMPLE-PERMISSION-GENRATE-REPORT	Clerks	system_user	\N
2017-08-09 09:32:26.104	\N	AcmeSol	SAMPLE-PERMISSION-RESTRICTED-UI	Guests	system_user	\N
2017-08-09 09:32:26.123	\N	AcmeSol	SAMPLE-PERMISSION-ACCESS-FINANCIAL-DATA	Accounting	system_user	\N
2017-08-22 10:37:03.939	\N	AcmeSol	SAMPLE-PERMISSION-RESTRICTED-UI	Foobar	admin	\N
2019-11-06 07:15:09.727	\N	womenheart	sister	littlesister	system_user	\N
\.


--
-- TOC entry 2960 (class 0 OID 16400)
-- Dependencies: 199
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, session_start, session_end, ip_address, user_agent_string, last_client_ping, user_name, tenant_name, servoy_client_id, session_duration, solution_name) FROM stdin;
542A8F98-2F52-4A60-80B0-EA11DC973A4D	2017-08-15 12:12:42.739	2017-08-15 12:12:53.962	66.249.79.92	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	2017-08-15 12:12:52.754	clerk	AcmeSol	\N	\N	\N
644BEC21-6586-4D6E-9ED1-FB65DE0F90E0	2017-08-09 09:40:55.563	\N	2601:98a:4002:8da0:91e6:b96f:e643:5285	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	2017-08-09 11:14:55.576	manager	AcmeSol	\N	\N	\N
731ACD56-DC96-4724-986E-74B36925464A	2017-08-15 12:13:01.295	\N	2601:98a:4002:8da0:91e6:b96f:e643:5285	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	2017-08-15 12:16:41.336	guest	AcmeSol	\N	\N	\N
6FCEDCC7-11BD-41DF-8334-55E8FB19D0FB	2017-08-15 12:12:04.982	2017-08-15 12:12:31.043	66.249.79.92	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	2017-08-15 12:12:25.01	manager	AcmeSol	\N	\N	\N
7930B5A0-87FD-4BFC-ABF3-426E3C629402	2017-08-09 09:33:08.123	2017-08-09 09:40:50.005	66.249.79.92	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36	2017-08-09 09:40:48.143	manager	AcmeSol	\N	\N	\N
90F30F58-EEC8-4DFE-848A-C50E39E4D22E	2019-11-06 09:01:12.393	\N	127.0.0.1	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0	2019-11-06 09:12:12.544	baowan@hackatonapp.com	womenheart	EF47D287-41F8-4CD0-9129-C0A37E13BA5D	660151	\N
32683076-506E-4DE4-8419-99293EFA1F19	2019-11-06 09:12:47.008	\N	127.0.0.1	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0	2019-11-06 09:13:47.219	baowan@hackatonapp.com	womenheart	6DA331C0-E7E9-4F9C-AA19-EBC56A35A8FC	60211	\N
885AE1D7-EB7B-465E-80F9-2688C87B35D8	2019-11-06 09:14:30.835	\N	127.0.0.1	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0	2019-11-06 09:19:31.019	baowan@hackatonapp.com	womenheart	03DE1E90-1CD2-4114-A887-87524BF3AE7C	300184	\N
97C736B7-FB61-49B2-8C55-64962D194146	2019-11-06 09:19:39.456	\N	127.0.0.1	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0	2019-11-06 09:56:39.653	baowan@hackatonapp.com	womenheart	B1D8CC04-1BF6-440E-8A0C-E3AB16139DEF	2220197	\N
\.


--
-- TOC entry 2958 (class 0 OID 16390)
-- Dependencies: 197
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tenants (tenant_name, creation_datetime, modification_date, lock_flag, lock_reason, lock_expiration, display_name, creation_user_name, modification_user_name, master_tenant_name) FROM stdin;
Company A	2017-08-09 13:20:59.401	\N	\N	\N	\N	Company A	system_user	\N	\N
Company B	2017-08-09 13:21:39.826	\N	\N	\N	\N	Company B	system_user	\N	\N
Company C	2017-08-09 13:22:24.56	\N	\N	\N	\N	Company C	system_user	\N	\N
OK	2017-08-09 13:20:08.565	2017-08-18 09:11:40.489	\N	\N	\N	OK	system_user	\N	\N
AcmeSol	2017-08-09 09:32:25.983	2017-08-21 10:29:11.251	\N	\N	\N	Acme Solutions, Ltd.	system_user	\N	\N
womenheart	2019-11-06 07:15:09.541	\N	\N	\N	\N	womenheart	system_user	\N	\N
\.


--
-- TOC entry 2957 (class 0 OID 16385)
-- Dependencies: 196
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (creation_datetime, modification_datetime, tenant_name, user_name, role_name, creation_user_name, modification_user_name) FROM stdin;
2017-08-09 09:32:26.215	\N	AcmeSol	manager	Managers	system_user	\N
2017-08-09 09:32:26.226	\N	AcmeSol	manager	Accounting	system_user	\N
2017-08-09 09:32:26.278	\N	AcmeSol	clerk	Clerks	system_user	\N
2017-08-09 09:32:26.325	\N	AcmeSol	guest	Guests	system_user	\N
2017-08-22 10:37:11.441	\N	AcmeSol	guest	Foobar	admin	\N
2019-11-06 07:15:09.709	\N	womenheart	baowan@hackatonapp.com	littlesister	system_user	\N
\.


--
-- TOC entry 2962 (class 0 OID 16410)
-- Dependencies: 201
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_name, user_password, display_name, creation_datetime, modification_datetime, lock_flag, lock_reason, lock_expiration, tenant_name, creation_user_name, access_token, access_token_expiration) FROM stdin;
foo	A8510F68D426FD49:9999:AEDF930165145D9D081DC23E177F	foo	2017-08-18 09:15:13.504	2017-08-18 09:16:28.864	\N	\N	\N	AcmeSol	system_user	\N	\N
sean	A4258FEBF10796BE:9999:9B5B96EDFB89AD2160045B855535	sean	2017-08-21 13:31:38.299	2017-08-21 13:31:38.334	\N	\N	\N	AcmeSol	system_user	\N	\N
manager	BE7F92A4CCA8F0D2:9999:DED083293ECDA50CC165B06A279F	Manager - Sample	2017-08-09 09:32:26.136	2017-08-09 09:32:26.206	\N	\N	\N	AcmeSol	system_user	\N	\N
clerk	9322FE4137CF7B25:9999:876DB453852423FA8A4B0EAFB2BA	John Doe	2017-08-09 09:32:26.234	2017-08-22 10:18:44.013	1	\N	\N	AcmeSol	system_user	\N	\N
guest	7F6564A6169F265F:9999:7B8DB5F2A351EB9729DD06F68481	Guest - Sample	2017-08-09 09:32:26.285	2017-08-09 09:32:26.318	\N	\N	\N	AcmeSol	system_user	\N	\N
baowan@hackatonapp.com	388F3C250DCF75C8:10000:F236A10DC26156C45B4829BCDB1E3C4D3B263D50	baowan@hackatonapp.com	2019-11-06 07:15:09.574	2019-11-06 07:15:09.664	\N	\N	\N	womenheart	system_user	\N	\N
\.


--
-- TOC entry 2831 (class 2606 OID 16409)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (permission_name);


--
-- TOC entry 2835 (class 2606 OID 16419)
-- Name: roles_permissions roles_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT roles_permissions_pkey PRIMARY KEY (permission_name, role_name, tenant_name);


--
-- TOC entry 2827 (class 2606 OID 16399)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_name, tenant_name);


--
-- TOC entry 2829 (class 2606 OID 16404)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 2825 (class 2606 OID 16394)
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (tenant_name);


--
-- TOC entry 2823 (class 2606 OID 16389)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (role_name, tenant_name, user_name);


--
-- TOC entry 2833 (class 2606 OID 16414)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (tenant_name, user_name);


-- Completed on 2019-11-08 03:12:01 MST

--
-- PostgreSQL database dump complete
--

