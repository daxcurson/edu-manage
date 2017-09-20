    create table REVINFO (
        REV integer not null auto_increment,
        REVTSTMP bigint,
        primary key (REV)
    );

    create table carga_horarias_AUD (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        descripcion varchar(255),
        dias_semana integer,
        horas_clase float,
        horas_semanales varchar(255),
        tipo_curso_id integer,
        primary key (id, REV)
    );

    create table clases_AUD (
        id integer not null,
        REV integer not null,
        REVTYPE tinyint,
        book_pages varchar(255),
        cancelada integer,
        comentarios varchar(255),
        communication varchar(255),
        domicilio_clase varchar(255),
        fecha_clase datetime,
        grammar varchar(255),
        homework varchar(255),
        mostrar_cancelada integer,
        no_recuperar integer,
        precio_por_hora double precision,
        suggestions varchar(255),
        vocabulary varchar(255),
        curso_id integer,
        moneda_id integer,
        profesor_id bigint,
        sucursal_id integer,
        primary key (id, REV)
    );

    create table cursos_AUD (
        es_paquete integer not null,
        id integer not null,
        REV integer not null,
        REVTYPE tinyint,
        abierto varchar(255),
        baja integer,
        codigo_curso varchar(255),
        descripcion_curso varchar(255),
        fecha_baja datetime,
        fecha_comienzo datetime,
        fecha_fin datetime,
        horario_curso varchar(255),
        inscriptos integer,
        intensivo boolean,
        idioma_estudiar_id integer,
        nivel_id integer,
        sucursal_id integer,
        tipo_curso_id integer,
        primary key (id, REV)
    );

    create table idioma_modalidades_AUD (
        REV integer not null,
        modalidad_curso_id bigint not null,
        idioma_estudiar_id integer not null,
        REVTYPE tinyint,
        primary key (REV, modalidad_curso_id, idioma_estudiar_id)
    );

    create table inscripciones_AUD (
        tipo varchar(31) not null,
        id integer not null,
        REV integer not null,
        REVTYPE tinyint,
        baja integer,
        borrada integer,
        confirmada integer,
        empleado integer,
        fecha_baja datetime,
        fecha_comienzo datetime,
        fecha_finalizacion datetime,
        fecha_inscripcion datetime,
        curso_id integer,
        estado_id integer,
        modalidad_curso_id bigint,
        persona_id integer,
        clases_semanales integer,
        cual_examen varchar(20),
        horas_clase varchar(30),
        materia varchar(60),
        orientacion_id integer,
        profesor_posible_id integer,
        sucursal_id integer,
        otra_orientacion varchar(40),
        dias_preferidos varchar(60),
        dias_alternativos varchar(60),
        horario_preferido varchar(60),
        horario_alternativo varchar(60),
        sexo_profesor varchar(10),
        preferencia_idioma varchar(30),
        idioma_estudiar_id integer,
        nivel_id bigint,
        primary key (id, REV)
    );
    
    create table modalidad_cursos_AUD (
        id bigint not null,
        REV integer not null,
        REVTYPE tinyint,
        abreviatura varchar(255),
        descripcion varchar(255),
        duracion_cantidad integer,
        es_extra boolean,
        precio_unidad_modalidad float,
        carga_horaria_id bigint,
        duracion_modo_id bigint,
        modalidad_pago_id integer,
        moneda_id integer,
        primary key (id, REV)
    );

    create table personas_AUD (
        id integer not null,
        REV integer not null,
        REVTYPE tinyint,
        apellido varchar(255),
        como_supo_otros varchar(255),
        direccion varchar(255),
        email varchar(255),
        facebook varchar(255),
        fecha_nacimiento datetime,
        hizo_test_nivel varchar(255),
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
        como_supo_id bigint,
        estado_id integer,
        idioma_estudiar_id integer,
        idioma_nativo_id bigint,
        nacionalidad_id bigint,
        nivel_id integer,
        nivel_supuesto_estudiante_id integer,
        primary key (id, REV)
    );
ALTER TABLE `inscripciones` CHANGE `curso_id` `curso_id` INT(11) NULL;
ALTER TABLE `inscripciones` CHANGE `modalidad_curso_id` `modalidad_curso_id` INT(11) NULL;
