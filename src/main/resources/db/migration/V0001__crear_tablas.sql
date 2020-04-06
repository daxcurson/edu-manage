--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 11.6

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
-- Name: modo_calculo_type; Type: TYPE; Schema: public; Owner: edumanage
--

CREATE TYPE public.modo_calculo_type AS ENUM (
    'CLASE',
    'SEMANA',
    'MES',
    'PAQUETE',
    'CANTIDAD'
);


ALTER TYPE public.modo_calculo_type OWNER TO edumanage;

--
-- Name: modo_facturacion_type; Type: TYPE; Schema: public; Owner: edumanage
--

CREATE TYPE public.modo_facturacion_type AS ENUM (
    'CLASE',
    'SEMANA',
    'MES',
    'PAQUETE',
    'EVENTO',
    'MES_VARIABLE'
);


ALTER TYPE public.modo_facturacion_type OWNER TO edumanage;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: carga_horarias_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.carga_horarias_seq
    START WITH 68
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carga_horarias_seq OWNER TO edumanage;

--
-- Name: carga_horarias; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.carga_horarias (
    id integer DEFAULT nextval('public.carga_horarias_seq'::regclass) NOT NULL,
    tipo_curso_id integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    horas_semanales numeric(8,2) NOT NULL,
    dias_semana integer NOT NULL,
    horas_clase numeric(8,2) NOT NULL
);


ALTER TABLE public.carga_horarias OWNER TO edumanage;

--
-- Name: carga_horarias_aud; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.carga_horarias_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    descripcion character varying(255),
    dias_semana integer,
    horas_clase real,
    horas_semanales character varying(255),
    tipo_curso_id integer
);


ALTER TABLE public.carga_horarias_aud OWNER TO edumanage;

--
-- Name: clases_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.clases_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clases_seq OWNER TO edumanage;

--
-- Name: clases; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.clases (
    id integer DEFAULT nextval('public.clases_seq'::regclass) NOT NULL,
    curso_id integer NOT NULL,
    profesor_id integer,
    descripcion character varying(100) NOT NULL,
    fecha_clase date NOT NULL,
    hora_comienzo time without time zone,
    hora_fin time without time zone,
    cancelada integer DEFAULT 0,
    mostrar_cancelada integer DEFAULT 0,
    comentarios text,
    grammar text,
    vocabulary text,
    communication text,
    homework text,
    book_pages text,
    suggestions text,
    sucursal_id integer,
    domicilio_clase character varying(100) DEFAULT NULL::character varying,
    no_recuperar integer DEFAULT 0,
    precio_por_hora numeric(8,2) DEFAULT 0.00,
    moneda_id integer DEFAULT 1,
    honorario_profesor_id integer DEFAULT 0 NOT NULL,
    horas_clase_freelance numeric(8,2) DEFAULT 0.00 NOT NULL,
    horas_clase_empleado numeric(8,2) DEFAULT 0.00 NOT NULL
);


ALTER TABLE public.clases OWNER TO edumanage;

--
-- Name: clases_aud; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.clases_aud (
    id integer NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    book_pages character varying(255),
    cancelada integer,
    comentarios character varying(255),
    communication character varying(255),
    domicilio_clase character varying(255),
    fecha_clase timestamp without time zone,
    grammar character varying(255),
    homework character varying(255),
    mostrar_cancelada integer,
    no_recuperar integer,
    precio_por_hora double precision,
    suggestions character varying(255),
    vocabulary character varying(255),
    curso_id integer,
    moneda_id integer,
    profesor_id bigint,
    sucursal_id integer
);


ALTER TABLE public.clases_aud OWNER TO edumanage;

--
-- Name: constantes_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.constantes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constantes_seq OWNER TO edumanage;

--
-- Name: constantes; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.constantes (
    id integer DEFAULT nextval('public.constantes_seq'::regclass) NOT NULL,
    nombre_variable character varying(40) NOT NULL,
    valor_variable character varying(40) NOT NULL
);


ALTER TABLE public.constantes OWNER TO edumanage;

--
-- Name: cursos_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.cursos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cursos_seq OWNER TO edumanage;

--
-- Name: duracion_modos_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.duracion_modos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.duracion_modos_seq OWNER TO edumanage;

--
-- Name: duracion_modos; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.duracion_modos (
    id integer DEFAULT nextval('public.duracion_modos_seq'::regclass) NOT NULL,
    descripcion character varying(100) NOT NULL,
    codigo character varying(30) NOT NULL
);


ALTER TABLE public.duracion_modos OWNER TO edumanage;

--
-- Name: estado_inscripcion; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.estado_inscripcion (
    id integer NOT NULL,
    descripcion character varying(30) NOT NULL,
    abreviatura character varying(1) NOT NULL
);


ALTER TABLE public.estado_inscripcion OWNER TO edumanage;

--
-- Name: estados_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.estados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estados_seq OWNER TO edumanage;

--
-- Name: estados; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.estados (
    id integer DEFAULT nextval('public.estados_seq'::regclass) NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public.estados OWNER TO edumanage;

--
-- Name: feriados_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.feriados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feriados_seq OWNER TO edumanage;

--
-- Name: feriados; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.feriados (
    id integer DEFAULT nextval('public.feriados_seq'::regclass) NOT NULL,
    fecha date NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.feriados OWNER TO edumanage;

--
-- Name: group_permission_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.group_permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_permission_seq OWNER TO edumanage;

--
-- Name: group_permission; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.group_permission (
    id integer DEFAULT nextval('public.group_permission_seq'::regclass) NOT NULL,
    group_id bigint NOT NULL,
    authority character varying(50) NOT NULL
);


ALTER TABLE public.group_permission OWNER TO edumanage;

--
-- Name: groups_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.groups_seq
    START WITH 6
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_seq OWNER TO edumanage;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.groups (
    id integer DEFAULT nextval('public.groups_seq'::regclass) NOT NULL,
    group_name character varying(100) NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone
);


ALTER TABLE public.groups OWNER TO edumanage;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO edumanage;

--
-- Name: idioma_estudiares_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.idioma_estudiares_seq
    START WITH 11
    INCREMENT BY 1
    MINVALUE 11
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idioma_estudiares_seq OWNER TO edumanage;

--
-- Name: idioma_estudiares; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.idioma_estudiares (
    id integer DEFAULT nextval('public.idioma_estudiares_seq'::regclass) NOT NULL,
    descripcion character varying(50) NOT NULL,
    abreviatura character varying(5) DEFAULT NULL::character varying
);


ALTER TABLE public.idioma_estudiares OWNER TO edumanage;

--
-- Name: idioma_modalidades_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.idioma_modalidades_seq
    START WITH 236
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idioma_modalidades_seq OWNER TO edumanage;

--
-- Name: idioma_modalidades; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.idioma_modalidades (
    id integer DEFAULT nextval('public.idioma_modalidades_seq'::regclass) NOT NULL,
    modalidad_curso_id integer NOT NULL,
    idioma_estudiar_id integer NOT NULL
);


ALTER TABLE public.idioma_modalidades OWNER TO edumanage;

--
-- Name: idioma_modalidades_aud; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.idioma_modalidades_aud (
    rev integer NOT NULL,
    modalidad_curso_id bigint NOT NULL,
    idioma_estudiar_id integer NOT NULL,
    revtype smallint
);


ALTER TABLE public.idioma_modalidades_aud OWNER TO edumanage;

--
-- Name: idioma_nativos_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.idioma_nativos_seq
    START WITH 77
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idioma_nativos_seq OWNER TO edumanage;

--
-- Name: idioma_nativos; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.idioma_nativos (
    id integer DEFAULT nextval('public.idioma_nativos_seq'::regclass) NOT NULL,
    descripcion character varying(40) NOT NULL,
    descripcion_ingles character varying(40) NOT NULL
);


ALTER TABLE public.idioma_nativos OWNER TO edumanage;

--
-- Name: modalidad_cursos_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.modalidad_cursos_seq
    START WITH 131
    INCREMENT BY 1
    MINVALUE 131
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modalidad_cursos_seq OWNER TO edumanage;

--
-- Name: modalidad_cursos; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.modalidad_cursos (
    id integer DEFAULT nextval('public.modalidad_cursos_seq'::regclass) NOT NULL,
    carga_horaria_id integer NOT NULL,
    modalidad_pago_id integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    abreviatura character varying(10) DEFAULT NULL::character varying,
    precio_unidad_modalidad numeric(8,2) NOT NULL,
    moneda_id integer NOT NULL,
    duracion_cantidad integer NOT NULL,
    duracion_modo_id integer NOT NULL,
    orden integer,
    es_extra boolean DEFAULT false NOT NULL,
    deshabilitado boolean DEFAULT false NOT NULL
);


ALTER TABLE public.modalidad_cursos OWNER TO edumanage;

--
-- Name: modalidad_cursos_aud; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.modalidad_cursos_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    abreviatura character varying(255),
    descripcion character varying(255),
    duracion_cantidad integer,
    es_extra boolean,
    precio_unidad_modalidad real,
    carga_horaria_id bigint,
    duracion_modo_id bigint,
    modalidad_pago_id integer,
    moneda_id integer
);


ALTER TABLE public.modalidad_cursos_aud OWNER TO edumanage;

--
-- Name: modalidad_disponibles_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.modalidad_disponibles_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modalidad_disponibles_seq OWNER TO edumanage;

--
-- Name: modalidad_disponibles; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.modalidad_disponibles (
    id integer DEFAULT nextval('public.modalidad_disponibles_seq'::regclass) NOT NULL,
    curso_id integer NOT NULL,
    modalidad_curso_id integer NOT NULL,
    precio_unidad_modalidad real,
    moneda_id integer
);


ALTER TABLE public.modalidad_disponibles OWNER TO edumanage;

--
-- Name: COLUMN modalidad_disponibles.precio_unidad_modalidad; Type: COMMENT; Schema: public; Owner: edumanage
--

COMMENT ON COLUMN public.modalidad_disponibles.precio_unidad_modalidad IS 'Precio de la modalidad al momento de asignarse al curso';


--
-- Name: modalidad_disponibles_aud; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.modalidad_disponibles_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    precio_unidad_modalidad real,
    curso_id integer,
    modalidad_curso_id bigint,
    moneda_id integer
);


