-- Table: public.credit_card

-- DROP TABLE public.credit_card;

CREATE TABLE IF NOT EXISTS public.credit_card
(
    card character varying(20) COLLATE pg_catalog."default" NOT NULL,
    cardholder_id integer,
    CONSTRAINT credit_card_pkey PRIMARY KEY (card),
    CONSTRAINT fk_cardholder_id FOREIGN KEY (cardholder_id)
        REFERENCES public.card_holder (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
-- Table: public.credit_card

-- DROP TABLE public.credit_card;

CREATE TABLE IF NOT EXISTS public.credit_card
(
    card character varying(20) COLLATE pg_catalog."default" NOT NULL,
    cardholder_id integer,
    CONSTRAINT credit_card_pkey PRIMARY KEY (card),
    CONSTRAINT fk_cardholder_id FOREIGN KEY (cardholder_id)
        REFERENCES public.card_holder (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

-- Table: public.merchant

-- DROP TABLE public.merchant;

CREATE TABLE IF NOT EXISTS public.merchant
(
    id integer NOT NULL,
    name character varying(40) COLLATE pg_catalog."default",
    id_merchant_category integer,
    CONSTRAINT merchant_pkey PRIMARY KEY (id),
    CONSTRAINT fk_merchant_category FOREIGN KEY (id_merchant_category)
        REFERENCES public.merchant_category (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

-- Table: public.merchant_category

-- DROP TABLE public.merchant_category;

CREATE TABLE IF NOT EXISTS public.merchant_category
(
    id integer NOT NULL,
    name character varying(40) COLLATE pg_catalog."default",
    CONSTRAINT merchant_category_pkey PRIMARY KEY (id)
)

-- Table: public.transactions

-- DROP TABLE public.transactions;


CREATE TABLE IF NOT EXISTS public.transactions
(
    id integer NOT NULL,
    date timestamp without time zone,
    amount double precision,
    card character varying(20) COLLATE pg_catalog."default",
    id_merchant integer,
    CONSTRAINT transactions_pkey PRIMARY KEY (id),
    CONSTRAINT fk_card FOREIGN KEY (card)
        REFERENCES public.credit_card (card) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_merchant FOREIGN KEY (id_merchant)
        REFERENCES public.merchant (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)