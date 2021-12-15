--Varstopaikkataulun ja sekvenssin luominen
CREATE SEQUENCE public.varastopaikka_varastopaikan_id_seq;

CREATE TABLE public.varastopaikka (
                varastopaikanID INTEGER NOT NULL DEFAULT nextval('public.varastopaikka_varastopaikan_id_seq'),
                varastopaikan_nimi VARCHAR NOT NULL,
                kptilinumero VARCHAR NOT NULL,
                CONSTRAINT varastopaikka_pk PRIMARY KEY (varastopaikanID)
);


ALTER SEQUENCE public.varastopaikka_varastopaikan_id_seq OWNED BY public.varastopaikka.varastopaikanID;


CREATE SEQUENCE public.hyllypaikka_hyllypaikka_id_seq;

CREATE TABLE public.hyllypaikka (
                hyllypaikkaID INTEGER NOT NULL DEFAULT nextval('public.hyllypaikka_hyllypaikka_id_seq'),
                vali INTEGER NOT NULL,
                taso VARCHAR NOT NULL,
                hyllynnumero INTEGER NOT NULL,
                varastopaikanID INTEGER NOT NULL,
                CONSTRAINT hyllypaikka_pk PRIMARY KEY (hyllypaikkaID)
);


ALTER SEQUENCE public.hyllypaikka_hyllypaikka_id_seq OWNED BY public.hyllypaikka.hyllypaikkaID;

CREATE SEQUENCE public.varastotapahtuma_id_seq;

CREATE TABLE public.varastotapahtuma (
                id INTEGER NOT NULL DEFAULT nextval('public.varastotapahtuma_id_seq'),
                asiakasnumero INTEGER NOT NULL,
                yksilointikoodi INTEGER NOT NULL,
                maara REAL NOT NULL,
                yksikko VARCHAR NOT NULL,
                hyllypaikkaID INTEGER NOT NULL,
                kohdevarastoID INTEGER NOT NULL,
                lahdevarastoID INTEGER NOT NULL,
                paivamaara DATE NOT NULL,
                CONSTRAINT varastotapahtuma_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.varastotapahtuma_id_seq OWNED BY public.varastotapahtuma.id;


ALTER TABLE public.varastotapahtuma ADD CONSTRAINT varastopaikka_varastotapahtuma_fk
FOREIGN KEY (kohdevarastoID)
REFERENCES public.varastopaikka (varastopaikanID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.varastotapahtuma ADD CONSTRAINT varastopaikka_varastotapahtuma_fk1
FOREIGN KEY (lahdevarastoID)
REFERENCES public.varastopaikka (varastopaikanID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.hyllypaikka ADD CONSTRAINT varastopaikka_hyllypaikka_fk
FOREIGN KEY (varastopaikanID)
REFERENCES public.varastopaikka (varastopaikanID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.varastotapahtuma ADD CONSTRAINT hyllypaikka_varastotapahtuma_fk
FOREIGN KEY (hyllypaikkaID)
REFERENCES public.hyllypaikka (hyllypaikkaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.varastotapahtuma ADD CONSTRAINT tuote_varastotapahtuma_fk
FOREIGN KEY (yksilointikoodi)
REFERENCES public.tuote (yksilointikoodi)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.varastotapahtuma ADD CONSTRAINT asiakas_varastotapahtuma_fk
FOREIGN KEY (asiakasnumero)
REFERENCES public.asiakas (asiakasnumero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;