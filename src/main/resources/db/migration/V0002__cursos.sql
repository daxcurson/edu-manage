CREATE TABLE public.cursos
(
    id integer NOT NULL,
    codigo_curso character varying(200) NOT NULL,
    descripcion_curso character varying(200) NOT NULL,
    fecha_comienzo date,
    fecha_fin date,
    fecha_baja date,
    tipo_curso_id integer,
    idioma_estudiar_id integer,
    nivel_id integer,
    sucursal_id integer,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.cursos
    OWNER to edumanage;