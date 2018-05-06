CREATE TYPE public.modo_calculo_type AS ENUM (
    'CLASE',
    'SEMANA',
    'MES',
    'PAQUETE',
    'CANTIDAD'
);


ALTER TYPE public.modo_calculo_type OWNER TO buenosai_lvstudi;

--
-- Name: modo_facturacion_type; Type: TYPE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TYPE public.modo_facturacion_type AS ENUM (
    'CLASE',
    'SEMANA',
    'MES',
    'PAQUETE',
    'EVENTO',
    'MES_VARIABLE'
);


ALTER TYPE public.modo_facturacion_type OWNER TO buenosai_lvstudi;

--
-- Name: accents_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.accents_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accents_seq OWNER TO buenosai_lvstudi;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accents; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.accents (
    id integer DEFAULT nextval('public.accents_seq'::regclass) NOT NULL,
    descripcion character varying(40) NOT NULL
);


ALTER TABLE public.accents OWNER TO buenosai_lvstudi;

--
-- Name: acos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.acos_seq
    START WITH 438
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acos_seq OWNER TO buenosai_lvstudi;

--
-- Name: acos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.acos (
    id integer DEFAULT nextval('public.acos_seq'::regclass) NOT NULL,
    parent_id integer,
    model character varying(255) DEFAULT NULL::character varying,
    foreign_key integer,
    alias character varying(255) DEFAULT NULL::character varying,
    lft integer,
    rght integer
);


ALTER TABLE public.acos OWNER TO buenosai_lvstudi;

--
-- Name: adjuntos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.adjuntos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adjuntos_seq OWNER TO buenosai_lvstudi;

--
-- Name: adjuntos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.adjuntos (
    id integer DEFAULT nextval('public.adjuntos_seq'::regclass) NOT NULL,
    model character varying(20) NOT NULL,
    foreign_key integer NOT NULL,
    name character varying(32) NOT NULL,
    attachment character varying(255) NOT NULL,
    dir character varying(255) DEFAULT NULL::character varying,
    type character varying(255) DEFAULT NULL::character varying,
    size integer DEFAULT 0,
    active integer DEFAULT 1
);


ALTER TABLE public.adjuntos OWNER TO buenosai_lvstudi;

--
-- Name: aros_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.aros_seq
    START WITH 36
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aros_seq OWNER TO buenosai_lvstudi;

--
-- Name: aros; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.aros (
    id integer DEFAULT nextval('public.aros_seq'::regclass) NOT NULL,
    parent_id integer,
    model character varying(255) DEFAULT NULL::character varying,
    foreign_key integer,
    alias character varying(255) DEFAULT NULL::character varying,
    lft integer,
    rght integer
);


ALTER TABLE public.aros OWNER TO buenosai_lvstudi;

--
-- Name: aros_acos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.aros_acos_seq
    START WITH 439
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aros_acos_seq OWNER TO buenosai_lvstudi;

--
-- Name: aros_acos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.aros_acos (
    id integer DEFAULT nextval('public.aros_acos_seq'::regclass) NOT NULL,
    aro_id integer NOT NULL,
    aco_id integer NOT NULL,
    _create character varying(2) DEFAULT '0'::character varying NOT NULL,
    _read character varying(2) DEFAULT '0'::character varying NOT NULL,
    _update character varying(2) DEFAULT '0'::character varying NOT NULL,
    _delete character varying(2) DEFAULT '0'::character varying NOT NULL
);


ALTER TABLE public.aros_acos OWNER TO buenosai_lvstudi;

--
-- Name: asistencias_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.asistencias_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asistencias_seq OWNER TO buenosai_lvstudi;

--
-- Name: asistencias; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.asistencias (
    id integer DEFAULT nextval('public.asistencias_seq'::regclass) NOT NULL,
    clase_id integer NOT NULL,
    persona_id integer NOT NULL,
    inscripcion_id integer NOT NULL,
    presente character varying(1) DEFAULT NULL::character varying,
    student_performance text,
    reason_absence text NOT NULL
);


ALTER TABLE public.asistencias OWNER TO buenosai_lvstudi;

--
-- Name: authorities; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.authorities (
    id integer NOT NULL,
    authority character varying(50)
);


ALTER TABLE public.authorities OWNER TO buenosai_lvstudi;

--
-- Name: authorities_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.authorities_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authorities_seq OWNER TO buenosai_lvstudi;

--
-- Name: cambios_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.cambios_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cambios_seq OWNER TO buenosai_lvstudi;

--
-- Name: cambios; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.cambios (
    id integer DEFAULT nextval('public.cambios_seq'::regclass) NOT NULL,
    objeto character varying(50) NOT NULL,
    objeto_id integer NOT NULL,
    controller character varying(30) NOT NULL,
    action character varying(50) NOT NULL,
    descripcion_cambio text,
    motivo character varying(300) DEFAULT NULL::character varying,
    user_id integer,
    profesor_id integer,
    fecha timestamp with time zone NOT NULL
);


ALTER TABLE public.cambios OWNER TO buenosai_lvstudi;

--
-- Name: cancelacion_estudiantes_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.cancelacion_estudiantes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cancelacion_estudiantes_seq OWNER TO buenosai_lvstudi;