ALTER TABLE public.modalidad_disponibles_aud OWNER TO edumanage;

--
-- Name: modalidad_pagos_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.modalidad_pagos_seq
    START WITH 21
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modalidad_pagos_seq OWNER TO edumanage;

--
-- Name: modalidad_pagos; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.modalidad_pagos (
    id integer DEFAULT nextval('public.modalidad_pagos_seq'::regclass) NOT NULL,
    descripcion character varying(40) NOT NULL,
    modo_facturacion public.modo_facturacion_type,
    modo_calculo public.modo_calculo_type
);


ALTER TABLE public.modalidad_pagos OWNER TO edumanage;

--
-- Name: monedas_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.monedas_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monedas_seq OWNER TO edumanage;

--
-- Name: monedas; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.monedas (
    id integer DEFAULT nextval('public.monedas_seq'::regclass) NOT NULL,
    descripcion character varying(30) NOT NULL,
    tasa_cambio numeric(8,2) NOT NULL,
    simbolo character varying(3) NOT NULL
);


ALTER TABLE public.monedas OWNER TO edumanage;

--
-- Name: nacionalidades_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.nacionalidades_seq
    START WITH 208
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nacionalidades_seq OWNER TO edumanage;

--
-- Name: nacionalidades; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.nacionalidades (
    id integer DEFAULT nextval('public.nacionalidades_seq'::regclass) NOT NULL,
    descripcion character varying(30) NOT NULL,
    descripcion_ingles character varying(30) NOT NULL
);


ALTER TABLE public.nacionalidades OWNER TO edumanage;

--
-- Name: niveles_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.niveles_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.niveles_seq OWNER TO edumanage;

--
-- Name: niveles; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.niveles (
    id integer DEFAULT nextval('public.niveles_seq'::regclass) NOT NULL,
    descripcion character varying(50) NOT NULL,
    dificultad integer DEFAULT 0,
    abreviatura character varying(5) NOT NULL
);


ALTER TABLE public.niveles OWNER TO edumanage;

--
-- Name: orientaciones; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.orientaciones (
    id integer NOT NULL,
    descripcion character varying(20) NOT NULL
);


ALTER TABLE public.orientaciones OWNER TO edumanage;

--
-- Name: revinfo; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.revinfo (
    rev integer NOT NULL,
    revtstmp bigint
);


ALTER TABLE public.revinfo OWNER TO edumanage;

--
-- Name: sucursales; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.sucursales (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    nombre_ingles character varying(40) NOT NULL,
    abreviatura character varying(5) DEFAULT NULL::character varying
);


ALTER TABLE public.sucursales OWNER TO edumanage;

--
-- Name: tipo_cancelaciones; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.tipo_cancelaciones (
    id integer DEFAULT nextval('public.tipo_cancelaciones'::regclass) NOT NULL,
    descripcion character varying(40) NOT NULL,
    codigo character varying(4) NOT NULL
);


ALTER TABLE public.tipo_cancelaciones OWNER TO edumanage;

--
-- Name: tipo_cursos_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.tipo_cursos_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_cursos_seq OWNER TO edumanage;

