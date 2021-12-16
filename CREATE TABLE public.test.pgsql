CREATE TABLE public.test (
                testid INTEGER NOT NULL DEFAULT nextval('public.varastopaikka_varastopaikan_id_seq'),
                testname VARCHAR NOT NULL,
                CONSTRAINT testid_pk PRIMARY KEY (testid)
);
