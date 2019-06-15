-- Table: public.event

-- DROP TABLE public.event;

CREATE TABLE public.event
(
    id integer NOT NULL DEFAULT nextval('event_id_seq'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    teacher_id integer NOT NULL,
    CONSTRAINT event_pkey PRIMARY KEY (id),
    CONSTRAINT teacher_id FOREIGN KEY (teacher_id)
        REFERENCES public.teacher (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.event
    OWNER to postgres;

-- Table: public.participant

-- DROP TABLE public.participant;

CREATE TABLE public.participant
(
    id integer NOT NULL DEFAULT nextval('participant_id_seq'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    event_id integer NOT NULL,
    student_id integer NOT NULL,
    CONSTRAINT participant_pkey PRIMARY KEY (id),
    CONSTRAINT event_id FOREIGN KEY (event_id)
        REFERENCES public.event (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT student_id FOREIGN KEY (student_id)
        REFERENCES public.student (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.participant
    OWNER to postgres;


-- Table: public.student

-- DROP TABLE public.student;

CREATE TABLE public.student
(
    id integer NOT NULL DEFAULT nextval('students_id_seq'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    first_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT students_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.student
    OWNER to postgres;


-- Table: public.teacher

-- DROP TABLE public.teacher;

CREATE TABLE public.teacher
(
    id integer NOT NULL DEFAULT nextval('teachers_id_seq'::regclass) ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    first_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT teachers_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.teacher
    OWNER to postgres;