--
-- Name: cancelacion_estudiantes; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.cancelacion_estudiantes (
    id integer DEFAULT nextval('public.cancelacion_estudiantes_seq'::regclass) NOT NULL,
    motivo text NOT NULL,
    persona_id integer NOT NULL,
    inscripcion_id integer NOT NULL,
    profesor_id integer NOT NULL,
    clase_id integer NOT NULL,
    asistencia_id integer NOT NULL,
    fecha_cancelacion timestamp with time zone NOT NULL,
    horas_anticipacion character varying(20) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.cancelacion_estudiantes OWNER TO buenosai_lvstudi;

--
-- Name: cancelacion_profesores_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.cancelacion_profesores_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cancelacion_profesores_seq OWNER TO buenosai_lvstudi;

--
-- Name: cancelacion_profesores; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.cancelacion_profesores (
    id integer DEFAULT nextval('public.cancelacion_profesores_seq'::regclass) NOT NULL,
    motivo text NOT NULL,
    profesor_id integer NOT NULL,
    clase_id integer NOT NULL,
    fecha_cancelacion timestamp with time zone NOT NULL,
    horas_anticipacion character varying(20) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.cancelacion_profesores OWNER TO buenosai_lvstudi;

--
-- Name: cancelaciones_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.cancelaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cancelaciones_seq OWNER TO buenosai_lvstudi;

--
-- Name: cancelaciones; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.cancelaciones (
    id integer DEFAULT nextval('public.cancelaciones_seq'::regclass) NOT NULL,
    clase_id integer NOT NULL,
    tipo_cancelacion_id integer NOT NULL,
    fecha_cancelacion timestamp with time zone NOT NULL,
    horas_anticipacion character varying(20) DEFAULT ''::character varying NOT NULL,
    persona_id integer,
    profesor_id integer,
    user_id integer NOT NULL,
    comentarios text,
    recuperada_id integer
);


ALTER TABLE public.cancelaciones OWNER TO buenosai_lvstudi;

--
-- Name: carga_horarias_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.carga_horarias_seq
    START WITH 68
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carga_horarias_seq OWNER TO buenosai_lvstudi;

--
-- Name: carga_horarias; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.carga_horarias (
    id integer DEFAULT nextval('public.carga_horarias_seq'::regclass) NOT NULL,
    tipo_curso_id integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    horas_semanales numeric(8,2) NOT NULL,
    dias_semana integer NOT NULL,
    horas_clase numeric(8,2) NOT NULL
);


ALTER TABLE public.carga_horarias OWNER TO buenosai_lvstudi;

--
-- Name: carga_horarias_aud; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
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


ALTER TABLE public.carga_horarias_aud OWNER TO buenosai_lvstudi;

--
-- Name: clase_cuotas_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.clase_cuotas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clase_cuotas_seq OWNER TO buenosai_lvstudi;

--
-- Name: clase_cuotas; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.clase_cuotas (
    id integer DEFAULT nextval('public.clase_cuotas_seq'::regclass) NOT NULL,
    cuota_id integer NOT NULL,
    clase_id integer NOT NULL,
    inscripcion_id integer NOT NULL,
    precio_promedio_por_hora numeric(8,2) DEFAULT 0.00 NOT NULL,
    moneda_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.clase_cuotas OWNER TO buenosai_lvstudi;

--
-- Name: clase_cursos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.clase_cursos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clase_cursos_seq OWNER TO buenosai_lvstudi;

--
-- Name: clase_cursos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.clase_cursos (
    id integer DEFAULT nextval('public.clase_cursos_seq'::regclass) NOT NULL,
    descripcion character varying(100) NOT NULL,
    abreviatura character varying(5) NOT NULL,
    idioma_estudiar_id integer,
    tipo_curso_id integer
);


ALTER TABLE public.clase_cursos OWNER TO buenosai_lvstudi;

--
-- Name: clases_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.clases_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clases_seq OWNER TO buenosai_lvstudi;

--
-- Name: clases; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
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


ALTER TABLE public.clases OWNER TO buenosai_lvstudi;

--
-- Name: clases_aud; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
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


ALTER TABLE public.clases_aud OWNER TO buenosai_lvstudi;

--
-- Name: comentario_cursos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.comentario_cursos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentario_cursos_seq OWNER TO buenosai_lvstudi;

--
-- Name: comentario_cursos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.comentario_cursos (
    id integer DEFAULT nextval('public.comentario_cursos_seq'::regclass) NOT NULL,
    curso_id integer NOT NULL,
    comentario text NOT NULL,
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    fecha_hora timestamp with time zone NOT NULL
);


ALTER TABLE public.comentario_cursos OWNER TO buenosai_lvstudi;

--
-- Name: comentario_profesores_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.comentario_profesores_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentario_profesores_seq OWNER TO buenosai_lvstudi;

--
-- Name: comentario_profesores; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.comentario_profesores (
    id integer DEFAULT nextval('public.comentario_profesores_seq'::regclass) NOT NULL,
    profesor_id integer NOT NULL,
    comentario text NOT NULL,
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    fecha_hora timestamp with time zone NOT NULL
);


ALTER TABLE public.comentario_profesores OWNER TO buenosai_lvstudi;

--
-- Name: comentarios_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.comentarios_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentarios_seq OWNER TO buenosai_lvstudi;

--
-- Name: comentarios; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.comentarios (
    id integer DEFAULT nextval('public.comentarios_seq'::regclass) NOT NULL,
    persona_id integer NOT NULL,
    comentario text NOT NULL,
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    fecha_hora timestamp with time zone NOT NULL
);


ALTER TABLE public.comentarios OWNER TO buenosai_lvstudi;

--
-- Name: como_supos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.como_supos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.como_supos_seq OWNER TO buenosai_lvstudi;

--
-- Name: como_supos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.como_supos (
    id integer DEFAULT nextval('public.como_supos_seq'::regclass) NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public.como_supos OWNER TO buenosai_lvstudi;

--
-- Name: constantes_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.constantes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constantes_seq OWNER TO buenosai_lvstudi;

--
-- Name: constantes; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.constantes (
    id integer DEFAULT nextval('public.constantes_seq'::regclass) NOT NULL,
    nombre_variable character varying(40) NOT NULL,
    valor_variable character varying(40) NOT NULL
);


ALTER TABLE public.constantes OWNER TO buenosai_lvstudi;

--
-- Name: cuotas_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.cuotas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuotas_seq OWNER TO buenosai_lvstudi;

--
-- Name: cuotas; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.cuotas (
    id integer DEFAULT nextval('public.cuotas_seq'::regclass) NOT NULL,
    persona_id integer NOT NULL,
    inscripcion_id integer NOT NULL,
    extension_cursada_id integer,
    curso_id integer NOT NULL,
    descripcion character varying(150) NOT NULL,
    confirmado integer DEFAULT 0,
    fecha_vencimiento date NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL,
    monto_pagar numeric(8,2) NOT NULL,
    es_matricula integer DEFAULT 0,
    moneda_id integer NOT NULL,
    saldo_pagar numeric(8,2) DEFAULT 0.00 NOT NULL,
    comentarios text,
    motivo text
);


ALTER TABLE public.cuotas OWNER TO buenosai_lvstudi;

--
-- Name: curso_ofrecidos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.curso_ofrecidos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curso_ofrecidos_seq OWNER TO buenosai_lvstudi;

--
-- Name: curso_ofrecidos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.curso_ofrecidos (
    id integer DEFAULT nextval('public.curso_ofrecidos_seq'::regclass) NOT NULL,
    curso_id integer NOT NULL,
    profesor_id integer NOT NULL,
    fecha_ofrecido date,
    aceptado integer,
    fecha_aceptacion date,
    estado_aceptacion character varying(30) DEFAULT 'No aceptado'::character varying NOT NULL
);


ALTER TABLE public.curso_ofrecidos OWNER TO buenosai_lvstudi;

--
-- Name: curso_profesores_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.curso_profesores_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curso_profesores_seq OWNER TO buenosai_lvstudi;

--
-- Name: curso_profesores; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.curso_profesores (
    id integer DEFAULT nextval('public.curso_profesores_seq'::regclass) NOT NULL,
    profesor_id integer NOT NULL,
    honorario_profesor_id integer NOT NULL,
    curso_id integer NOT NULL,
    precio_por_hora numeric(8,2) NOT NULL,
    moneda_id integer NOT NULL,
    fecha_desde date NOT NULL
);


ALTER TABLE public.curso_profesores OWNER TO buenosai_lvstudi;

--
-- Name: cursos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.cursos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cursos_seq OWNER TO buenosai_lvstudi;

--
-- Name: cursos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.cursos (
    id integer DEFAULT nextval('public.cursos_seq'::regclass) NOT NULL,
    codigo_curso character varying(50) NOT NULL,
    descripcion_curso character varying(50) NOT NULL,
    libro character varying(50) NOT NULL,
    duracion_paquete character varying(50) DEFAULT NULL::character varying,
    carga_horaria character varying(50) DEFAULT NULL::character varying,
    incluye character varying(50) DEFAULT NULL::character varying,
    profesor_titular character varying(50) DEFAULT ''::character varying,
    profesor_suplente character varying(50) DEFAULT ''::character varying,
    horario_curso character varying(40) DEFAULT NULL::character varying,
    fecha_comienzo date NOT NULL,
    fecha_fin date NOT NULL,
    fecha_baja date,
    tipo_curso_id integer,
    clase_curso_id integer,
    modalidad_pago_id integer,
    monto_unidad_modalidad numeric(8,2) DEFAULT 0.00 NOT NULL,
    moneda_id integer DEFAULT 1 NOT NULL,
    idioma_estudiar_id integer NOT NULL,
    nivel_id integer,
    sucursal_id integer,
    domicilio_clase character varying(100) DEFAULT NULL::character varying,
    abierto character varying(1) DEFAULT 'N'::character varying NOT NULL,
    inscriptos integer DEFAULT 0,
    baja integer DEFAULT 0 NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone,
    intensivo boolean DEFAULT false NOT NULL,
    es_paquete integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cursos OWNER TO buenosai_lvstudi;

--
-- Name: cursos_aud; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.cursos_aud (
    es_paquete integer NOT NULL,
    id integer NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    abierto character varying(255),
    baja integer,
    codigo_curso character varying(255),
    descripcion_curso character varying(255),
    fecha_baja timestamp without time zone,
    fecha_comienzo timestamp without time zone,
    fecha_fin timestamp without time zone,
    horario_curso character varying(255),
    inscriptos integer,
    intensivo boolean,
    idioma_estudiar_id integer,
    nivel_id integer,
    sucursal_id integer,
    tipo_curso_id integer,
    libro character varying(50)
);


ALTER TABLE public.cursos_aud OWNER TO buenosai_lvstudi;

--
-- Name: cursos_nombres_viejos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.cursos_nombres_viejos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cursos_nombres_viejos_seq OWNER TO buenosai_lvstudi;

--
-- Name: cursos_nombres_viejos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.cursos_nombres_viejos (
    id integer DEFAULT nextval('public.cursos_nombres_viejos_seq'::regclass) NOT NULL,
    curso_id integer NOT NULL,
    codigo_curso character varying(50) NOT NULL,
    descripcion_curso character varying(50) NOT NULL,
    fecha_cambio date NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cursos_nombres_viejos OWNER TO buenosai_lvstudi;

--
-- Name: devoluciones_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.devoluciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devoluciones_seq OWNER TO buenosai_lvstudi;

--
-- Name: devoluciones; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.devoluciones (
    id integer DEFAULT nextval('public.devoluciones_seq'::regclass) NOT NULL,
    fecha date NOT NULL,
    user_id integer NOT NULL,
    monto numeric(8,2) NOT NULL,
    moneda_id integer NOT NULL,
    sucursal_id integer NOT NULL,
    cuota_id integer NOT NULL
);


ALTER TABLE public.devoluciones OWNER TO buenosai_lvstudi;

--
-- Name: duracion_modos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.duracion_modos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.duracion_modos_seq OWNER TO buenosai_lvstudi;

--
-- Name: duracion_modos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.duracion_modos (
    id integer DEFAULT nextval('public.duracion_modos_seq'::regclass) NOT NULL,
    descripcion character varying(100) NOT NULL,
    codigo character varying(30) NOT NULL
);


ALTER TABLE public.duracion_modos OWNER TO buenosai_lvstudi;

--
-- Name: estado_inscripcion; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.estado_inscripcion (
    id integer NOT NULL,
    descripcion character varying(30) NOT NULL,
    abreviatura character varying(1) NOT NULL
);


ALTER TABLE public.estado_inscripcion OWNER TO buenosai_lvstudi;

--
-- Name: estados_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.estados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estados_seq OWNER TO buenosai_lvstudi;

--
-- Name: estados; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.estados (
    id integer DEFAULT nextval('public.estados_seq'::regclass) NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public.estados OWNER TO buenosai_lvstudi;

--
-- Name: extension_cursadas_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.extension_cursadas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extension_cursadas_seq OWNER TO buenosai_lvstudi;

--
-- Name: extension_cursadas; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.extension_cursadas (
    id integer DEFAULT nextval('public.extension_cursadas_seq'::regclass) NOT NULL,
    modalidad_curso_id integer NOT NULL,
    inscripcion_id integer NOT NULL,
    duracion_modo_id integer NOT NULL,
    duracion_cantidad integer NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL,
    precio_unidad_modalidad numeric(8,2) NOT NULL,
    moneda_id integer NOT NULL
);


ALTER TABLE public.extension_cursadas OWNER TO buenosai_lvstudi;

--
-- Name: extra_personas_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.extra_personas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extra_personas_seq OWNER TO buenosai_lvstudi;

--
-- Name: extra_personas; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.extra_personas (
    id integer DEFAULT nextval('public.extra_personas_seq'::regclass) NOT NULL,
    extra_id integer NOT NULL,
    persona_id integer NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.extra_personas OWNER TO buenosai_lvstudi;

--
-- Name: extras_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.extras_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_seq OWNER TO buenosai_lvstudi;

--
-- Name: extras; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.extras (
    id integer DEFAULT nextval('public.extras_seq'::regclass) NOT NULL,
    descripcion character varying(100) NOT NULL,
    precio numeric(8,2) NOT NULL,
    moneda_id integer NOT NULL
);


ALTER TABLE public.extras OWNER TO buenosai_lvstudi;

--
-- Name: feriados_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.feriados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feriados_seq OWNER TO buenosai_lvstudi;

--
-- Name: feriados; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.feriados (
    id integer DEFAULT nextval('public.feriados_seq'::regclass) NOT NULL,
    fecha date NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.feriados OWNER TO buenosai_lvstudi;

--
-- Name: group_permission_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.group_permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_permission_seq OWNER TO buenosai_lvstudi;

--
-- Name: group_permission; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.group_permission (
    id integer DEFAULT nextval('public.group_permission_seq'::regclass) NOT NULL,
    group_id bigint NOT NULL,
    authority character varying(50) NOT NULL
);


ALTER TABLE public.group_permission OWNER TO buenosai_lvstudi;

--
-- Name: groups_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.groups_seq
    START WITH 6
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_seq OWNER TO buenosai_lvstudi;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.groups (
    id integer DEFAULT nextval('public.groups_seq'::regclass) NOT NULL,
    group_name character varying(100) NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone
);


ALTER TABLE public.groups OWNER TO buenosai_lvstudi;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO buenosai_lvstudi;

--
-- Name: honorario_asignados_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.honorario_asignados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.honorario_asignados_seq OWNER TO buenosai_lvstudi;

--
-- Name: honorario_asignados; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.honorario_asignados (
    id integer DEFAULT nextval('public.honorario_asignados_seq'::regclass) NOT NULL,
    profesor_id integer NOT NULL,
    honorario_profesor_id integer NOT NULL,
    fecha_asignacion date NOT NULL,
    fecha_desde date NOT NULL,
    precio_por_hora numeric(8,2) NOT NULL,
    moneda_id integer NOT NULL
);


ALTER TABLE public.honorario_asignados OWNER TO buenosai_lvstudi;

--
-- Name: honorario_asignados_aud; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.honorario_asignados_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    fecha_asignacion timestamp without time zone,
    fecha_desde timestamp without time zone,
    precio_por_hora double precision,
    honorario_profesor_id bigint,
    moneda_id integer,
    profesor_id bigint
);


ALTER TABLE public.honorario_asignados_aud OWNER TO buenosai_lvstudi;

--
-- Name: honorario_profesores_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.honorario_profesores_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.honorario_profesores_seq OWNER TO buenosai_lvstudi;

--
-- Name: honorario_profesores; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.honorario_profesores (
    id integer DEFAULT nextval('public.honorario_profesores_seq'::regclass) NOT NULL,
    precio_por_hora numeric(8,2) NOT NULL,
    moneda_id integer NOT NULL,
    descripcion character varying(100) NOT NULL,
    idioma_estudiar_id integer NOT NULL,
    otro_honorario integer NOT NULL,
    fecha_desde date NOT NULL,
    especial integer DEFAULT 0 NOT NULL,
    profesor_id integer,
    modified date,
    cambios integer DEFAULT 0
);


ALTER TABLE public.honorario_profesores OWNER TO buenosai_lvstudi;

--
-- Name: COLUMN honorario_profesores.cambios; Type: COMMENT; Schema: public; Owner: buenosai_lvstudi
--

COMMENT ON COLUMN public.honorario_profesores.cambios IS 'Cantidad de cambios que se han hecho sobre este honorario';


--
-- Name: honorario_profesores_aud; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.honorario_profesores_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    descripcion character varying(255),
    especial integer,
    fecha_desde timestamp without time zone,
    otro_honorario double precision,
    precio_por_hora double precision,
    idioma_estudiar_id integer,
    moneda_id integer
);


ALTER TABLE public.honorario_profesores_aud OWNER TO buenosai_lvstudi;

--
-- Name: honorario_profesores_historico_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.honorario_profesores_historico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.honorario_profesores_historico_seq OWNER TO buenosai_lvstudi;

--
-- Name: honorario_profesores_historico; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.honorario_profesores_historico (
    id integer DEFAULT nextval('public.honorario_profesores_historico_seq'::regclass) NOT NULL,
    honorario_profesor_id integer NOT NULL,
    fecha_desde date NOT NULL,
    precio_por_hora numeric(8,2) NOT NULL,
    moneda_id integer NOT NULL
);


ALTER TABLE public.honorario_profesores_historico OWNER TO buenosai_lvstudi;

--
-- Name: horario_cursos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.horario_cursos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horario_cursos_seq OWNER TO buenosai_lvstudi;

--
-- Name: horario_cursos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.horario_cursos (
    id integer DEFAULT nextval('public.horario_cursos_seq'::regclass) NOT NULL,
    curso_id integer NOT NULL,
    dia_semana character varying(30) NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    profesor_id integer NOT NULL,
    fecha_desde date,
    fecha_hasta date,
    sucursal_id integer,
    honorario_profesor_id integer,
    precio_por_hora double precision,
    moneda_id integer
);


ALTER TABLE public.horario_cursos OWNER TO buenosai_lvstudi;

--
-- Name: COLUMN horario_cursos.fecha_desde; Type: COMMENT; Schema: public; Owner: buenosai_lvstudi
--

COMMENT ON COLUMN public.horario_cursos.fecha_desde IS 'Fecha desde la cual empieza este horario para este curso';


--
-- Name: COLUMN horario_cursos.fecha_hasta; Type: COMMENT; Schema: public; Owner: buenosai_lvstudi
--

COMMENT ON COLUMN public.horario_cursos.fecha_hasta IS 'Fecha en la que finaliza el horario para este curso';


--
-- Name: COLUMN horario_cursos.sucursal_id; Type: COMMENT; Schema: public; Owner: buenosai_lvstudi
--

COMMENT ON COLUMN public.horario_cursos.sucursal_id IS 'Sucursal en el que se cursa este curso para este dia';


--
-- Name: COLUMN horario_cursos.honorario_profesor_id; Type: COMMENT; Schema: public; Owner: buenosai_lvstudi
--

COMMENT ON COLUMN public.horario_cursos.honorario_profesor_id IS 'Honorario que se le paga al profesor por este horario';


--
-- Name: COLUMN horario_cursos.precio_por_hora; Type: COMMENT; Schema: public; Owner: buenosai_lvstudi
--

COMMENT ON COLUMN public.horario_cursos.precio_por_hora IS 'Precio por hora a pagar al profesor (valor neto, sin moneda)';


--
-- Name: COLUMN horario_cursos.moneda_id; Type: COMMENT; Schema: public; Owner: buenosai_lvstudi
--

COMMENT ON COLUMN public.horario_cursos.moneda_id IS 'Moneda de pago del honorario del profesor';


--
-- Name: horario_cursos_aud; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.horario_cursos_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    dia_semana character varying(255),
    fecha_desde timestamp without time zone,
    fecha_hasta timestamp without time zone,
    hora_fin bytea,
    hora_inicio bytea,
    precio_por_hora double precision,
    curso_id integer,
    honorario_profesor_id bigint,
    moneda_id integer,
    profesor_id bigint,
    sucursal_id integer
);


ALTER TABLE public.horario_cursos_aud OWNER TO buenosai_lvstudi;

--
-- Name: horario_profesor_empleado_renglones_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.horario_profesor_empleado_renglones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horario_profesor_empleado_renglones_seq OWNER TO buenosai_lvstudi;

--
-- Name: horario_profesor_empleado_renglones; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.horario_profesor_empleado_renglones (
    id integer DEFAULT nextval('public.horario_profesor_empleado_renglones_seq'::regclass) NOT NULL,
    horario_profesor_empleado_id integer NOT NULL,
    dia_semana character varying(20) NOT NULL,
    hora_comienzo time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL
);


ALTER TABLE public.horario_profesor_empleado_renglones OWNER TO buenosai_lvstudi;

--
-- Name: horario_profesor_empleados_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.horario_profesor_empleados_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horario_profesor_empleados_seq OWNER TO buenosai_lvstudi;

--
-- Name: horario_profesor_empleados; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.horario_profesor_empleados (
    id integer DEFAULT nextval('public.horario_profesor_empleados_seq'::regclass) NOT NULL,
    profesor_id integer NOT NULL,
    fecha_comienzo date NOT NULL,
    fecha_fin date
);


ALTER TABLE public.horario_profesor_empleados OWNER TO buenosai_lvstudi;

--
-- Name: horario_profesor_excepciones_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.horario_profesor_excepciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horario_profesor_excepciones_seq OWNER TO buenosai_lvstudi;

--
-- Name: horario_profesor_excepciones; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.horario_profesor_excepciones (
    id integer DEFAULT nextval('public.horario_profesor_excepciones_seq'::regclass) NOT NULL,
    horario_profesor_id integer NOT NULL,
    fecha_excepcion date NOT NULL
);


ALTER TABLE public.horario_profesor_excepciones OWNER TO buenosai_lvstudi;

--
-- Name: horario_profesores_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.horario_profesores_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.horario_profesores_seq OWNER TO buenosai_lvstudi;

--
-- Name: horario_profesores; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.horario_profesores (
    id integer DEFAULT nextval('public.horario_profesores_seq'::regclass) NOT NULL,
    profesor_id integer NOT NULL,
    fecha_comienzo date NOT NULL,
    fecha_fin date NOT NULL,
    dia_semana character varying(20) NOT NULL,
    hora_comienzo time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    lugar character varying(40) NOT NULL
);


ALTER TABLE public.horario_profesores OWNER TO buenosai_lvstudi;

--
-- Name: idioma_estudiares_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.idioma_estudiares_seq
    START WITH 11
    INCREMENT BY 1
    MINVALUE 11
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idioma_estudiares_seq OWNER TO buenosai_lvstudi;

--
-- Name: idioma_estudiares; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.idioma_estudiares (
    id integer DEFAULT nextval('public.idioma_estudiares_seq'::regclass) NOT NULL,
    descripcion character varying(50) NOT NULL,
    abreviatura character varying(5) DEFAULT NULL::character varying
);


ALTER TABLE public.idioma_estudiares OWNER TO buenosai_lvstudi;

--
-- Name: idioma_modalidades_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.idioma_modalidades_seq
    START WITH 236
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idioma_modalidades_seq OWNER TO buenosai_lvstudi;

--
-- Name: idioma_modalidades; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.idioma_modalidades (
    id integer DEFAULT nextval('public.idioma_modalidades_seq'::regclass) NOT NULL,
    modalidad_curso_id integer NOT NULL,
    idioma_estudiar_id integer NOT NULL
);


ALTER TABLE public.idioma_modalidades OWNER TO buenosai_lvstudi;

--
-- Name: idioma_modalidades_aud; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.idioma_modalidades_aud (
    rev integer NOT NULL,
    modalidad_curso_id bigint NOT NULL,
    idioma_estudiar_id integer NOT NULL,
    revtype smallint
);


ALTER TABLE public.idioma_modalidades_aud OWNER TO buenosai_lvstudi;

--
-- Name: idioma_nativos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.idioma_nativos_seq
    START WITH 77
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idioma_nativos_seq OWNER TO buenosai_lvstudi;

--
-- Name: idioma_nativos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.idioma_nativos (
    id integer DEFAULT nextval('public.idioma_nativos_seq'::regclass) NOT NULL,
    descripcion character varying(40) NOT NULL,
    descripcion_ingles character varying(40) NOT NULL
);


ALTER TABLE public.idioma_nativos OWNER TO buenosai_lvstudi;

--
-- Name: inscripciones_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.inscripciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inscripciones_seq OWNER TO buenosai_lvstudi;

--
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.inscripciones (
    id integer DEFAULT nextval('public.inscripciones_seq'::regclass) NOT NULL,
    curso_id integer,
    modalidad_curso_id integer,
    modo_cursada character varying(100) DEFAULT NULL::character varying,
    persona_id integer NOT NULL,
    confirmada integer DEFAULT 0 NOT NULL,
    pre_inscripcion integer DEFAULT 0,
    fecha_inscripcion date NOT NULL,
    fecha_comienzo date,
    fecha_finalizacion date,
    baja integer DEFAULT 0 NOT NULL,
    fecha_baja date,
    empleado integer DEFAULT 0,
    motivo_empleado text,
    borrada integer DEFAULT 0 NOT NULL,
    created timestamp with time zone DEFAULT now(),
    modified timestamp with time zone,
    tipo character varying(50),
    estado_id integer NOT NULL,
    lista_espera integer,
    materia character varying(60) DEFAULT NULL::character varying,
    nivel character varying(50) DEFAULT NULL::character varying,
    clases_semanales integer,
    horas_clase character varying(30) DEFAULT NULL::character varying,
    dias_preferidos character varying(60) DEFAULT NULL::character varying,
    dias_alternativos character varying(60) DEFAULT NULL::character varying,
    horario_preferido character varying(60) DEFAULT NULL::character varying,
    horario_alternativo character varying(60) DEFAULT NULL::character varying,
    sexo_profesor character varying(10) DEFAULT NULL::character varying,
    preferencia_idioma character varying(30) DEFAULT NULL::character varying,
    idioma_estudiar_id integer,
    nivel_id integer,
    orientacion_id integer,
    profesor_posible_id integer,
    cual_examen character varying(20) DEFAULT NULL::character varying,
    otra_orientacion character varying(40) DEFAULT NULL::character varying,
    sucursal_id integer DEFAULT 0
);


ALTER TABLE public.inscripciones OWNER TO buenosai_lvstudi;

--
-- Name: inscripciones_aud; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.inscripciones_aud (
    tipo character varying(31) NOT NULL,
    id integer NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    baja integer,
    borrada integer,
    confirmada integer,
    created timestamp without time zone,
    empleado integer,
    fecha_baja timestamp without time zone,
    fecha_comienzo timestamp without time zone,
    fecha_finalizacion timestamp without time zone,
    fecha_inscripcion timestamp without time zone,
    curso_id integer,
    estado_id integer,
    modalidad_curso_id bigint,
    persona_id integer,
    clases_semanales integer,
    cual_examen character varying(255),
    dias_alternativos character varying(255),
    dias_preferidos character varying(255),
    horario_alternativo character varying(255),
    horario_preferido character varying(255),
    horas_clase character varying(255),
    materia character varying(255),
    otra_orientacion character varying(255),
    preferencia_idioma character varying(255),
    sexo_profesor character varying(255),
    idioma_estudiar_id integer,
    nivel_id integer,
    orientacion_id bigint,
    profesor_posible_id bigint,
    sucursal_id integer,
    lista_espera integer,
    modified timestamp with time zone
);


ALTER TABLE public.inscripciones_aud OWNER TO buenosai_lvstudi;

--
-- Name: inscripciones_individuales_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.inscripciones_individuales_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inscripciones_individuales_seq OWNER TO buenosai_lvstudi;

--
-- Name: inscripciones_individuales; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.inscripciones_individuales (
    id integer DEFAULT nextval('public.inscripciones_individuales_seq'::regclass) NOT NULL,
    persona_id integer,
    sucursal_id integer,
    materia character varying(60) DEFAULT NULL::character varying,
    modo_cursada_individual character varying(100) DEFAULT ''::character varying,
    nivel character varying(50) DEFAULT NULL::character varying,
    clases_semanales integer,
    horas_clase character varying(30) DEFAULT NULL::character varying,
    paquetes character varying(100) DEFAULT NULL::character varying,
    fecha_estimada_comienzo date,
    dias_preferidos character varying(60) DEFAULT NULL::character varying,
    dias_alternativos character varying(60) DEFAULT NULL::character varying,
    horario_preferido character varying(60) DEFAULT NULL::character varying,
    horario_alternativo character varying(60) DEFAULT NULL::character varying,
    sexo_profesor character varying(10) DEFAULT NULL::character varying,
    preferencia_idioma character varying(30) DEFAULT NULL::character varying,
    idioma_estudiar_id integer,
    nivel_id integer,
    orientacion_id integer,
    profesor_posible_id integer,
    cual_examen character varying(20) DEFAULT NULL::character varying,
    otra_orientacion character varying(40) DEFAULT NULL::character varying,
    confirmada integer DEFAULT 0,
    inscripcion_id integer,
    lista_espera integer DEFAULT 0,
    dual integer DEFAULT 0 NOT NULL,
    modalidad_curso_id integer,
    pre_inscripcion integer DEFAULT 0 NOT NULL,
    borrada integer DEFAULT 0 NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone
);


ALTER TABLE public.inscripciones_individuales OWNER TO buenosai_lvstudi;

--
-- Name: modalidad_curso_descripciones_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.modalidad_curso_descripciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modalidad_curso_descripciones_seq OWNER TO buenosai_lvstudi;

--
-- Name: modalidad_curso_descripciones; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.modalidad_curso_descripciones (
    id integer DEFAULT nextval('public.modalidad_curso_descripciones_seq'::regclass) NOT NULL,
    modalidad_curso_id integer NOT NULL,
    titulo_curso character varying(100) NOT NULL,
    descripcion_curso text NOT NULL,
    in_a_nutshell text NOT NULL,
    whats_included text NOT NULL,
    goal_of_course text NOT NULL
);


ALTER TABLE public.modalidad_curso_descripciones OWNER TO buenosai_lvstudi;

--
-- Name: modalidad_cursos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.modalidad_cursos_seq
    START WITH 131
    INCREMENT BY 1
    MINVALUE 131
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modalidad_cursos_seq OWNER TO buenosai_lvstudi;

--
-- Name: modalidad_cursos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
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


ALTER TABLE public.modalidad_cursos OWNER TO buenosai_lvstudi;

--
-- Name: modalidad_cursos_aud; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
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


ALTER TABLE public.modalidad_cursos_aud OWNER TO buenosai_lvstudi;

--
-- Name: modalidad_disponibles_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.modalidad_disponibles_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modalidad_disponibles_seq OWNER TO buenosai_lvstudi;

--
-- Name: modalidad_disponibles; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.modalidad_disponibles (
    id integer DEFAULT nextval('public.modalidad_disponibles_seq'::regclass) NOT NULL,
    curso_id integer NOT NULL,
    modalidad_curso_id integer NOT NULL,
    precio_unidad_modalidad real,
    moneda_id integer
);


ALTER TABLE public.modalidad_disponibles OWNER TO buenosai_lvstudi;

--
-- Name: COLUMN modalidad_disponibles.precio_unidad_modalidad; Type: COMMENT; Schema: public; Owner: buenosai_lvstudi
--

COMMENT ON COLUMN public.modalidad_disponibles.precio_unidad_modalidad IS 'Precio de la modalidad al momento de asignarse al curso';


--
-- Name: modalidad_disponibles_aud; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
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


ALTER TABLE public.modalidad_disponibles_aud OWNER TO buenosai_lvstudi;

--
-- Name: modalidad_pagos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.modalidad_pagos_seq
    START WITH 21
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modalidad_pagos_seq OWNER TO buenosai_lvstudi;

--
-- Name: modalidad_pagos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.modalidad_pagos (
    id integer DEFAULT nextval('public.modalidad_pagos_seq'::regclass) NOT NULL,
    descripcion character varying(40) NOT NULL,
    modo_facturacion public.modo_facturacion_type,
    modo_calculo public.modo_calculo_type
);


ALTER TABLE public.modalidad_pagos OWNER TO buenosai_lvstudi;

--
-- Name: monedas_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.monedas_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monedas_seq OWNER TO buenosai_lvstudi;

--
-- Name: monedas; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.monedas (
    id integer DEFAULT nextval('public.monedas_seq'::regclass) NOT NULL,
    descripcion character varying(30) NOT NULL,
    tasa_cambio numeric(8,2) NOT NULL,
    simbolo character varying(3) NOT NULL
);


ALTER TABLE public.monedas OWNER TO buenosai_lvstudi;

--
-- Name: motivos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.motivos_seq
    START WITH 17
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motivos_seq OWNER TO buenosai_lvstudi;

--
-- Name: motivos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.motivos (
    id integer DEFAULT nextval('public.motivos_seq'::regclass) NOT NULL,
    descripcion character varying(100) NOT NULL,
    descripcion_ingles character varying(100) NOT NULL,
    externo integer DEFAULT 0 NOT NULL,
    estado_id integer NOT NULL
);


ALTER TABLE public.motivos OWNER TO buenosai_lvstudi;

--
-- Name: nacionalidades_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.nacionalidades_seq
    START WITH 208
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nacionalidades_seq OWNER TO buenosai_lvstudi;

--
-- Name: nacionalidades; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.nacionalidades (
    id integer DEFAULT nextval('public.nacionalidades_seq'::regclass) NOT NULL,
    descripcion character varying(30) NOT NULL,
    descripcion_ingles character varying(30) NOT NULL
);


ALTER TABLE public.nacionalidades OWNER TO buenosai_lvstudi;

--
-- Name: niveles_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.niveles_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.niveles_seq OWNER TO buenosai_lvstudi;

--
-- Name: niveles; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.niveles (
    id integer DEFAULT nextval('public.niveles_seq'::regclass) NOT NULL,
    descripcion character varying(50) NOT NULL,
    dificultad integer DEFAULT 0,
    abreviatura character varying(5) NOT NULL
);


ALTER TABLE public.niveles OWNER TO buenosai_lvstudi;

--
-- Name: notificacion_enviadas_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.notificacion_enviadas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notificacion_enviadas_seq OWNER TO buenosai_lvstudi;

--
-- Name: notificacion_enviadas; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.notificacion_enviadas (
    id integer DEFAULT nextval('public.notificacion_enviadas_seq'::regclass) NOT NULL,
    fecha_envio timestamp with time zone NOT NULL,
    user_id integer,
    notificacion_id integer NOT NULL,
    lista_destinatarios text NOT NULL,
    persona_id integer,
    hash_mensaje character varying(200) DEFAULT NULL::character varying
);


ALTER TABLE public.notificacion_enviadas OWNER TO buenosai_lvstudi;

--
-- Name: notificaciones_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.notificaciones_seq
    START WITH 64
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notificaciones_seq OWNER TO buenosai_lvstudi;

--
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.notificaciones (
    id integer DEFAULT nextval('public.notificaciones_seq'::regclass) NOT NULL,
    clase character varying(30) DEFAULT NULL::character varying,
    metodo character varying(50) DEFAULT NULL::character varying,
    descripcion character varying(100) DEFAULT NULL::character varying,
    titulo character varying(100) DEFAULT NULL::character varying,
    titulo_ingles character varying(100) DEFAULT NULL::character varying,
    archivo character varying(200) DEFAULT NULL::character varying,
    nombre_vista character varying(50) DEFAULT NULL::character varying,
    destinatarios text,
    adjuntos text,
    adjuntos_ingles text
);


ALTER TABLE public.notificaciones OWNER TO buenosai_lvstudi;

--
-- Name: orientaciones_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.orientaciones_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orientaciones_seq OWNER TO buenosai_lvstudi;

--
-- Name: orientaciones; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.orientaciones (
    id integer DEFAULT nextval('public.orientaciones_seq'::regclass) NOT NULL,
    descripcion character varying(20) NOT NULL
);


ALTER TABLE public.orientaciones OWNER TO buenosai_lvstudi;

--
-- Name: pagos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.pagos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagos_seq OWNER TO buenosai_lvstudi;

--
-- Name: pagos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.pagos (
    id integer DEFAULT nextval('public.pagos_seq'::regclass) NOT NULL,
    persona_id integer DEFAULT 0 NOT NULL,
    monto_pago numeric(8,2) DEFAULT 0.00 NOT NULL,
    moneda_id integer DEFAULT 0 NOT NULL,
    saldo_cuenta numeric(8,2) DEFAULT NULL::numeric,
    persona_id_dual integer,
    tasa_cambio numeric(8,2) DEFAULT 1.00 NOT NULL,
    fecha_pago date NOT NULL,
    factura_nro character varying(40) NOT NULL,
    modo_pago character varying(40) NOT NULL,
    sucursal_id integer NOT NULL,
    user_id integer NOT NULL,
    comentarios text
);


ALTER TABLE public.pagos OWNER TO buenosai_lvstudi;

--
-- Name: pagos_parciales_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.pagos_parciales_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagos_parciales_seq OWNER TO buenosai_lvstudi;

--
-- Name: pagos_parciales; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.pagos_parciales (
    id integer DEFAULT nextval('public.pagos_parciales_seq'::regclass) NOT NULL,
    cuota_id integer NOT NULL,
    cuota_id_dual integer NOT NULL,
    monto_pago numeric(8,2) NOT NULL,
    moneda_id integer NOT NULL,
    tasa_cambio numeric(8,2) DEFAULT 1.00 NOT NULL,
    pago_id integer NOT NULL
);


ALTER TABLE public.pagos_parciales OWNER TO buenosai_lvstudi;

--
-- Name: perfil_profesores_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.perfil_profesores_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfil_profesores_seq OWNER TO buenosai_lvstudi;

--
-- Name: perfil_profesores; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.perfil_profesores (
    id integer DEFAULT nextval('public.perfil_profesores_seq'::regclass) NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.perfil_profesores OWNER TO buenosai_lvstudi;

--
-- Name: persona_bajas_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.persona_bajas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_bajas_seq OWNER TO buenosai_lvstudi;

--
-- Name: persona_bajas; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.persona_bajas (
    id integer DEFAULT nextval('public.persona_bajas_seq'::regclass) NOT NULL,
    persona_id integer NOT NULL,
    usuario_id_baja integer NOT NULL,
    fecha_baja date NOT NULL,
    fecha_retorno date NOT NULL,
    temporal integer NOT NULL,
    motivo_id integer,
    motivo_otro text
);


ALTER TABLE public.persona_bajas OWNER TO buenosai_lvstudi;

--
-- Name: personas_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.personas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_seq OWNER TO buenosai_lvstudi;

--
-- Name: personas; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.personas (
    id integer DEFAULT nextval('public.personas_seq'::regclass) NOT NULL,
    estado_id integer NOT NULL,
    alumno_id integer,
    idioma_nativo_id integer,
    nacionalidad_id integer,
    email character varying(100) DEFAULT NULL::character varying,
    direccion character varying(100) DEFAULT NULL::character varying,
    telefono character varying(50) DEFAULT NULL::character varying,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    fecha_nacimiento date,
    pasaporte character varying(50) DEFAULT NULL::character varying,
    ocupacion character varying(50) DEFAULT NULL::character varying,
    facebook character varying(50) DEFAULT NULL::character varying,
    skype character varying(50) DEFAULT NULL::character varying,
    como_supo_id integer,
    como_supo_otros character varying(50) DEFAULT NULL::character varying,
    tiempo_clases character varying(40) DEFAULT NULL::character varying,
    motivo_estudio text,
    comentarios text,
    hizo_test_nivel character varying(1) DEFAULT 'N'::character varying,
    nivel_id integer,
    nivel_supuesto_estudiante_id integer,
    nivel_resultado_test_id integer,
    nombre_tutor character varying(40) DEFAULT NULL::character varying,
    telefono_tutor character varying(40) DEFAULT NULL::character varying,
    vinculo character varying(40) DEFAULT NULL::character varying,
    idioma_estudiar_id integer,
    donde_estabas text,
    picked_up_airport character varying(4) DEFAULT NULL::character varying,
    accomodation_services character varying(4) DEFAULT NULL::character varying,
    dropped_off_airport character varying(4) DEFAULT NULL::character varying,
    agree integer,
    baja integer DEFAULT 0 NOT NULL,
    baja_id integer,
    fecha_baja date,
    temporal integer,
    fecha_retorno date,
    motivo_id integer,
    motivo_otro text,
    usuario_id_baja integer,
    despedida_enviada integer DEFAULT 1,
    saldo_cuenta numeric(8,2) DEFAULT 0.00 NOT NULL,
    empleado integer DEFAULT 0 NOT NULL,
    motivo_empleado text,
    created timestamp with time zone DEFAULT now(),
    novedades boolean DEFAULT false NOT NULL,
    modified timestamp with time zone
);


ALTER TABLE public.personas OWNER TO buenosai_lvstudi;

--
-- Name: personas_aud; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.personas_aud (
    id integer NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    apellido character varying(255),
    como_supo_otros character varying(255),
    direccion character varying(255),
    email character varying(255),
    facebook character varying(255),
    fecha_nacimiento timestamp without time zone,
    hizo_test_nivel character varying(255),
    motivo_estudio character varying(255),
    nombre character varying(255),
    nombre_tutor character varying(255),
    novedades boolean,
    ocupacion character varying(255),
    pasaporte character varying(255),
    skype character varying(255),
    telefono character varying(255),
    telefono_tutor character varying(255),
    tiempo_clases character varying(255),
    vinculo character varying(255),
    como_supo_id bigint,
    estado_id integer,
    idioma_estudiar_id integer,
    idioma_nativo_id bigint,
    nacionalidad_id bigint,
    nivel_id integer,
    nivel_supuesto_estudiante_id integer,
    created timestamp with time zone,
    modified timestamp with time zone,
    baja integer DEFAULT 0 NOT NULL,
    fecha_baja timestamp with time zone
);


ALTER TABLE public.personas_aud OWNER TO buenosai_lvstudi;

--
-- Name: profesor_idiomas_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.profesor_idiomas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profesor_idiomas_seq OWNER TO buenosai_lvstudi;

--
-- Name: profesor_idiomas; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.profesor_idiomas (
    id integer DEFAULT nextval('public.profesor_idiomas_seq'::regclass) NOT NULL,
    profesor_id integer NOT NULL,
    idioma_estudiar_id integer NOT NULL
);


ALTER TABLE public.profesor_idiomas OWNER TO buenosai_lvstudi;

--
-- Name: profesores_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.profesores_seq
    START WITH 271
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profesores_seq OWNER TO buenosai_lvstudi;

--
-- Name: profesores; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.profesores (
    id integer DEFAULT nextval('public.profesores_seq'::regclass) NOT NULL,
    nombre character varying(100) DEFAULT NULL::character varying,
    nacionalidad_id integer,
    idioma_nativo_id integer,
    idioma_estudiar_id integer DEFAULT 0 NOT NULL,
    nivel_id integer,
    perfil_profesor_id integer DEFAULT 1 NOT NULL,
    horario_empleado_actual integer,
    fecha_nacimiento date,
    email character varying(100) DEFAULT NULL::character varying,
    email_otro character varying(100) NOT NULL,
    celular character varying(100) DEFAULT NULL::character varying,
    fecha_comienzo date,
    disponibilidad character varying(100) DEFAULT NULL::character varying,
    anos_experiencia character varying(100) DEFAULT NULL::character varying,
    comentarios text,
    facebook character varying(100) NOT NULL,
    telefono_fijo character varying(30) DEFAULT NULL::character varying,
    resume character varying(255) DEFAULT NULL::character varying,
    barrio character varying(30) DEFAULT NULL::character varying,
    titulo_universitario character varying(60) DEFAULT NULL::character varying,
    universidad character varying(60) DEFAULT NULL::character varying,
    tefl integer,
    tefl_emisor character varying(60) DEFAULT NULL::character varying,
    detalles_experiencia text,
    gusto_profesor text,
    edades character varying(60) DEFAULT NULL::character varying,
    experiencia_clases text,
    fecha_llegada_ba character varying(50) DEFAULT NULL::character varying,
    fecha_partida_ba character varying(50) DEFAULT NULL::character varying,
    personalidad text,
    apariencia character varying(60) DEFAULT NULL::character varying,
    impresion character varying(60) DEFAULT NULL::character varying,
    trabajo_flores character varying(60) DEFAULT NULL::character varying,
    sexo integer,
    salario_esperado character varying(60) DEFAULT NULL::character varying,
    salario_empleado numeric(8,2) DEFAULT NULL::numeric,
    accent_id integer,
    speech_id integer,
    interes_gramatica character varying(60) DEFAULT NULL::character varying,
    dias_ocupados text,
    por_que_ba text,
    otros_lugares text,
    direccion character varying(60) DEFAULT NULL::character varying,
    mas text,
    otros_comentarios text,
    estilo_habla_id integer,
    reunion_orientacion character varying(60) DEFAULT NULL::character varying,
    monotributista integer,
    photo character varying(255) DEFAULT '""'::character varying,
    photo_dir character varying(255) DEFAULT '""'::character varying,
    biografia text,
    deshabilitado integer DEFAULT 0,
    created timestamp with time zone NOT NULL,
    fecha_baja date,
    idiomanativo bigint
);


ALTER TABLE public.profesores OWNER TO buenosai_lvstudi;

--
-- Name: promocion_estudiantes_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.promocion_estudiantes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promocion_estudiantes_seq OWNER TO buenosai_lvstudi;

--
-- Name: promocion_estudiantes; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.promocion_estudiantes (
    id integer DEFAULT nextval('public.promocion_estudiantes_seq'::regclass) NOT NULL,
    inscripcion_id integer NOT NULL,
    monto_descuento numeric(8,2) NOT NULL,
    moneda_descuento_id integer NOT NULL
);


ALTER TABLE public.promocion_estudiantes OWNER TO buenosai_lvstudi;

--
-- Name: promociones_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.promociones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promociones_seq OWNER TO buenosai_lvstudi;

--
-- Name: promociones; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.promociones (
    id integer DEFAULT nextval('public.promociones_seq'::regclass) NOT NULL,
    descripcion character varying(50) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    monto_descuento numeric(8,2) NOT NULL
);


ALTER TABLE public.promociones OWNER TO buenosai_lvstudi;

--
-- Name: revinfo; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--
create table REVINFO (
        REV int4 not null,
        REVTSTMP int8,
        primary key (REV)
    );

ALTER TABLE public.revinfo OWNER TO buenosai_lvstudi;

--
-- Name: speeches_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.speeches_seq
    START WITH 6
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.speeches_seq OWNER TO buenosai_lvstudi;

--
-- Name: speeches; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.speeches (
    id integer DEFAULT nextval('public.speeches_seq'::regclass) NOT NULL,
    descripcion character varying(40) NOT NULL
);


ALTER TABLE public.speeches OWNER TO buenosai_lvstudi;

--
-- Name: sucursales_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.sucursales_seq
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sucursales_seq OWNER TO buenosai_lvstudi;

--
-- Name: sucursales; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.sucursales (
    id integer DEFAULT nextval('public.sucursales_seq'::regclass) NOT NULL,
    nombre character varying(50) NOT NULL,
    nombre_ingles character varying(40) NOT NULL,
    abreviatura character varying(5) DEFAULT NULL::character varying
);


ALTER TABLE public.sucursales OWNER TO buenosai_lvstudi;

--
-- Name: tipo_cancelaciones; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.tipo_cancelaciones (
    id integer DEFAULT nextval('public.tipo_cancelaciones'::regclass) NOT NULL,
    descripcion character varying(40) NOT NULL,
    codigo character varying(4) NOT NULL
);


ALTER TABLE public.tipo_cancelaciones OWNER TO buenosai_lvstudi;

--
-- Name: tipo_cancelaciones_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.tipo_cancelaciones_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_cancelaciones_seq OWNER TO buenosai_lvstudi;

--
-- Name: tipo_cursos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.tipo_cursos_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_cursos_seq OWNER TO buenosai_lvstudi;

--
-- Name: tipo_cursos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.tipo_cursos (
    id integer DEFAULT nextval('public.tipo_cursos_seq'::regclass) NOT NULL,
    descripcion character varying(30) NOT NULL,
    abreviatura character varying(4) DEFAULT NULL::character varying,
    cant_minima_estudiantes integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.tipo_cursos OWNER TO buenosai_lvstudi;

--
-- Name: user_accesos_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.user_accesos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_accesos_seq OWNER TO buenosai_lvstudi;

--
-- Name: user_accesos; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.user_accesos (
    id integer DEFAULT nextval('public.user_accesos_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    fecha_hora_evento timestamp with time zone NOT NULL,
    evento character varying(30) NOT NULL,
    ip character varying(30) NOT NULL,
    user_agent character varying(150) NOT NULL
);


ALTER TABLE public.user_accesos OWNER TO buenosai_lvstudi;

--
-- Name: users_seq; Type: SEQUENCE; Schema: public; Owner: buenosai_lvstudi
--

CREATE SEQUENCE public.users_seq
    START WITH 30
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_seq OWNER TO buenosai_lvstudi;

--
-- Name: users; Type: TABLE; Schema: public; Owner: buenosai_lvstudi
--

CREATE TABLE public.users (
    id integer DEFAULT nextval('public.users_seq'::regclass) NOT NULL,
    username character varying(50) DEFAULT NULL::character varying,
    password character varying(64) DEFAULT NULL::character varying,
    role character varying(20) DEFAULT NULL::character varying,
    group_id integer NOT NULL,
    email character varying(50) DEFAULT ''::character varying,
    created timestamp with time zone,
    modified timestamp with time zone,
    enabled integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.users OWNER TO buenosai_lvstudi;

--
-- Data for Name: accents; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.accents (id, descripcion) FROM stdin;
1	British
2	American
\.


--
-- Name: accents_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.accents_seq', 2, true);


--
-- Data for Name: acos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.acos (id, parent_id, model, foreign_key, alias, lft, rght) FROM stdin;
1	\N	\N	\N	controllers	1	874
2	1	\N	\N	Configuracion	2	11
3	2	\N	\N	index	3	4
4	2	\N	\N	feriados	5	6
5	2	\N	\N	borrarFeriado	7	8
6	1	\N	\N	Cursos	12	131
7	6	\N	\N	index	13	14
8	6	\N	\N	search	15	16
9	6	\N	\N	readAll	17	18
10	6	\N	\N	add	19	20
11	6	\N	\N	edit	21	22
12	6	\N	\N	view	23	24
13	6	\N	\N	leer_clases	25	26
14	6	\N	\N	editar_clase	27	28
15	6	\N	\N	crear_cronograma	29	30
16	6	\N	\N	agregar_clase	31	32
17	6	\N	\N	borrar_clase	33	34
18	6	\N	\N	cargarDesplegables	35	36
19	1	\N	\N	Groups	132	153
20	19	\N	\N	index	133	134
21	19	\N	\N	view	135	136
22	19	\N	\N	add	137	138
23	19	\N	\N	edit	139	140
24	19	\N	\N	delete	141	142
25	19	\N	\N	admin_index	143	144
26	19	\N	\N	admin_view	145	146
27	19	\N	\N	admin_add	147	148
28	19	\N	\N	admin_edit	149	150
29	19	\N	\N	admin_delete	151	152
30	1	\N	\N	Inscripciones	154	265
31	30	\N	\N	index	155	156
32	30	\N	\N	inscribir	157	158
33	30	\N	\N	imprimirComprobante	159	160
34	30	\N	\N	detalles_inscripcion_individual	161	162
35	30	\N	\N	imprimirComprobanteIndividual	163	164
36	30	\N	\N	cargarDesplegables	165	166
37	30	\N	\N	listar_cursos	167	168
38	30	\N	\N	listar_inscriptos	169	170
39	30	\N	\N	listar_inscriptos_individuales	171	172
40	30	\N	\N	confirmar_inscripcion	173	174
41	30	\N	\N	confirmar_inscripcion_individual	175	176
42	30	\N	\N	historial_inscripciones	177	178
43	30	\N	\N	test_mail	179	180
44	1	\N	\N	Menu	266	269
45	44	\N	\N	index	267	268
46	1	\N	\N	Pages	270	273
47	46	\N	\N	display	271	272
48	1	\N	\N	Pagos	274	329
49	48	\N	\N	index	275	276
50	48	\N	\N	alumnosDeudores	277	278
51	48	\N	\N	confirmarPago	279	280
52	48	\N	\N	mostrarPagosConfirmadosTodos	281	282
53	48	\N	\N	mostrarPagosRealizados	283	284
54	48	\N	\N	mostrarPagosPendientes	285	286
55	1	\N	\N	Personas	330	397
56	55	\N	\N	index	331	332
57	55	\N	\N	indexAlumnos	333	334
58	55	\N	\N	search	335	336
59	55	\N	\N	searchAlumno	337	338
60	55	\N	\N	readAlumnos	339	340
61	55	\N	\N	readAll	341	342
62	55	\N	\N	view	343	344
63	55	\N	\N	viewAlumno	345	346
64	55	\N	\N	add	347	348
65	55	\N	\N	edit	349	350
66	1	\N	\N	Users	398	427
67	66	\N	\N	index	399	400
68	66	\N	\N	view	401	402
69	66	\N	\N	add	403	404
70	66	\N	\N	edit	405	406
71	66	\N	\N	delete	407	408
72	66	\N	\N	login	409	410
73	66	\N	\N	logout	411	412
74	1	\N	\N	AclExtras	428	429
75	1	\N	\N	Acl	430	475
76	75	\N	\N	Acos	431	438
77	76	\N	\N	admin_index	432	433
78	76	\N	\N	admin_empty_acos	434	435
79	76	\N	\N	admin_build_acl	436	437
80	75	\N	\N	Aros	439	474
81	80	\N	\N	admin_index	440	441
82	80	\N	\N	admin_check	442	443
83	80	\N	\N	admin_users	444	445
84	80	\N	\N	admin_update_user_role	446	447
85	80	\N	\N	admin_ajax_role_permissions	448	449
86	80	\N	\N	admin_role_permissions	450	451
87	80	\N	\N	admin_user_permissions	452	453
88	80	\N	\N	admin_empty_permissions	454	455
89	80	\N	\N	admin_clear_user_specific_permissions	456	457
90	80	\N	\N	admin_grant_all_controllers	458	459
91	80	\N	\N	admin_deny_all_controllers	460	461
92	80	\N	\N	admin_get_role_controller_permission	462	463
93	80	\N	\N	admin_grant_role_permission	464	465
94	80	\N	\N	admin_deny_role_permission	466	467
95	80	\N	\N	admin_get_user_controller_permission	468	469
96	80	\N	\N	admin_grant_user_permission	470	471
97	80	\N	\N	admin_deny_user_permission	472	473
98	66	\N	\N	admin_login	413	414
99	66	\N	\N	admin_logout	415	416
100	48	\N	\N	verDetalles	287	288
101	66	\N	\N	cargarGrupos	417	418
102	6	\N	\N	crear_clase	37	38
103	6	\N	\N	borrar_clase_calendario	39	40
104	6	\N	\N	comentarios_clase	41	42
105	30	\N	\N	ver_lista_espera	181	182
106	30	\N	\N	confirmar_inscripcion_lista_espera	183	184
107	48	\N	\N	recibirPago	289	290
108	48	\N	\N	mostrarCuotasPendientes	291	292
109	55	\N	\N	listar_estudiantes_actuales	351	352
110	55	\N	\N	listar_ex_estudiantes	353	354
111	1	\N	\N	Constantes	476	487
112	111	\N	\N	index	477	478
113	111	\N	\N	view	479	480
114	111	\N	\N	add	481	482
115	111	\N	\N	edit	483	484
116	111	\N	\N	delete	485	486
117	6	\N	\N	readAllpaquetes	43	44
118	6	\N	\N	add_paquete	45	46
119	6	\N	\N	cambiar_motivo	47	48
120	6	\N	\N	listar_cursos_sin_profesor	49	50
121	6	\N	\N	mostrar_informe_cursada	51	52
122	30	\N	\N	inscribir_existente	185	186
123	1	\N	\N	Monedas	488	499
124	123	\N	\N	index	489	490
125	123	\N	\N	view	491	492
126	123	\N	\N	add	493	494
127	123	\N	\N	edit	495	496
128	123	\N	\N	delete	497	498
129	1	\N	\N	Nacionalidades	500	511
130	129	\N	\N	index	501	502
131	129	\N	\N	view	503	504
132	129	\N	\N	add	505	506
133	129	\N	\N	edit	507	508
134	129	\N	\N	delete	509	510
135	1	\N	\N	Niveles	512	523
136	135	\N	\N	index	513	514
137	135	\N	\N	view	515	516
138	135	\N	\N	add	517	518
139	135	\N	\N	edit	519	520
140	135	\N	\N	delete	521	522
141	1	\N	\N	Orientaciones	524	535
142	141	\N	\N	index	525	526
143	141	\N	\N	view	527	528
144	141	\N	\N	add	529	530
145	141	\N	\N	edit	531	532
146	141	\N	\N	delete	533	534
147	1	\N	\N	Sucursales	536	547
148	147	\N	\N	index	537	538
149	147	\N	\N	view	539	540
150	147	\N	\N	add	541	542
151	147	\N	\N	edit	543	544
152	147	\N	\N	delete	545	546
153	30	\N	\N	listar_paquetes	187	188
154	6	\N	\N	listar_clases_curso	53	54
155	30	\N	\N	detalles_inscripcion_lista_espera	189	190
156	1	\N	\N	ClaseCursos	548	559
157	156	\N	\N	index	549	550
158	156	\N	\N	view	551	552
159	156	\N	\N	add	553	554
160	156	\N	\N	edit	555	556
161	156	\N	\N	delete	557	558
162	6	\N	\N	edit_paquete	55	56
163	1	\N	\N	IdiomaEstudiares	560	571
164	163	\N	\N	index	561	562
165	163	\N	\N	view	563	564
166	163	\N	\N	add	565	566
167	163	\N	\N	edit	567	568
168	163	\N	\N	delete	569	570
169	1	\N	\N	IdiomaNativos	572	583
170	169	\N	\N	index	573	574
171	169	\N	\N	view	575	576
172	169	\N	\N	add	577	578
173	169	\N	\N	edit	579	580
174	169	\N	\N	delete	581	582
175	30	\N	\N	confirmar_inscripcion_grupal_con_matricula	191	192
176	6	\N	\N	listar_estudiantes	57	58
177	1	\N	\N	Notificaciones	584	597
178	177	\N	\N	index	585	586
179	177	\N	\N	view	587	588
180	177	\N	\N	add	589	590
181	177	\N	\N	edit	591	592
182	177	\N	\N	delete	593	594
183	30	\N	\N	confirmar_borrar_inscripcion	193	194
184	30	\N	\N	confirmar_borrar_insc_individual	195	196
185	30	\N	\N	confirmar_borrar_insc_lista_espera	197	198
186	30	\N	\N	borrar_inscripcion	199	200
187	30	\N	\N	borrar_inscripcion_individual	201	202
188	55	\N	\N	listar_con_datos	355	356
189	6	\N	\N	asignar_profesor	59	60
190	6	\N	\N	agregar_fila_profesor	61	62
191	6	\N	\N	agregar_columna_profesor	63	64
192	30	\N	\N	editar_inscripcion_grupal	203	204
193	30	\N	\N	editar_inscripcion_individual	205	206
194	48	\N	\N	editar_cuota	293	294
195	48	\N	\N	anular_pago	295	296
196	55	\N	\N	listar_excel_alumnos	357	358
197	1	\N	\N	Profesores	598	659
198	197	\N	\N	index	599	600
199	197	\N	\N	view	601	602
200	197	\N	\N	add	603	604
201	197	\N	\N	edit	605	606
202	197	\N	\N	baja	607	608
203	30	\N	\N	cambiar_estudiante_de_curso	207	208
204	6	\N	\N	read_vigentes	65	66
205	6	\N	\N	cancelar_clase	67	68
206	48	\N	\N	ver_cuota	297	298
207	48	\N	\N	mostrar_historial_cambios	299	300
208	6	\N	\N	buscar_dias_clase	69	70
209	197	\N	\N	listar_excel	609	610
210	30	\N	\N	resumen_inscripciones_dia	209	210
211	48	\N	\N	listados	301	302
212	48	\N	\N	pagos_hoy	303	304
213	48	\N	\N	pagos_siete_dias	305	306
214	48	\N	\N	pagos_treinta_dias	307	308
215	48	\N	\N	pagos_fechas	309	310
216	6	\N	\N	mostrar_cronograma	71	72
217	6	\N	\N	cronograma_completo_sede	73	74
218	6	\N	\N	leer_clases_sede	75	76
219	6	\N	\N	mostrar_informe_cursada_completo	77	78
220	30	\N	\N	baja	211	212
221	1	\N	\N	Motivos	660	671
222	221	\N	\N	index	661	662
223	221	\N	\N	view	663	664
224	221	\N	\N	add	665	666
225	221	\N	\N	edit	667	668
226	221	\N	\N	delete	669	670
227	55	\N	\N	listar_bajas	359	360
228	66	\N	\N	login_google	419	420
229	66	\N	\N	yadis	421	422
230	197	\N	\N	admnistrar	611	612
231	197	\N	\N	mostrar_calendario	613	614
232	197	\N	\N	listar_clases_profesor	615	616
233	197	\N	\N	administrar	617	618
234	1	\N	\N	Cambios	672	679
235	234	\N	\N	index	673	674
236	234	\N	\N	cambiar_motivo	675	676
237	1	\N	\N	Clases	680	731
238	237	\N	\N	editar_clase	681	682
239	237	\N	\N	comentarios_clase	683	684
240	237	\N	\N	borrar_clase	685	686
241	237	\N	\N	cancelar_clase	687	688
242	6	\N	\N	modificar_horario	79	80
243	6	\N	\N	forzar_apertura_curso	81	82
244	6	\N	\N	borrar_del_curso	83	84
245	30	\N	\N	extender_cursada	213	214
246	197	\N	\N	administrar_horario_no_disponible	619	620
247	197	\N	\N	borrar_horario_no_disponible	621	622
248	197	\N	\N	agregar_horario_no_disponible	623	624
249	197	\N	\N	mostrar_horarios_ocupados	625	626
250	6	\N	\N	baja_curso	85	86
251	197	\N	\N	agregar_excepcion_no_disponible	627	628
252	6	\N	\N	listar_cursos_lista_espera	87	88
253	6	\N	\N	mostrar_estado_curso	89	90
254	30	\N	\N	listar_cursos_confirmar	215	216
255	234	\N	\N	view	677	678
256	6	\N	\N	listar_cursos_espera_estudiantes	91	92
257	6	\N	\N	alargar_cursada	93	94
258	55	\N	\N	listar_primer_dia	361	362
259	6	\N	\N	listar_cursos_baja	95	96
260	55	\N	\N	listar_estudiantes_dejaron_cursos	363	364
261	6	\N	\N	planilla_global	97	98
262	237	\N	\N	agregar_clase	689	690
263	237	\N	\N	crear_clase	691	692
264	237	\N	\N	tomar_lista	693	694
265	237	\N	\N	listar_asistencias	695	696
266	237	\N	\N	mostrar_planilla_docente	697	698
267	237	\N	\N	mostrar_datos_clase	699	700
268	237	\N	\N	leer_clases_sede	701	702
269	237	\N	\N	leer_clases	703	704
270	48	\N	\N	notificar_deudores	311	312
271	237	\N	\N	listado_recup_pendientes	705	706
272	66	\N	\N	login_facebook	423	424
273	197	\N	\N	reportar_ausencia	629	630
274	237	\N	\N	cancelar_clase_profesor	707	708
275	237	\N	\N	buscar_dias_clase_profesor	709	710
276	30	\N	\N	listados_inscripciones	217	218
277	30	\N	\N	inscripciones_siete_dias	219	220
278	30	\N	\N	inscripciones_treinta_dias	221	222
279	30	\N	\N	inscripciones_fecha	223	224
280	2	\N	\N	agregarFeriado	9	10
281	48	\N	\N	agregar_cuota	313	314
282	30	\N	\N	revertir_baja	225	226
283	177	\N	\N	listar_enviadas	595	596
284	48	\N	\N	alumnos_pago_a_cuenta	315	316
285	55	\N	\N	retorno_bajas_temporales	365	366
286	55	\N	\N	pregunta_estudiante_si_vuelve	367	368
287	48	\N	\N	pagos_inscriptos_hoy	317	318
288	48	\N	\N	pagos_inscriptos_siete_dias	319	320
289	48	\N	\N	pagos_inscriptos_treinta_dias	321	322
290	6	\N	\N	planilla_global_profesores	99	100
291	1	\N	\N	Informes	732	749
292	291	\N	\N	index	733	734
293	291	\N	\N	estadisticas_estudiantes	735	736
294	291	\N	\N	estadisticas_profesores	737	738
295	291	\N	\N	estadisticas_cursos	739	740
296	6	\N	\N	completar_datos_paquete	101	102
297	1	\N	\N	CargaHorarias	750	763
298	297	\N	\N	listar_carga_horaria	751	752
299	297	\N	\N	index	753	754
300	297	\N	\N	view	755	756
301	297	\N	\N	add	757	758
302	297	\N	\N	edit	759	760
303	297	\N	\N	delete	761	762
304	237	\N	\N	no_recuperar	711	712
305	6	\N	\N	view_ajax	103	104
306	6	\N	\N	agregar_modalidad	105	106
307	6	\N	\N	agregar_extension	107	108
308	6	\N	\N	quitar_extension	109	110
309	30	\N	\N	captcha	227	228
310	30	\N	\N	calcular_fechas_cursada	229	230
311	30	\N	\N	agregar_modalidad_extension	231	232
312	30	\N	\N	quitar_modalidad_extension	233	234
313	1	\N	\N	ModalidadCursos	764	785
314	313	\N	\N	listar_modalidades_curso	765	766
315	313	\N	\N	listar_modalidades_para_confirmar	767	768
316	313	\N	\N	index	769	770
317	313	\N	\N	view	771	772
318	313	\N	\N	add	773	774
319	313	\N	\N	edit	775	776
320	313	\N	\N	delete	777	778
321	197	\N	\N	listar_ex_profesores	631	632
322	30	\N	\N	aceptar_inscripcion	235	236
323	30	\N	\N	pre_inscribir	237	238
324	30	\N	\N	confirmar_pre_inscripcion_grupal	239	240
325	55	\N	\N	listar_estudiantes_descuento_empleados	369	370
326	30	\N	\N	modificar_inscripcion	241	242
327	237	\N	\N	borrar_cancelacion_estudiante	713	714
328	237	\N	\N	confirmar_cancelacion_estudiante	715	716
329	55	\N	\N	listar_estudiantes_sin_cursar	371	372
330	197	\N	\N	borrar_todos_horarios	633	634
331	55	\N	\N	registrar_motivo	373	374
332	6	\N	\N	planilla_global_estudiantes	111	112
333	48	\N	\N	listar_clases_abarcadas_cuota	323	324
334	48	\N	\N	listado_estudiantes_matricula	325	326
335	55	\N	\N	listar_estudiantes_pendientes	375	376
336	237	\N	\N	listar_clases_recuperadas	717	718
337	30	\N	\N	confirmar_pre_inscripcion_individual	243	244
338	30	\N	\N	borrar_baja	245	246
339	1	\N	\N	HonorarioProfesores	786	821
340	339	\N	\N	index	787	788
341	339	\N	\N	view	789	790
342	339	\N	\N	add	791	792
343	339	\N	\N	edit	793	794
344	339	\N	\N	delete	795	796
345	339	\N	\N	buscar_dato_honorario	797	798
346	30	\N	\N	inscribir_extra_existente	247	248
347	339	\N	\N	listar_honorarios_cursos	799	800
348	339	\N	\N	add_honorario_profesor	801	802
349	339	\N	\N	edit_honorario	803	804
350	339	\N	\N	buscar_cursos_del_profesor	805	806
351	55	\N	\N	completar_datos_pre_inscripcion	377	378
352	197	\N	\N	search	635	636
353	55	\N	\N	comentarios	379	380
354	6	\N	\N	revertir_baja_curso	113	114
355	6	\N	\N	notificar_profesores_sede	115	116
356	30	\N	\N	listar_inscripciones_borradas	249	250
357	30	\N	\N	enviar_form_datos_inscripcion	251	252
358	30	\N	\N	retornar	253	254
359	30	\N	\N	ver_curso_en_inscripcion_ajax	255	256
360	48	\N	\N	buscar_comentarios_pago	327	328
361	1	\N	\N	Extras	822	833
362	361	\N	\N	index	823	824
363	361	\N	\N	view	825	826
364	361	\N	\N	add	827	828
365	361	\N	\N	edit	829	830
366	361	\N	\N	delete	831	832
367	1	\N	\N	ModalidadPagos	834	845
368	367	\N	\N	index	835	836
369	367	\N	\N	view	837	838
370	367	\N	\N	add	839	840
371	367	\N	\N	edit	841	842
372	367	\N	\N	delete	843	844
373	6	\N	\N	copiar	117	118
374	197	\N	\N	add_interview	637	638
375	237	\N	\N	cancelar_clase_estudiante	719	720
376	237	\N	\N	mostrar_cancelaciones_estudiante	721	722
377	237	\N	\N	des_cancelar	723	724
378	30	\N	\N	buscar_datos_inscripcion	257	258
379	55	\N	\N	grabar_fecha_baja	381	382
380	55	\N	\N	grabar_fecha_retorno	383	384
381	197	\N	\N	listar_profesores_activos_clases_recientes	639	640
382	1	\N	\N	UserAccesos	846	849
383	382	\N	\N	index	847	848
384	55	\N	\N	estudiantes_comienzan_semana_proxima	385	386
385	6	\N	\N	fin_curso	119	120
386	55	\N	\N	buscar_email	387	388
387	291	\N	\N	informe_como_te_enteraste	741	742
388	291	\N	\N	leer_datos_grafico_como_te_enteraste	743	744
389	291	\N	\N	detalle_otros	745	746
390	55	\N	\N	nuevo_comentario	389	390
391	55	\N	\N	listar_comentarios	391	392
392	237	\N	\N	listar_clases_no_vistas_profesores	725	726
393	6	\N	\N	listar_clases_no_vistas_profesores	121	122
394	30	\N	\N	buscar_datos_modalidad	259	260
395	30	\N	\N	cambiar_modalidad	261	262
396	197	\N	\N	nuevo_comentario	641	642
397	197	\N	\N	listar_comentarios	643	644
398	1	\N	\N	Devoluciones	850	853
399	398	\N	\N	ingresar_devolucion	851	852
400	30	\N	\N	listado_comisiones	263	264
401	339	\N	\N	buscar_honorarios_asignados	807	808
402	339	\N	\N	buscar_cursos_afectados	809	810
403	339	\N	\N	ver_cambios	811	812
404	339	\N	\N	listarHonorarios	813	814
405	339	\N	\N	asociar_este_honorario	815	816
406	339	\N	\N	asociar_honorario_profesor	817	818
407	339	\N	\N	view_honorario	819	820
408	1	\N	\N	ModalidadTraducciones	854	865
409	408	\N	\N	index	855	856
410	408	\N	\N	view	857	858
411	408	\N	\N	add	859	860
412	408	\N	\N	edit	861	862
413	408	\N	\N	delete	863	864
414	197	\N	\N	agregar_horario_profesor_calendario	645	646
415	197	\N	\N	borrar_horario_profesor_calendario	647	648
416	197	\N	\N	editar_horario_profesor_calendario	649	650
417	197	\N	\N	leer_horario_profesor_empleado	651	652
418	197	\N	\N	reportar_cancelacion_estudiante	653	654
419	197	\N	\N	listar_estudiantes_curso	655	656
420	197	\N	\N	informe_sueldos	657	658
421	1	\N	\N	Traducciones	866	873
422	421	\N	\N	index	867	868
423	421	\N	\N	add	869	870
424	421	\N	\N	edit	871	872
425	66	\N	\N	asociar_facebook_profesor	425	426
426	55	\N	\N	listar_comentarios_fecha	393	394
427	55	\N	\N	ultimo_comentario	395	396
428	6	\N	\N	ultimo_comentario	123	124
429	6	\N	\N	nuevo_comentario	125	126
430	6	\N	\N	listar_comentarios	127	128
431	237	\N	\N	leer_clases_profesor	727	728
432	313	\N	\N	editar_descripcion_larga	779	780
433	313	\N	\N	ver_descripcion_larga	781	782
434	6	\N	\N	borrar_curso	129	130
435	291	\N	\N	modos_cursada	747	748
436	237	\N	\N	agregar_clase_recuperacion	729	730
437	313	\N	\N	listar_cursos_asociados	783	784
\.


--
-- Name: acos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.acos_seq', 438, false);


--
-- Data for Name: adjuntos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.adjuntos (id, model, foreign_key, name, attachment, dir, type, size, active) FROM stdin;
\.


--
-- Name: adjuntos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.adjuntos_seq', 1, false);


--
-- Data for Name: aros; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.aros (id, parent_id, model, foreign_key, alias, lft, rght) FROM stdin;
1	\N	Group	1	\N	1	14
2	\N	Group	2	\N	15	24
3	\N	Group	3	\N	25	26
4	1	User	1	\N	2	3
5	1	User	2	\N	4	5
29	1	User	23	\N	8	9
15	\N	Group	5	\N	39	40
11	2	User	8	\N	16	17
12	1	User	9	\N	6	7
13	\N	Group	4	\N	27	38
14	2	User	10	\N	18	19
16	13	User	11	\N	28	29
17	2	User	11	\N	20	21
34	13	User	28	\N	34	35
19	13	User	13	\N	30	31
30	1	User	24	\N	10	11
35	13	User	29	\N	36	37
31	13	User	25	\N	32	33
28	2	User	22	\N	22	23
32	1	User	26	\N	12	13
\.


--
-- Data for Name: aros_acos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.aros_acos (id, aro_id, aco_id, _create, _read, _update, _delete) FROM stdin;
1	1	1	1	1	1	1
2	2	1	-1	-1	-1	-1
3	2	30	1	1	1	1
4	2	6	1	1	1	1
5	2	48	1	1	1	1
6	2	55	1	1	1	1
7	3	1	-1	-1	-1	-1
8	3	30	1	1	1	1
9	3	9	1	1	1	1
10	3	48	1	1	1	1
11	3	55	1	1	1	1
12	4	1	1	1	1	1
13	3	8	1	1	1	1
14	3	12	1	1	1	1
15	2	45	1	1	1	1
16	3	45	1	1	1	1
17	3	13	1	1	1	1
18	5	45	1	1	1	1
22	13	5	1	1	1	1
20	2	47	1	1	1	1
21	3	47	1	1	1	1
23	13	4	1	1	1	1
24	13	3	1	1	1	1
25	13	114	1	1	1	1
26	13	116	1	1	1	1
27	13	115	1	1	1	1
28	13	112	1	1	1	1
29	13	113	1	1	1	1
30	13	10	1	1	1	1
31	13	118	1	1	1	1
32	13	16	1	1	1	1
33	13	191	1	1	1	1
34	13	190	1	1	1	1
35	13	189	1	1	1	1
36	13	17	1	1	1	1
37	13	119	1	1	1	1
38	13	104	1	1	1	1
39	13	102	1	1	1	1
40	13	15	1	1	1	1
41	13	11	1	1	1	1
42	13	162	1	1	1	1
43	13	14	1	1	1	1
44	13	7	1	1	1	1
45	13	13	1	1	1	1
46	13	154	1	1	1	1
47	13	120	1	1	1	1
48	13	176	1	1	1	1
49	13	121	1	1	1	1
50	13	9	1	1	1	1
51	13	117	1	1	1	1
52	13	8	1	1	1	1
53	13	12	1	1	1	1
54	13	166	1	1	1	1
55	13	168	1	1	1	1
56	13	167	1	1	1	1
57	13	164	1	1	1	1
58	13	165	1	1	1	1
59	13	172	1	1	1	1
60	13	174	1	1	1	1
61	13	173	1	1	1	1
62	13	170	1	1	1	1
63	13	171	1	1	1	1
64	13	186	1	1	1	1
65	13	187	1	1	1	1
66	13	36	1	1	1	1
67	13	184	1	1	1	1
68	13	185	1	1	1	1
69	13	183	1	1	1	1
70	13	40	1	1	1	1
71	13	175	1	1	1	1
72	13	41	1	1	1	1
73	13	106	1	1	1	1
74	13	34	1	1	1	1
75	13	155	1	1	1	1
76	13	192	1	1	1	1
77	13	193	1	1	1	1
78	13	42	1	1	1	1
79	13	33	1	1	1	1
80	13	35	1	1	1	1
81	13	31	1	1	1	1
82	13	32	1	1	1	1
83	13	122	1	1	1	1
84	13	37	1	1	1	1
85	13	38	1	1	1	1
86	13	39	1	1	1	1
87	13	153	1	1	1	1
88	13	105	1	1	1	1
89	13	45	1	1	1	1
90	13	126	1	1	1	1
91	13	128	1	1	1	1
92	13	127	1	1	1	1
93	13	124	1	1	1	1
94	13	125	1	1	1	1
95	13	132	1	1	1	1
96	13	134	1	1	1	1
97	13	133	1	1	1	1
98	13	130	1	1	1	1
99	13	131	1	1	1	1
100	13	138	1	1	1	1
101	13	140	1	1	1	1
102	13	139	1	1	1	1
103	13	136	1	1	1	1
104	13	137	1	1	1	1
105	2	186	-1	-1	-1	-1
106	3	186	-1	-1	-1	-1
107	2	187	-1	-1	-1	-1
108	3	187	-1	-1	-1	-1
109	13	179	1	1	1	1
110	2	179	1	1	1	1
111	3	179	1	1	1	1
112	13	143	1	1	1	1
113	13	50	1	1	1	1
114	13	195	1	1	1	1
115	13	194	1	1	1	1
116	13	49	1	1	1	1
117	2	194	-1	-1	-1	-1
118	3	194	-1	-1	-1	-1
119	2	195	-1	-1	-1	-1
120	3	195	-1	-1	-1	-1
121	13	108	1	1	1	1
122	13	52	1	1	1	1
123	13	53	1	1	1	1
124	13	107	1	1	1	1
125	13	100	1	1	1	1
126	13	64	1	1	1	1
127	13	65	1	1	1	1
128	13	56	1	1	1	1
129	13	57	1	1	1	1
130	13	188	1	1	1	1
131	13	109	1	1	1	1
132	13	110	1	1	1	1
133	13	196	1	1	1	1
134	13	61	1	1	1	1
135	13	60	1	1	1	1
136	13	58	1	1	1	1
137	13	59	1	1	1	1
138	13	62	1	1	1	1
139	13	63	1	1	1	1
140	13	200	1	1	1	1
141	13	202	1	1	1	1
142	13	201	1	1	1	1
143	13	198	1	1	1	1
144	13	199	1	1	1	1
145	13	150	1	1	1	1
146	13	152	1	1	1	1
147	13	151	1	1	1	1
148	13	148	1	1	1	1
149	13	149	1	1	1	1
150	2	200	1	1	1	1
151	2	202	1	1	1	1
152	2	201	1	1	1	1
153	2	198	1	1	1	1
154	2	199	1	1	1	1
155	13	47	1	1	1	1
157	2	184	-1	-1	-1	-1
156	13	203	1	1	1	1
158	2	185	-1	-1	-1	-1
159	2	183	-1	-1	-1	-1
160	3	184	-1	-1	-1	-1
161	3	185	-1	-1	-1	-1
162	3	183	-1	-1	-1	-1
163	13	204	1	1	1	1
164	13	208	1	1	1	1
165	13	205	1	1	1	1
166	13	206	1	1	1	1
167	13	209	1	1	1	1
168	13	69	1	1	1	1
169	15	198	1	1	1	1
170	15	45	1	1	1	1
171	15	232	1	1	1	1
172	15	231	1	1	1	1
173	13	211	1	1	1	1
174	2	233	1	1	1	1
175	2	232	1	1	1	1
176	2	209	1	1	1	1
177	2	231	1	1	1	1
178	13	245	1	1	1	1
179	2	239	1	1	1	1
180	2	238	1	1	1	1
181	2	241	1	1	1	1
182	13	241	1	1	1	1
183	13	239	1	1	1	1
184	13	238	1	1	1	1
413	13	419	1	1	1	1
186	13	244	1	1	1	1
187	13	217	1	1	1	1
188	13	243	1	1	1	1
189	13	218	1	1	1	1
190	13	242	1	1	1	1
191	13	216	1	1	1	1
192	13	219	1	1	1	1
227	13	250	1	1	1	1
194	13	220	1	1	1	1
195	13	210	1	1	1	1
196	13	207	1	1	1	1
197	13	215	1	1	1	1
198	13	212	1	1	1	1
199	13	213	1	1	1	1
200	13	214	1	1	1	1
240	13	261	1	1	1	1
263	13	181	1	1	1	1
264	13	178	1	1	1	1
205	2	207	-1	-1	-1	-1
348	13	336	1	1	1	1
225	13	252	1	1	1	1
208	13	233	1	1	1	1
209	13	246	1	1	1	1
210	13	247	1	1	1	1
211	13	232	1	1	1	1
212	13	231	1	1	1	1
213	13	249	1	1	1	1
214	13	248	1	1	1	1
215	2	246	1	1	1	1
216	2	248	1	1	1	1
217	2	247	1	1	1	1
218	2	249	1	1	1	1
219	15	249	1	1	1	1
220	13	227	1	1	1	1
221	13	236	1	1	1	1
222	13	235	1	1	1	1
226	3	252	1	1	1	1
236	13	251	1	1	1	1
229	13	253	1	1	1	1
230	13	254	1	1	1	1
231	13	257	1	1	1	1
232	13	256	1	1	1	1
235	13	258	1	1	1	1
237	2	251	1	1	1	1
238	13	255	1	1	1	1
239	13	259	1	1	1	1
242	13	263	1	1	1	1
243	2	263	1	1	1	1
244	13	269	1	1	1	1
245	13	268	1	1	1	1
246	13	265	1	1	1	1
247	13	267	1	1	1	1
248	13	266	1	1	1	1
249	13	264	1	1	1	1
250	15	264	1	1	1	1
251	15	266	1	1	1	1
252	15	267	1	1	1	1
253	15	265	1	1	1	1
254	2	269	1	1	1	1
255	2	268	1	1	1	1
256	2	265	1	1	1	1
257	2	267	1	1	1	1
258	2	266	1	1	1	1
259	2	264	1	1	1	1
261	13	270	1	1	1	1
262	13	260	1	1	1	1
349	2	336	1	1	1	1
266	13	280	1	1	1	1
267	13	281	1	1	1	1
268	13	275	1	1	1	1
269	2	275	1	1	1	1
270	13	274	1	1	1	1
271	2	274	1	1	1	1
272	13	271	1	1	1	1
273	2	271	1	1	1	1
274	13	279	1	1	1	1
275	13	277	1	1	1	1
276	13	278	1	1	1	1
277	13	282	1	1	1	1
377	13	360	1	1	1	1
279	13	284	1	1	1	1
280	13	283	1	1	1	1
281	13	276	1	1	1	1
282	13	273	1	1	1	1
283	2	273	1	1	1	1
284	15	273	1	1	1	1
285	13	287	1	1	1	1
286	13	288	1	1	1	1
287	13	289	1	1	1	1
288	15	246	1	1	1	1
289	15	251	1	1	1	1
290	15	248	1	1	1	1
291	15	247	1	1	1	1
292	13	290	1	1	1	1
293	13	312	1	1	1	1
294	13	286	1	1	1	1
295	13	285	1	1	1	1
296	13	321	1	1	1	1
297	2	321	1	1	1	1
298	2	315	1	1	1	1
299	13	317	1	1	1	1
300	2	317	1	1	1	1
301	13	315	1	1	1	1
302	13	314	1	1	1	1
303	13	316	1	1	1	1
304	13	319	1	1	1	1
305	13	320	1	1	1	1
306	13	318	1	1	1	1
307	2	314	1	1	1	1
308	2	316	1	1	1	1
309	13	308	1	1	1	1
310	13	306	1	1	1	1
311	13	307	1	1	1	1
312	13	304	1	1	1	1
313	2	304	1	1	1	1
314	2	236	1	1	1	1
315	2	235	1	1	1	1
316	2	255	1	1	1	1
317	13	301	1	1	1	1
318	13	302	1	1	1	1
319	13	299	1	1	1	1
320	13	298	1	1	1	1
321	13	300	1	1	1	1
322	13	305	1	1	1	1
323	3	305	1	1	1	1
324	13	310	1	1	1	1
325	13	309	1	1	1	1
326	13	324	1	1	1	1
327	13	323	1	1	1	1
328	13	67	1	1	1	1
329	13	70	1	1	1	1
330	13	68	1	1	1	1
331	13	322	1	1	1	1
332	13	311	1	1	1	1
333	13	328	1	1	1	1
334	2	328	1	1	1	1
335	13	327	1	1	1	1
336	2	327	1	1	1	1
337	13	326	1	1	1	1
338	13	325	1	1	1	1
339	13	329	1	1	1	1
340	13	338	1	1	1	1
341	13	337	1	1	1	1
342	13	333	1	1	1	1
343	13	334	1	1	1	1
344	13	335	1	1	1	1
345	13	331	1	1	1	1
346	13	330	1	1	1	1
347	2	330	1	1	1	1
412	15	418	1	1	1	1
405	13	396	1	1	1	1
354	15	63	1	1	1	1
355	13	353	1	1	1	1
356	13	351	1	1	1	1
357	13	352	1	1	1	1
358	2	352	1	1	1	1
359	13	356	1	1	1	1
360	13	346	1	1	1	1
361	13	341	1	1	1	1
362	13	347	1	1	1	1
363	13	340	1	1	1	1
364	13	349	1	1	1	1
365	13	343	1	1	1	1
366	13	350	1	1	1	1
367	13	344	1	1	1	1
368	13	345	1	1	1	1
369	13	348	1	1	1	1
370	13	342	1	1	1	1
371	13	354	1	1	1	1
372	13	355	1	1	1	1
373	13	357	1	1	1	1
374	15	330	1	1	1	1
375	13	358	1	1	1	1
376	13	359	1	1	1	1
378	13	362	1	1	1	1
379	13	363	1	1	1	1
381	13	364	1	1	1	1
382	13	366	1	1	1	1
383	13	365	1	1	1	1
384	13	373	1	1	1	1
385	13	375	1	1	1	1
386	2	375	1	1	1	1
387	13	376	1	1	1	1
388	2	376	1	1	1	1
389	13	377	1	1	1	1
390	13	378	1	1	1	1
391	13	6	1	1	1	1
392	13	384	1	1	1	1
393	13	379	1	1	1	1
394	13	380	1	1	1	1
395	13	391	1	1	1	1
396	13	390	1	1	1	1
397	13	381	1	1	1	1
398	2	381	1	1	1	1
399	13	386	1	1	1	1
400	13	392	1	1	1	1
401	2	392	1	1	1	1
402	2	377	1	1	1	1
403	13	394	1	1	1	1
404	13	395	1	1	1	1
406	2	396	1	1	1	1
407	13	397	1	1	1	1
408	2	397	1	1	1	1
409	13	400	1	1	1	1
410	13	399	1	1	1	1
411	2	399	1	1	1	1
414	2	419	1	1	1	1
415	13	417	1	1	1	1
416	2	417	1	1	1	1
417	13	416	1	1	1	1
418	2	416	1	1	1	1
419	13	415	1	1	1	1
420	2	415	1	1	1	1
421	13	414	1	1	1	1
422	2	414	1	1	1	1
423	13	407	1	1	1	1
424	13	401	1	1	1	1
425	13	404	1	1	1	1
426	13	402	1	1	1	1
427	13	406	1	1	1	1
428	13	405	1	1	1	1
429	13	403	1	1	1	1
430	13	426	1	1	1	1
431	13	427	1	1	1	1
432	15	419	1	1	1	1
433	15	208	1	1	1	1
434	13	420	1	1	1	1
435	13	431	1	1	1	1
436	2	431	1	1	1	1
437	13	436	1	1	1	1
438	2	436	1	1	1	1
\.


--
-- Name: aros_acos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.aros_acos_seq', 439, false);


--
-- Name: aros_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.aros_seq', 36, false);


--
-- Data for Name: asistencias; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.asistencias (id, clase_id, persona_id, inscripcion_id, presente, student_performance, reason_absence) FROM stdin;
\.


--
-- Name: asistencias_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.asistencias_seq', 1, false);


--
-- Data for Name: authorities; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.authorities (id, authority) FROM stdin;
\.


--
-- Name: authorities_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.authorities_seq', 1, false);


--
-- Data for Name: cambios; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.cambios (id, objeto, objeto_id, controller, action, descripcion_cambio, motivo, user_id, profesor_id, fecha) FROM stdin;
1	Curso	1	cursos	edit	modified cambio de 2015-11-15 23:09:11-03 a 2015-11-18 23:35:50	\N	1	\N	2015-11-18 23:35:50-03
2	Curso	1	cursos	edit	modified cambio de 2015-11-18 23:35:50-03 a 2015-11-18 23:35:50	\N	1	\N	2015-11-18 23:35:50-03
3	Curso	1	cursos	edit	modified cambio de 2015-11-18 23:35:50-03 a 2015-11-18 23:35:50	\N	1	\N	2015-11-18 23:35:50-03
\.


--
-- Name: cambios_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.cambios_seq', 3, true);


--
-- Data for Name: cancelacion_estudiantes; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.cancelacion_estudiantes (id, motivo, persona_id, inscripcion_id, profesor_id, clase_id, asistencia_id, fecha_cancelacion, horas_anticipacion) FROM stdin;
\.


--
-- Name: cancelacion_estudiantes_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.cancelacion_estudiantes_seq', 1, false);


--
-- Data for Name: cancelacion_profesores; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.cancelacion_profesores (id, motivo, profesor_id, clase_id, fecha_cancelacion, horas_anticipacion) FROM stdin;
\.


--
-- Name: cancelacion_profesores_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.cancelacion_profesores_seq', 1, false);


--
-- Data for Name: cancelaciones; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.cancelaciones (id, clase_id, tipo_cancelacion_id, fecha_cancelacion, horas_anticipacion, persona_id, profesor_id, user_id, comentarios, recuperada_id) FROM stdin;
\.


--
-- Name: cancelaciones_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.cancelaciones_seq', 1, false);


--
-- Data for Name: carga_horarias; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
-- Data for Name: carga_horarias_aud; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.carga_horarias_aud (id, rev, revtype, descripcion, dias_semana, horas_clase, horas_semanales, tipo_curso_id) FROM stdin;
\.


--
-- Name: carga_horarias_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.carga_horarias_seq', 1, false);


--
-- Data for Name: clase_cuotas; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.clase_cuotas (id, cuota_id, clase_id, inscripcion_id, precio_promedio_por_hora, moneda_id) FROM stdin;
\.


--
-- Name: clase_cuotas_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.clase_cuotas_seq', 1, false);


--
-- Data for Name: clase_cursos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.clase_cursos (id, descripcion, abreviatura, idioma_estudiar_id, tipo_curso_id) FROM stdin;
\.


--
-- Name: clase_cursos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.clase_cursos_seq', 1, false);


--
-- Data for Name: clases; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.clases (id, curso_id, profesor_id, descripcion, fecha_clase, hora_comienzo, hora_fin, cancelada, mostrar_cancelada, comentarios, grammar, vocabulary, communication, homework, book_pages, suggestions, sucursal_id, domicilio_clase, no_recuperar, precio_por_hora, moneda_id, honorario_profesor_id, horas_clase_freelance, horas_clase_empleado) FROM stdin;
\.


--
-- Data for Name: clases_aud; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.clases_aud (id, rev, revtype, book_pages, cancelada, comentarios, communication, domicilio_clase, fecha_clase, grammar, homework, mostrar_cancelada, no_recuperar, precio_por_hora, suggestions, vocabulary, curso_id, moneda_id, profesor_id, sucursal_id) FROM stdin;
\.


--
-- Name: clases_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.clases_seq', 1, false);


--
-- Data for Name: comentario_cursos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.comentario_cursos (id, curso_id, comentario, user_id, username, fecha_hora) FROM stdin;
\.


--
-- Name: comentario_cursos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.comentario_cursos_seq', 1, false);


--
-- Data for Name: comentario_profesores; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.comentario_profesores (id, profesor_id, comentario, user_id, username, fecha_hora) FROM stdin;
\.


--
-- Name: comentario_profesores_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.comentario_profesores_seq', 1, false);


--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.comentarios (id, persona_id, comentario, user_id, username, fecha_hora) FROM stdin;
\.


--
-- Name: comentarios_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.comentarios_seq', 1, false);


--
-- Data for Name: como_supos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.como_supos (id, descripcion) FROM stdin;
1	Flyer in the street
2	Facebook
3	Hostel
4	Google
5	Other
6	Friend
\.


--
-- Name: como_supos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.como_supos_seq', 1, false);


--
-- Data for Name: constantes; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.constantes (id, nombre_variable, valor_variable) FROM stdin;
\.


--
-- Name: constantes_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.constantes_seq', 1, false);


--
-- Data for Name: cuotas; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.cuotas (id, persona_id, inscripcion_id, extension_cursada_id, curso_id, descripcion, confirmado, fecha_vencimiento, fecha_desde, fecha_hasta, monto_pagar, es_matricula, moneda_id, saldo_pagar, comentarios, motivo) FROM stdin;
\.


--
-- Name: cuotas_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.cuotas_seq', 1, false);


--
-- Data for Name: curso_ofrecidos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.curso_ofrecidos (id, curso_id, profesor_id, fecha_ofrecido, aceptado, fecha_aceptacion, estado_aceptacion) FROM stdin;
\.


--
-- Name: curso_ofrecidos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.curso_ofrecidos_seq', 1, false);


--
-- Data for Name: curso_profesores; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.curso_profesores (id, profesor_id, honorario_profesor_id, curso_id, precio_por_hora, moneda_id, fecha_desde) FROM stdin;
\.


--
-- Name: curso_profesores_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.curso_profesores_seq', 1, false);


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.cursos (id, codigo_curso, descripcion_curso, libro, duracion_paquete, carga_horaria, incluye, profesor_titular, profesor_suplente, horario_curso, fecha_comienzo, fecha_fin, fecha_baja, tipo_curso_id, clase_curso_id, modalidad_pago_id, monto_unidad_modalidad, moneda_id, idioma_estudiar_id, nivel_id, sucursal_id, domicilio_clase, abierto, inscriptos, baja, created, modified, intensivo, es_paquete) FROM stdin;
1	61.03	Analisis Matematico II	Marsden Tromba Calculo Vectorial	\N	\N	\N			Martes y Jueves de 11 a 15	2015-12-01	2016-07-31	\N	2	\N	\N	0.00	1	1	1	2		N	1	0	2015-11-15 23:09:11-03	2015-11-18 23:35:50-03	f	0
4	62.01	Fisica I	Alonso Finn Fisica	\N	\N	\N			Lunes y Miercoles de 8 a 12	2015-11-27	2016-07-31	\N	2	\N	\N	0.00	1	1	1	2	\N	E	4	0	\N	\N	f	0
80	61.08	Algebra II	Burgos Algebra	\N	\N	\N			Martes y Jueves de 9 a 13	2015-12-07	2016-07-29	\N	2	\N	\N	0.00	1	1	1	1	\N	E	3	0	\N	\N	f	0
522	75.01	Computacion	Libro	\N	\N	\N			Lunes y viernes de 9 a 11	2016-07-18	2016-10-28	\N	1	\N	\N	0.00	1	1	1	2	\N	S	0	0	\N	\N	f	0
530	75.40	Algoritmos I	Fontela	\N	\N	\N			Lunes de 15 a 17	2016-07-18	2016-10-28	\N	1	\N	\N	0.00	1	1	1	1	\N	S	0	0	\N	\N	f	0
533	75.41	Algoritmos II	Fontela	\N	\N	\N			Jueves de 14 a 18	2016-07-18	2016-10-28	\N	2	\N	\N	0.00	1	1	1	1	\N	S	0	0	\N	\N	f	0
536	63.01	Química	Química-Erwin Baumgartner y otros	\N	\N	\N			Sábado de 7 a 13	2016-07-18	2016-10-28	\N	1	\N	\N	0.00	1	1	1	1	\N	S	0	0	\N	\N	f	0
\.


--
-- Data for Name: cursos_aud; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.cursos_aud (es_paquete, id, rev, revtype, abierto, baja, codigo_curso, descripcion_curso, fecha_baja, fecha_comienzo, fecha_fin, horario_curso, inscriptos, intensivo, idioma_estudiar_id, nivel_id, sucursal_id, tipo_curso_id, libro) FROM stdin;
0	522	523	0	S	0	75.01	Computacion	\N	2016-07-18 00:00:00	2016-10-28 00:00:00	Lunes y viernes de 9 a 11	0	f	1	1	2	1	Libro
0	530	532	0	S	0	75.40	Algoritmos I	\N	2016-07-18 00:00:00	2016-10-28 00:00:00	Lunes de 15 a 17	0	f	1	1	1	1	Fontela
0	533	535	0	S	0	75.41	Algoritmos II	\N	2016-07-18 00:00:00	2016-10-28 00:00:00	Jueves de 14 a 18	0	f	1	1	1	2	Fontela
0	536	539	0	S	0	63.01	Química	\N	2016-07-18 00:00:00	2016-10-28 00:00:00	Sábado de 7 a 13	0	f	1	1	1	1	Química-Erwin Baumgartner y otros
\.


--
-- Data for Name: cursos_nombres_viejos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.cursos_nombres_viejos (id, curso_id, codigo_curso, descripcion_curso, fecha_cambio, user_id) FROM stdin;
\.


--
-- Name: cursos_nombres_viejos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.cursos_nombres_viejos_seq', 1, false);


--
-- Name: cursos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.cursos_seq', 1, true);


--
-- Data for Name: devoluciones; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.devoluciones (id, fecha, user_id, monto, moneda_id, sucursal_id, cuota_id) FROM stdin;
\.


--
-- Name: devoluciones_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.devoluciones_seq', 1, false);


--
-- Data for Name: duracion_modos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.duracion_modos (id, descripcion, codigo) FROM stdin;
1	Dia	DIA
2	Semana	SEMANA
3	Mes	MES
\.


--
-- Name: duracion_modos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.duracion_modos_seq', 3, true);


--
-- Data for Name: estado_inscripcion; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.estado_inscripcion (id, descripcion, abreviatura) FROM stdin;
1	Nueva	N
2	Confirmada	C
\.


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.estados (id, descripcion) FROM stdin;
1	Interesado
2	Pendiente
3	Estudiante
4	Estudiante sin cuotas
\.


--
-- Name: estados_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.estados_seq', 4, true);


--
-- Data for Name: extension_cursadas; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.extension_cursadas (id, modalidad_curso_id, inscripcion_id, duracion_modo_id, duracion_cantidad, fecha_desde, fecha_hasta, precio_unidad_modalidad, moneda_id) FROM stdin;
\.


--
-- Name: extension_cursadas_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.extension_cursadas_seq', 1, false);


--
-- Data for Name: extra_personas; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.extra_personas (id, extra_id, persona_id, fecha) FROM stdin;
\.


--
-- Name: extra_personas_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.extra_personas_seq', 1, false);


--
-- Data for Name: extras; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.extras (id, descripcion, precio, moneda_id) FROM stdin;
\.


--
-- Name: extras_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.extras_seq', 1, false);


--
-- Data for Name: feriados; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.feriados (id, fecha, descripcion) FROM stdin;
1	2016-07-09	Dia de la Independencia
\.


--
-- Name: feriados_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.feriados_seq', 1, true);


--
-- Data for Name: group_permission; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.group_permission (id, group_id, authority) FROM stdin;
1	1	ROLE_USER
3	1	ROLE_ADMIN
4	1	ROLE_PERMISOS_MOSTRAR_MENU
103	1	ROLE_MENU_MOSTRAR
105	1	ROLE_CARGA_HORARIA_MOSTRAR_MENU
106	1	ROLE_CARGA_HORARIA_AGREGAR
188	1	ROLE_HONORARIOS_INDICE
108	1	ROLE_CURSOS_MOSTRAR_MENU
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
542	540	ROLE_ADMIN
\.


--
-- Name: group_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.group_permission_seq', 4, true);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.groups (id, group_name, created, modified) FROM stdin;
1	Administradores	2012-01-30 13:31:58-03	2012-01-30 13:31:58-03
2	Coordinadores idioma	2012-01-30 13:32:08-03	2012-01-30 13:32:08-03
3	Empleados	2012-01-30 13:32:18-03	2012-01-30 13:32:18-03
4	Coordinadores contables	2012-04-02 23:04:46-03	2012-04-02 23:04:46-03
5	Profesores	2012-05-13 23:00:44-03	2012-05-13 23:00:44-03
540	Administradores	\N	\N
\.


--
-- Name: groups_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.groups_seq', 6, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.hibernate_sequence', 547, true);


--
-- Data for Name: honorario_asignados; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.honorario_asignados (id, profesor_id, honorario_profesor_id, fecha_asignacion, fecha_desde, precio_por_hora, moneda_id) FROM stdin;
1	270	6	2015-11-18	2015-11-01	90.00	1
\.


--
-- Data for Name: honorario_asignados_aud; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.honorario_asignados_aud (id, rev, revtype, fecha_asignacion, fecha_desde, precio_por_hora, honorario_profesor_id, moneda_id, profesor_id) FROM stdin;
\.


--
-- Name: honorario_asignados_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.honorario_asignados_seq', 1, true);


--
-- Data for Name: honorario_profesores; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.honorario_profesores (id, precio_por_hora, moneda_id, descripcion, idioma_estudiar_id, otro_honorario, fecha_desde, especial, profesor_id, modified, cambios) FROM stdin;
1	70.00	1	grupo 1 o 2 	2	0	1970-01-01	0	0	\N	0
3	80.00	1	Individual Domicilio	2	0	2015-08-11	0	0	2015-08-11	0
4	90.00	1	grupal 3 o + antiguedad	2	0	2015-08-12	0	0	2015-08-11	0
22	90.00	1	individual a domicilio + antiguedad	2	0	2015-08-12	0	0	2015-07-29	0
6	90.00	1	Ingles general / conversacion 	1	0	1970-01-01	0	0	\N	0
7	140.00	1	Feriados grupo+3	2	0	1970-01-01	0	0	\N	0
25	80.00	1	profesor con antiguedad	2	0	2015-08-12	1	141	2015-08-12	0
9	100.00	1	profe con experiencia ingles 	1	0	1970-01-01	0	0	\N	0
10	110.00	1	intl exam prep	1	0	1970-01-01	0	0	\N	0
12	105.00	1	profe con experiencia ingles+5	1	0	2015-01-01	0	0	\N	0
13	90.00	1	Italiano	9	0	2015-06-04	1	250	2015-06-04	0
14	80.00	1	Profesor c/antigüedad	2	0	2015-08-11	1	35	2015-06-05	0
15	100.00	1	Clase grupal	3	0	2015-06-05	1	249	2015-06-05	0
26	80.00	1	grupo 3 o +	2	0	2015-08-12	1	253	2015-08-12	0
18	105.00	1	Portugues c/experiencia	4	0	2015-06-29	1	26	2015-06-29	0
19	90.00	1	Honorario Italiano	9	0	2015-06-30	1	256	2015-06-30	0
20	100.00	1	individuales	3	0	2015-07-23	1	259	2015-07-23	0
24	100.00	1	a domicilio sábados + antiguedad	2	0	2015-08-12	1	105	2015-08-12	0
23	110.00	1	Clases en empresa	1	0	2015-07-29	0	0	2015-07-29	0
27	90.00	1	Portugues	4	0	2015-08-14	1	217	2015-08-14	0
28	100.00	1	Francés	3	0	2015-08-14	1	261	2015-08-14	0
29	80.00	1	profesor con antiguedad	2	0	2015-08-14	1	34	2015-08-14	0
30	80.00	1	profesor con antiguedad	2	0	2015-08-18	1	114	2015-08-18	0
31	80.00	1	profesor con antiguedad	2	0	2015-09-09	1	150	2015-09-09	0
32	100.00	1	profesor con experiencia	10	0	2015-09-24	1	268	2015-09-24	0
33	80.00	1	profesor con experiencia (precio base)	2	0	2015-10-07	1	269	2015-10-07	0
197	90.00	1	Básico inglés	1	0	2016-07-08	0	\N	\N	0
\.


--
-- Data for Name: honorario_profesores_aud; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.honorario_profesores_aud (id, rev, revtype, descripcion, especial, fecha_desde, otro_honorario, precio_por_hora, idioma_estudiar_id, moneda_id) FROM stdin;
\.


--
-- Data for Name: honorario_profesores_historico; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.honorario_profesores_historico (id, honorario_profesor_id, fecha_desde, precio_por_hora, moneda_id) FROM stdin;
\.


--
-- Name: honorario_profesores_historico_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.honorario_profesores_historico_seq', 1, false);


--
-- Name: honorario_profesores_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.honorario_profesores_seq', 39, false);


--
-- Data for Name: horario_cursos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.horario_cursos (id, curso_id, dia_semana, hora_inicio, hora_fin, profesor_id, fecha_desde, fecha_hasta, sucursal_id, honorario_profesor_id, precio_por_hora, moneda_id) FROM stdin;
\.


--
-- Data for Name: horario_cursos_aud; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.horario_cursos_aud (id, rev, revtype, dia_semana, fecha_desde, fecha_hasta, hora_fin, hora_inicio, precio_por_hora, curso_id, honorario_profesor_id, moneda_id, profesor_id, sucursal_id) FROM stdin;
\.


--
-- Name: horario_cursos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.horario_cursos_seq', 2, true);


--
-- Data for Name: horario_profesor_empleado_renglones; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.horario_profesor_empleado_renglones (id, horario_profesor_empleado_id, dia_semana, hora_comienzo, hora_fin) FROM stdin;
\.


--
-- Name: horario_profesor_empleado_renglones_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.horario_profesor_empleado_renglones_seq', 1, false);


--
-- Data for Name: horario_profesor_empleados; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.horario_profesor_empleados (id, profesor_id, fecha_comienzo, fecha_fin) FROM stdin;
\.


--
-- Name: horario_profesor_empleados_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.horario_profesor_empleados_seq', 1, false);


--
-- Data for Name: horario_profesor_excepciones; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.horario_profesor_excepciones (id, horario_profesor_id, fecha_excepcion) FROM stdin;
\.


--
-- Name: horario_profesor_excepciones_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.horario_profesor_excepciones_seq', 1, false);


--
-- Data for Name: horario_profesores; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.horario_profesores (id, profesor_id, fecha_comienzo, fecha_fin, dia_semana, hora_comienzo, hora_fin, lugar) FROM stdin;
\.


--
-- Name: horario_profesores_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.horario_profesores_seq', 1, false);


--
-- Data for Name: idioma_estudiares; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
-- Name: idioma_estudiares_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.idioma_estudiares_seq', 11, false);


--
-- Data for Name: idioma_modalidades; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
-- Data for Name: idioma_modalidades_aud; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.idioma_modalidades_aud (rev, modalidad_curso_id, idioma_estudiar_id, revtype) FROM stdin;
\.


--
-- Name: idioma_modalidades_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.idioma_modalidades_seq', 1, false);


--
-- Data for Name: idioma_nativos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
-- Name: idioma_nativos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.idioma_nativos_seq', 77, false);


--
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.inscripciones (id, curso_id, modalidad_curso_id, modo_cursada, persona_id, confirmada, pre_inscripcion, fecha_inscripcion, fecha_comienzo, fecha_finalizacion, baja, fecha_baja, empleado, motivo_empleado, borrada, created, modified, tipo, estado_id, lista_espera, materia, nivel, clases_semanales, horas_clase, dias_preferidos, dias_alternativos, horario_preferido, horario_alternativo, sexo_profesor, preferencia_idioma, idioma_estudiar_id, nivel_id, orientacion_id, profesor_posible_id, cual_examen, otra_orientacion, sucursal_id) FROM stdin;
546	\N	\N	\N	545	0	0	2016-12-13	2016-12-13	\N	0	\N	0	\N	0	2016-12-13 21:39:14.525356-03	\N	Individual	1	\N		\N	1	1 hora	ddd	ddd	ddd	ddd	Hombre	American	2	1	1	\N			2
\.


--
-- Data for Name: inscripciones_aud; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.inscripciones_aud (tipo, id, rev, revtype, baja, borrada, confirmada, created, empleado, fecha_baja, fecha_comienzo, fecha_finalizacion, fecha_inscripcion, curso_id, estado_id, modalidad_curso_id, persona_id, clases_semanales, cual_examen, dias_alternativos, dias_preferidos, horario_alternativo, horario_preferido, horas_clase, materia, otra_orientacion, preferencia_idioma, sexo_profesor, idioma_estudiar_id, nivel_id, orientacion_id, profesor_posible_id, sucursal_id, lista_espera, modified) FROM stdin;
Grupal	21	22	0	0	0	0	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 15:14:51.925	1	1	2	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	32	33	0	0	0	0	\N	0	\N	2015-11-27 00:00:00	2016-02-29 00:00:00	2015-11-27 15:32:56.921	1	1	2	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	36	37	0	0	0	0	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 15:41:39.528	1	1	2	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	53	55	0	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	54	2	2	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	56	57	0	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	1	2	2	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	58	59	0	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-02-29 00:00:00	2015-11-27 00:00:00	1	2	2	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	60	61	0	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	1	2	2	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	62	63	0	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	1	2	2	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	64	65	0	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	1	2	2	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	67	68	0	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	1	2	2	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	69	70	0	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	1	2	2	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	71	72	0	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	1	2	2	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	73	74	0	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	1	2	2	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	75	76	0	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	1	2	2	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	21	77	1	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	1	2	2	19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	32	78	1	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-02-29 00:00:00	2015-11-27 00:00:00	1	2	2	30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	36	79	1	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-11-27 00:00:00	1	2	2	34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	101	102	0	0	0	0	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-12-09 22:05:06.639	80	1	2	100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	101	129	1	0	0	1	\N	0	\N	2015-11-27 00:00:00	2016-03-31 00:00:00	2015-12-09 00:00:00	80	2	2	100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	131	132	0	0	0	0	\N	0	\N	2016-02-22 00:00:00	2016-05-02 00:00:00	2016-02-17 16:20:26.159	4	1	2	130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	134	135	0	0	0	0	\N	0	\N	2016-02-22 00:00:00	2016-05-02 00:00:00	2016-02-17 16:24:12.696	4	1	2	133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	137	138	0	0	0	0	\N	0	\N	2016-02-22 00:00:00	2016-05-02 00:00:00	2016-02-17 16:27:07.165	4	1	2	136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	140	141	0	0	0	0	\N	0	\N	2016-02-22 00:00:00	2016-05-02 00:00:00	2016-02-17 17:32:37.84	4	1	2	139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	131	142	1	0	0	1	\N	0	\N	2016-02-22 00:00:00	2016-05-02 00:00:00	2016-02-17 00:00:00	4	2	2	130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	134	143	1	0	0	1	\N	0	\N	2016-02-22 00:00:00	2016-05-02 00:00:00	2016-02-17 00:00:00	4	2	2	133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	137	144	1	0	0	1	\N	0	\N	2016-02-22 00:00:00	2016-05-02 00:00:00	2016-02-17 00:00:00	4	2	2	136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	140	145	1	0	0	1	\N	0	\N	2016-02-22 00:00:00	2016-05-02 00:00:00	2016-02-17 00:00:00	4	2	2	139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	147	148	0	0	0	0	\N	0	\N	2016-02-22 00:00:00	2016-06-01 00:00:00	2016-02-17 17:43:14.534	4	1	2	146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	147	149	1	0	0	1	\N	0	\N	2016-02-22 00:00:00	2016-06-01 00:00:00	2016-02-17 00:00:00	4	2	2	146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	151	152	0	0	0	0	\N	0	\N	2016-02-22 00:00:00	2016-05-30 00:00:00	2016-02-17 20:41:24.84	4	1	2	150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	154	155	0	0	0	0	\N	0	\N	2016-02-22 00:00:00	2016-06-27 00:00:00	2016-02-17 20:42:36.94	4	1	2	153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	157	158	0	0	0	0	\N	0	\N	2016-02-22 00:00:00	2016-05-30 00:00:00	2016-02-17 20:43:32.624	4	1	2	156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	151	159	1	0	0	1	\N	0	\N	2016-02-22 00:00:00	2016-05-30 00:00:00	2016-02-17 00:00:00	4	2	2	150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	154	160	1	0	0	1	\N	0	\N	2016-02-22 00:00:00	2016-06-27 00:00:00	2016-02-17 00:00:00	4	2	2	153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	157	161	1	0	0	1	\N	0	\N	2016-02-22 00:00:00	2016-05-30 00:00:00	2016-02-17 00:00:00	4	2	2	156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	163	164	0	0	0	0	\N	0	\N	2016-02-22 00:00:00	2016-05-30 00:00:00	2016-02-18 11:55:51.463	80	1	2	162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	166	167	0	0	0	0	\N	0	\N	2015-12-07 00:00:00	2016-06-01 00:00:00	2016-02-18 12:02:23.784	80	1	2	165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	169	170	0	0	0	0	\N	0	\N	2015-12-07 00:00:00	2016-05-30 00:00:00	2016-02-18 12:16:51.544	80	1	2	168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	172	173	0	0	0	0	\N	0	\N	2015-12-07 00:00:00	2016-05-31 00:00:00	2016-02-18 12:21:21.861	80	1	2	171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	175	176	0	0	0	0	\N	0	\N	2015-12-07 00:00:00	2016-05-30 00:00:00	2016-02-18 12:24:34.046	80	1	2	174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	178	179	0	0	0	0	\N	0	\N	2015-12-07 00:00:00	2016-05-31 00:00:00	2016-02-18 13:19:50.946	80	1	2	177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	181	182	0	0	0	0	\N	0	\N	2015-12-07 00:00:00	2016-05-30 00:00:00	2016-02-18 13:24:58.372	80	1	2	180	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	163	183	1	0	0	1	\N	0	\N	2016-02-22 00:00:00	2016-05-30 00:00:00	2016-02-18 00:00:00	80	2	2	162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	166	184	1	0	0	1	\N	0	\N	2015-12-07 00:00:00	2016-06-01 00:00:00	2016-02-18 00:00:00	80	2	2	165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Grupal	169	185	1	0	0	1	\N	0	\N	2015-12-07 00:00:00	2016-05-30 00:00:00	2016-02-18 00:00:00	80	2	2	168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N
Individual	546	547	0	0	0	0	\N	0	\N	2016-12-13 00:00:00	\N	2016-12-13 21:39:13.712	\N	1	\N	545	1		ddd	ddd	ddd	ddd	1 hora			American	Hombre	2	1	1	\N	2	\N	\N
\.


--
-- Data for Name: inscripciones_individuales; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.inscripciones_individuales (id, persona_id, sucursal_id, materia, modo_cursada_individual, nivel, clases_semanales, horas_clase, paquetes, fecha_estimada_comienzo, dias_preferidos, dias_alternativos, horario_preferido, horario_alternativo, sexo_profesor, preferencia_idioma, idioma_estudiar_id, nivel_id, orientacion_id, profesor_posible_id, cual_examen, otra_orientacion, confirmada, inscripcion_id, lista_espera, dual, modalidad_curso_id, pre_inscripcion, borrada, created, modified) FROM stdin;
\.


--
-- Name: inscripciones_individuales_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.inscripciones_individuales_seq', 1, false);


--
-- Name: inscripciones_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.inscripciones_seq', 1, false);


--
-- Data for Name: modalidad_curso_descripciones; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.modalidad_curso_descripciones (id, modalidad_curso_id, titulo_curso, descripcion_curso, in_a_nutshell, whats_included, goal_of_course) FROM stdin;
\.


--
-- Name: modalidad_curso_descripciones_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.modalidad_curso_descripciones_seq', 1, false);


--
-- Data for Name: modalidad_cursos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
-- Data for Name: modalidad_cursos_aud; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.modalidad_cursos_aud (id, rev, revtype, abreviatura, descripcion, duracion_cantidad, es_extra, precio_unidad_modalidad, carga_horaria_id, duracion_modo_id, modalidad_pago_id, moneda_id) FROM stdin;
2	5	1	GRL17+	Curso ingles general para adultos	10	f	1400	4	3	1	1
\.


--
-- Name: modalidad_cursos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.modalidad_cursos_seq', 131, true);


--
-- Data for Name: modalidad_disponibles; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.modalidad_disponibles (id, curso_id, modalidad_curso_id, precio_unidad_modalidad, moneda_id) FROM stdin;
2	4	2	\N	\N
4	1	2	\N	\N
5	80	2	\N	\N
531	530	61	1700	1
534	533	2	1400	1
537	536	13	1400	1
538	536	57	4320	1
\.


--
-- Data for Name: modalidad_disponibles_aud; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.modalidad_disponibles_aud (id, rev, revtype, precio_unidad_modalidad, curso_id, modalidad_curso_id, moneda_id) FROM stdin;
531	532	0	1700	530	61	1
534	535	0	1400	533	2	1
537	539	0	1400	536	13	1
538	539	0	4320	536	57	1
\.


--
-- Name: modalidad_disponibles_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.modalidad_disponibles_seq', 6, true);


--
-- Data for Name: modalidad_pagos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
-- Name: modalidad_pagos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.modalidad_pagos_seq', 1, false);


--
-- Data for Name: monedas; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.monedas (id, descripcion, tasa_cambio, simbolo) FROM stdin;
1	Pesos	1.00	$
2	Dolares	12.50	USD
3	Euro	13.00	E
4	Real	3.00	R
\.


--
-- Name: monedas_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.monedas_seq', 5, false);


--
-- Data for Name: motivos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.motivos (id, descripcion, descripcion_ingles, externo, estado_id) FROM stdin;
1	Viaje	I'm leaving Buenos Aires	1	3
2	Temas laborales		0	3
3	Vacaciones		0	3
4	Otros		0	3
5	Tengo otras prioridades	I have other priorities	1	3
6	Temas economicos	Financial reasons	1	3
7	Me voy a otra academia	I'm going to another school	1	3
8	Temas personales		0	3
9	No le gusto el profesor		0	3
10	No le gusto nuestro servicio		0	3
11	Demasiados cambios de profesor		0	2
12	Precio		0	2
13	Duplicado/error del sistema		0	2
14	No se encontro el profesor pedido		0	2
15	No se encontro el profesor y se canso de esperar		0	2
16	Tuvo un inconveniente		0	2
\.


--
-- Name: motivos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.motivos_seq', 17, false);


--
-- Data for Name: nacionalidades; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
-- Name: nacionalidades_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.nacionalidades_seq', 208, false);


--
-- Data for Name: niveles; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
-- Name: niveles_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.niveles_seq', 8, false);


--
-- Data for Name: notificacion_enviadas; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.notificacion_enviadas (id, fecha_envio, user_id, notificacion_id, lista_destinatarios, persona_id, hash_mensaje) FROM stdin;
\.


--
-- Name: notificacion_enviadas_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.notificacion_enviadas_seq', 1, false);


--
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.notificaciones (id, clase, metodo, descripcion, titulo, titulo_ingles, archivo, nombre_vista, destinatarios, adjuntos, adjuntos_ingles) FROM stdin;
1	InscripcionesController	abrir_curso_grupal	Notifica cuando se abre un curso grupal.	Notificacion de curso grupal abierto		/home/buenosai/public_html/lvstudio/app/View/Emails/html/apertura_curso_grupal.ctp	apertura_curso_grupal	pendientes@lvstudioweb.com	\N	\N
2	InscripcionesController	abrir_curso_individual	Notifica cuando se confirma inscripcion en curso individual.	Notificacion de curso individual confirmado		/home/buenosai/public_html/lvstudio/app/View/Emails/html/apertura_curso_individual.ctp	apertura_curso_individual	pendientes@lvstudioweb.com	\N	\N
3	InscripcionesController	abrir_curso_espanol	Notifica cuando se abre un curso de espanol	Notificacion de curso de espanol abierto		/home/buenosai/public_html/lvstudio/app/View/Emails/html/apertura_curso_espanol.ctp	apertura_curso_espanol	inscripcion@lvstudioweb.com	\N	\N
4	InscripcionesController	inscribir	Notifica cuando se inscribe una persona	Notificacion de inscripcion		/home/buenosai/public_html/lvstudio/app/View/Emails/html/inscribir.ctp	inscribir	inscripcion@lvstudioweb.com	\N	\N
5	CursosController	cambio_profesor	Notifica cuando el profesor de un curso se borra	Notificacion de renuncia de profesor		/home/buenosai/public_html/lvstudio/app/View/Emails/html/cambio_profesor.ctp	cambio_profesor	pendientes@lvstudioweb.com	\N	\N
6	InscripcionesController	inscribir_individual	Notifica cuando se recibe una inscripcion individual	Notificacion de inscripcion individual		/home/buenosai/public_html/lvstudio/app/View/Emails/html/inscribir_individual.ctp	inscribir_individual	inscripcion@lvstudioweb.com	\N	\N
7	InscripcionesController	inscribir_lista_espera	Notifica cuando se recibe una inscripcion en lista de espera	Notificacion de inscripcion en lista de espera		/home/buenosai/public_html/lvstudio/app/View/Emails/html/inscribir_lista_espera.ctp	inscribir_lista_espera	inscripcion@lvstudioweb.com	\N	\N
8	InscripcionesController	baja_temporal	Notifica cuando se produce una baja temporal	Notificacion de baja temporal		/home/buenosai/public_html/lvstudio/app/View/Emails/html/baja_temporal.ctp	baja_temporal	baja@lvstudioweb.com	\N	\N
9	InscripcionesController	baja_definitiva	Notifica cuando se produce una baja definitiva	Notificacion de baja definitiva		/home/buenosai/public_html/lvstudio/app/View/Emails/html/baja_definitiva.ctp	baja_definitiva	baja@lvstudioweb.com	\N	\N
10	CursosController	cancelar_clase	Notificar cuando se cancela una clase	Notificacion de clase cancelada		/home/buenosai/public_html/lvstudio/app/View/Emails/html/clase_cancelada.ctp	clase_cancelada	cancel@lvstudioweb.com	\N	\N
11	ClasesController	cancelar_clase_prof_estudiantes	Notifica al profesor y estudiantes cuando se cancela la clase	Notificacion de clase cancelada	Class was cancelled	/home/buenosai/public_html/lvstudio/app/View/Emails/html/clase_cancelada_prof_estudiantes.ctp	clase_cancelada_prof_estudiantes	Esta notificacion se enviara al profesor que dicta la clase cancelada y los estudiantes que pertenecen al curso.	\N	\N
12	MailShell	notificar_primer_dia_estudiante	Notifica al profesor y estudiantes cuando es la primer clase del curso	Notificacion de primer dia	First day of course	/home/buenosai/public_html/lvstudio/app/View/Emails/html/primer_dia.ctp	primer_dia	agustin@strellis.com.ar	\N	\N
13	PagosController	pago_confirmado	Notifica cuando se recibe un pago parcial	Notificacion de pago recibido		/home/buenosai/public_html/lvstudio/app/View/Emails/html/pago_confirmado.ctp	pago_confirmado	caja@lvstudioweb.com	\N	\N
14	MailShell	notificar_primer_dia_profesor	Pide al profesor que cuente como le fue en el primer dia de clase	Notificacion de primer dia	First day of course	/home/buenosai/public_html/lvstudio/app/View/Emails/html/primer_dia_profesor.ctp	primer_dia_profesor	\N	\N	\N
15	MailShell	recordar_pagar_cuota	Notifica que hay que pagar la cuota entre el 1 y el 5 del mes	Recordatorio de cuotas por vencer	Reminder: payment due	/home/buenosai/public_html/lvstudio/app/View/Emails/html/recordar_pagar_cuota.ctp	recordar_pagar_cuota	A especificar en la notificacion	\N	\N
16	MailShell	notificar_pago_atrasado	Notifica cuando la persona todavia no pago lo que tiene pendiente	Notificacion de cuota vencida	Payment past due date	/home/buenosai/public_html/lvstudio/app/View/Emails/html/notificar_pago_atrasado.ctp	notificar_pago_atrasado	A especificar en la notificacion	\N	\N
17	MailShell	cambios_ayer	Notifica de los cambios del dia anterior	Cambios de Ayer		/home/buenosai/public_html/lvstudio/app/View/Emails/html/cambios_ayer.ctp	cambios_ayer	agustin@strellis.com.ar\\r\\ncambios@lvstudioweb.com	\N	\N
18	ClasesController	inasistencia	Notifica una inasistencia a curso grupal (clase grupal cancelada por estudiante)	Notificacion de inasistencia		/home/buenosai/public_html/lvstudio/app/View/Emails/html/inasistencia.ctp	inasistencia	cancel@lvstudioweb.com	\N	\N
19	ClasesController	ausencia_notificada_profesor	Ausencia de estudiante notificada por el profesor en una clase futura	Ausencia de estudiante notificada por el profesor		/home/buenosai/public_html/lvstudio/app/View/Emails/html/ausencia_notificada_profesor.ctp	ausencia_notificada_profesor	cancel@lvstudioweb.com	\N	\N
20	CursosController	baja_curso	Notifica cuando un curso se da de baja	Notificacion de baja de curso		/home/buenosai/public_html/lvstudio/app/View/Emails/html/baja_curso.ctp	baja_curso	baja@lvstudioweb.com	\N	\N
21	MailShell	retorno_bajas_temporales	Notifica cuando falta una semana para que vuelvan las personas con baja temporal	Contactar estudiantes en baja temporal		/home/buenosai/public_html/lvstudio/app/View/Emails/html/retorno_bajas_temporales.ctp	retorno_bajas_temporales	administration@lvstudioweb.com	\N	\N
22	MailShell	cursos_por_terminar	Manda la lista de cursos para los cuales falta una semana para que terminen	Notificacion de cursos que estan por terminar		/home/buenosai/public_html/lvstudio/app/View/Emails/html/cursos_por_terminar.ctp	cursos_por_terminar	administration@lvstudioweb.com	\N	\N
23	MailShell	clases_pendientes_recuperar	Manda la lista de lcases pendientes de recuperar	Notificacion de clases pendientes de recuperar		/home/buenosai/public_html/lvstudio/app/View/Emails/html/clases_pendientes_recuperar.ctp	clases_pendientes_recuperar	pendientes@lvstudioweb.com	\N	\N
24	ProfesoresController	cancelacion_solicitada_profesor	Notifica la solicitud de cancelacion de un profesor	Notificacion de solicitud de cancelacion del profe		/home/buenosai/public_html/lvstudio/app/View/Emails/html/cancelacion_solicitada_profesor.ctp	cancelacion_solicitada_profesor	cancel@lvstudioweb.com	\N	\N
25	MailShell	cursos_pendientes_profesor	Notifica los cursos que estan pendientes de profesor	Notificacion de cursos pendientes de profesor		/home/buenosai/public_html/lvstudio/app/View/Emails/html/cursos_pendientes_profesor.ctp	cursos_pendientes_profesor	pendientes@lvstudioweb.com	\N	\N
26	CursosComponent	cantidad_estudiantes_aumenta	Notifica cuando sube la cantidad de estudiantes de un curso	Aumento de estudiantes en curso	Increase in number of students	/home/buenosai/public_html/lvstudio/app/View/Emails/html/cantidad_estudiantes_aumenta.ctp	cantidad_estudiantes_aumenta	inscripcion@lvstudioweb.com	\N	\N
27	CursosComponent	cantidad_estudiantes_baja	Notifica cuando baja la cantidad de estudiantes de un curso	Reduccion de estudiantes en curso	Decrease of the number of students	/home/buenosai/public_html/lvstudio/app/View/Emails/html/cantidad_estudiantes_baja.ctp	cantidad_estudiantes_baja	inscripcion@lvstudioweb.com	\N	\N
30	InscripcionesController	abrir_curso_dual	Notifica cuando se abre un curso dual	Apertura de curso dual	\N	/home/buenosai/public_html/lvstudio/app/View/Emails/html/apertura_curso_dual.ctp	apertura_curso_dual	pendientes@lvstudioweb.com	\N	\N
31	ProfesoresController	bienvenida_profesor	Mensaje de bienvenida para el profesor	Bienvenido nuevo profesor!	Welcome new LV teacher!	/home/buenosai/public_html/lvstudio/app/View/Emails/html/bienvenida_profesor.ctp	bienvenida_profesor	agustin@strellis.com.ar		
58	PersonasController	estudiantes_no_cursan_nada	Lista los estudiantes que no cursan nada	Estudiantes que no cursan nada	Students not currently attending courses	/home/buenosai/public_html/lvstudio/app/View/Emails/html/estudiantes_no_cursan_nada.ctp	estudiantes_no_cursan_nada	agustin@flower	\N	\N
32	ProfesoresController	alta_profesor	Mensaje de notificacion de alta de nuevo profesor	Nuevo profesor 		/home/buenosai/public_html/lvstudio/app/View/Emails/html/alta_profesor.ctp	alta_profesor	administration@lvstudioweb.com	\N	\N
33	ProfesoresController	aviso_de_oferta	Notifica cuando se hizo una oferta de curso a profesor	Nuevo profesor de 		/home/buenosai/public_html/lvstudio/app/View/Emails/html/aviso_de_oferta.ctp	aviso_de_oferta	administration@lvstudioweb.com	\N	\N
34	ProfesoresController	baja_profesor_solicitud_reunion	Manda mensaje al profesor recordandole de su entrevista de salida	LV Studio Exit Meeting	LV Studio Exit Meeting	/home/buenosai/public_html/lvstudio/app/View/Emails/html/baja_profesor_solicitud_reunion.ctp	baja_profesor_solicitud_reunion	Direccion del profesor	\N	\N
35	InscripcionesController	baja_definitiva_mensaje_estudiante	Manda mensaje al estudiante para hacerle llenar una encuesta	Encuesta de calidad: LV Studio	Thank you for choosing LV Studio - We want to thank you with a Skype class!	/home/buenosai/public_html/lvstudio/app/View/Emails/html/baja_definitiva_mensaje_estudiante.ctp	baja_definitiva_mensaje_estudiante			\N
36	MailShell	fin_curso	Notifica 48 horas antes del fin de la cursada de un curso grupal	Finalizacion curso: preparar certificado		/home/buenosai/public_html/lvstudio/app/View/Emails/html/fin_curso.ctp	fin_curso	administration@lvstudioweb.com	\N	\N
37	MailShell	profesores_ausentes_dos_veces	Notifica si hay profesores que en el mes en curso registraron mas de dos ausencias (CP)	Profesores con mas de dos ausencias en el mes		/home/buenosai/public_html/lvstudio/app/View/Emails/html/profesores_ausentes_dos_veces.ctp	profesores_ausentes_dos_veces	administration@lvstudioweb.com	\N	\N
38	MailShell	pedir_copias_libros	Notifica cuando hay que pedir copias de libros para un curso abierto que esta por comenzar	Pedir libros para curso grupal		/home/buenosai/public_html/lvstudio/app/View/Emails/html/pedir_copias_libros.ctp	pedir_copias_libros	administration@lvstudioweb.com	\N	\N
39	MailShell	clases_sin_tomar_lista	Clases donde no se tomo lista	Clases donde no se tomo lista		/home/buenosai/public_html/lvstudio/app/View/Emails/html/clases_sin_tomar_lista.ctp	clases_sin_tomar_lista	administration@lvstudioweb.com	\N	\N
40	InscripcionesController	inscribir_existente	Notifica cuando un alumno existente se inscribe en un curso	Notificacion de inscripcion (estudiante existente)	\N	/home/buenosai/public_html/lvstudio/app/View/Emails/html/inscribir_existente.ctp	inscribir_existente	inscripcion@lvstudioweb.com	\N	\N
41	MailShell	pagos_hoy	Manda un listado de los pagos de hoy	Pagos de hoy	Payments for today	/home/buenosai/public_html/lvstudio/app/View/Emails/html/pagos_hoy.ctp	pagos_hoy	administration@lvstudioweb.com	\N	\N
42	PersonasController	pregunta_estudiante_si_vuelve	Pregunta al estudiante si vuelve de su baja temporal	Retorno de su baja temporal	Return from your extended absence	/home/buenosai/public_html/lvstudio/app/View/Emails/html/pregunta_estudiante_si_vuelve.ctp	pregunta_estudiante_si_vuelve	Direccion del estudiante.	\N	\N
43	PagosController	cuotas_creadas	Notifica cuando se crean cuotas para un estudiante	Cuotas creadas	\N	/home/buenosai/public_html/lvstudio/app/View/Emails/html/cuotas_creadas.ctp	cuotas_creadas	administration@lvstudioweb.com	\N	\N
44	MailShell	inscriptos_recientes_sin_cuotas	Busca las personas que se hayan inscripto recientemente y que no tengan cuotas generadas	Inscriptos recientes sin cuotas	\N	/home/buenosai/public_html/lvstudio/app/View/Emails/html/inscriptos_recientes_sin_cuotas.ctp	inscriptos_recientes_sin_cuotas	administration@lvstudioweb.com	\N	\N
45	MailShell	profesor_clases_dia	Notifica a los profesores las clases del dia siguiente para dar	Clases de manana	Classes for tomorrow	/home/buenosai/public_html/lvstudio/app/View/Emails/html/profesor_clases_dia.ctp	profesor_clases_dia	Se envia a los profesores.	\N	\N
46	MailShell	clases_sin_tomar_lista_semanal	Notifica las clases que no tienen comentarios o el profesor no tomo lista en la semana	Clases sin comentarios o tomar lista semanal	\N	/home/buenosai/public_html/lvstudio/app/View/Emails/html/clases_sin_tomar_lista_semanal.ctp	clases_sin_tomar_lista_semanal	info@lvstudioweb.com	\N	\N
49	PagosController	inscripcion_empleado	Enviada cuando se confirma una inscripcion y se pidio no cobrar cuotas	Inscripcion confirmada para colaborador del Estudio	\N	/home/buenosai/public_html/lvstudio/app/View/Emails/html/inscripcion_empleado.ctp	inscripcion_empleado	elvi@lvstudioweb.com emily@lvstudioweb.com	\N	\N
50	MailShell	cambios_semana	Notifica de los cambios de toda la semana	Cambios de la semana		/home/buenosai/public_html/lvstudio/app/View/Emails/html/cambios_semana.ctp	cambios_semana	agustin@strellis.com.ar\\r\\ncambios@lvstudioweb.com	\N	\N
51	CursosController	notificacion_abasto	Notifica cuando hay un cambio de curso que involucra a LV-Abasto	Cambio en LV-Abasto	Change in LV-Abasto	/home/buenosai/public_html/lvstudio/app/View/Emails/html/cambios_abasto.ctp	cambios_abasto	elvi@lvstudioweb.com	\N	\N
52	MailShell	profesores_llenar_calendarios	Manda mensaje a los profesores pidiendo que llenen sus calendarios para la semana proxima	Por favor llenar sus calendarios	Please complete the calendars	/home/buenosai/public_html/lvstudio/app/View/Emails/html/profesores_llenar_calendarios.ctp	profesores_llenar_calendarios	Profesores	\N	\N
53	CursosController	notificacion_abasto	Notifica cuando hay un cambio de curso que involucra a LV-Abasto	Cambio en LV-Abasto	Change in LV-Abasto	/home/buenosai/public_html/lvstudio/app/View/Emails/html/cambios_abasto.ctp	cambios_abasto	elvi@lvstudioweb.com	\N	\N
54	CursosController	profesor_clases_semana	Enviada a los profesores desde el sistema con las clases de la semana	Clases de la semana	Classes for next week	/home/buenosai/public_html/lvstudio/app/View/Emails/html/profesor_clases_semana.ctp	profesor_clases_semana	Enviada a profesores segun su direccion	\N	\N
55	PersonasController	completar_datos_pre_inscripcion	Envia mensaje al estudiante solicitando complete datos de pre inscripcion	Completar datos de inscripcion	Complete your personal data	/home/buenosai/public_html/lvstudio/app/View/Emails/html/completar_datos_pre_inscripcion.ctp	completar_datos_pre_inscripcion	Se envia al mail del estudiante	\N	\N
56	ProfesoresController	disponibilidad_modificada	Notifica cuando el profesor modifica su disponibilidad	Disponibilidad de profesor modificada	Professor availability modified	/home/buenosai/public_html/lvstudio/app/View/Emails/html/disponibilidad_modificada.ctp	disponibilidad_modificada	info@lvstudioweb.com	\N	\N
57	InscripcionesController	pre_inscribir	Enviado cuando se recibe una pre inscripcion en el sistema	Pre-Inscripcion	Pre-Sign up	/home/buenosai/public_html/lvstudio/app/View/Emails/html/pre_inscribir.ctp	pre_inscribir	inscripcion@lvstudioweb.com	\N	\N
59	PersonasController	nuevo_comentario	Notifica sobre la edicion de comentarios para una persona.	Nuevo comentario	New comment	/home/buenosai/public_html/lvstudio/app/View/Emails/html/nuevo_comentario.ctp	nuevo_comentario	elvi@lvstudioweb.com\\r\\ncentral@lvstudioweb.com\\r\\nemily@lvstudioweb.com\\r\\njose@lvstudioweb.com	\N	\N
60	ProfesoresController	nuevo_comentario_profesor	Notifica sobre la edicion de comentarios para un profesor.	Nuevo comentario de Profesor	New comment for teacher	/home/buenosai/public_html/lvstudio/app/View/Emails/html/nuevo_comentario_profesor.ctp	nuevo_comentario_profesor	elvi@lvstudioweb.com\\r\\ncentral@lvstudioweb.com\\r\\nemily@lvstudioweb.com\\r\\njose@lvstudioweb.com	\N	\N
61	MailShell	comentarios_realizados	Notifica sobre los comentarios realizados.	Comentarios del dia	Comments for today	/home/buenosai/public_html/lvstudio/app/View/Emails/html/comentarios_realizados.ctp	comentarios_realizados	info2@lvstudioweb.com	\N	\N
62	CursosController	nuevo_comentario_curso	Notifica sobre la edicion de comentarios para un curso.	Nuevo comentario de Curso	New comment for course	/home/buenosai/public_html/lvstudio/app/View/Emails/html/nuevo_comentario_curso.ctp	nuevo_comentario_curso	elvi@lvstudioweb.com\\r\\ncentral@lvstudioweb.com\\r\\njose@lvstudioweb.com	\N	\N
63	MailShell	notificar_primer_dia_estudio	Notifica al estudio del primer dia de un grupo de estudiantes en sus cursos	Notificacion de primer dia	First day of course	/home/buenosai/public_html/lvstudio/app/View/Emails/html/primer_dia_estudio.ctp	primer_dia_estudio	administracion@lvstudioweb.com agustin@strellis.com.ar	\N	\N
\.


--
-- Name: notificaciones_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.notificaciones_seq', 64, false);


--
-- Data for Name: orientaciones; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
-- Name: orientaciones_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.orientaciones_seq', 8, false);


--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.pagos (id, persona_id, monto_pago, moneda_id, saldo_cuenta, persona_id_dual, tasa_cambio, fecha_pago, factura_nro, modo_pago, sucursal_id, user_id, comentarios) FROM stdin;
\.


--
-- Data for Name: pagos_parciales; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.pagos_parciales (id, cuota_id, cuota_id_dual, monto_pago, moneda_id, tasa_cambio, pago_id) FROM stdin;
\.


--
-- Name: pagos_parciales_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.pagos_parciales_seq', 1, false);


--
-- Name: pagos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.pagos_seq', 1, false);


--
-- Data for Name: perfil_profesores; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.perfil_profesores (id, descripcion) FROM stdin;
1	Freelance
2	Empleado
\.


--
-- Name: perfil_profesores_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.perfil_profesores_seq', 3, false);


--
-- Data for Name: persona_bajas; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.persona_bajas (id, persona_id, usuario_id_baja, fecha_baja, fecha_retorno, temporal, motivo_id, motivo_otro) FROM stdin;
\.


--
-- Name: persona_bajas_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.persona_bajas_seq', 1, false);


--
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.personas (id, estado_id, alumno_id, idioma_nativo_id, nacionalidad_id, email, direccion, telefono, nombre, apellido, fecha_nacimiento, pasaporte, ocupacion, facebook, skype, como_supo_id, como_supo_otros, tiempo_clases, motivo_estudio, comentarios, hizo_test_nivel, nivel_id, nivel_supuesto_estudiante_id, nivel_resultado_test_id, nombre_tutor, telefono_tutor, vinculo, idioma_estudiar_id, donde_estabas, picked_up_airport, accomodation_services, dropped_off_airport, agree, baja, baja_id, fecha_baja, temporal, fecha_retorno, motivo_id, motivo_otro, usuario_id_baja, despedida_enviada, saldo_cuenta, empleado, motivo_empleado, created, novedades, modified) FROM stdin;
19	4	\N	22	1	agustin@strellis.com.ar	1001 Chester Rd	4949	Kevin	Morley	1979-04-04	22				\N		1 dia		\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
30	4	\N	22	1	agustin@strellis.com.ar	Billinghurst	4949	Agustin	Villafane	1979-04-04	22				\N		1 dia		\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
34	4	\N	22	1	agustin@strellis.com.ar	Billinghurst	4949	Niels	Bohr	1979-04-04	22				\N		1 dia		\N	S	2	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
100	4	\N	22	1	agustin@strellis.com.ar	Pepe	4949	Jason	Cleland	1979-04-04	22	PEpe	Pepe	Pepe	1		1 dia	Pepe	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
130	4	\N	22	1	agustin@strellis.com.ar	Alemania	49	Werner	Heisenberg	1979-04-04	333	Fisico	Werner	werner	1		1 dia	Werner	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
133	4	\N	19	1	agustin@strellis.com.ar	Billinghurst	333	Karl	Fuchs	2013-02-17	333	333	3333	333	1		1 dia	333	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
136	4	\N	22	1	agustin@strellis.com.ar	Billinghurst	44	Marie	Curie	2013-02-17	33	33	33	33	1		1 dia	33	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
139	4	\N	22	1	agustin@strellis.com.ar	Pris	999	Pierre	Curie	1999-01-01	22	22	22	22	1		1 dia	22	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
146	4	\N	13	1	agustin@strellis.com.ar	Billinghurst	333	Paul	Dirac	2013-02-17	33	33	33	33	1		1 dia	333	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
150	4	\N	22	1	agustin@strellis.com.ar	Billinghurst	33	Max	Born	1970-01-01	3	3	3	3	1		1 dia	3	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
153	4	\N	3	12	agustin@strellis.com.ar	Billinghurst	3	Albert	Einstein	1879-01-01	3	3	3	3	1		1 dia	3	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
156	4	\N	1	1	agustin@strellis.com.ar	Billinghurst	333	James Clerk	Maxwell	1970-01-01	3	3	3	3	1		1 dia	3	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
162	4	\N	22	1	agustin@strellis.com.ar	Billinghurst	333	Karl	Gauss	1970-01-01	33	33	33	33	1		1 dia	33	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
165	4	\N	22	1	agustin@strellis.com.ar	Billinghurst	99	Karl	Weierstrass	1970-01-01	44	44	44	44	1		1 dia	44	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
168	4	\N	22	1	agustin@strellis.com.ar	Billinghurst	888	John	Nash	1980-01-01	333	333	33	333	1		1 dia	333	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
171	4	\N	22	1	agustin@strellis.com.ar	Billinghurst	888	Leonhard	Euler	1970-01-01	333	33	33	33	1		1 dia	33	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
174	4	\N	22	1	agustin@strellis.com.ar	Billinghurst	99	David	Bernoulli	1980-01-01	33	33	33	33	1		1 dia	33	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
177	4	\N	22	1	agustin@strellis.com.ar	Billinghurst	999	Augustin	Cauchy	1970-01-01	33	33	33	33	1		1 dia	33	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
180	4	\N	22	1	agustin@strellis.com.ar	England	3	Isaac	Newton	1970-01-01	33	33	33	33	1		1 dia	33	\N	S	1	1	\N				1	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
545	4	\N	22	1	agusvillafane@yahoo.com.ar	1001 Chester Rd	49632660	Kevin	Morley	2000-03-17	444	www	www	www	1		1 dia	www	\N	S	1	1	\N				2	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	1	0.00	0	\N	\N	f	\N
\.


--
-- Data for Name: personas_aud; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.personas_aud (id, rev, revtype, apellido, como_supo_otros, direccion, email, facebook, fecha_nacimiento, hizo_test_nivel, motivo_estudio, nombre, nombre_tutor, novedades, ocupacion, pasaporte, skype, telefono, telefono_tutor, tiempo_clases, vinculo, como_supo_id, estado_id, idioma_estudiar_id, idioma_nativo_id, nacionalidad_id, nivel_id, nivel_supuesto_estudiante_id, created, modified, baja, fecha_baja) FROM stdin;
8	9	0	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
10	11	0	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
13	14	0	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
16	17	0	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
19	20	0	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
19	22	1	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
26	27	0	Villafane		Billinghurst	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Agustin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
30	31	0	Villafane		Billinghurst	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Agustin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
30	33	1	Villafane		Billinghurst	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Agustin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
34	35	0	Bohr		Billinghurst	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Niels		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
34	37	1	Bohr		Billinghurst	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Niels		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
34	55	1	Bohr		Billinghurst	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Niels		f		22		4949		1 dia		\N	4	1	22	1	2	1	\N	\N	0	\N
34	57	1	Bohr		Billinghurst	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Niels		f		22		4949		1 dia		\N	4	1	22	1	2	1	\N	\N	0	\N
30	59	1	Villafane		Billinghurst	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Agustin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
19	61	1	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
34	63	1	Bohr		Billinghurst	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Niels		f		22		4949		1 dia		\N	4	1	22	1	2	1	\N	\N	0	\N
19	65	1	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
19	68	1	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
19	70	1	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
19	72	1	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
19	74	1	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
19	76	1	Morley		1001 Chester Rd	agustin@strellis.com.ar		1979-04-04 00:00:00	S		Kevin		f		22		4949		1 dia		\N	4	1	22	1	1	1	\N	\N	0	\N
81	82	0	Cleland		Canada	agustin@strellis.com.ar	Test	1970-10-20 00:00:00	S		Jason		f	Engineer	22	Test	4949		1 dia		1	4	1	37	1	1	1	\N	\N	0	\N
84	85	0	Cleland		Canada	agustin@strellis.com.ar	Test	1970-10-20 00:00:00	S		Jason		f	Engineer	22	Test	4949		1 dia		1	4	1	37	1	1	1	\N	\N	0	\N
87	88	0	Cleland		Canada	agustin@strellis.com.ar	Test	1970-10-20 00:00:00	S		Jason		f	Engineer	22	Test	4949		1 dia		1	4	1	37	1	1	1	\N	\N	0	\N
90	91	0	Cleland		Canada	agustin@strellis.com.ar	Test	1970-10-20 00:00:00	S		Jason		f	Engineer	22	Test	4949		1 dia		1	4	1	37	1	1	1	\N	\N	0	\N
93	94	0	Cleland		Canada	agustin@strellis.com.ar	Test	1970-10-20 00:00:00	S		Jason		f	Engineer	22	Test	4949		1 dia		1	4	1	37	1	1	1	\N	\N	0	\N
100	102	0	Cleland		Pepe	agustin@strellis.com.ar	Pepe	1979-04-04 00:00:00	S	Pepe	Jason		f	PEpe	22	Pepe	4949		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
130	132	0	Heisenberg		Alemania	agustin@strellis.com.ar	Werner	1979-04-04 00:00:00	S	Werner	Werner		f	Fisico	333	werner	49		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
133	135	0	Fuchs		Billinghurst	agustin@strellis.com.ar	3333	2013-02-17 00:00:00	S	333	Karl		f	333	333	333	333		1 dia		1	4	1	19	1	1	1	\N	\N	0	\N
136	138	0	Curie		Billinghurst	agustin@strellis.com.ar	33	2013-02-17 00:00:00	S	33	Marie		f	33	33	33	44		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
139	141	0	Curie		Pris	agustin@strellis.com.ar	22	1999-01-01 00:00:00	S	22	Pierre		f	22	22	22	999		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
146	148	0	Dirac		Billinghurst	agustin@strellis.com.ar	33	2013-02-17 00:00:00	S	333	Paul		f	33	33	33	333		1 dia		1	4	1	13	1	1	1	\N	\N	0	\N
150	152	0	Born		Billinghurst	agustin@strellis.com.ar	3	1970-01-01 00:00:00	S	3	Max		f	3	3	3	33		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
153	155	0	Einstein		Billinghurst	agustin@strellis.com.ar	3	1879-01-01 00:00:00	S	3	Albert		f	3	3	3	3		1 dia		1	4	1	3	12	1	1	\N	\N	0	\N
156	158	0	Maxwell		Billinghurst	agustin@strellis.com.ar	3	1970-01-01 00:00:00	S	3	James Clerk		f	3	3	3	333		1 dia		1	4	1	1	1	1	1	\N	\N	0	\N
162	164	0	Gauss		Billinghurst	agustin@strellis.com.ar	33	1970-01-01 00:00:00	S	33	Karl		f	33	33	33	333		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
165	167	0	Weierstrass		Billinghurst	agustin@strellis.com.ar	44	1970-01-01 00:00:00	S	44	Karl		f	44	44	44	99		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
168	170	0	Nash		Billinghurst	agustin@strellis.com.ar	33	1980-01-01 00:00:00	S	333	John		f	333	333	333	888		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
171	173	0	Euler		Billinghurst	agustin@strellis.com.ar	33	1970-01-01 00:00:00	S	33	Leonhard		f	33	333	33	888		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
174	176	0	Bernoulli		Billinghurst	agustin@strellis.com.ar	33	1980-01-01 00:00:00	S	33	David		f	33	33	33	99		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
177	179	0	Cauchy		Billinghurst	agustin@strellis.com.ar	33	1970-01-01 00:00:00	S	33	Augustin		f	33	33	33	999		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
180	182	0	Newton		England	agustin@strellis.com.ar	33	1970-01-01 00:00:00	S	33	Isaac		f	33	33	33	3		1 dia		1	4	1	22	1	1	1	\N	\N	0	\N
545	547	0	Morley		1001 Chester Rd	agusvillafane@yahoo.com.ar	www	2000-03-17 00:00:00	S	www	Kevin		f	www	444	www	49632660		1 dia		1	4	2	22	1	1	1	\N	\N	0	\N
\.


--
-- Name: personas_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.personas_seq', 1, false);


--
-- Data for Name: profesor_idiomas; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.profesor_idiomas (id, profesor_id, idioma_estudiar_id) FROM stdin;
281	502	2
282	502	1
\.


--
-- Name: profesor_idiomas_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.profesor_idiomas_seq', 282, true);


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.profesores (id, nombre, nacionalidad_id, idioma_nativo_id, idioma_estudiar_id, nivel_id, perfil_profesor_id, horario_empleado_actual, fecha_nacimiento, email, email_otro, celular, fecha_comienzo, disponibilidad, anos_experiencia, comentarios, facebook, telefono_fijo, resume, barrio, titulo_universitario, universidad, tefl, tefl_emisor, detalles_experiencia, gusto_profesor, edades, experiencia_clases, fecha_llegada_ba, fecha_partida_ba, personalidad, apariencia, impresion, trabajo_flores, sexo, salario_esperado, salario_empleado, accent_id, speech_id, interes_gramatica, dias_ocupados, por_que_ba, otros_lugares, direccion, mas, otros_comentarios, estilo_habla_id, reunion_orientacion, monotributista, photo, photo_dir, biografia, deshabilitado, created, fecha_baja, idiomanativo) FROM stdin;
502	Agustin Villafane	1	22	0	\N	1	\N	\N	webmaster@strellis.com.ar			2016-01-01			\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	""	""	\N	0	2016-07-10 00:41:56.878-03	\N	\N
\.


--
-- Name: profesores_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.profesores_seq', 271, true);


--
-- Data for Name: promocion_estudiantes; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.promocion_estudiantes (id, inscripcion_id, monto_descuento, moneda_descuento_id) FROM stdin;
\.


--
-- Name: promocion_estudiantes_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.promocion_estudiantes_seq', 1, false);


--
-- Data for Name: promociones; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.promociones (id, descripcion, fecha_inicio, fecha_fin, monto_descuento) FROM stdin;
\.


--
-- Name: promociones_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.promociones_seq', 1, false);


--
-- Data for Name: revinfo; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
\.


--
-- Data for Name: speeches; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.speeches (id, descripcion) FROM stdin;
1	Fast-paced
2	Neutral
3	Difficult to understand
4	Clear
5	Slurs
\.


--
-- Name: speeches_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.speeches_seq', 6, false);


--
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
-- Name: sucursales_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.sucursales_seq', 7, false);


--
-- Data for Name: tipo_cancelaciones; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
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
-- Name: tipo_cancelaciones_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.tipo_cancelaciones_seq', 8, false);


--
-- Data for Name: tipo_cursos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.tipo_cursos (id, descripcion, abreviatura, cant_minima_estudiantes) FROM stdin;
1	Individual	IND	1
2	Grupal	GRP	3
3	Dual	2	2
\.


--
-- Name: tipo_cursos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.tipo_cursos_seq', 4, false);


--
-- Data for Name: user_accesos; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.user_accesos (id, user_id, fecha_hora_evento, evento, ip, user_agent) FROM stdin;
1	1	2015-11-18 22:25:51-03	Entrada	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36
\.


--
-- Name: user_accesos_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.user_accesos_seq', 1, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: buenosai_lvstudi
--

COPY public.users (id, username, password, role, group_id, email, created, modified, enabled) FROM stdin;
541	admin	$2a$10$IBwMQfJ1XZgCOghTSN72Q.lx4ZDfTbGJlfPOCnyA9Hv4GHsX.Nkn2	\N	1		\N	\N	1
\.


--
-- Name: users_seq; Type: SEQUENCE SET; Schema: public; Owner: buenosai_lvstudi
--

SELECT pg_catalog.setval('public.users_seq', 30, false);


--
-- Name: accents accents_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.accents
    ADD CONSTRAINT accents_pkey PRIMARY KEY (id);


--
-- Name: acos acos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.acos
    ADD CONSTRAINT acos_pkey PRIMARY KEY (id);


--
-- Name: adjuntos adjuntos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.adjuntos
    ADD CONSTRAINT adjuntos_pkey PRIMARY KEY (id);


--
-- Name: aros_acos aros_acos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.aros_acos
    ADD CONSTRAINT aros_acos_pkey PRIMARY KEY (id);


--
-- Name: aros aros_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.aros
    ADD CONSTRAINT aros_pkey PRIMARY KEY (id);


--
-- Name: asistencias asistencias_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.asistencias
    ADD CONSTRAINT asistencias_pkey PRIMARY KEY (id);


--
-- Name: authorities authorities_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT authorities_pkey PRIMARY KEY (id);


--
-- Name: cambios cambios_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cambios
    ADD CONSTRAINT cambios_pkey PRIMARY KEY (id);


--
-- Name: cancelacion_estudiantes cancelacion_estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cancelacion_estudiantes
    ADD CONSTRAINT cancelacion_estudiantes_pkey PRIMARY KEY (id);


--
-- Name: cancelacion_profesores cancelacion_profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cancelacion_profesores
    ADD CONSTRAINT cancelacion_profesores_pkey PRIMARY KEY (id);


--
-- Name: cancelaciones cancelaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cancelaciones
    ADD CONSTRAINT cancelaciones_pkey PRIMARY KEY (id);


--
-- Name: carga_horarias_aud carga_horarias_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.carga_horarias_aud
    ADD CONSTRAINT carga_horarias_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: carga_horarias carga_horarias_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.carga_horarias
    ADD CONSTRAINT carga_horarias_pkey PRIMARY KEY (id);


--
-- Name: clase_cuotas clase_cuotas_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.clase_cuotas
    ADD CONSTRAINT clase_cuotas_pkey PRIMARY KEY (id);


--
-- Name: clase_cursos clase_cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.clase_cursos
    ADD CONSTRAINT clase_cursos_pkey PRIMARY KEY (id);


--
-- Name: clases_aud clases_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.clases_aud
    ADD CONSTRAINT clases_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: clases clases_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_pkey PRIMARY KEY (id);


--
-- Name: comentario_cursos comentario_cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.comentario_cursos
    ADD CONSTRAINT comentario_cursos_pkey PRIMARY KEY (id);


--
-- Name: comentario_profesores comentario_profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.comentario_profesores
    ADD CONSTRAINT comentario_profesores_pkey PRIMARY KEY (id);


--
-- Name: comentarios comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- Name: como_supos como_supos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.como_supos
    ADD CONSTRAINT como_supos_pkey PRIMARY KEY (id);


--
-- Name: constantes constantes_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.constantes
    ADD CONSTRAINT constantes_pkey PRIMARY KEY (id);


--
-- Name: cuotas cuotas_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cuotas
    ADD CONSTRAINT cuotas_pkey PRIMARY KEY (id);


--
-- Name: curso_ofrecidos curso_ofrecidos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.curso_ofrecidos
    ADD CONSTRAINT curso_ofrecidos_pkey PRIMARY KEY (id);


--
-- Name: curso_profesores curso_profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.curso_profesores
    ADD CONSTRAINT curso_profesores_pkey PRIMARY KEY (id);


--
-- Name: cursos_aud cursos_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cursos_aud
    ADD CONSTRAINT cursos_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: cursos_nombres_viejos cursos_nombres_viejos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cursos_nombres_viejos
    ADD CONSTRAINT cursos_nombres_viejos_pkey PRIMARY KEY (id);


--
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id);


--
-- Name: devoluciones devoluciones_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.devoluciones
    ADD CONSTRAINT devoluciones_pkey PRIMARY KEY (id);


--
-- Name: duracion_modos duracion_modos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.duracion_modos
    ADD CONSTRAINT duracion_modos_pkey PRIMARY KEY (id);


--
-- Name: estados estados_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- Name: extension_cursadas extension_cursadas_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.extension_cursadas
    ADD CONSTRAINT extension_cursadas_pkey PRIMARY KEY (id);


--
-- Name: extra_personas extra_personas_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.extra_personas
    ADD CONSTRAINT extra_personas_pkey PRIMARY KEY (id);


--
-- Name: extras extras_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.extras
    ADD CONSTRAINT extras_pkey PRIMARY KEY (id);


--
-- Name: feriados feriados_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.feriados
    ADD CONSTRAINT feriados_pkey PRIMARY KEY (id);


--
-- Name: group_permission group_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.group_permission
    ADD CONSTRAINT group_permission_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: honorario_asignados_aud honorario_asignados_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.honorario_asignados_aud
    ADD CONSTRAINT honorario_asignados_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: honorario_asignados honorario_asignados_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.honorario_asignados
    ADD CONSTRAINT honorario_asignados_pkey PRIMARY KEY (id);


--
-- Name: honorario_profesores_aud honorario_profesores_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.honorario_profesores_aud
    ADD CONSTRAINT honorario_profesores_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: honorario_profesores_historico honorario_profesores_historico_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.honorario_profesores_historico
    ADD CONSTRAINT honorario_profesores_historico_pkey PRIMARY KEY (id);


--
-- Name: honorario_profesores honorario_profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.honorario_profesores
    ADD CONSTRAINT honorario_profesores_pkey PRIMARY KEY (id);


--
-- Name: horario_cursos_aud horario_cursos_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.horario_cursos_aud
    ADD CONSTRAINT horario_cursos_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: horario_cursos horario_cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.horario_cursos
    ADD CONSTRAINT horario_cursos_pkey PRIMARY KEY (id);


--
-- Name: horario_profesor_empleado_renglones horario_profesor_empleado_renglones_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.horario_profesor_empleado_renglones
    ADD CONSTRAINT horario_profesor_empleado_renglones_pkey PRIMARY KEY (id);


--
-- Name: horario_profesor_empleados horario_profesor_empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.horario_profesor_empleados
    ADD CONSTRAINT horario_profesor_empleados_pkey PRIMARY KEY (id);


--
-- Name: horario_profesor_excepciones horario_profesor_excepciones_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.horario_profesor_excepciones
    ADD CONSTRAINT horario_profesor_excepciones_pkey PRIMARY KEY (id);


--
-- Name: horario_profesores horario_profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.horario_profesores
    ADD CONSTRAINT horario_profesores_pkey PRIMARY KEY (id);


--
-- Name: idioma_estudiares idioma_estudiares_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.idioma_estudiares
    ADD CONSTRAINT idioma_estudiares_pkey PRIMARY KEY (id);


--
-- Name: idioma_modalidades_aud idioma_modalidades_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.idioma_modalidades_aud
    ADD CONSTRAINT idioma_modalidades_aud_pkey PRIMARY KEY (rev, modalidad_curso_id, idioma_estudiar_id);


--
-- Name: idioma_modalidades idioma_modalidades_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.idioma_modalidades
    ADD CONSTRAINT idioma_modalidades_pkey PRIMARY KEY (id);


--
-- Name: idioma_nativos idioma_nativos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.idioma_nativos
    ADD CONSTRAINT idioma_nativos_pkey PRIMARY KEY (id);


--
-- Name: inscripciones_aud inscripciones_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.inscripciones_aud
    ADD CONSTRAINT inscripciones_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: inscripciones_individuales inscripciones_individuales_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.inscripciones_individuales
    ADD CONSTRAINT inscripciones_individuales_pkey PRIMARY KEY (id);


--
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (id);


--
-- Name: modalidad_curso_descripciones modalidad_curso_descripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_curso_descripciones
    ADD CONSTRAINT modalidad_curso_descripciones_pkey PRIMARY KEY (id);


--
-- Name: modalidad_cursos_aud modalidad_cursos_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_cursos_aud
    ADD CONSTRAINT modalidad_cursos_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: modalidad_cursos modalidad_cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_cursos
    ADD CONSTRAINT modalidad_cursos_pkey PRIMARY KEY (id);


--
-- Name: modalidad_disponibles_aud modalidad_disponibles_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_disponibles_aud
    ADD CONSTRAINT modalidad_disponibles_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: modalidad_disponibles modalidad_disponibles_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_disponibles
    ADD CONSTRAINT modalidad_disponibles_pkey PRIMARY KEY (id);


--
-- Name: modalidad_pagos modalidad_pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_pagos
    ADD CONSTRAINT modalidad_pagos_pkey PRIMARY KEY (id);


--
-- Name: monedas monedas_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.monedas
    ADD CONSTRAINT monedas_pkey PRIMARY KEY (id);


--
-- Name: motivos motivos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.motivos
    ADD CONSTRAINT motivos_pkey PRIMARY KEY (id);


--
-- Name: nacionalidades nacionalidades_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.nacionalidades
    ADD CONSTRAINT nacionalidades_pkey PRIMARY KEY (id);


--
-- Name: niveles niveles_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.niveles
    ADD CONSTRAINT niveles_pkey PRIMARY KEY (id);


--
-- Name: notificacion_enviadas notificacion_enviadas_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.notificacion_enviadas
    ADD CONSTRAINT notificacion_enviadas_pkey PRIMARY KEY (id);


--
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id);


--
-- Name: orientaciones orientaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.orientaciones
    ADD CONSTRAINT orientaciones_pkey PRIMARY KEY (id);


--
-- Name: pagos_parciales pagos_parciales_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.pagos_parciales
    ADD CONSTRAINT pagos_parciales_pkey PRIMARY KEY (id);


--
-- Name: pagos pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_pkey PRIMARY KEY (id);


--
-- Name: perfil_profesores perfil_profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.perfil_profesores
    ADD CONSTRAINT perfil_profesores_pkey PRIMARY KEY (id);


--
-- Name: persona_bajas persona_bajas_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.persona_bajas
    ADD CONSTRAINT persona_bajas_pkey PRIMARY KEY (id);


--
-- Name: personas_aud personas_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.personas_aud
    ADD CONSTRAINT personas_aud_pkey PRIMARY KEY (id, rev);


--
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- Name: profesor_idiomas profesor_idiomas_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.profesor_idiomas
    ADD CONSTRAINT profesor_idiomas_pkey PRIMARY KEY (id);


--
-- Name: profesores profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (id);


--
-- Name: promocion_estudiantes promocion_estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.promocion_estudiantes
    ADD CONSTRAINT promocion_estudiantes_pkey PRIMARY KEY (id);


--
-- Name: promociones promociones_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.promociones
    ADD CONSTRAINT promociones_pkey PRIMARY KEY (id);


--
-- Name: revinfo revinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.revinfo
    ADD CONSTRAINT revinfo_pkey PRIMARY KEY (rev);


--
-- Name: speeches speeches_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.speeches
    ADD CONSTRAINT speeches_pkey PRIMARY KEY (id);


--
-- Name: sucursales sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (id);


--
-- Name: tipo_cancelaciones tipo_cancelaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.tipo_cancelaciones
    ADD CONSTRAINT tipo_cancelaciones_pkey PRIMARY KEY (id);


--
-- Name: tipo_cursos tipo_cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.tipo_cursos
    ADD CONSTRAINT tipo_cursos_pkey PRIMARY KEY (id);


--
-- Name: user_accesos user_accesos_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.user_accesos
    ADD CONSTRAINT user_accesos_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: personas fk1a6a2647195dc75d; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT fk1a6a2647195dc75d FOREIGN KEY (idioma_nativo_id) REFERENCES public.idioma_nativos(id);


--
-- Name: personas fk1a6a26475457f10f; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT fk1a6a26475457f10f FOREIGN KEY (como_supo_id) REFERENCES public.como_supos(id);


--
-- Name: personas fk1a6a26475850a41d; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT fk1a6a26475850a41d FOREIGN KEY (idioma_estudiar_id) REFERENCES public.idioma_estudiares(id);


--
-- Name: personas fk1a6a264782f15a0; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT fk1a6a264782f15a0 FOREIGN KEY (nivel_supuesto_estudiante_id) REFERENCES public.niveles(id);


--
-- Name: personas fk1a6a26479c7ba82; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT fk1a6a26479c7ba82 FOREIGN KEY (nivel_id) REFERENCES public.niveles(id);


--
-- Name: personas fk1a6a2647a497f912; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT fk1a6a2647a497f912 FOREIGN KEY (nacionalidad_id) REFERENCES public.nacionalidades(id);


--
-- Name: personas fk1a6a2647bab03d64; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT fk1a6a2647bab03d64 FOREIGN KEY (estado_id) REFERENCES public.estados(id);


--
-- Name: group_permission fk362e6f8f34a4d62; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.group_permission
    ADD CONSTRAINT fk362e6f8f34a4d62 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: users fk6a68e0834a4d62; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk6a68e0834a4d62 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: modalidad_cursos fk6bdfaf6b2312bdd5; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_cursos
    ADD CONSTRAINT fk6bdfaf6b2312bdd5 FOREIGN KEY (carga_horaria_id) REFERENCES public.carga_horarias(id);


--
-- Name: modalidad_cursos fk6bdfaf6b3fd83ed9; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_cursos
    ADD CONSTRAINT fk6bdfaf6b3fd83ed9 FOREIGN KEY (modalidad_pago_id) REFERENCES public.modalidad_pagos(id);


--
-- Name: modalidad_cursos fk6bdfaf6b612c72f2; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_cursos
    ADD CONSTRAINT fk6bdfaf6b612c72f2 FOREIGN KEY (moneda_id) REFERENCES public.monedas(id);


--
-- Name: modalidad_cursos fk6bdfaf6bfd9fff7d; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_cursos
    ADD CONSTRAINT fk6bdfaf6bfd9fff7d FOREIGN KEY (duracion_modo_id) REFERENCES public.duracion_modos(id);


--
-- Name: profesor_idiomas fk78a7bce95850a41d; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.profesor_idiomas
    ADD CONSTRAINT fk78a7bce95850a41d FOREIGN KEY (idioma_estudiar_id) REFERENCES public.idioma_estudiares(id);


--
-- Name: profesor_idiomas fk78a7bce98c287472; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.profesor_idiomas
    ADD CONSTRAINT fk78a7bce98c287472 FOREIGN KEY (profesor_id) REFERENCES public.profesores(id);


--
-- Name: carga_horarias fk8e25c0902a89ce19; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.carga_horarias
    ADD CONSTRAINT fk8e25c0902a89ce19 FOREIGN KEY (tipo_curso_id) REFERENCES public.tipo_cursos(id);


--
-- Name: horario_cursos_aud fk_1aulgc7wwojin6xy0w0wkkx2j; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.horario_cursos_aud
    ADD CONSTRAINT fk_1aulgc7wwojin6xy0w0wkkx2j FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: carga_horarias_aud fk_1qwrd8kxv4apjol2drap7esij; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.carga_horarias_aud
    ADD CONSTRAINT fk_1qwrd8kxv4apjol2drap7esij FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: idioma_modalidades_aud fk_6kf0qotuk34q1uvfjk2v8dkgf; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.idioma_modalidades_aud
    ADD CONSTRAINT fk_6kf0qotuk34q1uvfjk2v8dkgf FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: honorario_profesores_aud fk_9i2oetm322exxbyfh1inafwmb; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.honorario_profesores_aud
    ADD CONSTRAINT fk_9i2oetm322exxbyfh1inafwmb FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: inscripciones_aud fk_ad8eijatikabigfj7kky97qh8; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.inscripciones_aud
    ADD CONSTRAINT fk_ad8eijatikabigfj7kky97qh8 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: clases_aud fk_aw3f116y28lxb9md212phxmoj; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.clases_aud
    ADD CONSTRAINT fk_aw3f116y28lxb9md212phxmoj FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: cursos_aud fk_cucnacq01pm0wejy8ghnx93vx; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cursos_aud
    ADD CONSTRAINT fk_cucnacq01pm0wejy8ghnx93vx FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: modalidad_cursos_aud fk_f0ldl7fih18onrmjpqerx0qfc; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_cursos_aud
    ADD CONSTRAINT fk_f0ldl7fih18onrmjpqerx0qfc FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: personas_aud fk_o8sd9t20b9tblxktnylvftjvo; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.personas_aud
    ADD CONSTRAINT fk_o8sd9t20b9tblxktnylvftjvo FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: modalidad_disponibles_aud fk_rsweuhcmbccuupghdyy6v01ly; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_disponibles_aud
    ADD CONSTRAINT fk_rsweuhcmbccuupghdyy6v01ly FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: honorario_asignados_aud fk_t1jviv80h8iummbpxrhmv3q67; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.honorario_asignados_aud
    ADD CONSTRAINT fk_t1jviv80h8iummbpxrhmv3q67 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: idioma_modalidades fka56a602f5850a41d; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.idioma_modalidades
    ADD CONSTRAINT fka56a602f5850a41d FOREIGN KEY (idioma_estudiar_id) REFERENCES public.idioma_estudiares(id);


--
-- Name: clases fkaf0f8449612c72f2; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT fkaf0f8449612c72f2 FOREIGN KEY (moneda_id) REFERENCES public.monedas(id);


--
-- Name: clases fkaf0f84497433c42; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT fkaf0f84497433c42 FOREIGN KEY (curso_id) REFERENCES public.cursos(id);


--
-- Name: clases fkaf0f84498c287472; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT fkaf0f84498c287472 FOREIGN KEY (profesor_id) REFERENCES public.profesores(id);


--
-- Name: clases fkaf0f8449bc4da4b2; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT fkaf0f8449bc4da4b2 FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


--
-- Name: cursos fkaf9613572a89ce19; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT fkaf9613572a89ce19 FOREIGN KEY (tipo_curso_id) REFERENCES public.tipo_cursos(id);


--
-- Name: cursos fkaf9613575850a41d; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT fkaf9613575850a41d FOREIGN KEY (idioma_estudiar_id) REFERENCES public.idioma_estudiares(id);


--
-- Name: cursos fkaf9613579c7ba82; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT fkaf9613579c7ba82 FOREIGN KEY (nivel_id) REFERENCES public.niveles(id);


--
-- Name: cursos fkaf961357bc4da4b2; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT fkaf961357bc4da4b2 FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


--
-- Name: profesores fkb7db301823f18d84; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT fkb7db301823f18d84 FOREIGN KEY (idiomanativo) REFERENCES public.idioma_nativos(id);


--
-- Name: profesores fkb7db30189c7ba82; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT fkb7db30189c7ba82 FOREIGN KEY (nivel_id) REFERENCES public.niveles(id);


--
-- Name: profesores fkb7db3018a497f912; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT fkb7db3018a497f912 FOREIGN KEY (nacionalidad_id) REFERENCES public.nacionalidades(id);


--
-- Name: inscripciones fkf2b00ff72ffcedda; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT fkf2b00ff72ffcedda FOREIGN KEY (curso_id) REFERENCES public.cursos(id);


--
-- Name: inscripciones fkf2b00ff75850a41d; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT fkf2b00ff75850a41d FOREIGN KEY (idioma_estudiar_id) REFERENCES public.idioma_estudiares(id);


--
-- Name: inscripciones fkf2b00ff78df2f022; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT fkf2b00ff78df2f022 FOREIGN KEY (orientacion_id) REFERENCES public.orientaciones(id);


--
-- Name: inscripciones fkf2b00ff79c7ba82; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT fkf2b00ff79c7ba82 FOREIGN KEY (nivel_id) REFERENCES public.niveles(id);


--
-- Name: inscripciones fkf2b00ff7a913d45b; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT fkf2b00ff7a913d45b FOREIGN KEY (modalidad_curso_id) REFERENCES public.modalidad_cursos(id);


--
-- Name: inscripciones fkf2b00ff7dca069ab; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT fkf2b00ff7dca069ab FOREIGN KEY (profesor_posible_id) REFERENCES public.profesores(id);


--
-- Name: inscripciones fkf2b00ff7fc0c4042; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT fkf2b00ff7fc0c4042 FOREIGN KEY (persona_id) REFERENCES public.personas(id);


--
-- Name: modalidad_disponibles fkf9ae206c7433c42; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_disponibles
    ADD CONSTRAINT fkf9ae206c7433c42 FOREIGN KEY (curso_id) REFERENCES public.cursos(id);


--
-- Name: modalidad_disponibles fkf9ae206ca913d45b; Type: FK CONSTRAINT; Schema: public; Owner: buenosai_lvstudi
--

ALTER TABLE ONLY public.modalidad_disponibles
    ADD CONSTRAINT fkf9ae206ca913d45b FOREIGN KEY (modalidad_curso_id) REFERENCES public.modalidad_cursos(id);
create table users_AUD (
        id int4 not null,
        REV int4 not null,
        REVTYPE int2,
        enabled int4,
        password varchar(255),
        username varchar(255),
        group_id int4,
        primary key (id, REV)
    );
alter table users_AUD
        add constraint FK_e8r4q22dh138c5f4mvlsieff5
        foreign key (REV)
        references REVINFO;
ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id);