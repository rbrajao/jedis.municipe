--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Homebrew)
-- Dumped by pg_dump version 14.10 (Homebrew)

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
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: brajao
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO brajao;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: brajao
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO brajao;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brajao
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: brajao
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO brajao;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: brajao
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO brajao;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brajao
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: brajao
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO brajao;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: brajao
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO brajao;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brajao
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: brajao
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    zipcode character varying,
    street character varying,
    complement character varying,
    district character varying,
    city character varying,
    state character varying,
    ibge_code character varying,
    municipe_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.addresses OWNER TO brajao;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: brajao
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO brajao;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brajao
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: brajao
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO brajao;

--
-- Name: municipes; Type: TABLE; Schema: public; Owner: brajao
--

CREATE TABLE public.municipes (
    id bigint NOT NULL,
    name character varying,
    cpf character varying,
    cns character varying,
    email character varying,
    country_code character varying,
    mobile character varying,
    birthday date,
    status boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    photo character varying
);


ALTER TABLE public.municipes OWNER TO brajao;

--
-- Name: municipes_id_seq; Type: SEQUENCE; Schema: public; Owner: brajao
--

CREATE SEQUENCE public.municipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipes_id_seq OWNER TO brajao;

--
-- Name: municipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brajao
--

ALTER SEQUENCE public.municipes_id_seq OWNED BY public.municipes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: brajao
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO brajao;

