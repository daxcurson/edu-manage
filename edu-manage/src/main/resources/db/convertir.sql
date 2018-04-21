ALTER TABLE  groups CHANGE  name  group_name VARCHAR( 100 ) NOT NULL;
alter table users add enabled integer not null default 1;
CREATE SEQUENCE group_permission_seq
    INCREMENT 1
    START 4
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE group_permission_seq
    OWNER TO buenosai_lvstudi;
CREATE TABLE group_permission
(
    id integer NOT NULL DEFAULT nextval('group_permission_seq'::regclass),
    group_id bigint NOT NULL,
    authority character varying(50) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE group_permission
    OWNER to buenosai_lvstudi;

CREATE SEQUENCE hibernate_sequence
    INCREMENT 1
    START 564
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE hibernate_sequence
    OWNER TO buenosai_lvstudi;

CREATE TABLE carga_horarias_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    descripcion character varying(255),
    dias_semana integer,
    horas_clase real,
    horas_semanales character varying(255),
    tipo_curso_id integer
);


ALTER TABLE carga_horarias_aud OWNER TO buenosai_lvstudi;
CREATE TABLE clases_aud (
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


ALTER TABLE clases_aud OWNER TO buenosai_lvstudi;
