-- Table: public.varastotapahtuma

-- DROP TABLE public.varastotapahtuma;

CREATE TABLE IF NOT EXISTS public.varastotapahtuma
(
    id integer NOT NULL DEFAULT nextval('varastotapahtuma_id_seq'::regclass),
    asiakasnumero integer NOT NULL,
    yksilointikoodi integer NOT NULL,
    maara real NOT NULL,
    yksikko character varying COLLATE pg_catalog."default" NOT NULL,
    hyllypaikkaid integer NOT NULL,
    kohdevarastoid integer NOT NULL,
    lahdevarastoid integer NOT NULL,
    paivamaara date NOT NULL,
    CONSTRAINT varastotapahtuma_pk PRIMARY KEY (id),
    CONSTRAINT asiakas_varastotapahtuma_fk FOREIGN KEY (asiakasnumero)
        REFERENCES public.asiakas (asiakasnumero) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT hyllypaikka_varastotapahtuma_fk FOREIGN KEY (hyllypaikkaid)
        REFERENCES public.hyllypaikka (hyllypaikkaid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT tuote_varastotapahtuma_fk FOREIGN KEY (yksilointikoodi)
        REFERENCES public.tuote (yksilointikoodi) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT varastopaikka_varastotapahtuma_fk FOREIGN KEY (kohdevarastoid)
        REFERENCES public.varastopaikka (varastopaikanid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT varastopaikka_varastotapahtuma_fk1 FOREIGN KEY (lahdevarastoid)
        REFERENCES public.varastopaikka (varastopaikanid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.varastotapahtuma
    OWNER to postgres;


CREATE SEQUENCE public.varastotapahtuma_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.varastotapahtuma_id_seq
    OWNER TO postgres;