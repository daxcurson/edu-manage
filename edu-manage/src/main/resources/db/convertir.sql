create table REVINFO (
        REV int4 not null,
        REVTSTMP int8,
        primary key (REV)
    );
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

create table cuotas_AUD (
        es_matricula int4 not null,
        id int4 not null,
        REV int4 not null,
        REVTYPE int2,
        comentarios varchar(255),
        confirmado int4,
        descripcion varchar(255),
        fecha_desde timestamp,
        fecha_hasta timestamp,
        fecha_vencimiento timestamp,
        monto_pagar float8,
        saldo_pagar float8,
        curso_id int4,
        extension_cursada_id int4,
        inscripcion_id int4,
        moneda_id int4,
        persona_id int4,
        motivo varchar(255),
        primary key (id, REV)
    );
alter table cuotas_AUD 
        add constraint FK_9ucdg70y9l8xtylgak5xpkrla 
        foreign key (REV) 
        references REVINFO;
alter table cuotas_AUD owner to buenosai_lvstudi;
create table cursos_AUD (
        es_paquete int4 not null,
        id int4 not null,
        REV int4 not null,
        REVTYPE int2,
        abierto varchar(255),
        baja int4,
        codigo_curso varchar(255),
        descripcion_curso varchar(255),
        fecha_baja timestamp,
        fecha_comienzo timestamp,
        fecha_fin timestamp,
        horario_curso varchar(255),
        inscriptos int4,
        intensivo boolean,
        idioma_estudiar_id int4,
        nivel_id int4,
        sucursal_id int4,
        tipo_curso_id int4,
        libro varchar(255),
        primary key (id, REV)
    );
create table honorario_asignados_AUD (
        id int8 not null,
        REV int4 not null,
        REVTYPE int2,
        fecha_asignacion timestamp,
        fecha_desde timestamp,
        precio_por_hora float8,
        honorario_profesor_id int8,
        moneda_id int4,
        profesor_id int8,
        primary key (id, REV)
    );
create table honorario_profesores_AUD (
        id int8 not null,
        REV int4 not null,
        REVTYPE int2,
        cambios int4,
        descripcion varchar(255),
        especial int4,
        fecha_desde timestamp,
        otro_honorario float8,
        precio_por_hora float8,
        idioma_estudiar_id int4,
        moneda_id int4,
        primary key (id, REV)
    );
create table honorario_profesores_honorario_asignados_AUD (
        REV int4 not null,
        honorario_profesores_id int8 not null,
        asignaciones_id int8 not null,
        REVTYPE int2,
        primary key (REV, honorario_profesores_id, asignaciones_id)
    );
create table horario_cursos_AUD (
        id int8 not null,
        REV int4 not null,
        REVTYPE int2,
        dia_semana varchar(255),
        fecha_desde timestamp,
        fecha_hasta timestamp,
        hora_fin bytea,
        hora_inicio bytea,
        precio_por_hora float8,
        curso_id int4,
        honorario_profesor_id int8,
        moneda_id int4,
        profesor_id int8,
        sucursal_id int4,
        primary key (id, REV)
    );
create table idioma_modalidades_AUD (
        REV int4 not null,
        modalidad_curso_id int8 not null,
        idioma_estudiar_id int4 not null,
        REVTYPE int2,
        primary key (REV, modalidad_curso_id, idioma_estudiar_id)
    );
create table inscripciones_AUD (
        tipo varchar(31) not null,
        id int4 not null,
        REV int4 not null,
        REVTYPE int2,
        baja int4,
        borrada int4,
        confirmada int4,
        created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        empleado int4,
        fecha_baja timestamp,
        fecha_comienzo timestamp,
        fecha_finalizacion timestamp,
        fecha_inscripcion timestamp,
        modified timestamp,
        curso_id int4,
        estado_id int4,
        modalidad_curso_id int8,
        persona_id int4,
        clases_semanales int4,
        cual_examen varchar(255),
        dias_alternativos varchar(255),
        dias_preferidos varchar(255),
        horario_alternativo varchar(255),
        horario_preferido varchar(255),
        horas_clase varchar(255),
        materia varchar(255),
        otra_orientacion varchar(255),
        preferencia_idioma varchar(255),
        sexo_profesor varchar(255),
        idioma_estudiar_id int4,
        nivel_id int4,
        orientacion_id int8,
        profesor_posible_id int8,
        sucursal_id int4,
        lista_espera int4,
        primary key (id, REV)
    );