--
-- Name: tipo_cursos; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.tipo_cursos (
    id integer DEFAULT nextval('public.tipo_cursos_seq'::regclass) NOT NULL,
    descripcion character varying(30) NOT NULL,
    abreviatura character varying(4) DEFAULT NULL::character varying,
    cant_minima_estudiantes integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.tipo_cursos OWNER TO edumanage;

--
-- Name: users_seq; Type: SEQUENCE; Schema: public; Owner: edumanage
--

CREATE SEQUENCE public.users_seq
    START WITH 30
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_seq OWNER TO edumanage;

--
-- Name: users; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.users (
    id integer DEFAULT nextval('public.users_seq'::regclass) NOT NULL,
    username character varying(200) DEFAULT NULL::character varying,
    password character varying(200) DEFAULT NULL::character varying,
    role character varying(20) DEFAULT NULL::character varying,
    group_id integer NOT NULL,
    email character varying(50) DEFAULT ''::character varying,
    created timestamp with time zone,
    modified timestamp with time zone,
    enabled integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.users OWNER TO edumanage;

--
-- Name: users_aud; Type: TABLE; Schema: public; Owner: edumanage
--

CREATE TABLE public.users_aud (
    id integer NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    enabled integer,
    password character varying(255),
    username character varying(255),
    group_id integer
);


ALTER TABLE public.users_aud OWNER TO edumanage;

--
-- Data for Name: carga_horarias; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.carga_horarias (id, tipo_curso_id, descripcion, horas_semanales, dias_semana, horas_clase) FROM stdin;
1	2	Expres-Grupal	3.00	1	1.50
2	1	Expres-Individual	3.00	1	1.50
3	3	Expres-Dual	3.00	1	1.50
4	2	Regular 2 veces por semana	3.00	2	1.50
5	2	Regular 1 vez por semana	3.00	1	3.00
6	2	Intensivo 10 hs	10.00	5	2.00
7	2	Intensivo grupal 	4.00	2	2.00
8	2	Super Intensivo 20 hs	20.00	5	4.00
9	2	Super intensivo 10 hs	10.00	5	2.00
10	1	Paquete intensivo individual 5 hs	5.00	0	0.00
11	2	Conversacion	1.50	1	1.50
12	2	Conversacion (1 hora)	1.00	1	1.00
13	1	Intensivo Individual 10 hs	10.00	5	2.00
14	2	Una clase 3 horas	3.00	1	3.00
15	1	Paquete Super Intensivo Individual 10 hs	10.00	0	0.00
16	1	Curso individual general (regular)	3.00	0	0.00
17	1	Curso individual semi-intensivo	4.50	0	0.00
18	2	Expats course-3 hours	3.00	2	1.50
19	1	One single class	3.00	1	3.00
20	3	Empresa Grupo	4.00	2	2.00
21	2	Apoyo Escolar	4.50	3	1.50
22	2	Cata de Vino	1.00	1	1.00
23	1	Dos horas semanales	2.00	2	1.00
24	1	3 veces por semana 1,5hs	4.50	3	1.50
25	1	1 VEZ POR SEMANA 1 HORA	1.00	1	1.00
26	1	clase suelta de dos horas	2.00	1	2.00
27	1	CLASE PRUEBA 1 HORA	1.00	1	1.00
28	3	1 VEZ POR SEMANA 2 HORAS	2.00	1	2.00
29	3	dual 2 veces por semana 1.5hs por vez	3.00	2	1.50
30	2	intensivo examenes GRE, GMAT, TOEFL, SAT, IELTS	5.00	2	2.50
31	1	paquete super intensivo 40hs	10.00	5	2.00
32	1	individual regular 1x semana	1.50	1	1.50
33	2	clase de prueba	1.50	1	1.50
34	1	clase de prueba	1.50	1	1.50
35	2	3 days spanish super intensive group 	12.00	3	4.00
36	2	4 days spanish super intensive group 	16.00	4	4.00
37	3	1 VEZ POR SEMANA 1.5 HS	1.50	1	1.50
38	1	2 veces por semana 1 hora	2.00	2	1.00
39	1	Paquete intensivo 40 horas	10.00	5	2.00
40	1	7 semanas 2hs	10.00	5	2.00
41	2	grupo hasta 3. 2 a 4 hs semanales. Empresa	2.00	2	1.00
42	2	iNTENSIVO 8 SEMANAS	4.00	2	2.00
43	2	SI - dia extra	4.00	1	4.00
44	2	SI - 2 dias extra	8.00	2	8.00
45	2	SI - 3 dias extras	12.00	3	12.00
46	2	SI - 4 dias extras	16.00	4	16.00
52	1	Preparacion Examenes 1 VEZ POR SEMANA 1:30 HORAS	0.00	1	0.00
48	2	I - dia extra	2.00	1	2.00
49	2	I- 2 dias extras	4.00	2	4.00
50	2	I- 3 dias extras	6.00	3	6.00
51	2	I- 4 dias extras	8.00	4	8.00
53	1	Individual Empresas	1.00	1	1.00
54	2	Grupal Empresa	1.00	1	1.00
55	2	2 veces por semana 2 horas	4.00	2	2.00
56	1	Paquete Intensivo 10hs	5.00	2	2.00
57	2	Clases Niños Grupales Español	15.00	5	3.00
58	3	Dual 3 veces por semana 2 horas	6.00	3	2.00
59	3	Intensivos Examenes 	5.00	3	2.50
60	1	Clases Español precio especial 	15.00	5	3.00
61	1	3 hs por dia- 5 dias a la semana	15.00	5	3.00
62	1	1 vez por semana 2 hs	2.00	1	8.00
63	1	4 días 2 horas	8.00	4	2.00
64	3	3 HS POR SEMANA	3.00	2	12.00
65	1	CLASE DE PRUEBA (POR PAGO DE INSCRIPCION)	1.00	1	1.00
66	1	3 hs por semana	3.00	2	1.50
67	3	Dual intensivo 10hs x sem	10.00	5	2.00
\.


--
-- Data for Name: carga_horarias_aud; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.carga_horarias_aud (id, rev, revtype, descripcion, dias_semana, horas_clase, horas_semanales, tipo_curso_id) FROM stdin;
\.


--
-- Data for Name: clases; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.clases (id, curso_id, profesor_id, descripcion, fecha_clase, hora_comienzo, hora_fin, cancelada, mostrar_cancelada, comentarios, grammar, vocabulary, communication, homework, book_pages, suggestions, sucursal_id, domicilio_clase, no_recuperar, precio_por_hora, moneda_id, honorario_profesor_id, horas_clase_freelance, horas_clase_empleado) FROM stdin;
\.


--
-- Data for Name: clases_aud; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.clases_aud (id, rev, revtype, book_pages, cancelada, comentarios, communication, domicilio_clase, fecha_clase, grammar, homework, mostrar_cancelada, no_recuperar, precio_por_hora, suggestions, vocabulary, curso_id, moneda_id, profesor_id, sucursal_id) FROM stdin;
\.


--
-- Data for Name: constantes; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.constantes (id, nombre_variable, valor_variable) FROM stdin;
\.


--
-- Data for Name: duracion_modos; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.duracion_modos (id, descripcion, codigo) FROM stdin;
1	Dia	DIA
2	Semana	SEMANA
3	Mes	MES
\.


--
-- Data for Name: estado_inscripcion; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.estado_inscripcion (id, descripcion, abreviatura) FROM stdin;
1	Nueva	N
2	Confirmada	C
\.


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.estados (id, descripcion) FROM stdin;
1	Interesado
2	Pendiente
3	Estudiante
4	Estudiante sin cuotas
\.


--
-- Data for Name: feriados; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.feriados (id, fecha, descripcion) FROM stdin;
1	2016-07-09	Dia de la Independencia
\.

--
-- Data for Name: group_permission; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.group_permission (id, group_id, authority) FROM stdin;
1	1	ROLE_USER
3	1	ROLE_ADMIN
4	1	ROLE_PERMISOS_MOSTRAR_MENU
103	1	ROLE_MENU_MOSTRAR
105	1	ROLE_CARGA_HORARIA_MOSTRAR_MENU
106	1	ROLE_CARGA_HORARIA_AGREGAR
188	1	ROLE_HONORARIOS_INDICE
109	1	ROLE_CURSOS_AGREGAR
110	1	ROLE_CURSOS_LISTAR_VIGENTES
111	1	ROLE_CURSOS_LISTAR_SIN_CLASES
112	1	ROLE_INSCRIPCIONES_MOSTRAR_MENU
113	1	ROLE_INSCRIPCIONES_LISTAR_INSCRIPCIONES_CONFIRMAR
114	1	ROLE_INSCRIPCIONES_CONFIRMAR_INSCRIPCION
115	1	ROLE_MODALIDAD_CURSOS_MOSTRAR_MENU
116	1	ROLE_MODALIDAD_CURSOS_AGREGAR_MODALIDAD
117	1	ROLE_MODALIDAD_CURSOS_EDITAR_MODALIDAD
118	1	ROLE_PERMISOS_MODIFICAR
119	1	ROLE_PERSONAS_MOSTRAR_MENU
120	1	ROLE_PERSONAS_BORRAR
121	2	ROLE_CARGA_HORARIA_MOSTRAR_MENU
122	2	ROLE_CARGA_HORARIA_AGREGAR
189	1	ROLE_HONORARIOS_AGREGAR
124	2	ROLE_CURSOS_MOSTRAR_MENU
190	1	ROLE_HONORARIOS_BUSCAR_HONORARIOS_IDIOMA
191	1	ROLE_HONORARIOS_BORRAR
127	2	ROLE_CARGA_HORARIA_AGREGAR
128	1	ROLE_CONFIGURACION_MOSTRAR_MENU
186	1	ROLE_CURSOS_ASIGNAR_PROFESOR
192	1	ROLE_HONORARIOS_EDITAR
193	1	ROLE_HONORARIOS_MOSTRAR_DATO
194	1	ROLE_HONORARIOS_BUSCAR_HONORARIOS_ASIGNADOS
198	1	ROLE_PROFESORES_SERVICE
199	1	ROLE_PROFESORES_AGREGAR
200	1	ROLE_PROFESORES_INFORME_SUELDOS
201	1	ROLE_PROFESORES_LISTAR_ACTIVOS
202	1	ROLE_PROFESORES_ADMINISTRAR
203	1	ROLE_PROFESORES_MOSTRAR_CALENDARIO
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.groups (id, group_name, created, modified) FROM stdin;
1	Administradores	2012-01-30 13:31:58-03	2012-01-30 13:31:58-03
2	Coordinadores idioma	2012-01-30 13:32:08-03	2012-01-30 13:32:08-03
3	Empleados	2012-01-30 13:32:18-03	2012-01-30 13:32:18-03
4	Coordinadores contables	2012-04-02 23:04:46-03	2012-04-02 23:04:46-03
5	Profesores	2012-05-13 23:00:44-03	2012-05-13 23:00:44-03
\.


--
-- Data for Name: idioma_estudiares; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.idioma_estudiares (id, descripcion, abreviatura) FROM stdin;
2	Spanish	SP
5	Mandarin Chinese	CHN
6	Russian	RUS
7	Coreano	KR
8	Matematica	MAT
9	Italiano	ITA
1	English	ENG
3	French	FR
4	Portuguese	PT
10	Alemán	ALE
\.


--
-- Data for Name: idioma_modalidades; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.idioma_modalidades (id, modalidad_curso_id, idioma_estudiar_id) FROM stdin;
1	1	1
2	1	3
3	1	4
4	2	1
5	2	3
6	2	4
7	3	1
8	3	3
9	3	4
10	4	1
11	4	3
12	4	4
13	5	1
14	5	3
15	5	4
16	6	1
17	6	3
18	6	4
19	7	1
20	7	3
21	7	4
22	8	1
23	8	3
24	8	4
25	9	1
26	9	3
27	9	4
28	10	1
143	62	1
142	61	4
31	11	1
141	61	3
140	61	1
34	12	1
35	13	1
36	13	3
37	13	4
38	14	1
39	14	3
40	14	4
41	15	1
42	15	3
43	15	4
44	16	1
45	16	3
46	16	4
47	17	1
48	17	3
49	17	4
50	18	1
51	18	3
52	18	4
53	19	2
54	20	2
55	21	2
56	22	2
57	23	2
58	24	2
59	25	2
60	26	2
61	27	2
62	28	2
63	29	2
111	30	3
65	31	1
66	31	3
67	31	4
68	32	1
69	32	3
70	32	4
71	33	2
72	34	2
73	35	2
74	36	2
75	37	2
76	38	1
77	38	3
78	38	4
79	39	1
80	39	3
81	39	4
82	40	1
83	40	3
84	40	4
85	41	1
86	42	2
87	43	1
88	43	3
89	43	4
90	44	1
91	44	3
92	44	4
93	45	1
94	45	3
95	45	4
96	46	1
97	46	3
98	46	4
99	47	2
100	48	2
101	49	1
102	49	3
103	49	4
104	50	1
105	50	3
106	50	4
107	51	1
108	51	3
109	51	4
110	30	1
112	30	4
113	52	1
114	52	3
115	52	4
116	53	1
117	53	3
118	53	4
119	54	1
120	54	3
121	54	4
122	55	1
123	55	3
124	55	4
125	56	1
126	56	3
127	56	4
128	57	1
129	57	3
130	57	4
131	58	1
132	58	3
133	58	4
134	59	1
135	59	3
136	59	4
137	60	1
138	60	3
139	60	4
144	63	1
145	64	1
146	65	1
147	66	1
148	67	1
149	68	2
150	69	2
151	70	1
152	70	3
153	70	4
154	71	1
155	71	3
156	71	4
157	72	1
158	72	3
159	72	4
160	73	1
161	74	2
162	75	2
163	76	1
164	76	4
165	77	1
166	77	3
167	77	4
168	78	2
169	79	2
170	80	2
171	81	2
172	82	2
173	83	2
174	84	2
175	85	2
176	86	2
177	87	2
178	88	2
179	89	2
180	90	2
181	91	2
182	92	1
183	92	3
184	92	4
185	93	1
186	93	4
187	67	3
188	67	4
189	94	2
190	95	2
191	96	1
192	97	1
193	98	1
194	99	1
195	100	4
196	101	3
197	102	1
198	103	2
199	104	1
200	105	1
201	106	9
202	107	1
203	108	2
204	109	2
205	110	1
206	111	1
207	112	1
208	112	3
209	112	4
210	113	1
211	114	1
212	114	2
213	115	1
214	116	1
215	117	2
216	118	1
217	119	2
218	120	2
219	121	2
220	122	1
221	123	1
222	124	1
223	124	2
224	124	3
225	124	4
226	125	1
227	126	2
228	127	1
229	127	3
230	127	4
231	128	1
232	129	10
233	13	10
234	130	2
235	2	10
\.


--
-- Data for Name: idioma_modalidades_aud; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.idioma_modalidades_aud (rev, modalidad_curso_id, idioma_estudiar_id, revtype) FROM stdin;
\.


--
-- Data for Name: idioma_nativos; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.idioma_nativos (id, descripcion, descripcion_ingles) FROM stdin;
1	Afrikaans	Afrikaans
2	Albanés	Albanian
3	Alemán	German
4	Arameo	Amharic
5	Arabe	Arab
6	Armenio	Armenian
7	Bengali	Bengali
8	Bieloruso	Belarusian
9	Birmano	Burmese
10	Bulgaro	Bulgarian
11	Catalan	Catalan
12	Checo	Czech
13	Chino	Chinese
14	Coreano	Korean
15	Croata	Croatian
16	Danés	Danish
17	Dari	Dari
18	Dzongkha	Dzongkha
19	Escocés	Scottish
20	Eslovaco	Slovak
21	Esloveno	Slovene
22	Español	Spanish
23	Esperanto	Esperanto
24	Estonio	Estonian
25	Faroese	Faroese
26	Farsi	Farsi
27	Finlandés	Finnish
28	Francés	French
29	Gaelico	Gaelic
30	Galese	Welsh
31	Gallego	Galician
32	Griego	Greek
33	Hebreo	Hebrew
34	Hindi	Hindi
35	Holandés	Dutch
36	Hungaro	Hungarian
37	Inglés	English
38	Indonesio	Indonesian
39	Inuktitut (Eskimo)	Eskimo
40	Islandés	Icelandic
41	Italiano	Italian
42	Japonés	Japanese
43	Khmer	Khmer
44	Kurdo	Kurdish
45	Lao	Lao
46	Laponico	Laponic
47	Leton	Latvian
48	Lituano	Lithuanian
49	Macedonio	Macedonian
50	Malayo	Malay
51	Maltés	Maltese
52	Nepali	Nepali
53	Noruego	Norwegian
54	Pashto	Pashto
55	Polaco	Polish
56	Portugués	Portuguese
57	Rumano	Romanian
58	Ruso	Russian
59	Serbio	Serbian
60	Somali	Somali
61	Suahili	Swahili
62	Sueco	Swedish
63	Tagalog-Filipino	Tagalog-Filipino
64	Tajik	Tajik
65	Tamil	Tamil
66	Tailandés	Thai
67	Tibetano	Tibetan
68	Tigrinia	Tigrinia
69	Tonganés	Tonganese
70	Turco	Turkish
71	Turkmenistano	Turmekistanish
72	Ucraniano	Ukranian
73	Urdu	Urdu
74	Uzbekistano	Uzbek
75	Vasco	Basque
76	Vietnamés	Vietnamese
\.


--
-- Data for Name: modalidad_cursos; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.modalidad_cursos (id, carga_horaria_id, modalidad_pago_id, descripcion, abreviatura, precio_unidad_modalidad, moneda_id, duracion_cantidad, duracion_modo_id, orden, es_extra, deshabilitado) FROM stdin;
63	4	6	grupal preparacion examenes cambridge (FCE, CAE, CPE, BEC)	EXAM	3600.00	1	16	2	\N	f	f
3	1	1	Curso ingles general para adultos EXPRESS	ENGGEXP	600.00	1	10	3	\N	f	f
4	4	1	Curso ingles general para adultos mayores	GRL65+	1100.00	1	10	3	\N	f	f
5	11	1	Curso Conversacion Ingles 1 vez por Semana	ENGCONV	550.00	1	4	3	\N	f	f
6	12	3	Conversation Night Ingles	ENGCONVNig	60.00	1	1	1	\N	f	f
55	5	7	curso grupal general 		1800.00	1	16	2	\N	f	f
54	5	20	curso grupal general 		1600.00	1	4	3	\N	f	f
10	1	6	Curso ingles comercial 	COM	2300.00	1	16	2	\N	f	f
11	1	6	Curso ingles para Secretarias	SEC	2300.00	1	16	2	\N	f	f
12	1	6	Curso ingles juridico	JUR	2300.00	1	16	2	\N	f	f
13	2	1	Curso ingles individual Express para adultos	ENGIEXP	1400.00	1	10	3	\N	f	f
14	16	1	Curso ingles general regular individual	ENGI	2400.00	1	10	3	\N	f	f
61	32	1	individual preparacion examenes	EXAM	1700.00	1	10	3	\N	f	f
16	10	4	Paquete ingles intenviso individual	ENGIINT5	3400.00	1	4	2	\N	f	f
53	4	7	curso grupal general 		3400.00	1	16	2	\N	f	f
18	12	3	Spanish Conversation Night	SPCONVNigh	60.00	2	10	3	\N	f	f
19	8	4	Super Intensive Spanish Group (20 hours a week)	SPSINT	500.00	2	4	2	\N	f	f
20	8	4	Super Intensive Spanish Group (20 hours a week)	SPSINT	150.00	2	1	2	\N	f	f
21	9	4	Super Intensive Spanish Group (10 hours a week)	SPSINT10	380.00	2	4	2	\N	f	f
22	6	4	Intensive Spanish Group (10 hours a week)	SPINT10	110.00	2	1	2	\N	f	f
23	13	4	One to One Intensive Spanish (10 hours a week)	SPONE	700.00	2	4	2	\N	f	f
56	16	8	curso individual regular 		7200.00	1	4	3	\N	f	f
25	6	4	DELE Prep Group	SPDELE	950.00	2	8	2	\N	f	f
26	6	4	DELE Prep Group	SPDELE	150.00	2	1	2	\N	f	f
27	19	3	One Day Travel Spanish	SPONE	30.00	2	1	1	\N	f	f
28	8	4	One-Week Survival Crash Course (20 hours)	SPSURV	150.00	2	1	2	\N	f	f
29	8	4	One-Week Survival Crash Course (20 hours)	SPSURV	150.00	2	5	1	\N	f	f
30	16	1	Curso ingles general individual (regular)	ENGGIND	2400.00	1	10	3	\N	f	f
31	16	1	Curso individual preparacion examenes 	EXAM	3000.00	1	10	3	\N	f	f
32	10	4	paquete intensivo preparacion examenes 	EXAM	4200.00	1	4	2	\N	f	f
33	18	1	Expats class (3 hours a week)	EXP	110.00	2	1	3	\N	f	f
34	18	4	Expats class (3 hours a week)	EXP4	380.00	2	4	3	\N	f	f
35	14	4	One single class	ONE	50.00	2	1	1	\N	f	f
36	13	4	DELE Prep Individual	DELEIND	250.00	2	1	2	\N	f	f
37	13	4	DELE Prep Individual	DELEIND	800.00	2	4	2	\N	f	f
62	30	4	EXAM		3000.00	1	10	2	\N	f	f
57	32	8	curso individual regular 		4320.00	1	4	3	\N	f	f
42	22	5	Clase cata de vino	VINO	250.00	1	1	1	\N	f	f
49	27	3	CLASE DE PRUEBA 1 HORA	CLASE DE P	230.00	1	1	1	\N	f	f
52	4	6	curso grupal general 		2700.00	1	16	2	\N	f	f
78	8	4	Super Intensive Spanish Group (20 hours a week) 	SPSINT 	300.00	2	2	2	\N	f	f
46	25	1	1 VEZ POR SEMANA 1 HORA		1000.00	1	10	3	\N	f	f
47	26	3	clase suelta de dos horas	Clsu	50.00	2	1	1	\N	f	f
48	26	3	clase suelta de dos horas	Clsu	50.00	2	1	1	\N	f	f
50	28	1	1 VEZ POR SEMANA 2 HORAS dual	1vez 2hs	1800.00	1	1800	3	\N	f	f
51	29	1	2 veces por semana 1.5hs por vez	dual 3h	2600.00	1	10	3	\N	f	f
58	25	8	curso individual regular 		3600.00	1	4	3	\N	f	f
59	10	10	paquete intensivo 		10000.00	1	4	3	\N	f	f
60	33	3	clase de prueba grupal 		100.00	1	1	1	\N	f	f
64	32	12	individual 1x semana con Sam/John		960.00	1	1	3	\N	f	f
65	16	12	individual 2x sem con Sam/John 		1600.00	1	1	3	\N	f	f
92	52	4	EXPRESS GRUPAL 1,5HS	EXPRES 1,5	1900.00	1	4	3	\N	f	f
67	52	1	INDIVIDUAL 1 VEZ POR SEMANA 1,5 H.	IND 1,5HS	1400.00	1	1	3	\N	f	f
68	35	4	spanish super intensive group	SI SPAN	110.00	2	3	1	\N	f	f
69	36	4	spanish super intensive group	SI SPAN	120.00	2	4	1	\N	f	f
70	37	1	1 VEZ POR SEMANA 1.5 HS	DUAL 1.5HS	2100.00	1	10	3	\N	f	f
71	38	1	2 veces por semana 1 hora	2 v 1 hora	1800.00	1	10	3	\N	f	f
72	39	4	Paquete intensivo 40 horas	paq 40hs 	5100.00	1	1	3	\N	f	f
73	4	6	16 sem grupal 1 pago en efectivo 		2700.00	1	16	2	\N	f	f
75	13	4	Individual Spanish intensive course 10 hs	SPINTIND	200.00	2	5	1	\N	f	f
79	8	4	Super Intensive Spanish Group (20 hours a week) 	SPSINT 	450.00	2	3	2	\N	f	f
77	42	4	INTENSIVO GRUPAL 8 SEMANAS VERANO/INVIERNO	INT GRP 8S	2800.00	1	8	2	\N	f	f
80	9	4	Super Intensive Spanish Group (10 hours a week) 	SPSINT10	220.00	2	2	2	\N	f	f
81	9	4	Super Intensive Spanish Group (10 hours a week) 	SPSINT10	330.00	2	3	2	\N	f	f
82	18	18	Expats class (3 hours a week) 	EXP	297.00	2	3	3	\N	f	f
83	43	3	SI dia extra		30.00	2	1	1	\N	f	f
84	44	4	SI - 2 dias extras		60.00	2	2	1	\N	f	f
85	45	4	SI - 3 dias extras		90.00	2	3	1	\N	f	f
86	46	4	SI - 4 dias extras		120.00	2	4	1	\N	f	f
87	48	3	I - dia extra		22.00	2	1	1	\N	f	f
88	49	4	I- 2 dias extras		44.00	2	2	1	\N	f	f
93	1	1	EXPRESS EN EFVO		550.00	1	1	3	\N	f	f
90	50	4	I- 3 dias extras		66.00	2	3	1	\N	f	f
91	51	4	I- 4 dias extras		88.00	2	4	1	\N	f	f
94	9	4	DUAL o TRIPLE SUP INT 10HS. X 1 SEMANA		150.00	2	1	2	\N	f	f
95	8	4	SUPER INTENSIVO SEMANA EXTRA - PQT MES		125.00	2	1	2	\N	f	f
96	20	1	GRUPO EMPRESA 11 HS SEMANALES		13400.00	1	1	3	\N	f	f
97	38	1	Clase Individual 2 hs por semana		2250.00	1	1	3	\N	f	f
98	53	1	Individual Reserv IT Solutions		1000.00	1	1	3	\N	f	f
99	54	1	Grupal Reserv IT Solutions		880.00	1	1	3	\N	f	f
100	25	3	Bate Papo		50.00	1	1	3	\N	f	f
101	28	3	CONVERSACIÓN FRANCÉS		50.00	1	1	3	\N	f	f
102	23	1	Precio Excepcional PEITIADO		1600.00	1	1	3	\N	f	f
103	15	4	Individual Intensivo 2hs.x8		400.00	2	1	3	\N	f	f
104	55	1	Curso Inglés Intensivo		1400.00	1	1	3	\N	f	f
105	55	4	Curso Inglés Intensivo		2100.00	1	2	3	\N	f	f
106	56	4	Paquete Intensivo 10hs.		3400.00	1	1	3	\N	f	f
107	25	1	Clase Individual 1 hora		1200.00	1	1	3	\N	f	f
108	57	1	Grupal Especial Niños		467.00	2	1	3	\N	f	f
109	58	1	Dual tres veces por semana 2 hs.		250.00	2	1	3	\N	f	f
110	39	1	Preparación TOEFL 10hs por semana		7300.00	1	1	3	\N	f	f
111	29	1	Preparación Dual IELTS		2250.00	1	1	3	\N	f	f
112	29	1	Dual General 2 veces por semana		1800.00	1	1	3	\N	f	f
113	52	1	Exámenes internacionales (express)	EIE	1700.00	1	1	3	\N	f	f
114	2	19	REPROGRAMACION DE CLASE SIN CARGO AVISO PREVIO 	RCSC	0.00	1	2	1	\N	f	f
115	59	4	20 hs x mes 	IED	3150.00	1	1	3	0	f	f
116	59	4	20 hs x mes 	IED	3150.00	1	1	3	0	f	f
117	60	4	3 hs por dia- 5 dias a la semana 	IED	200.00	2	1	2	13	f	f
118	25	6	EXPRESS GRUPAL 1,5HS 1 pago en efectivo	EXP GRP EV	2200.00	1	1	3	\N	f	f
120	23	1	1 vez x semana 2 horas	1vezxsem2h	240.00	2	1	3	\N	f	f
121	63	1	Individual 4 dias 2 horas	ind 4d 2hs	5800.00	1	1	3	\N	f	f
122	64	1	3 HS POR SEMANA		3100.00	1	1	3	\N	f	f
123	4	1	Regular por mes		1000.00	1	1	3	\N	f	f
124	65	3	CLASE DE PRUEBA (POR PAGO DE INSCRIPCION)		0.00	1	1	1	\N	f	f
125	55	5	PREPARACION EXAMEN 8 SEMANAS 		3500.00	1	8	2	\N	f	f
126	25	5	CLASES DE ESPAÑOL EN HOSTEL		0.00	1	4	3	\N	f	f
127	66	1	3hs por semana		2400.00	1	1	3	\N	f	f
128	10	4	Curso Intensivo SAT 5 hrs por semana		4600.00	1	1	3	\N	f	f
129	37	1	1.5hs x semana		1400.00	1	1	3	\N	f	f
130	67	4	Dual intensivo español		300.00	2	1	2	\N	f	f
2	4	1	Curso ingles general para adultos	GRL17+	1400.00	1	10	3	\N	f	f
\.


--
-- Data for Name: modalidad_cursos_aud; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.modalidad_cursos_aud (id, rev, revtype, abreviatura, descripcion, duracion_cantidad, es_extra, precio_unidad_modalidad, carga_horaria_id, duracion_modo_id, modalidad_pago_id, moneda_id) FROM stdin;
2	5	1	GRL17+	Curso ingles general para adultos	10	f	1400	4	3	1	1
\.


--
-- Data for Name: modalidad_disponibles; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.modalidad_disponibles (id, curso_id, modalidad_curso_id, precio_unidad_modalidad, moneda_id) FROM stdin;
2	4	2	\N	\N
4	1	2	\N	\N
5	80	2	\N	\N
531	530	61	1700	1
534	533	2	1400	1
537	536	13	1400	1
538	536	57	4320	1
551	2	19	500	2
553	3	19	500	2
\.


--
-- Data for Name: modalidad_disponibles_aud; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.modalidad_disponibles_aud (id, rev, revtype, precio_unidad_modalidad, curso_id, modalidad_curso_id, moneda_id) FROM stdin;
531	532	0	1700	530	61	1
534	535	0	1400	533	2	1
537	539	0	1400	536	13	1
538	539	0	4320	536	57	1
551	552	0	500	2	19	2
553	554	0	500	3	19	2
\.


--
-- Data for Name: modalidad_pagos; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.modalidad_pagos (id, descripcion, modo_facturacion, modo_calculo) FROM stdin;
1	Cuota fija mensual	MES	MES
2	Cuota flexible mensual (por clase)	MES_VARIABLE	CLASE
3	Por clase	CLASE	CLASE
4	Por paquete	PAQUETE	PAQUETE
5	Por evento (unica vez)	EVENTO	CLASE
6	por cuatrimestre 16 sem 1 pago efectivo 	PAQUETE	PAQUETE
7	por cuatrimestre 16 semanas en 2 cuotas	MES	MES
8	individual 4 meses con descuento 	MES	MES
10	paquete intensivo x 4 con descuento 	PAQUETE	PAQUETE
19	Cambio de clases SIN CARGO 	SEMANA	CLASE
12	individual promo palermo 20%	MES	MES
14	paquete intensivo promo palermo 20%	PAQUETE	PAQUETE
16	Clase de prueba 	CLASE	CLASE
18	expat grupal descuento 3 meses juntos	PAQUETE	PAQUETE
20	Cantidad de cuotas fijas mensuales	MES	CANTIDAD
\.


--
-- Data for Name: monedas; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.monedas (id, descripcion, tasa_cambio, simbolo) FROM stdin;
1	Pesos	1.00	$
2	Dolares	12.50	USD
3	Euro	13.00	E
4	Real	3.00	R
\.


--
-- Data for Name: nacionalidades; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.nacionalidades (id, descripcion, descripcion_ingles) FROM stdin;
1	Argentina	Argentina
2	Reino Unido	United Kingdom
3	Suecia	Sweden
4	Estados Unidos	USA
5	Espana	Spain
6	Portugal	Portugal
7	Francia	France
8	Italia	Italy
9	Afganistán	Afghanistan
10	Africa	Africa
11	Albania 	Albania
12	Alemania 	Germany
13	Andorra 	Andorra
14	Angola 	Angola
15	Arabia saudita 	Saudi arabia
16	Argelia 	Algeria
17	Argentina 	Argentina
18	Armenia 	Armenia
19	Asia 	Asia
20	Australia 	Australia
21	Australia 	Australia
22	Austria 	Austria
23	Azerbaiyán	Azerbaijan
24	Bahrain 	Bahrain
25	Bangladesh 	Bangladesh
26	Barbados 	Barbados
27	Bélgica	Belgium
28	Belice 	Belize
29	Benín	Benin
30	Bermuda 	Bermuda
31	Butan	Bhutan
32	Bielorrusia 	Belarus
33	Bolivia 	Bolivia
34	Bosnia herzegovina 	Bosnia and herzegovina
35	Botswana 	Botswana
36	Brasil 	Brazil
37	Brunei darussalam 	Brunei darussalam
38	Bulgaria 	Bulgaria
39	Burkina faso 	Burkina faso
40	Burundi 	Burundi
41	Cabo verde 	Cape verde
42	Camboya 	Cambodia
43	Camerún	Cameroon
44	Canadá	Canada
45	Centro africana, rep. 	Central african republic
46	Chad 	Chad
47	Chile 	Chile
48	China 	China
49	Chipre 	Cyprus
50	Colombia 	Colombia
51	Comores 	Comoros
52	Congo 	Congo
53	Congo, rep. democrática 	Congo democratic republic
54	Corea del norte 	Korea north
55	Corea del sur 	Korea south
56	Costa de marfil 	Ivory coast
57	Costa rica 	Costa rica
58	Croacia 	Croatia
59	Cuba 	Cuba
60	Dinamarca 	Denmark
61	Djibouti 	Djibouti
62	Dominica 	Dominica
63	Dominicana rep. 	Dominican republic
64	Ecuador 	Ecuador
65	Egipto 	Egypt
66	El salvador 	El salvador
67	Emiratos árabes unidos 	United arab emirates
68	Eritrea 	Eritrea
69	Eslovaquia 	Slovakia
70	Eslovenia 	Slovenia
71	España	Spain
72	Estados unidos 	United states
73	Estonia 	Estonia
74	Etiopía	Ethiopia
75	Europa 	Europe
76	Fiji 	Fiji
77	Filipinas 	Philippines
78	Finlandia 	Finland
79	Francia 	France
80	Gab?n 	Gabon
81	Gambia 	Gambia
82	Georgia 	Georgia
83	Ghana 	Ghana
84	Granada 	Grenada
85	Grecia 	Greece
86	Groenlandia 	Greenland
87	Guam 	Guam
88	Guatemala 	Guatemala
89	Guayana 	Guyana
90	Guayana francesa 	French guiana
91	Guinea 	Guinea
92	Guinea ecuatorial 	Equatorial guinea
93	Guinea-bissau	Guinea-bissau
94	Haiti 	Haiti
95	Holanda 	Netherlands
96	Honduras 	Honduras
97	Hong kong 	Hong kong
98	Hungría	Hungary
99	India 	India
100	Indonesia 	Indonesia
101	Irán	Iran
102	Iraq 	Iraq
103	Irlanda 	Ireland
104	Islandia 	Iceland
105	Israel 	Israel
106	Italia 	Italy
107	Jamaica 	Jamaica
108	Japón	Japan
109	Jordania 	Jordan
110	Kazajastán	Kazakhstan
111	Kenya 	Kenya
112	Kuwait 	Kuwait
113	Kyrgyzstán	Kyrgyzstan
114	Laos 	Laos
115	Lesoto 	Lesotho
116	Letonia 	Latvia
117	Líbano 	Lebanon
118	Liberia 	Liberia
119	Libia 	Libyan arab jamahiriya
120	Liechtenstein 	Liechtenstein
121	Lituania 	Lithuania
122	Luxemburgo 	Luxembourg
123	Macao 	Macao
124	Macedonia 	Macedonia
125	Madagascar 	Madagascar
126	Malasia 	Malaysia
127	Malawi 	Malawi
128	Maldivas 	Maldives
129	Mali 	Mali
130	Malta 	Malta
131	Marruecos 	Morocco
132	Mauricio 	Mauritius
133	Mauritania 	Mauritania
134	México	Mexico
135	Micronesia 	Micronesia
136	Moldovia 	Moldova
137	Mónaco 	Monaco
138	Mongolia 	Mongolia
139	Montenegro 	Montenegro
140	Mozambique 	Mozambique
141	Myanmar 	Myanmar burma
142	Namibia 	Namibia
143	Nepal 	Nepal
144	Nicaragua 	Nicaragua
145	Niger 	Niger
146	Nigeria 	Nigeria
147	Noruega 	Norway
148	Nueva caledonia 	New caledonia
149	Nueva zelanda 	New zealand
150	Omán	Oman
151	Pakistán	Pakistan
152	Palestina 	Palestine
153	Panamá	Panama
154	Papua new guinea 	Papua new guinea
155	Paraguay 	Paraguay
156	Peru 	Peru
157	Polinesia francesa 	French polynesia
158	Polonia 	Poland
159	Portugal 	Portugal
160	Puerto rico 	Puerto rico
161	Qatar 	Qatar
162	Reino unido 	United kingdom
163	República Checa 	Czech republic
164	Ruanda 	Rwanda
165	Rumania	Romania
166	Rusia 	Russian federation
167	Sahara occidental 	Western sahara
168	Samoa 	Samoa
169	San marino 	San marino
170	Sao tome and principe 	Sao tome and principe
171	Senegal 	Senegal
172	Serbia 	Serbia
173	Seychelles 	Seychelles
174	Sierra leona 	Sierra leone
175	Singapur 	Singapore
176	Siria 	Syria
177	Somalia 	Somalia
178	Sri lanka 	Sri lanka
179	Sudáfrica 	South africa
180	Sudán	Sudan
181	Suecia 	Sweden
182	Suiza 	Switzerland
183	Surinam 	Suriname
184	Swazilandia 	Swaziland
185	Tailandia 	Thailand
186	Taiwán	Taiwan
187	Tajikistán	Tajikistan
188	Tanzania 	Tanzania
189	Timor este 	Timor este
190	Togo 	Togo
191	Tonga 	Tonga
192	Trinidad tobago 	Trinidad and tobago
193	Túnez	Tunisia
194	Turkmenist?n 	Turkmenistan
195	Turquía	Turkey
196	Tuvalu 	Tuvalu
197	Ucrania 	Ukraine
198	Uganda 	Uganda
199	Uruguay 	Uruguay
200	Uzbekistán	Uzbekistan
201	Vanuatu	Vanuatu
202	Vaticano 	Holy see
203	Venezuela 	Venezuela
204	Vietnam	Vietnam
205	Yemen 	Yemen
206	Zambia 	Zambia
207	Zimbabwe 	Zimbabwe
\.


--
-- Data for Name: niveles; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.niveles (id, descripcion, dificultad, abreviatura) FROM stdin;
1	Basic/básico	0	B
7	Advanced basic/básico avanzado	1	BAV
2	Pre-intermediate/preintermedio	2	PI
3	Intermediate/intermedio	3	INT
4	Upper-Intermediate/intermedio avanzado	4	INTAV
5	Advanced/avanzado	5	AV
\.


--
-- Data for Name: orientaciones; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.orientaciones (id, descripcion) FROM stdin;
1	Grammar / Gramática
2	Conversation
3	Exam/Examen
4	Conversation+Grammar
5	Otro
6	Business
7	Apoyo Escolar
\.


--
-- Data for Name: revinfo; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.revinfo (rev, revtstmp) FROM stdin;
5	1448631956348
9	1448647663850
11	1448647814955
14	1448647907699
17	1448647987544
20	1448648099026
22	1448648100141
27	1448649106278
31	1448649186103
33	1448649188069
35	1448649705153
37	1448649705186
55	1449084376271
57	1449085006676
59	1449085932342
61	1449086767092
63	1449087028064
65	1449087329501
68	1449100815132
70	1449101246889
72	1449101862537
74	1449102599244
76	1449147405832
77	1449152066682
78	1449152886750
79	1449157491535
82	1449628512190
85	1449628701269
88	1449629048280
91	1449629188028
94	1449640690791
102	1449709507482
129	1455722412114
132	1455736826640
135	1455737052961
138	1455737227594
141	1455741158139
142	1455741223037
143	1455741257857
144	1455741316140
145	1455741494401
148	1455741794974
149	1455742332817
152	1455752485170
155	1455752557237
158	1455752612921
159	1455752640299
160	1455753999506
161	1455805955128
164	1455807351739
167	1455807744200
170	1455808611928
173	1455808882139
176	1455809074411
179	1455812391254
182	1455812698660
183	1455812730226
184	1455812760428
185	1455813108663
523	1468764727504
532	1468776411237
535	1468777643413
539	1468968509846
547	1481675954667
552	1583454202797
554	1585529047376
\.


--
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.sucursales (id, nombre, nombre_ingles, abreviatura) FROM stdin;
1	LVFlores	LVFlores	LVF
2	LVPalermo	LVPalermo	LVP
3	Domicilio/Empresa	Your home/office	DOM
4	LVAbasto	LVAbasto	LVA
5	En línea vía skype	Online via Skype	Onl
6	DOMICILIO 2		DOM2
\.


--
-- Data for Name: tipo_cancelaciones; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.tipo_cancelaciones (id, descripcion, codigo) FROM stdin;
1	Cancelado con anticipacion por Alumno	CA
2	Cancelado por el Profesor	CP
3	Cancelado sin anticipacion por Alumno	CSA
4	Clase recuperada	R
5	Cancelacion por el Estudio	CLV
7	Error del Estudio	ERR
\.


--
-- Data for Name: tipo_cursos; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.tipo_cursos (id, descripcion, abreviatura, cant_minima_estudiantes) FROM stdin;
1	Individual	IND	1
2	Grupal	GRP	3
3	Dual	2	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.users (id, username, password, role, group_id, email, created, modified, enabled) FROM stdin;
1	admin	$2a$10$IBwMQfJ1XZgCOghTSN72Q.lx4ZDfTbGJlfPOCnyA9Hv4GHsX.Nkn2	\N	1		\N	\N	1
\.


--
-- Data for Name: users_aud; Type: TABLE DATA; Schema: public; Owner: edumanage
--

COPY public.users_aud (id, rev, revtype, enabled, password, username, group_id) FROM stdin;
\.


--
-- Name: carga_horarias_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.carga_horarias_seq', 1, false);


--
-- Name: clases_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.clases_seq', 1, false);


--
-- Name: constantes_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.constantes_seq', 1, false);


--
-- Name: cursos_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.cursos_seq', 3, true);


--
-- Name: duracion_modos_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.duracion_modos_seq', 3, true);


--
-- Name: estados_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.estados_seq', 4, true);


--
-- Name: feriados_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.feriados_seq', 1, true);


--
-- Name: group_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.group_permission_seq', 4, true);


--
-- Name: groups_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.groups_seq', 6, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.hibernate_sequence', 554, true);


--
-- Name: idioma_estudiares_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.idioma_estudiares_seq', 11, false);


--
-- Name: idioma_modalidades_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.idioma_modalidades_seq', 1, false);


--
-- Name: idioma_nativos_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.idioma_nativos_seq', 77, false);


--
-- Name: modalidad_cursos_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.modalidad_cursos_seq', 131, true);


--
-- Name: modalidad_disponibles_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.modalidad_disponibles_seq', 6, true);


--
-- Name: modalidad_pagos_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.modalidad_pagos_seq', 1, false);


--
-- Name: monedas_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.monedas_seq', 5, false);


--
-- Name: nacionalidades_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.nacionalidades_seq', 208, false);


--
-- Name: niveles_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.niveles_seq', 8, false);


--
-- Name: tipo_cursos_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.tipo_cursos_seq', 4, false);


--
-- Name: users_seq; Type: SEQUENCE SET; Schema: public; Owner: edumanage
--

SELECT pg_catalog.setval('public.users_seq', 30, false);


--
-- Name: carga_horarias_aud carga_horarias_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.carga_horarias_aud
    ADD CONSTRAINT carga_horarias_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: carga_horarias carga_horarias_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.carga_horarias
    ADD CONSTRAINT carga_horarias_pkey PRIMARY KEY (id);


--
-- Name: clases_aud clases_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.clases_aud
    ADD CONSTRAINT clases_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: clases clases_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_pkey PRIMARY KEY (id);


--
-- Name: constantes constantes_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.constantes
    ADD CONSTRAINT constantes_pkey PRIMARY KEY (id);


--
-- Name: duracion_modos duracion_modos_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.duracion_modos
    ADD CONSTRAINT duracion_modos_pkey PRIMARY KEY (id);


--
-- Name: estados estados_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- Name: feriados feriados_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.feriados
    ADD CONSTRAINT feriados_pkey PRIMARY KEY (id);

--
-- Name: group_permission group_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.group_permission
    ADD CONSTRAINT group_permission_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: idioma_estudiares idioma_estudiares_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.idioma_estudiares
    ADD CONSTRAINT idioma_estudiares_pkey PRIMARY KEY (id);


--
-- Name: idioma_modalidades_aud idioma_modalidades_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.idioma_modalidades_aud
    ADD CONSTRAINT idioma_modalidades_aud_pkey PRIMARY KEY (rev, modalidad_curso_id, idioma_estudiar_id);


--
-- Name: idioma_modalidades idioma_modalidades_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.idioma_modalidades
    ADD CONSTRAINT idioma_modalidades_pkey PRIMARY KEY (id);


--
-- Name: idioma_nativos idioma_nativos_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.idioma_nativos
    ADD CONSTRAINT idioma_nativos_pkey PRIMARY KEY (id);


--
-- Name: modalidad_cursos_aud modalidad_cursos_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_cursos_aud
    ADD CONSTRAINT modalidad_cursos_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: modalidad_cursos modalidad_cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_cursos
    ADD CONSTRAINT modalidad_cursos_pkey PRIMARY KEY (id);


--
-- Name: modalidad_disponibles_aud modalidad_disponibles_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_disponibles_aud
    ADD CONSTRAINT modalidad_disponibles_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: modalidad_disponibles modalidad_disponibles_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_disponibles
    ADD CONSTRAINT modalidad_disponibles_pkey PRIMARY KEY (id);


--
-- Name: modalidad_pagos modalidad_pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_pagos
    ADD CONSTRAINT modalidad_pagos_pkey PRIMARY KEY (id);


--
-- Name: monedas monedas_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.monedas
    ADD CONSTRAINT monedas_pkey PRIMARY KEY (id);


--
-- Name: nacionalidades nacionalidades_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_pkey PRIMARY KEY (id);


--
-- Name: niveles niveles_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.niveles
    ADD CONSTRAINT niveles_pkey PRIMARY KEY (id);


--
-- Name: orientaciones orientaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.orientaciones
    ADD CONSTRAINT orientaciones_pkey PRIMARY KEY (id);


--
-- Name: revinfo revinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.revinfo
    ADD CONSTRAINT revinfo_pkey PRIMARY KEY (rev);


--
-- Name: sucursales sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (id);


--
-- Name: tipo_cancelaciones tipo_cancelaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.tipo_cancelaciones
    ADD CONSTRAINT tipo_cancelaciones_pkey PRIMARY KEY (id);


--
-- Name: tipo_cursos tipo_cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.tipo_cursos
    ADD CONSTRAINT tipo_cursos_pkey PRIMARY KEY (id);


--
-- Name: users_aud users_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.users_aud
    ADD CONSTRAINT users_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

--
-- Name: group_permission fk362e6f8f34a4d62; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.group_permission
    ADD CONSTRAINT fk362e6f8f34a4d62 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: users fk6a68e0834a4d62; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk6a68e0834a4d62 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: modalidad_cursos fk6bdfaf6b2312bdd5; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_cursos
    ADD CONSTRAINT fk6bdfaf6b2312bdd5 FOREIGN KEY (carga_horaria_id) REFERENCES public.carga_horarias(id);


--
-- Name: modalidad_cursos fk6bdfaf6b3fd83ed9; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_cursos
    ADD CONSTRAINT fk6bdfaf6b3fd83ed9 FOREIGN KEY (modalidad_pago_id) REFERENCES public.modalidad_pagos(id);


--
-- Name: modalidad_cursos fk6bdfaf6b612c72f2; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_cursos
    ADD CONSTRAINT fk6bdfaf6b612c72f2 FOREIGN KEY (moneda_id) REFERENCES public.monedas(id);


--
-- Name: modalidad_cursos fk6bdfaf6bfd9fff7d; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_cursos
    ADD CONSTRAINT fk6bdfaf6bfd9fff7d FOREIGN KEY (duracion_modo_id) REFERENCES public.duracion_modos(id);


--
-- Name: carga_horarias fk8e25c0902a89ce19; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.carga_horarias
    ADD CONSTRAINT fk8e25c0902a89ce19 FOREIGN KEY (tipo_curso_id) REFERENCES public.tipo_cursos(id);


--
-- Name: carga_horarias_aud fk_1qwrd8kxv4apjol2drap7esij; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.carga_horarias_aud
    ADD CONSTRAINT fk_1qwrd8kxv4apjol2drap7esij FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: idioma_modalidades_aud fk_6kf0qotuk34q1uvfjk2v8dkgf; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.idioma_modalidades_aud
    ADD CONSTRAINT fk_6kf0qotuk34q1uvfjk2v8dkgf FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: clases_aud fk_aw3f116y28lxb9md212phxmoj; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.clases_aud
    ADD CONSTRAINT fk_aw3f116y28lxb9md212phxmoj FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: users_aud fk_e8r4q22dh138c5f4mvlsieff5; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.users_aud
    ADD CONSTRAINT fk_e8r4q22dh138c5f4mvlsieff5 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: modalidad_cursos_aud fk_f0ldl7fih18onrmjpqerx0qfc; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_cursos_aud
    ADD CONSTRAINT fk_f0ldl7fih18onrmjpqerx0qfc FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: modalidad_disponibles_aud fk_rsweuhcmbccuupghdyy6v01ly; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_disponibles_aud
    ADD CONSTRAINT fk_rsweuhcmbccuupghdyy6v01ly FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: idioma_modalidades fka56a602f5850a41d; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.idioma_modalidades
    ADD CONSTRAINT fka56a602f5850a41d FOREIGN KEY (idioma_estudiar_id) REFERENCES public.idioma_estudiares(id);


--
-- Name: clases fkaf0f8449612c72f2; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT fkaf0f8449612c72f2 FOREIGN KEY (moneda_id) REFERENCES public.monedas(id);


--
-- Name: clases fkaf0f8449bc4da4b2; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT fkaf0f8449bc4da4b2 FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


--
-- Name: modalidad_disponibles fkf9ae206ca913d45b; Type: FK CONSTRAINT; Schema: public; Owner: edumanage
--

ALTER TABLE ONLY public.modalidad_disponibles
    ADD CONSTRAINT fkf9ae206ca913d45b FOREIGN KEY (modalidad_curso_id) REFERENCES public.modalidad_cursos(id);


--
-- PostgreSQL database dump complete
--

