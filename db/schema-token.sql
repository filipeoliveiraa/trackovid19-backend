-- This script was generated by a beta version of the Schema Diff utility in pgAdmin 4.
-- This version does not include dependency resolution, and may require manual changes
-- to the script to ensure changes are applied in the correct order.
-- Please report an issue for any failure with the reproduction steps.
BEGIN;
CREATE TABLE public.entity
(
    id integer NOT NULL DEFAULT nextval('entity_id_seq'::regclass),
    created_at date NOT NULL,
    parent_entity_id integer,
    entity_type integer NOT NULL,
    CONSTRAINT entity_pkey PRIMARY KEY (id),
    CONSTRAINT entity_type_fk FOREIGN KEY (entity_type)
        REFERENCES public.entity_type (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.entity
    OWNER to postgres;

CREATE TABLE public.token
(
    token character varying(10) COLLATE pg_catalog."default" NOT NULL,
    used boolean NOT NULL DEFAULT false,
    "usedAt" date,
    "createdAt" date NOT NULL,
    entity integer NOT NULL,
    CONSTRAINT token_pkey PRIMARY KEY (token),
    CONSTRAINT entity_fk FOREIGN KEY (entity)
        REFERENCES public.entity (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.token
    OWNER to postgres;

CREATE TABLE public.entity_type
(
    id integer NOT NULL DEFAULT nextval('entity_type_id_seq'::regclass),
    type entitytype NOT NULL,
    CONSTRAINT "entity_type_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.entity_type
    OWNER to postgres;


END;
