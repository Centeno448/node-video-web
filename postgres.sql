CREATE TABLE public.person
(
    id integer NOT NULL DEFAULT nextval('person_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT person_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;


CREATE TABLE public.purchase
(
    id integer NOT NULL DEFAULT nextval('purchase_id_seq'::regclass),
    person_id integer NOT NULL,
    amount numeric NOT NULL,
    CONSTRAINT purchase_pkey PRIMARY KEY (id),
    CONSTRAINT fk_person_purchase FOREIGN KEY (person_id)
        REFERENCES public.person (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;