create table modalidad_cursos_AUD (
        id int8 not null,
        REV int4 not null,
        REVTYPE int2,
        abreviatura varchar(255),
        descripcion varchar(255),
        duracion_cantidad int4,
        es_extra boolean,
        precio_unidad_modalidad float4,
        carga_horaria_id int8,
        duracion_modo_id int8,
        modalidad_pago_id int4,
        moneda_id int4,
        primary key (id, REV)
    );
create table modalidad_disponibles_AUD (
        id int8 not null,
        REV int4 not null,
        REVTYPE int2,
        precio_unidad_modalidad float4,
        curso_id int4,
        modalidad_curso_id int8,
        moneda_id int4,
        primary key (id, REV)
    );
create table personas_AUD (
        id int4 not null,
        REV int4 not null,
        REVTYPE int2,
        apellido varchar(255),
        baja int4,
        como_supo_otros varchar(255),
        created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        direccion varchar(255),
        email varchar(255),
        facebook varchar(255),
        fecha_baja timestamp,
        fecha_nacimiento timestamp,
        hizo_test_nivel varchar(255),
        modified timestamp,
        motivo_estudio varchar(255),
        nombre varchar(255),
        nombre_tutor varchar(255),
        novedades boolean,
        ocupacion varchar(255),
        pasaporte varchar(255),
        skype varchar(255),
        telefono varchar(255),
        telefono_tutor varchar(255),
        tiempo_clases varchar(255),
        vinculo varchar(255),
        como_supo_id int8,
        estado_id int4,
        idioma_estudiar_id int4,
        idioma_nativo_id int8,
        nacionalidad_id int8,
        nivel_id int4,
        nivel_supuesto_estudiante_id int4,
        primary key (id, REV)
    );
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
alter table carga_horarias_AUD 
        add constraint FK_1qwrd8kxv4apjol2drap7esij 
        foreign key (REV) 
        references REVINFO;
alter table clases_AUD 
        add constraint FK_aw3f116y28lxb9md212phxmoj 
        foreign key (REV) 
        references REVINFO;
alter table cuotas_AUD 
        add constraint FK_9ucdg70y9l8xtylgak5xpkrla 
        foreign key (REV) 
        references REVINFO;
alter table cursos_AUD 
        add constraint FK_cucnacq01pm0wejy8ghnx93vx 
        foreign key (REV) 
        references REVINFO;
alter table honorario_asignados_AUD 
        add constraint FK_t1jviv80h8iummbpxrhmv3q67 
        foreign key (REV) 
        references REVINFO;
alter table honorario_profesores_AUD 
        add constraint FK_9i2oetm322exxbyfh1inafwmb 
        foreign key (REV) 
        references REVINFO;
alter table honorario_profesores_honorario_asignados_AUD 
        add constraint FK_p5u1ulmv9ldcny0e30u4vmqjv 
        foreign key (REV) 
        references REVINFO;
alter table horario_cursos_AUD 
        add constraint FK_1aulgc7wwojin6xy0w0wkkx2j 
        foreign key (REV) 
        references REVINFO;
alter table idioma_modalidades_AUD 
        add constraint FK_6kf0qotuk34q1uvfjk2v8dkgf 
        foreign key (REV) 
        references REVINFO;
alter table inscripciones_AUD 
        add constraint FK_ad8eijatikabigfj7kky97qh8 
        foreign key (REV) 
        references REVINFO;
alter table modalidad_cursos_AUD 
        add constraint FK_f0ldl7fih18onrmjpqerx0qfc 
        foreign key (REV) 
        references REVINFO;
alter table modalidad_disponibles_AUD 
        add constraint FK_rsweuhcmbccuupghdyy6v01ly 
        foreign key (REV) 
        references REVINFO;
alter table personas_AUD 
        add constraint FK_o8sd9t20b9tblxktnylvftjvo 
        foreign key (REV) 
        references REVINFO;
alter table users_AUD
        add constraint FK_e8r4q22dh138c5f4mvlsieff5
        foreign key (REV)
        references REVINFO;