--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: municipes id; Type: DEFAULT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.municipes ALTER COLUMN id SET DEFAULT nextval('public.municipes_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: brajao
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	photo	Municipe	3	1	2024-01-11 16:52:21.860802
2	photo	Municipe	2	2	2024-01-11 16:53:55.266053
3	photo	Municipe	4	3	2024-01-11 16:57:15.579474
4	photo	Municipe	1	4	2024-01-11 16:57:27.812327
7	photo	Municipe	5	7	2024-01-11 17:22:11.721999
8	image	ActiveStorage::VariantRecord	1	8	2024-01-11 17:35:17.33539
9	image	ActiveStorage::VariantRecord	2	9	2024-01-11 17:49:58.500176
10	image	ActiveStorage::VariantRecord	3	10	2024-01-11 18:00:31.038868
11	image	ActiveStorage::VariantRecord	4	11	2024-01-11 18:00:34.49279
12	image	ActiveStorage::VariantRecord	5	12	2024-01-11 20:12:45.794441
13	image	ActiveStorage::VariantRecord	6	13	2024-01-11 20:18:24.846357
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: brajao
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	49iwipp1rbn7hd661nc0ei54iq23	pira.jpg	image/webp	{"identified":true,"analyzed":true}	local	75150	eo7eVhOMvaN2kdHYRrNQQQ==	2024-01-11 16:52:21.857287
2	key1x3siqmy1ytatmtr7nhpxicbh	pira.jpg	image/webp	{"identified":true,"analyzed":true}	local	75150	eo7eVhOMvaN2kdHYRrNQQQ==	2024-01-11 16:53:55.263943
3	u5l9svr7vfnvb3vwg5iv6utufjv0	pira.jpg	image/webp	{"identified":true,"analyzed":true}	local	75150	eo7eVhOMvaN2kdHYRrNQQQ==	2024-01-11 16:57:15.577665
4	2s3iazu0he8tu6faa023gytjjbz9	pira.jpg	image/webp	{"identified":true,"analyzed":true}	local	75150	eo7eVhOMvaN2kdHYRrNQQQ==	2024-01-11 16:57:27.80948
7	furhul6pzsniw6ad4c8sg3sm7jgt	WhatsApp Image 2023-09-11 at 11.20.31.jpeg	image/jpeg	{"identified":true,"width":768,"height":1024,"analyzed":true}	local	110519	/yc0yQCaru1FKSThghWDvA==	2024-01-11 17:22:11.719578
8	klwgk7h1cmmc1mz7ogusqitdk4oi	pira.png	image/png	{"identified":true,"width":100,"height":67,"analyzed":true}	local	19891	KVWe+1lFHvWQeIp7ijPM1w==	2024-01-11 17:35:17.333968
9	5iw8eyeghpicg9jao2irgrgk7jlq	pira.png	image/png	{"identified":true,"width":32,"height":21,"analyzed":true}	local	2318	xhXb4Ss2UJEgszQOWCxz7A==	2024-01-11 17:49:58.498456
10	85hq7mnioqxr7ii8fjtwfh3wtg2q	pira.png	image/png	{"identified":true,"width":100,"height":67,"analyzed":true}	local	19891	KVWe+1lFHvWQeIp7ijPM1w==	2024-01-11 18:00:31.037529
11	anote4bbxgh8kvdf5zkpy3uqvc2a	WhatsApp Image 2023-09-11 at 11.20.31.jpeg	image/jpeg	{"identified":true,"width":75,"height":100,"analyzed":true}	local	3253	figCaQFxiiRGXIQYSUiUCg==	2024-01-11 18:00:34.491572
12	ak1byv58kcz618fkfmo32w16u8vo	pira.png	image/png	{"identified":true,"width":100,"height":67,"analyzed":true}	local	19891	KVWe+1lFHvWQeIp7ijPM1w==	2024-01-11 20:12:45.792211
13	amdpr0x9dlq6e1qgoxxzdj1vvgiv	pira.png	image/png	{"identified":true,"width":100,"height":67,"analyzed":true}	local	19891	KVWe+1lFHvWQeIp7ijPM1w==	2024-01-11 20:18:24.844995
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: brajao
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
1	1	uyx6Kcit1Aa78Mrn7bVgZ7OZn0Y=
2	1	szqopoUJcZbUeT6Jf2t1r0VVSVc=
3	4	uyx6Kcit1Aa78Mrn7bVgZ7OZn0Y=
4	7	6/MbmLdOctrj7ukuFyVm7nWShm4=
5	3	uyx6Kcit1Aa78Mrn7bVgZ7OZn0Y=
6	2	uyx6Kcit1Aa78Mrn7bVgZ7OZn0Y=
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: brajao
--

COPY public.addresses (id, zipcode, street, complement, district, city, state, ibge_code, municipe_id, created_at, updated_at) FROM stdin;
2	18190-000	dfgf dfdfgdfg 		sksksks	ksjdsak	SP	239478	2	2024-01-11 14:39:59.656908	2024-01-11 14:41:18.171162
3	18190-000	asdjkajksd	jsk	skds	33	DF		3	2024-01-11 16:19:18.792353	2024-01-11 16:19:18.792353
4	18190-000	akjakljdals		slkjdasl	ddd	ES	33	4	2024-01-11 16:20:23.827671	2024-01-11 16:20:23.827671
1	18190-556	ahkjah askjhaskd 		jkakjhasdk	sao paulo	CE	984874	1	2024-01-11 14:37:46.806769	2024-01-11 16:22:30.060365
5	04517-000	askldjasdj		asdjd	lakjdaskdj	AP		5	2024-01-11 16:30:40.243361	2024-01-11 16:30:40.243361
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: brajao
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-01-10 19:29:50.80337	2024-01-10 19:29:50.803371
\.


--
-- Data for Name: municipes; Type: TABLE DATA; Schema: public; Owner: brajao
--

COPY public.municipes (id, name, cpf, cns, email, country_code, mobile, birthday, status, created_at, updated_at, photo) FROM stdin;
3	Jorge Da Silva	31606527851	092485984375894	as@a.com	34	11998899879	2000-12-12	t	2024-01-11 01:15:46.403094	2024-01-11 16:52:21.931606	\N
1	Rafael Brajão	31606527851	543678123467896	a@a.com	599	11948375977	2024-01-10	t	2024-01-10 21:22:40.275134	2024-01-11 16:57:27.842882	\N
5	Pedro Carlos	76184422073	378492847923874	r@e.com	55	22432254353	1965-08-17	t	2024-01-11 16:30:40.237821	2024-01-11 17:22:11.781107	\N
4	jaodjsda apsid apsid	26461938826	923463563434633	a@as.vr	55	33342423423	1900-12-12	t	2024-01-11 01:27:24.603387	2024-01-11 20:12:51.754987	\N
2	Rafael Brajão 2	26461938826	928374927928746	a@a3.edu.spp.br	55	11997791420	1987-07-13	t	2024-01-10 22:17:27.058874	2024-01-11 20:18:31.952385	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: brajao
--

COPY public.schema_migrations (version) FROM stdin;
20240110194356
20240110201241
20240111164117
20240111164413
20240111203625
20240111204413
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brajao
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 13, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brajao
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 13, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brajao
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 6, true);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brajao
--

SELECT pg_catalog.setval('public.addresses_id_seq', 5, true);


--
-- Name: municipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brajao
--

SELECT pg_catalog.setval('public.municipes_id_seq', 5, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: municipes municipes_pkey; Type: CONSTRAINT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.municipes
    ADD CONSTRAINT municipes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: brajao
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: brajao
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: brajao
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: brajao
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_addresses_on_municipe_id; Type: INDEX; Schema: public; Owner: brajao
--

CREATE INDEX index_addresses_on_municipe_id ON public.addresses USING btree (municipe_id);


--
-- Name: addresses fk_rails_10095b934a; Type: FK CONSTRAINT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_rails_10095b934a FOREIGN KEY (municipe_id) REFERENCES public.municipes(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: brajao
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

