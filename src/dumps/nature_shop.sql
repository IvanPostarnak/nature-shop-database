--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    brand_id integer NOT NULL,
    name text NOT NULL,
    description text,
    company_id integer NOT NULL,
    CONSTRAINT chk_brand_description CHECK ((description <> ''::text)),
    CONSTRAINT chk_brand_name CHECK ((name <> ''::text))
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- Name: brand_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.brand ALTER COLUMN brand_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.brand_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    city_id integer NOT NULL,
    name text NOT NULL,
    country_id integer NOT NULL,
    population_mil real,
    tel_area_code character varying(8)[],
    time_delta integer DEFAULT 0,
    CONSTRAINT chk_city_name CHECK ((name <> ''::text)),
    CONSTRAINT chk_city_population_mil CHECK ((population_mil > (0)::double precision)),
    CONSTRAINT chk_city_tel_area_code CHECK ((array_length(tel_area_code, 1) > 0))
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.city ALTER COLUMN city_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: color_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.color_schema (
    color_schema_id integer NOT NULL,
    name text NOT NULL,
    CONSTRAINT chk_color_schema_name CHECK ((name <> ''::text))
);


ALTER TABLE public.color_schema OWNER TO postgres;

--
-- Name: color_schema_color_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.color_schema ALTER COLUMN color_schema_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.color_schema_color_schema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    company_id integer NOT NULL,
    name text NOT NULL,
    abbr text NOT NULL,
    description text,
    country_id integer NOT NULL,
    CONSTRAINT chk_company_abbr CHECK ((abbr <> ''::text)),
    CONSTRAINT chk_company_description CHECK ((description <> ''::text)),
    CONSTRAINT chk_company_name CHECK ((name <> ''::text))
);


ALTER TABLE public.company OWNER TO postgres;

--
-- Name: company_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.company ALTER COLUMN company_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.company_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id integer NOT NULL,
    name text NOT NULL,
    capital_city_id integer NOT NULL,
    continent text NOT NULL,
    population_mil real,
    language_id integer NOT NULL,
    currency_id integer NOT NULL,
    CONSTRAINT chk_country_continent CHECK ((continent = ANY (ARRAY['Africa'::text, 'Antarctica'::text, 'Asia'::text, 'Europe'::text, 'North America'::text, 'Australia (Oceania)'::text, 'South America'::text]))),
    CONSTRAINT chk_country_population_mil CHECK ((population_mil > (0)::double precision))
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.country ALTER COLUMN country_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    currency_id integer NOT NULL,
    name text NOT NULL,
    abbr character varying(3) NOT NULL,
    signature character varying(2) NOT NULL,
    CONSTRAINT chk_currency_abbr CHECK (((abbr)::text <> ''::text)),
    CONSTRAINT chk_currency_name CHECK ((name <> ''::text)),
    CONSTRAINT chk_currency_signature CHECK (((signature)::text <> ''::text))
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Name: currency_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.currency ALTER COLUMN currency_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.currency_currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    middle_name text,
    CONSTRAINT chk_customer_first_name CHECK ((first_name <> ''::text)),
    CONSTRAINT chk_customer_last_name CHECK ((last_name <> ''::text)),
    CONSTRAINT chk_customer_middle_name CHECK ((middle_name <> ''::text))
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_bio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_bio (
    customer_bio_id integer NOT NULL,
    customer_id integer NOT NULL,
    age integer,
    birth_date date,
    gender_id integer NOT NULL,
    family_status_id integer,
    has_children boolean,
    language_id integer DEFAULT 1 NOT NULL,
    CONSTRAINT chk_customer_bio_age CHECK ((age > 18))
);


ALTER TABLE public.customer_bio OWNER TO postgres;

--
-- Name: customer_bio_customer_bio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customer_bio ALTER COLUMN customer_bio_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_bio_customer_bio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_contacts (
    customer_contacts_id integer NOT NULL,
    customer_id integer NOT NULL,
    phone text,
    email text,
    CONSTRAINT chk_customer_contacts_email CHECK ((email <> ''::text)),
    CONSTRAINT chk_customer_contacts_phone CHECK ((phone <> ''::text))
);


ALTER TABLE public.customer_contacts OWNER TO postgres;

--
-- Name: customer_contacts_customer_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customer_contacts ALTER COLUMN customer_contacts_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_contacts_customer_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customer ALTER COLUMN customer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_outer_distr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_outer_distr (
    customer_outer_distr_id integer NOT NULL,
    customer_id integer NOT NULL,
    company_id integer NOT NULL,
    distr_id text NOT NULL,
    sponsor_distr_id text,
    CONSTRAINT chl_customer_outer_distr_distr_id_sponsor_distr_id CHECK ((distr_id <> sponsor_distr_id))
);


ALTER TABLE public.customer_outer_distr OWNER TO postgres;

--
-- Name: customer_outer_distr_customer_outer_distr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customer_outer_distr ALTER COLUMN customer_outer_distr_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_outer_distr_customer_outer_distr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_preferences (
    customer_preferences_id integer NOT NULL,
    customer_id integer NOT NULL,
    color_schema_id integer,
    language_id integer,
    currency_id integer,
    wish_list json DEFAULT '{}'::json,
    chart json DEFAULT '{}'::json,
    last_seen json DEFAULT '{}'::json
);


ALTER TABLE public.customer_preferences OWNER TO postgres;

--
-- Name: customer_preferences_customer_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customer_preferences ALTER COLUMN customer_preferences_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_preferences_customer_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_ship_addr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_ship_addr (
    customer_ship_addr_id integer NOT NULL,
    customer_id integer NOT NULL,
    country_id integer NOT NULL,
    region text,
    city_id integer NOT NULL,
    street text,
    building text,
    appartment character varying(8),
    floor integer,
    entrance character varying(8),
    has_fence boolean,
    postal_code character varying(12),
    CONSTRAINT chk_customer_ship_addr_appartment CHECK (((appartment)::text <> ''::text)),
    CONSTRAINT chk_customer_ship_addr_building CHECK ((building <> ''::text)),
    CONSTRAINT chk_customer_ship_addr_entrance CHECK (((entrance)::text <> ''::text)),
    CONSTRAINT chk_customer_ship_addr_postal_code CHECK (((postal_code)::text <> ''::text)),
    CONSTRAINT chk_customer_ship_addr_region CHECK ((region <> ''::text)),
    CONSTRAINT chk_customer_ship_addr_street CHECK ((street <> ''::text))
);


ALTER TABLE public.customer_ship_addr OWNER TO postgres;

--
-- Name: customer_ship_addr_customer_ship_addr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customer_ship_addr ALTER COLUMN customer_ship_addr_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_ship_addr_customer_ship_addr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_statistics (
    customer_statistics_id integer NOT NULL,
    customer_id integer NOT NULL,
    purchase_first date,
    purchase_total integer DEFAULT 0 NOT NULL,
    item_total integer DEFAULT 0 NOT NULL,
    spent_total real DEFAULT 0.0 NOT NULL,
    CONSTRAINT chk_customer_statistics_item_total CHECK ((item_total >= purchase_total)),
    CONSTRAINT chk_customer_statistics_purchase_total CHECK ((purchase_total >= 0)),
    CONSTRAINT chk_customer_statistics_spent_total CHECK ((spent_total >= (0)::double precision))
);


ALTER TABLE public.customer_statistics OWNER TO postgres;

--
-- Name: customer_statistics_customer_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customer_statistics ALTER COLUMN customer_statistics_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_statistics_customer_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    middle_name text,
    CONSTRAINT chk_employee_first_name CHECK ((first_name <> ''::text)),
    CONSTRAINT chk_employee_last_name CHECK ((last_name <> ''::text)),
    CONSTRAINT chk_employee_middle_name CHECK ((middle_name <> ''::text))
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_access_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_access_level (
    employee_access_level_id integer NOT NULL,
    level character varying(3) NOT NULL,
    description text,
    CONSTRAINT chk_employee_access_level_description CHECK ((description <> ''::text)),
    CONSTRAINT chk_employee_access_level_level CHECK (((level)::text <> ''::text))
);


ALTER TABLE public.employee_access_level OWNER TO postgres;

--
-- Name: employee_access_level_employee_access_level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_access_level ALTER COLUMN employee_access_level_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_access_level_employee_access_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_addr_liv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_addr_liv (
    employee_addr_liv_id integer NOT NULL,
    employee_id integer NOT NULL,
    country_id integer NOT NULL,
    region text,
    city_id integer NOT NULL,
    street text,
    building text,
    appartment character varying(8),
    floor integer,
    entrance character varying(8),
    has_fence boolean,
    postal_code character varying(12),
    CONSTRAINT chk_employee_addr_liv_appartment CHECK (((appartment)::text <> ''::text)),
    CONSTRAINT chk_employee_addr_liv_building CHECK ((building <> ''::text)),
    CONSTRAINT chk_employee_addr_liv_entrance CHECK (((entrance)::text <> ''::text)),
    CONSTRAINT chk_employee_addr_liv_postal_code CHECK (((postal_code)::text <> ''::text)),
    CONSTRAINT chk_employee_addr_liv_region CHECK ((region <> ''::text)),
    CONSTRAINT chk_employee_addr_liv_street CHECK ((street <> ''::text))
);


ALTER TABLE public.employee_addr_liv OWNER TO postgres;

--
-- Name: employee_addr_liv_employee_addr_liv_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_addr_liv ALTER COLUMN employee_addr_liv_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_addr_liv_employee_addr_liv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_addr_reg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_addr_reg (
    employee_addr_reg_id integer NOT NULL,
    employee_id integer NOT NULL,
    country_id integer NOT NULL,
    region text,
    city_id integer NOT NULL,
    street text,
    building text,
    appartment character varying(8),
    floor integer,
    entrance character varying(8),
    has_fence boolean,
    postal_code character varying(12),
    CONSTRAINT chk_employee_addr_reg_appartment CHECK (((appartment)::text <> ''::text)),
    CONSTRAINT chk_employee_addr_reg_building CHECK ((building <> ''::text)),
    CONSTRAINT chk_employee_addr_reg_entrance CHECK (((entrance)::text <> ''::text)),
    CONSTRAINT chk_employee_addr_reg_postal_code CHECK (((postal_code)::text <> ''::text)),
    CONSTRAINT chk_employee_addr_reg_region CHECK ((region <> ''::text)),
    CONSTRAINT chk_employee_addr_reg_street CHECK ((street <> ''::text))
);


ALTER TABLE public.employee_addr_reg OWNER TO postgres;

--
-- Name: employee_addr_reg_employee_addr_reg_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_addr_reg ALTER COLUMN employee_addr_reg_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_addr_reg_employee_addr_reg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_bio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_bio (
    employee_bio_id integer NOT NULL,
    employee_id integer NOT NULL,
    age integer,
    birth_date date,
    gender_id integer NOT NULL,
    family_status_id integer,
    has_children boolean,
    language_id integer DEFAULT 1 NOT NULL,
    CONSTRAINT chk_employee_bio_age CHECK ((age > 18))
);


ALTER TABLE public.employee_bio OWNER TO postgres;

--
-- Name: employee_bio_employee_bio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_bio ALTER COLUMN employee_bio_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_bio_employee_bio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_contacts (
    employee_contacts_id integer NOT NULL,
    employee_id integer NOT NULL,
    phone text,
    email text,
    emergency_phone text,
    CONSTRAINT chk_employee_contacts_email CHECK ((email <> ''::text)),
    CONSTRAINT chk_employee_contacts_emergency_phone CHECK ((emergency_phone <> ''::text)),
    CONSTRAINT chk_employee_contacts_phone CHECK ((phone <> ''::text))
);


ALTER TABLE public.employee_contacts OWNER TO postgres;

--
-- Name: employee_contacts_employee_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_contacts ALTER COLUMN employee_contacts_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_contacts_employee_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_contract_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_contract_type (
    employee_contract_type_id integer NOT NULL,
    contract_type text NOT NULL,
    description text,
    CONSTRAINT chk_employee_contract_type_contract_type CHECK ((contract_type <> ''::text)),
    CONSTRAINT chk_employee_contract_type_description CHECK ((description <> ''::text))
);


ALTER TABLE public.employee_contract_type OWNER TO postgres;

--
-- Name: employee_contract_type_employee_contract_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_contract_type ALTER COLUMN employee_contract_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_contract_type_employee_contract_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee ALTER COLUMN employee_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_hire_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_hire_data (
    employee_hire_data_id integer NOT NULL,
    employee_id integer NOT NULL,
    hire_date date NOT NULL,
    prev_promotion_date date,
    next_promotion_date date,
    termination_date date,
    CONSTRAINT chk_employee_hire_data_hire_date_next_promotion_date CHECK ((hire_date < next_promotion_date)),
    CONSTRAINT chk_employee_hire_data_hire_date_prev_promotion_date CHECK ((hire_date <= prev_promotion_date)),
    CONSTRAINT chk_employee_hire_data_hire_date_termination_date CHECK ((hire_date <= termination_date))
);


ALTER TABLE public.employee_hire_data OWNER TO postgres;

--
-- Name: employee_hire_data_employee_hire_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_hire_data ALTER COLUMN employee_hire_data_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_hire_data_employee_hire_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_payment (
    employee_payment_id integer NOT NULL,
    employee_id integer NOT NULL,
    currency_id integer DEFAULT 1 NOT NULL,
    salary_mod real DEFAULT 1 NOT NULL,
    bonus_mod real DEFAULT 1 NOT NULL,
    account_num text NOT NULL,
    tax_account_num text NOT NULL,
    CONSTRAINT chk_employee_payment_account_num_tax_account_num CHECK ((account_num <> tax_account_num)),
    CONSTRAINT chk_employee_payment_bonus_mod CHECK ((bonus_mod > (0)::double precision)),
    CONSTRAINT chk_employee_payment_salary_mod CHECK ((salary_mod > (0)::double precision))
);


ALTER TABLE public.employee_payment OWNER TO postgres;

--
-- Name: employee_payment_employee_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_payment ALTER COLUMN employee_payment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_payment_employee_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_position (
    employee_position_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    salary_mod real NOT NULL,
    bonus_mod real NOT NULL,
    superior_id integer,
    CONSTRAINT chk_employee_position_bonus_mod CHECK ((bonus_mod > (0)::double precision)),
    CONSTRAINT chk_employee_position_description CHECK ((description <> ''::text)),
    CONSTRAINT chk_employee_position_name CHECK ((name <> ''::text)),
    CONSTRAINT chk_employee_position_salary_mod CHECK ((salary_mod > (0)::double precision))
);


ALTER TABLE public.employee_position OWNER TO postgres;

--
-- Name: employee_position_employee_position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_position ALTER COLUMN employee_position_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_position_employee_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_preferences (
    employee_preferences_id integer NOT NULL,
    employee_id integer NOT NULL,
    color_schema_id integer,
    language_id integer,
    currency_id integer
);


ALTER TABLE public.employee_preferences OWNER TO postgres;

--
-- Name: employee_preferences_employee_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_preferences ALTER COLUMN employee_preferences_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_preferences_employee_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_shift; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_shift (
    employee_shift_id integer NOT NULL,
    employee_id integer NOT NULL,
    shop_id integer NOT NULL,
    manager_id integer,
    has_keys boolean NOT NULL,
    shift_start_time time without time zone NOT NULL,
    hours_per_day integer NOT NULL,
    days_per_week integer NOT NULL,
    CONSTRAINT chk_employee_shift_days_per_week CHECK (((days_per_week > 0) AND (days_per_week <= 6))),
    CONSTRAINT chk_employee_shift_hours_per_day CHECK (((hours_per_day > 0) AND (hours_per_day <= 16))),
    CONSTRAINT chk_employee_shift_shift_start_time CHECK (((shift_start_time >= '00:00:00'::time without time zone) AND (shift_start_time <= '23:59:59'::time without time zone)))
);


ALTER TABLE public.employee_shift OWNER TO postgres;

--
-- Name: employee_shift_employee_shift_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_shift ALTER COLUMN employee_shift_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_shift_employee_shift_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_specific; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_specific (
    employee_specific_id integer NOT NULL,
    employee_id integer NOT NULL,
    has_kin_in_company boolean DEFAULT false NOT NULL
);


ALTER TABLE public.employee_specific OWNER TO postgres;

--
-- Name: employee_specific_employee_specific_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_specific ALTER COLUMN employee_specific_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_specific_employee_specific_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_state (
    employee_state_id integer NOT NULL,
    employee_id integer NOT NULL,
    position_id integer NOT NULL,
    contract_type_id integer DEFAULT 1 NOT NULL,
    status_id integer DEFAULT 1 NOT NULL,
    access_level_id integer NOT NULL
);


ALTER TABLE public.employee_state OWNER TO postgres;

--
-- Name: employee_state_employee_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_state ALTER COLUMN employee_state_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_state_employee_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_status (
    employee_status_id integer NOT NULL,
    status text NOT NULL,
    description text,
    CONSTRAINT chk_employee_status_description CHECK ((description <> ''::text)),
    CONSTRAINT chk_employee_status_status CHECK ((status <> ''::text))
);


ALTER TABLE public.employee_status OWNER TO postgres;

--
-- Name: employee_status_employee_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee_status ALTER COLUMN employee_status_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_status_employee_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: exchange_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exchange_rate (
    exchange_rate_id integer NOT NULL,
    currency_from integer NOT NULL,
    currency_to integer NOT NULL,
    current_rate real NOT NULL,
    previous_rate real NOT NULL,
    update_ts timestamp without time zone DEFAULT now() NOT NULL,
    default_rate real NOT NULL,
    min_rate real NOT NULL,
    max_rate real NOT NULL,
    CONSTRAINT chk_exchange_rate_currency_from_currency_to CHECK ((currency_from <> currency_to)),
    CONSTRAINT chk_exchange_rate_current_rate CHECK (((current_rate > min_rate) AND (current_rate < max_rate))),
    CONSTRAINT chk_exchange_rate_default_rate CHECK (((default_rate > min_rate) AND (default_rate < max_rate))),
    CONSTRAINT chk_exchange_rate_min_rate CHECK ((min_rate > (0)::double precision)),
    CONSTRAINT chk_exchange_rate_min_rate_max_rate CHECK ((max_rate > min_rate)),
    CONSTRAINT chk_exchange_rate_previous_rate CHECK (((previous_rate > min_rate) AND (previous_rate < max_rate)))
);


ALTER TABLE public.exchange_rate OWNER TO postgres;

--
-- Name: exchange_rate_exchange_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.exchange_rate ALTER COLUMN exchange_rate_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.exchange_rate_exchange_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: family_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family_status (
    family_status_id integer NOT NULL,
    name text NOT NULL,
    description text,
    CONSTRAINT chk_family_status_name CHECK ((name <> ''::text))
);


ALTER TABLE public.family_status OWNER TO postgres;

--
-- Name: family_status_family_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.family_status ALTER COLUMN family_status_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.family_status_family_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: gender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gender (
    gender_id integer NOT NULL,
    name text NOT NULL,
    CONSTRAINT chk_gender_name CHECK ((name <> ''::text))
);


ALTER TABLE public.gender OWNER TO postgres;

--
-- Name: gender_gender_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.gender ALTER COLUMN gender_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.gender_gender_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    language_id integer NOT NULL,
    name text NOT NULL,
    name_native text NOT NULL,
    code character varying(2) NOT NULL,
    CONSTRAINT chk_language_code CHECK (((code)::text <> ''::text)),
    CONSTRAINT chk_language_name CHECK ((name <> ''::text)),
    CONSTRAINT chk_language_name_native CHECK ((name_native <> ''::text))
);


ALTER TABLE public.language OWNER TO postgres;

--
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.language ALTER COLUMN language_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.language_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: measure_unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measure_unit (
    measure_unit_id integer NOT NULL,
    name text NOT NULL,
    abbr text,
    CONSTRAINT chk_measure_unit_abbr CHECK ((abbr <> ''::text)),
    CONSTRAINT chk_measure_unit_name CHECK ((name <> ''::text))
);


ALTER TABLE public.measure_unit OWNER TO postgres;

--
-- Name: measure_unit_measure_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.measure_unit ALTER COLUMN measure_unit_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.measure_unit_measure_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: packing_material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packing_material (
    packing_material_id integer NOT NULL,
    name text NOT NULL,
    description text,
    CONSTRAINT chk_packing_material_description CHECK ((description <> ''::text)),
    CONSTRAINT chk_packing_material_name CHECK ((name <> ''::text))
);


ALTER TABLE public.packing_material OWNER TO postgres;

--
-- Name: packing_material_packing_material_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.packing_material ALTER COLUMN packing_material_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.packing_material_packing_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: payment_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_type (
    payment_type_id integer NOT NULL,
    name text NOT NULL,
    CONSTRAINT chk_payment_type_name CHECK ((name <> ''::text))
);


ALTER TABLE public.payment_type OWNER TO postgres;

--
-- Name: payment_type_payment_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payment_type ALTER COLUMN payment_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payment_type_payment_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    post_id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    author_id integer NOT NULL,
    language_id integer NOT NULL,
    rating_5 real,
    votes_number_5 integer DEFAULT 0 NOT NULL,
    visited_total integer DEFAULT 0 NOT NULL,
    create_ts timestamp without time zone DEFAULT now() NOT NULL,
    edit_ts timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT chk_post_rating_5 CHECK (((rating_5 >= (0)::double precision) AND (rating_5 <= (5)::double precision))),
    CONSTRAINT chk_post_rating_5_votes_number_5 CHECK (((rating_5 IS NULL) OR (votes_number_5 > 0))),
    CONSTRAINT chk_post_visited_total CHECK ((visited_total >= 0)),
    CONSTRAINT chk_post_votes_number_5 CHECK ((votes_number_5 >= 0))
);


ALTER TABLE public.post OWNER TO postgres;

--
-- Name: post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.post ALTER COLUMN post_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.post_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    outer_id text NOT NULL,
    name text NOT NULL,
    company_id integer NOT NULL,
    brand_id integer NOT NULL,
    CONSTRAINT chk_product_name CHECK ((name <> ''::text)),
    CONSTRAINT chk_product_outer_id CHECK ((outer_id <> ''::text))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    product_category_id integer NOT NULL,
    name text NOT NULL,
    abbr text,
    description text,
    CONSTRAINT chk_product_category_abbr CHECK ((abbr <> ''::text)),
    CONSTRAINT chk_product_category_description CHECK ((description <> ''::text)),
    CONSTRAINT chk_product_category_name CHECK ((name <> ''::text))
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- Name: product_category_product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_category ALTER COLUMN product_category_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_category_product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_data (
    product_data_id integer NOT NULL,
    product_id integer NOT NULL,
    product_form_id integer NOT NULL,
    has_dispenser boolean,
    total_volume integer,
    items_total integer,
    item_volume real,
    measure_unit_id integer,
    CONSTRAINT chk_product_data_item_volume CHECK ((item_volume >= (0)::double precision)),
    CONSTRAINT chk_product_data_items_total CHECK ((items_total >= 0)),
    CONSTRAINT chk_product_data_total_volume CHECK ((total_volume >= 0))
);


ALTER TABLE public.product_data OWNER TO postgres;

--
-- Name: product_data_product_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_data ALTER COLUMN product_data_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_data_product_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_form; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_form (
    product_form_id integer NOT NULL,
    name text NOT NULL,
    abbr text,
    description text,
    CONSTRAINT chk_product_form_abbr CHECK ((abbr <> ''::text)),
    CONSTRAINT chk_product_form_description CHECK ((description <> ''::text)),
    CONSTRAINT chk_product_form_name CHECK ((name <> ''::text))
);


ALTER TABLE public.product_form OWNER TO postgres;

--
-- Name: product_form_product_form_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_form ALTER COLUMN product_form_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_form_product_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_info (
    product_info_id integer NOT NULL,
    product_id integer NOT NULL,
    pros text,
    advantages text,
    active_ingredients text,
    composition text,
    application text,
    contraindications text,
    storing text,
    CONSTRAINT chk_product_info_active_ingredients CHECK ((active_ingredients <> ''::text)),
    CONSTRAINT chk_product_info_advantages CHECK ((advantages <> ''::text)),
    CONSTRAINT chk_product_info_application CHECK ((application <> ''::text)),
    CONSTRAINT chk_product_info_composition CHECK ((composition <> ''::text)),
    CONSTRAINT chk_product_info_contraindications CHECK ((contraindications <> ''::text)),
    CONSTRAINT chk_product_info_pros CHECK ((pros <> ''::text)),
    CONSTRAINT chk_product_info_storing CHECK ((storing <> ''::text))
);


ALTER TABLE public.product_info OWNER TO postgres;

--
-- Name: product_info_product_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_info ALTER COLUMN product_info_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_info_product_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_points (
    product_point_id integer NOT NULL,
    product_id integer NOT NULL,
    points_outer real DEFAULT 0.0 NOT NULL,
    points_inner real DEFAULT 0.0 NOT NULL,
    points_discount real DEFAULT 0.0 NOT NULL,
    CONSTRAINT chk_product_point_points_discount CHECK ((points_discount >= (0)::double precision)),
    CONSTRAINT chk_product_point_points_inner CHECK ((points_inner >= (0)::double precision)),
    CONSTRAINT chk_product_point_points_outer CHECK ((points_outer >= (0)::double precision))
);


ALTER TABLE public.product_points OWNER TO postgres;

--
-- Name: product_points_product_point_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_points ALTER COLUMN product_point_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_points_product_point_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_price (
    product_price_id integer NOT NULL,
    product_id integer NOT NULL,
    diller_price real DEFAULT 0.0 NOT NULL,
    distr_price real DEFAULT 0.0 NOT NULL,
    wholesale_price real DEFAULT 0.0 NOT NULL,
    consumer_price real DEFAULT 0.0 NOT NULL,
    CONSTRAINT chk_product_price_consumer_price CHECK ((consumer_price >= (0)::double precision)),
    CONSTRAINT chk_product_price_diller_price CHECK ((diller_price >= (0)::double precision)),
    CONSTRAINT chk_product_price_distr_price CHECK ((distr_price >= (0)::double precision)),
    CONSTRAINT chk_product_price_wholesale_price CHECK ((wholesale_price >= (0)::double precision))
);


ALTER TABLE public.product_price OWNER TO postgres;

--
-- Name: product_price_product_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_price ALTER COLUMN product_price_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_price_product_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN product_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_rating (
    product_rating_id integer NOT NULL,
    product_id integer NOT NULL,
    rating_5 real DEFAULT 0.0 NOT NULL,
    votes_number_5 integer DEFAULT 0 NOT NULL,
    CONSTRAINT chk_product_rating_rating_5 CHECK (((rating_5 >= (0)::double precision) AND (rating_5 <= (5.0)::double precision))),
    CONSTRAINT chk_product_rating_rating_5_votes_number_5 CHECK (((rating_5 IS NULL) OR (votes_number_5 > 0))),
    CONSTRAINT chk_product_rating_votes_number_5 CHECK ((votes_number_5 >= 0))
);


ALTER TABLE public.product_rating OWNER TO postgres;

--
-- Name: product_rating_product_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_rating ALTER COLUMN product_rating_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_rating_product_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_size (
    product_size_id integer NOT NULL,
    product_id integer NOT NULL,
    weight_g real NOT NULL,
    length_cm real NOT NULL,
    width_cm real NOT NULL,
    height_cm real NOT NULL,
    packing_material_id integer NOT NULL,
    CONSTRAINT chk_product_size_height_cm CHECK ((height_cm > (0)::double precision)),
    CONSTRAINT chk_product_size_length_cm CHECK ((length_cm > (0)::double precision)),
    CONSTRAINT chk_product_size_weight_g CHECK ((weight_g > (0)::double precision)),
    CONSTRAINT chk_product_size_width_cm CHECK ((width_cm > (0)::double precision))
);


ALTER TABLE public.product_size OWNER TO postgres;

--
-- Name: product_size_product_size_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_size ALTER COLUMN product_size_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_size_product_size_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_type (
    product_type_id integer NOT NULL,
    name text NOT NULL,
    abbr text,
    description text,
    CONSTRAINT chk_product_type_abbr CHECK ((abbr <> ''::text)),
    CONSTRAINT chk_product_type_description CHECK ((description <> ''::text)),
    CONSTRAINT chk_product_type_name CHECK ((name <> ''::text))
);


ALTER TABLE public.product_type OWNER TO postgres;

--
-- Name: product_type_product_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_type ALTER COLUMN product_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_type_product_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: purchase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase (
    purchase_id integer NOT NULL,
    customer_id integer NOT NULL,
    employee_id integer,
    shop_id integer NOT NULL,
    date date DEFAULT now() NOT NULL,
    "time" time without time zone DEFAULT now() NOT NULL,
    CONSTRAINT chk_purchase_employee_id_shop_id CHECK (((shop_id <> 1) OR (employee_id IS NULL)))
);


ALTER TABLE public.purchase OWNER TO postgres;

--
-- Name: purchase_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_details (
    purchase_details_id integer NOT NULL,
    purchase_id integer NOT NULL,
    products json NOT NULL,
    items_total integer NOT NULL,
    unique_items integer NOT NULL,
    bonus_value real,
    CONSTRAINT chk_purchase_details_bonus_value CHECK ((bonus_value >= (0)::double precision)),
    CONSTRAINT chk_purchase_details_items_total CHECK ((items_total > 0)),
    CONSTRAINT chk_purchase_details_unique_items CHECK ((unique_items > 0)),
    CONSTRAINT chk_purchase_details_unique_items_items_total CHECK ((unique_items <= items_total))
);


ALTER TABLE public.purchase_details OWNER TO postgres;

--
-- Name: purchase_details_purchase_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.purchase_details ALTER COLUMN purchase_details_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchase_details_purchase_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: purchase_params; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_params (
    purchase_params_id integer NOT NULL,
    purchase_id integer NOT NULL,
    length_cm real NOT NULL,
    width_cm real NOT NULL,
    height_cm real NOT NULL,
    weight_kg real NOT NULL,
    CONSTRAINT chk_purchase_params_height_cm CHECK ((height_cm > (0)::double precision)),
    CONSTRAINT chk_purchase_params_length_cm CHECK ((length_cm > (0)::double precision)),
    CONSTRAINT chk_purchase_params_weight_kg CHECK ((weight_kg > (0)::double precision)),
    CONSTRAINT chk_purchase_params_width_cm CHECK ((width_cm > (0)::double precision))
);


ALTER TABLE public.purchase_params OWNER TO postgres;

--
-- Name: purchase_params_purchase_params_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.purchase_params ALTER COLUMN purchase_params_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchase_params_purchase_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: purchase_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_payment (
    purchase_payment_id integer NOT NULL,
    purchase_id integer NOT NULL,
    sum real NOT NULL,
    payment_type_id integer NOT NULL,
    currency_id integer NOT NULL,
    CONSTRAINT chk_purchase_payment_sum CHECK ((sum > (0)::double precision))
);


ALTER TABLE public.purchase_payment OWNER TO postgres;

--
-- Name: purchase_payment_purchase_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.purchase_payment ALTER COLUMN purchase_payment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchase_payment_purchase_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: purchase_purchase_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.purchase ALTER COLUMN purchase_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchase_purchase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: purchase_ship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_ship (
    purchase_ship_id integer NOT NULL,
    purchase_id integer NOT NULL,
    shipper_id integer NOT NULL,
    invoice_num text NOT NULL,
    shipping_type_id integer NOT NULL
);


ALTER TABLE public.purchase_ship OWNER TO postgres;

--
-- Name: purchase_ship_addr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_ship_addr (
    purchase_ship_addr_id integer NOT NULL,
    purchase_id integer NOT NULL,
    country_id integer NOT NULL,
    region text,
    city_id integer NOT NULL,
    street text,
    building text,
    appartment character varying(8),
    floor integer,
    entrance character varying(8),
    has_fence boolean,
    postal_code character varying(12),
    CONSTRAINT chk_purchase_ship_addr_appartment CHECK (((appartment)::text <> ''::text)),
    CONSTRAINT chk_purchase_ship_addr_building CHECK ((building <> ''::text)),
    CONSTRAINT chk_purchase_ship_addr_entrance CHECK (((entrance)::text <> ''::text)),
    CONSTRAINT chk_purchase_ship_addr_postal_code CHECK (((postal_code)::text <> ''::text)),
    CONSTRAINT chk_purchase_ship_addr_region CHECK ((region <> ''::text)),
    CONSTRAINT chk_purchase_ship_addr_street CHECK ((street <> ''::text))
);


ALTER TABLE public.purchase_ship_addr OWNER TO postgres;

--
-- Name: purchase_ship_addr_purchase_ship_addr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.purchase_ship_addr ALTER COLUMN purchase_ship_addr_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchase_ship_addr_purchase_ship_addr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: purchase_ship_purchase_ship_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.purchase_ship ALTER COLUMN purchase_ship_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchase_ship_purchase_ship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shipper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipper (
    shipper_id integer NOT NULL,
    name text NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.shipper OWNER TO postgres;

--
-- Name: shipper_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipper_contacts (
    shipper_contacts_id integer NOT NULL,
    shipper_id integer NOT NULL,
    name text,
    phone text NOT NULL,
    email text NOT NULL,
    website text
);


ALTER TABLE public.shipper_contacts OWNER TO postgres;

--
-- Name: shipper_contacts_shipper_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shipper_contacts ALTER COLUMN shipper_contacts_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shipper_contacts_shipper_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shipper_shipper_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shipper ALTER COLUMN shipper_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shipper_shipper_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shipping_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_type (
    shipping_type_id integer NOT NULL,
    name text NOT NULL,
    abbr character varying(5) NOT NULL,
    description text,
    CONSTRAINT chk_shipping_type_abbr CHECK (((abbr)::text <> ''::text)),
    CONSTRAINT chk_shipping_type_description CHECK ((description <> ''::text)),
    CONSTRAINT chk_shipping_type_name CHECK ((name <> ''::text))
);


ALTER TABLE public.shipping_type OWNER TO postgres;

--
-- Name: shipping_type_shipping_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shipping_type ALTER COLUMN shipping_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shipping_type_shipping_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop (
    shop_id integer NOT NULL,
    admin_id integer NOT NULL,
    rating real,
    CONSTRAINT chk_shop_rating CHECK (((rating >= (0.0)::double precision) AND (rating <= (10.0)::double precision)))
);


ALTER TABLE public.shop OWNER TO postgres;

--
-- Name: shop_addr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_addr (
    shop_addr_id integer NOT NULL,
    shop_id integer NOT NULL,
    country_id integer NOT NULL,
    region text,
    city_id integer NOT NULL,
    street text,
    building text,
    appartment character varying(8),
    floor integer,
    entrance character varying(8),
    has_fence boolean,
    postal_code character varying(12),
    CONSTRAINT chk_shop_addr_appartment CHECK (((appartment)::text <> ''::text)),
    CONSTRAINT chk_shop_addr_building CHECK ((building <> ''::text)),
    CONSTRAINT chk_shop_addr_entrance CHECK (((entrance)::text <> ''::text)),
    CONSTRAINT chk_shop_addr_postal_code CHECK (((postal_code)::text <> ''::text)),
    CONSTRAINT chk_shop_addr_region CHECK ((region <> ''::text)),
    CONSTRAINT chk_shop_addr_street CHECK ((street <> ''::text))
);


ALTER TABLE public.shop_addr OWNER TO postgres;

--
-- Name: shop_addr_shop_addr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_addr ALTER COLUMN shop_addr_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shop_addr_shop_addr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_contacts (
    shop_contacts_id integer NOT NULL,
    shop_id integer NOT NULL,
    phone text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.shop_contacts OWNER TO postgres;

--
-- Name: shop_contacts_shop_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_contacts ALTER COLUMN shop_contacts_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shop_contacts_shop_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_payment (
    shop_payment_id integer NOT NULL,
    shop_id integer NOT NULL,
    salary_mod real DEFAULT 1 NOT NULL,
    bonus_mod real DEFAULT 1 NOT NULL,
    salary_day integer NOT NULL,
    collection_day integer NOT NULL
);


ALTER TABLE public.shop_payment OWNER TO postgres;

--
-- Name: shop_payment_shop_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_payment ALTER COLUMN shop_payment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shop_payment_shop_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_product (
    shop_product_id integer NOT NULL,
    shop_id integer NOT NULL,
    product_id integer NOT NULL,
    units_in_stock integer DEFAULT 0 NOT NULL,
    CONSTRAINT chk_shop_product_units_in_stock CHECK ((units_in_stock >= 0))
);


ALTER TABLE public.shop_product OWNER TO postgres;

--
-- Name: shop_product_shop_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_product ALTER COLUMN shop_product_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shop_product_shop_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop_renter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_renter (
    shop_renter_id integer NOT NULL,
    shop_id integer NOT NULL,
    name text,
    contact_name text,
    contact_phone text,
    contact_email text,
    rent_start_date date,
    rent_termintaion_date date,
    payment_day integer,
    payment_account text,
    payment_sum real,
    currency_id integer,
    CONSTRAINT chk_shop_renter_payment_day CHECK (((payment_day >= 1) AND (payment_day <= 31))),
    CONSTRAINT chk_shop_renter_payment_sum CHECK ((payment_sum >= (0)::double precision)),
    CONSTRAINT chk_shop_renter_rent_start_date_rent_termination_date CHECK ((rent_start_date < rent_termintaion_date))
);


ALTER TABLE public.shop_renter OWNER TO postgres;

--
-- Name: shop_renter_shop_renter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_renter ALTER COLUMN shop_renter_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shop_renter_shop_renter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_schedule (
    shop_schedule_id integer NOT NULL,
    shop_id integer NOT NULL,
    open_time time without time zone,
    close_time time without time zone
);


ALTER TABLE public.shop_schedule OWNER TO postgres;

--
-- Name: shop_schedule_shop_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_schedule ALTER COLUMN shop_schedule_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shop_schedule_shop_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop_security; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_security (
    shop_security_id integer NOT NULL,
    shop_id integer NOT NULL,
    keys_num integer,
    is_protected boolean,
    security_phone text,
    CONSTRAINT chk_shop_security_keys_num CHECK ((keys_num > 0))
);


ALTER TABLE public.shop_security OWNER TO postgres;

--
-- Name: shop_security_shop_security_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_security ALTER COLUMN shop_security_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shop_security_shop_security_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop_shop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop ALTER COLUMN shop_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shop_shop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop_staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_staff (
    shop_staff_id integer NOT NULL,
    shop_id integer NOT NULL,
    staff_total_min integer,
    staff_total_max integer,
    staff_total_current integer,
    staff_shift_min integer,
    staff_shift_max integer,
    staff_shift_current integer,
    CONSTRAINT chk_shop_staff_staff_shift_current CHECK (((staff_shift_current >= staff_shift_min) AND (staff_shift_current <= staff_shift_max))),
    CONSTRAINT chk_shop_staff_staff_shift_min CHECK ((staff_shift_min >= 0)),
    CONSTRAINT chk_shop_staff_staff_shift_min_staff_shift_max CHECK ((staff_shift_min <= staff_shift_max)),
    CONSTRAINT chk_shop_staff_staff_total_current CHECK (((staff_total_current >= staff_total_min) AND (staff_total_current <= staff_total_max))),
    CONSTRAINT chk_shop_staff_staff_total_min CHECK ((staff_total_min >= 0)),
    CONSTRAINT chk_shop_staff_staff_total_min_staff_total_max CHECK ((staff_total_min <= staff_total_max))
);


ALTER TABLE public.shop_staff OWNER TO postgres;

--
-- Name: shop_staff_shop_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_staff ALTER COLUMN shop_staff_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shop_staff_shop_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop_statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_statistics (
    shop_statistics_id integer NOT NULL,
    shop_id integer NOT NULL,
    income_total real DEFAULT 0.0 NOT NULL,
    purchase_total integer DEFAULT 0 NOT NULL,
    CONSTRAINT chk_shop_statistics_income_total CHECK ((income_total >= (0)::double precision)),
    CONSTRAINT chk_shop_statistics_purchase_total CHECK ((purchase_total >= 0))
);


ALTER TABLE public.shop_statistics OWNER TO postgres;

--
-- Name: shop_statistics_shop_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shop_statistics ALTER COLUMN shop_statistics_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shop_statistics_shop_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    supplier_id integer NOT NULL,
    name text NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- Name: supplier_addr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier_addr (
    supplier_addr_id integer NOT NULL,
    supplier_id integer NOT NULL,
    country_id integer NOT NULL,
    region text,
    city_id integer NOT NULL
);


ALTER TABLE public.supplier_addr OWNER TO postgres;

--
-- Name: supplier_addr_supplier_addr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.supplier_addr ALTER COLUMN supplier_addr_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.supplier_addr_supplier_addr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: supplier_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier_contacts (
    supplier_contacts_id integer NOT NULL,
    supplier_id integer NOT NULL,
    name text NOT NULL,
    phone text NOT NULL,
    email text NOT NULL,
    website text
);


ALTER TABLE public.supplier_contacts OWNER TO postgres;

--
-- Name: supplier_contacts_supplier_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.supplier_contacts ALTER COLUMN supplier_contacts_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.supplier_contacts_supplier_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: supplier_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.supplier ALTER COLUMN supplier_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.supplier_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (brand_id, name, description, company_id) FROM stdin;
1	Bremani Makeup	The random collision of particles in the atmosphere creates mesmerizing Northern Lights.	1
2	Bremani Care	Exploring the vastness of the universe, astronomers discover a random pulsar emitting powerful beams of energy.	1
3	Tropical Mists	In a spontaneous burst of creativity, an artist splashes random colors onto the canvas, forming a captivating abstract masterpiece.	1
4	NSP Everyday	Amidst the bustling city streets, a chance encounter leads to a random but profound connection between two strangers.	1
5	NSP Health Care	The unpredictable weather takes a random turn, surprising everyone with an unexpected downpour of rain in the midst of summer.	1
6	NSP Health Library	The random arrangement of musical notes creates a haunting melody that resonates deeply with listeners.	1
7	NSP Accessories	Explorers stumble upon a hidden treasure chest buried in a random location on a remote island, filled with ancient artifacts and riches.	1
8	NSP Clothes	A writer's imagination takes flight as random thoughts weave together into a compelling story with unexpected twists.	1
9	PSN Health Care	In a crowded marketplace, a street magician pulls off an astonishing trick, leaving the audience in awe of his random acts of illusion.	2
10	PSN Everyday	A hiker follows a random trail through the dense forest, discovering a hidden waterfall cascading down a picturesque cliff.	2
11	PSN Health Library	A scientist conducts a series of random experiments, hoping to uncover new insights and make groundbreaking discoveries in their field.	2
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (city_id, name, country_id, population_mil, tel_area_code, time_delta) FROM stdin;
1	Washington	1	1	{"+1 202"}	-4
2	Moscow	2	50.1	{"8 499","8 498","8 495"}	3
3	Astana	3	45.7	{"+7 7172"}	6
4	Kiev	4	19.4	{"+380 44"}	2
\.


--
-- Data for Name: color_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.color_schema (color_schema_id, name) FROM stdin;
1	Light
2	Dark
3	Alternative
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (company_id, name, abbr, description, country_id) FROM stdin;
1	Nature's Sunshine Company	NSP	High quality Dietary Supplements	1
2	Personal Super Nature	PSN	Made up high quality company	1
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (country_id, name, capital_city_id, continent, population_mil, language_id, currency_id) FROM stdin;
1	USA	1	North America	333.287	1	1
2	Russia	2	Asia	120	2	2
3	Kazakhstan	3	Asia	19.644	3	3
4	Ukraine	4	Europe	41.167	4	4
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (currency_id, name, abbr, signature) FROM stdin;
1	Dollar US	USD	$
2	Ruble	RUB	₽
3	Tenge	KZT	₸
4	Hryvnia	UAH	₴
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, first_name, last_name, middle_name) FROM stdin;
1	Smith	John	David
2	Brown	Emily	Grace
3	Davis	Benjamine	Michael
4	Anderson	Olivia	Sophia
5	Wilson	William	Thomas
6	Martinez	Ava	Elizabeth
7	Clark	James	Alexander
8	Taylor	Charlotte	Grace
9	Lee	Daniel	Joseph
10	Walker	Sophia	Rose
11	Garcia	Ethan	Matthew
12	Hernandez	Mia	Olivia
13	White	Samuel	Benjamin
14	Martin	Isabella	Emma
15	Thompson	Noah	David
16	Lewis	Harper	Ava
17	Turner	Samuel	James
18	Adams	Amelia	Harper
19	Hall	Jackson	Daniel
20	Johnson	Abigail	Lily
\.


--
-- Data for Name: customer_bio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_bio (customer_bio_id, customer_id, age, birth_date, gender_id, family_status_id, has_children, language_id) FROM stdin;
1	1	55	2023-07-10	2	2	t	2
2	2	23	2023-12-23	2	2	f	3
3	3	21	2023-02-14	3	1	f	1
4	4	80	2023-09-25	2	8	f	1
5	5	83	2023-07-10	2	2	f	2
6	6	55	2023-12-23	2	2	t	3
7	7	23	2023-12-23	2	2	f	3
8	8	21	2023-02-14	3	1	f	1
9	9	80	2023-09-25	2	8	f	1
10	10	23	2023-12-23	2	2	f	3
11	11	21	2023-02-14	3	1	f	1
12	12	80	2023-09-25	2	8	f	1
13	13	83	2023-07-10	2	2	f	2
14	14	55	2023-12-23	2	2	t	3
15	15	23	2023-12-23	2	2	f	3
16	16	83	2023-07-10	2	2	f	2
17	17	55	2023-12-23	2	2	t	3
18	18	23	2023-12-23	2	2	f	3
19	19	21	2023-02-14	3	1	f	1
20	20	80	2023-09-25	2	8	f	1
\.


--
-- Data for Name: customer_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_contacts (customer_contacts_id, customer_id, phone, email) FROM stdin;
1	1	(555) 123-4567	john.smith@example.com
2	2	(555) 987-6543	emily.johnson@example.com
3	3	(555) 246-8135	benjamin.brown@example.com
4	4	(555) 369-2580	olivia.davis@example.com
5	5	(555) 480-7926	william.anderson@example.com
6	6	(555) 951-3578	ava.wilson@example.com
7	7	(555) 753-0864	james.martinez@example.com
8	8	(555) 209-6741	charlotte.clark@example.com
9	9	(555) 638-5712	daniel.taylor@example.com
10	10	(555) 724-3059	sophia.lee@example.com
11	11	(555) 831-4967	ethan.walker@example.com
12	12	(555) 467-0283	mia.garcia@example.com
13	13	(555) 295-1847	samuel.hernandez@example.com
14	14	(555) 816-7032	isabella.white@example.com
15	15	(555) 374-5291	noah.martin@example.com
16	16	(555) 962-0415	harper.thompson@example.com
17	17	(555) 508-3679	samuel.lewis@example.com
18	18	(555) 741-9265	amelia.turner@example.com
19	19	(555) 203-5487	jackson.adams@example.com
20	20	(555) 679-3158	abigail.hall@example.com
\.


--
-- Data for Name: customer_outer_distr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_outer_distr (customer_outer_distr_id, customer_id, company_id, distr_id, sponsor_distr_id) FROM stdin;
1	1	1	7345671	\N
2	2	1	7345698	\N
3	3	1	7345725	\N
4	4	1	7345752	\N
5	5	1	7345779	\N
6	6	1	7345806	\N
7	7	1	7345833	7345779
8	8	1	7345860	\N
9	9	1	7345887	\N
10	10	1	7345914	\N
11	11	1	7345941	\N
12	12	1	7345968	\N
13	13	1	7345995	\N
14	14	1	7346022	7345941
15	15	1	7346049	\N
16	16	1	7346076	7345860
17	17	1	7346103	\N
18	18	1	7346130	\N
19	19	1	7346157	7345995
20	20	1	7346184	\N
\.


--
-- Data for Name: customer_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_preferences (customer_preferences_id, customer_id, color_schema_id, language_id, currency_id, wish_list, chart, last_seen) FROM stdin;
1	1	\N	1	2	{}	{}	{}
2	2	\N	3	3	{}	{}	{}
3	3	2	\N	\N	{}	{}	{}
4	4	\N	2	\N	{}	{}	{}
5	5	1	\N	\N	{}	{}	{}
6	6	\N	\N	\N	{}	{}	{}
7	7	\N	\N	3	{}	{}	{}
8	8	\N	2	\N	{}	{}	{}
9	9	2	\N	\N	{}	{}	{}
10	10	\N	\N	\N	{}	{}	{}
11	11	\N	2	\N	{}	{}	{}
12	12	\N	\N	\N	{}	{}	{}
13	13	\N	3	\N	{}	{}	{}
14	14	1	3	2	{}	{}	{}
15	15	\N	\N	\N	{}	{}	{}
16	16	\N	1	1	{}	{}	{}
17	17	2	\N	\N	{}	{}	{}
18	18	\N	\N	\N	{}	{}	{}
19	19	\N	1	3	{}	{}	{}
20	20	\N	\N	\N	{}	{}	{}
\.


--
-- Data for Name: customer_ship_addr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_ship_addr (customer_ship_addr_id, customer_id, country_id, region, city_id, street, building, appartment, floor, entrance, has_fence, postal_code) FROM stdin;
1	1	2	\N	2	Hytroin	32	141	51	C	f	33597
2	2	3	\N	3	Agtyes	124c	101	31	A	t	58476
3	3	1	\N	1	Bolshevistskaya	45	25	6	B	t	124005
4	4	1	\N	1	Abai	89a	41	10	2	f	940086
5	5	2	\N	2	Hytroin	32	141	51	C	f	33597
6	6	3	\N	3	Agtyes	124c	101	31	A	t	58476
7	7	1	\N	1	Bolshevistskaya	45	25	6	B	t	124005
8	8	1	\N	1	Abai	89a	41	10	2	f	940086
9	9	3	\N	3	Agtyes	124c	101	31	A	t	58476
10	10	1	\N	1	Bolshevistskaya	45	25	6	B	t	124005
11	11	1	\N	1	Abai	89a	41	10	2	f	940086
12	12	2	\N	2	Hytroin	32	141	51	C	f	33597
13	13	3	\N	3	Agtyes	124c	101	31	A	t	58476
14	14	1	\N	1	Bolshevistskaya	45	25	6	B	t	124005
15	15	1	\N	1	Abai	89a	41	10	2	f	940086
16	16	1	\N	1	Bolshevistskaya	45	25	6	B	t	124005
17	17	1	\N	1	Abai	89a	41	10	2	f	940086
18	18	3	\N	3	Agtyes	124c	101	31	A	t	58476
19	19	1	\N	1	Bolshevistskaya	45	25	6	B	t	124005
20	20	1	\N	1	Abai	89a	41	10	2	f	940086
\.


--
-- Data for Name: customer_statistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_statistics (customer_statistics_id, customer_id, purchase_first, purchase_total, item_total, spent_total) FROM stdin;
1	1	\N	0	0	0
2	2	\N	0	0	0
3	3	\N	0	0	0
4	4	\N	0	0	0
5	5	\N	0	0	0
6	6	\N	0	0	0
7	7	\N	0	0	0
8	8	\N	0	0	0
9	9	\N	0	0	0
10	10	\N	0	0	0
11	11	\N	0	0	0
12	12	\N	0	0	0
13	13	\N	0	0	0
14	14	\N	0	0	0
15	15	\N	0	0	0
16	16	\N	0	0	0
17	17	\N	0	0	0
18	18	\N	0	0	0
19	19	\N	0	0	0
20	20	\N	0	0	0
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, first_name, last_name, middle_name) FROM stdin;
1	Andrew	Postarnak	\N
2	Ivan	Postarnak	\N
3	Ann	Hathaway	\N
4	Morgan	Freeman	\N
\.


--
-- Data for Name: employee_access_level; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_access_level (employee_access_level_id, level, description) FROM stdin;
1	AAA	AAA is the highest access level in the company
\.


--
-- Data for Name: employee_addr_liv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_addr_liv (employee_addr_liv_id, employee_id, country_id, region, city_id, street, building, appartment, floor, entrance, has_fence, postal_code) FROM stdin;
1	1	1	\N	1	Agtyes	32	141	51	C	f	33597
2	2	1	\N	1	Hytroin	124c	101	31	A	t	58476
3	3	3	\N	3	Abai	45	25	6	B	t	124005
4	4	2	\N	2	Bolshevistskaya	89a	41	10	2	f	940086
\.


--
-- Data for Name: employee_addr_reg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_addr_reg (employee_addr_reg_id, employee_id, country_id, region, city_id, street, building, appartment, floor, entrance, has_fence, postal_code) FROM stdin;
1	1	2	\N	2	Hytroin	32	141	51	C	f	33597
2	2	3	\N	3	Agtyes	124c	101	31	A	t	58476
3	3	1	\N	1	Bolshevistskaya	45	25	6	B	t	124005
4	4	1	\N	1	Abai	89a	41	10	2	f	940086
\.


--
-- Data for Name: employee_bio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_bio (employee_bio_id, employee_id, age, birth_date, gender_id, family_status_id, has_children, language_id) FROM stdin;
1	1	55	2023-07-10	2	2	t	2
2	2	23	2023-12-23	2	2	f	3
3	3	21	2023-02-14	3	1	t	1
4	4	98	2023-09-25	2	8	f	1
\.


--
-- Data for Name: employee_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_contacts (employee_contacts_id, employee_id, phone, email, emergency_phone) FROM stdin;
1	1	8(983)320-45-15	fitohall@yandex.ru	\N
2	2	+7(778)653-28-15	ivan.postarnak@yandex.ru	\N
3	3	5641328734	kissygirl@gmail.com	\N
4	4	4569137542	greatman@email.ru	\N
\.


--
-- Data for Name: employee_contract_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_contract_type (employee_contract_type_id, contract_type, description) FROM stdin;
1	Full-time	Full-time - The individual is employed or engaged in a position where they work the standard or designated hours for that role.
2	Part-time	Part-time - The individual is employed or engaged in a position where they work fewer hours than a full-time employee.
3	Temporary	Temporary - The individual is hired or engaged for a specific period of time to fulfill a temporary need or cover a temporary vacancy.
4	Contract	Contract - The individual is engaged in a work arrangement based on a formal contract that outlines the terms and conditions of their employment or services.
5	Freelance	Freelance - The individual works independently, offering their services to multiple clients or companies on a project-by-project basis.
6	Internship	Internship - The individual is engaged in a temporary work experience that provides practical training and learning opportunities within a specific field or industry.
7	Seasonal	Seasonal - The individual is employed or engaged for a specific season or period of the year when there is a higher demand for certain products or services.
8	Project-based	Project-based - The individual is hired or engaged to work on a specific project or assignment, usually with a defined scope and timeline.
9	Volunteer	Volunteer - The individual provides their services or assistance willingly and without financial compensation, often for charitable or community-based organizations.
10	Apprentice	Apprentice - The individual is undergoing a period of training and learning in a skilled trade or profession under the guidance of an experienced practitioner.
\.


--
-- Data for Name: employee_hire_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_hire_data (employee_hire_data_id, employee_id, hire_date, prev_promotion_date, next_promotion_date, termination_date) FROM stdin;
1	1	2022-09-10	\N	\N	2030-10-10
2	2	2023-04-25	\N	\N	2031-05-23
3	3	2018-02-18	\N	\N	\N
4	4	2020-07-13	\N	\N	2028-11-15
\.


--
-- Data for Name: employee_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_payment (employee_payment_id, employee_id, currency_id, salary_mod, bonus_mod, account_num, tax_account_num) FROM stdin;
1	1	1	1	1	12831982647619461	1283198264761123
2	2	1	1	1	12831982647619462	1283198264761124
3	3	1	1	1	12831982647619463	1283198264761125
4	4	1	1	1	12831982647619464	1283198264761126
\.


--
-- Data for Name: employee_position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_position (employee_position_id, name, description, salary_mod, bonus_mod, superior_id) FROM stdin;
1	CEO (Chief Executive Officer)	CEO (Chief Executive Officer) - The highest-ranking executive in a company, responsible for making major corporate decisions and managing overall operations.	36	36	\N
2	COO (Chief Operating Officer)	COO (Chief Operating Officer) - The senior executive responsible for overseeing the day-to-day operations and ensuring the smooth functioning of the organization.	32	32	1
3	CTO (Chief Technology Officer)	CTO (Chief Technology Officer) - The executive in charge of the company's technological and IT strategies, responsible for driving innovation and managing technology-related operations.	32	32	1
4	CMO (Chief Marketing Officer)	CMO (Chief Marketing Officer) - The executive responsible for developing and implementing the company's marketing strategies to promote its products or services and drive business growth.	32	32	1
5	CIO (Chief Information Officer)	CIO (Chief Information Officer) - The executive responsible for managing the company's information technology systems and ensuring the efficient use of technology to achieve business objectives.	32	32	1
6	HR Manager	HR Manager - The professional responsible for managing the company's human resources, including recruitment, employee relations, training, and performance management.	28	22	2
7	Shop Administrator	Shop Administrator - The person responsible for overseeing the administrative functions of a shop, including inventory management, scheduling, and customer service coordination.	24	16	2
8	Shop Sales Manager	Shop Sales Manager - The individual responsible for managing the sales team in a shop, setting sales targets, and implementing strategies to drive sales and achieve revenue goals.	18	10	7
9	Shop Sales Consultant	Shop Sales Consultant - The sales professional who provides expert advice and assistance to customers, helping them find suitable products and making sales within the shop.	12	4	8
10	Shop Cashier Consultant	Shop Cashier Consultant - The individual responsible for processing sales transactions, handling cash, and providing excellent customer service at the shop's cashier counter.	12	4	8
\.


--
-- Data for Name: employee_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_preferences (employee_preferences_id, employee_id, color_schema_id, language_id, currency_id) FROM stdin;
1	1	\N	\N	\N
2	2	\N	\N	\N
3	3	\N	\N	\N
4	4	\N	\N	\N
\.


--
-- Data for Name: employee_shift; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_shift (employee_shift_id, employee_id, shop_id, manager_id, has_keys, shift_start_time, hours_per_day, days_per_week) FROM stdin;
1	1	1	\N	t	08:00:00	10	5
2	2	1	1	t	08:00:00	10	5
3	3	2	2	t	08:00:00	10	5
4	4	2	3	f	10:00:00	8	5
\.


--
-- Data for Name: employee_specific; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_specific (employee_specific_id, employee_id, has_kin_in_company) FROM stdin;
1	1	t
2	2	t
3	3	f
4	4	f
\.


--
-- Data for Name: employee_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_state (employee_state_id, employee_id, position_id, contract_type_id, status_id, access_level_id) FROM stdin;
1	1	1	1	1	1
2	2	5	8	3	1
3	3	7	9	4	1
4	4	8	6	7	1
\.


--
-- Data for Name: employee_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_status (employee_status_id, status, description) FROM stdin;
1	Active	Active - The individual is currently engaged and actively participating in their duties or responsibilities.
2	On leave	On leave - The individual is temporarily away from their usual duties due to an approved leave of absence.
3	On probation	On probation - The individual is undergoing a trial period or assessment to evaluate their performance or suitability for a specific role.
4	Suspended	Suspended - The individual's participation or privileges have been temporarily halted as a disciplinary action.
5	Leave of absence	Leave of absence - The individual has been granted an approved period of time away from their usual responsibilities.
6	Absent without leave	Absent without leave - The individual is not present and has not obtained prior permission or authorization for their absence.
7	Inactive	Inactive - The individual is not currently participating or involved in their usual activities or responsibilities.
\.


--
-- Data for Name: exchange_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exchange_rate (exchange_rate_id, currency_from, currency_to, current_rate, previous_rate, update_ts, default_rate, min_rate, max_rate) FROM stdin;
1	1	2	81.49	81.48	2023-05-16 06:45:49.75678	80	70	100
2	1	3	455.55	455.54	2023-05-16 06:45:49.75678	450	400	650
3	1	4	36.67	36.65	2023-05-16 06:45:49.75678	36	30	70
\.


--
-- Data for Name: family_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family_status (family_status_id, name, description) FROM stdin;
1	Married	Married - The individual is legally joined in matrimony to another person.
2	Single	Single - The individual is not currently married or in a committed relationship.
3	Divorced	Divorced - The individual's marriage has been legally dissolved.
4	Widowed	Widowed - The individual's spouse has passed away.
5	Separated	Separated - The individual is no longer living with their spouse but remains legally married.
6	Engaged	Engaged - The individual is in a committed relationship and has plans to get married.
7	Domestic Partnership	Domestic Partnership - The individual is in a legally recognized partnership akin to marriage.
8	Common-law marriage	Common-law marriage - The individual is in a long-term relationship that is recognized as a marriage despite not being formally married.
9	Blended family	Blended family - The individual is part of a family that includes stepparents, stepsiblings, or half-siblings.
10	Extended family	Extended family - The individual's family includes relatives beyond the immediate family, such as grandparents, aunts, uncles, and cousins.
11	Adoptive family	Adoptive family - The individual is part of a family where one or more members have been legally adopted.
12	Foster family	Foster family - The individual is part of a family that provides temporary care for children in need.
13	Single-parent family	Single-parent family - The individual is a parent raising a child or children alone.
14	Multigenerational family	Multigenerational family - The individual's family includes multiple generations living together or in close proximity.
\.


--
-- Data for Name: gender; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gender (gender_id, name) FROM stdin;
1	Any
2	Male
3	Female
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.language (language_id, name, name_native, code) FROM stdin;
1	English	English	en
2	Russian	Русский	ru
3	Kazakh	Қазақша	kk
4	Ukrainian	Українська	uk
\.


--
-- Data for Name: measure_unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.measure_unit (measure_unit_id, name, abbr) FROM stdin;
1	milligrams	mg
2	milliliters	ml
3	pages	pg
\.


--
-- Data for Name: packing_material; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packing_material (packing_material_id, name, description) FROM stdin;
1	Plastic	A synthetic material made from polymers that is versatile, lightweight, and commonly used for various applications
2	Glass	A solid, transparent material made from silica that is brittle, often used for containers, windows, and decorative items
3	No packing	Prodcuts, that don't have any package
\.


--
-- Data for Name: payment_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_type (payment_type_id, name) FROM stdin;
1	Combine
2	Cash
3	Card
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post (post_id, title, content, author_id, language_id, rating_5, votes_number_5, visited_total, create_ts, edit_ts) FROM stdin;
1	BodyPart Arms&Hands	Introduction:\n\nThe hands and forearms are important parts of our body that enable us to perform various movements and perform tasks of everyday life. They consist of various structures, including bones, muscles, tendons, and joints. In this part, we will consider the functions of the hands and forearms, common diseases and recovery methods, and also answer the question about the presence of organs in them.\n\nFunctions:\n\nMotor functions: The arms and forearms provide us with the ability to perform a variety of movements, including lifting, holding, pulling, turning, etc. This allows us to perform various tasks, both simple and complex, related to work, sports, household chores and other everyday activities.\n\nTouch and tactile functions: Hands are our main organ of touch. Thanks to sensitive nerve endings and receptors, we can evaluate the texture, shape, temperature and other tactile properties of objects.\n\nManipulative functions: Hands and forearms allow us to manipulate objects and tools. This includes squeezing, unclenching, precise finger movement, stroke and other motor skills needed to perform various tasks.\n\nDiseases:\n\nInjuries: The arms and forearms include various injuries, such as bone fractures, tendon sprains, joint dislocations and wounds. These injuries can be caused by accidents, falls, sports, or other traumatic situations.\n\nCarpal tunnel syndrome: This disorder is associated with compression of the median nerve in the wrist. It can cause pain, numbness and weakness in the hands, as well as make it difficult to perform simple movements.\n\nArthritis: Various forms of arthritis can affect the joints of the hands and forearms, causing pain, inflammation, limited mobility and joint deformity.\n\nTendonitis: This is an inflammation of the tendons, which can occur due to overexertion, injury or repetitive movements. It is accompanied by pain, swelling and restriction of movement of the arms and forearms.\nRecovery:\n\nPhysical therapy: Physical exercises and therapeutic techniques can help restore strength, flexibility and mobility of the arms and forearms after injury or illness. It is recommended to work with an experienced physiotherapist to develop an individual recovery program.\n\nProper nutrition: A healthy and balanced diet is an important aspect of restoring the system of the hands and forearms. Include in your diet foods rich in nutrients, such as fruits, vegetables, healthy fats (e.g. nuts, avocados, fish), proteins and minerals.\n\nRest and regular breaks: In order to prevent overexertion and avoid damage to the hands and forearms, it is important to give them enough rest and take regular breaks during long loads or monotonous work.\n\nAvoid bad habits: Avoid smoking and drinking alcohol, as they can negatively affect blood circulation and tissue health in the hands and forearms.\n\nNumber of bones:\n\nThe arms and forearms contain a lot of bones. There are 27 bones in each arm and forearm. In total, there are 54 bones in two hands and two forearms.\n\nOrgans:\n\nThere are no internal organs in the arms and forearms, as they mainly consist of bones, muscles, tendons and joints designed for movement and manipulation.\n\nConclusion:\n\nThe hands and forearms play an important role in our daily lives, providing us with the opportunity to perform a variety of movements, interact with the world around us and perform tasks. However, they are also susceptible to various diseases and injuries that can limit their functionality and cause pain.\n\nWith the help of physical therapy, proper nutrition, rest and avoidance of bad habits, we can contribute to the restoration and strengthening of the system of the hands and forearms. Regular exercises designed to develop strength, flexibility and mobility, as well as nutrition rich in nutrients, contribute to the recovery and health of these parts of the body.\n\nIt is also important to remember that there are many bones in the arms and forearms that provide them with structural support. And although they have no internal organs, their health and functionality are essential for our overall well-being.\n\nBy maintaining the health of the hands and forearms, we can enjoy freedom of movement, effectively perform tasks and fully participate in everyday life. Take care and take care of these important parts of your body, and they will serve you for many years.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
2	BodyPart Chest	Introduction:\nThe chest is one of the key parts of our body that plays an important role in protecting internal organs, providing support and ensuring the proper functioning of the respiratory system. In this part, the importance of the chest, the disorders associated with it, and ways to maintain its health will be considered.\n\nChest functions:\n\nOrgan protection: The chest serves as a protective 'body' that surrounds and protects organs inside the chest cavity, such as the heart, lungs, esophagus and diaphragm.\nRespiratory System Support: The chest provides support for the working respiratory muscles, such as the intercostal muscles and the diaphragm, which control inhalation and exhalation.\nParticipation in movement: The chest plays a role in the movement of the shoulders and upper body, providing support and stability.\nChest diseases:\n\nOsteochondrosis: This is a condition characterized by degenerative changes of the spine in the thoracic region, which can lead to pain, limited mobility and discomfort.\nBreast cancer: Breast cancer can develop in the lungs, mammary gland, thoracic spine or other chest tissues. It can manifest itself in various symptoms, including pain, cough, shortness of breath or changes in the mammary gland.\nChest injuries: Injuries, such as rib fractures or organ damage as a result of a blow or accident, can cause pain, respiratory disorders and serious complications.\nProducts for restoring the health of the chest:\n\nProtein: Protein sources such as meat, fish, eggs, and dairy products help repair and repair chest tissue.\nFruits and Green Vegetables: Rich in antioxidants and vitamins, green vegetables such as spinach, broccoli and cabbage help maintain chest health and reduce the risk of developing certain diseases, including cancer.\nFish: Fish, especially oily varieties such as salmon and tuna, are rich in omega-3 fatty acids, which promote heart health and may have anti-inflammatory effects.\nNuts and seeds: Nuts and seeds, such as walnuts, almonds and flaxseeds, contain beneficial fatty acids, antioxidants and vitamins that contribute to the overall health of the body, including the chest.\nThe number of bones in the chest:\nThe thorax consists of 12 pairs of ribs forming 24 separate bones. In addition to the ribs, there are also collarbones, brisket and spine in the chest.\n\nOrgans in the chest:\nThe thoracic cavity contains organs such as the heart, lungs, esophagus, thoracic spine, part of the stomach and large vessels passing through the thoracic cavity, such as the aorta and vena cava.\n\nConclusion:\nThe chest performs important functions in protecting organs, maintaining the respiratory system and participating in movement. Various diseases, such as osteochondrosis, chest cancer and injuries, can have a negative impact on the health of the chest. Proper nutrition, including proteins, fruits, vegetables, fish, nuts and seeds, can help restore and maintain the health of the chest.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
3	BodyPart Genitals	Introduction:\nThe genitals are a part of the body that relates to reproduction and sexual function. In men, they include the penis, scrotum and prostate gland, and in women - the vagina, uterus, ovaries and vulva. Genitals play an important role in reproduction and sexuality, and their health is a key aspect of overall well-being.\n\nFunctions:\nGenitals perform a number of important functions, including:\n\nReproduction: The genitals allow sexual intercourse, which is necessary for conception and the birth of offspring.\nRelease of sex hormones: The genitals produce sex hormones such as testosterone in men and estrogens in women, which play a role in the development and functioning of the reproductive system.\nUrination: In men, the penis also serves as a channel for removing urine from the bladder.\nDiseases:\nGenitals can be subject to various diseases and conditions, including:\n\nInfections of the genitourinary system: Include infections of the urinary tract, vagina and genitals, such as cystitis, vaginitis, urolithiasis and genital herpes.\nGenital cancer: Men can develop prostate cancer, and women can develop uterine cancer, ovarian cancer and vulvar cancer.\nSexually transmitted infections (SPI): They include sexually transmitted infections such as chlamydia, gonorrhea, syphilis, HIV and others.\nNutrition to maintain Genital Health:\nProper nutrition plays an important role in maintaining genital health. Some products that may be useful include:\n\nFruits and Vegetables: Rich in antioxidants and vitamins, fruits and vegetables help maintain tissue health and strengthen the immune system.\nOmega-3 fatty acids: Some studies show that omega-3 fatty acids can promote the health of the reproductive system, improve blood flow and reduce inflammation. Omega-3 fatty acids can be obtained from foods such as salmon, tuna, avocado, nuts and flaxseed.\n\nProtein: Protein products such as meat, fish, eggs, tofu and beans are an important building material for the tissues and cells of the body, including the genitals.\nVitamins and Minerals: Nutrients such as vitamin C, vitamin E, zinc and selenium can play a role in maintaining genital health. They are found in foods such as citrus fruits, nuts, seeds, red pulp, seafood and green vegetables.\nNumber of bones:\nThere are no bones in the genitals. They consist of various tissues, including muscles, blood vessels, nerves and connective tissue, but do not contain a skeleton of bones.\n\nOrgans in the genitals:\nGenitals contain various organs, depending on gender. In men, the penis, scrotum and prostate gland are located in the genitals. In women, the vagina, uterus, ovaries and vulva are located in the genitals.\n\nConclusion:\nGenitals play an important role in reproduction and sexuality. Various diseases, such as infections, cancer and SPI, can affect the health of the genitals. However, with the help of early diagnosis, treatment and proper nutrition, we can maintain and improve the health of the genitals. A varied and nutritious diet, including fruits, vegetables, omega-3 fatty acids, proteins and vitamins, can help maintain genital health.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
4	BodyPart Head	Introduction:\n\nThe head is the upper part of the body, containing many organs and playing a key role in the functioning of various body systems. It consists of a skull, a face, and all related structures. The head performs many functions, including protecting the brain, sensory organs and other important structures, as well as providing basic functions of digestion, respiration and smell.\n\nHead functions:\n\nBrain protection: The head includes the skull, which serves as a protective shell for the brain, preventing it from being damaged by injuries or blows.\n\nSense of smell and taste: The head contains organs of smell and taste, such as the nose and tongue, which allow you to sense and recognize smells and tastes.\n\nVision and hearing: The eyes and ears are located in the head, which play a key role in vision and hearing, allowing us to see and hear the world around us.\n\nDigestion: In the head there are jaws and teeth that help in the process of chewing food and the initial stage of digestion.\n\nDiseases of the head:\n\nHeadache: Common causes of headaches include migraines, tension, and cluster headaches.\n\nHearing disorders: Various hearing problems, such as hearing loss, tinnitus and vestibular disorders, can affect auditory functions.\n\nProblems with the sense of smell: Anosmia (complete loss of sense of smell) or hyposmia (decreased sense of smell) they are disorders of the sense of smell that can be caused by injuries, infections or other causes.\n\nDiseases of the teeth and oral cavity: Caries, periodontitis, gingivitis and other diseases of the teeth and gums can affect the health of the oral cavity and lead to pain and problems with chewing and speech.\n\nSystem Recovery:\n\nIn order to maintain the health of the head and restore its functions, it is recommended to consume certain foods that contribute to the healthy functioning of organs and tissues:\n\nNutritious foods: Include nutritious foods in your diet, including fruits, vegetables, nuts, seeds, fish and seafood. They contain vitamins, minerals and antioxidants that help maintain the health of the head and organs, including the brain, eyes and ears.\n\nFish and omega-3 fatty Acids: Eating fish such as salmon, sardines or cod that contain high levels of omega-3 fatty acids can be beneficial for brain and nervous system health.\n\nGreen vegetables: Include green vegetables such as spinach, cabbage, broccoli and leafy greens in your diet. They are rich in antioxidants and phytochemicals that can help fight inflammation and protect the nervous system.\n\nAntioxidants: Foods containing antioxidants, such as berries, dark chocolate, nuts and spices (cinnamon, turmeric), help fight oxidative stress and protect the cells of the head organs.\n\nVitamin C: Eating foods rich in vitamin C, such as citrus fruits, kiwi, papaya and red pepper, can help in maintaining the health of the vessels and tissues of the head.\n\nHydration: Constant intake of sufficient water is important for the hydration of cells and tissues of the head, including the brain.\n\nThe number of bones and the presence of organs:\n\nThere are 22 skull bones in the human head, including the upper jaw, lower jaw and facial bones. Organs located in the head include the brain, eyes, ear glands, salivary glands, tongue, nasal cavities, and ear. The brain is the main organ located inside the skull and plays a key role in the control and coordination of various body functions.\n\nConclusion:\n\nThe head is one of the most important parts of our body, containing organs responsible for many functions. The health of the head and its organs is of great importance for our overall well-being and quality of life. Regular consumption of nutritious food rich in vitamins and minerals will help maintain the health of the head and restore its functions. It is also important to consult a doctor if any diseases or problems related to the head occur in order to receive timely treatment and prevent possible complications.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
5	BodyPart Legs&Feet	Introduction:\nLegs and feet are important parts of our body that provide support, movement and movement. They perform many functions, such as walking, running, standing and supporting body weight. The health of the legs and feet is of great importance for our mobility and activity.\n\nFunctions:\nLegs and feet perform the following functions:\n\nSupport: Legs and feet provide support and support for the whole body.\nMovement: They allow us to walk, run, jump and perform other motor actions.\nBalance: Legs and feet help us maintain balance and stability when moving.\nDepreciation: They absorb shocks and vibrations when walking or running, softening the load on joints and bones.\nDiseases:\nSome common diseases associated with legs and feet include:\n\nFlat feet: This is a condition in which the sole of the foot is smoothed, which can cause pain and discomfort when walking.\nFoot fungus: This is an infectious disease that causes itching, irritation and peeling of the skin on the foot.\nAthlete's Heel: This is an inflammatory disease characterized by a painful condition of the heel, which is usually associated with intense physical exertion.\nVaricose veins: This is a condition in which the veins on the legs become dilated and curved, which can cause pain and swelling.\nSystem Recovery Products:\nTo maintain the health of the legs and feet, it is recommended to include the following foods in the diet:\n\nCalcium-rich foods such as dairy products, dark green vegetables and nuts to support bones and joints.\nFoods containing vitamin C, such as citrus fruits, kiwis and peppers, to strengthen the connective tissue and ligaments of the legs and feet.\n3. Foods rich in Omega-3 fatty acids, such as salmon, tuna and nuts, to reduce inflammation and maintain joint health.\n\nProtein foods, including meat, fish, eggs and legumes, to ensure the growth and repair of leg and foot tissues.\nWater to maintain hydration and prevent swelling.\nNumber of bones:\nThere are about 26 bones in a person's legs and feet. The bones of the legs and feet include the foot (7 bones), the lower leg (2 bones), the large and small bones of the lower leg (4 bones), as well as 26 small bones that make up the bones of the foot.\n\nOrgans:\nThere are no internal organs in the legs and feet, but they contain many muscles, tendons, ligaments and nerves that play an important role in movement and sensitivity.\n\nConclusion:\nLegs and feet play an important role in our mobility and provide support for the whole body. Diseases of the legs and feet can limit our ability to walk and perform normal tasks. Proper nutrition, care and physical activity can help maintain healthy legs and feet.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
6	BodyPart Neck	Introduction:\nThe neck is the part of the body connecting the head and trunk. It plays an important role in maintaining the position of the head, ensuring movement and supporting vital organs such as the pharynx and cervical vertebrae. In this part, we will look at the functions of the neck, some common diseases and food that contributes to its recovery.\n\nFunctions:\n\nSupporting the head and ensuring its movements.\nTransfer of food and air through the pharynx.\nProtection of the cervical vertebrae and spinal cord.\nNeck diseases:\n\nOsteochondrosis of the cervical spine: a chronic disease characterized by degenerative changes in the intervertebral discs and vertebrae in the cervical region. This can cause neck pain, limited mobility and numbness in the hands.\nCervical lymphadenitis: inflammation of the lymph nodes in the neck, usually caused by infection. This can lead to pain, swelling and redness in the area of the lymph nodes.\nNeck injuries: Include dislocations, sprains or fractures of the cervical vertebrae, which can lead to serious consequences such as impaired respiratory function and paralysis.\nFood to restore the neck:\n\nFoods rich in antioxidants such as berries, nuts and green vegetables to reduce inflammation and maintain healthy neck tissues.\nFoods containing vitamin D and calcium, such as dairy products and fish with soft bones, to maintain bone and joint health.\nProtein-rich foods such as meat, fish, eggs and legumes to support and regenerate neck muscles and tissues.\nNumber of bones:\nThere are 7 cervical vertebrae in a person's neck, which make up the cervical part of the spine.\n\nOrgans in the neck:\nThe neck contains several important organs, including:\n\nPharynx: This is the passage that connects the mouth and esophagus, and also serves to transfer air into the respiratory tract. The pharynx plays a role in the process of swallowing food and directs air into the lungs.\nThyroid gland: this is the endocrine gland, which is located in the front of the neck. It is responsible for the production of hormones that regulate metabolism and body functions.\nLarynx: it is an organ containing the vocal cords, which are responsible for the production of sound and voice.\nConclusion:\nThe neck plays an important role in maintaining the position of the head, ensuring movement and protecting some important organs. Various diseases of the neck, such as osteochondrosis, lymphadenitis and injuries, can have a significant impact on the health and functioning of this part of the body. Regular consumption of foods rich in antioxidants, vitamin D, calcium and proteins can help maintain neck health and promote its recovery.\n\nThe number of bones in a person's neck is 7 cervical vertebrae. Organs in the neck include the pharynx, thyroid gland, and larynx.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
7	BodyPart Spine	Introduction:\nThe spine is one of the key parts of the human body, consisting of a number of bones called vertebrae. It plays an important role in maintaining the structure of the body, protecting the spinal cord and providing movement and flexibility.\n\nSpine functions:\n\nSupport: The spine provides support for the body, allowing us to stand up straight and perform various movements.\nProtection: The spine surrounds and protects the spinal cord, which is part of the central nervous system.\nFlexibility: The spine consists of individual vertebrae that allow us to perform various movements, including bends, turns and bends.\nCushioning: Between the vertebrae are intervertebral discs, which serve as shock absorbers and absorb shocks when moving.\nDiseases of the spine:\n\nOsteochondrosis: This is a disorder characterized by degenerative changes in the intervertebral discs and joints of the spine. It can lead to pain, restricted movement and other symptoms.\nDisc herniation: With a herniated disc, the soft core of the intervertebral disc protrudes beyond its normal position, exerting pressure on the surrounding nerves, which causes pain and discomfort.\nSpondylosis: It is a degenerative disease of the spine that leads to wear and changes in the vertebrae. It can cause pain, movement restrictions, and discomfort.\nScoliosis: This is the curvature of the spine in the lateral direction, which can be born or develop over time. Scoliosis can cause uneven shoulders, back and lead to problems with posture and lung function.\nNutrition for the restoration of the spine:\n\nProteins: Foods rich in proteins, such as meat, fish, dairy products, eggs and legumes, help to restore and strengthen the muscles and tissues of the spine.\n\nOmega-3 Fatty Acids: Fish, nuts, flaxseed and avocado contain omega-3 fatty acids, which have anti-inflammatory properties and promote spine health.\nAntioxidants: Fruits and vegetables, especially bright and colored ones, contain antioxidants that help fight inflammation and oxidative stress associated with spinal diseases.\nCalcium and Vitamin D: Dairy products, dark green leafy vegetables, soy milk and fish such as sardines and salmon are rich in calcium, which promotes bone health. Vitamin D, which can be obtained from sunlight and food sources, is also important for calcium absorption.\nThe number of bones in the spine:\nThe spine consists of 33 or 34 vertebrae, including 7 cervical, 12 thoracic, 5 lumbar, 5 dorsal (spondyls) and sacral vertebra.\n\nOrgans in the spine:\nThe spinal cord is located in the spine, which is part of the central nervous system and is responsible for transmitting signals between the brain and the rest of the body. Also in the spine there are spinal nerves that come out of the spinal cord and innervate various organs and tissues.\n\nConclusion:\nThe spine plays an important role in maintaining the structure of the body, protecting the spinal cord and providing movement and flexibility. Various diseases of the spine, such as osteochondrosis, herniated disc, spondylosis and scoliosis, can cause pain and movement restrictions. However, proper nutrition, rich in proteins, omega-3 fatty acids, antioxidants, calcium and vitamin	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
8	BodyPart Tummy	Introduction:\nThe abdomen, also known as the stomach or abdominal cavity, is one of the main parts of the human body. It performs important functions in the digestive system and plays a role in the processing and assimilation of food, as well as in providing energy and nutrients for the body.\n\nAbdominal functions:\n\nDigestion: The stomach is the main place of digestion in the body. It secretes hydrochloric acid and enzymes that decompose food into small particles and ensure its further processing and assimilation.\nFood Storage: The stomach serves as a temporary reservoir for food, allowing us to consume large portions and ensuring the gradual release of food into the small intestine for further processing.\nHormone production: The stomach produces hormones such as gastrin and ghrelin, which regulate appetite and hunger.\nProtection: The stomach has an acidic environment that kills many microorganisms, preventing infections and protecting the body from diseases.\nAbdominal diseases:\n\nStomach ulcer: This is an ulcer that forms on the gastric mucosa, usually caused by the bacterium Helicobacter pylori or the use of certain medications. It can cause pain, discomfort and bleeding.\nGastritis: This is an inflammation of the gastric mucosa, which can be caused by infection, stress, poor nutrition or alcohol consumption. Gastritis is accompanied by symptoms such as abdominal pain, nausea and vomiting.\nReflux esophagitis: This is a condition in which the contents of the stomach return to the esophagus due to a weakened lower esophageal sphincter. It can lead to heartburn, chills and damage to the mucous membrane of the esophagus.\n4. Gastric tumor: Stomach cancer is a serious disease characterized by abnormal cell growth in the stomach. It can manifest itself through symptoms such as loss of appetite, unexplained weight loss, nausea and abdominal pain.\n\nNutrition for stomach recovery:\n\nEasily digestible foods: During the recovery period of the stomach, it is recommended to consume easily digestible foods such as porridge, cottage cheese, yogurt, boiled meat and vegetables.\nFoods rich in Prebiotics and Probiotics: Prebiotics and probiotics help maintain healthy microflora in the stomach and intestines. Prebiotic foods include onions, garlic, bananas and oatmeal, while probiotic foods include yogurt, kefir and pickled vegetables.\nHealthy Fats: It is important to consume healthy fats such as olive oil, avocado and nuts, which will help reduce inflammation and maintain stomach health.\nLow-fat proteins: Eating low-fat and easily digestible proteins, such as chicken, turkey, fish and tofu, will help restore the tissues and muscles of the stomach.\nNumber of bones in the abdomen:\nThere are no separate bones in the abdomen. It is an abdominal cavity in which internal organs such as the stomach, liver, spleen, intestines and others are located.\n\nIn conclusion, the stomach is an important part of the human body and performs a number of functions in the digestive system. Abdominal diseases, such as stomach ulcers, gastritis, reflux esophagitis and gastric tumor, can cause various symptoms and require medical intervention. Proper nutrition, including easily digestible foods, prebiotics and probiotics, healthy fats and low-fat proteins, can help restore stomach health. It is also important to know that the stomach contains various organs of the digestive system that perform specialized functions in the processing and assimilation of food.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
9	Dietary Mineral Ag Argentum	Argentum (Ag), or silver, is a chemical element that plays an important role in the human body. In this structure, we will consider the role of argentum as a food mineral, its functions, diseases associated with its deficiency, as well as food products that help restore the balance of argentum in the body.\n\nIs argentum a trace element or a macronutrient in our body?\n\nArgentum belongs to the class of trace elements. Unlike macronutrients, trace elements do not require large amounts in the body, but they still play an important role in its functioning.\n\nWhat is the percentage of argentum in the human body?\n\nThe content of argentum in the human body is extremely low and is less than 0.1 mg. However, even in such a small amount, argentum performs important functions.\n\nFunctions of the argentum:\n\nArgentum plays an important role in maintaining the health of the immune system, contributing to the fight against infections and tissue repair.\nIt may also have antibacterial and antiviral properties.\nArgentum is involved in the formation of collagen, an important protein necessary for the health of the skin, joints and connective tissues.\nIt can also promote wound healing and tissue regeneration.\nDiseases associated with argentum deficiency:\n\nDeficiency of argentum in the body is rare, because the required amount of this mineral is very low. However, in some cases, argentum deficiency may be associated with impaired wound healing, increased susceptibility to infections and a general weakening of the immune system.\n\nFood to restore the balance of the argentum:\n\nFish and seafood, such as salmon, herring and oysters, contain significant amounts of argentum\nMeat, especially beef, is a good source of argentum.\nNuts, including almonds, hazelnuts and cashews, also contain argentum.\nSeeds and grains, such as sunflower seeds and buckwheat, can be useful for restoring the balance of the argentum.\nFruits and vegetables, including bananas, pears, apples and spinach, can be an additional source of argentum.\n\nConclusion:\n\nArgentum, or silver, is an important nutritional mineral necessary to maintain the health of the immune system, wound healing and collagen formation. Although argentum deficiency is rare, eating foods rich in this mineral can help maintain its balance in the body. Fish, meat, nuts, seeds, grains, fruits and vegetables are all foods that can be included in your diet to ensure sufficient argentum content. However, it must be remembered that moderate intake and variety of food are the key to an overall healthy diet and maintaining the balance of nutrients in the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
10	Dietary Mineral As Arsenic	Introduction:\n\nMinerals play an important role in our health, and many of them are necessary for the normal functioning of our body. One of these minerals is arsenic (As). In this text, we will consider the main functions of arsenic in the body, as well as possible diseases with its excess and deficiency.\n\nIs it a trace element or a macronutrient in our body?\nArsenic is a trace element.\n\nIs he dangerous to people or not? Is he well known?\nArsenic is a toxic element that can be dangerous to human health, especially if it is in excess. It has long been known as a poison, but in small quantities arsenic can play an important role in our body.\n\nWhat percentage of arsenic is present in the human body?\nArsenic is present in the human body in very small amounts - less than 0.00005% of the total body weight.\n\nFunctions of arsenic in the body:\n\nArsenic plays a role in the metabolism of proteins and carbohydrates, as well as in the regulation of the immune system.\n\nDiseases with excess arsenic:\n\nExcess arsenic can lead to poisoning, which manifests itself in the form of headache, nausea, vomiting, diarrhea, abdominal pain, as well as disorders of the nervous system and cardiovascular system.\n\nDiseases with a lack of arsenic:\n\nThe lack of arsenic in the human body is extremely rare and can manifest itself in the form of poor appetite, growth and development disorders, as well as skin problems.\n\nFoods that should be consumed to restore the balance of arsenic:\n\nArsenic can be obtained from foods such as meat, fish, milk and dairy products, as well as nuts, beans and green vegetables. However, it should be borne in mind that excess arsenic can be dangerous, so it is important to consume it in moderation and follow dietary recommendations.\n\nConclusion:\n\nArsenic is a trace element that plays an important role in the body, but can be dangerous in excess. It is involved in the metabolism of proteins and carbohydrates, as well as in the regulation of the immune system. Excess arsenic can cause poisoning, while lack of arsenic is rare and can lead to health problems. To maintain the balance of arsenic, it is recommended to eat food rich in this trace element, but in moderation.\nA regular and balanced diet, including foods rich in arsenic, will help maintain its normal level and ensure the normal functioning of the body. However, it is recommended to follow the recommendations of nutrition experts and not exceed the recommended dose in order to avoid negative health consequences.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
11	Dietary Mineral B Borum	Introduction:\nBoron is a trace element necessary for the proper functioning of the human body. It plays an important role in many biological processes and has its own characteristics related to its level in the body.\n\nIs it a trace element or a macronutrient in our body?\nBoron is a trace element, which means that it is required in the body in small quantities. However, its role in the body is important and a lack or excess of boron can have an impact on human health.\n\nIs boron dangerous for people and how well is it known?\nBoron is a necessary element for the human body, but when consumed in excess quantities, it can be toxic. The optimal level of boron in the body must be observed to avoid negative health consequences.\n\nPercentage of boron content in the human body:\nThe percentage of boron content in the human body can vary depending on various factors, but the total level is usually less than 0.01% of the total body weight.\n\nFunctions of boron in the body:\nBoron plays an important role in many physiological processes of the body, including bone formation and support, participation in metabolism, regulation of hormonal balance, immune system functions and other processes.\n\nDiseases in case of excess boron:\nExcess boron can cause negative health consequences, including disorders of the nervous system, digestive organs, as well as fertility problems in women.\n\nDiseases in case of boron deficiency:\nBoron deficiency in the body is rare, but its insufficient consumption can lead to metabolic problems, insufficient bone development and memory problems.\n\nFoods that can be included in the diet to restore boron balance:\n\nFruits and vegetables: apples, pears, grapes, oranges, bananas, citrus fruits, peaches, plums, pears, cabbage, broccoli, carrots, potatoes, tomatoes, etc.\nNuts and seeds: almonds, hazelnuts, pistachios, pine nuts, sunflower seeds, flax seeds, chia seeds, etc.\nCereals and bakery products: oatmeal, rice, quinoa, whole grain bread, wheat bran, etc.\nMeat and fish: beef, pork, chicken, turkey, salmon, tuna, herring, etc.\nDairy products: milk, yogurt, cheese, cottage cheese, etc.\n\nConclusion:\nBoron is an important trace element that plays a role in various physiological processes of the body. It is important to maintain an optimal level of boron in the body to maintain health. Excess or deficiency of boron can cause health problems, so it is recommended to include foods rich in boron in your diet to restore the balance of this trace element. However, before changing the diet, it is recommended to consult with a doctor or nutritionist for individual recommendations.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
12	Dietary Mineral Ba Barium	Introduction:\nBarium is a chemical element that can occur in nature and be used in various industrial and medical applications. In this text, we will consider the role of barium as a food mineral and its effect on the human body.\n\nWhether barium is a trace element or a macronutrient:\nBarium is not a necessary trace element or macronutrient for the human body. It is not mandatory for the maintenance of vital activity and normal functioning of the body.\n\nIs barium dangerous to humans and how well is it known:\nBarium is a toxic element, and its effects on the human body can be harmful. In small amounts, barium is usually not dangerous, but with prolonged or increased exposure, it can cause serious health problems.\n\nPercentage of barium in the human body:\nThe percentage of barium in the human body is very low. Usually barium is present in the body in traces.\n\nBarium Functions:\nBarium has no known physiological functions in the human body.\n\nDiseases with an excess of barium:\nExcessive consumption of barium or exposure to high concentrations of barium can cause poisoning, symptoms of which may include nausea, vomiting, abdominal pain, diarrhea and other health problems.\n\nDiseases with a lack of barium:\nThe lack of barium in the body is rare, since it is not an essential mineral for the body. Therefore, the diseases associated with its deficiency are practically unknown.\n\nProducts for restoring barium balance:\nDue to the fact that barium is not an essential mineral for the body, there are no specific products recommended for restoring its balance.\n\nConclusion:\nBarium is not an essential mineral for the human body, and its effect on the body can be toxic if consumed excessively. The small amount of barium present in natural food sources usually does not pose a health hazard. However, avoid getting high concentrations of barium from industrial and other sources, as this can cause poisoning and serious health problems.\n\nIt is important to know that barium is not a food mineral that can be restored or maintained through nutrition. However, for the overall well-being of the body, it is recommended to eat a varied and balanced diet rich in nutrients, including vitamins, minerals and other necessary components.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
13	Dietary Mineral Be Beryllium	Introduction:\nBeryllium is a trace element present in the human body in small amounts. It is known for its unique properties and wide application in various industries. In this text, we will consider its role in the body, its possible effects on human health and ways to maintain the balance of this element.\n\nIs beryllium a micro- or macronutrient:\nBeryllium is a trace element, that is, it is present in the body in small amounts.\n\nIs beryllium dangerous for humans and its fame:\nBeryllium is a toxic substance and can have a harmful effect on the human body. Because of its toxicity, beryllium has become widely known as a potentially dangerous substance.\n\nPercentage of beryllium in the human body:\nBeryllium is present in the body in very low concentrations, usually less than 0.00001% of the total body weight.\n\nFunctions of beryllium in the body:\nThe exact functions of beryllium in the human body are not yet fully understood. However, it is assumed that it may play a role in the normal functioning of the nervous system and metabolism.\n\nDiseases with an excess of beryllium:\nAn excess of beryllium in the body can cause various diseases, such as berylliosis – chronic inflammation of the lungs, allergic reactions and other negative effects on the respiratory system.\n\nDiseases with a lack of beryllium:\nBeryllium deficiency in the human body is rare and its clinical significance is not clear.\n\nProducts that help restore the balance of beryllium:\nThere are no special products that can be consumed to restore the balance of beryllium. However, it is recommended to maintain the overall health of the body through proper nutrition and lifestyle. A diet rich in a variety of foods, such as vegetables, fruits, cereals, meat, fish and dairy products, will provide a sufficient amount of all the necessary trace elements, including beryllium.\n\nConclusion:\nBeryllium is a trace element present in the body in small amounts. The possible impact of beryllium on human health is the subject of research. It is important to take measures to prevent an excess of beryllium in the body and maintain the overall balance of trace elements through a balanced diet and a healthy lifestyle. In case of beryllium-related diseases, you should consult a doctor for diagnosis and treatment.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
14	Dietary Mineral Bi Bismuthum	Introduction:\nBismuth (Bi) is a mineral that is present in the human body in small amounts. In this structure, we will consider its role in the body, the potential danger to health and the need to maintain it in balance.\n\nWhether it is a trace element or a macronutrient:\nBismuth is a trace element, since the required daily intake in the body is small.\n\nDanger and level of fame:\nBismuth is generally considered safe for human consumption under normal conditions. It is widely known in the scientific and medical community, and its properties and potential side effects are well studied.\n\nPercentage in the body:\nBismuth is present in the human body in extremely small quantities. The total content of bismuth in the body is less than 0.001% of its mass.\n\nBismuth functions:\nThe role of bismuth in the body is not yet fully understood. Some studies indicate its possible anti-inflammatory and antibacterial properties. Bismuth is also used in medicine to treat some gastrointestinal disorders and ulcers.\n\nDiseases with excess bismuth:\nExcessive consumption of bismuth can cause poisoning or intoxication, accompanied by symptoms such as nausea, vomiting, stomach pain and diarrhea. However, in everyday life, excessive consumption of bismuth is not a common problem.\n\nDiseases with a lack of bismuth:\nThe lack of bismuth in the body is not a common problem, since the body's requirements for it are insignificant.\n\nBismuth Rebalancing Products:\nSince bismuth deficiency is rare, there is no need to specifically increase its intake through food. However, you should stick to a regular and varied diet to ensure the proper balance of trace elements in the body. In general, a healthy diet, including a variety of foods such as vegetables, fruits, cereals, meat, fish and dairy products, contributes to the overall well-being of the body.\n\nConclusion:\nBismuth is a trace element present in the body in small amounts. It is generally considered safe for human consumption, but excess bismuth can cause poisoning. The lack of bismuth is rare and is not a common problem. Regular and varied nutrition is key to maintaining a proper balance of trace elements in the body. If you have concerns or questions about bismuth consumption, it is recommended to consult a medical specialist.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
15	Dietary Mineral Br Bromine	Introduction:\nBromine is a chemical element that can be present in the body in small amounts. In this structure, we will consider its classification as a trace element, evaluate its potential health risks and consider its functions and roles in the human body.\n\nIs it a micro- or macronutrient:\nBromine is a trace element of the body, which means that it is required in small amounts to maintain the normal functioning of the body.\n\nHealth hazards and fame:\nBromine is a chemical element with various properties and applications. It is widely used in industry, but as a food element, its potential danger to human health is limited. Under normal conditions and with moderate consumption through food, bromine usually does not pose a health hazard.\n\nPercentage in the body:\nBromine is present in small amounts in the human body. It is usually not the main element, and its concentration in the body is less than 0.001% of the total weight.\n\nBromine functions:\nBromine performs a number of important functions in the body, including supporting the normal functioning of the nervous system, participating in metabolism and regulating the balance of fluid in the body.\n\nDisorders in case of excess:\nExcess bromine in the body may be associated with potential negative effects, including thyroid dysfunction, nervous disorders and other side effects. However, excess bromine through food is rare and is usually associated with improper use of drugs or products containing bromine.\n\nDisorders in case of deficiency:\nLack of bromine in the body is rare and usually not a problem for most people. Instead, the natural bromine content in foods usually provides sufficient amounts of this trace element to maintain normal health.\n\nProducts for restoring bromine balance:\nIf you have a bromine deficiency, it is important to pay attention to proper nutrition in order to restore its balance in the body. Some foods that may be useful for boosting bromine levels include seafood (especially seaweed), nuts, eggs, poultry, beef, and dairy products. It is also worth noting that bromine can be found in some drinking waters and mineral supplements.\n\nConclusion:\nBromine is a trace element that performs important functions in the body, but usually does not pose a danger with moderate consumption through food. Excess or lack of bromine in the body can cause some disorders, but they are rare and usually associated with the misuse of drugs or products containing bromine. A regular and varied diet, including foods rich in bromine, can help maintain its balance in the body and promote overall health.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
16	Dietary Mineral C Carbon	Introduction:\nCarbon is a chemical element that has a wide presence in living organisms and natural resources. It plays an important role in the vital activity of organisms and has a variety of functions.\n\nMicro- or macronutrient:\nCarbon is a macronutrient, as it is present in the body in large quantities.\n\nDanger to humans and level of fame:\nCarbon is not dangerous to humans under normal conditions. It is widely known and studied due to its distribution and role in organic chemistry.\n\nPercentage of content in the body:\nCarbon makes up approximately 18% of the mass of the human body, which makes it one of the most common elements in the body.\n\nFunctions:\nCarbon is the main component of organic compounds and plays a key role in many biochemical processes. It is a building block for carbohydrates, lipids, proteins and nucleic acids. Carbon is also involved in the process of respiration, energy metabolism and regulation of metabolic functions.\n\nDisorders with excess:\nExcess carbon in the body is usually not associated with medical disorders, since carbon mainly enters the body through food.\n\nDisorders with a lack of:\nLack of carbon is not a common problem, as it is widely available in food products.\n\nFoods to restore balance:\nCarbon is found in many foods, especially in carbohydrate and vegetable sources. Fruits, vegetables, cereals, bread, potatoes and many other foods contain carbon and can help restore its balance in the body.\n\nConclusion:\nCarbon is an important element for our body, playing a role in many biochemical processes. It is the main building block for organic compounds, including carbohydrates, lipids, proteins and nucleic acids. Carbon is also involved in metabolism, energy processes and regulation of metabolic functions.\n\nAlthough excess or lack of carbon is rarely associated with medical disorders, maintaining a balanced carbon level in the body is important for overall health and well-being. With an excess of carbon, for example, due to the consumption of large amounts of simple carbohydrates and sugars, there may be problems with metabolism, excess weight and an increased risk of developing chronic diseases such as diabetes and cardiovascular diseases. In conclusion, carbon is an important macronutrient for our body, performing many functions. Maintaining a balanced carbon level through a varied and nutritious diet is key to overall health and well-being.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
17	Dietary Mineral Ca Calcium	Calcium is a macronutrient in our body. It is widely known and plays an important role in maintaining the health of bones and teeth. Let's take a closer look at it:\n\nIn the human body, calcium makes up about 1-2% of the total body weight, which makes it one of the main elements. About 99% of calcium is in bones and teeth, and the rest is in tissues and blood.\n\nThe functions of calcium in the body include:\n\nFormation and maintenance of healthy bones and teeth: Calcium is the main building block of bone tissue and plays a key role in the formation of bones and their strengthening.\nMuscle function: Calcium is involved in muscle contraction and transmission of nerve impulses, ensuring proper muscle functioning.\nBlood Clotting: Calcium plays an important role in the blood clotting process, preventing excessive bleeding.\nRegulation of cellular functions: Calcium is involved in the regulation of many cellular processes, including the transmission of signals between cells.\nExcess calcium in the body can lead to hypercalcemia, which is too high a level of calcium in the blood. This can lead to the formation of kidney stones, impaired kidney function, weakened bones and heart problems.\n\nLack of calcium can lead to osteoporosis, a condition in which bones become brittle and brittle, as well as an increased risk of caries and dental problems.\n\nTo maintain the balance of calcium in the body, it is recommended to eat foods rich in calcium, such as dairy products (milk, yogurt, cheese), leafy green vegetables (broccoli, spinach), hard fish (sardines, salmon), almonds, beans and soy products. Additionally, you can take calcium supplements under the guidance of a doctor.\n\nIn conclusion, calcium is an important macronutrient for the health of bones, teeth and muscles. It plays a role in the regulation of many cellular functions and ensures the proper functioning of the body. Maintaining a calcium balance in the body is key to maintaining optimal health. Regular consumption of foods rich in calcium will help maintain its necessary level in the body.\n\nIt is important to remember that any changes in the diet or dietary supplements should be coordinated with a doctor or nutritionist, especially if there are any diseases or medications.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
18	Dietary Mineral Cd Cadmium	Structure:\n\nIntroduction:\nCadmium is a chemical element that can be present in the environment and in food products. In this text, we will consider the role of cadmium in the body, its potential danger to health and measures to maintain the balance of this mineral.\n\nElement Type:\nCadmium is a trace element for our body. This means that it is not required in large quantities, but still plays an important role for the normal functioning of the body.\n\nDanger and fame:\nCadmium is a toxic metal and its presence in the environment can be dangerous to human health. It is widely known as a harmful substance, and its effects on the human body have been studied for a long time.\n\nPercentage in the body:\nCadmium is present in the body in small amounts. Usually its concentration in tissues and organs is less than 0.001%.\n\nFunctions:\nDespite the fact that cadmium is not a necessary element for the body, it can have some effect on various processes. For example, it can interact with some enzymes and affect their activity.\n\nDiseases with excess:\nExcessive intake of cadmium into the body may be associated with the development of various diseases, such as poisoning, impaired kidney function, bone damage, etc. Prolonged exposure to high concentrations of cadmium can lead to chronic diseases.\n\nDiseases with a lack of:\nLack of cadmium is not a typical problem, as it is not the main nutrient for the body. However, in some cases, low levels of cadmium may be associated with a deficiency of enzymes that require its presence for their work.\n\nProducts to restore balance:\nIn case of excess cadmium in the body, it is recommended to limit or exclude the consumption of products that may contain this element. It is important to avoid smoking, as tobacco is one of the main sources of cadmium.\n\nAlso, to reduce the effects of cadmium on the body, it is recommended to eat foods rich in antioxidants. Vegetables and fruits, especially those that contain vitamin C, such as citrus fruits, kiwis, berries, tomatoes, can help protect the body from the negative effects of cadmium.\n\nOf course, if there are serious problems associated with cadmium, it is necessary to consult a doctor or a specialist in the field of dietetics or toxicology to obtain more accurate recommendations and an individual approach to treatment.\n\nConclusion:\nCadmium is a trace element that, despite its insignificant role in the body, can have dangerous consequences with excessive intake. It is important to control the consumption of cadmium, limiting its sources, and, if necessary, seek medical help. Proper nutrition, rich in antioxidants, can help restore balance and protect the body from the negative effects of cadmium.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
19	Dietary Mineral Cl Chlorine	Introduction:\nChlorine (Cl) is one of the important mineral elements necessary to maintain the health of the human body. It is widespread and plays an important role in various body functions.\n\nMicro- or macronutrient:\nChlorine refers to macronutrients, as it is required in large quantities to maintain normal body function.\n\nDanger and fame:\nChlorine is not dangerous for the human body with the right level of consumption. It is widely known and used in the process of water treatment, as well as in industry and household products.\n\nPercentage content:\nApproximately 0.15% of the human body weight is chlorine.\n\nFunctions:\n\nRegulation of fluid and electrolyte balance: Chlorine plays an important role in maintaining normal levels of water and electrolytes in the body.\nParticipation in the formation of gastric juice: Chlorine helps in the formation of gastric acid, which is necessary for normal digestion.\nParticipation in metabolism: Chlorine is involved in the metabolism and synthesis of proteins in the body.\nMaintaining cell health: Chlorine plays a role in maintaining the health of cells and tissues of the body.\nDiseases with excess:\nExcess chlorine in the body is rare, as the body is able to effectively excrete it through the kidneys. However, with excessive consumption of table salt or with impaired kidney function, a condition called hyperchloremia may develop. This can lead to electrolyte imbalance, edema and other problems.\n\nDiseases with a lack of:\nChlorine is the main component of salt, and a lack of chlorine in the body is rare. However, with severe loss of fluid through sweat or prolonged diarrhea, a condition called hypochloremia can develop, which is characterized by low levels of chlorine in the body. This can lead to fluid and electrolyte imbalance, weakness, decreased appetite and muscle cramps.\n\nProducts for restoring balance:\nTo maintain a normal level of chlorine in the body, it is recommended to consume a variety of foods rich in chlorine and other electrolytes. Include the following foods in your diet:\n\nSeafood: fish, shrimp, mussels and other marine products contain chlorine and other useful minerals.\nDairy products: milk, yogurt, cheese are a good source of chlorine and calcium.\nGreen vegetables: spinach, broccoli, cabbage and other green vegetables contain chlorine and other nutrients.\nSalted nuts and seeds: peanuts, hazelnuts, sunflower and pumpkin seeds contain chlorine and other useful trace elements.\nConclusion:\nChlorine is an important mineral element for maintaining normal body function. It plays a role in regulating the balance of fluid and electrolytes, the formation of gastric juice and metabolism. With an excess or lack of chlorine, some problems may arise, so it is important to maintain balance through proper nutrition and moderate consumption of table salt.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
20	Dietary Mineral Co Cobalt	Introduction:\nCobalt (Co) is a trace element necessary for the normal functioning of our body. It plays an important role in various processes taking place inside our body.\n\nIs it a trace element or a macronutrient for our body?\nCobalt is a trace element, which means that it is needed in small amounts to maintain health.\n\nIs it dangerous for humans? Is it widely known?\nCobalt, when consumed in reasonable quantities, is not dangerous to humans. It is widely known and used in various industries, including medicine and industry.\n\nPercentage in the human body:\nThe percentage of cobalt in the human body is less than 0.0001%.\n\nFunctions:\n\nCobalt is an integral part of vitamin B12, which plays a key role in the formation of red blood cells and the nervous system.\nIt is involved in the metabolism of fats, carbohydrates and proteins.\nCobalt promotes the synthesis of DNA and RNA.\nDiseases in case of excess:\nExcess cobalt in the body is rarely found under natural conditions. However, with prolonged and unprofessional contact with high concentrations of cobalt, an allergic reaction or other side effects may occur.\n\nDiseases in case of deficiency:\nDiseases in case of cobalt deficiency may be associated with a deficiency of vitamin B12, since cobalt is an integral part of this vitamin. Lack of cobalt can lead to the development of the following diseases:\n\nMegaloblastic anemia: A lack of cobalt and, accordingly, vitamin B12 can lead to a violation of the formation of red blood cells. This can lead to the development of megaloblastic anemia, characterized by an increase in the size of red blood cells and a violation of their functioning.\n\nNervous disorders: Vitamin B12, which contains cobalt, plays an important role in the nervous system. Cobalt deficiency can cause nervous disorders such as numbness and tingling in the extremities, weakness, depression, memory loss and cognitive decline.\n\nIncreased vulnerability to infections: Cobalt deficiency can weaken the immune system and make the body more vulnerable to infections.\n\nFoods to restore balance:\nTo restore the balance of cobalt and vitamin B12 in the body, it is recommended to consume the following foods:\n\nMeat: Beef, chicken, turkey and other meat products contain vitamin B12 and cobalt.\nFish and seafood: Salmon, cod, oysters and other seafood are also a good source of vitamin B12.\nDairy products: Milk, yogurt, cheese and other dairy products contain vitamin B12.\nEggs: Eggs are a source of vitamin B12.\nFortified foods: Some cereal products, such as breakfast, can be fortified with vitamin B12.\nConclusion:\n\nCobalt, as a trace element, plays an integral role in our body. It is an important component of vitamin B12, which is necessary for the normal functioning of the hematopoietic system, nervous system and metabolism.\n\nAlthough cobalt is generally not considered dangerous to humans with moderate consumption, an excess or deficiency of this mineral can cause diseases and health problems. A lack of cobalt can lead to megaloblastic anemia and nervous disorders, while an excess of cobalt can cause allergic reactions and other side effects.\n\nTo maintain the balance of cobalt in the body, it is recommended to include in the diet foods rich in vitamin B12, such as meat, fish, seafood, dairy products and eggs. It is also worth paying attention to fortified foods that can be enriched with vitamin B12.\n\nIt is important to remember that before making changes to your diet or taking additional dietary supplements, it is recommended to consult a doctor or nutritionist, especially if you have any diseases or nutritional needs.\n\nIn general, maintaining the right balance of cobalt in the body is an important aspect of overall health and well-being. A varied and balanced diet, including foods rich in vitamin B12 and cobalt, will help maintain normal body functions and prevent possible negative consequences of excess or deficiency of cobalt.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
21	Dietary Mineral Cr Chrome	Introduction:\nChromium is a trace element that plays an important role in our body. It is known for its effect on the metabolism of carbohydrates and fats, as well as on insulin sensitivity.\n\nWhether chrome is dangerous to humans or not is still unknown for sure. However, it is widely studied in the context of its role in maintaining health and preventing various diseases.\n\nThe percentage of chromium in the human body is only a small fraction, but its effect on metabolism and metabolic processes is important.\n\nFunctions:\nChromium plays a key role in the metabolism of carbohydrates, fats and proteins. It helps to absorb glucose from the blood, regulates blood sugar levels and increases insulin sensitivity. In addition, chromium is involved in DNA formation, protein synthesis and lipid metabolism.\n\nDiseases with excess chromium:\nExcess chromium in the body can be associated with various undesirable effects, including gastrointestinal disorders, allergic reactions and liver damage. However, such cases are rare and usually associated with improper intake of dietary supplements.\n\nDiseases with chromium deficiency:\nChromium deficiency can lead to impaired carbohydrate metabolism, decreased insulin sensitivity, impaired metabolism and an increased risk of developing diabetes. There is also a link between chromium deficiency and skin deterioration.\n\nProducts for restoring balance:\nTo maintain a normal level of chromium in the body, it is recommended to eat food rich in this trace element. Important sources of chromium are broccoli, eggs, meat, nuts and seeds, green vegetables, whole grains and some fruits such as apples and bananas. Organic chromium is more readily available for assimilation by the body, so preference should be given to natural sources of nutrition.\n\nConclusion:\nChromium is an important trace element that plays a role in the metabolism of carbohydrates, fats and proteins. It is necessary for the normal functioning of the body, affects blood sugar levels and insulin sensitivity. Although an excess or deficiency of chromium can cause undesirable effects, mainly associated with improper intake of dietary supplements, proper nutrition usually provides sufficient amounts of this mineral. A varied and balanced diet, including foods rich in chromium, will help maintain its optimal level in the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
22	Dietary Mineral Cs Caesium	Introduction:\nCaesium (Cs) is a chemical element that belongs to the group of alkali metals. It has the atomic number 55 and the chemical symbol Cs. Caesium is a rare and little-known mineral, and its role in the human body is not as well understood as that of other elements.\n\nIs caesium a trace element or a macronutrient for our body?\nCaesium is not an essential trace element or macroelement for the human body. It is not considered necessary to maintain the vital activity of the body, and its presence in the body is not mandatory for health.\n\nIs caesium dangerous to humans and how well is it known?\nCaesium can be dangerous to humans at high doses or in radioactive form (caesium-137). Cesium-137 is a product of nuclear explosions and accidents at nuclear power plants, and its radiation can have serious health consequences. However, natural caesium (caesium-133) is stable and is not radioactive.\n\nThe percentage of caesium in the human body:\nUsually caesium is present in the human body in small amounts. Its percentage in the human body is less than 0.0001% of the total body weight.\n\nFunctions of caesium in the body:\nThe functions of caesium in the human body are not yet fully understood. According to available data, caesium does not perform specific biological functions and is not an integral part of metabolic processes.\n\nDiseases with an excess of caesium:\nExcess cesium in the human body is usually associated with radioactive cesium-137. A high dose of radioactive caesium can lead to various diseases associated with radiation damage, including cancer, organ and tissue dysfunction, DNA damage and other radiation-induced effects. Moreover, such effects can occur both immediately after exposure and after a long time.\n\nDiseases with a lack of cesium:\nSince caesium is not an essential element for the body, a lack of caesium in the body is not common and usually does not cause specific diseases.\n\nFoods that can restore the balance of caesium:\nSince caesium is not a necessary element for the body, there are no special foods that need to be consumed to restore its balance. However, in general, maintaining a healthy lifestyle, including a balanced diet, can contribute to the overall well-being of the body.\n\nConclusion:\nCesium is not an essential element for the human body and its functions and effects on human health have not yet been fully studied. However, in the case of radioactive caesium-137, its radiation can have serious health consequences and cause radiation diseases. Regular monitoring of environmental radioactivity and ensuring safe working conditions with radioactive materials are important measures to prevent potential diseases associated with cesium.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
23	Dietary Mineral Cu Cuprum	Introduction:\nCopper (Cu) is a trace element necessary for the normal functioning of the body. It is widely known and is important for various processes in the human body.\n\nIs copper dangerous to humans?:\nCopper is not a dangerous element for humans with proper dosing and moderate consumption. However, with a significant excess of copper or with a violation of copper metabolism in the body, health problems may occur.\n\nPercentage of copper content in the human body:\nCopper is present in the human body in small amounts. The total mass of copper in an adult is approximately 50-120 mg.\n\nFunctions of copper:\n\nParticipation in the formation of blood: Copper plays an important role in the formation of red blood cells and ensuring normal iron metabolism in the body.\nAntioxidant protection: Copper is an essential component of enzymes that are involved in the processes of antioxidant protection of the body.\nNervous system function: Copper affects the normal functioning of the nervous system and is involved in the transmission of nerve impulses.\nDiseases with excess copper:\nExcess copper in the body can lead to various diseases, such as copper cirrhosis of the liver, bronze diabetes and disorders of the nervous system.\n\nDiseases with a lack of copper:\nA lack of copper in the body can cause anemia, impaired immune system function, problems with bones and joints, as well as increased sensitivity to infections.\n\nProducts that can restore copper balance:\nTo restore the balance of copper, it is recommended to use the following products:\n\nNuts and seeds: cashews, almonds, pistachios, sunflower seeds and pumpkin.\nGreen vegetables: spinach, broccoli, green peas, Brussels sprouts, green peppers.\n\nChocolate: Dark chocolate contains a small amount of copper and can be a good source.\nSeafood: oysters, shrimps, lobsters and other seafood contain some copper.\nFruits: figs, avocados, pomegranates and bananas are sources of copper.\nCereals: oatmeal, buckwheat and quinoa contain some copper.\n\nConclusion:\nCopper is an important trace element necessary for the normal functioning of the body. It performs a number of key functions, such as participation in blood formation and antioxidant protection. With an excess or lack of copper, various diseases can occur. To maintain the balance of copper in the body, it is recommended to eat foods rich in this mineral.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
24	Dietary Mineral F Fluorine	Introduction:\nFluorine is a chemical element that plays an important role in the human body. In this article, we will look at the role of fluoride in the body, its functions, the consequences of excess or deficiency, as well as products that help maintain the balance of fluoride.\n\nIs fluorine a trace element or a macronutrient in our body:\nFluorine is a trace element in the body because it is present in low concentrations.\n\nIs fluorine dangerous to humans and how well is it known:\nFluoride is an essential mineral for maintaining healthy teeth and bones. However, excess fluoride can be harmful and lead to diseases.\n\nThe percentage of fluoride in the human body:\nFluoride is present in the body in low concentrations, usually less than 0.1% of the total body weight.\n\nFunctions of fluorine in the body:\nThe main function of fluoride is to maintain dental health. It strengthens tooth enamel and prevents the development of caries. Fluoride also helps in strengthening bones and preventing osteoporosis.\n\nDiseases with an excess of fluoride:\nExcess fluoride can cause a disease called fluorosis. This condition is characterized by changes in the structure and color of teeth, the appearance of white spots and porosity of enamel. In more serious cases, skeletal damage may occur.\n\nDiseases with a lack of fluoride:\nLack of fluoride can lead to increased susceptibility to dental caries and weakening of bones.\n\nFoods that can be consumed to restore balance:\nThe main source of fluoride is drinking water, especially that which contains natural sources of fluoride. Fluoride can also be obtained from foods such as fish, tea, seafood and some vegetables. Some foods rich in fluoride include fluorinated water, seafood (especially fish with bones), tea, potatoes, spinach and pears.\n\nConclusion:\nFluoride is an important trace element necessary to maintain healthy teeth and bones. The right balance of fluoride in the body helps prevent dental caries and osteoporosis. However, an excess or lack of fluoride can cause diseases such as fluorosis and increased susceptibility to caries. Regular consumption of foods rich in fluoride and drinking water with a natural source of fluoride will help maintain a healthy balance of this mineral in the body.\n\nIt is important to note that the specific needs for fluoride may vary depending on age, gender, health status and other factors. It is recommended to consult with a doctor or nutritionist to get individual recommendations regarding the consumption of fluoride.\n\nRemember that this information is provided in general terms and does not replace a consultation with a healthcare provider.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
25	Dietary Mineral Fe Ferrum	Introduction:\nIron (Fe) is one of the important trace elements necessary for the normal functioning of the human body. It plays a key role in various biological processes and is an integral part of our food and diet. In this article, we will look at the role of iron in the body, its functions, possible diseases with excess or deficiency, as well as products that help restore the balance of this important mineral.\n\nIs iron a trace element or a macronutrient in the body?\nIron is a trace element in the human body. This means that it is required in small quantities, but plays an important role in maintaining health.\n\nIs iron dangerous for humans? Is it widely known?\nIron is not dangerous to humans under normal consumption conditions. It is an integral component of food and is necessary for the normal functioning of the body. However, excess or lack of iron can lead to various diseases and conditions.\n\nPercentage of iron in the human body:\nThe percentage of iron in the body can vary depending on gender and age. In adult men, the percentage of iron is about 4 grams, and in women - about 2 grams.\n\nFunctions of iron in the body:\n\nHemoglobin Formation: Iron is an integral part of hemoglobin, a protein of red blood cells that is responsible for the transport of oxygen through the body.\nParticipation in energy metabolism: Iron is necessary for the formation of energy in the cells of the body and the maintenance of general metabolism.\nImmune function: Iron plays an important role in the functioning of the immune system and protecting the body from infections and diseases.\n\nDiseases with excess iron:\nAlthough iron is not dangerous to humans under normal conditions, excess iron in the body can cause some diseases. One of these diseases is hemochromatosis, a hereditary disorder of iron metabolism in which it accumulates in the tissues of the body, especially in the liver, heart and other organs. This can lead to damage to these organs and the development of serious conditions such as cirrhosis of the liver and heart failure.\n\nDiseases with a lack of iron:\nA lack of iron in the body can also cause various diseases. One of the most common diseases associated with iron deficiency is iron deficiency anemia. This condition is characterized by an insufficient amount of hemoglobin and red blood cells due to a lack of iron. Iron deficiency anemia can lead to a decrease in energy, fatigue, weakness, scorched skin, brittle nails and other problems.\n\nProducts for restoring iron balance:\nTo restore the balance of iron in the body, it is important to consume foods rich in iron. Some foods that can be included in your diet to increase iron content include:\n\nRed meat: Beef, lamb and pork are good sources of iron.\nPoultry: Chicken and turkey also contain significant amounts of iron.\nFish: Marine fish such as tuna, sardines and salmon are especially rich in iron.\nGreen vegetables: Spinach, broccoli, cabbage and other green vegetables are excellent sources of iron.\nNuts and seeds: Almonds, hazelnuts, sunflower and pumpkin seeds contain a useful amount of iron\nCereals and cereals: Wheat, oats, quinoa and other grains and cereals contain iron.\nEggs: Eggs also contain some iron.\nDried fruits: Raisins, prunes and other dried fruits contain iron.\nLegumes: Beans, chickpeas, lentils and other legumes are rich in iron.\nBlack and Dark Chocolate: Dark chocolate contains a small amount of iron and can be a useful source.\n\nIn conclusion, iron is an important trace element for our body. It plays a key role in the formation of hemoglobin, energy metabolism and immune function. Excess or lack of iron can cause various diseases, such as hemochromatosis and iron deficiency anemia. Consuming foods rich in iron, such as red meat, poultry, fish, green vegetables and other foods, can help restore the balance of this important mineral in the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
26	Dietary Mineral Ga Gallium	Introduction:\nGallium (Ga) is a chemical element with atomic number 31. It has low toxicity and is used in various industrial and medical applications. In this case, we will consider its significance as a dietary mineral.\n\nWhether it is a trace element or a macronutrient in our body:\nGallium is not a necessary trace element or macronutrient for the normal functioning of the human body. It is not part of the main structural components of the body and does not perform key biological functions.\n\nIs it dangerous for people? Is it widely known:\nGallium, in general, is considered a minor danger to human health. It has very low toxicity and usually does not cause negative effects upon contact or consumption in small quantities. However, large doses of gallium can have toxic properties and cause some undesirable reactions.\n\nPercentage in the human body:\nGallium is not a natural component of the human body, and its content in it is usually insignificant or absent.\n\nFunctions:\nSince gallium is not an essential mineral for the body, it has no known physiological functions or role in the human body.\n\nDiseases with excess:\nSince gallium is not a necessary mineral, its excess in the body is not considered as a disease and has no known pathological consequences.\n\nDiseases with deficiency (brief description):\nSince gallium is not a necessary mineral for the body, its deficiency is also not a problem. The absence of gallium in the diet does not cause specific diseases or deficiency conditions.\n\nProducts for restoring balance:\nRestoring the balance of gallium in the body is not required, since it is not a necessary element for its functioning. There are no special products that are recommended to be consumed to compensate for the lack or excess of gallium.\n\nConclusion:\nGallium is not a necessary dietary mineral for the human body. It has low toxicity and has no known pathological consequences when in contact or consumed in small quantities. Its deficiency or excess is not considered as a disease, and the restoration of gallium balance is not required.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
27	Dietary Mineral Ge Germanium	Germanium (Ge) is a chemical element that is usually regarded as following silicon in the periodic table of elements. In this text, we will look at the role of germanium in the human body and its potential health effects.\n\nIs germanium a micro- or macroelement in the body:\nGermanium is not usually considered as a trace element or macroelement necessary for the normal functioning of the body. It is usually present in the body in very low concentrations.\n\nIs germanium dangerous to human health and its fame:\nGermanium is usually not considered dangerous to human health under normal conditions. It is not a widely known mineral and does not attract the same attention as some other elements.\n\nPercentage of germanium in the body:\nGermanium is present in the body in very low concentrations. The total germanium content in the human body is less than 1 mg.\n\nGermanium functions in the body:\nThe role of germanium in the human body is not yet fully understood. It is not a necessary element for the normal functioning of the body, and its functions in the body are not yet clear.\n\nDiseases with an excess of germanium (brief description):\nSince germanium is not considered a necessary element for the body, its excess is not considered as a problem or cause of diseases. However, high concentrations of germanium can be toxic and cause some side effects.\n\nGermanium deficiency diseases (brief description):\nSince germanium is not a necessary element for the body, its deficiency is also not considered as a problem or cause of diseases.\n\nProducts for restoring balance:\nRestoring the balance of germanium in the body is not required, since it is not considered a necessary element. However, if you want to ensure a sufficient intake of germanium from food, you can consider the following products:\n\nNuts and seeds: Peanuts, walnuts, hazelnuts, flax seeds and pumpkins contain some germanium.\n\nCereals and grain products: Oatmeal, rice, wheat and other cereals contain a small amount of germanium.\n\nVegetables: Garlic, onion, cabbage, spinach, tomatoes and potatoes may contain a small amount of germanium.\n\nFruits: Bananas, grapes, apples and oranges contain some germanium.\n\nSeafood: Fish, especially tuna, sardines and salmon, contains a small amount of germanium.\n\nConclusion:\nGermanium is not a necessary element for the human body, and its role in the body is not yet fully understood. It is not considered a dangerous or well-known mineral. It is present in very low concentrations in the body. Lack or excess of germanium is not considered as a cause of diseases. If you want to ensure the intake of germanium from food, you can include in your diet nuts, seeds, cereals, vegetables, fruits and seafood that contain a small amount of germanium.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
28	Dietary Mineral H Hydrogen	Introduction:\nHydrogen (H) is a chemical element, first in order in the periodic table of elements. It has a simple structure consisting of one proton and one electron. Hydrogen is one of the most abundant elements in the universe and plays an important role in organic chemistry and biology.\n\nMicro- or macronutrient:\nHydrogen is a trace element in our body. This means that it is present in the body in small quantities, but despite this, it plays an important role in various physiological processes.\n\nIs hydrogen dangerous for people and its fame:\nHydrogen itself is a safe element for humans. It is widely known and used in various fields, including energy, industry and scientific research. However, hydrogen can be dangerous in the form of a combustible gas, since it is flammable. Care must be taken when handling hydrogen in its gaseous form.\n\nThe percentage of hydrogen in the human body:\nHydrogen makes up about 10% of the mass of the human body. It is present in all organic compounds, such as water, carbohydrates, lipids and proteins. Water, consisting of hydrogen and oxygen, is the main constituent component of our body.\n\nFunctions of hydrogen in the body:\nHydrogen performs a number of important functions in the body, including:\n\nParticipation in the formation of water: Hydrogen combines with oxygen to form water, which is necessary to maintain hydration and vital processes in the body.\n\npH regulation: Hydrogen participates in the regulation of acid-base balance in the body, maintaining an optimal pH level.\n\nEnergy metabolism: Hydrogen is involved in the energy metabolism of the body. It plays an important role in the respiration process, where hydrogen participates in the creation of energy in the form of ATP (adenosine triphosphate).\n\nRole in biochemical reactions: Hydrogen is involved in many biochemical reactions, such as protein synthesis, carbohydrate and fat metabolism, and other metabolic processes.\n\nRegulation of genetic expression: Hydrogen can affect the genetic expression and regulation of genes, which is important for the development and functioning of the body.\n\nDiseases with excess or deficiency:\nHydrogen is not an element for which an excess or deficiency has serious consequences for the body. However, in case of a lack of water that contains hydrogen, problems with hydration of the body, dehydration and disruption of vital processes may occur.\n\nProducts for restoring balance:\nTo maintain a normal balance of hydrogen in the body, it is important to consume enough water. It is recommended to drink clean water and eat foods rich in liquid, such as fruits and vegetables.\n\nConclusion:\nHydrogen is a trace element that plays an important role in the body. It is present in organic compounds, participates in the formation of water, regulates the acid-base balance and participates in energy metabolism. Lack of water containing hydrogen can lead to problems with hydration of the body. It is recommended to consume a sufficient amount of water and eat food rich in liquid to maintain a normal balance of hydrogen in the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
29	Dietary Mineral I Iodine	Introduction:\nIodine is an important nutrient necessary for the normal functioning of the body. It plays a role in many processes and is of key importance for human health.\n\nIs it a macro- or microelement for our body:\nIodine is a trace element for our body. Unlike macronutrients such as calcium and magnesium, which are required in large quantities, iodine is not required in such significant amounts.\n\nIs it dangerous for people or not? Is he well known?\nIodine is not dangerous to humans when consumed in normal quantities. However, excess iodine can have negative health consequences, such as thyroid dysfunction. Iodine is well known as an important element for maintaining thyroid health.\n\nPercentage in the human body:\nThe percentage of iodine in the human body is extremely low and is only about 0.00002% of the total body weight.\n\nFunctions:\n\nRegulation of thyroid function: Iodine is necessary for the synthesis of thyroid hormones such as thyroxine and triiodothyronine, which regulate metabolism, growth and development of the body.\nSkin, hair and nail health: Iodine plays an important role in maintaining the health of the skin, hair and nails.\nBrain and nervous system development: A lack of iodine during pregnancy and the baby can negatively affect the development of the brain and nervous system, so sufficient iodine intake is especially important for pregnant women and children.\n\nDiseases with excess:\nExcess iodine can lead to various diseases, including hyperthyroidism, autoimmune thyroiditis and other thyroid disorders. With prolonged and significant consumption of excessive amounts of iodine, serious health consequences can occur.\n\nDiseases with a lack of:\nLack of iodine can lead to the development of diseases called iodine deficiency disorders. This includes goiter (enlargement of the thyroid gland), hypothyroidism (decreased thyroid activity) and cretinism (mental and physical development delay). In children, iodine deficiency can lead to disruption of normal growth and development.\n\nFoods to restore balance:\nTo restore the balance of iodine in the body, it is recommended to eat foods rich in iodine. These products include seaweed, sea fish, iodized salt, dairy products, eggs and nuts.\n\nConclusion:\nIodine is an important trace element for our body. It plays a role in regulating thyroid function, maintaining healthy skin, hair and nails, as well as in the development of the brain and nervous system. A lack or excess of iodine can cause various diseases, so maintaining the right balance is important for maintaining overall health and well-being. It is recommended to eat foods rich in iodine to ensure sufficient intake of this nutrient.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
30	Dietary Mineral K Potassium	Introduction:\nPotassium is one of the important trace elements in our body. In this article, we will look at its role, impact on health and function, as well as the importance of maintaining the right balance.\n\nWhether it is a micro- or macronutrient:\nPotassium is a macronutrient of our body, that is, we need it in large quantities.\n\nIs it dangerous for humans and how well it is known:\nPotassium is safe for most people, and its importance for health is well known. However, some medical conditions or medications taken may require monitoring of potassium levels in the body.\n\nPercentage in the human body:\nPotassium is approximately 0.25% of the total body weight in adults.\n\nFunctions of potassium in the body:\nPotassium plays a key role in regulating the water level in the body, maintaining normal electrolyte balance, functioning of muscles and nervous system, controlling blood pressure and maintaining heart health.\n\nDiseases with excess:\nExcess potassium, called hyperkalemia, may be associated with kidney problems, certain medical conditions, or taking certain medications. This can lead to serious cardiac arrhythmias and other problems.\n\nDiseases with a lack of:\nLack of potassium, called hypokalemia, can manifest itself in the form of muscle weakness, decreased concentration, cardiac arrhythmias and other symptoms.\n\nProducts for restoring balance:\nTo restore the potassium balance, it is recommended to eat foods rich in potassium, such as bananas, potatoes, avocados, spinach, dried fruits and dairy products.\n\nConclusion:\nPotassium is an important macronutrient necessary to maintain the health of the body. It performs a number of important functions, including regulating water levels, normalizing electrolyte balance and maintaining normal muscle and nervous system function. Lack of potassium can lead to various diseases, including muscle weakness, heart rhythm disorders and other problems. On the other hand, excess potassium can also be harmful and is associated with kidney problems and heart complications.\n\nTo maintain potassium balance, it is recommended to consume foods rich in this mineral. Bananas, potatoes, avocados, spinach, dried fruits and dairy products are a good source of potassium. It is also important to monitor your overall diet and, if necessary, discuss with your doctor the possibility of additional potassium intake in the form of supplements.\n\nIn conclusion, potassium is an important macronutrient necessary for the health of the body. It performs many functions and its deficiency or excess can have serious consequences. Proper nutrition, including foods high in potassium, will help maintain the balance of this mineral and ensure the normal functioning of the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
31	Dietary Mineral La Lanthanum	Introduction:\nLanthanum (La) is a mineral that belongs to the lanthanide group. It is a rare earth element and occurs in nature as a mixture with other lanthanides. In this article, we will look at the role of lanthanum in the body, its effect on human health, as well as ways to maintain the balance of this mineral.\n\nIs lanthanum a micro- or macroelement in our body?\nLanthanum is not a necessary trace element for our body. It is not part of the structural components of tissues and does not perform key functions in the body. Instead, lanthanum is used in industry and scientific research.\n\nIs lanthanum dangerous for humans? Is he well known?\nLanthanum is considered relatively safe for humans because it does not have high toxicity. Due to its limited role in the body and the lack of evidence of negative health effects, lanthanum is not a widely known mineral among the general public.\n\nPercentage of lanthanum in the human body:\nLanthanum is not a natural component of the human body, so its content in the body is not measured as a percentage.\n\nLanthanum Functions:\nLanthanum is used in industry and scientific research for various purposes, such as alloy production, electronics, catalysis and other technical applications. In the human body, lanthanum does not perform specific functions and has no known biological roles.\n\nDiseases with an excess of lanthanum:\nSince lanthanum is not a necessary element for the body, an excess of this mineral usually does not cause diseases or negative health effects. However, if certain levels of lanthanum are exceeded in the body, some side effects may occur, including digestive disorders, allergic reactions or skin irritation. However, such cases are rare and usually associated with professional exposure to lanthanum, for example, in workers of industrial enterprises where it is used.\n\nDiseases with a lack of lanthanum:\nSince lanthanum is not a necessary element for the body, its deficiency does not cause specific diseases or deficiency conditions in humans.\n\nFoods to restore the balance of lanthanum:\nSince lanthanum is not an essential element for the body, there is no need to pay special attention to its consumption or search for products that contribute to restoring balance. A diet rich in a variety of foods will ensure sufficient lanthanum intake if it is necessary for professional purposes or scientific research.\n\nConclusion:\nLanthanum is not a necessary trace element for the human body and does not perform specific functions. It is mainly used in industry and scientific research. Lanthanum is considered relatively safe for humans, but with elevated levels in the body, some side effects may occur. Lack of lanthanum does not cause diseases or deficiency conditions. A diet rich in a variety of foods will ensure sufficient lanthanum intake, if necessary.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
32	Dietary Mineral Li Lithium	Introduction:\nLithium is a chemical element belonging to the group of alkali metals. It is known for its diverse uses in industry and medicine. In recent years, it has attracted attention for its potential role in nutrients and its impact on mental health and well-being. This article will explore the importance of lithium as a nutrient mineral for the human body.\n\nIs it a microelement or a macroelement of our body?\nLithium is considered a trace element in the human body. This means that it is required in very small amounts compared to macronutrients such as calcium, potassium and magnesium. Despite the low concentration, lithium plays an important role in some physiological processes.\n\nIs lithium dangerous for humans? Is he well known?\nLithium, when used in therapeutic doses, is usually safe for most people. However, high doses or excessive use of lithium can have toxic effects on the body, causing lithium toxicity. It is important to note that lithium should be consumed only under medical supervision and as prescribed by a doctor. As a nutritional mineral, the use of lithium supplements is still a subject of research, and its long-term effects are not yet fully understood.\n\nThe percentage of lithium in the human body:\nThe average concentration of lithium in the human body is very low.\n\nLithium Functions:\nAlthough the exact mechanisms of action of lithium in the body are not fully understood, it plays a number of important roles in maintaining the health and functioning of the body. Some of its features include:\n\nNervous System Support: Lithium can have a beneficial effect on the nervous system, contributing to its normal functioning. It can improve mood, reduce anxiety and maintain mental health.\n\nParticipation in metabolism: Lithium can affect metabolism, including the absorption and use of other nutrients such as vitamins and minerals.\n\nRegulation of electrolyte balance: Lithium can affect the balance of electrolytes in the body, including sodium, potassium and calcium. This is important for the proper function of cells and tissues.\n\nDiseases in case of excess:\nExcess lithium in the body can lead to the development of lithium toxicity. This condition can manifest symptoms such as nausea, vomiting, diarrhea, muscle weakness, psychomotor agitation, and even serious cardiac arrhythmias. The cause of lithium toxicity is usually the improper use of drugs containing lithium.\n\nDiseases in case of deficiency:\nLithium deficiency as a nutrient mineral is not well understood yet. However, some studies have linked lithium deficiency to an increased risk of developing certain mental and neurological diseases, such as depression, bipolar disorder and neurodegenerative diseases. However, further research is needed to confirm these links.\n\nProducts that help restore balance:\nLithium can be obtained from certain foods, including mineral water, fish, meat, young potato tubers, citrus fruits, berries, nuts, green vegetables and cereals. However, it should be noted that in most cases, lithium deficiency in the body is not a problem requiring special additional consumption of this mineral.\n\nConclusion:\nLithium is a trace element necessary for the normal functioning of the body. It plays an important role in maintaining the nervous system, metabolism and regulation of electrolyte balance. Although excess lithium can cause toxicity, lithium deficiency is rarely a problem requiring special intervention. A varied and balanced nutritional program usually provides enough lithium to maintain health and well-being.\n\nHowever, before making changes to your diet or taking additional dietary supplements, it is always recommended to consult with a qualified doctor or nutritionist to take into account the individual needs and characteristics of your body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
33	Dietary Mineral Mg Magnesium	Magnesium (Mg) is an important nutritional mineral necessary for the normal functioning of the body. Here is the structure of an article about magnesium:\n\nIntroduction:\nMagnesium is a macronutrient that plays a key role in many biochemical processes in the body. It is one of the most abundant minerals in our body and is essential for maintaining health.\n\nMicro- or macronutrient:\nMagnesium refers to macronutrients, since the body requires a significant amount of it to maintain normal functions.\n\nIs it dangerous for people? Is he well known?\nMagnesium is safe for humans when consumed in the recommended doses. It is well studied and widely known for its significance for health.\n\nPercentage in the human body:\nMagnesium makes up about 0.05% of the total human body weight. Most of the magnesium is found in bones, muscles and other tissues.\n\nFunctions of Magnesium:\n\nParticipation in the formation and stabilization of bones\nRegulation of the nervous system and muscle activity\nParticipation in energy exchange and ATP formation\nRegulation of the heart rate\nParticipation in DNA and RNA synthesis\nDiseases with excess:\nExcess magnesium from food is usually excreted from the body through urine and is not a common problem. However, if you take too large doses of magnesium supplements, some side effects may occur, such as diarrhea, nausea or low blood pressure.\n\nDiseases with deficiency:\nMagnesium deficiency can lead to various diseases and symptoms, such as muscle cramps, sleep disorders, fatigue, arrhythmia and digestive disorders.\n\nProducts that help restore balance:\nTo restore the balance of magnesium in the body, it is recommended to use the following products:\n\nGreen vegetables: Spinach, broccoli, cabbage, green peas and other green vegetables are rich in magnesium.\n\nNuts and seeds: Almonds, hazelnuts, cashews, walnuts, sunflower and pumpkin seeds contain significant amounts of magnesium.\n\nCereals and legumes: Oatmeal, brown rice, quinoa, lentils and other cereals and legumes are rich in magnesium.\n\nFish: Some types of fish, such as mackerel, tuna and sardines, contain magnesium.\n\nChocolate: Dark chocolate with a high cocoa content contains a small amount of magnesium.\n\nBananas: Bananas are also a source of magnesium.\n\nConclusion:\nMagnesium is an important macronutrient necessary for the normal functioning of the body. It plays a role in many biochemical processes, such as bone formation and stabilization, regulation of the nervous system, participation in energy metabolism, and others. Lack of magnesium can lead to various diseases, so it is important to eat foods rich in magnesium to maintain its balance in the body. However, excess magnesium is rarely found with natural food intake.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
34	Dietary Mineral Mn Manganese	Introduction:\nManganese is a trace element necessary for the normal functioning of the body. It performs a number of important functions and plays an important role in various biochemical processes.\n\nIs it dangerous for humans? Manganese is safe when consumed in normal quantities, however, prolonged exposure to large doses of manganese may cause health problems.\n\nThe percentage of manganese in the human body is small and is about 0.0001%.\n\nFunctions of manganese:\n\nParticipation in the formation of bone tissue and maintaining bone health.\nRegulation of the metabolism of carbohydrates, fats and proteins.\nInfluence on the normal functioning of the nervous system.\nParticipation in antioxidant protection and protection against DNA damage.\nContribution to the formation of hormones and enzymes.\nDiseases with excess manganese:\nExcess manganese can lead to a condition called manganese intoxication. This condition is rare with natural nutrition, but can occur with prolonged exposure to high doses of manganese, for example, with prolonged professional exposure.\n\nDiseases with a lack of manganese:\nManganese deficiency is rare in humans, as the required amount of manganese can be satisfied by consuming a varied and balanced diet. However, a prolonged lack of manganese can negatively affect health, including a decrease in bone density and a deterioration in carbohydrate metabolism.\n\nFoods to restore balance:\nTo restore the balance of manganese in the body, you can include the following foods in the diet:\n\nNuts and seeds: Hazelnuts, walnuts, peanuts, sunflower and pumpkin seeds.\nCereals and legumes: Oatmeal, quinoa, peas, lentils\nFruits: Bananas, pineapples, strawberries, raspberries.\nVegetables: Spinach, broccoli, carrots, cabbage.\nMeat and fish: Beef, pork, chicken, cod, salmon.\nConclusion:\nManganese is an important trace element that performs a number of functions in the body. It is necessary to maintain healthy bones, nervous system and metabolism. Natural nutrition provides a sufficient amount of manganese, and a long-term deficiency is rare. However, excess manganese, especially during professional exposure, can be harmful to health. It is important to maintain a balance of manganese, including a variety of foods rich in this trace element in the diet.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
45	Dietary Mineral Sc Scandium	Introduction:\nScandium (Sc) is a chemical element that belongs to the group of transition metals. In this article we will consider whether it is a micro- or macroelement for our body, its potential dangers and fame, the percentage in the human body, its functions, diseases associated with excess and deficiency, as well as products that can be consumed to restore the balance of scandium.\n\nIs scandium a micro- or macroelement in our body?\nScandium is not a necessary micro- or macroelement for our body. It is not part of the main biological molecules and does not play a direct role in maintaining the vital activity of the body.\n\nIs scandium dangerous for humans? Is he known?\nScandium is a relatively safe element for humans. It has low toxicity and there are no known cases of poisoning or danger from its consumption. However, due to its rarity and insignificant presence in the environment, scandium usually does not cause widespread attention and fame among people.\n\nThe percentage of scandium in the human body\nThe scandium content in the human body is extremely low and amounts to only traces.\n\nScandium functions\nScandium has no known functions in the human body.\n\nDiseases in case of excess scandium\nAn excess of scandium in the body is usually not considered a problem, since its level is usually very low and does not cause negative health effects.\n\nDiseases in case of scandium deficiency\nSince scandium is not a necessary element for the body, its deficiency does not cause specific diseases.\n\nScandium Rebalancing Products\nScandium is not a necessary element, so there is no need to take additional measures to restore the balance of scandium in the body. A regular diet will provide enough scandium to maintain its normal level.\n\nConclusion:\nScandium (Sc) is not a necessary micro- or macroelement for our body. It is not dangerous to health and has low toxicity. The scandium content in the human body is very low, and its excess or deficiency does not cause specific diseases. There is no need to specifically monitor the balance of scandium in the body, since regular nutrition will provide a sufficient amount of it.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
35	Dietary Mineral Mo Molybdenum	Molybdenum (Mo) - Introduction:\nMolybdenum is a trace element necessary for the normal functioning of the human body. In this article, we will look at its role, safety, percentage in the body, functions, diseases with excess and deficiency, foods that help restore balance, and draw conclusions about the importance of molybdenum for a healthy lifestyle.\n\nMicro- or macronutrient:\nMolybdenum belongs to the category of trace elements. Although its body needs are small, its regular presence in food is important for maintaining optimal health.\n\nDanger and fame:\nMolybdenum is considered safe for human consumption in normal quantities. It is widely known in scientific circles and plays a significant role in many physiological processes.\n\nPercentage in the body:\nMolybdenum is present in the human body in very small amounts. Its percentage is less than 0.1% of the total body weight.\n\nFunctions of molybdenum:\nMolybdenum plays an important role in the body, participating in various enzymatic processes. It is necessary for the formation of active centers of enzymes that are involved in the metabolism of proteins, carbohydrates and fats. Molybdenum is also involved in the metabolism of amino acids and the formation of hormones.\n\nDiseases with excess:\nAn excess of molybdenum in the human body is rarely found when eating. However, with prolonged exposure to high concentrations of molybdenum, poisoning may occur, the symptoms of which may be vomiting, diarrhea, headache and impaired kidney function.\n\nDiseases with deficiency:\nMolybdenum deficiency in humans is extremely rare, since the required amount of this trace element is usually satisfied by regular consumption of a variety of foods. However, with prolonged and significant molybdenum deficiency, some health problems may occur. Some of them include sulfur metabolism disorders, which can lead to skin deterioration, muscle weakness, decreased immune function and fatigue.\n\nProducts for restoring balance:\nTo restore the balance of molybdenum in the body, it is important to consume a variety of foods that contain sufficient amounts of it. Some good sources of molybdenum include lentils, beans, peas, oatmeal, barley, nuts, seeds, and green vegetables.\n\nConclusion:\nMolybdenum is an important trace element that performs a number of key functions in the human body. It is necessary for metabolic processes and maintenance of general health. Although molybdenum deficiency and excess are rare, regular consumption of foods rich in molybdenum will help maintain its optimal level in the body and ensure the normal functioning of organs and systems.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
36	Dietary Mineral N Nitrogen	Introduction:\nNitrogen (N) is one of the key chemical elements found in human and other living organisms. In this article, we will look at the role of nitrogen in human nutrition, its impact on health and foods that help maintain its balance in the body.\n\nIs nitrogen a micro- or macronutrient for our body:\nNitrogen is a macronutrient for our body, which means that we need it in large quantities to maintain the normal functioning of organs and systems.\n\nIs nitrogen dangerous to humans and how well is it known:\nNitrogen itself is not dangerous to humans. It is widely known as an important component of air, and we constantly inhale it along with oxygen. However, in some forms, such as nitrogen oxides, nitrogen can be harmful to health, especially in high concentrations or with prolonged exposure.\n\nPercentage of nitrogen content in the human body:\nNitrogen makes up about 3% of the mass of the human body. It is present in many organic compounds, including proteins, nucleic acids and amino acids.\n\nNitrogen functions:\nNitrogen plays a key role in the human body. It is a building block of proteins that are necessary for the growth and repair of tissues, as well as for the synthesis of enzymes, hormones and other biologically active substances. Nitrogen is also involved in amino acid metabolism, blood formation and maintenance of immune function.\n\nDiseases with excess nitrogen:\nWith an excess of nitrogen in the body, problems associated with renal function may occur, such as increased formation of urea and ammonia. This may be due to impaired renal filtration or other kidney diseases. High levels of nitrogen in the blood may indicate problems with the kidneys or other organs.\n\nDiseases with nitrogen deficiency:\nNitrogen deficiency in the human body rarely occurs due to its wide distribution in food and air. However, in conditions of malnutrition or certain diseases, such as malabsorption or prolonged fasting, nitrogen deficiency may occur. This can lead to insufficient protein synthesis, growth retardation, loss of muscle mass and other problems associated with insufficient nitrogen intake into the body.\n\nFood to restore nitrogen balance:\nTo maintain the nitrogen balance in the body, it is important to eat foods rich in proteins. This includes meat, fish, poultry, eggs, dairy products, legumes, nuts and seeds. Plant-based foods, such as soy and other sources of plant proteins, can also be useful for ensuring sufficient nitrogen intake into the body.\n\nConclusion:\nNitrogen is an important macronutrient for our body, playing a key role in protein synthesis and many other biological processes. It is not dangerous under normal conditions, but excess or deficiency of nitrogen can cause health problems. Proper nutrition, including protein-rich foods, will help maintain nitrogen balance in the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
37	Dietary Mineral Na Sodium	Introduction:\nSodium is one of the important minerals necessary for the normal functioning of the body. In this article, we will look at the role of sodium in our body, its effect on health, as well as foods that will help maintain the balance of sodium in the body.\n\nIs sodium a macro- or microelement in our body?\nSodium is a macronutrient, that is, it is required by the body in large quantities.\n\nIs sodium dangerous for human health? Are its properties well known?\nSodium is not dangerous under normal conditions and is well known for its important role in regulating osmotic pressure and fluid balance in the body.\n\nThe percentage of sodium in the human body:\nSodium makes up approximately 0.15% of the total body weight of a person.\n\nSodium Functions:\n\nOsmotic pressure regulation: Sodium plays an important role in maintaining the balance of fluids in the body and regulating osmotic pressure.\nNervous system and muscles: Sodium is necessary for the transmission of nerve impulses and muscle contraction.\nRegulation of acid-base balance: Sodium helps to maintain a normal pH level in the body.\nDiseases with excess sodium:\nExcess sodium in the body can lead to high blood pressure, heart disease, edema and other health problems.\n\nDiseases with sodium deficiency:\nSodium deficiency can occur with intense physical activity, excessive sweating, or certain diseases, such as the syndrome of insufficient production of antidiuretic hormone. This can lead to symptoms including weakness, dizziness, low blood pressure and electrolyte imbalance.\n\nSodium-rich foods to restore balance:\n\nSalty foods: Table salt (sodium chloride) is one of the most well-known sources of sodium. However, salt intake should be controlled and limited in order to avoid excess sodium in the body.\nSeafood: Fish, seafood and algae, such as nori seaweed or wakame seaweed, contain sodium and can be good food sources.\nDairy products: Milk and dairy products, such as yogurt and cheese, contain sodium and can contribute to its balance in the body.\nFruits and vegetables: Some fruits and vegetables, such as bananas, potatoes and spinach, contain sodium and can be useful for maintaining its levels.\n\nConclusion:\nSodium is an important macronutrient necessary for the regulation of osmotic pressure, nervous system and acid-base balance in the body. It is important to monitor the sodium balance, avoiding excess or deficiency. A varied and balanced diet, including foods rich in sodium, will help maintain its optimal level in the body and promote health.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
38	Dietary Mineral Ni Nickel	Introduction:\nNickel (Ni) is a chemical element that is a trace element in our body. It plays an important role in various physiological processes and has properties that affect our health.\n\nIs nickel dangerous to humans and how well known are its properties:\nNickel can be dangerous to humans if ingested in large quantities or with prolonged contact with it in the working environment. The reason for the danger is its toxic effect, especially if it enters the respiratory tract or digestive system. However, for most people, the consumption of nickel through food does not pose a significant danger, since it occurs in small doses that the body is able to process.\n\nPercentage of nickel content in the human body:\nNickel is present in the body in small amounts. The total concentration of nickel in the body varies from 0.1 to 10 micrograms/g.\n\nFunctions of nickel in the body:\n\nParticipation in metabolism: Nickel plays the role of a cofactor for some enzymes that affect metabolism in the body.\nEffects on the immune system: Some studies show that nickel can have an effect on the immune system and the body's immune responses.\nRole in growth and development: Nickel may be involved in the normal growth and development of the body, although the exact role is not yet fully understood.\nDiseases with excess nickel:\nWith prolonged contact with high concentrations of nickel, various diseases and pathological conditions can occur, such as contact dermatitis, allergic reactions, pneumonia and even cancer. However, these effects are related to professional or industrial exposure to nickel, and not to its consumption through food.\n\nDiseases with a lack of nickel:\nLack of nickel in the body is rare, because we get it through food in sufficient quantities. However, some studies have linked nickel deficiency to certain diseases, such as metabolic disorders, changes in the immune system and skin deterioration. Additional research is needed to fully understand the effects of nickel deficiency on health.\n\nProducts that help restore the balance of nickel:\nNickel is found in many foods, therefore, as a rule, there is no shortage of nickel through food. To maintain the balance of nickel in the body, it is recommended to eat a varied and balanced diet, including foods such as nuts, cereals, seeds, beans, mushrooms, seafood, chocolate and tea.\n\nConclusion:\nNickel is a trace element that plays a role in various physiological processes in our body. The natural intake of nickel through food usually does not pose a danger to most people, and a lack of nickel rarely occurs. However, prolonged contact with high concentrations of nickel in industrial conditions can cause diseases. A varied and balanced diet allows you to ensure sufficient nickel intake and maintain its balance in the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
39	Dietary Mineral O Oxygen	Introduction:\nOxygen is one of the most important chemical elements for life on Earth. In this article we will look at the role of oxygen in the human body, its impact on health and methods of maintaining its balance.\n\nIs oxygen a micro- or macronutrient in our body:\nOxygen is not a micro- or macroelement, since its presence in the body does not require constant intake through food. However, oxygen is an integral part of our respiratory process and is necessary to maintain the vital activity of all cells in the body.\n\nIs oxygen dangerous to humans and how well it is known:\nOxygen itself is not dangerous to humans, and its role in maintaining life is well known. However, high oxygen concentrations can be dangerous in some medical procedures, such as oxygen therapy, and can cause side effects. In general, oxygen is vital for us, but its use should be controlled and carried out under medical supervision.\n\nPercentage of oxygen in the human body:\nOxygen is approximately 65% by weight of the human body. Most of the oxygen is in the form of oxygen bound to other elements, mainly in the composition of water (H2O) and organic compounds.\n\nFunctions of oxygen in the body:\nOxygen plays a crucial role in cellular respiration, the process by which cells receive energy from food. It is necessary for the burning of nutrients and energy production in the form of ATP (adenosine triphosphate). In addition, oxygen is involved in the regulation of metabolism, maintaining the normal function of the immune system and ensuring the vital activity of all organs and tissues in the body.\n\nDiseases with excess oxygen:\nExcess oxygen in the body can cause oxidative stress, which can lead to damage to cells and tissues. This is due to the formation of free radicals that can damage DNA, proteins and lipids. Oxidative stress is associated with various diseases such as inflammatory diseases, cardiovascular diseases, neurodegenerative diseases and cancer. However, in everyday life, the risk of excess oxygen is usually minimal.\n\nDiseases with a lack of oxygen:\nLack of oxygen in the body can lead to hypoxia, which means a lack of oxygen in the tissues. This can occur due to diseases of the lungs, heart, blood circulation or respiratory disorders. Hypoxia can lead to various symptoms, including short-term lack of breathing, weakness, dizziness, convulsions and even loss of consciousness. Lack of oxygen in the tissues can be dangerous and requires medical intervention.\n\nFood to restore balance:\nSince oxygen is not a nutrient, its balance in the body is maintained automatically through the normal function of the respiratory system. However, to maintain a healthy respiratory process, it is important to provide your body with a sufficient amount of vitamins, minerals and antioxidants, such as vitamin C, vitamin E and selenium. They help protect cells from oxidative stress and maintain the normal function of the respiratory system. These nutrients can be obtained from a variety of foods, including fresh fruits, vegetables, nuts, seeds and herbs.\n\nIn conclusion, oxygen plays a key role in maintaining life and functioning of the body. It is not a micro- or macroelement, but its presence is necessary for the respiratory process and the burning of food for energy. Although oxygen itself is not dangerous, high concentrations can have negative consequences if used improperly. Excess oxygen can cause oxidative stress, and lack of oxygen can cause hypoxia. Proper nutrition, rich in vitamins, minerals and antioxidants, will help maintain a healthy respiratory process. It is important to ensure a sufficient supply of nutrients to maintain the balance of oxygen in the body and ensure the normal function of cells and tissues.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
40	Dietary Mineral P Phosphorus	Introduction:\nPhosphorus is one of the key minerals needed to maintain the health of the body. It plays an important role in many biological processes and is an important component of bones and teeth. In this article, we will look at the role of phosphorus in the body, its functions, the consequences of excess and deficiency, as well as foods that help restore phosphorus balance.\n\nIs phosphorus a trace element or a macronutrient in our body?\nPhosphorus is a macronutrient, which means that it is required in the body in large quantities. It is the second most abundant mineral in the body after calcium.\n\nIs phosphorus dangerous for humans? Is it widely known about him?\nPhosphorus itself is not dangerous to humans. However, an excess of phosphorus in the body can have negative consequences. High intake of phosphorus in combination with a lack of calcium can lead to bone disorders. The importance of phosphorus for health is widely known in scientific and medical circles.\n\nThe percentage of phosphorus in the human body:\nPhosphorus makes up approximately 1% of the total weight of the human body. It is distributed in various tissues and organs, especially in bones and teeth.\n\nFunctions of phosphorus in the body:\n\nPhosphorus is the building block of bones and teeth, giving them strength and supporting their structure.\nIt is involved in energy metabolism and metabolic processes such as DNA and RNA synthesis, enzymatic reactions and oxygen transport.\nPhosphorus plays an important role in the nervous system, helping the transmission of nerve impulses and maintaining normal brain function.\nIt participates in the regulation of acid-base balance in the body, maintaining an optimal pH.\n\nDiseases with an excess of phosphorus:\nExcess phosphorus in the body can lead to various diseases and disorders. Uncontrolled intake of phosphorus-containing supplements or excessive consumption of foods rich in phosphorus can cause hyperphosphatemia, which leads to calcium phosphate deposition in bones, vessels and organs. This can lead to the formation of kidney stones, arterial calcification, cardiovascular diseases and other pathologies.\n\nDiseases with a lack of phosphorus:\nThe lack of phosphorus in the body is rare, since phosphorus is widely distributed in food products. However, phosphorus deficiency can occur in people with certain medical conditions, such as chronic kidney failure or prolonged fasting. Lack of phosphorus can lead to muscle weakness, anemia, bone demineralization and other metabolic disorders.\n\nProducts for restoring phosphorus balance:\nPhosphorus is widely distributed in various foods. It is found in meat, fish, poultry, eggs, dairy products, nuts, legumes, cereals and vegetables. Regular consumption of a variety of foods rich in phosphorus will help maintain a normal balance of this mineral in the body.\n\nConclusion:\nPhosphorus plays an important role in the body, being necessary for bone health, energy metabolism and normal nervous system function. However, an excess or lack of phosphorus can cause various diseases and disorders. Proper nutrition, rich in various sources of phosphorus, will help maintain the balance of this mineral in the body and contribute to overall well-being.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
41	Dietary Mineral Pb Plumbum	Introduction:\nLead (Pb) is a mineral that is widely distributed in the environment, but is not a necessary element for the functioning of the body. In this article, we will look at the properties of lead, its impact on human health, the possible consequences of excess and deficiency, as well as foods that can help restore the balance of lead in the body.\n\nIs lead a trace element or a macronutrient in our body?\nLead is not a necessary trace element or macronutrient for the human body. In fact, lead is toxic and can have a negative impact on health when it accumulates in the body.\n\nIs lead dangerous for humans? Is it widely known about him?\nLead is a heavy metal and a toxic substance for humans. It can accumulate in the tissues of the body and cause serious health problems, especially in children. Its toxic effects are widely known, and measures have been taken to limit exposure to lead in the environment.\n\nThe percentage of lead in the human body:\nLead is present in the body in very low concentrations. Its percentage in the human body is usually insignificant and is measured in micrograms.\n\nFunctions of lead in the body:\nLead does not perform any useful functions in the body. It is not necessary for the normal functioning of organs and systems.\n\nDiseases with excess lead:\nExcess lead in the body can lead to severe poisoning, which can affect various organs and systems of the body. Lead poisoning can cause nervous disorders, damage to the kidneys, bones, nervous system and other organs.\n\nDiseases with a lack of lead:\nLead is not available to the body in the necessary quantities, because it is not a necessary element. Therefore, lead deficiency is not considered as a medical condition or disease.\n\nProducts for restoring the balance of lead:\nIf you have lead poisoning or have been exposed to harmful effects of lead, it is important to seek medical help. Specialists can offer appropriate methods of treatment and detoxification of the body.\n\nConclusion:\nLead is a toxic substance that can have a harmful effect on human health. It is not a necessary element of the body and can cause serious problems with its accumulation. It is important to take measures to limit exposure to lead in the environment and comply with safety regulations, especially with regard to food and drinking water. In case of lead poisoning or suspicion of its negative effects, it is necessary to seek medical help for diagnosis and treatment.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
42	Dietary Mineral Ra Radium	Introduction:\nRadium is a chemical element that is known for its radioactivity. In this article, we will consider whether radium is a micro- or macroelement for our body, whether it is dangerous for people and how well this element is known. We will also consider the percentage of radium in the human body, its functions, diseases associated with excess or deficiency, and products that help restore radium balance.\n\nIs radium a micro- or macroelement for our body:\nRadium is not a necessary micro- or macroelement for our body. It does not perform important functions and is not an integral part of vital biological molecules.\n\nIs radium dangerous to humans and how well it is known:\nRadium is a very dangerous substance because of its radioactive nature. With prolonged exposure to radium on the body, it can cause radiation diseases, including cancer. In this regard, radium is a well-known element and requires special care in handling.\n\nThe percentage of radium in the human body:\nRadium is usually present in the human body in very low concentrations, and its percentage is extremely insignificant.\n\nRadium functions:\nRadium does not perform known functions in the human body.\n\nDiseases in case of excess or lack of radium:\nExcess radium in the body can lead to serious consequences associated with radiation exposure and radiation diseases. Lack of radium is not considered as a medical condition or disease.\n\nRadium Balance Restoration Products:\nThere are no special products that can be consumed to restore the balance of radium in the body. In case of radiation exposure, it is necessary to seek medical help and follow the recommendations of radiation safety specialists. They can propose appropriate measures and procedures to alleviate the effects of radiation exposure.\n\nConclusion:\nRadium is a radioactive element that is not necessary for the functioning of the human body. It poses a serious danger due to its radioactive nature and can cause radiation diseases, including cancer. The percentage of radium in the human body is extremely insignificant, and its functions are not determined by the body. In case of exposure to radium, it is necessary to seek medical help and follow the recommendations of radiation safety specialists.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
43	Dietary Mineral Rb Rubidium	Introduction:\nRubidium is a chemical element that occurs in nature and can be part of our food and drinking water. In this article we will consider rubidium as a dietary mineral and its role in the human body.\n\nIs rubidium a trace element or a macronutrient in our body?\nRubidium belongs to trace elements, because its requirements in the body are very low.\n\nIs rubidium dangerous for humans? Are its properties well known?\nIn general, rubidium is considered a relatively safe element. However, as with any chemical, it is important to observe reasonable limits of its consumption. It is known that high concentrations of rubidium can cause irritation of the skin and mucous membranes.\n\nThe percentage of rubidium in the human body:\nRubidium is present in the body in extremely low concentrations, usually less than 0.01% of the total body weight.\n\nFunctions of rubidium in the body:\nThe functions of rubidium in the human body are not yet fully understood. It plays a role in maintaining electrolyte balance and normal cell functioning.\n\nDiseases with excess rubidium:\nExcess rubidium in the body is rare. However, high concentrations of rubidium can cause irritation of the skin and mucous membranes. Prolonged exposure to high doses of rubidium can lead to disorders of the cardiovascular system.\n\nDiseases with a lack of rubidium:\nThe lack of rubidium in the body is rare, because the requirements for it are very low. So far, no obvious diseases associated with a lack of rubidium have been identified.\n\nProducts rich in rubidium to restore balance:\nRubidium is present in a variety of foods, including nuts, cereals, meat, dairy products and vegetables.\nEating a variety of foods can help restore the balance of rubidium in the body. Some foods rich in rubidium include nuts such as almonds, hazelnuts and cashews, cereals including oats, rice and wheat, meat, especially beef and poultry, dairy products including milk and yogurt, and vegetables such as potatoes, spinach and beets.\n\nConclusion:\nRubidium is a trace element, the content of which in the human body is small. It plays a role in maintaining electrolyte balance and cell function. Rubidium is generally considered safe, but high concentrations can cause irritation of the skin and mucous membranes. The lack of rubidium is rare, and its obvious diseases are unknown. Eating a variety of foods rich in rubidium will help maintain the balance of this mineral in the body. It is always recommended to observe moderation and reasonable limits of consumption of rubidium and follow the recommendations of nutrition specialists to maintain a healthy state.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
44	Dietary Mineral S Sulfur	Introduction:\nSulfur is an essential element in food and is essential for our body. In this article, we will consider whether sulfur is a trace element or a macroelement, whether it is dangerous to health, how well it is known, and also consider its percentage in the human body, functions, diseases in case of excess or deficiency, products that help restore sulfur balance, and summarize.\n\nSulfur is a macronutrient of our body:\nSulfur is a macronutrient, which means that it is needed in large quantities to maintain the normal functioning of the body.\n\nSulfur is safe for humans and is well known:\nSulfur is a safe element, widely known for its diverse applications in the food and pharmaceutical industries.\n\nThe percentage of sulfur in the human body:\nSulfur makes up about 0.25% of the total body weight of a person.\n\nSulfur Functions:\nSulfur plays an important role in the body. It is a key component of amino acids and many proteins. It is also involved in the formation of hormones, enzymes and other biologically active substances. Sulfur is necessary for the formation of collagen, a structural component of skin, hair and nails. It also supports the normal functioning of the immune system and has antioxidant properties.\n\nDiseases in case of excess or lack of sulfur:\nExcess sulfur is rare, but with its prolonged and significant increase, a number of problems may arise, including impaired functioning of the kidneys and liver. Lack of sulfur is also rare, but can lead to decreased immunity, impaired skin and hair health, and poor wound healing.\n\nProducts for restoring sulfur balance:\nFood sources of sulfur include meat, fish, eggs, dairy products, nuts, legumes, whole grains and some vegetables such as cabbage, onions, garlic. Eating a variety of foods rich in proteins will help maintain the balance of sulfur in the body.\n\nConclusion:\nSulfur is an important macronutrient for our body. It is safe for health and is widely known for its diverse applications. Sulfur plays a key role in the formation of proteins, supports the normal functioning of the immune system and has antioxidant properties. Although excess or lack of sulfur is rare, maintaining balance through a varied diet that includes dietary sources of sulfur is important for the overall health and well-being of the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
46	Dietary Mineral Se Selenium	Introduction:\nSelenium (Se) is an important trace element for our body. It plays an important role in various physiological processes and has an impact on our health. In this article, we will look at the role of selenium in the body, its potential benefits and the consequences of excess or deficiency.\n\nIs selenium a micro- or macroelement in our body?\nSelenium is a trace element in our body. This means that it is needed in small quantities, but its presence is no less important for maintaining the normal functioning of the body.\n\nIs selenium dangerous for humans? Is it widely known?\nSelenium is a necessary element for health, but its excess or deficiency can have negative consequences. Moderate intake of selenium with food is usually safe for most people. However, excessive consumption of selenium can cause poisoning and have serious health consequences. The optimal level of selenium in the human body is well studied, and its recommended need is known.\n\nPercentage of selenium content in the human body:\nSelenium is present in the body in small amounts. The total content of adult selenium is about 13-20 mg.\n\nSelenium functions in the body:\nSelenium performs a number of important functions in the body. It is an integral part of some enzymes that play the role of antioxidants and are involved in protecting cells from free radical damage. Selenium also plays an important role in the immune system, supports the normal functioning of the thyroid gland and promotes heart health.\n\nDiseases with an excess of selenium:\nExcessive selenium intake can lead to selenosis, a serious condition that manifests itself with symptoms such as tissue damage, including hair, nails, skin, and the nervous system. Selenium poisoning can cause chronic fatigue, digestive problems, vision problems, nervous system and immune system disorders.\n\nDiseases with a lack of selenium:\nA lack of selenium in the body can lead to various diseases. It can affect the functioning of the thyroid gland and lead to the development of diseases such as goiter. A lack of selenium can also reduce the activity of antioxidant enzymes and affect immune function, which increases the risk of inflammatory diseases and infections.\n\nFoods that should be consumed to restore selenium balance:\nIf you have a selenium deficiency, it is important to include foods rich in selenium in your diet. Some good sources of selenium include Brazil nuts, seafood, chicken, turkey, beef, eggs, and oats. Eating these foods can help restore the balance of selenium in the body.\n\nConclusion:\nSelenium is an important trace element that plays a role in various physiological processes in the body. It has an effect on the immune system, thyroid health, antioxidant protection and other functions. Moderate intake of selenium in food is safe, but its excess or deficiency can have negative health consequences. Therefore, it is important to maintain the balance of selenium in the body, including foods rich in selenium in your diet. If you have specific diseases or questions about the level of selenium in the body, it is recommended to consult a doctor or nutritionist for individual recommendations.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
47	Dietary Mineral Si Silicon	Introduction:\nSilicon (Si) is a chemical element that plays an important role in the human body. In this article we will consider whether it is a micro- or macroelement, its effect on the body, the presence of side effects and products that can be consumed to maintain the balance of silicon in the body.\n\nIs it a micro- or macronutrient in the body:\nSilicon is a macronutrient in the human body. This means that the body needs it in small quantities, but its presence is no less important for maintaining normal physiological functions.\n\nIs it dangerous for humans and how well known:\nSilicon is a safe element for humans and is widely known as an essential macronutrient. Its safe consumption through food does not cause undesirable side effects or toxicity.\n\nPercentage of silicon in the body:\nThe percentage of silicon in the human body is about 0.026% of the total mass. It is present in various tissues, including skin, hair, nails, bones and connective tissue.\n\nSilicon Functions:\nSilicon plays an important role in the body. It participates in the formation and strengthening of bones, supports the health of connective tissue, improves the condition of skin, hair and nails, promotes the normal functioning of joints and blood vessels. In addition, silicon has antioxidant properties, protecting cells from damage by free radicals.\n\nDiseases with an excess of silicon:\nExcess silicon in the body is rare and is usually associated with professional exposure. Silicon overload may be associated with the risk of developing pneumoconiosis, obstructive pulmonary disease and other respiratory problems.\n\nDiseases with silicon deficiency:\nThe lack of silicon in the body can negatively affect the condition of bones, connective tissue and skin. The following diseases and symptoms are possible with a lack of silicon:\n\nOsteoporosis: Lack of silicon can contribute to the development of osteoporosis and deterioration of bone density.\n\nDeterioration of skin, hair and nails: Silicon deficiency can lead to a decrease in skin elasticity, the appearance of wrinkles, brittle hair and brittle nails.\n\nConnective Tissue Problems: Silicon is necessary to maintain the health of connective tissue, including tendons, ligaments and joints. Its deficiency can cause problems with joint mobility and deterioration of the general condition of connective tissue.\n\nProducts for restoring balance:\nTo restore the balance of silicon in the body, it is recommended to eat foods rich in this mineral. Here are some products that contain silicon:\n\nOatmeal: Oatmeal is a good source of silicon. Eating oatmeal or oatmeal in food can help increase the level of silicon in the body.\n\nBeans and other legumes: Beans, chickpeas, bream and other legumes contain some silicon. Including them in the diet can contribute to an increase in silicon consumption.\n\nGreen vegetables: Green vegetables such as spinach, cabbage, broccoli and green peas contain silicon. Regular consumption of these vegetables will help maintain the balance of silicon.\n\nCorn: Corn is also a source of silicon. Eating fresh corn or products containing corn can help provide the body with silicon.\n\nConclusion:\nSilicon is an important macronutrient in the human body. It plays an important role in maintaining the health of bones, connective tissue, skin and hair. Silicon also has antioxidant properties, helping to protect cells from free radical damage.\n\nAlthough excess silicon is rare, professional exposure may be associated with certain diseases. However, silicon deficiency can lead to problems with bones, connective tissue and skin. Osteoporosis, deterioration of the skin, hair and nails, as well as problems with connective tissue may be associated with a lack of silicon.\n\nTo maintain the balance of silicon in the body, it is recommended to include foods rich in this mineral in the diet. Oatmeal, beans, green vegetables and corn are good sources of silicon.\n\nIt is important to remember that before making changes to the diet or taking additional medications, it is necessary to consult a doctor or a nutritionist. They will be able to assess your individual health and make recommendations regarding silicon consumption.\n\nIn conclusion, silicon is an important macronutrient necessary to maintain healthy bones, connective tissue and skin. A balanced diet, taking into account foods rich in silicon, will help to provide the body with this important mineral and maintain its health.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
48	Dietary Mineral Sn Tin	The structure of the article about the food mineral Sn (tin):\n\nIntroduction:\nDescription of the tin mineral and its importance for the body.\n\nIs it a trace element or a macronutrient in our body:\nDetermining whether tin is a trace element or a macronutrient for the body.\n\nIs tin dangerous for human health and how well it is known:\nDiscussion of the safety of tin for humans and the degree of its fame.\n\nPercentage of tin in the human body:\nIndication of the percentage of tin in the human body.\n\nTin Functions:\nOverview of the functions performed by tin in the body.\n\nDiseases with an excess of tin:\nDescription of diseases associated with an excess of tin in the body.\n\nDiseases with a lack of tin:\nA brief description of the diseases that occur with a lack of tin.\n\nFoods that can be consumed to restore balance:\nA list of foods rich in tin and recommendations for their consumption to restore balance.\n\nConclusion:\nConclusions about the importance of tin in the body, the need to maintain balance and eat foods containing tin to maintain health.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
49	Dietary Mineral Sr Strontium	Introduction:\nDescription of the strontium mineral and its importance for the body.\n\nIs it a trace element or a macronutrient in our body:\nDetermination of whether strontium is a trace element or a macronutrient for the body.\n\nIs strontium dangerous for human health and how well it is known:\nA discussion of the safety of strontium for humans and the degree of its fame.\n\nPercentage of strontium in the human body:\nIndication of the percentage of strontium in the human body.\n\nStrontium functions:\nAn overview of the functions performed by strontium in the body.\n\nDiseases with an excess of strontium:\nDescription of diseases associated with an excess of strontium in the body.\n\nDiseases with a lack of strontium:\nA brief description of the diseases that occur with a lack of strontium.\n\nFoods that can be consumed to restore balance:\nA list of strontium-rich foods and recommendations for their consumption to restore balance.\n\nConclusion:\nConclusions about the importance of strontium in the body, the need to maintain balance and eat foods containing strontium to maintain health.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
50	Dietary Mineral Th Thorium	Introduction:\nThorium is a naturally occurring radioactive element that belongs to the actinide series. It is present in trace amounts in the earth's crust, rocks, soils and minerals. Unlike essential nutrients for the human body, thorium is being investigated in terms of its potential use in medicine and energy.\n\nMicro- or macronutrient in our body?\nThorium is not a micro- or macroelement necessary for our body. It does not perform the functions necessary to maintain the vital activity of the body.\n\nIs thorium dangerous for humans? Is it widely known?\nThorium is a radioactive element and can be dangerous to humans, especially with prolonged exposure and high doses. However, at low exposure levels, such as the normal ambient environment, the health risk is usually minimal. Due to its radioactivity, thorium has been extensively studied in terms of its health and safety effects.\n\nThe percentage of thorium in the human body:\nThorium is not a natural component of the human body, and its content in the body is usually very low or insufficiently detectable.\n\nFunctions:\nThorium does not perform physiological functions in the body, as it is not a necessary element.\n\nDiseases with excess:\nExcessive exposure to thorium on the body can cause radiation diseases, such as cancer and other radiation damage to tissues.\n\nDiseases with a lack of:\nThe lack of thorium is not considered, since it is not a necessary element for maintaining health.\n\nProducts that help restore balance:\nThere are no specific products that can be used to restore the balance of thorium in the body. A rational and balanced diet rich in a variety of nutrients, including vitamins, minerals and antioxidants, can contribute to the overall health of the body and its ability to cope with the effects of various substances, including thorium.\n\nConclusion:\n\nThorium is a radioactive element that is not a micro- or macroelement necessary for the functioning of our body. It can be dangerous at high doses and prolonged exposure. Due to its radioactivity, thorium is being studied in terms of its health and safety effects. Nutrition rich in nutrients can help the overall health of the body, but there are no specific products that can restore the balance of thorium in the body. It is recommended to maintain a balanced and varied diet, as well as follow the safety recommendations for thorium.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
51	Dietary Mineral Ti Titan	Introduction:\nTitanium is a chemical element that is widely used in various industries, but its role in the human body is less studied. In this article we will consider whether titanium is a micro- or macroelement of our body, its potential danger to health and its role in the body.\n\nIs titanium a micro- or macroelement of our body?\nTitanium is not a necessary micro- or macroelement for the normal functioning of the human body. Instead, it is predominantly used in industry and in various technical applications.\n\nIs titanium dangerous for human health and how well is it known?\nCurrently, there is no reliable data indicating the direct danger of titanium to human health. However, studies are continuing to evaluate the potential effects of titanium on the body during prolonged exposure or in the case of internal use.\n\nPercentage of titanium in the human body:\nTitanium is present in the human body in small quantities. Usually its content is less than 0.0001% of the total body weight.\n\nFunctions of titanium in the body:\nThe functions of titanium in the human body are not yet fully understood. However, some studies indicate its potential role in maintaining the structural and functional properties of some tissues and cells.\n\nDiseases with an excess of titanium:\nSince titanium is not a necessary element for the body, an excess of its consumption or exposure may be associated with negative effects, although there are no detailed studies on this issue.\n\nDiseases with titanium deficiency:\nSince titanium is not a necessary element for the body, titanium deficiency or deficiency is not considered as the main cause of diseases or pathological conditions. However, more detailed studies can help determine any potential effects of titanium deficiency and its role in the body.\n\nProducts that help restore titanium balance:\n\nSince titanium is not considered an essential nutrient for the body, there are no special products recommended to restore its balance.\n\nConclusion:\n\nTitanium is not a micro- or macroelement necessary for the normal functioning of the human body. Its potential health hazard and its role in the body are still insufficiently studied. Additional studies may reveal more detailed information about the effects of titanium on the human body and its possible consequences. Currently, there is no need for special products to restore the balance of titanium, since its deficiency or excess is not considered as the main cause of diseases.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
52	Dietary Mineral U Uranium	Introduction:\nUranium is a chemical element with atomic number 92 and chemical symbol U. It belongs to the class of heavy metals and is radioactive. In this article, we will look at uranium as a mineral, its presence in the human body and its possible health consequences.\n\nIs uranium a micro- or macroelement of the body:\nUranium is not a micro- or macroelement of the body. It is not considered an essential nutrient and does not play a key role in maintaining normal body function.\n\nIs uranium dangerous to humans and how well known is it:\nUranium is a radioactive element and can be dangerous to human health at high concentrations or prolonged exposure. It is widely known as a material for nuclear fuel and can be used in nuclear reactors and nuclear weapons. If handled improperly or in the event of an accident at a nuclear facility, uranium can become a source of radiation and pose a health hazard.\n\nThe percentage of uranium in the human body:\nUranium is usually not present in the human body or is present in very low concentrations that do not play a significant role in the body.\n\nFunctions of uranium:\nUranium does not perform known functions in the human body.\n\nDiseases with an excess of uranium:\nAt high levels of exposure to uranium on the body, various radiation-related diseases can occur, including cancer, damage to genetic material and other chronic diseases. However, it is hardly possible to be exposed to dangerous concentrations of uranium under normal conditions.\n\nDiseases with a lack of uranium:\nUranium is not a necessary element for the body, so a lack of uranium is not considered as a cause of diseases.\n\nProducts for restoring the balance of uranium:\nDue to the fact that uranium is not a necessary nutrient for the body, there are no specific products that can be consumed to restore the balance of uranium. However, by ensuring an overall healthy lifestyle and a balanced diet, the body can better cope with possible exposure to uranium or other radioactive substances.\n\nConclusion:\n\nUranium is a radioactive chemical element that is not a necessary nutrient for the human body. It can pose a health hazard at high concentrations or prolonged exposure. Under normal conditions and ensuring the safety of nuclear materials, the risk of uranium exposure to the human body is minimal. Regular adherence to a healthy lifestyle and a balanced diet contributes to the overall well-being of the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
53	Dietary Mineral Va Vanadium	Introduction:\nVanadium is a chemical element that is often considered in the context of its nutritional properties and potential impact on human health. In this article, we will consider whether vanadium is a macro- or microelement of the body, whether it is dangerous for people, how well it is known, its percentage in the body, functions associated with vanadium, and associated with a deficiency or excess of the disease, as well as products that can be consumed to restore the balance of vanadium.\n\nIs vanadium a macro- or microelement of the body:\nVanadium is a trace element of the body, which means that it is required in small quantities to maintain health.\n\nIs vanadium dangerous for humans:\nVanadium is considered relatively safe for most people if its consumption is within the recommended doses. However, when consuming large doses of vanadium, side effects may occur, including kidney and liver problems. Therefore, it is important to use vanadium in accordance with the recommendations and not exceed the dose.\n\nDegree of fame:\nVanadium is not as widely known as some other nutrients, but research continues on its role in the body and its potential health benefits. Currently, vanadium is attracting more and more attention because of its possible role in metabolic processes and its effect on blood glucose levels.\n\nPercentage in the body:\nThe percentage of vanadium in the human body is small and is less than 0.01% of the total body weight.\n\nVanadium Functions:\nVanadium plays a role in a number of physiological processes, including supporting bone and dental health, regulating blood glucose levels, and metabolic functions.\n\nDiseases with an excess of vanadium:\nAlthough small amounts of vanadium are necessary to maintain health, an excess of this element can be harmful. High doses of vanadium can cause various problems, including damage to the kidneys, liver and nervous system. They can also have a toxic effect on the body as a whole. Therefore, it is important to monitor the level of vanadium consumption and avoid its excessive use.\n\nDiseases with vanadium deficiency:\nVanadium deficiency in the body is rare, since the required amounts of it are small. However, some studies have linked the lack of vanadium with the development of certain diseases, such as diabetes mellitus and bone diseases. More detailed studies are required to fully understand the role of vanadium deficiency in the development of these diseases.\n\nProducts that help restore balance:\nTo maintain a normal balance of vanadium in the body, it is recommended to consume a variety of foods, including food sources of vanadium. Some of these products include nuts, cereals, legumes, vegetables, fruits and meat products. It is important to diversify your diet in order to get enough vanadium from different food sources.\n\nConclusion:\nVanadium is a trace element of the body that plays a role in a number of physiological processes. It has important functions related to maintaining bone health, regulating blood glucose levels and metabolic processes. Small amounts of vanadium are safe for most people, but an excess of this element can cause problems. Vanadium deficiency is rare, but it is associated with some diseases. Proper nutrition with a variety of foods will help maintain balance.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
54	Dietary Mineral Zn Zinc	Introduction:\nZinc is a chemical element that plays an important role in the human body. In this article, we will look at whether zinc is a macro- or microelement, whether it is dangerous to human health, how well it is known, the percentage in the body, the functions associated with zinc, as well as diseases with excess and lack of zinc, and products that can be consumed to restore the balance of zinc.\n\nIs zinc a macro- or microelement of the body:\nZinc is a trace element of the body, which means that it is required in small quantities to maintain health.\n\nIs Zinc dangerous for humans:\nZinc is relatively safe for humans when consumed correctly. However, if too large doses of zinc are consumed, side effects may occur, such as nausea, vomiting, diarrhea and impaired absorption of other nutrients. Therefore, it is important to use zinc in accordance with the recommendations and not exceed the dose.\n\nDegree of fame:\nZinc is a widely known and studied element. It plays an important role in many physiological processes, and its benefits for human health have long been known. Many studies have been conducted to study its functions and effects on the body.\n\nPercentage in the body:\nZinc makes up approximately 0.01% of the total body weight of a person.\n\nZinc Functions:\nZinc plays a role in many physiological processes. It is necessary for the normal functioning of the immune system, growth and development, DNA formation and repair, metabolism and detoxification of the body. It is also important for the health of the skin, hair and nails.\n\nDiseases with excess zinc:\nExcess zinc is rarely found with a natural diet. However, prolonged and excessive intake of zinc in the form of dietary supplements may cause undesirable side effects. Among them may be nausea, vomiting, diarrhea, headaches, decreased appetite and impaired absorption of other trace elements such as iron and copper. Therefore, it is important to adhere to the recommended doses of zinc and avoid excessive consumption.\n\nDiseases with zinc deficiency:\nZinc deficiency can lead to various diseases and negative health consequences. Zinc deficiency can reduce immune function, increase the risk of infections, slow down growth and development, cause skin and hair problems, disrupt taste sensations and worsen the mental and physical development of children. Zinc deficiency may also be associated with some chronic diseases, such as diabetes and Alzheimer's disease.\n\nProducts that help restore balance:\nTo maintain a normal balance of zinc in the body, it is recommended to consume a variety of foods rich in this trace element. Include foods such as meat, seafood, nuts, seeds, whole grains, dairy products, fruits and vegetables in your diet. A variety and balanced diet will help ensure adequate zinc intake.\n\nConclusion:\nZinc is an important trace element of the body that plays a role in many physiological processes. It is necessary to maintain the immune system, growth and development, metabolism and skin health. Lack of zinc can cause various diseases, while excess zinc can lead to side effects.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
55	Dietary Mineral Zr Zirconium	Introduction:\nZirconium is a chemical element that can occur in the human body. In this article, we will consider whether zirconium is a micro- or macroelement, whether it is dangerous to health, as far as it is known, the percentage in the body, the functions of zirconium, diseases with excess and lack of zirconium, as well as products that can help restore the balance of zirconium.\n\nIs zirconium a micro- or macroelement of the body:\nZirconium is a trace element of the body, which means that it is required in small amounts to maintain health.\n\nIs Zirconium dangerous for humans:\nZirconium is generally considered safe for humans. It is not poisonous and usually does not cause undesirable side effects when consumed properly. However, some forms of zirconium, such as dust or zirconium vapors, can be harmful if inhaled or if ingested through wounds. Therefore, it is important to take precautions when working with zirconium in industrial conditions.\n\nDegree of fame:\nZirconium is widely known in scientific and industrial circles, but its role and functions in the human body are still being studied. It is used in various industries such as medicine, electronics and construction.\n\nPercentage in the body:\nZirconium is found in the human body in very low concentrations and its percentage is low.\n\nFunctions of zirconium:\nThe functions of zirconium in the body are not fully understood. It presumably plays some role in the structure of bones and tissues, and may also be involved in some metabolic processes.\n\nDiseases with an excess of zirconium:\nAn excess of zirconium in the human body rarely occurs under natural conditions. However, with prolonged and excessive exposure to zirconium in industrial conditions or through improper use of zirconium preparations, undesirable effects may occur. Possible problems may include skin irritation, respiratory problems, and impaired kidney function.\n\nDiseases with zirconium deficiency:\nZirconium deficiency in the human body has rarely been investigated, and its specific health effects are still unknown. It is assumed that a lack of zirconium can affect bone tissue and metabolic processes, but more detailed studies are needed to fully understand its role.\n\nProducts that help restore balance:\nZirconium is not usually considered as a trace element that is required for special nutrition or balance restoration. In the natural diet, it is present in small quantities. However, to maintain an overall healthy diet and balance of trace elements, it is recommended to consume a variety of foods, such as fruits, vegetables, meat, fish, nuts and grain products.\n\nConclusion:\nZirconium is a trace element that occurs in the human body, although its role and functions have not yet been fully studied. It is generally considered safe for health, but precautions must be taken when working with some forms of zirconium. Natural nutrition usually provides a sufficient amount of zirconium, and there is no need to take special measures to restore its balance.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
56	Dietary Supplements vs Medicine	Introduction:\nIn the modern world, people are increasingly turning to additional means to maintain their health and well-being. Among such products, dietary supplements and medications are the most common. Although they can both play an important role in maintaining health, they have their differences and similarities.\n\nDietary supplements and medications: the same or different?\nDietary supplements and medications have their own characteristics and purpose, and they differ in a number of factors.\n\nWhat are the similarities and what are the differences?\n\nPurpose of use: The main purpose of food additives is to supplement nutrition, provide the body with the necessary nutrients. Medicines, on the contrary, are used for the treatment, prevention and management of diseases.\n\nRegulation: Dietary supplements are subject to special rules and regulations that differ from the strict requirements applied to medicines. Medicines must undergo serious clinical trials and obtain permission for use.\n\nComposition and ingredients: Dietary supplements contain nutrients, vitamins, minerals, antioxidants and other components that may be beneficial to health. Medicines, in turn, contain active ingredients developed for specific medical purposes.\n\nDosage and instructions: Dietary supplements are usually taken in small doses, while medications have clear instructions on dosage, frequency of administration and duration of treatment.\n\nResults and Effects: Dietary supplements are designed to support overall health and well-being, while medications are aimed at treating specific diseases or symptoms.\n\nInclusion in the diet:\nDietary supplements can be useful for people who lack certain nutrients or those who have special needs due to certain conditions or lifestyle. They can be recommended for people who monitor their diet, athletes, pregnant women, the elderly and those who are deficient in certain vitamins or minerals.\n\nMedicines, on the other hand, are used for medical purposes, in the case of diseases requiring treatment or control of symptoms. They can be prescribed by a doctor in accordance with the diagnosis and requirements of the patient.\n\nConclusion:\nFood additives and medicines are different in their purpose, composition and regulation of products. Dietary supplements are used to supplement nutrition and provide the body with essential nutrients, while medications are designed to treat and control diseases. They have different ingredients, dosage and effects. When taking any product, be it a dietary supplement or medicine, it is important to follow the recommendations and instructions, as well as consult with a doctor or specialist to determine the most appropriate approach for your individual health and needs.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
57	Organic Compound Carbohydrates	Introduction:\nCarbohydrates are one of the main classes of organic compounds and are an integral part of our diet. They are the main source of energy for the body and perform important functions in maintaining the health and good functioning of organs and systems.\n\nPercentage of carbohydrates in the human body:\nCarbohydrates make up a significant proportion of our body and are one of the three main macronutrients, along with proteins and fats. Usually carbohydrates make up about 45-65% of the total energy obtained from food.\n\nFunctions of carbohydrates:\n\nEnergy supply: Carbohydrates are the main source of energy for the body. They are broken down to the form of glucose, which is used by cells to synthesize ATP, the main energy carrier in the body.\nEnergy Reserve: Excess carbohydrates that are not immediately used to provide energy can be converted into glycogen and stored in the liver and muscles as a reserve energy source.\nBrain Activity Support: Glucose is the main source of energy for brain function. Carbohydrates provide a constant supply of energy to the brain to maintain its normal function.\nParticipation in cellular processes: Carbohydrates also play a role in cellular processes, including the synthesis of DNA and RNA, proteins and lipids.\nDiseases with excess carbohydrates:\n\nDiabetes mellitus: With an excess of carbohydrates and insufficient insulin response, problems with blood sugar levels may occur, which can lead to the development of diabetes mellitus.\nObesity: Overeating carbohydrates, especially fast carbohydrates, can lead to weight gain and obesity. Excess carbohydrates can turn into fat deposits in the body, especially if they are not burned with enough physical activity.\n\nDiseases with a lack of carbohydrates:\n\nHypoglycemia: A lack of carbohydrates can cause low blood glucose levels, which can lead to hypoglycemia. This condition is accompanied by weakness, dizziness, irritability and loss of consciousness.\nFoods that help restore the balance of carbohydrates:\n\nCereals and cereals: Oatmeal, buckwheat, rice, wheat and other cereals contain a significant amount of carbohydrates that provide the body with energy.\nFruits and vegetables: Fruits such as apples, bananas and oranges, as well as vegetables such as carrots and broccoli, contain natural carbohydrates that help maintain balance.\nLegumes: Lentils, beans, peas and chickpeas are an excellent source of carbohydrates and protein.\nDairy products: Milk, yogurt and cottage cheese contain carbohydrates in the form of lactose, as well as other useful nutrients.\nConclusion:\nCarbohydrates are an important part of our diet and are necessary to provide energy and maintain health. However, you should pay attention to the choice of carbohydrates, giving preference to complex and non-animal sources, as well as control their consumption in order to avoid surpluses or deficiencies that can lead to diseases. A variety of foods rich in carbohydrates will help ensure balance and adequate intake of this important class of nutrients.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
58	Organic Compound Fats	Introduction:\nFats are one of the main classes of organic compounds and play an important role in our body. They are a source of energy, help to absorb some vitamins, and support the health of cells and organs. In this article, we will consider the role of fats in the body, their functions, the consequences of excess and deficiency, as well as products that help restore the balance of fats.\n\nPercentage of fat content in the body:\nFats are one of the main components of our body and make up about 20-25% of the total body weight.\n\nFunctions of fats:\n\nEnergy function: Fats are a concentrated source of energy and help maintain the body's thermal balance.\nProtective function: Fats protect internal organs by providing them with cushioning and protection from damage.\nTransport functions: Fats carry fat-soluble vitamins (vitamins A, D, E, K) and other lipophilic substances to the organs and tissues of the body.\nStructural function: Fats are an important component of cell membranes, contributing to their stability and functioning.\nDiseases with excess fat:\n\nObesity: Overeating fats can lead to the accumulation of excess weight and the development of obesity, which increases the risk of various diseases, including cardiovascular diseases, diabetes and certain types of cancer.\nDiseases with a lack of fats:\n\nLack of essential fatty acids: A lack of certain types of fatty acids, such as omega-3 and omega-6, can negatively affect health, including impaired brain function, inflammatory diseases and skin problems.\nFoods that help restore fat balance:\n\nFish: Fatty fish such as salmon, sardines and cod are an excellent source of healthy omega-3 fatty acids.\n\nNuts and Seeds: Almonds, walnuts, chia seeds and flaxseeds are rich in polyunsaturated fats that promote heart and brain health.\nAvocado: Avocado contains monounsaturated fats, which help reduce harmful cholesterol levels and support heart health.\nOlive Oil: Olive oil is a source of healthy monounsaturated fats and antioxidants that have a positive effect on heart health.\nSalmon: Salmon is rich in omega-3 fatty acids, which help reduce inflammation in the body and support heart health.\nEggs: Eggs contain healthy fats, vitamins and minerals that contribute to the health of the body.\nConclusion:\nFats play an important role in our body, providing energy, supporting the health of cells and organs, as well as helping to absorb vitamins. However, excess fat can lead to obesity, and a lack of essential fatty acids can negatively affect health. To maintain the balance of fats in the body, it is recommended to eat foods rich in healthy fats, such as fish, nuts, seeds, avocado and olive oil. Moderate and balanced fat intake is an important component of a healthy lifestyle.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
59	Organic Compound Protein	Protein is an organic compound that is one of the main components of the human body. In this article, we will look at the role of protein in the body, its percentage, functions, possible diseases with excess or deficiency, products that help restore balance, and summarize.\n\nIntroduction:\nProteins are an important building material of the body and perform many functions. They consist of amino acids, which are connected in chains and form a three-dimensional structure. Proteins are present in all cells of the body and act as enzymes, hormones, antibodies, transport molecules and much more.\n\nPercentage of protein in the body:\nProteins make up a significant part of the human body. The total percentage of protein in the body may vary, but usually amounts to about 15% of the total weight. Protein is present in muscles, skin, bones, blood and other tissues.\n\nProtein Functions:\nProtein performs many important functions in the body. It participates in the growth and repair of tissues, provides energy, participates in the immune system, carries oxygen and nutrients, regulates metabolism, maintains fluid balance and performs many other tasks.\n\nDiseases with excess protein:\nExcess protein in the body may be associated with certain diseases. Snacking on proteins or consuming excessive amounts of protein can lead to an increased stress effect on the kidneys and liver, an increased risk of developing cardiovascular diseases and a violation of the balance of other nutrients.\n\nDiseases with protein deficiency:\nA lack of protein in the body can also have negative consequences. A lack of protein can lead to a weakening of the immune system, delayed growth and development, decreased muscle mass, deterioration of hair, skin and nails, as well as metabolic disorders.\n\nFoods that help restore protein balance:\nTo maintain an optimal balance of protein in the body, it is important to consume a variety of foods rich in proteins. Include meat, poultry, fish, eggs, dairy products, nuts, seeds, legumes, tofu and soy products in your diet. Vegetarians and vegans are recommended to pay special attention to the combination of various sources of vegetable protein to ensure a full supply of all the necessary amino acids.\n\nConclusion:\nProtein is an important element of nutrition and plays a key role in the functioning of the body. It is not only a building material for cells and tissues, but also participates in a variety of biological processes. A lack or excess of protein can have a negative impact on health. Therefore, it is recommended to maintain balance by consuming a variety of protein sources in accordance with the individual needs of the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
60	Perception Hearing	Introduction:\n\nThe hearing perception system is one of the key systems of the body that allows us to perceive and interpret the sounds of the environment. It plays an important role in communication, security and our overall well-being. Hearing health is of great importance, and keeping it in good condition is an important task. In this part, we will look at some hearing disorders, as well as foods that can contribute to the restoration of the hearing perception system.\n\nBenefits of Healthy Hearing:\n\nCommunication: Healthy hearing allows us to clearly hear and understand the speech of people around us. This is important for effective communication and maintaining good relationships.\n\nSafety: Hearing plays an important role in warning of potentially dangerous situations, such as the sound of cars or fire alarms. Healthy hearing helps us stay alert and ensures safety in everyday life.\n\nQuality of life: Healthy hearing promotes full participation in society and enjoyment of the sounds of the surrounding world, such as music, natural sounds and the voices of loved ones. It promotes our emotional well-being and improves the quality of life.\n\nFunctions of the hearing perception system:\n\nSound perception: The hearing perception system allows us to hear and distinguish sounds in the environment. It includes the ear, auditory nerves and areas of the brain responsible for processing sound information.\n\nSpeech Recognition: Hearing plays an important role in speech recognition and understanding. It allows us to distinguish speech sounds, distinguish voices and interpret speech information.\n\nBalance Regulation: In addition to sound perception, the hearing perception system also plays an important role in maintaining balance and coordination of movements. The inner ear contains structures called semicircular channels, which are responsible for the perception of body position and gravitational forces. This allows us to navigate in space and maintain balance.\n\nHearing Aid protection: The hearing perception system also has protective mechanisms aimed at preventing damage to the hearing aid. For example, the middle ear contains small muscles that respond to loud sounds and limit their impact on the ear membrane.\n\nHearing disorders:\n\nHearing Loss: Hearing loss may be temporary or permanent and may vary in degree and cause. This can be caused by various factors, including heredity, age-related changes, infections, injuries, or prolonged exposure to loud sounds. Hearing loss can limit a person's ability to communicate and interact with their surroundings.\n\nTinnitus: Tinnitus is characterized by constant ringing, noise or whistling in the ears that are not associated with external sounds. This can be caused by damage to the auditory cells or other factors, and it can create discomfort and hinder auditory receptivity.\n\nVestibular disorders: Vestibular disorders are associated with impaired balance and coordination due to problems in the inner ear or related structures. This can manifest itself in the form of dizziness, a constant feeling of instability or frequent falls.\n\nEar infections: Ear infections, such as otitis media or otitis externa, can affect hearing and cause discomfort and pain in the ears. They are usually associated with ear inflammation caused by a bacterial or viral infection. Ear infections can temporarily reduce auditory sensitivity and require adequate treatment.\n\nFood for the restoration of the hearing perception system:\n\nFish: Fish such as salmon, sardines and cod are rich in omega-3 fatty acids, which can promote hearing health. Omega-3 fatty acids help improve blood circulation in the ear and support the health of hearing cells.\n\nNuts and seeds: Nuts such as walnuts, almonds and hazelnuts, as well as flax and chia seeds, are rich in antioxidants and vitamin E, which help protect hearing cells from damage.\n\nFruits and Vegetables: Bright fruits and vegetables such as berries, citrus fruits, red peppers and spinach contain antioxidants and vitamins that help strengthen the immune system and support hearing health.\n\nWhole Grains: Whole grains such as oatmeal, rye bread and brown rice contain B vitamins that play an important role in maintaining the health of the nervous system, including the auditory nerves.\n\nConclusion:\n\nThe hearing perception system plays a key role in our communication, safety and quality of life. Hearing loss and other hearing disorders can limit our ability to communicate and interact with the world around us. However, with the help of early diagnosis, treatment and proper nutrition, we can maintain and improve hearing health. Regular meals rich in nutrients, including omega-3 fatty acids, antioxidants and vitamins, can help restore and maintain the health of the hearing perception system. Some products that are recommended to be consumed to restore the hearing perception system include:\n\nSalmon: Rich in omega-3 fatty acids, which help improve blood circulation and the health of hearing cells.\n\nWalnuts: Contain vitamin E and antioxidants that help protect hearing cells from damage.\n\nSpinach and green leafy vegetables: Rich in antioxidants and vitamin C, which help to improve blood circulation in the ears and maintain hearing health.\n\nCitrus Fruits: Rich in vitamin C, which helps restore and protect hearing cells.\n\nBananas: Contain potassium, which plays an important role in regulating the fluid level in the inner ear and maintaining hearing balance.\n\nGreen Tea: Rich in antioxidants that can help protect hearing cells from damage and maintain their health.\n\nIt is important to note that proper nutrition is only one aspect of maintaining hearing health. Regular hearing checks, protection from loud noises and avoiding smoking are also important for maintaining good hearing and preventing hearing disorders.\n\nConclusion:\n\nThe hearing perception system plays an important role in our lives, and maintaining its health is of great importance. Hearing loss and other hearing disorders can significantly affect our communication and quality of life. With the help of early diagnosis, treatment and proper nutrition, we can improve and maintain hearing health.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
61	Perception Sense Of Smell	Introduction:\n\nThe olfactory perception system plays an important role in our ability to sense and recognize scents in the environment. This sensory experience has a significant impact on our mood, appetite and memories. A healthy olfactory perception system allows us to enjoy smells and detect potential hazards such as smoke, gases or spoiled food. In this part, olfactory disorders, their description and products that contribute to the restoration of the olfactory perception system will be considered.\n\nOlfactory disorders:\n\nAnosmia: This is a complete loss of sense of smell when a person is not able to smell. This can be caused by various causes, such as viral infections, injuries, allergies or genetic disorders.\n\nHyposmia: In this case, the sense of smell is reduced, and the person has difficulty recognizing and sensing odors. This may be due to various factors, including heredity, illness, old age, or side effects from medications.\n\nParosmia: In this case, the sense of smell is distorted, and odors may be incorrectly perceived. A person may feel unpleasant or distorted odors even in the absence of a stimulus. The cause may be infections, injuries, neurological disorders or exposure to medications.\n\nProducts for restoring the olfactory perception system:\n\nCitrus fruits: Oranges, lemons, grapefruits and limes contain aromatic compounds that can stimulate the sense of smell and restore its functions.\n\nOnion and Garlic: These foods contain sulfides that can help improve the sense of smell and clear the nasal passages.\n\nHerbs and spices: Turmeric, ginger, cinnamon and other spices and spices contain aromatic compounds that can stimulate the sense of smell and improve its functions.\n\nGreen tea: Green tea contains polyphenols that can help strengthen the nasal mucous membranes and improve the sense of smell.\n\nAntioxidant-rich foods: Fruits and vegetables such as berries, pomegranates, kiwi, spinach and cabbage contain antioxidants that contribute to the overall health of organs and tissues, including the olfactory perception system.\n\nClean water: Drinking enough water helps to keep the nasal passages moist and facilitates the functioning of the olfactory system.\n\nConclusion:\n\nThe olfactory perception system plays an important role in our lives, affecting our emotions, food preferences and safety. Olfactory disorders such as anosmia, hyposmia and parosmia can significantly affect our well-being. However, proper nutrition, including citrus fruits, onions and garlic, herbs, green tea and foods rich in antioxidants, can help maintain and restore the health of the olfactory perception system. Regular consumption of these products, combined with a healthy lifestyle, contributes to the optimal functioning of this important perception system.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
62	Perception Taste	Introduction:\n\nThe taste perception system plays an important role in our daily experience of food consumption. It allows us to experience different tastes, such as sweet, salty, sour and bitter, which makes food more pleasant and satisfying. In addition, taste perception has important functions for our body, such as determining food safety and choosing the right diet.\n\nAdvantages of the taste perception system:\n\nFood safety: The ability to recognize bitterness is an important mechanism for protecting the body from potentially harmful substances. The sharp taste of bitterness may indicate the presence of toxins or toxic substances in food, which helps to avoid their use and maintain health.\n\nDiversity of nutrition: The perception of different taste qualities allows us to enjoy a variety of foods and get all the necessary nutrients. Each taste has its own role in the nutritional balance of the body, and the variety of tastes in food contributes to a balanced diet.\n\nIncreasing the pleasure of food: The perception of taste adds pleasure and enjoyment from food. A variety of taste sensations activates our receptors and causes positive emotions, which contributes to the satisfaction of eating.\n\nFunctions of the taste perception system:\n\nTaste recognition: The taste perception system consists of taste receptors located on the tongue and in the mouth. They are able to recognize basic tastes, such as sweet, salty, sour and bitter, as well as the ability to distinguish nuances and combinations of flavors.\n\nTransmission of signals to the brain: Taste receptors transmit signals about the perception of taste to the brain through the nervous system. These signals are interpreted in the brain, which allows us to be aware of and enjoy the tastes of food.\n\nInfluence on eating behavior: The taste perception system plays an important role in our eating behavior. Different tastes can cause attraction or rejection to certain foods. For example, a sweet taste may be associated with energetically dense food, and a bitter taste may indicate the presence of toxic substances. This affects our preference and choice of food.\n\nDiseases of the taste perception system:\n\nHyposmia: This is a condition in which the enhancement of taste sensations and awareness of tastes deteriorate. It is often associated with a violation of the sense of smell and can be caused by various factors, including viral infections, injuries, allergies and some medical conditions.\n\nDysgesia: This is a change in the perception of taste, which can manifest itself in the form of a distorted taste or the appearance of unpleasant aftertaste. Dysgesia can be caused by various causes, including medications, chemotherapy, infections and certain diseases.\n\nHypergesia: This is a condition in which taste sensitivity increases, and some tastes become more intense and unpleasant. Hypergesia can be caused by various factors, such as neurological disorders, injuries, or certain medical conditions.\n\nProducts for restoring the taste perception system:\n\nCitrus fruits: Lemon, orange and grapefruit contain high levels of vitamin C, which helps maintain healthy taste buds and stimulates the perception of taste.\n\nBerries: Strawberries, raspberries and blueberries are rich sources of antioxidants that help restore and protect taste buds.\n\nGreen tea: It contains polyphenols that can improve taste perception and have antioxidant properties that promote overall health.\n\nHerbs and spices: Turmeric, ginger, cinnamon and other spices contain biologically active substances that can stimulate the taste buds and increase the perception of taste.\n\nGarlic and onion: They contain alicin, which can improve the perception of taste and has antibacterial properties.\n\nZinc-rich foods: Nuts, seeds, beef and shellfish are good sources of zinc, which plays an important role in maintaining healthy taste buds.\n\nIt is important to remember that maintaining a healthy taste perception system also depends on an overall healthy lifestyle, including a balanced diet, moderate alcohol consumption, smoking avoidance and regular oral hygiene.\n\nConclusion:\n\nThe taste perception system plays an important role in our ability to enjoy food and choose the right nutrition. Diseases such as hyposmia, dysgesia and hypergesia can affect the functioning of this system. However, with the help of proper nutrition, rich in nutrients, and the choice of certain foods, we can maintain and restore the health of the taste perception system.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
63	Perception Touch	Introduction:\n\nThe sense of touch system plays an important role in our ability to sense and respond to physical contact with the environment. Touch allows us to evaluate texture, temperature, pressure, and other tactile stimuli, which helps us navigate and interact with the world around us.\n\nAdvantages of the tactile perception system:\n\nWarning of hazards: The sense of touch system helps us respond to potentially dangerous or harmful stimuli, such as fire, sharp objects, or surfaces that are too hot. It warns us about the possibility of damage and allows us to take appropriate measures.\n\nImproved communication: Touch is an important means of communication between people. It allows you to transmit emotional and tactile signals, such as touches, hugs and handshakes, which helps to establish connections and create intimacy.\n\nMotor skills development: The perception of touch plays a key role in the development of motor skills and coordination of movements. It helps us to determine the strength and direction of touch, which is necessary for accurate and controlled performance of various tasks.\n\nFunctions of the tactile perception system:\n\nDiscrimination of tactile stimuli: The system of touch allows us to distinguish between different textures, shapes and surfaces. We can feel soft, smooth, rough or sharp objects and adapt to them.\n\nPressure Response: Touch allows us to assess the force and pressure that is exerted on our skin. This allows us to control the strength of our movements and adapt to different situations.\n\nTemperature registration: The touch system allows us to estimate the temperature of surfaces. We can feel that they are warm, cold or neutral, which helps us respond to temperature changes and take appropriate measures to maintain a comfortable state.\n\nDisorders of the sensory perception system:\n\nHyperesthesia: This is a condition in which a person experiences excessive sensitivity to tactile stimuli. Even a light touch can cause a painful reaction. This condition may be associated with neurological problems or sensory impairments.\n\nAniesthesia: This is a condition in which a person loses sensitivity in certain areas of the body. He cannot feel touch, pressure or temperature in these areas. Aniesthesia can be caused by nerve damage or other medical conditions.\n\nHyposthesia: This is a condition in which a person experiences reduced sensitivity in certain areas of the body. He may feel touches or stimuli, but of reduced intensity. Hyposthesia may be associated with neurological problems or sensory impairments.\n\nProducts for restoring the system of perception of touch:\n\nFoods rich in vitamins and minerals: The inclusion of foods containing vitamins A, C and E, as well as minerals such as zinc and magnesium, can be beneficial for maintaining the health of the nervous system and improving the perception of touch. Examples of such products include nuts, seeds, citrus fruits, berries and green vegetables.\n\nOmega-3 Fatty Acids: Fish such as salmon, sardines and cod contain high levels of omega-3 fatty acids, which can help improve nerve health and nerve endings function.\n\nAntioxidants: Foods rich in antioxidants, such as berries, vegetables, green tea and dark chocolate, can help fight inflammation and improve blood circulation, which can promote nerve endings health and touch function.\n\n4. Proteins: The inclusion of protein-rich foods in the diet, such as meat, fish, eggs and dairy products, can be beneficial for maintaining the health of tissues and nerve endings, including touch receptors.\n\n5. Iron: Iron deficiency can affect the nervous system and the perception of touch. Foods rich in iron, such as beef liver, spinach, legumes and prunes, can help make up for the deficiency of this important mineral.\n\n6. Healthy Lifestyle: In addition to proper nutrition, it is important to maintain a healthy lifestyle, including regular physical activity, adequate sleep and stress management. This can contribute to the overall health of the nervous system and improve the perception of touch.\n\nConclusion:\n\nThe system of perception of touch is an important aspect of our interaction with the world around us. It allows us to evaluate texture, temperature, pressure, and other tactile stimuli. Disorders of this system, such as hyperesthesia, aniesthesia, and hyposthesia, can limit our ability to sense and respond to physical contact. However, with the help of proper nutrition, including foods rich in vitamins, minerals, omega-3 fatty acids and antioxidants, we can maintain and restore the health of the sense of touch system. In addition, a healthy lifestyle and stress management are also important for keeping the nervous system in good condition.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
64	Perception Vision	Vision is one of the main aspects of our perception system and allows us to see and interpret the world around us. It is carried out due to the complex interaction of the eye, optical nerves and the brain. Vision allows us to recognize shapes, colors, movements, and depth.\n\nThe benefits of healthy vision include the ability to see clearly, adapt to different lighting conditions, clearly distinguish colors and peripheral vision. Thanks to vision, we can navigate in space, read, drive a car and enjoy visual impressions.\n\nHowever, there are various diseases and visual disorders that can limit or damage our ability to see. Some of them include farsightedness, myopia, astigmatism, cataracts, glaucoma and macular degeneration.\n\nTo maintain and improve the health of vision, you can pay attention to the diet. Some foods rich in nutrients that are good for eye health include:\n\nCarrots and other orange fruits and vegetables, such as bell peppers and pumpkin, contain beta-carotene and vitamin A, which support the health of the retina.\n\nDark green vegetables, such as spinach, broccoli and kale, are rich in lutein and zeaxanthin, which can reduce the risk of macular degeneration.\n\nFish rich in omega-3 fatty acids, such as salmon, sardines and cod, promotes eye health and reduces the risk of dry eyes.\n\nEggs contain lecithin, zinc and vitamins C and E, which can support the health of eye tissues.\n\nCitrus fruits, berries and kiwis, rich in vitamin C, have antioxidant properties that help protect the eyes from damage and maintain the health of blood vessels in the eye.\n\nNuts and seeds, such as almonds, walnuts and sunflower seeds, contain vitamin E and zinc, which can help in maintaining eye health and protecting against oxidative stress.\n\nGreen tea and blueberries contain antioxidants that can support the health of the retina and protect it from damage.\n\nVitamins C and E, as well as minerals such as zinc and selenium, can be obtained from dietary supplements and can help maintain eye health.\n\nIt is important to note that proper nutrition is only one aspect of maintaining vision health. Regular vision checks, the use of protective sunglasses and computer glasses, as well as the prevention of eye strain during prolonged computer work or reading are also important for maintaining eye health.\n\nConclusion:\n\nThe visual perception system plays a key role in our ability to see and interact with the world around us. Various diseases and visual disorders can significantly affect our ability to see and quality of life. However, with proper nutrition, regular checks and appropriate precautions, we can maintain the health of our perception system and maintain clear and healthy vision throughout life.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
65	Product Group Alcohol	Introduction:\nAlcohol is a common product consumed by people around the world. It contains ethyl alcohol and has the property of causing the effect of intoxication. However, alcohol also has an effect on the body and can have both positive and negative effects.\n\nFunctions:\nAlcohol can have a number of functions for the body. In moderation, it can promote relaxation, relieve stress and improve mood. Some studies also show that moderate consumption of certain types of alcohol, such as red wine, can have a beneficial effect on the cardiovascular system.\n\nComposition:\nAlcohol consists of ethyl alcohol, water and various substances depending on the type of alcoholic beverage. It does not contain vitamins or useful elements necessary for maintaining health.\n\nDangers:\nAlcohol is a potentially dangerous product, especially when consumed excessively. It can have a negative effect on the brain, liver, heart and other organs. Alcohol is also associated with the risk of developing alcohol dependence, psychological problems, social problems, and problems interacting with other medications.\n\nDiseases with excess:\nExcessive alcohol consumption can lead to various diseases and conditions, including cirrhosis of the liver, alcoholic hepatitis, pancreatitis, alcoholic cardiomyopathy, alcoholic neuropathy and others.\n\nDiseases with a lack of:\nLack of alcohol is not a disease, since alcohol is not an essential nutrient for the body. However, drinking alcohol in moderation can be part of social experiences and cultural traditions.\n\nCases of use:\nAlcohol consumption is recommended only in moderation and only for adults. Many countries have guidelines for safe alcohol consumption, and they should be followed. Alcohol consumption can be a social activity or part of special events, but it must be conscious and responsible.\n\nConclusion:\nAlcohol is a common product, but its consumption can have both positive and negative consequences for the body. Moderate and responsible alcohol consumption may be acceptable in certain cases, but it is important to keep in mind the possible risks and follow the recommendations for safe consumption. If you have any problems or questions related to alcohol consumption, it is recommended to consult a doctor or a healthy lifestyle specialist for more information and advice.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
66	Product Group Confectionery Product	Introduction:\nConfectionery is a wide range of products that usually have a sweet taste and are designed to satisfy a sweet desire. They are popular in many cultures and are a frequent part of the diet of people around the world.\n\nFunctions:\nConfectionery products have various functions. Firstly, they provide energy due to the content of carbohydrates and fats. In addition, they can give pleasure and improve mood. In some cases, confectionery products can be used as a gift or a symbolic gesture.\n\nComposition of elements and vitamins:\nConfectionery products contain various ingredients, including carbohydrates, fats, proteins, vitamins and minerals. They may also contain additives such as flavorings, dyes and preservatives. The composition and nutritional value of confectionery products can vary greatly depending on their type and manufacturer.\n\nDanger and risks:\nEating confectionery in excess can lead to various healthy problems. They usually contain high amounts of sugar, fat and calories, which can contribute to the development of obesity, tooth decay, diabetes and other related diseases. It is also worth noting that confectionery products may contain artificial additives and ingredients that can be harmful when consumed in large quantities or in persons with certain allergies or intolerances.\n\nDiseases with excess:\nThe consumption of confectionery in excess can lead to the following diseases and problems: obesity, diabetes mellitus, caries, cardiovascular diseases, high blood pressure and nutrient imbalance.\n\nDiseases with a lack of:\nAlthough confectionery products are not a necessary part of a healthy diet, the absence of their consumption will not lead to a lack of any specific nutrients. However, with the complete exclusion of confectionery products from the diet, a psychological desire to enjoy sweets may arise.\n\nProducts for restoring balance:\nIn an effort to restore balance and ensure a healthy diet, it is recommended to choose confectionery products with moderate sugar content, low fat content and added ingredients. Priority should be given to natural and low-fat options, such as fruit desserts, nut pastes or dark chocolate with a high cocoa content.\n\nConclusion:\nConfectionery products are delicious and pleasant products, but their use should be limited due to their high sugar, fat and calorie content. Too much confectionery can lead to various diseases associated with obesity and metabolic disorders. It is important to choose healthier versions of confectionery and consume them with moderation, focusing on the overall diversity and balance of nutrition.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
67	Product Group Dairy Product	Introduction:\nDairy products are an important group of foods that are of great nutritional value and play an important role in a healthy diet. They are made from milk and include a variety of products such as milk, yogurt, cottage cheese, cheese and butter.\n\nFunctions:\nDairy products are rich in nutrients, including proteins, fats, carbohydrates, vitamins (especially vitamin D and vitamin B12) and minerals such as calcium and phosphorus. They serve as a source of energy, help in the construction and repair of body tissues, support the health of bones and teeth, strengthen the immune system and support the normal functioning of many body systems.\n\nComposition:\nDairy products contain important elements such as calcium, phosphorus, potassium, magnesium, zinc and iodine. They are also a source of high-quality protein and fat, including saturated and unsaturated fatty acids.\n\nDangers:\nDairy products, in general, do not pose a danger to most people. However, some people may be allergic to lactose contained in milk and some of its products, or have an intolerance to milk protein. In such cases, it is recommended to consult a doctor or a nutritionist for recommendations on replacing dairy products.\n\nDiseases with excess:\nExcessive consumption of dairy products can lead to overweight and obesity due to high fat and calorie content. Also, an excess of fatty foods can increase the level of cholesterol in the blood, which may be associated with the development of cardiovascular diseases.\n\nDiseases with a lack of:\nA lack of dairy intake can lead to calcium deficiency, which can lead to weakened bones and an increased risk of osteoporosis and other calcium-related diseases. Also, a lack of dairy products can lead to a lack of vitamin D, which can have a negative impact on the health of bones and the immune system.\n\nProducts to restore balance:\nTo restore the balance of dairy products, it is recommended to use the following products:\n\nMilk and yogurt: sources of calcium, protein and other nutrients.\nCottage cheese: rich in protein and calcium, well absorbed by the body.\nCheese: contains calcium, protein and other useful elements.\nOil: a source of fatty acids and vitamin D.\nConclusion:\nDairy products are an important group of foods that provide the body with essential nutrients. They are a source of calcium, protein, fats and other important elements that play a role in maintaining the health of bones, muscles, the immune system and other body systems. However, with excessive consumption of dairy products, there may be a risk of excess weight and certain diseases, and a lack of such products can lead to a deficiency of calcium and vitamin D. It is recommended to include dairy products in a varied and balanced nutritional program and consult with a doctor or nutritionist to determine individual needs and recommendations for their consumption.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
68	Product Group Fruits and Berries	Introduction:\nFruits and berries are an important group of foods that are not only a delicious addition to our diet, but also rich sources of nutrients. They contain many elements and vitamins that are important for maintaining the health of the body.\n\nFunctions:\nFruits and berries perform several important functions for our body. They provide the body with vitamins, minerals and antioxidants that help support the immune system, protect cells from damage, improve digestion and metabolism, and also contribute to the normalization of blood pressure.\n\nComposition:\nFruits and berries contain a variety of elements and vitamins, including vitamin C, B vitamins, vitamin A, vitamin K, potassium, magnesium, folic acid and dietary fiber. They are also low-calorie foods and contain natural sugars that give them a sweet taste.\n\nDangers:\nFruits and berries usually do not pose a health hazard, especially if consumed in moderation. However, people with certain allergic reactions may have an intolerance to certain fruits or berries. In addition, excessive consumption of fruits with a high sugar content can be harmful for people with diabetes or problems with blood sugar levels.\n\nDiseases in case of excess:\nIn case of excessive consumption of fruits and berries, there may be a risk of gaining excess weight or problems with blood sugar levels in people with diabetes. In addition, some people may experience digestive problems or allergic reactions when consuming certain fruits or berries excessively.\n\nDiseases in case of shortage:\nA lack of fruit and berry intake can lead to a lack of important vitamins and minerals such as vitamin C, vitamin A and potassium. This can affect the health and immune system of the body. Vitamin C deficiency can lead to decreased immunity, increased fatigue and delayed wound healing. A lack of vitamin A can lead to vision problems and a decrease in the protective functions of the skin and mucous membranes.\n\nProducts for restoring balance:\nTo restore balance and ensure the necessary consumption of fruits and berries in the diet, it is recommended to eat a variety of fresh fruits and berries. It is important to choose seasonal and ripe fruits to get the maximum benefit from them. You can also eat frozen or dried fruits and berries, which retain most of their nutrients.\n\nConclusion:\nFruits and berries are an important and nutritious component of our diet. They have a high content of vitamins, minerals and antioxidants that support the health of the body. Eating a variety of fresh fruits and berries helps to maintain the immune system, good digestion and metabolism. However, it is necessary to use them with moderation and take into account the individual needs of the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
69	Product Group Grains and Beans	Introduction:\nGrains and legumes are an important group of foods that are widely used in our diet. They provide the body with the necessary energy and a lot of nutrients. In this article, we will look at the functions of grain and legume products, their composition by elements and vitamins, as well as potential problems associated with their consumption.\n\nFunctions:\nGrains and legumes are an excellent source of carbohydrates, which are the main source of energy for the body. They also contain important nutrients such as fiber, proteins, B vitamins and minerals. Grains and legumes contribute to the normalization of digestion, regulation of blood sugar levels, maintaining the health of the cardiovascular system and ensuring sufficient intake of nutrients into the body.\n\nComposition by elements and vitamins:\nGrains and legumes contain a variety of elements and vitamins, including iron, magnesium, zinc, folic acid, thiamine and niacin. Iron is necessary for the formation of hemoglobin and oxygen transport in the body. Magnesium is involved in the work of the muscles and nervous system. Zinc plays an important role in immune function and growth. Folic acid, thiamine and niacin are essential for the formation and functioning of body cells.\n\nDangers or problems:\nIn general, grains and legumes are safe and healthy for consumption. However, some people may have an allergic reaction to certain types of grain products, such as wheat or gluten. In addition, improper preparation or storage of grain and legume products can lead to contamination by pathogenic microorganisms and cause food poisoning.\n\nDiseases with excess:\nThe consumption of excessive amounts of cereals and legumes can lead to some diseases and problems. For example, excessive consumption of foods rich in carbohydrates can lead to elevated blood sugar levels, which can contribute to the development of diabetes and excess weight. Also, some grain products may contain anti-nutrients, such as phytates and lignans, which in large quantities can reduce the digestibility of certain nutrients, such as iron and zinc.\n\nDiseases with deficiency:\nThe lack of grains and legumes in the diet can lead to various diseases and problems. For example, a lack of fiber, which is found in grain products, can lead to digestive problems, constipation and an increased risk of developing various intestinal diseases, including cancer. Also, a lack of B vitamins, which are present in cereals and legumes, can lead to disorders of the nervous system, anemia and other health problems.\n\nProducts that can restore balance:\nTo restore balance and achieve optimal consumption of cereals and legumes, it is recommended to include a variety of types of cereals and legumes in the diet. It is important to choose unprocessed foods such as whole grains, legumes, oat flakes and rice, as they retain most of the nutrients. It is also recommended to pay attention to the quality and freshness of the products, as well as their proper and safe preparation.\n\nConclusion:\nGrains and legumes play an important role in our diet and have a variety of nutrients. They are a source of energy, fiber, vitamins and minerals. The consumption of various types of cereals and legumes helps to maintain the health of the digestive system, regulate blood sugar levels and ensure adequate intake of nutrients.\n\nIt is important to remember that moderation and diversity are key principles in the consumption of cereals and legumes. Avoid excessive consumption of foods rich in carbohydrates to prevent problems with blood sugar and excess weight. You should also pay attention to the quality and freshness of the products, as well as proper preparation to preserve their nutritional properties.\n\nThe inclusion of cereals and legumes in the diet is recommended for most people, but everyone should take into account their individual needs and health. If you have special dietary restrictions or diseases, contact your doctor or nutritionist for recommendations on optimal consumption of cereals and legumes.\n\nIn general, proper and balanced consumption of cereals and legumes is an important part of a healthy diet. They provide the body with essential nutrients and contribute to maintaining overall well-being and health.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
70	Product Group Mashrooms	Introduction:\nMushrooms are a unique food group that is widely used in food culture around the world. They have a special taste, texture and nutritional composition. Mushrooms vary by species and are diverse in their properties and characteristics.\n\nFunctions:\nMushrooms have a number of important functions for the human body. They are a source of protein, fiber, vitamins, minerals and antioxidants. Mushrooms also contain low amounts of fats and carbohydrates, which makes them a popular choice for those who follow their diet.\n\nElements and vitamins:\nMushrooms contain various elements and vitamins, including vitamin D, vitamin B complex (including vitamin B12), iron, zinc, magnesium and folic acid. They are also rich in antioxidants such as selenium and ergothioneine, which help protect the body from free radical damage.\n\nDanger and safety:\nIn general, mushrooms are safe to eat, but you need to be careful when collecting and consuming wild mushrooms, as some of them can be poisonous. It is recommended to buy mushrooms in a store or from reliable suppliers.\n\nDiseases with excess and deficiency:\nExcessive consumption of mushrooms can cause food poisoning or allergic reactions in some people. However, in general, mushrooms are safe to consume in reasonable quantities. The lack of mushrooms in the diet is not the main problem, since they can be replaced with other products.\n\nWhen is it recommended to eat mushrooms:\nMushrooms are a universal product and can be included in various dishes and recipes. They go well with meat, vegetables, rice and pasta. Mushrooms can be used in salads, soups, sauces, casseroles and many other dishes. They give them a special aroma and taste. Mushrooms are also popular among vegetarians and vegans, as they are an excellent source of vegetable protein.\n\nConclusion:\nMushrooms are a valuable food product with many useful properties and nutrients. They contain vitamins, minerals and antioxidants, which are important for human health. Mushrooms can be safely eaten in reasonable quantities, but care must be taken when collecting and consuming wild mushrooms. It is recommended to buy mushrooms in proven places and follow hygiene rules when cooking them. The inclusion of mushrooms in the diet can diversify it and enrich it with nutrients.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
71	Product Group Meat	Introduction:\nMeat is one of the main groups of products that are often included in the human diet. It is a valuable source of nutrients and is essential for our body. In this article we will look at the functions of meat, its composition by elements and vitamins, the potential dangers associated with its use, as well as diseases that occur when there is an excess or lack of meat in the diet.\n\nMeat functions:\nMeat plays an important role in our body and performs several functions:\n\nStructural function: Meat contains proteins necessary for the growth, development and regeneration of tissues in the body. Proteins are the basic building blocks of our body and are essential for maintaining healthy muscles, bones and skin.\nEnergy function: Meat is a source of energy due to its fat content. Fats provide the body with long-term energy storage and help maintain an optimal body temperature.\nNutrient Supply: Meat is rich in vitamins and minerals such as iron, zinc, vitamin B12 and niacin. These nutrients play an important role in maintaining the health and functioning of the body.\nMeat composition:\nMeat consists mainly of proteins, fats, vitamins and minerals. The meat contains elements such as iron, zinc, magnesium and selenium, which play an important role in various functions of the body. It is also rich in B vitamins, vitamin A and vitamin D.\n\nPotential hazards:\nCareless consumption of meat, especially red meat and processed meat products, may be associated with some health problems. Excessive consumption of red meat can increase the risk of developing cardiovascular diseases, high blood pressure and certain types of cancer, including colon cancer. Processed meat products, such as sausages, sausages and ham, may contain preservatives, additives and high levels of salt, which can be harmful to health if they are consumed frequently and excessively.\n\nDiseases with excess and lack of meat:\nExcessive meat consumption can lead to a number of diseases, including obesity, cardiovascular diseases, diabetes and some cancers. On the other hand, a lack of meat in the diet can lead to a deficiency of iron, vitamin B12 and other nutrients, which can cause anemia, deterioration of the immune system and other health problems.\n\nCases when it is recommended to eat meat:\nMeat can be especially useful in the following cases:\n\nDuring the period of growth and development: Children and adolescents need enough protein and nutrients to maintain normal growth and development.\nAfter heavy physical exertion: After intensive training and physical exercises, the body needs muscle recovery and an energy reserve that can be provided with a diet that includes meat.\nIn people suffering from iron deficiency: Meat is a rich source of iron, so its use may be recommended for people with a deficiency of this important mineral.\nConclusion:\nMeat is an important source of nutrients and plays an important role in our body. It provides proteins, fats, vitamins and minerals necessary for the healthy functioning of the body. However, it is necessary to take into account the recommendations for moderate consumption of meat and avoid excessive consumption	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
72	Product Group Vegetables	Introduction:\nVegetables are an important group of foods that should be included in our diet. They are a source of many nutrients and are essential for maintaining the health of the body. In this article we will look at the functions of vegetables, their composition by elements and vitamins, potential dangers and benefits, as well as diseases associated with an excess or lack of vegetables in the diet.\n\nFunctions of vegetables:\nVegetables play an important role in our body and perform the following functions:\n\nSupply of Vitamins and Minerals: Vegetables are rich in vitamins (e.g. vitamin C, vitamin K, folic acid) and minerals (e.g. potassium, magnesium). These nutrients are essential for maintaining the health and normal functioning of the body's organs and systems.\nSupply of dietary fiber: Vegetables contain dietary fiber, which helps in the normalization of digestion, supports healthy intestinal microflora and prevents constipation.\nAntioxidant Protection: Many vegetables contain antioxidants that help protect the body's cells from free radical damage and reduce the risk of various diseases, including cardiovascular diseases and cancer.\nVegetable Composition:\nVegetables contain a wide range of nutrients, including vitamins, minerals and dietary fiber. Vitamins such as vitamin C, vitamin K, beta-carotene (a precursor of vitamin A), as well as minerals including potassium, magnesium, iron and calcium are present in various vegetables.\n\nPotential hazards and benefits:\nVegetables in general are not dangerous to health, however, some people may be allergic to certain types of vegetables. In addition, when eating some vegetables in large quantities, some problems may arise.\n\nDiseases with excess and lack of vegetables:\nExcessive consumption of vegetables usually does not cause serious diseases, but some people may experience discomfort in the gastrointestinal tract due to the increased volume of dietary fiber. A lack of vegetables in the diet can lead to a deficiency of vitamins and minerals, which may be associated with a deterioration of the immune system, digestive problems and insufficient intake of antioxidants.\n\nCases when it is recommended to eat vegetables:\nThe use of vegetables is recommended in the following cases:\n\nAs part of a balanced diet: Vegetables should be included in the daily diet in combination with other food groups to ensure sufficient intake of nutrients.\nWhile maintaining a healthy weight: Vegetables are low in calories and high in dietary fiber, which helps to control weight and reduces the risk of obesity.\nIn the prevention of various diseases: Regular consumption of vegetables is associated with a reduced risk of developing cardiovascular diseases, cancer, diabetes and other chronic diseases.\nConclusion:\nVegetables are an important group of foods that provide the body with nutrients, vitamins and minerals. They perform many functions, supporting the health of the body. Eating vegetables as part of a balanced diet helps maintain a normal weight, reduces the risk of various diseases and contributes to overall well-being. Therefore, it is recommended to include vegetables in your daily diet.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
73	Product Group Water	Water is one of the main vital food groups that plays a key role in maintaining human health. In this article we will look at important aspects related to water.\n\nIntroduction:\nWater is an integral part of our body, making up about 60-70% of its total mass. It performs many functions that affect our overall health and good functioning of the body.\n\nWater functions:\n\nHydration: Water is the main source of hydration of the body. It helps to maintain an optimal balance of water in cells, tissues and organs, ensuring the proper functioning of all body systems.\nNutrient Transport: Water plays a key role in the transport of nutrients, vitamins and minerals throughout the body. It helps to deliver the necessary nutrients to the cells and remove waste and toxins from the body.\nTemperature regulation: Water participates in the process of regulating body temperature, allowing the body to maintain an optimal level of heat in various conditions.\nWater composition:\nWater does not contain elements and vitamins in significant quantities. It is a neutral substance consisting of molecules of hydroexides, H2O.\n\nDanger or safety of drinking water:\nWater, as a rule, is a safe and necessary substance for life. However, the water quality may vary depending on the source. In some cases, water contamination with hazardous substances or microorganisms can pose a threat to health. Therefore, it is important to use clean and safe water from reliable sources.\n\nDiseases with excess and lack of water:\nExcessive water intake can lead to a state of excessive hydration, known as hyperhydration. This can cause dilution of the concentration of electrolytes in the body and disruption of the normal functioning of cells and tissues. In severe cases, hyperhydration can lead to edema, heart failure and other serious problems.\n\nLack of water in the body can cause a state of dehydration. This can happen with insufficient water intake or with the loss of a large amount of fluid due to excessive sweating, vomiting, diarrhea and other reasons. Dehydration can lead to dry skin, deterioration of organs and systems, and in severe cases can be life-threatening.\n\nProducts that promote hydration:\nTo maintain an optimal level of hydration, it is recommended to consume a sufficient amount of clean water. In addition, many fruits and vegetables, such as watermelon, melon, cucumbers and tomatoes, contain a high concentration of water and can help meet the need for fluids.\n\nConclusion:\nWater plays an important role in maintaining human health. It performs a number of important functions, including hydration, nutrient transport and regulation of body temperature. Lack or excess of water in the body can cause various health problems. Therefore, it is recommended to consume a sufficient amount of clean water and monitor your hydration level to maintain an optimal state of the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
74	System Bone	Introduction:\n\nThe bone system is an important part of the human skeleton and performs many functions, including supporting the body, protecting internal organs and providing movement. Bones also play an important role in the production of blood cells and the storage of minerals such as calcium. In this article, we will look at the functions of the bone system and the most common diseases associated with it.\n\nPositive:\n\nThe bone system provides body support and protection of internal organs.\nBones help in the production of blood cells and the storage of minerals.\nBones promote movement and maintain the correct shape of the body.\nFunctions:\n\nThe bone system performs the following functions:\n\nSupport: Bones provide support to the body, allowing us to stand and move.\n\nProtection: Some bones protect internal organs such as the brain, heart and lungs.\n\nBlood cell production: Some bones, such as the sternum, the wings of the shoulder blades and the pelvis, produce blood cells.\n\nMineral Storage: Bones store minerals such as calcium and phosphorus, which help maintain bone structure and are involved in other biological processes.\n\nDiseases:\n\nOsteoporosis: this is a disease in which bones become brittle and brittle, which can lead to fractures even with minor injuries.\n\nOsteoarthritis: This is a form of arthritis that is associated with the wear and tear of joints and bones, which can lead to pain, stiffness and impaired movement.\n\nBone cancer: This is a rare disease that can arise from cells located in bones, or spread to bones from other parts of the body.\n\nDeforming osteitis: This is a disease in which the bones become thicker and less elastic, which can lead to pain and deformation of the bones.\n\nConclusion:\n\nBone systems play a key role in maintaining the physical structure of the body, protecting organs and ensuring movement. However, various bone diseases, such as osteoporosis, osteoarthritis, bone cancer and deforming osteitis, can seriously affect a person's health and quality of life. The diagnosis and treatment of these diseases is an important task for the medical community.\n\nUnderstanding the functions and structure of the bone system allows us to develop effective strategies for the prevention and treatment of bone diseases. Modern diagnostic methods, including radiography, computed tomography and densitometry, make it possible to detect changes in bone tissue and determine the risk of developing diseases.\n\nTreatment of bone diseases may include drug therapy, physical therapy, surgery and lifestyle changes. It is also important to maintain a healthy nutritious diet rich in calcium, vitamin D and other essential nutrients to maintain bone density and health.\n\nIn conclusion, a healthy bone system is the foundation of our body, providing support, protection and the ability to move. Regular checks, a healthy lifestyle and timely treatment of diseases will help to keep the bones in good condition and maintain overall health and well-being.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
75	System Cardiovascular	Introduction:\n\nThe cardiovascular system is one of the key systems of the body responsible for blood circulation and the delivery of oxygen and nutrients to all organs and tissues. It consists of the heart, blood vessels and blood. The health of the cardiovascular system is important for the overall well-being of the body. In this article, we will look at the advantages and disadvantages of the cardiovascular health system, as well as the diseases describing them.\n\nBenefits of the Cardiovascular health system:\n\nEffective Blood Circulation: A healthy cardiovascular system ensures effective blood circulation, which allows organs and tissues to receive sufficient oxygen and nutrients. Good blood circulation contributes to the optimal functioning of all organs and the maintenance of overall health.\n\nHealthy Heart: A strong and healthy heart is a key component of the cardiovascular system. Regular physical activity and a healthy lifestyle contribute to the development and maintenance of a healthy heart. A strong heart is able to contract effectively, maintaining a normal rhythm and pressure.\n\nReducing the risk of diseases: A healthy cardiovascular system is associated with a reduced risk of developing cardiovascular diseases, such as arterial hypertension, coronary heart disease and stroke. Regular exercise, a healthy diet, stress management and the rejection of bad habits can help maintain a healthy cardiovascular system and reduce the risk of developing these diseases.\n\nDiseases of the cardiovascular system:\n\nArterial hypertension (high blood pressure): This condition is characterized by a constantly elevated blood pressure level. High blood pressure can put additional stress on the heart and blood vessels, increasing the risk of developing cardiovascular diseases.\n\nCoronary heart disease: This condition occurs when the arteries supplying blood and oxygen to the heart become narrow or blocked due to the accumulation of cholesterol and other substances (atherosclerosis). Coronary heart disease can lead to angina pectoris (chest pain) or myocardial infarction (impaired blood supply to the heart muscle).\n\nStroke: A stroke occurs when the blood supply to a certain part of the brain is interrupted, which leads to a violation of its functions. This can be caused either by blockage of blood vessels or their rupture. Stroke can have serious consequences, including paralysis, speech and memory disorders, and in some cases even death.\n\nHeart failure: This is a condition when the heart cannot contract effectively and pump blood throughout the body. This can be caused by various reasons, including damage to the heart after a myocardial infarction, hypertension or other cardiovascular diseases. Heart failure is manifested by fatigue, shortness of breath, swelling and other symptoms.\n\nConclusion:\n\nThe cardiovascular health system has a number of benefits, including effective blood circulation, a healthy heart and a reduced risk of developing cardiovascular diseases. However, there are various diseases that can affect the functioning of this system, including arterial hypertension, coronary heart disease, stroke and heart failure. Maintaining a healthy lifestyle that includes regular exercise, a healthy diet, stress control and regular medical examinations help maintain the health of the cardiovascular system and reduce the risk of developing these diseases.\n\nOne of the key points in maintaining cardiovascular health is maintaining normal blood pressure. This can be achieved by moderate physical activity, reducing salt intake, maintaining a healthy weight and avoiding bad habits such as smoking and excessive alcohol consumption.\n\nProper nutrition is also an important aspect of heart health. It is recommended to consume foods rich in vegetables, fruits, whole grains, low-fat dairy products, fish, nuts and olive oil. Moderate consumption of meat, poultry and seafood, as well as limiting the intake of saturated fats, trans fats and sugar is also important for maintaining heart health.\n\nIn addition, stress management plays a significant role in maintaining cardiovascular health. Regular relaxation exercises, meditation, hobbies and maintaining social connections can help reduce stress levels and improve heart function.\n\nIn conclusion, the health of the cardiovascular system is of fundamental importance for the overall well-being of the body. Benefits include efficient blood circulation, a healthy heart and a reduced risk of cardiovascular disease. However, it is necessary to pay attention to various diseases that can affect the operation of this system, and take appropriate measures to prevent and manage them.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
76	System Central Nervous	Introduction:\n\nThe central nervous system (CNS) is one of the main systems of the body responsible for the management and coordination of all organs and systems. It consists of the brain and spinal cord, which process information from all organs and tissues, and also send commands to other parts of the body.\n\nPositive:\n\nControl and coordination: The central nervous system is responsible for the control and coordination of all body functions, including movement, muscle coordination, reactions to various signals and many other processes.\n\nInformation processing: The central nervous system processes information from all organs and tissues, which allows the body to respond to changes in the external and internal environment.\n\nMemory and Emotion Management: The central nervous system is also responsible for memory and emotion management, which is important for our psychological and emotional stability.\n\nAdaptability: The central nervous system is able to adapt to various situations and changes in the body, which allows us to adapt to new conditions and maintain our health.\n\nFunctions:\n\nSignaling: The central nervous system transmits signals from various parts of the body to the brain and back, which allows the body to respond to various external and internal stimuli.\n\nMovement Control: The central nervous system is responsible for movement control and muscle coordination, which allows the body to perform various tasks such as walking, running and many others.\n\nRegulation of organs and systems: The Central nervous system controls the work of all organs and systems of the body, including cardiovascular, respiratory, endocrine and many others.\n\nMemory and Emotion Management: The central nervous system is also responsible for memory and emotion management, which is important for our psychological and emotional stability.\n\nDiseases:\n\nParkinson's disease: Parkinson's disease is a progressive neurological disease that affects the movement of the body. It is characterized by a decrease in the production of the neurotransmitter dopamine in certain areas of the brain, which leads to symptoms such as trembling of the hands, muscle stiffness, impaired coordination and slowness of movements.\n\nEpilepsy: Epilepsy is a chronic neurological disease that causes regular episodes of seizures. It occurs due to abnormal electrical activity in the brain, which can lead to loss of consciousness, seizures, unusual behavior and other symptoms.\n\nMigraine: Migraine is an intense headache, often accompanied by symptoms such as nausea, vomiting, sensitivity to light and sound. It is associated with the expansion and narrowing of the vessels of the brain, and the exact causes of migraine are not fully understood.\n\nAlzheimer's disease: Alzheimer's disease is a progressive neurological disease that causes problems with memory, thinking and behavior. It is associated with the accumulation of abnormal protein structures in the brain, which leads to the gradual degradation of nerve cells.\n\nConclusion:\n\nThe central nervous system plays an important role in the management and coordination of all body functions. Its functions include signal transmission, motion control, regulation of organs and systems, as well as memory and emotion management. However, neurological diseases such as Parkinson's disease, epilepsy, migraine and Alzheimer's disease can significantly affect the functioning of this system and the quality of a person's life. Understanding these diseases and developing effective methods of their treatment are important tasks in medicine. Striving for early diagnosis and availability of treatment for these diseases helps to improve the prognosis and reduce their negative impact on patients.\n\nAt the same time, research and development in the field of neurology continues, and new methods of diagnosis, treatment and rehabilitation are emerging aimed at improving the quality of life of patients with neurological diseases. Personalized medicine and the use of new technologies, such as genetic testing and telemedicine, open up new opportunities in the prevention, diagnosis and treatment of these conditions.\n\nIn conclusion, the system of the central nervous system is fundamental to the functioning of the body. Understanding its role, functions and the most common neurological diseases allows you to focus on maintaining and improving the health of this system. This requires the joint efforts of the medical community, researchers and society as a whole to ensure the best care for patients and progress in the field of neurology.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
77	System Digestive	Introduction:\n\nThe digestive system is one of the most important systems of the body responsible for the digestion and assimilation of food, as well as providing the body with the necessary nutrients. It consists of various organs, including the mouth, esophagus, stomach, intestines and liver. In this article we will look at the advantages and disadvantages of the digestive system, as well as the diseases describing them.\n\nBenefits of the digestive system:\n\nProper Digestion: A healthy digestive system ensures proper digestion of food and absorption of nutrients. It decomposes food into small components that the body can use to generate energy and maintain organ functions.\n\nImmune System Support: Most of the body's immune system is connected to the digestive system. A healthy gastrointestinal tract contains beneficial bacteria that help fight harmful microorganisms and maintain balance in the body. This is important for maintaining immunity and protecting the body from infections.\n\nFull nutrition: A healthy digestive system allows the body to get all the necessary nutrients from food. This is important for maintaining energy, growth and development, as well as for the functioning of all organs and systems of the body.\n\nDiseases of the digestive system:\n\nGastroesophageal Reflux Disease (GERD): This is a condition in which acid from the stomach returns to the esophagus, causing irritation and inflammation. Symptoms may include heartburn, regular regurgitation, chest pain, and regurgitation of food. Prolonged violation of GERD can lead to esophageal damage and other complications.\n\nPeptic ulcer disease: This condition is characterized by the formation of ulcers on the mucous membrane of the stomach or duodenum. Ulcers are formed due to a violation of the balance between the protective factors of the mucous membrane and aggressive factors, such as the acidity of gastric juice or the presence of Helicobacter pylori infection. Symptoms of peptic ulcer disease may include stomach pain, heartburn, nausea, vomiting and loss of appetite.\n\nIrritable Bowel syndrome (IBS): It is a functional disorder of the digestive system that is characterized by symptoms such as abdominal pain, bloating, constipation or diarrhea. The cause of IBS is not fully understood, but factors such as stress, poor nutrition, and changes in the interaction between the brain and intestines may play a role in its development.\n\nPancreatitis: This is an inflammatory disease of the pancreas. Pancreatitis can be acute or chronic. Acute pancreatitis usually occurs as a result of a hallucinogenic disorder or alcohol abuse, and chronic pancreatitis can be caused by alcohol, smoking or genetic disorders. Symptoms of pancreatitis may include abdominal pain, nausea, vomiting, diarrhea, and loss of appetite.\n\nConclusion:\n\nThe digestive system plays an important role in maintaining the health of the body by ensuring proper digestion, supporting immunity and providing the body with essential nutrients. However, it is also susceptible to various diseases, such as GERD, peptic ulcer, irritable bowel syndrome and pancreatitis, which can significantly disrupt its function. Timely diagnosis, treatment and maintenance of a healthy lifestyle, including proper nutrition, regular physical activity and stress management, will help to reduce the risk of developing and managing diseases of the digestive system. Consultation with a doctor and compliance with recommendations for treatment and prevention play an important role in maintaining the health of the digestive system. Taking care of the digestive system should become an integral part of the overall healthy lifestyle in order to ensure optimal functioning of the body and improve the quality of life.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
78	System Endocrine	The endocrine regulation system plays an important role in the body, controlling many functions and ensuring hormonal balance. In this system, the main organs are the endocrine glands, which produce hormones and release them directly into the blood. Here are some basic aspects of the endocrine regulation system:\n\nIntroduction:\n\nThe endocrine regulation system includes various endocrine glands in the body, such as the thyroid gland, pituitary gland, adrenal glands, ovaries (in women) and testicles (in men). Each of these glands produces and releases specific hormones that control various physiological processes in the body.\n\nDisadvantages of the endocrine regulation system:\n\nEndocrine disorders: Some disorders associated with the endocrine regulation system can lead to hypofunction or hyperfunction of the endocrine glands. For example, hypothyroidism is insufficient thyroid function, or hyperthyroidism is excessive thyroid function. These disorders can cause a variety of symptoms, including changes in metabolism, weight changes, fatigue and digestive problems.\nFunctions of the endocrine regulation system:\n\nRegulation of metabolism: Hormones produced by the endocrine glands play an important role in the regulation of metabolism in the body. They control the metabolic rate, blood glucose levels, nutrient absorption and energy use.\n\nRegulation of growth and development: Growth hormones secreted by the pituitary gland control the growth and development of the body. They affect cell division, the formation of bones and muscles, as well as the function of organs and systems.\n\nReproductive function: Hormones produced by the sex glands (ovaries in women and testicles in men) play an important role in reproductive function. They control the menstrual cycle in women, spermatogenesis in men, as well as the development and function of the genitals.\n\nRegulation of emotional state: Hormones such as estrogens and progesterone in women, as well as testosterone in men, have an impact on emotional state and mood. An imbalance of these hormones can lead to mood disorders, irritability and depression.\n\nDiseases of the endocrine regulation system:\n\nDiabetes: Diabetes is one of the most common diseases associated with the endocrine regulation system. It is characterized by elevated blood sugar levels due to insufficient insulin release (type 1 diabetes) or improper use of insulin by the body (type 2 diabetes).\n\nHypothyroidism: Hypothyroidism is a condition in which the thyroid gland produces an insufficient amount of hormones. This can lead to a decrease in metabolism, fatigue, dry skin, hypersensitivity to cold and other symptoms.\n\nHyperthyroidism: Hyperthyroidism, on the contrary, is characterized by excessive thyroid function and elevated levels of thyroid hormones in the body. This can cause an increased heart rate, increased sweating, nervousness and weight loss.\n\nPituitary adenoma: Pituitary adenoma is a tumor that develops in the pituitary gland, a small gland located at the base of the brain. This can lead to excessive or insufficient production of pituitary hormones, which causes various symptoms, including visual impairment, headaches, menstrual irregularities in women and decreased libido in men.\n\nPolycystic Ovary syndrome (PCOS): PCOS is an endocrine disorder characterized by the formation of many small cystic formations on the ovaries. This condition can lead to menstrual irregularities, infertility, excessive hair growth on the body and face, as well as skin problems.\n\nAddison's disease: Addison's disease is a rare disease in which the adrenal glands do not produce enough corticosteroid hormones, such as cortisol. This can lead to weakness, fatigue, skin pigmentation, low blood pressure and other symptoms.\n\nConclusion:\n\nThe endocrine regulation system plays an important role in maintaining hormonal balance and controlling many physiological processes in the body. Unbalanced work of the endocrine system can lead to various diseases and disorders of organ functions. Proper treatment and management of these diseases requires an individual approach and cooperation with an endocrinologist to achieve optimal health and well-being.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
79	System Excretory	Introduction:\nThe excretion system, also known as the excretory system, plays an important role in maintaining fluid balance and removing waste from the body. It includes organs such as the kidneys, bladder and ureters. In this article, we will look at the pros and cons of the excretion system, as well as some common diseases associated with it.\n\nAdvantages of the allocation system:\n\nRegulation of water and electrolyte balance: The excretion system helps to maintain the correct balance of water and electrolytes in the body. The kidneys play a major role in filtering blood and removing excess water, salts and other waste. This allows you to maintain an optimal concentration of substances inside the body and maintain the normal functioning of cells.\n\nWaste disposal: The excretion system is responsible for the disposal of waste generated as a result of metabolism in the body. The kidneys filter the blood and remove excess water, ammonia, urea and other metabolic products. This allows you to avoid their accumulation and maintain the body in a healthy state.\n\nRegulation of acid-base balance: The excretion system plays an important role in maintaining acid-base balance in the body. The kidneys remove excess acid or alkali, maintaining an optimal pH of blood and tissues. This is important for the normal functioning of many physiological processes, such as breathing, digestion and muscle function.\n\nBlood Pressure Regulation: The kidneys play a role in regulating blood pressure by controlling blood volume and sodium levels in the body. They help maintain stable blood pressure, which is important for the health of the heart and blood vessels.\n\nDiseases of the excretory system:\n\nKidney failure: This is a condition in which the kidneys are able to perform their functions to the fullest. Kidney failure can be caused by various causes, including chronic kidney disease, kidney damage, infections, and other factors. It can lead to the accumulation of waste and toxins in the body, a violation of the balance of electrolytes and fluids, as well as an increase in blood pressure.\n\nUrolithiasis: This is a condition in which stones (urolithiasis) form in the urinary system, which can block the normal flow of urine. Stones can be formed from various substances, such as calcium, oxalates, urates and others. Urolithiasis can cause pain, inflammation, urinary tract infections and complications requiring treatment.\n\nUrinary Tract infections: Urinary tract infections can include bladder infection (cystitis), urinary tract infection (pyelonephritis) and other inflammatory processes. They are usually caused by a bacterial infection that can enter the urinary system through the bladder or ureters. Symptoms may include pain when urinating, frequent urination, malaise and fever.\n\nKidney stones: Kidney stones are solid formations that are formed in the kidneys from mineral salts and other substances. They can be small and pass through the urinary tract without symptoms, or they can become large and cause severe pain and difficulty urinating. Kidney stones require treatment, which may include drug therapy or surgery.\n\nIn conclusion, the excretion system is an important part of our body responsible for maintaining the balance of fluids, waste disposal and regulation of many physiological processes. It plays a key role in maintaining health and well-being.\n\nDespite its importance, the excretion system can be susceptible to various diseases and disorders, such as kidney failure, urolithiasis, urinary tract infections and kidney stones. These conditions can cause various symptoms and require appropriate treatment.\n\nHowever, due to its advantages, such as water balance regulation, waste disposal and acid-base balance regulation, the excretion system is able to maintain our health and overall well-being.\n\nIt is important to maintain the health of the excretion system through proper nutrition, regular water intake, physical activity and regular medical examinations. Early detection and treatment of diseases associated with the excretory system can help prevent serious complications and maintain optimal health.\n\nContact qualified medical professionals if you have any problems or symptoms related to the discharge system. Regular medical examinations and taking care of your health contribute to the longevity and well-being of your body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
80	System Exocrine	The exocrine secretion system is an important part of our body responsible for the release of fluids, enzymes and other substances into the external environment of the body or body cavity. It plays a role in digestion, thermoregulation and protection of organs and tissues.\n\nHowever, like other body systems, the exocrine secretion system can be susceptible to various diseases and disorders. Here are some of them:\n\nPancreatitis: This is an inflammatory disease of the pancreas, which can be caused by various causes, including alcohol abuse, gallstone disease or autoimmune disorders. Pancreatitis leads to impaired pancreatic function and can cause symptoms such as abdominal pain, diarrhea and weight loss.\n\nCystic fibrosis: This is a genetic disease that affects the exocrine glands, including the sweat and salivary glands. Cystic fibrosis causes the formation of a thick secretion that impedes drainage and can lead to damage to organs such as the lungs and digestive system.\n\nDisorders of the sweat gland: This is a group of diseases that affect the function of the sweat glands and can lead to excessive or insufficient sweating. Some of the disorders of the sweat gland include hyperhidrosis, hypohidrosis and abnormal sweat odors.\n\nDiseases of the salivary glands: This is a group of diseases that affect the salivary glands and can lead to a decrease or increase in saliva production. Some common salivary gland diseases include Serger's syndrome, salivary gland cancer, and dry mouth.\n\nEarly detection and treatment of diseases of the exocrine secretion system is important for maintaining health and good functioning of the body. Despite possible diseases, the exocrine secretion system also has its advantages and plays an important role in our lives. Here are some of their main advantages:\n\nAdvantages of the exocrine secretion system:\n\nDigestion: Exocrine secretion glands, such as the pancreas and salivary glands, produce enzymes necessary for effective digestion. These enzymes help to decompose food and ensure full absorption of nutrients.\n\nThermoregulation: Sweat glands, which are also part of the exocrine secretion system, play a key role in regulating body temperature. They release sweat, which evaporates from the surface of the skin and helps to cool the body in conditions of high temperature or physical activity.\n\nProtection of organs and tissues: Some exocrine glands secrete secretions that serve as protective functions. For example, tears produced by the lacrimal glands help to wash away dust and foreign particles from the surface of the eye, preventing irritation and infections.\n\nHydration and lubrication: Some exocrine glands, such as sweat glands and salivary glands, perform the function of hydration and lubrication. They help maintain moisture levels in the skin, mouth and other body cavities, preventing dryness and discomfort.\n\nIt is important to take care of the health of the exocrine secretion system and be regularly examined to identify possible diseases or disorders. If there are symptoms or problems associated with exocrine secretion, it is necessary to consult a doctor for diagnosis and treatment.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
81	System Immune	Introduction:\n\nThe immune system is an important component of the body responsible for protecting against infections, diseases and other harmful effects. It consists of various cells, tissues and organs that cooperate to provide immunity and maintain health. In this section, we will look at some of the benefits and functions of the immune system, as well as some disorders associated with its improper operation.\n\nAdvantages:\n\nProtection of the body from infections: The main function of the immune system is to protect the body from bacteria, viruses, fungi and other infectious agents. It detects and destroys harmful microorganisms, preventing their reproduction and spread.\n\nAnomaly Recognition and Elimination: The immune system is able to recognize and eliminate abnormal cells, including cancer cells. It plays an important role in preventing the development of cancer and controlling its spread.\n\nAdaptability and memory: The immune system has adaptability and memory. She is able to 'remember' infections that she has previously encountered, and quickly respond to the repeated invasion of the same pathogen. This provides a more effective and rapid protection of the body.\n\nImmune system functions:\n\nRecognition and destruction of infectious agents: The immune system is able to recognize pathogens such as bacteria, viruses, fungi and parasites. It activates various cells and mechanisms to destroy pathogens and prevent their spread.\n\nAntibody production: The immune system produces antibodies - proteins that bind to pathogens and help in their destruction. Antibodies also play a role in activating other components of the immune system.\n\nRegulation of inflammatory reactions: The immune system regulates inflammatory reactions in the body. Inflammation is the immune system's natural response to injury or infection. However, with excessive or prolonged inflammation, it can become harmful and cause tissue damage. The immune system regulates inflammatory processes to keep them in balance.\n\nElimination of abnormal cells: The immune system plays an important role in removing abnormal or mutated cells in the body. This includes cancer cells that the immune system can recognize and destroy, preventing the development of tumors.\n\nDiseases of the immune system:\n\nAutoimmune diseases: In autoimmune diseases, the immune system directs its attack on the body's own cells and tissues, considering them foreign. Examples of autoimmune diseases include rheumatoid arthritis, systemic lupus erythematosus, and Lupus disease.\n\nImmunodeficiency states: Immunodeficiency states are characterized by weakened immunity, which makes the body more susceptible to infections and diseases. An example is HIV infection, which attacks and destroys the immune system, leading to the development of opportunistic infections.\n\nAllergic reactions: Allergic reactions occur when the immune system incorrectly reacts to normally safe substances such as pollen, food or dust. This leads to allergy symptoms such as itching, runny nose, skin rashes and respiratory problems.\n\nConclusion:\n\nThe immune system plays an important role in protecting the body from infections and diseases. It provides protection, regulates inflammatory processes and eliminates abnormal cells	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
82	System Lymphatic	Introduction:\n\nThe lymphatic system is an important part of the body and performs a number of important functions related to immunity and drainage of excess fluid from tissues. It consists of lymphatic vessels, lymph nodes, spleen, purulent tissues and other organs. In this section, we will look at some of the benefits and functions of the lymphatic system, as well as some diseases associated with its dysfunction.\n\nAdvantages:\n\nProtecting the body from infections: The lymphatic system plays an important role in the body's immune defense. It contains lymphoid tissues and lymphocytes that help fight infections by producing antibodies and activating immune responses.\n\nDrainage of excess fluid: The lymphatic system is responsible for collecting and removing excess intercellular fluid called lymph. This helps maintain fluid balance in the body and prevents swelling.\n\nFat Transport: The lymphatic system plays an important role in the absorption and transport of fats from food. Fats, called chylomicrons, are absorbed by intestinal cells and transported through lymphatic vessels to blood vessels, where they are used for energy or stored.\n\nFunctions of the lymphatic system:\n\nImmune defense: The lymphatic system is involved in protecting the body from infections. Lymphoid tissues and lymphocytes in the lymphatic system play a key role in the recognition and destruction of infectious agents.\n\nDrainage and purification: The lymphatic system collects excess intercellular fluid, toxins and waste from tissues and transports them to the lymph nodes for purification and filtration. This helps to maintain a healthy tissue environment.\n\nTransport of fats and nutrients: The lymphatic system is responsible for the absorption and transport of fats, as well as some nutrients from food. This is especially important for the absorption of fatty vitamins (vitamins A, D, E, K) and their delivery to the appropriate organs and tissues.\n\nFormation and maturation of lymphocytes: The lymphatic system is the site of formation and maturation of lymphocytes, including T cells and B cells. These cells play an important role in the body's immune response.\n\nDiseases of the lymphatic system:\n\nLymphadenopathy: This is a condition in which the lymph nodes become enlarged, painful or inflamed. Lymphadenopathy may be associated with infections, cancer, or other inflammatory processes.\n\nLymphomas: Lymphomas are a group of cancers that affect the lymphatic system. They may be characterized by abnormal growth of lymphocytes or other cells of the lymphatic system. Examples of lymphomas include Hodgkin's lymphoma and non-Hodgkin's lymphomas.\n\nLymphedema: Lymphedema is swelling that occurs due to improper drainage function of the lymphatic system. It usually develops when lymph vessels or nodes are damaged or become ill, which prevents the normal outflow of lymph. Lymphedema is often found in the extremities and can cause discomfort and functional problems.\n\nConclusion:\n\nThe lymphatic system performs important functions in maintaining immunity, fluid drainage and nutrient transport. Disorders of the lymphatic system, such as lymphadenopathy, lymphomas and lymphedema, can have a significant impact on health and require appropriate medical intervention. Early detection and treatment of these diseases are essential for maintaining the health of the lymphatic system. Various diagnostic methods, such as biopsy of lymph nodes, formations and blood tests, help to determine the cause and nature of the disease. Treatment may include drug therapy, surgery, radiation and physical therapy, depending on the specific case. However, to maintain the health of the lymphatic system, it is also important to pay attention to the general aspects of a healthy lifestyle, such as proper nutrition, physical activity and avoiding bad habits. Regular medical examinations and examinations will help identify potential problems and take measures to prevent them or treat them in a timely manner. Maintaining the health of the lymphatic system contributes to the overall well-being of the body and maintaining a strong immune system.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
83	System Muscular	Introduction:\n\nThe muscular system is one of the main systems of the body and plays an important role in maintaining motor functions and providing support and structure of the body. It consists of various types of muscles that work in interaction with each other to perform a variety of movements and functions.\n\nAdvantages of the muscular system:\n\nMotor Function: Muscles provide body movement, allowing us to walk, run, lift objects and perform other physical actions.\nSupport and Structure: Muscles support the skeleton, providing support for organs and tissues.\nParticipation in metabolism: Muscle activity contributes to an increase in metabolism and energy, which contributes to maintaining a healthy lifestyle.\nImprovement of psychological state: Physical activity associated with muscle work contributes to the release of endorphins, the so-called 'hormones of happiness', which can improve mood and reduce stress.\nFunctions of the muscular system:\n\nMovement: Muscles contract and relax, creating the strength needed to perform the movements.\nSupport: Muscles support the skeleton and organs, providing structural support to the body.\nThermoregulation: Muscles are able to generate heat, which helps maintain an optimal body temperature.\nParticipation in metabolism: Muscles consume energy and participate in metabolism, contributing to the burning of calories and maintaining a healthy weight.\nDisorders of the muscular system:\n\nMyopathies: This is a group of diseases that affect muscles and can lead to weakness, muscle contraction and impaired motor functions.\nMyasthenia gravis: It is a neuromuscular disorder that causes muscle weakness and fatigue, especially during physical activity.\nMuscle injuries: Various muscle injuries are possible, such as sprains, torn muscles, overexertion syndromes or damage to ligaments and tendons. These injuries can occur as a result of improper movements, excessive load, or accidents.\nMuscle Dystrophy: Muscle dystrophy is a group of genetic disorders that cause gradual weakening and degeneration of muscles. Some well-known forms of muscle dystrophy include Duchenne dystrophy, neuromuscular mesh type dystrophy, and Friedreich dystrophy.\nInflammatory muscle diseases: These include myositis, which are characterized by inflammation of the muscles and can be caused by infection, autoimmune disorders or other causes.\nMyoclonia: Myoclonia are small involuntary muscle contractions that can manifest as rhythmic or non-rhythmic movements. They can be associated with various disorders, including epilepsy, neurological diseases or hereditary factors.\n\nConclusion:\n\nThe muscular system is an integral part of the body, providing movement, support and body structure. Various disorders of the muscular system can affect the functioning and quality of life of a person. Understanding these disorders allows us to develop strategies for their diagnosis, treatment and rehabilitation. Maintaining the health of the muscular system requires moderate physical activity, regular exercise and taking care of the prevention of injuries and diseases.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
84	System Perifer Nervous	Introduction:\n\nThe peripheral nervous system is an important part of the nervous system of the body. It consists of a network of nerves and nerve endings that are located outside the brain and spinal cord. The role of the peripheral nervous system is to transmit signals between the central nervous system and the rest of the body. It plays a key role in the control of movement, sensations and reactions to external stimuli.\n\nAdvantages of the peripheral nervous system:\n\nConnection to the central nervous system: The peripheral nervous system provides a connection between the central nervous system and the rest of the body, allowing you to transmit information and control the movements and functions of organs.\n\nAutonomous nervous system: One of the main functions of the peripheral nervous system is the regulation of autonomous functions of the body, such as heartbeat, respiration, digestion, etc. This occurs through the sympathetic and parasympathetic nervous systems.\n\nSomatic nervous System: The somatic part of the peripheral nervous system controls conscious movements and sensations, such as sensory, motor skills and coordination.\n\nFunctions of the peripheral nervous system:\n\nConducting nerve impulses: The main function of the peripheral nervous system is to transmit nerve impulses from the central nervous system to the organs and tissues of the body, as well as in the opposite direction.\n\nMotor control: The peripheral nervous system controls the muscles and controls the movements of organs and limbs.\n\nFeelings: It also plays a role in the transmission of sensory signals from organs and tissues to the central nervous system, which allows us to perceive and respond to the environment.\n\nConclusion:\n\nThe peripheral nervous system plays an important role in the management and coordination of body functions, providing communication between the central nervous system and the rest of the body. Its advantages are the ability to connect with the central nervous system, regulate autonomous functions and control conscious movements and sensations. The main functions of the peripheral nervous system include conducting nerve impulses, motor control and the transmission of sensations.\n\nHowever, there are a number of diseases and disorders that can affect the functioning of the peripheral nervous system. Some of them include:\n\nPeripheral neuropathy: This is a condition in which nerves in the peripheral nervous system are damaged or destroyed, which can lead to a feeling of numbness, weakness or pain in the extremities.\n\nGwillen-Barre syndrome: It is a rare neurological disease in which the immune system attacks the peripheral nervous system, causing weakness, loss of sensation and paralysis.\n\nCarpal tunnel syndrome: This is a condition in which the nerves in the wrist are squeezed, which causes numbness, pain and weakness in the hand.\n\nDiabetes mellitus neuropathy: Blood sugar levels characteristic of diabetes can damage nerves, especially in the legs and arms, which can lead to numbness, pain and loss of sensation.\n\nUnderstanding these diseases and timely access to a doctor are important for the diagnosis and treatment of possible problems with the peripheral nervous system. The development of effective methods of treatment and rehabilitation also plays an important role in restoring the functions of the peripheral nervous system and improving the quality of life of patients.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
85	System Reproductive	Introduction:\n\nThe reproductive organ system plays a key role in the reproduction and maintenance of human vision. It includes the organs responsible for the reproduction process and the production of hormones that regulate reproductive function. The health of this system is essential for family planning and overall physical and emotional well-being.\n\nAdvantages and functions of the reproduction system:\n\nReproduction: The main function of the reproduction system is to ensure the reproduction process. In women, this includes the ability to conceive and carry a child, and in men, the ability to produce and transmit sperm.\n\nHormonal regulation: The reproductive system plays an important role in the production and regulation of hormones such as estrogens, progesterone, testosterone and others that control reproductive functions and maintain hormonal balance.\n\nSexual function: The reproductive system is also responsible for sexual function and satisfaction. Organs and nervous structures associated with reproduction play an important role in arousal, orgasm and sexual satisfaction.\n\nLife expectancy: The health of the reproductive system can also affect the duration and quality of life. Regular checks, preventive measures and treatment of diseases of the reproductive system help to prevent possible complications and problems.\n\nDiseases of the reproductive system:\n\nInfections of the genitourinary system: Inflammatory infections such as cystitis, urethritis or sexually transmitted diseases can affect the health of the reproductive system, causing discomfort, pain and even fertility problems.\n\nEndometriosis: This is a condition in which tissue similar to the inner layer of the uterus (endometrium) grows outside the uterus. This can cause pain, menstrual irregularities and fertility problems.\n\nUterine fibroids: Fibroids are benign tumors that develop in the muscular wall of the uterus. It can cause menstrual problems, pain, enlargement of the uterus and problems with getting pregnant.\n\nCancer of the reproductive organs: Cancer of the uterus, ovaries, cervix or other organs of the reproductive system is a serious disease. Early detection and treatment play an important role in a successful outcome.\n\nConclusion:\n\nThe reproductive system is an important component of the human body, providing the possibility of reproduction, maintaining hormonal balance and sexual function. However, diseases of the reproductive system can significantly affect health and quality of life. Therefore, it is important to consult a doctor if you experience any symptoms or problems related to the reproductive system, and receive timely treatment and preventive measures to maintain health and well-being.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
86	System Respiratory	Introduction:\n\nThe respiratory system is an important part of the body that ensures the supply of oxygen to organs and tissues, as well as the removal of carbon dioxide from the body. It consists of organs and structures, including the nasal cavity, larynx, trachea, bronchi and lungs. A healthy respiratory system is necessary to maintain the vital activity of the body and overall well-being.\n\nAdvantages of the breathing system:\n\n1. Oxygen supply: The respiratory system allows the body to receive sufficient oxygen necessary for cellular respiration. Oxygen entering through the inhaled air is transferred to the blood and distributed throughout the body, providing energy and vital functions.\n\n2. Carbon dioxide removal: The respiratory system is also responsible for the removal of carbon dioxide, which is a metabolic product. Carbon dioxide is released from the body through exhalation, which allows you to maintain a normal blood pH level and prevent its acidification.\n\n3. Air filtration and purification: The respiratory system plays an important role in filtering and purifying the inhaled air from dust, dirt and microorganisms. The nasal cavity and mucous membrane have protective mechanisms that help prevent harmful substances from entering the body.\n\n4. Temperature and humidity regulation: The breathing system helps to regulate the temperature and humidity of the inhaled air before it reaches the lungs. This is important to maintain optimal conditions for the functioning of organs and tissues.\n\nDiseases of the respiratory system:\n\n1. Asthma: This is a chronic inflammatory disease of the respiratory tract, which leads to narrowing of the bronchi and restriction of air flow. Typical asthma symptoms include shortness of breath, wheezing, coughing, and chest tightness. Asthma can be caused by a variety of factors, including allergens, infections, and exercise.\n\nChronic Obstructive Pulmonary disease (COPD): This is a progressive lung disease that is characterized by chronic inflammation and restriction of air flow. COPD is often caused by smoking and includes chronic bronchitis and emphysema. The main symptoms include cough, shortness of breath and increased fatigue.\n\nViral respiratory infections: Respiratory infections caused by viruses such as the flu and the common cold are common diseases of the respiratory system. They manifest symptoms including runny nose, stuffy nose, throat and cough.\n\nPneumonia: It is an infectious inflammatory lung disease that can be caused by bacteria, viruses or fungi. The main symptoms of pneumonia include cough with sputum, chest stiffness, fever and fatigue.\n\nConclusion:\n\nThe respiratory system plays an important role in providing the body with oxygen and removing carbon dioxide. It has advantages such as oxygen supply, removal of metabolic waste, filtration of inhaled air and regulation of its temperature and humidity. However, diseases of the respiratory system, such as asthma, COPD, viral respiratory infections and pneumonia, can significantly disrupt its functioning and cause various symptoms and complications. Maintaining the health of the respiratory system through a healthy lifestyle, regular checkups and preventive measures plays an important role in maintaining overall well-being and quality of life.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
87	System Urinary	Introduction:\n\nThe genitourinary nervous system is part of the peripheral nervous system and plays an important role in controlling the functions of the genitourinary system. It provides a connection between the bladder, ureters, sphincters and the central nervous system. This system contains nerve endings and receptors that regulate the processes of urination and control the function of the organs of the genitourinary system.\n\nAdvantages of the genitourinary nervous system:\n\nRegulation of urination: The genitourinary nervous system controls the contraction of the bladder and the opening/closing of the sphincters, which allows you to effectively manage urination and prevent unwanted incontinence.\n\nMonitoring of urinary tract function: This system ensures coordination between the bladder and the ureters, regulating the flow of urine and ensuring the normal function of the urinary tract.\n\nReactions to stimuli: The genitourinary nervous system detects stimuli in the bladder, such as filling or stretching, and initiates signals to the central nervous system so that the patient realizes the need to urinate.\n\nSexual Function: Nerve endings in the genitourinary nervous system play an important role in sexual function, controlling erection, orgasm and satisfaction.\n\nDiseases of the genitourinary nervous system:\n\nNeurogenic bladder dysfunction: This is a condition in which the nerves controlling the bladder do not function properly. This can lead to urinary incontinence, frequent urination, or difficulty urinating.\n\nHypersensitivity syndrome of the bladder: In this case, the bladder becomes particularly sensitive to unpleasant sensations, causing pain signals or the need for constant urination, even with a slight filling.\n\nNeurogenic bladder: This is a condition in which the nervous system controlling the bladder does not function properly due to damage or disease. This can lead to decreased urination control, urinary incontinence, or difficulty urinating.\n\nUrolithiasis: This is a condition in which stones form in the urinary system, including the bladder. Stones can cause pain, difficulty urinating and tissue damage.\n\nBladder spasm: This is a condition in which the bladder contracts unusually or too much, causing a feeling of intense pressure, pain, or frequent urination.\n\nConclusion:\n\nThe system of the genitourinary nervous system plays an important role in the control of the functions of the genitourinary system. Disorders of this system can lead to urinary incontinence, difficulty urinating and other problems with the function of the urinary system. Diagnosis and treatment of these diseases require a comprehensive approach and may include drug therapy, physiotherapy and surgery, depending on the specific case. Understanding these disorders and timely access to a doctor will help preserve the health and quality of life of patients.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
88	Vitamin A	Vitamin A is an essential nutrient that plays a crucial role in maintaining the health of the eyes, skin, and immune system. In this article, we will discuss the pros and cons of vitamin A, as well as list the foods that are rich in it.\n\nPros of Vitamin A:\n\nImproved Vision: Vitamin A is necessary for the proper functioning of the retina and adaptation to darkness. It promotes the preservation of visual functions and helps prevent night blindness.\nHealthy Skin: Vitamin A plays an important role in maintaining healthy skin. It helps regulate the production of sebum, which helps prevent acne and maintain skin hydration.\nStrengthened Immune System: Vitamin A supports the normal functioning of the immune system, aiding in the fight against infections and viruses. It strengthens the body's protective barriers and enhances its resistance to diseases.\n\nCons of Vitamin A:\n\nToxicity with Excessive Intake: Consuming excessively high doses of vitamin A can lead to toxic effects on the body. This may manifest as nausea, dizziness, dry skin, and even liver problems. It is important to adhere to the recommended dosage of vitamin A to avoid potential issues.\nRisk for Pregnant Women: High doses of vitamin A can be dangerous for pregnant women as they may cause fetal damage. It is crucial to consult with a doctor and follow the recommendations for vitamin A intake when planning or during pregnancy.\n\nFoods Rich in Vitamin A:\n\nCarrots: Carrots are one of the most well-known sources of vitamin A. They also contain beta-carotene, which the body can convert into vitamin A.\nSweet Potatoes: Sweet potatoes are also rich in vitamin A. They serve as a tasty and nutritious alternative to regular potatoes and can be included in various dishes.\nSpinach: Spinach contains a significant amount of vitamin A, along with other beneficial nutrients. It can be used in salads, stews, and other dishes.\nYellow Fruits and Vegetables: Apricots, peaches, mangoes, and pumpkins - all these fruits and vegetables are rich in vitamin A. They also add brightness and flavor to your meals.\nFish Oil: Fish oil, especially that found in oily fish like salmon and cod, is an excellent source of vitamin A. It also contains beneficial omega-3 fatty acids.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
89	Vitamin B1	Vitamin B1, also known as thiamine, is an essential nutrient that plays a key role in maintaining a healthy body. In this article, we will discuss the pros and cons of vitamin B1, as well as list the foods that are rich in this vitamin.\n\nBenefits of Vitamin B1:\n\nEnergy metabolism: Vitamin B1 is involved in metabolism and helps convert carbohydrates into energy. It plays an important role in maintaining the normal functioning of cells and organs.\n\nNervous system function: Vitamin B1 promotes the healthy functioning of the nervous system. It helps in transmitting nerve impulses and maintaining proper brain function.\n\nImproved digestion: Vitamin B1 stimulates the production of stomach acid and improves digestion. It also contributes to a healthy appetite and normal digestion.\n\nHeart health: Vitamin B1 has a positive impact on the cardiovascular system. It helps maintain a normal heart rhythm and strengthen the heart muscle.\n\nDisadvantages of Vitamin B1:\n\nDeficiency: A deficiency of vitamin B1 can lead to a condition called beriberi, which is characterized by symptoms such as fatigue, weakness, and disruptions in the functioning of the heart and nervous system.\n\nRisk for alcoholics: People who abuse alcohol are at an increased risk of vitamin B1 deficiency. Alcoholism can lead to nutrient deficiencies, including vitamin B1.\n\nFoods rich in Vitamin B1:\n\nGrains and cereals: Wheat bran, oatmeal, rye bread, and corn are all rich sources of vitamin B1. Include these foods in your diet to ensure an adequate intake of vitamin B1.\n\nLegumes: Lentils, chickpeas, beans, and peas are excellent sources of vitamin B1. They are also rich in protein, fiber, and other important nutrients.\n\nMeat: Beef, pork, and poultry contain vitamin B1. Make sure to include these types of meat in your diet to obtain sufficient amounts of vitamin B1.\n\nFish and seafood: Salmon, cod, sardines, and oysters contain vitamin B1. They are also sources of beneficial omega-3 fatty acids, which have a positive impact on heart and brain health.\n\nNuts and seeds: Peanuts, almonds, pistachios, sunflower seeds, and flaxseeds are all rich in vitamin B1. Include these foods as snacks or add them to salads and cereals.\n\nDairy products: Milk, yogurt, and cheese can also be sources of vitamin B1. They also contain calcium and other important nutrients for bone and dental health.\n\nConsider incorporating these foods into your diet to ensure an adequate intake of vitamin B1 and maintain the health of your body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
90	Vitamin B2	Vitamin B2, or riboflavin, is an important nutrient necessary for the normal functioning of the body. In this article, we will discuss the pros and cons of vitamin B2.\n\nIntroduction:\nVitamin B2 plays a key role in metabolism and maintaining the health of cells. It is necessary for converting food into energy and supporting the health of the skin, eyes, and nervous system.\n\nPros of Vitamin B2:\n\nEnergy metabolism: Vitamin B2 is involved in the process of converting carbohydrates, fats, and proteins into energy. It helps maintain normal metabolism and provides energy for daily activities.\n\nSkin and mucous membrane health: Vitamin B2 plays an important role in maintaining the health of the skin, hair, and nails. It helps maintain skin elasticity, improves its condition, and helps prevent various skin problems.\n\nVision: Vitamin B2 has a protective effect on the eyes and can help maintain the health of eye tissues. It may reduce the risk of developing certain eye conditions such as cataracts and glaucoma.\n\nAntioxidant protection: Vitamin B2 is an antioxidant that helps protect the body's cells from damage caused by free radicals. It contributes to overall body protection against oxidative stress and related diseases.\n\nCons of Vitamin B2:\n\nVitamin B2 deficiency can lead to a condition called ariboflavinosis. Symptoms include inflammation of the mucous membranes, dry skin, cracks at the corners of the mouth and tongue, as well as vision problems.\n\nSun sensitivity: Some people may experience increased sensitivity to sunlight when taking high doses of vitamin B2.\n\nProducts rich in Vitamin B2:\n\nDairy products: Milk, yogurt, cottage cheese, and cheese are good sources of vitamin B2. They also contain calcium and other important nutrients for bone health.\n\nMeat: Beef, pork, and poultry contain vitamin B2. Ensure that your diet includes these types of meat to obtain an adequate amount of vitamin B2.\n\nFish and seafood: Salmon, tuna, sardines, and oysters are sources of vitamin B2. They are also rich in omega-3 fatty acids, which are beneficial for heart and brain health.\n\nEggs: Eggs contain vitamin B2, as well as protein and other nutrients. They can be included in various dishes or consumed separately.\n\nGreen vegetables: Spinach, broccoli, cabbage, and green peas contain vitamin B2. They are also rich in fiber and other beneficial nutrients.\n\nNuts and seeds: Peanuts, almonds, pistachios, sunflower seeds, and flaxseeds contain vitamin B2. They can be included in the diet as snacks or added to salads and cereals.\n\nGrains and cereals: Oats, buckwheat, rice, and other grains contain vitamin B2. They can be a staple food and added to various dishes.\n\nYeast: Brewer's yeast is an excellent source of vitamin B2. It can be used in baking or added to soups and sauces.\n\nIncluding these products in your diet will help ensure an adequate intake of vitamin B2 and maintain the health of your body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
91	Vitamin B3	Vitamin B3, also known as niacin, is an important nutrient necessary for maintaining overall health. In this article, we will discuss the pros and cons of vitamin B3.\n\nIntroduction:\nVitamin B3 plays a crucial role in energy metabolism, nerve function, and skin health. It is a part of many enzymes that regulate chemical reactions in the body.\n\nPros of Vitamin B3:\n\nEnergy metabolism: Vitamin B3 helps convert carbohydrates, fats, and proteins into energy, which is necessary for daily activities. It plays a key role in providing energy for the body's metabolism.\n\nSkin health: Vitamin B3 has a positive impact on skin health. It helps improve skin texture, reduce the appearance of wrinkles, decrease pigmentation, and enhance overall skin condition. Vitamin B3 can also help moisturize dry skin and reduce inflammation.\n\nCardiovascular health: Vitamin B3 can help lower cholesterol levels and improve the overall lipid profile. It may contribute to reducing 'bad' cholesterol (LDL) levels and increasing 'good' cholesterol (HDL) levels, thus reducing the risk of cardiovascular diseases.\n\nNervous system support: Vitamin B3 plays an important role in supporting normal nervous system function. It helps maintain the health of nerve cells and may reduce the risk of nerve disorders such as dementia and Alzheimer's disease.\n\nCons of Vitamin B3:\n\nUncontrolled high doses of vitamin B3 can cause side effects such as tingling, and skin flushing.\n\nProducts rich in Vitamin B3:\n\nMeat: Beef, pork, chicken, and turkey are high in vitamin B3. They are excellent sources of this nutrient. Ensure that your diet includes various types of meat to obtain an adequate amount of vitamin B3.\n\nFish and seafood: Tuna, salmon, sardines, and shrimp are good sources of vitamin B3. Additionally, they are rich in omega-3 fatty acids, which have beneficial effects on heart and brain health.\n\nNuts and seeds: Peanuts, almonds, pistachios, sunflower seeds, and flaxseeds contain vitamin B3. They can be excellent snacks or additions to salads and other dishes.\n\nGrains and cereals: Rice, wheat, barley, and oats contain some amount of vitamin B3. Including these grains and cereals in your diet can help ensure an intake of vitamin B3.\n\nDairy products: Milk, yogurt, and cheese contain a small amount of vitamin B3. They are also sources of protein and calcium, making them beneficial for overall health.\n\nFruits and vegetables: Avocado, spinach, mushrooms, and peas contain some amount of vitamin B3. While they are not the primary sources, including them in your diet can be beneficial for overall nutrition.\n\nWhen planning your diet, it is recommended to include a variety of vitamin B3-rich products to ensure an adequate intake of this nutrient in the body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
92	Vitamin B5	Vitamin B5, also known as pantothenic acid, is an important nutrient required for maintaining overall health. In this article, we will discuss the pros and cons of vitamin B5.\n\nIntroduction:\nVitamin B5 plays a crucial role in metabolism, energy production, and maintaining the normal function of organs and systems in the body. It is an essential component of many enzymes involved in chemical reactions within the body.\n\nPros of Vitamin B5:\n\nMetabolism: Vitamin B5 is a key factor in the body's metabolism. It helps break down carbohydrates, fats, and proteins into simpler forms that the body can use for energy. Vitamin B5 also participates in the synthesis of fats, cholesterol, and hormones.\n\nSkin Health: Vitamin B5 has a positive impact on skin health. It promotes improved skin hydration, stimulates wound healing, and enhances skin elasticity. Vitamin B5 can also help reduce inflammation and irritation of the skin, especially in individuals with skin issues like acne.\n\nStress Reduction: Vitamin B5 plays a role in the synthesis of stress hormones, such as cortisol. It can help reduce stress levels and improve psychological well-being. Vitamin B5 also supports a healthy nervous system, contributing to improved mood and reduced anxiety levels.\n\nImmune System Support: Vitamin B5 plays a crucial role in maintaining normal immune system function. It helps stimulate the production of antibodies that protect the body against infections and diseases. Vitamin B5 can also aid in speedy wound healing.\n\nCons of Vitamin B5:\n\nHigh Dosage Requirement: Vitamin B5 requires relatively high doses to meet the body's daily needs. This can sometimes pose a challenge in obtaining sufficient amounts solely from dietary sources.\n\nHere is a list of some foods that are good sources of vitamin B5:\n\nMeat: Beef, chicken, and turkey are excellent sources of vitamin B5. Include lean cuts of meat in your diet to ensure an adequate intake of this nutrient.\n\nFish: Salmon, tuna, and trout are not only rich in omega-3 fatty acids but also contain significant amounts of vitamin B5. Adding fish to your diet can increase your vitamin B5 intake.\n\nDairy Products: Milk, yogurt, and cheese contain vitamin B5. They are also good sources of calcium and protein, making them beneficial for overall health.\n\nEggs: Eggs are a nutritious food that contains several essential nutrients, including vitamin B5. They can be included in various dishes or consumed separately.\n\nLegumes: Lentils, chickpeas, and black beans are examples of legumes that contain vitamin B5. These versatile foods can be a great addition to salads, soups, or side dishes.\n\nWhole Grains: Brown rice, quinoa, and whole grain products contain vitamin B5. Opt for whole grain products over refined flour products to maximize nutritional benefits.\n\nNuts and Seeds: Sunflower seeds, peanuts, and almonds are good sources of vitamin B5. They can serve as convenient and nutritious snacks.\n\nAvocado: Avocado is a fruit that contains various vitamins and minerals, including vitamin B5. It can be added to salads, sandwiches, or used as a creamy addition to dishes.\n\nMushrooms: Mushrooms such as shiitake and portobello contain vitamin B5. They can be used in various dishes, including stir-fries, soups, and omelets.\n\nRemember to incorporate a diverse range of these foods into your diet to ensure an adequate intake of vitamin B5.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
93	Vitamin B6	Vitamin B6, also known as pyridoxine, is an important nutrient necessary for the normal functioning of the body. In this article, we will discuss the pros and cons of vitamin B6.\n\nIntroduction:\nVitamin B6 plays a key role in various physiological processes in the body. It is an essential cofactor for many enzymes involved in metabolism, hormone and neurotransmitter synthesis, immune system function, and red blood cell formation.\n\nPros of Vitamin B6:\n\nMetabolism: Vitamin B6 plays a crucial role in the metabolism of amino acids, carbohydrates, and fatty acids. It helps break down food and convert it into energy. Vitamin B6 also participates in the formation of new molecules in the body and metabolic processes.\n\nNervous system: Vitamin B6 is necessary for the normal functioning of the nervous system. It assists in the synthesis of neurotransmitters such as serotonin, gamma-aminobutyric acid (GABA), and dopamine, which play a vital role in nerve impulse transmission and mood regulation. Vitamin B6 also contributes to maintaining healthy memory and cognitive functions.\n\nImmune system: Vitamin B6 plays a role in maintaining normal immune system function. It is involved in antibody production, which helps protect the body against infections. Vitamin B6 also contributes to the activation and functioning of immune cells.\n\nHeart health: Vitamin B6 may contribute to heart and vascular health. It helps control the level of homocysteine, an amino acid associated with an increased risk of cardiovascular diseases. Vitamin B6 also participates in the formation of red blood cells, which carry oxygen to the heart and other organs.\n\nMajor food sources of vitamin B6 include:\n\nMeat: Chicken, beef, and pork are good sources of vitamin B6. Ensure that you include lean cuts of meat in your diet to obtain an adequate amount of this vitamin.\n\nFish: Salmon, tuna, sardines, and cod contain high amounts of vitamin B6. Including fish in your diet can help provide the necessary level of this nutrient.\n\nNuts and seeds: Walnuts, peanuts, pistachios, and sunflower seeds contain vitamin B6. They serve as delicious and nutritious snacks that can be added to your diet.\n\nFruits: Bananas and avocados contain a small amount of vitamin B6. They are also rich in other beneficial nutrients such as potassium and vitamin C.\n\nGreen vegetables: Spinach, broccoli, and potatoes contain vitamin B6. Consuming these vegetables will help enrich your diet with this vitamin.\n\nGrains: Wheat, rice, oats, and corn contain vitamin B6. Opting for whole grain products over refined ones will provide more nutrients, including vitamin B6.\n\nDairy products: Milk, yogurt, and cheeses also contain a small amount of vitamin B6. They are a source of calcium and protein, making them beneficial for overall health.\n\nEggs: Eggs contain vitamin B6 in small amounts. They are also rich in other essential nutrients such as protein and iron.\n\nMake sure to include a variety of products from these groups in your diet to obtain an adequate amount of vitamin B6.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
94	Vitamin B7	Vitamin B7, also known as biotin or vitamin H, is an essential nutrient necessary for the health and proper functioning of the body. In this article, we will explore the pros and cons of vitamin B7.\n\nIntroduction:\nVitamin B7 plays a crucial role in metabolism and gene regulation. It is an indispensable factor for many enzymes involved in the processing of carbohydrates, fats, and proteins, as well as glucose synthesis. Vitamin B7 also impacts the health of the skin, hair, and nails.\n\nPros of Vitamin B7:\n\nSkin, Hair, and Nail Health: Vitamin B7 plays a vital role in maintaining the health of the skin, hair, and nails. It contributes to the regulation of keratin production, the main component of hair and nails, helping to maintain their health and beauty. Vitamin B7 can also improve skin condition, reduce dryness, and alleviate irritation.\n\nMetabolism Support: Vitamin B7 plays a significant role in metabolism by aiding in the breakdown of food and converting it into energy. It participates in glucose synthesis, which is the primary source of energy for the body. Vitamin B7 also helps regulate blood sugar levels.\n\nNervous System Health: Vitamin B7 is involved in the normal functioning of the nervous system. It participates in the synthesis of neurotransmitters, which transmit nerve impulses between cells. Vitamin B7 may also help reduce stress levels and maintain a healthy mood.\n\nGrowth and Development: Vitamin B7 is essential for growth and development. It participates in the synthesis of DNA and RNA, the fundamental molecules necessary for transmitting genetic information and cell replication. Vitamin B7 can also contribute to maintaining the health of the fetus during pregnancy.\n\nCons of Vitamin B7:\n\nSkin Issues: A deficiency of vitamin B7 can lead to dryness, redness, and irritation of the skin. It may cause rashes, itching, and weak or brittle nails. Hair damage and thinning can also occur.\n\nDigestive Problems: Vitamin B7 deficiency can result in digestive system issues such as increased food sensitivity, gastroenteritis, and appetite disturbances.\n\nFatigue and Weakness: Insufficient levels of vitamin B7 can impact overall well-being, leading to fatigue, weakness, and decreased energy levels.\n\nMental Health Problems: In some cases, a deficiency of vitamin B7 may be associated with mental symptoms such as depression, irritability, and sleep problems.\n\nKey Sources of Vitamin B7:\n\nEgg Yolks: Egg yolks are one of the richest sources of biotin. They also contain various other beneficial nutrients.\n\nOrgan Meat: Liver, particularly beef and pork liver, contains a significant amount of vitamin B7.\n\nNuts and Seeds: Almonds, hazelnuts, walnuts, and sunflower seeds are good sources of vitamin B7.\n\nFish and Seafood: Salmon, sardines, oysters, and other seafood varieties contain vitamin B7 along with other valuable nutrients.\n\nGreens: Spinach, parsley, broccoli, and other greens contain vitamin B7. It is recommended to consume them raw or minimally processed to preserve their nutrients.\n\nDairy Products: Milk, yogurt, cheese, and other dairy products contain a small amount of vitamin B7. They are also a source of calcium and other essential nutrients.\n\nGrains and Cereals: Wheat, oats, rice, and other grains contain some amount of vitamin B7. Opting for whole-grain products can help enrich your diet with this nutrient.\n\nFruits: Certain fruits, such as bananas, raspberries, and blueberries, contain a small amount of vitamin B7. They are also a source of vitamins, minerals, and antioxidants.\n\nIn conclusion, vitamin B7 is an important nutrient for the health and proper functioning of the body. It plays a role in maintaining the health of the skin, hair, and nails, supports metabolism, contributes to the functioning of the nervous system, and aids in growth and development. It is important to consume a varied diet to ensure an adequate intake of vitamin B7. If you have any doubts or questions, consult a doctor or a dietitian for personalized recommendations regarding vitamin B7 consumption.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
95	Vitamin B9	Vitamin B9, also known as folic acid or folate, is an important nutrient necessary for the normal functioning of the body. In this article, we will discuss the pros and cons of vitamin B9.\n\nIntroduction:\nVitamin B9 plays a key role in various processes in the body, including DNA synthesis, cell division, and blood formation. It is also crucial for the normal development of the fetus during pregnancy. Vitamin B9 can be obtained from food sources or in the form of supplements.\n\nPros of Vitamin B9:\n\nHeart Health: Vitamin B9 plays a role in reducing the level of homocysteine in the blood, which is a risk factor for cardiovascular diseases. Adequate folate levels help maintain heart health and reduce the risk of heart problems.\n\nFetal Development: Vitamin B9 is essential for the normal development of the fetus during pregnancy. Sufficient intake of folate helps prevent the occurrence of neural tube defects such as spina bifida and anencephaly in the fetus. It can also contribute to the development of a healthy placenta and normal gestational duration.\n\nBlood Formation: Vitamin B9 is necessary for the formation of red blood cells and their proper function. It is involved in the synthesis of hemoglobin, which carries oxygen throughout the body, and helps prevent anemia.\n\nBrain Health: Folic acid plays a crucial role in brain and nervous system health. It participates in the formation of neurotransmitters, which transmit signals between nerve cells. Adequate intake of vitamin B9 is associated with maintaining cognitive functions, improving mood, and reducing the risk of certain neurological disorders.\n\nCons of Vitamin B9:\n\nDeficiency of vitamin B9 can lead to various health problems. Some of them include:\n\nAnemia: Vitamin B9 deficiency can lead to megaloblastic anemia, which is characterized by a decrease in the number of red blood cells and impaired their normal functioning. This can cause symptoms such as weakness, fatigue, pale skin, and shortness of breath.\n\nFetal Problems: Vitamin B9 deficiency in pregnant women can affect fetal development and increase the risk of neural tube defects, such as spina bifida and anencephaly. It can also be associated with premature birth and low birth weight.\n\nDigestive Issues: A deficiency of vitamin B9 can cause digestive problems such as loss of appetite, nausea, diarrhea, or constipation. It can also lead to ulcers and inflammation of peptic ulcer disease.\n\nIncreased Risk of Cardiovascular Diseases: Vitamin B9 deficiency can lead to an increased level of homocysteine in the blood, which may be associated with an increased risk of cardiovascular diseases such as atherosclerosis and stroke.\n\nPrimary Sources of Vitamin B9:\n\nGreen Leafy Vegetables: Leafy green vegetables such as spinach, cabbage, broccoli, and arugula are good sources of vitamin B9.\n\nFruits: Citrus fruits, bananas, watermelons, and avocados contain vitamin B9.\n\nWhole Grains: Whole grain products such as oats, barley, and brown rice contain folic acid.\n\nAnimal Products: Liver, kidneys, and eggs are sources of vitamin B9.\n\nLegumes: Lentils, chickpeas, beans, and other legumes are excellent sources of vitamin B9.\n\nMeat: Animal organs such as liver and kidneys contain a significant amount of vitamin B9. Vitamin B9 can also be found in meats such as beef, pork, and poultry.\n\nDairy Products: Some dairy products such as milk and yogurt contain a small amount of vitamin B9.\n\nSupplements: Vitamin B9 is also available in the form of supplements, which can be purchased at pharmacies or health food stores. Supplements can be beneficial in case of vitamin B9 deficiency or additional requirements. It is always recommended to consult with a doctor or a dietitian to determine individual vitamin B9 needs before starting supplementation.\n\nConclusion:\nVitamin B9 plays a crucial role in maintaining heart health, fetal development, blood formation, brain function, and the nervous system. However, vitamin B9 deficiency can lead to anemia, digestive problems, and an increased risk of cardiovascular diseases. It is important to consume foods rich in vitamin B9 such as green leafy vegetables, fruits, whole grains, legumes, meat, and dairy products, or consider supplementation if necessary. Before starting any supplementation, it is always recommended to consult with a doctor or a dietitian to determine individual vitamin B9 needs.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
96	Vitamin B12	Introduction:\nVitamin B12, also known as cobalamin, is an important nutrient necessary for the normal functioning of the body. In this article, we will look at the pros and cons of vitamin B12.\n\nBenefits of Vitamin B12:\n\nEnergy and general well-being: Vitamin B12 plays a key role in converting food into energy. It helps to maintain a healthy level of energy and vigor. Vitamin B12 deficiency can lead to mood deterioration, fatigue and apathy.\n\nNervous System Health: Vitamin B12 is essential for the normal functioning of the nervous system. It helps maintain the health of nerve cells and myelin, a substance that protects nerve fibers. Adequate intake of vitamin B12 is associated with improved concentration, memory and overall brain function.\n\nRed Blood cell Formation: Vitamin B12 plays an important role in the formation of mature red blood cells. It helps in the process of DNA synthesis, which is necessary for the proper development of blood cells. Vitamin B12 deficiency can lead to the development of megaloblastic anemia, in which the blood is unable to deliver sufficient oxygen to organs and tissues.\n\nHeart Health: Vitamin B12 plays a role in the metabolism of homocysteine, a substance associated with an increased risk of cardiovascular disease. Adequate intake of vitamin B12 helps reduce homocysteine levels and reduces the risk of heart problems such as atherosclerosis and stroke.\n\nVitamin B12 Deficiencies:\n\nNervous system disorders: Vitamin B12 deficiency can lead to various disorders of the nervous system. Among them may be depression, memory loss, problems with coordination of movements, numbness and tingling in the extremities.\n\nAnemia: Vitamin B12 deficiency can lead to megaloblastic anemia, which is characterized by an increase in the size of red blood cells and their insufficient number. This can lead to symptoms such as weakness, pale skin, fatigue and shortness of breath.\n\nDigestive problems: Some people may have problems with digestion and absorption of vitamin B12. This may be caused by a violation of the processes associated with the production of an intrinsic factor - a substance necessary for the absorption of vitamin B12 in the intestine. As a result, symptoms such as diarrhea, constipation, nausea and loss of appetite occur.\n\nRisk of neurological diseases: Prolonged vitamin B12 deficiency may increase the risk of neurological problems such as dementia and neuropathy. This is due to the fact that vitamin B12 plays an important role in the health of the nervous system and its deficiency can affect the normal functioning of nerve cells.\n\nThe main sources of vitamin B12:\n\nAnimal products: Meat, fish, dairy products and eggs are good sources of vitamin B12. They contain naturally occurring vitamin B12, which is easily absorbed by the body.\n\nSupplements and Fortified Foods: Vitamin B12 is also available in the form of supplements and fortified foods such as breakfast cereals, soy milk, and nutritional supplements. This may be useful for people who follow plant-based or vegetarian diets where vitamin B12 sources are limited.\n\nConclusion:\nVitamin B12 plays an important role in energy metabolism, nervous system health, red blood cell formation, and heart health. Vitamin B12 deficiency can lead to various health problems, including nervous system disorders, anemia, digestive problems and an increased risk of neurological diseases. However, despite these disadvantages, vitamin B12 has several advantages:\n\nImportance for vegetarians and Vegans: Vitamin B12 is especially important for people following plant-based or vegetarian diets, since its main sources are in animal products. For such people, vitamin B12 supplements or the consumption of fortified foods can provide the necessary intake of this vitamin.\n\nCardiovascular Protection: Vitamin B12 helps reduce homocysteine levels, which can reduce the risk of cardiovascular disease. This is especially important for people with an increased risk of developing cardiovascular problems.\n\nImproved Mood and Mental Health: Vitamin B12 deficiency may be associated with depression, mood deterioration and mental health problems. Adequate intake of vitamin B12 can help maintain mental health and improve mood.\n\nEnergy and Vitality Support: Vitamin B12 plays a key role in converting food into energy, and its adequate intake can help in maintaining high levels of energy and vigor.\n\nConclusion:\nVitamin B12 plays an important role in the body, supporting the health of the nervous system, heart, blood and energy metabolism. Vitamin B12 deficiency can have serious health consequences, so it is important to ensure adequate intake through food or supplements. People following plant-based diets are advised to pay special attention to the absorption of vitamin B12 and consult a doctor or nutritionist for advice on the consumption of this vitamin.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
97	Vitamin C	Introduction:\nVitamin C, also known as ascorbic acid, is an important nutrient necessary to maintain the health of the body. In this article, we will look at the pros and cons of vitamin C.\n\nBenefits of Vitamin C:\n\nAntioxidant Protection: Vitamin C is a powerful antioxidant that helps protect the body from the harmful effects of free radicals. Free radicals can cause damage to cells and tissues, the antioxidant properties of vitamin C help prevent this process and reduce the risk of developing various diseases, including cardiovascular diseases and cancer.\n\nImmune System Support: Vitamin C plays an important role in supporting the immune system. It promotes the production of white blood cells that fight infections and helps strengthen the body's natural defenses. Regular intake of vitamin C can reduce the risk of colds, flu and other infections.\n\nSkin Health: Vitamin C plays an important role in the production of collagen, which is the main component of the skin. Collagen helps maintain firmness and elasticity of the skin, as well as promotes wound healing and tissue regeneration. Regular intake of vitamin C can help improve the overall condition of the skin and reduce the appearance of wrinkles and pigmentation.\n\nIron Absorption: Vitamin C improves the absorption of iron from plant and animal food sources. This is especially useful for people suffering from iron deficiency anemia or those who follow a plant-based diet, where iron absorption may be less effective. Vitamin C helps to increase the level of iron in the body and prevents the development of anemia.\n\nVitamin C Deficiencies:\n\nUndesirable Side effects: In general, vitamin C is considered safe to consume in moderation. However, when consuming very large doses of vitamin C (usually above the recommended daily value), some undesirable side effects may occur. Some of them include diarrhea, nausea, heartburn and stomach pains. People who are prone to kidney stones or urolithiasis may also have an increased risk of stone formation when consuming large doses of vitamin C. Therefore, it is important to follow the recommended dosages of vitamin C.\n\nConclusion:\nVitamin C has many health benefits, including its antioxidant properties, immune system support, skin improvement, and iron absorption assistance. Regular intake of adequate amounts of vitamin C can contribute to the overall well-being of the body. However, excessive vitamin C intake should be avoided to prevent possible undesirable side effects. In general, vitamin C is an important nutrient that can be obtained from a variety of food sources, including fruits, vegetables and supplemental medications.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
98	Vitamin D	Introduction:\n\nVitamin D is an important nutrient necessary for human health. It plays a key role in ensuring the normal functioning of bones, the immune system and other processes in the body. In this article, we will look at the advantages and disadvantages of vitamin D.\n\nBenefits of Vitamin D:\n\nBone Health: Vitamin D helps the absorption of calcium and phosphorus, which are necessary for the formation and maintenance of healthy bones. It promotes the growth and development of bone tissue, and also helps prevent osteoporosis and other bone diseases. Adequate intake of vitamin D is associated with strengthening bones and reducing the risk of fractures.\n\nStrengthening the Immune System: Vitamin D plays an important role in maintaining a healthy immune system. It helps to activate and enhance the function of immune cells, which contributes to the body's fight against infections and other external threats. Sufficient vitamin D levels are associated with a reduced risk of infections and autoimmune diseases.\n\nMood improvement: Some studies have linked vitamin D deficiency to mood deterioration and an increased risk of depression. Vitamin D can affect the production of serotonin, a hormone that regulates mood. Maintaining adequate levels of vitamin D can help maintain mental health and improve mood.\n\nProtection against chronic diseases: Some studies show that adequate vitamin D levels are associated with a reduced risk of developing chronic diseases such as cardiovascular diseases, diabetes, cancer and some neurological disorders. Vitamin D may have anti-inflammatory and antioxidant properties that contribute to maintaining the health of the body as a whole.\n\nVitamin D Deficiencies:\n\nCalcium deficiency and Osteoporosis: Vitamin D deficiency can lead to inadequate absorption of calcium and phosphorus, which can lead to osteoporosis and weakening of bones. This is especially important in elderly people who have a higher risk of developing osteoporosis.\n\nDeterioration of immune function: Vitamin D deficiency can reduce the effectiveness of the immune system and increase the risk of infections. Insufficient vitamin D levels can weaken the body's ability to fight bacterial and viral infections.\n\nRisk of developing chronic diseases: Some studies have linked vitamin D deficiency with an increased risk of developing chronic diseases such as cardiovascular diseases, diabetes, cancer and some autoimmune diseases. Vitamin D deficiency can affect inflammatory processes in the body and reduce its protective capabilities.\n\nIncreased risk of deficiency: Vitamin D can be difficult to obtain in sufficient quantities from food, especially in people who have limited vitamin D-rich food sources, or those who have limited solar radiation, which promotes vitamin D synthesis in the skin. This can lead to an increased risk of vitamin D deficiency in the body.\n\nConclusion:\n\nVitamin D plays an important role in bone health, the immune system and the overall well-being of the body. It has benefits including strengthening bones, supporting immune function, improving mood and protecting against chronic diseases. However, a lack of vitamin D can lead to problems such as osteoporosis, deterioration of immune function and an increased risk of developing chronic diseases. It is recommended to provide adequate levels of vitamin D through nutrition and/or additional sources, if necessary. Recommendations for the dosage of vitamin D sources may vary depending on age, gender, physical activity and other factors. It is important to consult a doctor or nutritionist to determine individual needs and recommendations for taking vitamin D.\n\nOverall, vitamin D is an important nutrient with many health benefits. However, as with any other nutrient, it is important to monitor its level and consume in sufficient quantities to avoid deficiency or excess. If necessary, consult with a medical professional to determine the optimal strategy for vitamin D intake and maintaining a healthy lifestyle.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
99	Vitamin E	Introduction:\n\nVitamin E is one of the important fat-soluble antioxidants that play a role in protecting the body from free radical damage. In this article, we will look at the advantages and disadvantages of vitamin E.\n\nBenefits of Vitamin E:\n\nAntioxidant Protection: Vitamin E is able to protect the body's cells from damage caused by free radicals. Free radicals can lead to oxidative stress and inflammation, which may be associated with the development of various diseases, such as cardiovascular diseases and cancer. Vitamin E helps to reduce the level of oxidative stress and supports cell health.\n\nProtection against cardiovascular diseases: Vitamin E can have a positive effect on the cardiovascular system. It helps to improve blood circulation, regulate blood pressure and reduce cholesterol levels. This can help reduce the risk of developing heart diseases such as atherosclerosis and heart attack.\n\nStrengthening the immune System: Vitamin E plays an important role in supporting the immune system. It helps to strengthen the barrier functions of the skin and mucous membranes, which helps to prevent the penetration of pathogens. In addition, vitamin E can stimulate the activity of immune cells, increasing their effectiveness in fighting infections.\n\nSlowing down the aging process: Vitamin E can have an anti-aging effect due to its antioxidant activity. It helps protect cells from aging-related damage and can help slow down the process of wrinkle formation and improve the overall condition of the skin.\n\nVitamin E Deficiencies:\n\nThe possibility of excess: High doses of vitamin E can cause undesirable effects, especially with prolonged and excessive consumption. Excess vitamin E can lead to bleeding, increased bleeding symptoms and worsening of blood clotting. Therefore, it is important to follow the recommended doses and consult a doctor before increasing vitamin E intake.\n\nInteraction with medications: Vitamin E may interact with certain medications, such as anticoagulants (blood thinners) and drugs that lower blood pressure. This can lead to an increase or decrease in the effect of these drugs, so it is necessary to discuss vitamin E intake with a doctor, especially when taking medications.\n\nRisk of allergic reactions: Some people may have an allergic reaction to vitamin E, manifested as a skin rash, itching or redness of the skin. If you are allergic to other antioxidants, you should be especially careful when using vitamin E.\n\nLimited food sources: Vitamin E in its natural form is found in a limited number of food products. The main sources of vitamin E are vegetable oils, nuts, seeds and green vegetables. This can create difficulties for people who do not consume these products in sufficient quantities or have limited access to them.\n\nConclusion:\n\nVitamin E has a number of benefits, such as antioxidant protection, support of the cardiovascular system, strengthening of the immune system and slowing down the aging process. However, one should be attentive to possible disadvantages, including the possibility of excess, interaction with medications, the risk of allergic reactions and limited food sources. It is recommended to follow the recommended doses and consult a doctor before taking additional vitamin E products. This is especially important for people with certain health conditions or taking medications to avoid unwanted interactions or side effects.\n\nIn general, vitamin E can be a useful supplement to maintain health and prevent oxidative stress. However, it is important to remember that it is not a miracle medicine and does not replace a balanced diet and a healthy lifestyle. Regular consumption of foods rich in natural sources of vitamin E may be the preferred way to obtain this vitamin.\n\nAlways consult with a qualified doctor or nutritionist to get personalized recommendations on the intake of vitamin E and other nutrients, taking into account your health condition and individual needs.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
100	Vitamin K	Introduction:\n\nVitamin K is a fat-soluble vitamin that plays an important role in blood clotting and bone health. In this article, we will look at the pros and cons of vitamin K.\n\nBenefits of Vitamin K:\n\nBlood clotting: Vitamin K plays a key role in the blood clotting process. It helps activate blood clotting factors, which allows the body to quickly stop bleeding when blood vessels are damaged. Vitamin K deficiency can lead to blood clotting disorders and an increased risk of bleeding.\n\nBone Health: Vitamin K plays an important role in the formation and maintenance of bone health. It helps activate a protein known as osteocalcin, which is essential for the strength and health of bone tissue. Adequate intake of vitamin K is associated with a reduced risk of osteoporosis and bone fractures.\n\nHeart Health: Some studies show that vitamin K can have a positive effect on heart health. It contributes to the normalization of calcium metabolism in the body, which can help prevent the deposition of calcium on the walls of the arteries and reduce the risk of atherosclerosis and cardiovascular diseases.\n\nVitamin K Deficiencies:\n\nRisk for certain groups of people: Vitamin K may be contraindicated for some groups of people. For example, people taking anticoagulants (drugs that thin the blood) may need to limit their intake of vitamin K, as it may affect the effectiveness of the drug. Also, people suffering from certain disorders of the liver or biliary tract may need to be careful in the intake of vitamin K.\n\nLimited natural sources: Vitamin K, especially its active form K2, is found in limited quantities in some foods. For example, vitamin K2 can be found in fermented foods such as natural cheese, certain types of fermented dairy products and natural sauerkraut vegetable puree. This means that people who don't consume these foods or follow a restricted diet may find it harder to get enough vitamin K.\n\nInteraction with medications: Vitamin K may interact with certain medications, especially anticoagulants (blood thinners), which may lead to a violation of their effectiveness or increase the risk of bleeding. Therefore, it is important to discuss vitamin K intake with your doctor or pharmacist, especially if you are taking any medications.\n\nConclusion:\n\nVitamin K plays an important role in blood clotting, bone health and heart health. However, it also has some drawbacks, including potential risk to certain groups of people and limited natural sources. If you are interested in adding vitamin K to your diet or taking additional medications, it is recommended to discuss this with a medical specialist in order to take into account the individual characteristics and needs of your body.	2	1	\N	0	0	2023-05-29 03:17:44.877411	2023-05-29 03:17:44.877411
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, outer_id, name, company_id, brand_id) FROM stdin;
1	RU22485	Vitamin D3	1	4
2	RU4135	Co Q10 – 100 mg	1	4
3	RU3171	Lymphatic Drainage	1	4
4	RU6274	Colloidal Silver Forte	1	4
5	RU3044	Fizz Active	1	4
6	RU70	Bee Pollen	1	4
7	RU6502	Solstic Slim	1	4
8	RU22751	Astragalus	1	4
9	RU6507	Solstic Revive	1	4
10	RU1622	Herbasaurs Chewable Vitamins Plus Iron	1	4
11	RU3302	Bifidophilus Chewable for Kids «Bifidosaurs»	1	4
12	RU4104	Zаmbroza	1	4
13	RU746	Wild Yam	1	4
14	RU1650	Vitamin E	1	4
15	RU1635	Vitamin C	1	4
16	RU292	HP Garlic	1	4
17	RU935	HSN-W (Hair, Skin, Nails)	1	4
18	RU3088	5-HTP-Power	1	4
19	RU940	HVP	1	4
20	RU1506	Indole-3-Carbinol	1	4
21	RU1784	Iron Chelate	1	4
22	RU410	Kelp	1	4
23	RU1661	Lecithin	1	4
24	RU4015	Liv-Guard	1	4
25	RU1346	Loclo	1	4
26	RU1859	Magnesium Complex	1	4
27	RU4112	Milk Thistle	1	4
28	RU3134	Mind-Max	1	4
29	RU22752	Mоrinda	1	4
30	RU4059	MSM	1	4
31	RU984	Nature Lax	1	4
32	RU4066	Nature's Noni Juice	1	4
33	RU3213	Nutri Burn	1	4
34	RU204	Olive leaf	1	4
35	RU1609	Omega 3 EPA	1	4
36	RU1806	Osteo Plus	1	4
37	RU1118	Achieve with Yohimbe	1	4
38	RU1197	AG-X	1	4
39	RU30	Alfalfa	1	4
40	RU4186	Aloe Vera Juice	1	4
41	RU1825	Antioxidant	1	4
42	RU4100	Bifidophilus Flora Force	1	4
43	RU90	Black Walnut	1	4
44	RU514	Pau D'Arco	1	4
45	RU1548	Bon-C	1	4
46	RU515	Paw Paw Cell Reg	1	4
47	RU3664	Peptovit with Magnesium & L-Carnitine	1	4
48	RU60038	Perfect Eyes	1	4
49	RU60021	Pro Formula	1	4
50	RU1841	Protease Plus	1	4
51	RU1295	Boswellia Plus	1	4
52	RU550	Red Сlover	1	4
53	RU630	Saw Palmetto	1	4
54	RU1602	Shark Rei Formula	1	4
55	RU22892	Smart Meal Vanilla Shake	1	4
56	RU6500	Solstic Energy	1	4
57	RU1386	Stevia	1	4
58	RU1881	BP-C	1	4
59	RU1820	Stomach Comfort	1	4
60	RU4052	Super Complex	1	4
61	RU1122	Breast Assured	1	4
62	RU4300	TNT - Total Nutrition Today	1	4
63	RU175	Una de Gato	1	4
64	RU1150	Uro Lax	1	4
65	RU775	Breath Ease	1	4
66	RU1596	Zinc Lozenges	1	4
67	RU1860	Bupleurum Plus	1	4
68	RU140	Burdock	1	4
69	RU3243	Calcium Magnesium Chelate	1	4
70	RU832	Capsicum & Garlic with Parsley	1	4
71	RU1808	Caprylic Combination	1	4
72	RU170	Cascara Sagrada	1	4
73	RU2954	Carbo Grabbers	1	4
74	RU896	CC-A	1	4
75	RU1580	Liquid Chlorophyll	1	4
76	RU1811	Chondroitin	1	4
77	RU1894	Chromium Chelate	1	4
78	RU312	Colloidal Minerals with Acai Juice	1	4
79	RU1587	Colostrum	1	4
80	RU1873	Coral Calcium	1	4
81	RU1240	Cordyceps	1	4
82	RU1204	C-X	1	4
83	RU6154	Defense Maintenance	1	4
84	RU850	Eight	1	4
85	RU1360	E-tea	1	4
86	RU2937	Fat grabbers	1	4
87	RU882	FC with Dong Quai	1	4
88	RU1836	Food Enzymes	1	4
89	RU906	Garcinia Combination	1	4
90	RU907	Ginkgo Gotu Kola	1	4
91	RU903	Glucosamine	1	4
92	RU360	Gotu Kola	1	4
93	RU1750	Grapine with Protectors	1	4
94	RU930	Hawthorn Plus	1	4
95	RU776	Hista Block	1	4
96	RU917	HP Fighter	1	4
97	RU999	Vari-Gone	1	4
98	RU23065	L-carnitine	1	4
99	RU4950	Silver shield	1	9
100	RU3538	Tei-Fu	1	9
101	RU3877	Tea Tree Oil	1	9
102	RU2851	Sunshine Brite with green tea leaf extract	1	9
103	RU6036	Lip Balm SPF15 “Natural Care”	1	9
104	RU21600	Purifying and Mattifying Toner	1	2
105	RU21601	Day Anti-age Face Cream SPF 15 40+	1	2
106	RU21602	Night Anti-age Face Cream 40+	1	2
107	RU21603	Anti-age Eye Contour Cream SPF 15	1	2
108	RU21604	Moisturizing Face Cream. Intensive Hydration 48 Hours. SPF 15	1	2
109	RU21605	Revitalizing Eye Contour Cream SPF 15	1	2
110	RU21606	Radiance Face Mask Cinderella Effect	1	2
111	RU21610	Energy Shampoo (orange)	1	2
112	RU21611	Energy Conditioner (orange)	1	2
113	RU21612	Makeover Shampoo (yellow)	1	2
114	RU21613	Makeover Conditioner (yellow)	1	2
115	RU21614	Magnolia Charm Shower Gel	1	2
116	RU21615	Magnolia Charm Body Lotion	1	2
117	RU21616	Wow-Serum with Chestnut Extract. Anti-age and Lifting	1	2
118	RU21617	Cleansing Micellar Gel Blooming Skin	1	2
119	RU21618	Hair Body Baby Wash «Oh, my Baby!»	1	2
120	RU21619	Age Control Day Cream	1	2
121	RU21620	Age Control Serum	1	2
122	RU61563	Light Apricot Cleanser Apri-Cleanse	1	3
123	RU61555	Conditioning Сream with Сocoa Butter	1	3
124	RU61564	Relaxing TT Oil	1	3
125	RU61566	Sea Salt Roll-On Antiperspirant/Deodorant	1	3
126	RU61565	Witch-Vera Gel	1	3
127	RU61567	Cool Comfort Aftershave Gel	1	3
128	RU61560	Almond-Apricot Anti Stress Moisturizing Lotion	1	3
129	RU21514	Lip Gloss Crystal Gel Volume & Shimmering	1	1
130	RU21515	Lip Gloss Crystal Gel Volume & Shimmering	1	1
131	RU61800	Powder Luxury Brow Pencil 1	1	1
132	RU61801	Powder Luxury Brow Pencil 2	1	1
133	RU62203	Compact Powder Biscuit	1	1
134	RU62105	Blush Bronzers Hazelnut	1	1
135	RU61854	Lip Pencil Magic Stick	1	1
136	d001	Booklet Vitamin D3	1	6
137	d002	Brochure Black Walnut	1	6
138	d003	Unique Benefits of Nature's Sunshine Products	1	6
139	d004	Wellness technologies from the company NSP	1	6
140	d005	The secret of health and harmony Anna Kotelnikova, Andrey Yashkov	1	6
141	d006	Booklets describing wellness programs	1	6
142	d007	Booklet "Wow-serum"	1	6
143	d008	Booklets describing dietary supplements NSP	1	6
144	d009	Brochure "Recommended schemes for the purpose of NSP products"	1	6
145	d010	Catalog of dietary supplements and cosmetics	1	6
146	d011	Collection of articles "Healthy nutrition for healthy longevity"	1	6
147	d012	Analytical test for the selection of biologically active additives	1	6
148	d013	Brochure "Your 85% success rate"	1	6
149	d014	Brochure "Super complexes for every day"	1	6
150	d015	Booklet "Ecology of your body"	1	6
151	d016	The book "Human Biorhythms and prevention of seasonal diseases"	1	6
152	d017	Brochure "Chinese Cordyceps, or Mushroom for Emperors"	1	6
153	d018	MSM: sulfur is our companion on the way to health	1	6
154	d019	Methodological recommendations for doctors issue 10	1	6
155	d020	Methodological recommendations for doctors issue 9 "Application of dietary supplements in dentistry"	1	6
156	d021	Methodological recommendations for doctors issue 8 "Reprod.men's health. Prostate diseases"	1	6
157	d022	Methodical recommendations for doctors issue 7 "Complex treatment and rehabilitation. Patients with skin diseases"	1	6
158	d023	Methodical recommendations for doctors issue 7 "Complex treatment and rehabilitation. Patients with skin diseases"	1	6
159	d024	Methodical recommendations for doctors issue 6 "Application of dietary supplements of the NSP company in the practice of a district doctor	1	6
160	d025	Methodological recommendations for doctors issue 5 "Gynecology. Fibroids, mastopathy"	1	6
161	d026	Methodological recommendations for doctors issue 1 "Osteoarthritis"	1	6
162	d027	Brochure "Tea Tree oil"	1	6
163	d028	Brochure "Fundamentals of nutrition" Part 7 (lipid metabolism disorders)	1	6
164	d029	Brochure "Fundamentals of nutritionology" Part 6	1	6
165	d030	Brochure "Fundamentals of nutrition" Part 5	1	6
166	d031	Brochure "Fundamentals of nutrition" Part 4	1	6
167	d032	PH Balance Brochure	1	6
168	d033	Brochure "Clinical studies of dietary supplements of NSP company" book 2	1	6
169	d034	Brochure "The effectiveness of the use of dietary supplements of the company NSP" (clinical studies)	1	6
170	d035	NSP catalog "From A to Z"	1	6
171	d036	Collection of articles "Experience of clinical application of dietary supplements of NSP company" issue 2	1	6
172	d037	Collection of articles "Experience of clinical application of dietary supplements of NSP company" issue 1	1	6
173	d038	The world of medicinal plants NSP	1	6
174	d039	Methodical recommendations for doctors issue 14. "Urolithiasis"	1	6
175	d040	Brochure Red Clover	1	1
176	e1238874	Printed T-shirt	2	8
177	e1238875	Tablet organizer with the NSP logo	2	7
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category (product_category_id, name, abbr, description) FROM stdin;
1	Dietary Supplements	\N	The 'Dietary Supplements' category is for products that provide additional nutritional support
2	Medicine	\N	'Medicine' category includes pharmaceutical products for treating illnesses and conditions
3	Cosmetics for Health	\N	'Cosmetics for Health' category comprises products aimed at enhancing health and well-being
4	Decorative Cosmetics	\N	'Decorative Cosmetics' category offers makeup products for enhancing appearance
5	Hygiene Products	\N	'Hygiene Products' category consists of items for personal cleanliness and sanitation
6	Literature	\N	'Literature' category includes books and written materials
7	Clothes	\N	'Clothes' category offers various garments and apparel
8	Accessories	\N	'Accessories' category includes additional items to complement or enhance other products or outfits
\.


--
-- Data for Name: product_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_data (product_data_id, product_id, product_form_id, has_dispenser, total_volume, items_total, item_volume, measure_unit_id) FROM stdin;
1	1	1	f	\N	180	355	1
2	2	2	t	\N	60	400	1
3	3	3	f	59	\N	\N	2
4	4	3	f	118	\N	\N	2
5	5	1	f	\N	20	1876	1
6	6	1	f	\N	100	550	1
7	7	4	f	\N	30	3750	1
8	8	2	t	\N	150	520	1
9	9	4	t	\N	30	7500	1
10	10	1	f	\N	120	1200	1
11	11	1	f	\N	90	1250	1
12	12	3	f	458	\N	\N	2
13	13	2	f	\N	100	519	1
14	14	2	f	\N	180	260	1
15	15	1	f	\N	60	1280	1
16	16	1	f	\N	60	745	1
17	17	2	f	\N	100	510	1
18	18	1	f	\N	60	590	1
19	19	2	f	\N	100	490	1
20	20	2	f	\N	60	605	1
21	21	1	f	\N	180	614	1
22	22	2	t	\N	100	630	1
23	23	2	t	\N	170	800	1
24	24	1	t	\N	50	1046.5	1
25	25	4	f	344000	38	9000	1
26	26	2	f	\N	100	802	1
27	27	2	f	\N	60	595	1
28	28	2	f	\N	90	576	1
29	29	2	f	\N	150	526	1
30	30	1	f	\N	90	1170	1
31	31	2	f	\N	100	525	1
32	32	3	f	473	\N	\N	2
33	33	4	f	564000	28	20000	1
34	34	2	f	\N	60	585	1
35	35	2	f	\N	60	1638	1
36	36	1	t	\N	150	1385	1
37	37	2	f	\N	50	500	1
38	38	2	f	\N	100	590	1
39	39	2	f	\N	100	440	1
40	40	3	f	473	\N	\N	2
41	41	1	f	\N	60	630	1
42	42	2	f	\N	90	610	1
43	43	2	t	\N	100	620	1
44	44	2	f	\N	100	620	1
45	45	2	f	\N	100	530	1
46	46	2	f	\N	180	500	1
47	47	1	f	\N	60	1204	1
48	48	2	f	\N	60	695	1
49	49	2	f	\N	45	584.3	1
50	50	2	f	\N	90	600	1
51	51	2	f	\N	100	500	1
52	52	2	f	\N	100	490	1
53	53	2	f	\N	100	650	1
54	54	2	t	\N	100	685	1
55	55	4	t	510000	15	34000	1
56	56	4	f	\N	30	37700	1
57	57	4	f	36000	120	300	1
58	58	2	f	\N	100	570	1
59	59	1	f	\N	60	1762	1
60	60	1	f	\N	60	1165	1
61	61	2	f	\N	60	600	1
62	62	4	f	532000	28	19000	1
63	63	2	f	\N	100	570	1
64	64	1	f	\N	120	567.8	1
65	65	2	f	\N	100	540	1
66	66	1	f	\N	96	1350	1
67	67	2	f	\N	100	585	1
68	68	2	f	\N	100	545.6	1
69	69	1	f	\N	150	1400	1
70	70	2	f	\N	100	600	1
71	71	2	f	\N	90	505	1
72	72	2	f	\N	100	490	1
73	73	2	f	\N	60	528	1
74	74	2	f	\N	100	500	1
75	75	3	f	475	\N	\N	2
76	76	2	f	\N	60	630	1
77	77	2	f	\N	90	620	1
78	78	3	f	473	\N	\N	2
79	79	2	f	\N	60	510	1
80	80	4	f	75000	50	1500	1
81	81	2	f	\N	90	678	1
82	82	2	f	\N	100	520	1
83	83	1	f	\N	120	600	1
84	84	2	t	\N	100	525	1
85	85	2	t	\N	100	534	1
86	86	2	t	\N	120	625	1
87	87	2	f	\N	100	500	1
88	88	1	f	\N	120	644	1
89	89	2	f	\N	100	525	1
90	90	2	f	\N	60	585	1
91	91	2	f	\N	60	657	1
92	92	2	f	\N	100	495	1
93	93	1	f	\N	90	627	1
94	94	2	f	\N	100	560	1
95	95	2	f	\N	90	585	1
96	96	2	f	\N	60	570	1
97	97	2	f	\N	90	608	1
98	98	2	f	\N	60	540	1
99	99	5	f	85000	\N	\N	1
100	100	5	f	118	\N	\N	2
101	101	3	t	15	\N	\N	2
102	102	5	f	100000	\N	\N	1
103	103	6	f	45000	\N	\N	1
104	104	3	f	125	\N	\N	2
105	105	5	f	50	\N	\N	2
106	106	5	f	50	\N	\N	2
107	107	5	f	15	\N	\N	2
108	108	5	f	50	\N	\N	2
109	109	5	f	15	\N	\N	2
110	110	5	t	50	\N	\N	2
111	111	5	f	200	\N	\N	2
112	112	5	f	200	\N	\N	2
113	113	5	f	200	\N	\N	2
114	114	5	f	200	\N	\N	2
115	115	5	f	200	\N	\N	2
116	116	3	f	200	\N	\N	2
117	117	3	t	50	\N	\N	2
118	118	3	f	125	\N	\N	2
119	119	5	f	250	\N	\N	2
120	120	5	f	50	\N	\N	2
121	121	3	f	30	\N	\N	2
122	122	5	f	125	\N	\N	2
123	123	5	f	126	\N	\N	2
124	124	5	t	127	\N	\N	2
125	125	8	f	59	\N	\N	2
126	126	5	f	127	\N	\N	2
127	127	5	t	118	\N	\N	2
128	128	3	f	226	\N	\N	2
129	129	10	f	251	\N	\N	2
130	130	10	f	251	\N	\N	2
131	131	7	f	32000	\N	\N	1
132	132	7	f	32000	\N	\N	1
133	133	10	f	32000	\N	\N	1
134	134	10	f	32000	\N	\N	1
135	135	7	f	54	\N	\N	1
136	136	9	f	\N	235	1	3
137	137	9	f	\N	3	1	3
138	138	9	f	\N	156	1	3
139	139	9	f	\N	264	1	3
140	140	9	f	\N	15	1	3
141	141	9	f	\N	459	1	3
142	142	9	t	\N	457	1	3
143	143	9	t	\N	159	1	3
144	144	9	f	\N	89	1	3
145	145	9	f	\N	16	1	3
146	146	9	f	\N	312	1	3
147	147	9	f	\N	275	1	3
148	148	9	f	\N	562	1	3
149	149	9	f	\N	187	1	3
150	150	9	f	\N	7	1	3
151	151	9	f	\N	65	1	3
152	152	9	f	\N	198	1	3
153	153	9	f	\N	230	1	3
154	154	9	f	\N	572	1	3
155	155	9	f	\N	920	1	3
156	156	9	f	\N	567	1	3
157	157	9	f	\N	402	1	3
158	158	9	f	\N	12	1	3
159	159	9	f	\N	139	1	3
160	160	9	f	\N	187	1	3
161	161	9	t	\N	236	1	3
162	162	9	t	\N	451	1	3
163	163	9	f	\N	12	1	3
164	164	9	f	\N	12	1	3
165	165	9	f	\N	46	1	3
166	166	9	f	\N	59	1	3
167	167	9	t	\N	157	1	3
168	168	9	f	\N	194	1	3
169	169	9	f	\N	241	1	3
170	170	9	f	\N	351	1	3
171	171	9	f	\N	684	1	3
172	172	9	f	\N	152	1	3
173	173	9	f	\N	462	1	3
174	174	9	f	\N	137	1	3
175	175	9	f	\N	156	1	3
176	176	10	t	\N	\N	\N	\N
177	177	10	f	\N	\N	\N	\N
\.


--
-- Data for Name: product_form; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_form (product_form_id, name, abbr, description) FROM stdin;
1	Tablet	\N	A solid form of medication or supplement that is typically taken orally
2	Capsule	\N	A small, cylindrical form of medication or supplement that encloses the active ingredients
3	Liquid	\N	A fluid form of medication or product that can be poured or measured
4	Powder	\N	A dry, finely ground substance that can be dissolved or mixed with other substances
5	Cream	\N	A semisolid emulsion that is applied to the skin for medicinal or cosmetic purposes
6	Lipstick	\N	A cosmetic product in a stick form that is applied to the lips for color and texture
7	Pencil	\N	A thin cylindrical object used for writing, drawing, or cosmetic application
8	Roller	\N	A device with a rolling mechanism used for applying products, such as skincare or paint
9	Book	\N	A written or printed work consisting of pages bound together
10	Thing	\N	A general term used to describe an unspecified object or item
\.


--
-- Data for Name: product_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_info (product_info_id, product_id, pros, advantages, active_ingredients, composition, application, contraindications, storing) FROM stdin;
1	1	• Necessary for the prevention of osteoporosis and improving the absorption of calcium and phosphorus\n• Supports a strong immune system\n• Has a positive effect on skin health\n• Improves mood, increases vitality	Contrary to popular belief, vitamin D affects not only bone tissue, but also the small intestine, kidneys, other organs and systems. People with low levels of this vitamin get SARS significantly more often than those who are provided with them in sufficient quantities.\nThe vitamin D content in food is low, therefore, with normal nutrition, there is a deficiency in the body, which dictates the need for its additional intake. It was found that with a daily intake of 1000 IU (25 mcg) of vitamin D, its blood level rises to the lower threshold of normal. In order to ensure the optimal content of vitamin D (50-60 ng / ml), it is recommended to take at least 50-100 mcg per day and regularly monitor the indicator of 25-oxyvitamin D in the blood. This is especially true for people who are at risk and have chronic diseases.\nChronic vitamin D deficiency is a risk factor for the development of a number of serious diseases such as cancer, autoimmune, cardiovascular and others. Vitamin D deficiency is a provoking factor of psoriasis and vitiligo, as well as other autoimmune diseases. With a lack of vitamin D, memory impairment, muscle pain, insomnia are noted. Vitamin D deficiency is the main cause of rickets in children.\nThe lack of this vitamin can occur with its deficiency in nutrition, with its insufficient formation in the skin under the influence of sunlight, with liver and kidney diseases, where the second and third stages of its metabolism take place. Vitamin D deficiency is the main cause of rickets in children. Vitamin D3 NSP is a source of high–quality vitamin D in a convenient dosage.\nThe monoproduct of vitamin D3 (cholecalciferol) in the optimal dosage is 600 IU (15 mcg, 150% of the adequate daily requirement). Convenient use for adults (it is easy to dial the right dosage) and for children (a small absorbable tablet with the taste of peach and tropical fruits). Large packaging. Vitamin D3 is obtained from natural, environmentally friendly raw materials from Australia and New Zealand.	Vitamin D3 (cholecalciferol) is a fat–soluble vitamin. This vitamin can be formed in human skin under the influence of ultraviolet sunlight. Russia is located in a zone of low insolation and is included in the group of countries at risk of vitamin D deficiency. Another type of this vitamin – D2 enters the human body from plant products and is called ergocalciferol. Vitamin D3 is absorbed by about 50%, while the digestibility of D2 is lower. The biological activity of vitamin D3 is also significantly higher than D2.\nIt has been established that vitamin D is important for the regulation of immunity. It prevents the development of cardiovascular, autoimmune and oncological diseases. Under the influence of vitamin D, the formation of blood cells occurs, it has an anti-inflammatory effect.	Dietary supplement Vitamin D3 NSP is an additional source of vitamin D3.\n1 tablet contains: sorbitol 220 mg, mannitol 83 mg, xylitol 25 mg, vitamin D3 (cholicalciferol) 600 IU / 15 mcg (150% of TSA).\nAuxiliary substances: stearic acid (rast.), magnesium stearate (rast.), natural peach flavor, natural tropical fruit flavor, citric acid	Adults take 1 tablet a day with meals, chew. The duration of admission is 1 month. If necessary, the reception can be repeated.\nYou can take from 1 to 3 tablets a day, depending on the results of tests and recommendations of doctors.\nChildren can take Vitamin D after consulting a pediatrician from the age of 2-3 years.\nIn accordance with the norms of the Russian Federation from 2008, vitamin D is prescribed at a dose of 10 mcg for all age groups of children.	individual intolerance to the components of the product, pregnancy, breast-feeding. It is recommended to consult a doctor before use\nStorage conditions	Store in a dry place, protected from light, inaccessible to children, at a temperature not higher than +30oC.
2	2	Supports energy production\nIt has a powerful cardioprotective effect\nIt has antioxidant activity\nIt has a positive effect on the work of the liver, brain, kidneys and other organs	Coenzyme Q10 (ubiquinone, which means "ubiquitous") is a vitamin—like substance of lipid nature, part of the respiratory chain of mitochondria (energy stations of the cell). The production of 95% of cellular energy depends on the work of coenzyme Q10.\nIt is formed in all cells of the body, however, with high physical activity, stress, in extreme situations and with various diseases, when a large amount of energy is required, there are not enough coenzyme Q10 own resources. With age, the formation of coenzyme decreases (in 60 years — by 40-60%), which accelerates aging. Taking this substance gives a surge of strength and increases efficiency.\nCoenzyme Q10 is an effective antioxidant, able to recover during oxidation and restore the activity of vitamin E.\nIn organs that consume a large amount of energy, such as the heart, liver, brain, kidneys, spleen, pancreas, the content of coenzyme Q10 is increased. Therefore, its deficiency in these organs can be the cause of serious metabolic problems and diseases.\nThe optimal dose of coenzyme Q10 is 100 mg. The oil base is extra—virgin olive oil. Does not contain GMOs.	More than 60 diseases are associated with a deficiency of coenzyme Q10. It is used for various indications:\nCardiology — ischemic heart disease, cardio-myopathy, acute coronary syndrome, myocardial infarction, postinfarction, endothelial dysfunction, chronic heart failure, congenital heart defects, cardiac arrhythmia.\nHypertension — lowers blood pressure.\nAtherosclerosis — inhibits the biosynthesis of cholesterol.\nNeurology — chronic fatigue syndrome, neurodegenerative and senile diseases, Parkinson's disease\nMuscle diseases — myopathies, including Duchenne dystrophy.\nCoenzyme Q10 is recommended to be taken as an ophthalmoprotector for retinal dystrophy; as a hepatoprotector for toxic and viral hepatitis, liver failure; in nephrology for chronic pyelonephritis and metabolic nephropathy; in dermatology to support health and skin rejuvenation, helps with periodontal disease. It has been established that in oncological diseases, coenzyme Q10 contributes to the inhibition of tumor development and reduces the toxicity of antitumor drugs. Coenzyme Q10 stimulates all parts of the immune system, increases the activity of phagocytosis and increases the biosynthesis of antibodies, reduces blood sugar (up to 30%), slows down aging.\n	Dietary supplement Coenzyme Q10 100 mg is an additional source of coenzyme Q10.\n1 capsule contains: coenzyme Q10 – 100 mg (333% of the adequate level of daily intake).\nExcipients: olive oil, gelatin, glycerin, water, beeswax, sunflower oil lecithin, carob gum.	Adults take 1 capsule a day with meals. It is necessary to consult a doctor before use.	individual intolerance to the components, pregnancy, breast-feeding.	\N
3	3	Supports the work of the lymphatic, circulatory and immune systems.\nHelps the body maintain vascular health.\nPromotes the elimination of toxins from the body.\nWhen used in combination, it enhances the effect of other products.	The lymphatic system is the only way to drain toxins from the intercellular fluid, where 83% of them are contained, and plays a key role in cleaning the internal environment of the body from toxic and fat-soluble substances, as well as metabolic products. Unlike the circulatory system, the lymphatic system does not have a pump and works on the principle of a drainage network, where the fluid moves by gravity and pours into the subclavian vein. The promotion of lymph – the fluid that is formed from the intercellular fluid – is helped by physical activity, and drinking enough water increases the volume and speed of the lymph flow. Stress leads to a violation of the outflow of lymph.\nThe lymphatic system is closely related to the immune function and includes: lymph nodes, tonsils, appendix, spleen, bone marrow. In the process of lymph transport through the lymph nodes, it is cleaned of bacteria, viruses and toxins. When the intercellular fluid is overloaded with toxins, the lymphatic ducts may be blocked by the remnants of drained connective tissue. Therefore, stimulation of lymph flow (lymphatic drainage) is one of the most important conditions for the detoxification process of the body, increasing the effectiveness of the immune system and improving the quality of treatment of a variety of diseases.\nLymphatic Drainage is designed to support the normal drainage of the lymphatic system. The product helps to eliminate lymph stagnation, improves the absorption of nutrients and increases immunity.\nThe ingredients in Lymphatic Drainage have a cumulative effect on cleansing and stimulating the lymphatic system. Indications for use: sedentary lifestyle, frequent exposure to stress, edema, varicose veins, hypertension, psoriasis, enlarged lymph nodes, bad breath, from the body.\nLymphatic Drainage from NSP is a unique phytoformula based on lymphatic drainage herbs. Convenient reception thanks to the form of syrup in a bottle with a dropper.	Tenacious bedstraw (Galium aparine) – tones the lymphatic system, has a diuretic effect. It is traditionally used to treat enlarged lymph nodes in humans.\nRed clover flower extract (Trifolium pretense) – helps to improve blood circulation. Improves vascular elasticity.\nZanthoxylum bark (Zanthoxylum clava-herculis) – stimulates the circulatory and lymphatic systems of the body.\nStillingia root (Stillingia sylvatica) – increases drainage and prevents stagnation of lymph.	1 bottle contains: vegetable glycerin – 33 g, purified water – 8.3 g, tenacious bedstraw, aboveground parts – 6 g, red clover flower extract – 4.4 g, zantoxylum bark – 3.6 g, stillingia root – 3.5 g\nApplication\nFor children from 14 years of age and adults, take 1 ml (15-20 drops or 1/4 teaspoon), dietary supplement Lymphatic Drainage, dissolved in 1 glass of water, twice a day.	\N	individual intolerance to the components of the product, pregnant and lactating women.	\N
4	4	Suppresses the vital activity of pathogenic bacteria and fungi\nAntiseptic for external and internal use	Silver has traditionally been used for medicinal purposes, until antibiotics came into widespread use, undeservedly replacing this natural antiseptic. The bactericidal properties of silver are associated with its ability to block SH-groups of bacterial enzymes, as well as neutrazize the DNA of microorganisms. Silver molecules inhibit the reproduction of pathogenic bacteria and fungi, reduce their vital activity. At the same time, the spectrum of action of colloidal silver extends to 650 species of bacteria, while the spectrum of action of an antibiotic is only 5-10 species. The complex mild action makes it possible to use this product in children.\nUniversal natural antibiotic for internal and external use. Helps the body fight infection without side effects. It is safe for friendly intestinal microflora. Produced using the patented Aqua Sol technology. The enhanced concentration is 100 micrograms of silver per 5 ml of solution.	Colloidal silver is silver in the form of a colloidal solution.\nIndications for use: colds, acute and chronic diseases of the nasopharynx, paranasal sinuses, bronchi and lungs, food poisoning, lesions with tapeworms and roundworms, as well as juvenile acne, some types of psoriasis, fungal skin lesions, burns, insect bites, rheumatoid arthritis urinary tract infections, including chlamydia, trichomonas, gonorrhea. It has an anthelmintic effect against roundworms and tapeworms.	It is recommended as a dietary supplement – a source of silver.\n1 teaspoon (5 ml) contains: silver – 100 micrograms, purified water – 4.9 ml.	Adults take 1 teaspoon (5 ml) a day between meals. The duration of admission is 5-7 days. If necessary, the intake of dietary supplements can be repeated. It is recommended to consult a doctor before use.\nIn the acute period of the disease, it is permissible to take Colloidal Silver Forte 2-3 times a day.	\N	\N
5	5	Strengthens the immune system, counteracts bacterial and viral infections\nIncreases antioxidant potential.\nIt has an anti-inflammatory effect.\nPhysical Asset	The immune system plays an important role in a person's life, which protects him from foreign substances, bacteria and viruses, bacteria, parasites, stands guard over internal security, identifying and destroying infected, atypical and cancer cells. Physical Asset is one of the effective means that enhance immune function, and contains a number of important components that have a powerful immunostimulating effect. Physical Activity increases the body's resistance to infectious diseases, is an adaptogen and helps the body resist the effects of stress, accelerates recovery and wound healing. It has a rapid protective effect on the mucous membranes of the upper respiratory tract and oral cavity.\nThis unique formula from Nature's Sunshine does not contain fructose and sweeteners, which is important for type 2 diabetes. Sucralose is used as a sweetener, which, together with citric acid and natural flavors, gives the product a pleasant taste. The convenient form of a fast-dissolving effervescent tablet allows the components to be absorbed faster.	Vitamin C – activates the production of interferon and antibodies that counteract infection by destroying bacteria and viruses. Increases the body's resistance to all classes of pathogenic bacteria, viruses, protozoa, fungi, accelerates recovery from helminthiasis and protozoal diseases. Vitamin C accelerates wound healing processes, reduces allergic reactions.\nArabinogalactan is a water–soluble plant polysaccharide often found in plants, fungi and bacteria. This substance supports the immune system by stimulating the activity of natural killer cells and macrophages.\nBeta-glucans are polysaccharides found in cereals (oats, barley), yeast, bacteria, seaweed and fungi. They stimulate the activity of macrophages, T-lymphocytes, regeneration, and have an oncoprotective effect.\nZinc — stimulates the development of bone marrow and thymus, increases the activity of phagocytosis, the number of neutrophils, NK cells, T and B lymphocytes, the production of antibodies and interferon. Zinc deficiency reduces the number of lymphocytes, increases the clinical severity of influenza and mortality, suppresses autoimmune processes. People with zinc deficiency often suffer from infectious diseases for a long time.\nEchinacea Purpurea (Echinacea Purpurea) – the Indians of North America, the birthplace of echinacea, have used this plant since ancient times as a means of acting against infectious diseases and increasing the level of protective forces. They used echinacea even for snake bites (hence another name – "snake root"). Caffeic acid glycoside, which is contained in the root of the plant, increases the body's resistance to bacterial, fungal and viral infections and accelerates recovery. Another component, echinacin, has cortisone-like activity and accelerates wound healing. Echinacea increases the number of leukocytes, activates macrophages and T-lymphocytes, increases interferon production, has antiallergic and adaptogenic effects, is effective in inflammatory diseases (rheumatism, polyarthritis, prostatitis, gynecological diseases), upper respiratory tract diseases, trophic ulcers, osteomyelitis, microbial eczema.\nReal ginseng (Panax ginseng) – the roots are used as an adaptogen and a tonic. Ginseng increases the body's resistance, physical and mental performance, improves the functioning of the cardiovascular system, normalizes blood pressure.	Dietary supplement Fiz Active is an additional source of gingosides, hydroxycinnamic acids, vitamin C and zinc.\n1 capsule contains: vitamin C - 250 mg (278%), potassium (in potassium bicarbonate) - 75 mg (3%), zinc (in zinc acetate) - 5 mg (41.7%), arabinogalactan - 100 mg (1%), beta-glucans - 100 mg (50%), Echinacea purpurea root extract - 85 mg, Korean ginseng root extract (Panax ginseng) - 15 mg\nExcipients:\ncitric acid, sodium bicarbonate, sorbitol, natural flavors, cellulose, mineral oil, stearic acid, sucralose, magnesium stearate.	Adults take 1 tablet 1 time a day with meals, having previously dissolved the tablet in 1 cup (200 ml) of water. The duration of admission is 3 weeks.	individual intolerance to the components, pregnancy, breast-feeding.	store in a dry place inaccessible to children at a temperature not exceeding +25 °C.
6	6	Increases physical strength, endurance and activity.\nNormalizes the immune system, has an anti-allergic effect.	A universal monoproduct of Active Longevity. It contains up to 35% complete protein, 18 amino acids, B vitamins, 27 mineral salts, trace elements and enzymes. For its production, plant pollen is used, bonded with nectar and bee saliva, dried in a natural way to preserve vital enzymes. Pollen undergoes enzymatic treatment of pollen grain shells in order to reduce allergenicity.	Bee pollen is considered to be the most perfect natural nutritional product, it contains almost all vital components: 18 amino acids, vitamins, 46 bioelements, enzymes. Pollen increases physical endurance, supports the immune and nervous systems, protects against heart disease, cancer, arthritis. The use of bee pollen slows down the aging process and rejuvenates the skin. Bee pollen has the ability to reduce the manifestation of allergies and hay fever.	Dietary supplement Bee Pollen is an additional source of flavonoids.\n1 capsule contains: bee pollen — 450 mg.\nAuxiliary substances: gelatin.	Adults take 2 capsules 2 times a day with meals for 1 month.	individual intolerance to the components of the product, pregnancy and breast-feeding.	\N
7	7	It has an antioxidant, membrane-protective and capillary-protective effect\nHelps to improve brain function, memory and concentration\nPromotes weight loss	Overweight is always associated with metabolic disorders and often leads to serious diseases: diabetes mellitus, arterial hypertension, coronary heart disease, atherosclerosis. Everyone knows that in order to fight excess weight, it is necessary to reduce the consumption of high-calorie foods and increase physical activity, which is designed to burn extra calories. It is also possible to suppress the feeling of hunger in order to reduce the amount of food consumed, increase thermogenesis and the level of basal metabolism, which will increase energy consumption in the body and "burning" fat, increase physical endurance to overcome fatigue during exercise. Solstik Slim contains a complex of phyto-ingredients that will help more successfully solve problems associated with overweight.\nA unique phytoformula for solving body weight loss problems. A low-calorie product. It is convenient to use and is presented in serving bags. The caloric content of 1 sachet is 12 kcal.	The peel of red grapes (Vitis vinifera) – contains a large amount of polyphenols (anthocyanins, dihydroquercitin, resveratrol), which have a strong antioxidant and membrane-protective effect, stabilizing blood capillaries.\nParaguayan holly or tea tree Mate (Ilex paraguariensis) – leaves contain caffeine, theobromine and chlorogenic acid, which determine its action. Mate has a tonic effect, improves digestion and liver function. Note the stimulating effect of mate on the immune system. It is recommended as a means of combating neurosis and depression, it improves mood, increases intellectual activity, while insomnia disappears, and the quality of sleep, anxiety, emotional imbalance improves. Mate does not disrupt the sleep cycle, sleep becomes deep, which allows you to relieve tension and fatigue. This is largely due to the suppression of the release of the hormone adrenaline. It has been found that mate lowers cholesterol, promotes fat burning, suppresses appetite, and reduces the risk of cancer.\nIndian cactus (Caralluma fimbriata) – suppresses appetite by acting on the hypothalamus. Increases energy production in the human body by stimulating the oxidation of fat, which leads to a decrease in body weight. The inhabitants of India ate cactus shoots during a long hunt, which helped them cope with hunger and increased physical endurance. It has been found that the substances contained in the cactus reduce blood sugar levels, block the formation of fat cells, strengthen the immune system and help improve the condition of the skin and hair.\nDamiana sprawling (Turnera diffusa) – the Maya Indians used damiana as an aphrodisiac that helps increase sexual desire, also for asthma, lung diseases, to maintain the overall tone of the body. Its active substances contribute to the rush of blood to the pelvic organs, stimulate the activity of the nerve nodes of the spinal cord, promote the release of sex hormones that have an exciting effect. The components of damiana have thermogenic activity, increasing body temperature, which leads to an increase in fat burning, are able to relieve tension, manifestations of neurosis, neurostenia and depression, increasing psycho-emotional tone and sexual desire. Damiana is used for impotence – a decrease in erectile function and libido, to increase psycho-emotional tone. It has a stimulating or soothing effect, depending on the dose. Damiana is recommended for dysmenorrhea, colds and inflammatory diseases, dyspepsia, headaches. In South American countries, Damiana is traditionally used to terminate pregnancy.\nChinese camellia or green tea (Camellia sinensis) – green tea extract is more active than black tea extract, has an antioxidant, capillary-protective effect, has antibacterial activity, stimulates hematopoiesis. Green tea increases the metabolic rate without increasing the heart rate, its extract increases thermogenesis and stimulates fat oxidation.	Dietary supplement Solstik Slim is a source of flavonoids, proanthocyanidins, caffeine, contains anthocyanins, for people who control body weight.\n1 bag of 3.75 grams: red grape peel extract (Vitis vinifera) - 245 mg; Paraguayan holly leaves (Ilex paraguariensis) -150 mg; Indian cactus extract (Caralluma fimbriata) - 75 mg; damiana leaves (Turnera diffusa) - 75 mg; decaffeinated green tea extract (Camellia sinensis) - 50 mg. Other ingredients: maltodextrin, citric acid, natural blueberry flavor, malic acid, sucralose, silicon dioxide.	Adults take 1 package (3.75 g), pre-dissolved in 0.5 liters of water, take 250 ml 2 times a day with meals. The duration of admission is 1 month. If necessary, the reception can be repeated.	individual intolerance of components, pregnancy, breast-feeding.	Please note that at high storage temperatures (above +25°), the product may have a bitter taste.
8	8	Protects against viral infections, strengthens the immune system.\nReduces the manifestations of chronic fatigue.\nRelieves the symptoms of seasonal allergies.\nImproves heart function, dilates blood vessels.\nImproves kidney function, reduces the risk of developing nephrotic syndrome.\nReduces and controls blood sugar levels in type 2 diabetes.\nReduces the negative effects of chemotherapy and the risks of infections in patients with malignant tumors.\nSlows down cellular aging.	A unique monocomponent product of Active Longevity of a wide spectrum of action.	Astragalus membranaceus (Astragalus membranaceus) is best known for its use in traditional folk Chinese medicine. Historically, it has been used as an immunomodulatory agent for the treatment of colds, diarrhea, fatigue and anorexia.\nThe main actions of astragalus:\n1. Adaptogenic, anti—inflammatory - increased resistance to infections. Saponins in astragalus have been proven to protect against sepsis by suppressing inflammation. By weakening inflammatory factors, astragalus suppresses tissue damage, such as edema of tissues, including lung.\n2. Anti—infective - prevention of viral infections, including colds, respiratory infections and infectious liver diseases (infectious hepatitis).\n3. Immunomodulating and supporting the immune system — the activity of the astragalus root in this direction has been proven. In relation to patients with a tumor process, astragalus increases resistance to infections in these patients.\n4. Antitumor — used to stimulate apoptosis (natural programmed death of cancer cells). There is a relief of side effects of chemotherapy (nausea, vomiting and diarrhea). At the same time, the maximum effectiveness of astragalus is observed during the first week of treatment.\n5. Cardiotonic and vasodilator — improving heart function and reducing the severity of symptoms in heart diseases. Astragalus dilates blood vessels and increases the amount of blood pumped from the heart.\n6. Lowering and controlling blood sugar levels in type 2 diabetes. The addition of astragalus to the diet helps to control blood sugar levels in people with type 2 diabetes both after a period without eating (for example, sleep) and after eating with daily use of this product for 4 months.\n7. Weight loss due to improved carbohydrate metabolism.\n8. Improving kidney function and maintaining their health. Improves the indicators of protein in the urine (proteinuria) — a sign of damage or impaired kidney function. Astragalus provides prevention of infections and risk of inflammation in people with reduced kidney function when taken daily for 3-6 months.\n9. Tonic — reduces the manifestations of chronic fatigue syndrome.\n10. Anti—allergic - relieves the symptoms of seasonal allergies (sneezing, runny nose).\n11. Geroprotective — the ability of astragalus to stop cellular aging and slow down the shortening of telomeres has been proven. Telomeres are "protective caps" on chromosomes that thin with age and are a sign of cellular aging. Dr. Bill Edwards, USA, discovered the enzyme telomerase in germ cells, which restores telomeres to transmit age information to subsequent generations. Astragalus slows down and reverses telomere shortening, as well as restores and improves cellular function.	Dietary supplement Astragalus is a source of polyphenolic compounds, contains triterpene saponins.\n1 capsule contains:astragalus membranous root — 420 mg.\nAuxiliary substances:\ngelatin, water (as part of a gelatin capsule).	Take 2 capsules 3 times a day with meals. The duration of reception is 2-4 weeks.	individual intolerance to dietary supplements, pregnancy, breast-feeding.\nAttention:\nIndividuals with autoimmune diseases (multiple sclerosis, systemic lupus erythematosus, rheumatoid arthritis, etc.): astragalus can increase the activity of the immune system.\nPeople taking immunosuppressants: astragalus can increase the activity of the immune system and reduce the effect of immunosuppressants.\nPeople with diabetes and hypotension: astragalus affects blood sugar levels and lowers blood pressure.	\N
9	9	Provides joint recovery and restores the balance of electrolytes in the body after physical exertion\nIncreases energy potential and endurance with high physical activity and an intense lifestyle\nAccelerates the level of ATP recovery in the presence of ischemia of the heart, brain and muscles	Intensive and prolonged physical activity, whether it is sports, fitness or hard physical work, entails serious metabolic disorders in muscle tissue and joints, depletion of energy reserves (carbohydrates and proteins, which are also an energy reserve during physical exertion). All this requires the replenishment of reserves and the restoration of muscles and joints. Solstik Revive contains vitamins and bioelements, amino acids, glucosamine, sea salt and phyto-ingredients that work as a powerful complex that allows you to successfully recover after physical exertion. Solstic Revive is recommended for people leading an active lifestyle, doing sports, fitness and yoga.\nA unique phyto-vitamin-mineral formula for recovery after intense physical exertion. A low-calorie product. It is convenient to use and is presented in serving bags. The caloric content of 1 sachet is 20 kcal.	B vitamins (B1, B2, B3, B5, B6, B12) – play an important role in metabolism and energy production.\nVitamins C and E – provide antioxidant protection in conditions of increased oxygen consumption during high physical and psycho-emotional stress (stress). They are also important during the recovery period after physical activity.\nPomegranate juice and grape peel extract are sources of polyphenols, which are effective antioxidants and capillary protectors.\nD-ribose is a monosaccharide, reduces fatigue, promotes energy production, restores ATP levels, which is important for tissues with ischemia (lack of incoming oxygen), has a tonic effect.\nL-carnitine – stimulates the production of energy during the oxidation of fatty acids, supports the work of the heart.\nTaurine – improves heart function by limiting the increase in heart rate and increasing blood output,\nincreases physical endurance, stabilizes the cell membrane.\nGlycine – participates in the formation of hemoglobin and collagen, in the binding and excretion of toxic metabolites and ammonia, has a sedative effect.\nGlucosamine – provides restoration of cartilage and connective tissue of joints after physical exertion.\nCalcium (in calcium lactate) and magnesium (in gluconate) are the most important bioelements that play a key role in muscle function and are part of bone tissue.\nSea salt – contains sodium, potassium, magnesium, calcium, chlorides, sulfates, iodine, etc., helps to maintain the water-electrolyte balance in the body. The content of bioelements in sea salt is close in composition to human blood plasma. During high physical activity, the human body loses a significant amount of bioelements-electrolytes in the urine, which reduces physical performance and requires the restoration of water-electrolyte balance.\nInulin – from chicory root contains fructooligosaccharides, which serve as a nutrient medium for the intestinal microflora. Supporting intestinal microbiocenosis is important both during physical activity and during recovery.	Dietary supplement Solstik Revive is an additional source of glucosamine, inulin, D-ribose, vitamins E, C, B1, B2, B6, B12, PP, pantothenic acid, contains steviosides.\nAuxiliary ingredients: citric acid, natural citrus sweetener (inulin, fructose, pea protein isolate, natural flavors), natural lemon flavor, natural strawberry flavor, silicon dioxide, stevia leaf extract.	The contents of 1 sachet should be dissolved in 0.5 liters of water at room temperature, taken by adults during the day.	individual intolerance to dietary supplements, pregnancy and breast-feeding.	At high storage temperatures (above +25 °), the product may have a bitter taste.
10	10	They provide the body with vitamins and iron\nContribute to the normal growth and development of children\nImprove the body's resistance to infectious diseases	The body of children, especially young children, is very sensitive to the deficiency of essential nutrition factors, the main of which are vitamins and bioelements. The strength of the "Vitasaurics" of the NSP company is in the richness of vitamins, which are necessary to support the health and development of the nervous, immune, cardiovascular system, vision, to increase the resistance of the child's body to infectious diseases.\nThis vitamin complex can serve as an excellent additional source of vitamins for adults.\nDietary supplement "Vitazavriki" provides the body of children with vitamins and iron for normal growth and development. Chewable tablets are a convenient form for young children, they have a pleasant taste, flavored with papaya, lime and orange.	Vitamins: vitamin A, vitamin D2, vitamin E, vitamin C, all 8 vitamins of group B.\nIron is one of the most important bioelements in young children. Iron is the main component of blood hemoglobin, is a part of antioxidant defense enzymes. Lack of iron leads to the development of iron deficiency anemia. Children, depending on their age, need from 4 mg / day (newborns) to 15 mg / day (children 6-10 years old).\nInositol is a vitamin—like substance ("vitamin B8"). Regulates the brain, has a calming effect that relieves the effects of stress, depression, neurosis, anxiety attacks, sleep disorders, lowers blood pressure. Strengthens the walls of blood vessels, normalizes cholesterol levels and prevents the occurrence of atherosclerosis, obesity, thrombophlebitis. It is important for the growth of bones and muscles, which is especially necessary for children, teenagers, athletes – for the health of skin and hair. Inositol deficiency leads to eczema and other skin diseases, and hair becomes brittle and falls out. Promotes rapid recovery of the body after prolonged physical exertion. Protects the liver and stimulates its work. It has an antioxidant effect.\nCholine is a vitamin—like substance ("vitamin B4"). It plays an important role in the work of the nervous system, participates in the formation and protection of the myelin sheath of nerves. Significantly improves short-term memory, prevents depression. It is a hepatoprotector, accelerates the recovery of the liver under toxic effects, prevents the formation of gallstones. Stimulates the breakdown of fat, normalizing fat metabolism, reduces the risk of cardiovascular diseases. Strengthens the heart muscle, normalizes the heart rate. Regulates the level of insulin. In type I diabetes mellitus, it helps to reduce the need for insulin. The additional use of choline in food by pregnant women and children of the first five years of life has a positive effect on mental abilities, regulates growth in children.\nPapaya fruits (Carica papaya) — contain organic acids, carixanthin, beta-carotene, vitamins, enzymes, among which papain is isolated. It has an anti-inflammatory effect.\nOrange juice and rosehip fruits contain a large amount of vitamins, antioxidants and organic acids.\nWheat germ is a source of biologically active compounds, rich in vitamins, antioxidants and protein.\nBrown algae (Ascophillum nodosum, Laminaria digitata) — contain iodine and alginic acids.	Dietary supplement Vitazavrika is an additional source of vitamins E, D, C, A, B1, B2, B6, B12, PP, folic acid, pantothenic acid, biotin, iron and flavonoids.\nAuxiliary substances:\nmannitol, sorbitol, fructose, natural lemon and lime flavor, magnesium stearate.	Take 1 tablet daily with meals. The duration of admission is 1 month. If necessary, the intake of dietary supplements can be repeated.	individual intolerance to dietary supplements. Pregnant and lactating women are advised to consult a doctor before starting use.	\N
11	11	Normalizes the function of the digestive system.\nCreates a favorable environment for the growth of beneficial microorganisms.\nRestores intestinal microflora.	Beneficial microorganisms inhabiting the gastrointestinal tract (enterococci, E. coli, bifidobacteria, lactobacilli) are involved in digestion and metabolism. Moreover, bifidobacteria and lactobacilli contribute to the formation of the body's immune defense and stimulate local immunity. In diseases of the digestive system, infectious diseases, and food allergies in children, a violation of the intestinal flora, called dysbiosis, is often noted. Dysbiosis in children is a reaction of intestinal bacteria to the effects of adverse external factors and digestive disorders, as a result of which the balance of normal intestinal microflora changes. Treatment of diseases with antibiotics or sulfonamides, overwork can also disrupt the balance of beneficial bacteria in the gastrointestinal tract. At the same time, the so-called conditionally pathogenic (aerobic) flora begins to multiply intensively. Dysbiosis is often accompanied by: constipation, diarrhea, increased gas formation, bloating, colic. Colonization of the intestine with normal microflora is useful for the elimination of dysbiosis.\nFor this purpose, NSP has developed a highly effective bioadditive Bifidosaurica.\nThe composition is adapted for children over 3 years old. The product is presented in the form of chewable tablets with a natural orange flavor. Contains not only pro-, but also prebiotics.	Sorbitol, mannitol, fructose, fructooligosaccharides are a complex of prebiotics that are a nutrient medium for the growth of beneficial flora\nLactic acid (Lactobacillus acidophilus, Lactobacillus casei) and bifidobacteria (Bifidobacterium infantis, Bifidobacterium longum), which create conditions in the intestine unfavorable for the life of pathogenic microorganisms.	Chewable tablets for children Bifidosaurics are an additional source of microorganisms - probiotics and components with prebiotic action for children over 3 years old.\n1 tablet contains:\nBifidobacteria (Bifidobacterium infantis) - 3.0x108 CFU*; bifidobacteria (Bifidobacterium longum) - 3.0x108 CFU*; Lactobacilli (Lactobacillus acidophilus) - 2.5x108 CFU*; lactobacilli (Lactobacillus casei) - 1.5x108 CFU*; sorbitol - 527 mg; mannitol - 320 mg (32% of ASP); fructose - 196 mg; fructooligosaccharides, maltodextrin, orange juice in powder, natural orange fragrance - 15 mg.\nExcipients:\nstearic acid, silicon dioxide, magnesium stearate.\n* at the time of production.	\N	\N	\N
12	12	Increases physical and mental performance\nProtects the body from the action of free radicals\nIt supports the immune system and reduces the risk of inflammatory diseases\nDeclaration of conformity (not a dietary supplement, state registration is not required)	Scientists of the NSP research center began studying the fruits of the exotic mangosteen fruit in 2003. As a result of research, the Zambroza drink appeared – a non-alcoholic product not only with excellent taste, but also with an incredible ability to neutralize free radicals in the human body, which has a membrane-protective and anti-inflammatory effect. In the USA, this drink is called "Thai Go", but in foreign markets it has the name "Zambroza". The drink contains a mixture of juices of various grape varieties of blueberries, blueberries, raspberries, mangosteen, grape peel and seed extract, including extracts of sea buckthorn, dereza, green tea extract, which have powerful antioxidant properties, as well as apple juice. No wonder the English proverb says: Apple a day, doctor away (the one who eats one apple a day does not need doctors).\nA unique natural drink with excellent taste that does not contain artificial colors, preservatives and flavors. Tested and approved by Brunswick Labs (an independent bioanalytical laboratory for testing, bioanalysis and research of functional foods, food additives and pharmaceuticals).	Cultivated grapes (Vitis vinifera) – berries contain vitamins, organic acids, polyphenols, which have an antioxidant and membrane-protective effect, stabilizing blood capillaries. The greatest value in grapes is not only and not so much the berry itself, as the grains and peel. Grape peel extract contains resveratrol, which has estrogen-like activity and is an antioxidant and oncoprotector.\nBlueberry (Vaccinium corymbosom) – has also received worldwide recognition as a strong antioxidant due to the presence of anthocyanidins, which affect microcirculation, prevent platelet aggregation and improve vision and memory, as well as prevent the destruction of collagen.\nRed raspberry (Rubus idaeus) – contains anthocyanidins and salicylic acid, which is associated with its anti-inflammatory effect. In folk medicine, it is used for sore throats, respiratory, infectious diseases of the lungs and joints, diseases of the bladder and urinary tract.\nMangosteen (Garcinia mangostana) is a fresh fruit "the gift of the Buddha", "the king of fruits", the fruit of the tropical Garcinia tree of the humid tropical forests, has a pearl–white pulp, which has a delicate and pleasant taste. Bioflavonoids were found in it, which are called xanthones (the largest number of them is in the peel). Mangosteen has a powerful antioxidant, anti-inflammatory effect. Mangosteen reduces the clinical manifestations of inflammation: swelling, pain, high fever.\nChinese zamanikha (dereza, wolf berry) (Lycium babarum) – the fruits of this Asian shrub are used in the East for liver and kidney diseases. This plant promotes the production of the antioxidant enzyme superoxide dismutase in the body. Dereza has a weak hypotensive effect, inhibits cholesterol synthesis, prevents fatty liver dystrophy, suppresses the growth of E. coli and the development of candidiasis.\nSea buckthorn (Hippophae rhamnoides) – contains a large amount of vitamins and carotenoids, has a strong antioxidant effect, and also promotes the formation of the enzyme superoxide dismutase, which protects cells from the effects of free radicals.\nGreen Tea extract (Camellia sinensis) – contains catechins capable of protecting membrane lipids and nuclear cell structures (DNA) from oxidation.\nApple juice extract (Malus domestica) – scientifically proven to support an adequate level of immune protection effect.	15 ml of the concentrate contains: American grape juice concentrate (Vitis labrusca) - 1.13 g; ordinary grape juice concentrate (Vitis vinifera) - 1.13 g; blueberry juice concentrate (Vaccinium corymbosom) - 677 mg; raspberry juice concentrate (Rubus idaeus) - 205 mg; juice extract and mangosteen fruits (Garcinia mangostana) - 406 mg; grape skin extract (Vitis vinifera) - 102 mg; common wood extract (Lycium babarum) - 15 mg; sea buckthorn extract (Hippophae rhamnoides) - 15 mg; grape seed extract (Vitis vinifera) - 2.9 mg; green tea extract (Camellia sinensis) - 2.9 mg; apple juice extract (Malus domestica) - 2.9 mg.\nAuxiliary substances: purified water, sodium benzoate.\nEnergy value: 8.55 kcal per 15 ml\nNutritional value (per 15 ml): proteins - 60 mg, fats - 15 mg, carbohydrates - 2.1 g	The drink can be diluted with water, mixed with other drinks and juices, and also drunk undiluted. It is advisable to drink 15-30 ml every day to maintain good tone and energy of your body.	Shake before use.	Store in a cool place at a temperature not higher than +15 ° C. After opening, store in the refrigerator.
13	13	Regulates the hormonal balance of the female body, helps with premenstrual syndrome\nNormalizes metabolic disorders and manifestations of menopause\nSupports the tone of the female genital organs during menopause, protects against osteoporosis\nIt helps with atherosclerosis of the vessels of the brain and heart, reduces blood pressure in women and men\nHelps with impotence, improves psycho-emotional tone and sexual desire	Wild yam (diascorea) has long been used by Mexican women as a contraceptive, as well as with the threat of miscarriage. The beneficial effect of dioscorea on the development of the corpus luteum and the preservation of pregnancy, with early toxicosis of pregnancy, has been established. Wild yams are also used for cramps and cramps associated with premenstrual syndrome. Excess production of the female sex hormone estrogen in the body significantly increases the risk of diseases such as breast, uterine and intestinal cancer. Dioscorea naturally supports a woman's hormonal balance and can prevent excessive estrogen production (for example, in endometriosis). Phytoestrogens, entering a woman's body with food, normalize her hormonal status, regulate the menstrual cycle, eliminate problems associated with pre- and post-climax, maintain the tone of the female genital organs, especially during menopause. The use of dioscorea during menopause protects the female body from osteoporosis. In addition, dioscorea is used for atherosclerosis of the vessels of the brain and heart, to reduce blood pressure in both women and men.\nWild Yam NSP is a phytocomplex, which, in addition to diascorea, includes other plant components that enhance the effect of the formula.\nA unique development of the NSP company that effectively regulates the hormonal balance of women.\nAs part of clinical trials, Wild Yam was used 1 capsule 2 times a day as an additional to the standard therapy of osteoporosis in conjunction with dietary supplements Osteo Plus for 3 months. Result: clinical manifestations (low bone density, lower back pain, muscle stiffness) decreased more markedly in the main group compared to the control group. Moreover, the result was higher in women than in men (probably due to exposure to Wild Yams). Thus, bone density increased in the main group of women – by 15%, in men – by 6.3%, while in the control group – by only 8% in women and 6.2% in men. The pain syndrome in the main group decreased by 34%, in the control group – by 19%.	Wild yam or dioscorea (Dioscorea villosa) – the root contains phytoestrogens (diosgenin and dioscin), natural compounds that are precursors of dihydroepiandrosterone (DHEA), known as the "maternal hormone" or prohormone, from which about two dozen steroid hormones are synthesized in the body. Wild yam has a beneficial effect on the development of the corpus luteum and the preservation of pregnancy, with early pregnancy toxicosis. It is used for spasms and convulsions associated with premenstrual syndrome, due to its ability to dilate blood vessels. Dioscorea naturally supports a woman's hormonal balance and can prevent excessive estrogen production (for example, in endometriosis). Wild yam phytoestrogens normalize a woman's hormonal status, regulate the menstrual cycle, eliminate problems associated with pre- and post-climax, maintain the tone of female genital organs, especially during menopause. The use of dioscorea during menopause protects the female body from osteoporosis. In addition, dioscorea is used for atherosclerosis of the vessels of the brain and heart, to reduce blood pressure in both women and men. It reduces headaches, tinnitus, fatigue, irritability, lowers cholesterol in the blood, improves mood, sleep, memory. Dioscorea also has antispasmodic, choleretic, anti-inflammatory and diuretic effects.\nDamiana sprawling (Turnera diffusa) – the Maya Indians used this plant as an aphrodisiac that helps increase sexual desire. Its active substances contribute to the rush of blood to the pelvic organs, stimulate the activity of the nerve nodes of the spinal cord, promote the release of sex hormones. Damiana is able to relieve tension with anxiety, nervousness, depression, increasing psycho-emotional tone. It is used with a decrease in erectile function and libido. Damiana has a bactericidal effect, is effective in lung diseases. It is recommended for neurasthenia, dysmenorrhea, headaches.\nRed raspberry (Rubus idaeus) – fruits and leaves are used as an anti-inflammatory and antispasmodic agent for diseases of the bladder and urinary tract. The leaves have astringent (fixing), antitoxic, hemostatic effect.\nSarsaparil curative (Smilax officinalis) – the active substances of the root have a diuretic effect, stimulate the production of sex hormones and have a tonic effect on the genitals. It is used for imbalance of sex hormones, premenstrual syndrome, sexual dysfunction, impotence, infertility, skin diseases (eczema, psoriasis, furunculosis), gout and rheumatism.	Dietary supplement Wild Yams NSP is an additional source of steroid saponins.\n1 capsule contains: wild yam root (Dioscorea villosa) - 375 mg; damiana leaves (Turnera diffusa) - 7 mg; raspberry leaves (Rubus idaeus) - 7 mg; sassaparilla roots (Smilax officinalis) - 7 mg.\nAuxiliary substances: microcrystalline cellulose, magnesium stearate, gelatin.\n	Adults take 1-2 capsules 2 times a day with meals. The duration of admission is 3-4 weeks with repeated admission if necessary.	individual intolerance to components, pregnancy, breast-feeding.	\N
14	14	It is an antioxidant, counteracts the oxidation of fat and cholesterol\nPromotes the prevention of cancer, diabetes and cardiovascular diseases\nHas a positive effect on the female reproductive system\nReduces blood clotting, improves peripheral blood circulation\nStrengthens the immune system	Vitamin E is one of the most active antioxidants that protect cell membranes from free radicals. The oxidized form of the vitamin can interact with hydrogen sources, for example, with ascorbic acid, and again pass into the reduced form. Back in 1922, vitamin E was isolated as a substance that determines sexual behavior and reproductive function. Vitamin E from natural vegetable oils has an effect similar to that of the main female hormone progesterone. It increases the blood supply to the reproductive organs and stimulates the production of the hormone progesterone in the ovaries.\nVitamin E is a product of NSP company, a source of vitamin E in the form of d-α-tocopherol.\nPure vitamin E, presented in its most active form and in the optimal dosage for use - 100 IU (100 mcg). It is produced from natural vegetable oils.	Vitamin E is one of the most active fat–soluble food antioxidants, a complex of 4 tocopherols and 4 tocotrienols. α-tocopherol is the most active. Vitamin E controls the synthesis of coenzyme Q10, nucleic acids, proteins, including collagen, a number of enzymes and hormones necessary for the contraction of skeletal muscles, internal organs, such as the esophagus or bladder, myocardium, hemoglobin and myoglobin. With the participation of vitamin E, the synthesis of proteins of the mucous membranes and placenta occurs. Vitamin E protects cell membranes from destruction. It also reduces the level of insulin and triglycerides, blood viscosity, preventing the development of atherosclerosis. Reduces the manifestations of menopausal symptoms. Activates the immune system.	Dietary supplement Vitamin E is an additional source of vitamin E.\n1 capsule contains: vitamin E (d-alpha-tocopherol) - 100 ME (100 mg - 667% of TSA).\nAuxiliary substances: gelatin.	Adults take 1 capsule daily with meals. The duration of admission is 1 month.	individual intolerance to the components of the product, pregnant and lactating.	\N
15	15	It has an antioxidant, immunostimulating effect\nAccelerates recovery and rehabilitation in bacterial and viral diseases\nProvides energy production by participating in the synthesis of ATP	Vitamin C is one of the strongest water-soluble food antioxidants. It binds free radicals, preventing their destructive effect on body tissues. Vitamin C has the ability to increase the activity of other antioxidants, such as vitamin E, which is restored in the presence of vitamin C from the oxidized form. Vitamin C regulates blood clotting and lipid levels, participates in the formation of steroid hormones, in the formation of bone and connective tissue, provides collagen biosynthesis, regulates carbohydrate metabolism. It stimulates the production of interferon, protecting the body from viral infections, participates in the metabolism of histamine, thus reducing the clinical manifestations of allergies.\nVitamin C NSP is a complex product that, in addition to ascorbic acid, includes acerola and rosehip, which are sources of bioflavonoids, including rutin and hesperidin, which strengthen the walls of blood vessels and increase their elasticity.\nA unique phyto-vitamin formula with a high (1000 mg) content of ascorbic acid in combination with extracts of acerola and rosehip fruits. Unlike vitamin C from other manufacturers, this product is presented in a prolonged form, which significantly improves the efficiency of absorption and provides a higher content of ascorbic acid in the blood with a single intake of the product.	Vitamin C is a strong water–soluble antioxidant. Increases the activity of other antioxidants, such as vitamin E, which is restored in the presence of vitamin C from the oxidized form. Regulates blood clotting and lipid levels, participates in the formation of steroid hormones, in the formation of bone and connective tissue, provides collagen biosynthesis, regulates carbohydrate metabolism. It stimulates the production of interferon, participates in the metabolism of histamine, reducing the effect of allergens. In combination with bioflavonoids, it ensures the structural integrity of the capillary walls\nLemon bioflavonoid, hesperidin and rutin – have antioxidant and membrane-protective effects, weak estrogen-like activity. In combination with vitamin C, they strengthen the walls of capillaries and increase their elasticity.\nAcerola or Malpighia glabra – fruits contain vitamin C and other vitamins, flavonoids. It has an antioxidant, capillaroprotective and immunostimulating effect.\nDog rose (Rosa canina) – contains bioflavonoids, tannins, catechins, anthocyanins.It has an anti-inflammatory, anti-sclerotic effect, enhances regeneration processes and hormone synthesis.	Dietary supplement Vitamin C NSP is an additional source of vitamin C and flavonoids.\n1 tablet contains: vitamin C (ascorbic acid) - 1000 mg (1111% of ASP); lemon bioflavonoid - 5 mg (2% of ASP); hesperidin - 5 mg (2.5% of ASP); rutin - 5 mg (16.6% of ASP); acerola fruit extract (Malpighia glabra) - 5 mg; rose hips (Rosa canina) - 5 mg.\nExcipients:\nstearic acid, cellulose, magnesium stearate, dicalcium phosphate, silicon dioxide, shell for vitamin preparations (Carnauba wax, cellulose coating, purified water).	Adults take 1/2 tablet 1 time a day with meals. The duration of admission is 1 month. It is recommended to take 3-4 doses a year.	individual intolerance to the components of the product, pregnant and lactating.	\N
16	16	It has cardioprotective, hypotensive and anticoagulant effects\nIt has antiviral, antibacterial, anthelmintic properties	The healing properties of garlic have been known to people for a long time. Archaeologists have found garlic in the tomb of the Egyptian Pharaoh Tutankhamun. French priests during the Great Plague ate garlic in huge quantities, thanks to which they escaped from a deadly infection. Modern research has proven that garlic is not only a universal antiseptic, but also has a positive effect on the cardiovascular, digestive, and immune systems.\nGarlic from NSP company has antiviral, antibacterial, antifungal, anthelmintic, cardioprotective, hypotensive, blood-thinning effect. Cardiologists prescribe garlic to patients after a heart attack instead of aspirin.\nThe product is manufactured using a patented technology. One tablet is equivalent to 1 clove of garlic (1.2 g), which is the highest concentration of allicin among analogues. At the same time, thanks to a special shell containing chlorophyll, you will not feel the taste of garlic, and there will be no unpleasant smell. The tablet dissolves only in the small intestine, which eliminates irritation of the gastric mucosa, spasm of the bile ducts, liver colic. At the same time, the product retains its activity without encountering hydrochloric acid in the stomach, unlike fresh garlic. Thanks to these features, this product can be given even to children.	Garlic (Allium sativum) – it contains the essential oil allicin, to which it owes a specific smell, taste and powerful antibacterial effect, as well as phytosterols and bioflavonoids. Garlic reduces the level of cholesterol in the blood, has an anticoagulant effect. Garlic reduces blood pressure, improves heart function, has a mild calming effect, reducing the risk of heart attacks and strokes. It exhibits antibacterial activity even against bacteria resistant to antibiotics. Garlic also has antiviral and antifungal effects and is a "natural antibiotic". In large doses, garlic has an anthelmintic effect. It improves the secretory and motor function of the gastrointestinal tract, stimulates the secretion of bile. Garlic has long been famous as a means of increasing potency in men, thanks to improved blood circulation and increased blood flow to the pelvic organs. It is able to protect the body from cancer (especially cancer of the stomach and colon).\nThe patented mixture contains broccoli powder, cabbage, carrots, beets, tomatoes, rosemary and turmeric, which are important for antiseptic, antispasmodic and choleretic effects, as well as hesperidin and bioflavonoids with antioxidant activity.	Dietary supplement Garlic is an additional source of allicin.\n1 tablet contains: garlic (Allium sativum) - 419 mg; calcium (in dicalcium phosphate) - 51.5 mg (5.15% of TSA); patented mixture: broccoli cabbage (Brassica oleracea) - 16.2 mg, carrot (Daucus carota) - 5.0 mg, beetroot (Beta vulgaris) - 5.0 medicinal rosemary leaves (Rosmarinus officinalis) - 5.0 mg, tomato fruits (Solanum lycopersicum) - 5.0 mg; turmeric root (Curcuma longa) - 5.0 mg, garden cabbage (Brassica oleracea) - 5.0 mg; bioflavonoids of orange and grapefruit - 2.5 mg; hesperidin - 1.25 mg.\nAuxiliary substances:microcrystalline cellulose, croscarmellose, stearic acid, silicon dioxide, hydroxypropyl methylcellulose phthalate, shellac (glazer), copper sodium chlorophyllin.	Adults take 1 tablet a day with meals. The duration of admission is 1 month.\n	individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
17	17	Strengthens connective tissue and structure of skin, nails and hair\nIt has an antifungal effect.	The appearance of a person is the youthfulness of the skin, the shine of healthy hair, beautiful and well–groomed nails. Unbalanced nutrition, metabolic disorders, the consequences of severe infectious diseases, stress, hard contaminated water, detergents have a negative impact on the condition of the skin, hair and nails. It is necessary to combine properly selected cosmetics with the protection of the body from the inside, using the richest natural formulas created by nature. The plant complex of H.S.N. (Eng. HSN: hair – hair, skin – skin, nail – nails) is rich in iodine, silicon, flavonoids, which scientists call "youth factors". It has antiviral, antibacterial, antifungal, and anti-inflammatory effects. It stimulates the regeneration of connective tissue, improves blood supply to the skin, preserves its elasticity and natural hydration, improves the structure of nails, supports hair nutrition, giving them shine and a healthy appearance.\nHP from NSP is a unique phytoformula for metabolic support of the skin, hair, nails and thyroid gland.	Rhodymenia palmata is a red seaweed used for food. It contains a complex of polysaccharides, bioelements (sulfur, iodine, bromine). It exhibits antiviral, antibacterial and antifungal activity. There is a lot of iodine in the plant, so eating it improves the condition of the thyroid gland. Polysaccharides bind and remove toxins from the gastrointestinal tract and strengthen connective tissue (bones, hair, nails, skin and teeth).\nHorsetail (Equisetum arvense) – has an anti-inflammatory, bactericidal, anthelmintic effect, is a source of silicon, thanks to which it stimulates the regeneration of connective tissue and the activity of endocrine glands.\nMedicinal sage (Salvia officinalis) – increases the secretory activity of the gastrointestinal tract, which contributes to the digestion of food. It has anti-inflammatory, antimicrobial, soothing effect.\nRosemary officinalis (Rosmarinus officinalis) – has antiseptic, choleretic and tonic effect, relieves stress and nervous tension. It copes well with microorganisms such as Staphylococcus, Streptococcus, E. coli and yeast fungi.	The dietary supplement HRN is an additional source of flavonoids, silicon, contains alginic acids, essential oils, rosemary acid.\n1 capsule contains: Rhodimenia palmata -164 mg; horsetail grass (Equisetum arvense) -123 mg; sage leaves (Salvia officinalis) - 82 mg; rosemary leaves (Rosmarinus officinalis) - 41 mg.\nExcipients: gelatin.	Adults take 1 capsule daily with meals. The duration of admission is 1 month. According to the manufacturer's recommendations, to increase the effectiveness, you can increase the intake to 3-6 capsules per day.	individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
18	18	Adaptogen, increases physical and mental performance\nRelieves nervous tension, migraines, anxiety and panic attacks\nIt has an antidepressant effect, provides a positive mood and deep sleep \nRegulates blood sugar, suppresses uncontrolled appetite.	Frequent stress and uncertainty in the future can cause depression, disrupt mood and sleep. Some people, without realizing it, struggle with stress by eating excessive amounts of food, others seek solace in alcohol, falling into an even more dangerous addiction. In the fight against stress and depression, doctors rely on pharmaceuticals (tranquilizers and antidepressants), which often have a large number of side effects. However, it is possible to overcome stress, find peace of mind, and normalize sleep using biocorrectors, one of which is tryptophan.\nIndications for the use of the complex are: premenstrual anxiety and depression, alcohol dependence, obsessive-compulsive disorder, hyperactivity and attention deficit disorder in children, Down syndrome pain syndromes (including fibromyalgia), chronic fatigue syndrome, insomnia. It can be used to reduce appetite, for people who want to quit smoking, it reduces the neurological phenomena associated with smoking cessation.\n5 HP Power NSP is a unique, unparalleled product for the effective normalization of the nervous system, the effects of stress and various forms of addiction. Unlike pharmaceuticals, there are no side effects.	Eleutherococcus prickly, "Siberian ginseng" (Eleutherococcus senticosus) – is an adaptogen, increases the activity of the central nervous system (CNS): enhances visual acuity, increases mental and physical performance, reduces fatigue during exercise, increases basic metabolism and appetite, normalizes blood sugar levels.\nSuma (Pfaffia paniculata) – restore hormonal balance, have an analgesic effect and regulate blood sugar. Slows down the growth of tumor cells. An effective adaptogen that supports the body's immune system, has antifungal and antibacterial effects, helps to cope with stress, relieves pain, relieves chronic fatigue syndrome. Reduces the level of cholesterol in the blood.\n5-hydroxytryptophan – is formed from the essential amino acid tryptophan, which is a precursor of serotonin and increases its synthesis in the body and in the central nervous system. In turn, the sleep hormone melatonin is formed from serotonin, which regulates the daily cycle (day – night). It is prescribed as an antidepressant for insomnia (taken before bedtime). It suppresses appetite (taken before meals). It is also necessary for seasonal emotional disorders, aggressiveness, obsessive-compulsive disorder, propensity to drug or alcohol addiction. The indication for its use is a low level of serotonin, which is characterized by the following symptoms: insomnia and sleep apnea, chronic headache, bulimia and obesity, narcolepsy, fibromyalgia. Tryptophan deficiency in women causes increased symptoms associated with menstruation, and in men increases irritability and aggressiveness. Its deficiency causes anemia, sterility, leads to hair loss.\nZinc is a part of antioxidant enzymes, enhances cell division, and stimulates the immune system.\nVitamin B6 – promotes the conversion of 5-HTP into serotonin, increases the efficiency of the brain.	Dietary supplement 5 HP Power NSP is an additional source of vitamin B6 and zinc containing eleutherosides.\n1 capsule contains: Eleutherococcus prickly root (Eleutherococcus senlicosus) - 341.1 mg; bark of the sumac root (Pfaffia paniculata) - 70 mg; 5-hydroxytryptophan (5-HTP) - 35 mg (4.4% of ASP); zinc (in zinc gluconate) - 3.4 mg (28.3% of ASP); vitamin B6 (pyridoxine hydrochloride) - 3 mg (150% of TSA).\nAuxiliary substances: magnesium stearate, gelatin.	Adults take 1 capsule daily with meals in the morning. The duration of reception is 3-4 weeks.\n	individual intolerance to dietary supplements, pregnancy, breast-feeding, increased nervous excitability.	\N
19	19	It has a calming effect on the central nervous system, improves sleep\nReduces nervous tension, tension headaches	Troubles at work, conflicts in the family, financial difficulties and life difficulties are just some of the factors of psychoemotional stress that a person faces every day. As a result – emotional instability, insomnia, anxiety, unexpected panic attacks, lethargy, irritability, a tendency to frequent diseases. For a person experiencing stressful conditions, metabolic support of the body and, first of all, the nervous system is necessary. The complex with Valerian (Eng. H – Nors (hops), V – Valeriana (valerian), P – Passiflora (passion flower) – a reliable remedy for anxiety, temporary emotional disorders and insomnia. It has a calming effect, strengthens the central nervous system during stress, neurasthenia, menopause, hypertension. Reduces the feeling of fear, tension headaches, cramps and muscle spasms in sciatica, neuralgia.\nThe complex with valerian is a unique phytoformula, unlike other similar sedatives, it also has the ability to reduce the feeling of fear, headaches, cramps and muscle spasms in sciatica, regulates the phases of sleep and its quality. Unlike tranquilizers, the Complex with valerian has no side effects.	Valerian officinalis – the root has a soothing, anticonvulsant, antispasmodic effect. It is used for nervous excitement, insomnia, neuroses, angina pectoris, initial hypertension, menopause, migraine-like headaches, hysteria, increased thyroid function. Helps to get rid of panic attacks, muscle cramps caused by overexertion, menstrual cramps, to weaken the craving for smoking.\nPassionflower red-white or passion flower (Passiflora incarnata) – used as a mild sedative that does not reduce the ability to concentrate attention. The Incas brewed strengthening tea from the fruits of passionflower. Passionflower is useful for conditions of anxiety, tension, headaches and insomnia. It is effective for frequent asthma attacks, involuntary seizures, menopausal anxiety and high blood pressure. Relieves spasms of smooth muscles and has a hypotensive effect. It is used as a sedative for chronic alcoholism, neurasthenia, insomnia, menopausal disorders.\nCommon hops (Humulus lupulus) – used as an analgesic for kidney disease, cystitis and frequent urge to urinate, urinary incontinence, insomnia, as a sedative, neurasthenia, as well as to calm the central nervous system, especially with nervous excitement, as an analgesic, antispasmodic, neuralgia and sciatica. The extract from hop cones has strong estrogenic activity.	Dietary supplement Complex with valerian is an additional source of flavonoids, contains valerian acid.\n1 capsule contains: Valerian officinalis root - 162 mg; aboveground parts of red and white passionflower (Passiflora incartanta) - 130 mg; hop cones (Humulus lupulus) - 98 mg.\nAuxiliary substances: gelatin	Adults take 1 capsule 2 times a day with meals.	individual intolerance to the components, pregnancy, breast-feeding.	\N
20	20	Detoxicant, promotes the neutralization and elimination of procancerogens and carcinogens from the body.\nInhibits the development of human papilloma virus (HPV), causes the death of tumor cells infected with HPV\nSuppresses the growth of estrogen-dependent tumors in women and men.	In 1992, it was reliably established that there was an inverse relationship between the high level of consumption of cruciferous vegetables (various types of cabbage, radish, turnip, rutabaga) and the incidence of tumors of the small and large intestine, as well as tumors of the breast and uterus in women and prostate cancer in men. Scientists believe that in order to obtain a beneficial effect, it is necessary to consume more than 900 grams of leafy greens daily. A reasonable alternative is the use of extracts or individual biologically active ingredients of cruciferous. Indole-3-carbinol increases the activity of detoxifying enzyme cytochrome P-450 liver cells, inhibits the development of human papillomavirus. Target organs for HPV are the mammary gland, organs of the anogenital region (pereanal region, vulva, vagina, cervix), as well as the mucous membrane of the larynx and bronchial tree. Promotes the death of virus-infected tumor cells and suppresses the growth of estrogen-dependent tumors in women and men (prostate cancer). Indole-3-carbinol can be used for fibrocystic mastopathy, it has no side effects, which makes its long-term use possible.\nIndole-3-carbinol from NSP is a unique phytoformula, a rich source of indole–3-carbinol.	Broccoli cabbage (Brassica oleracea) is rich in indole-3-carbinol (see below), sulforaphane, sinigrin. Sulforaphane is able to prevent, delay the growth of benign and malignant neoplasms (increases the ability of the immune system to fight cancer cells), along with sinigrin (prevents the proliferation of cancer cells, stopping their division. Of all cultivated plants, broccoli seed seedlings are the most rich in sulforaphane, which contain 50 times more of this substance than mature vegetables! It is an antioxidant, in addition, broccoli contains substances that can effectively resist the spread of the herpes virus.\nIndole-3-carbinol – increases the activity of detoxification enzymes of foreign substances, sulforaphane increases the activity of detoxification enzymes in liver cells, and also increases the content of a key intracellular antioxidant – glutathione. The oncoprotective effect of indole-3-carbinol is manifested in relation to the reproductive organs of women (primarily the uterus and mammary glands), the reproductive organs of men, the gastrointestinal tract, pancreas and thyroid glands. Indole-3-carbinol helps to inhibit the development of human papillomavirus (HPV) and stops the formation of papillomatous formations prone to growth and malignancy (transition from benign to malignant).	Dietary supplement Indole-3-Carbinol is an additional source of indole-3-carbinol.\n1 capsule contains: broccoli inflorescence powder (Brassica oleracea var. italica) - 270 mg, indole-3-carbinol - 110 mg, broccoli germ and seed powder (Brassica oleracea var. italica) - 100 mg, magnesium stearate (vegetable) - 15 mg, silicon dioxide - 10 mg, capsule of hypromelose - 100 mg.\nExcipients: magnesium stearate, silicon dioxide, gelatin.	Adults take 1 capsule 2 times a day with meals.	individual intolerance of components, pregnancy, breast-feeding.	\N
21	21	Restores the level of iron in the blood without causing irritation of the gastrointestinal mucosa\nEnhances immune activity\nIncreases energy production in the mitochondrial respiratory chain	Iron plays an important role in the work of our body. Its deficiency is quite common in both children and adults, which may be due not only to its deficiency in the diet, but also to low absorption in the gastrointestinal tract, as well as large iron losses, which are associated with bleeding and chronic blood loss. Iron deficiency can be manifested by a decrease in immunity, increased fatigue, cause atrophic gastritis, gingivitis, dryness of the mucous membrane of the mouth and tongue and other clinical symptoms. Iron Chelate will help to overcome the iron deficiency condition. Increases energy production, supports the activity of the immune system, carries oxygen. Restores the level of iron in the blood in anemia, promotes the accumulation of oxygen in the muscles.\nThe chelated form of 2-valent iron is well absorbed, does not cause constipation and irritation of the gastrointestinal mucosa.	Iron is directly contained in the composition and participates in the work of important groups of enzymes of the body, is part of hemoglobin, which binds and transfers oxygen from the lungs to organs and tissues. In addition, iron is found in muscle protein, which allows you to accumulate and then spend oxygen in muscle tissue, increasing physical performance and preventing fatigue. Finally, iron is part of the enzymes of the mitochondrial respiratory chain, which help to produce energy, promotes detoxification of the body.\nIron strengthens the immune system, prevents hair loss, the appearance of gray hair, brittle nails, the formation of wrinkles on the skin. And this is not a complete list of reasons why it is important to avoid iron deficiency conditions.\nVitamin C – helps the absorption of iron.\nCalcium – added to this product to reduce the effects of antagonism, because iron reduces the absorption of calcium.\nThe product contains 5 herbal ingredients that improve the assimilation and tolerability of the product, complementing its action.	Dietary supplement Iron Chelate is an additional source of iron and vitamin C, contains calcium.\n1 tablet contains: iron (gluconate, chelate) - 25 mg (250% of ASP -male, 139% of ASP - female); vitamin C (ascorbic acid) - 50 mg (55.6% of ASP); calcium (chelate / dicalcium phosphate) - 64 mg (6.5% from ASP); phosphorus - 35 mg (4.4% of ASP); dog rose hips fruit concentrate (Rosa canina) - 5.0 mg; curly sorrel root (Rumex crispus) - 1.0 mg; thyme leaves (Thymus vulgaris) - 1.0 mg; mullein leaves bear's ear (Verbascum thapsus) - 1.0 mg; ground parts of the medium stellaria (Stellaria media) -1.0 mg.\nExcipients: cellulose, magnesium stearate.	Adults take 1 tablet a day with meals. The duration of admission is 1 month. It is recommended to take 3-4 doses a year. If necessary, the reception can be repeated.	individual intolerance to the components of the product, pregnancy and lactation.	\N
22	22	Source of iodine. Provides normal thyroid function.\nImproves metabolism.	Iodine is an important trace element necessary for the formation of thyroid hormones that regulate the work of the entire body. Low levels of these hormones can negatively affect both the physical condition and the intellectual abilities of a person. This is especially true for children. Iodine deficiency in the diet leads to the development of hypothyroidism, and then to more severe clinical consequences. In Russia, a significant part of the territory consists of regions with natural iodine deficiency, so you need to take iodine daily.\nNatural iodine of brown algae in the composition of Kelp compensates for the lack of this element in the volume of daily needs. Kelp affects the contractility of the heart muscle, prevents the development of rickets, osteoporosis, caries, brittle nails, hair. It has a restorative effect. Kelp can be prescribed for diseases caused by iodine deficiency, thyroid diseases, atherosclerosis, coronary heart disease.\nThe raw materials for the production of Kelp are collected in an ecologically clean area off the coast of Scotland.	The composition of the product includes brown algae of two types.\nAscophyllum nodosum (Ascophyllum nodosum) is a brown alga from the fucus family, lives in the northern seas, forms a symbiosis with fungi.\nKelp or seaweed (Laminaria digitata) is a brown, edible alga containing up to 25-30% alginates.\nKelp is a natural source of iodine (200 mcg), contains alginic acids, macro– and microelements (iron, phosphorus, calcium, magnesium, barium, potassium, sulfur, etc.) are contained in a small amount.	Dietary supplement Kelp is an additional source of iodine, contains soluble dietary fiber (alginates).\n1 capsule contains: brown algae (Ascophyllum nodosum and Laminaria digitata) - 525 mg.\nAuxiliary substances: magnesium stearate, silicon dioxide, gelatin.	Adults take 1 capsule daily with meals. The duration of admission is 1 month. After 2-3 months, the reception can be repeated.	individual intolerance to components, conditions in which iodine preparations are contraindicated, pregnancy, breast-feeding.	\N
23	23	It is a part of cell membranes, is a membrane protector.\nSupports the work of the central nervous system, heart, liver, kidneys, lungs.\nIt is a hepatoprotector, reduces the manifestations of liver obesity and reduces the risk of cirrhosis.	Lecithin NSP is a unique mixture of lecithins from soybean oil.\nPhospholipids are the most important ingredients that are necessary for the body as a building material of cell membranes, they are important as transporters of fat–soluble substances in the body, are part of bile, contribute to the absorption of fat in the intestine and the assimilation of fat-soluble substances and vitamins A, D, E and K. Phospholipids are very necessary during pregnancy and lactation, as they participate in formation of the child's brain and nervous system. They help to restore the structure of the liver and lungs, prevent the development of cirrhosis and fatty infiltration of the liver, reduce the risk of cholelithiasis. They stabilize the level of triglycerides in the blood, are effective in the prevention of atherosclerosis, improve the functioning of the brain, cardiovascular system, liver, kidneys.\nThe usual daily human diet contains about 5 g of phospholipids, whereas the daily need for them ranges from 7 to 15 g. Therefore, it is necessary to regularly take phospholipids, the source of which is Lecithin NSP, additionally.\nTaking Lecithin NSP is the best way to activate memory and analytical functions of the brain, get rid of depression. It improves the condition and quality of life of patients with multiple sclerosis.	Lecithin (from Greek lekithos – yolk) is a building material for cell membrane renewal. It is necessary for the transmission of nerve impulses and the work of the entire nervous system. Insufficient intake of lecithin leads to irritability, fatigue, nervous exhaustion and can cause dementia, Parkinson's disease, multiple sclerosis and other diseases. The content of lecithin in the brain is the highest and amounts to 30%, the nervous system – 17%, the liver – 16%, the heart – 10%.\nLecithin has a wide range of effects on the physiological functions of the body: restores the structure of the liver and lungs, regulates the production of bile, prevents the development of cirrhosis with alcohol abuse, is effective in the prevention of atherosclerosis, removes excess cholesterol from tissues and blood vessels, stabilizes the level of triglycerides in the blood, protects against excess body weight, is necessary in the diet of pregnant and lactating women, since it participates in the formation and normal development of the child's brain and nervous system. Lecithin is one of the lipotropic factors that prevent fatty liver infiltration. Lecithin is required for the production of hormones and for the normal metabolism of fats and cholesterol. Lecithin is an antioxidant that prevents the formation of highly toxic free radicals in the body.\nLecithin NSP is a lecithin from soybean oil, which contains about 40% phospholipids (207 mg per capsule).	Dietary supplement Lecithin NSP is an additional source of lecithin.\n1 capsule contains: soy lecithin - 560 mg, gelatin - 240 mg.\n*Soy fat fraction — does not contain phytoestrogens, which are only in the protein fraction.	Adults take 2 capsules 2 times a day with meals. The duration of admission is 1-1.5 months.	individual intolerance to the components, pregnancy, breast-feeding.	\N
24	24	Hepatoprotector, protects the liver from the effects of toxins and free radicals, improves liver function.\nEnhances the regeneration of liver cells.\nNeutralizes toxins, enhances detoxification processes in the body.	The liver is the most important organ that performs many functions. It is a depot of fat-soluble vitamins, iron, glycogen and other nutrients. The liver produces bile, which helps the intestines digest food, and plays a key role in detoxification. Almost all harmful substances entering our body and formed in the process of metabolism are neutralized in the liver. There are many factors that can cause liver disorders: foods that carry the remnants of hormones and antibiotics, medications, alcohol entering the body from the outside, toxins or formed in the body. Hepatoprotectors can significantly support liver function. The Liv Guard complex is a powerful tool for restoring and supporting liver function, protects it from the effects of free radicals, helps neutralize toxins, and stimulates protein synthesis. It has a membrane-protective, lipotropic, antioxidant, anti-inflammatory effect, enhances regeneration processes, has an antisclerotic effect, an oncoprotector.\nLiv Gard from NSP is an effective, unparalleled hepatoprotector. Contains ingredients with a synergistic effect: milk thistle, dandelion, choline, inositol, beta-carotene, vitamin C and iron.\nWithin the framework of clinical trials, the effectiveness of the use of this dietary supplement has been proven in patients with chronic hepatitis, hepatosis and cirrhosis of alcoholic genesis, fatty hepatosis, HIV infection in combination with chronic viral hepatitis, hepatitis A and C (not in acute form). It can be used for toxic liver lesions, chronic hepatitis, liver cirrhosis, cholecystitis, biliary dyskinesia.	Beta-carotene – provitamin A, is an antioxidant, has an effect on the growth and differentiation of cells (important for their functions), improving the regeneration of liver cells, reduces the risk of cancer.\nVitamin C is one of the most important antioxidants\nIron is a part of oxidases, which are involved in detoxification of substances, in the composition of enzymes of the antioxidant system.\nMilk thistle seed extract or milk thistle (Silybum marianum) – contain flavolignans, collectively referred to as silymarin, which have a pronounced hepatoprotective and antioxidant effect, protecting cell membranes and enhancing the regeneration of liver cells. Silymarin also has an anti-inflammatory effect.\nDandelion officinale (Taraxacum officinale) – has antiviral, fungicidal, anti-carcinogenic, antidiabetic effect. It is used for hepatitis, cholecystitis, cholelithiasis, has a choleretic and antispasmodic effect. Improves digestion, appetite, metabolism, enhances milk production in nursing women.\nCholine is a vitamin–like substance (vitamin B4), is a part of bile acids, phospholipids, participates in detoxification. It is a hepatoprotector, normalizes lipid metabolism, reduces the fat content in the liver.\nInositol is a vitamin–like substance (vitamin B8), together with choline, it is part of phospholipids. Activates energy metabolism, participates in protein metabolism, increases neuromuscular excitability. It has a membrane-protective, lipotropic (reduces the formation of fat), anti-atherosclerotic, soothing and hypnotic effect.	Dietary supplement Liv Guard is an additional source of flavolignans, vitamin C, beta-carotene, iron, contains choline, inositol.\n1 tablet contains: 143 mg of flavolignans (silybin) (477% of the daily requirement).\n1 tablet contains: β-carotene - 10,000 IU (6.8 mg 136%), vitamin C - 240 mg (267%), iron (in iron fumarate) - 5 mg (50% male, 27.8% female), milk thistle seed extract (Silybum marianum) - 179 mg, dandelion root (Taraxacum officinale) - 152 mg, choline (bitartate) - 60 mg (12%), inositol – 60 mg (12%).\nExcipients: cellulose, stearic acid, maltodextrin, magnesium stearate, silicon dioxide, tablet shell (Carnauba wax, cellulose coating, purified water).	Adults take 1 tablet a day with meals for 3-4 weeks. If necessary, the reception can be repeated.	individual intolerance of components, pregnancy, lactation in women.	\N
25	25	Being a source of dietary fiber, it harmonizes the digestive processes.\nImproves intestinal motility and peristalsis, promotes its cleansing, prevents constipation.\nIt has a prebiotic effect for the intestinal microflora.\nReduces cholesterol and blood sugar levels.\nIt has an oncoprotective, antioxidant effect, binds and removes toxins.	Dietary plant fibers are the most important components of the human diet. They provide more complete digestion of food and better assimilation, reduce the metabolic load on the liver. At the same time, dietary fibers contribute to the formation of fecal masses and stimulate the motor activity of the large intestine, which is important for the prevention of constipation. Dietary fibers have the ability to bind and remove a significant amount of toxic and carcinogenic substances, heavy metals and radionuclides from the gastrointestinal tract. They also bind and remove cholesterol, bile acids, glucose from the body, thereby regulating their balance in the body. Many dietary fibers are digested by enzymes of intestinal microorganisms and become their food (prebiotics).\nThe structure of the Loklo complex (Eng. Low Cholesterol – low cholesterol) includes soluble and insoluble dietary fibers, which contain a number of biologically active substances and are necessary to ensure the digestive and motor function of the intestine. The complex includes grapefruit and orange flavonoids and hesperidin, which have antioxidant activity. In weight loss programs, it is recommended to take Loclo 30-60 minutes before meals in order to suppress appetite.\nThanks to its jelly-like consistency, Loclo envelops all the folds of the intestine, effectively cleaning their surface. As part of clinical trials, the effectiveness of the combined use of dietary supplements Loklo (1 tablespoon per glass of water 1 time a day), Burdock (1 capsule 2 times a day) and Echinacea (1 capsule 2 times) in chronic pancreatitis with a duration of treatment of 3 weeks has been proven. The total assessment of symptoms (abdominal pain, bloating, stool disorder, heartburn, the need for diet and antispasmodics) showed greater effectiveness and better dynamics compared with the use of standard pancreatin therapy. In addition, as a result of the use of this therapy, cholesterol levels significantly decreased in patients.	Plantain ovate or psyllium (Plantago ovata) – contains the largest amount of mucus (up to 40%), which has a protective – enveloping effect on the mucous membrane of the gastrointestinal tract. The seeds are used as a mild laxative for spastic and atonic constipation and as an enveloping agent for chronic colitis. The husk of psyllium seeds contains a large amount of insoluble and soluble plant fibers (cellulose, lignin, hemicellulose), some of which can be digested by intestinal microorganisms. When in contact with water, the husk of plantain, binding water, swells and creates volume, stimulating intestinal motility and softening stools, which helps to get rid of constipation, helps with irritable bowel syndrome, hemorrhoids. Plant polysaccharides act as sorbents, binding toxic substances, heavy metals, cholesterol, fatty acids, carcinogens, which reduces the risk of colon cancer.\nApple pectin – actively binds water, swelling and increasing in volume. Pectin binds and removes cholesterol, heavy metals, toxic substances, enterotoxins, carcinogens from the body, reduces the risk of colon cancer. Pectin plays an important role in lowering cholesterol levels in the blood and slowing glucose absorption, which is important in diabetes.\nOat bran (Avena sativa) – among other types of bran contains the largest amount of fiber – 15.4%. They improve intestinal motility, reduce the absorption of cholesterol and glucose, reducing their content in the blood, remove toxic substances and heavy metals from the body.\nGuar gum (Cyamopsis tetragonoloba) – reduces the absorption of sugars and cholesterol, reduces the level of sugar and cholesterol in the blood. It is used in the treatment and prevention of diabetes and atherosclerosis. It has a laxative effect, normalizes the intestinal microflora.\nAcacia seyal (Acacia seyal) – resin (gum arabic) is a water-soluble polysaccharide. Increases the viscosity of the intestinal contents, which slows down digestion and reduces the absorption of glucose and lipids. It helps to reduce appetite, lowers cholesterol, triglycerides in the blood, binds toxic substances and removes them from the body.\nChinese cinnamon or cassia (Cinnamomum cassia) – the bark has antiseptic (bactericidal and fungicidal), antispasmodic effect, reduces blood sugar levels.\nBroccoli cabbage (Brassica oleracea) is rich in vitamins, carotenoids, and indoles. Sulforaphane has an antibacterial effect, killing bacteria resistant to antibiotics, and also inhibits the development of tumors.\nTurmeric (Curcuma longa) – has antispasmodic, choleretic effect, reduces intoxication in liver diseases, improves the functioning of the gallbladder.\nRosemary officinalis (Rosmarinus officinalis) – has a choleretic and tonic effect, suppresses the vital activity of staphylococcus, streptococcus, E. coli.\nBeetroot (Beta vulgaris) is a natural antiseptic, used in violation of the gastrointestinal microflora.\nCommon tomato (Solanum lycopersicum) – contains antioxidants, reduces the risk of cancer, including stomach, pancreas, colon.\nCarrot ordinary (Daucus carota) – has antiseptic and anti-inflammatory effect.\nCabbage (Brassica oleracea) – promotes the elimination of cholesterol from the body, reduces blood sugar and is very effective in combating constipation and hemorrhoids. Indoles have antitumor activity.\nBioflavonoids of orange, grapefruit and hesperidin – have antioxidant activity	Dietary supplement Loklo is an additional source of flavonoids and dietary fiber.\n1 tablespoon (9 g) contains: fructose - 2.17 g (6.18% of ASP); husk of plantain seeds (Plantago ovata) - 2225 mg; apple pectin - 1503 mg; oat bran (Avena sativa) - 752 mg; guar gum (Cyamopsis tetragonolobus) - 752 mg; resin acacia (Acacia seyal) - 752 mg; cinnamon bark (Cinnamomum cassia) – 291mg; broccoli flowers (Brassica oleracea) - 20 mg; turmeric root (Curcuma longa) - 6 mg; rosemary leaves (Rosmarinus officinalis) - 6 mg; red beet (Beta vulgaris) - 6 mg; tomato (Solanum lycopersicum) - 6 mg; carrot (Daucus carota) - 6 mg; cabbage leaves (Brassica oleracea) - 6 mg; bioflavonoids of orange, bioflavonoids of grapefruit - 3.13 mg (1.32% of ASP); hesperidin – 1.57 mg\nExcipients: citric acid, apple flavor, potassium bicarbonate.	Adults take 1 tablespoon of powder 1 time a day, dilute in 1 cup of cold boiled water. Additional liquid consumption is mandatory (1-2 glasses).\nIn weight loss programs, in order to suppress appetite, it is recommended to take Loclo 30-60 minutes before meals.	individual intolerance to components, pregnancy, breast-feeding.	\N
26	26	It is necessary for the formation of bone and connective tissue.\nIt plays an important role in the accumulation of energy in the cell.\nParticipates in the regulation of the nervous system.\nReduces blood clotting, reducing the risk of thrombosis.	Magnesium (macronutrient) is one of the most important bioelements, which is involved in the work of more than 300 enzymes. Magnesium is the most important electrolyte, participates in the production of ATP, is necessary for all energy–consuming reactions in the body. Magnesium is important for supporting fetal development in pregnant women, the work of the heart, blood vessels, central nervous system, large intestine, kidneys, and participates in the formation of connective tissue. Magnesium deficiency is indicated by sleep disorders, increased fatigue and irritability, unexplained anxiety, spasms of the calf muscles. In more severe cases, cardiac arrhythmias, constipation, and the development of premenstrual syndrome are noted. The need for magnesium increases with infections, polyuria, alcohol consumption, laxatives and diuretics, osteoporosis, connective tissue dysplasia, type 2 diabetes, arterial hypertension, urolithiasis, bronchial asthma, hyperactivity syndrome in children, with great mental (including stress) and physical exertion (primarily the queue of athletes). In such cases, normal nutrition cannot provide the physiological need for magnesium, and it must be taken additionally.\nMagnesium Chelate is a source of magnesium. Each capsule contains 100 mg of pure magnesium, which is the optimal single dose. Magnesium is in a chelated compound with organic malic and citric acid, which ensures maximum absorption of this macronutrient. Magnesium in the form of citrate more effectively reduces the risk of vascular calcification and the formation of kidney stones.	Magnesium (in malate and citrate) is necessary for energy production in the cell, glucose oxidation, participates in the metabolism of fatty acids, proteins and carbohydrates, supports the tone and contraction of muscle tissue, ensures the transmission of nerve impulses and regulates the nervous system, helps with asthenia, migraines, dizziness, night cramps, sleep disorders. Reduces bronchospasm, reduces the secretion of histamine and acetylcholine in bronchial asthma.\nIt has an antiarrhythmic, hypotensive, sedative effect. Reduces blood clotting and platelet aggregation. Improves the condition of premenstrual syndrome and during menopause.\nPromotes the formation of connective tissue, an increase in the content of elastin in the vascular wall, is part of the bone tissue.\nAs an electrolyte, magnesium promotes the promotion of nutrients into the cells of the body and the withdrawal of metabolic products from them, maintaining the water balance of cells and stabilizing acidity (pH).	Dietary supplement Magnesium Chelate is an additional source of magnesium.\n1 capsule contains: magnesium (in citrate, malate) - 100 mg (25% of TSA).\nAuxiliary substances: magnesium stearate, cellulose, silicon dioxide, gelatin.	Adults take 1 capsule 3 times a day with meals. The duration of admission is 1 month.	individual intolerance of components, pregnancy, breast-feeding.	\N
27	27	Enhances liver detoxification function\nProtects liver cells and promotes their regeneration\nIt has an anti-inflammatory effect\nIncreases bile secretion	The metabolism in the body and the processes of detoxification largely depend on the work of the liver. Increased toxic and metabolic load on the liver, increased viral load, oxidative stress and excessive accumulation of free radicals and fat oxidation products trigger the mechanisms of damage to liver cells, which leads to their death. One of the most effective means of supporting liver health is milk thistle. Mankind has known about the healing properties of this plant for liver diseases for more than 2000 years. To date, its antioxidant, antitoxic, anti-inflammatory effects have been well studied, it prevents fibrosis of connective tissue, promotes its recovery. Milk thistle NSP enhances the detoxification function of the liver, protects liver cells from toxins and pharmaceuticals, stimulates cell regeneration, bile production, normalizes metabolism. It can be recommended both for toxic liver damage, viral hepatitis, liver failure, and more widely as a prophylactic for all people associated with toxic substances, living in unfavorable environmental conditions, and alcohol abusers.\nMilk thistle contains a high (37 mg) effective dose of flavolignans (silybin) in the composition of milk thistle. It is recommended for use, including in acute forms of hepatitis.	Milk thistle or milk thistle (Silybum marianum) is a plant whose seeds contain silymarin, which has a hepatoprotective effect in acute and chronic liver intoxication.\nThe normal functioning of the liver stably supports metabolism and the immune system, provides protection for the body in hormone-dependent tumors. Therefore, doctors recommend taking milk thistle for the prevention of diseases of the female reproductive organs. The first symptoms of liver dysfunction may be dermatological problems in the form of various skin rashes. Many phytotherapists use this herb for psoriasis, periods of exacerbation of which are clearly associated with deterioration of liver function. Finally, milk thistle has a beneficial effect on digestion, due to the production of bile necessary for the digestion of fat and the absorption of fat-soluble vitamins.	Dietary supplement Milk Thistle NSP is an additional source of flavolignans.\n1 capsule contains: milk thistle (Silybum marianum), seeds - 320 mg; milk thistle (Silybum marianum), seeds (extract) - 25 mg.\nAuxiliary substances: microcrystalline cellulose, magnesium stearate, gelatin.	Adults take 1 capsule daily with meals for 1 month. If necessary, the reception can be repeated.	individual intolerance of components, pregnancy, breast-feeding.	\N
28	28	Restores short-term and long-term memory, increases concentration.\nReduces anxiety, depression, reduces the excitability of the nervous system.\nRestores vascular elasticity, improves cerebral circulation.\nProvides prevention of neurodegenerative diseases and rehabilitation after stroke and concussions.	For a full life, a person needs the ability to perceive and process information, which is associated with memory, attention, creativity (higher nervous activity, cognitive function). The support of cognitive function largely depends on the nutrition and oxygen supply of nerve cells. Violation of cerebral circulation inevitably leads to deterioration of brain function in old age, decreased concentration, and sometimes memory loss. Mind-Max supports and restores cognitive potential. It has a beneficial effect on the nervous system, reduces its excitability, reduces blood viscosity, improves the elasticity of the vascular wall. It is recommended in rehabilitation programs after stroke, for neurodegenerative diseases of the brain. Also, high loads in the educational process require additional nutrition for the brain, so this product can be safely recommended to schoolchildren and students.\nMind Max – this patented formula contains a special form of magnesium – magnesium l-threonate, which, unlike others, easily overcomes the blood-brain barrier and is maximally absorbed by brain cells. Enhanced with ginkgo biloba and Gotu Cola.	Magnesium in the form of l-threonate is able to significantly increase the transmission of impulses in the nervous system, restore brain activity. Due to the special form, the magnesium content in the cerebrospinal fluid and its assimilation by nerve cells increases rapidly, which is especially important for the elderly. Magnesium normalizes the activity of the nervous system, reduces excitability. It provides energy production in nerve cells. It has a positive effect on asthenia, migraines, dizziness, night cramps, sleep disorders.\nGotu kola or Centella asiatica – stimulates the production of the neurotransmitter acetylcholine, which has a beneficial effect on higher nervous activity. Gotu kola has a calming effect in nervous disorders and anxiety states, reduces the manifestation of symptoms of depression. Reduces blood pressure and heart rate, increases hemoglobin levels, strengthens blood vessels, improves cerebral circulation and oxygen supply to the brain, thereby increases mental abilities, accelerates thinking, improves memory and concentration. In Asian countries, this plant is called "food for the brain." It is also used as a stimulating and tonic that increases potency.\nBacopa small–leaved (Bacopa monniera) - stimulates the brain, strengthens memory, improves concentration, attention, gives clarity of mind, contains active substances bacosides, which improve cerebral circulation. Protects blood vessels by providing oxygen to the brain. Relieves fatigue after strenuous mental activity, preventing stress, eliminates headaches. It helps with atherosclerosis, Alzheimer's disease, Parkinson's disease. Helps to establish a balance between the left and right hemispheres of the brain. Increases performance, learning ability, improves short-term and long-term memory, prevents amnesia (memory loss). Expands and activates mental activity, the ability to memorize and reproduce information, works well in combination with ginkgo biloba, has antioxidant activity.\nGinkgo biloba (Ginkgo biloba) – has an antispasmodic effect in violation of blood flow with spastic pain, increases blood flow to the brain and limbs, regulating the tone and elasticity of blood vessels from the largest arteries to the smallest capillaries, reduces blood viscosity. Ginko biloba is equally effective both in pediatric pathology (encephalopathy, dementia, lack of concentration, neurocirculatory dystonia) and in geriatric practice (senile dementia, Alzheimer's disease, decreased visual acuity, hearing loss, tinnitus). Students taking ginkgo biloba medications have improved academic performance.	Dietary supplement Mind-Max is an additional source of magnesium.\n1 capsule contains: magnesium L-threonate - 23 mg (5.8% of ASP); aboveground parts of Gotu kola (Centella asiatica) -16.7 mg; Bacopa monniera leaf extract -10.0 mg; Ginkgo biloba leaves - 6.7 mg.\nAuxiliary substances: magnesium stearate, cellulose, gelatin.	Adults take 3 capsules 2 times a day with meals. The duration of admission is 1 month.	individual intolerance to components, pregnancy, breast-feeding.	\N
29	29	It has anti-inflammatory, antibacterial, antifungal, immunomodulatory effect\nStimulates the gastrointestinal tract and endocrine system	The healing properties of the wonderful morinda plant (another name is Noni) have long been known to the inhabitants of Polynesia, China and other tropical regions. Morinda fruits are eaten by locals. Almost all parts of the plant (root, fruits and leaves) are used in folk medicine. Morinda has long been used to improve digestion and stimulate the gastrointestinal tract, treat diseases of the respiratory system, strengthen immunity.\nMorinda from NSP is a universal phytoformula of Active Longevity.	Lemon–leaved morinda (Morinda citrifolia) - the versatility of the action of morinda is due to the content of more than 100 biologically active substances in it. The anti-inflammatory (rheumatism, polyarthritis), antioxidant, immunomodulatory (the alkaloid xeronin activates the immune system) actions of morinda have been proven, it helps to slow down the growth of tumors (cancer of the respiratory and urinary systems). Morinda has antifungal and antibacterial activity, including against salmonella and shigella. Morinda also has a calming effect, reduces cravings when quitting smoking and other forms of addiction, supports reproductive and sexual functions, has an analgesic effect (arthritis), improves the condition of the skin, prevents its aging. It has a hypotensive property. The plant is used for bacterial and viral infections (including Epstein-Barr virus, Crohn's disease), disorders of the endocrine system (diffuse goiter, etc.). With regular consumption, lemon-leaved morinda prevents aging of the body.	Dietary supplement Morinda is an additional source of polyphenolic compounds.\n1 capsule contains: lemon-leaved morinda (fruit) (Morinda citrifolia) - 426 mg.\nExcipients: gelatin, water (as part of a gelatin capsule).	Adults take 5 capsules a day with meals. The duration of admission is 1 month. If necessary, the reception can be repeated.	individual intolerance of components, pregnancy, breast-feeding.	\N
30	30	It is a source of organic sulfur for the metabolic processes of the body, the formation of connective tissue.\nIt is part of the structural components of cartilage tissue.\nProvides the formation of collagen.\nIt has an anti-inflammatory effect in inflammation of joints, ligaments, muscles.\nIncreases antioxidant protection and detoxification, strengthens the immune system.\nParticipates in the synthesis of glutathione, ensuring the stability of proteins.\nIt has an anti-allergenic effect.\nReduces the need for insulin and reduces the complications of diabetes mellitus.\nIncreases the effectiveness of complex antiparasitic programs.	Sulfur belongs to the number of macronutrients, i.e. the need for it is measured in grams. And this is understandable: it is part of amino acids, a number of vitamins, enzymes, hormones. Sulfur reduces the need for insulin, stabilizes blood sugar levels. It is involved in the formation of immunity and detoxification system. Sulfur is part of the connective (cartilage) tissue and stimulates the production of articular fluid. Sulfur is necessary for the biosynthesis of collagen, which helps to increase the strength of ligaments and joint mobility, skin elasticity, wound healing. It is necessary for the formation of keratin, the structural basis of hair and nails. Sulfur, has anti-inflammatory and analgesic effect, is especially effective in the defeat of the musculoskeletal system (arthritis, myositis, sprains, tendovaginitis, bursitis, injuries). Strengthens muscles, reduces muscle pain and eliminates muscle cramps. It counteracts the formation of scoliosis during the period of active growth.\nThe consumption of sulfur in the diet is not normalized and it is considered that it is quite enough in our diet. But, as practice shows, very often there is a physiological deficiency of sulfur, which requires its additional appointment.\nMethylsulfonylmethane is a bioavailable source of sulfur.\nMSM from NSP is a product that will make up for the body's need for this macronutrient.\nA monocomponent product, a source of sulfur in the easily digestible form of methylsulfonylmethane.	Methylsulfonylmethane is used for allergies, lung diseases and bronchial asthma, arthrosis and arthritis, systemic lupus erythematosus, diabetes, skin diseases, burns, scarring, acne. The use of MSM helps to maintain a healthy state of teeth, skin, nails and hair, eliminates pain syndrome in systemic inflammatory diseases, especially effective in the defeat of the musculoskeletal system. MSM NSP can also be recommended to athletes after physical exertion to relieve numbness, pain and muscle cramps.\nMSM not only does not give allergic reactions, but on the contrary, has an anti-allergenic effect. Moreover, the positive effect is noted for allergies associated with household, food and drug allergens. MSM actively acts against a number of parasites, such as giardia, trichomonas and roundworms, blocking the contact of pathogens with the mucous membrane.	Dietary supplement MSM NSP is an additional source of sulfur in organic form.\n1 tablet contains: methylsulfonylmethane - 750 mg (255 mg of sulfur in organic form).\nExcipients: microcrystalline cellulose, maltodextrin, silicon dioxide, magnesium stearate, cellulose, stearic acid, tablet shell (Carnauba wax, cellulose coating, purified water).	Adults take 1 tablet 2 times a day with meals. The duration of admission is 1.5 months.	individual intolerance of components, pregnancy, breast-feeding.	\N
31	31	Activates intestinal motility, ensures stool regularity\nEnhances the production of digestive juices and bile\nPromotes normalization of intestinal microflora\nIt has an anti-inflammatory and antiseptic effect	A unique phytoformula for systemic control of constipation. It is not addictive.\nViolation of evacuation of the contents of the large intestine and constipation associated with it is a rather unpleasant and unsafe phenomenon. To combat constipation, as a rule, medications are used that relate to stimulants of motor activity of the large intestine. However, these remedies do not always effectively solve the problem of constipation. A systematic approach is often required, in which it is necessary not only to affect the motility of the large intestine, but also to have an antispasmodic effect, stimulate the secretion of fluid and mucus, which helps to soften the contents of the rectum, to combat the consequences of chronic constipation – inflammation, violation of microbiocenosis, intoxication. This kind of complex action is characteristic of Neyche Lux. The ingredient composition of this product determines the complex effect on the gastrointestinal tract: it enhances the production of digestive juices and bile, restores intestinal motility, normalizes the intestinal microflora. This herbal complex additionally has an antiseptic, anti-inflammatory, antispasmodic effect, enhances mucus secretion, which facilitates defecation.	Buckthorn pursha or joster (Rhamnus purshiana) is a woody plant, the dried and aged bark of which the American Indians used as a laxative and called "sacred bark". Its active ingredients affect the receptors of the colon and enhance its peristalsis (without acting on other parts of the intestine), which causes the laxative effect of buckthorn. The effect of buckthorn occurs 8-10 hours after ingestion, so it should usually be prescribed at night. Buckthorn is one of the most effective herbal remedies for chronic constipation. It reduces fermentation and putrefaction processes in the intestine, has antiseptic, anti-inflammatory and analgesic effects, stimulates secretion, helps to remove helminths, restores the tone of the colon. It is indicated for varicose veins, liver diseases, cholelithiasis, hemorrhoids, anal fissures.\nLicorice naked (Glycyrrhiza glabra) – known for its enveloping and mild laxative effect. Licorice has antibacterial, anti-inflammatory and antispasmodic effects on smooth muscles. Enhances the secretion of mucus, protecting the intestinal epithelium. It has a strong estrogen-like effect, so it is not recommended for pregnant women.\nCayenne pepper (Capsicum annuum) – has antiseptic and anti-inflammatory effect, dilates blood capillaries, relieves spasm, accelerates scarring of ulcers, stimulates mucus secretion, prevents fermentation, effectively eliminates gas formation.\nMedicinal ginger (Zingiber officinale) – reduces inflammation and pain.\nMedicinal rhubarb (Rheum officinale) – has a tonic, antibacterial, pronounced laxative effect. It is used for habitual constipation, sluggish intestinal motility, copious accumulation of gases, hemorrhoids.\nWheatgrass creeping (Agropyron repens) –has an enveloping and mild laxative effect. Promotes the secretion of mucus.\nRed clover (Trifolium pratense) is an immunostimulant, has antispasmodic, antitoxic, antiseptic, secretolytic effect.	Dietary supplement Neyche Lax is an additional source of anthraquinones and glycyrrhizic acid.\n1 capsule contains: joster bark (Rhamnus purshiana) - 196.1 mg; licorice root (Glycyrrhiza glabra) - 65.4 mg; Capsicum annuum fruits - 21.8 mg; ginger root (Zingiber officinale) - 21.8 mg; rhubarb root (Rheum officinale) - 10.9 mg; wheatgrass rhizomes creeping (Agropyron repens) - 10.9 mg; red clover flowers (Trifolium pratense) - 10.9 mg.\nExcipients: cellulose, gelatin.	Adults take 1 capsule 3 times a day with meals.	it is not recommended for pregnant and lactating women, with individual intolerance to the components of the product.	\N
32	32	It has antioxidant, tonic, adaptogenic, immunomodulatory, anti-inflammatory and membrane-protective effects\nNormalizes blood pressure, relieves headaches, joint, menstrual pains\nImproves the function of the central nervous system\nImproves the healing of skin and mucous damage	Noni is the Tahitian name for the fruit of the shrubby plant Morinda Citrifolia. The Noni fruit is edible, but has an unpleasant smell and bitter taste, so it is used mainly in the form of an extract or with the addition of sweet juices. Numerous studies have shown that Noni has incredible healing properties. It strengthens the immune system, regulates metabolism, restores damaged cells. Noni juice can be used to normalize blood pressure, relieve neurosis, depression, chronic fatigue syndrome, pain, especially headache, joint, menstrual. It has an analgesic effect in inflammatory diseases, joint and headaches, as well as an anti-inflammatory effect. With regular use of Noni Juice, people stop getting colds, note an improvement in mood, which is probably due to the action of endorphins. No wonder many Americans have included Noni juice in their daily diet.\nNoni juice undergoes short-term pasteurization, which allows you to preserve the beneficial properties of the fruit and at the same time ensure the freshness of the product within 30 days after opening the bottle.	Noni – more than 100 biologically active substances have been isolated in fruits that have antibacterial activity (including against salmonella and shigella). The vitamin C content in fresh fruits is 128 mg per 100 g. Noni juice can be used to: normalize blood pressure, relieve neurosis, depression, chronic fatigue syndrome, pain, especially headache, joint, menstrual. Noni juice has a central analgesic effect. Enhances the production of enzymes and bile, improves digestion, has an anthelmintic effect. Oncoprotector, accelerates healing. With regular use, it prevents aging.\nExtract of the skin and seeds of red grapes (Vitis vinifera) – contains a large amount of tannins and polyphenols, which have a powerful antioxidant and membrane-protective effect, stabilizing blood capillaries. Resveratrol has estrogen-like activity.\nVitamin C is one of the main antioxidants.	Dietary supplement Noni juice is an additional source of organic acids and proanthocyanidins.\n2 tablespoons (30 ml) contain: fruit concentrate (pear concentrate, pineapple concentrate and syrup, red grape concentrate, peach concentrate, natural flavor, water, pectin) - 3.81 g; Noni fruit powder (Morinda citrifolia) - 983 mg; extract from the skin of red grapes (Vitus vinifera) - 63 mg; vitamin C - 5.2 mg (5.7% of TSA).\nAuxiliary substances: purified water, malic, tartaric and citric acid.	Adults take 2 tablespoons (30 ml) a day with meals. Shake before use.	individual intolerance to the components of the product, pregnancy, breast-feeding.	After opening, store the bottle in the refrigerator.
33	33	Strengthens immune and antioxidant defenses\nParticipates in the regulation of carbohydrate metabolism, contributing to the utilization of glucose\nHelps to reduce blood lipids and body fat	For protein biosynthesis, a person needs 20 amino acids. Of these, 12 can be formed in the body, and the remaining 8 are considered irreplaceable and must enter the body with food (lysine and threonine are absolutely indispensable for humans). However, often a person cannot provide himself with replaceable amino acids (glutamic acid and serine are absolutely interchangeable), which must also come with food. Animal proteins, the sources of which are dairy products, eggs, meat and fish, are the most useful for the human body in terms of amino acid composition. Vegetable proteins have a completely different amino acid composition. Among animal proteins, one of the best are whey proteins, which, unlike meat and casein, are easily and quickly digested and absorbed into the gastrointestinal tract.\nNutri Bern is a valuable source of easily digestible protein. The cocktail can be used during and after severe surgical operations, when traveling, when doing fitness and sports, as well as as a substitute for 1 meal in weight loss programs. Nutri Bern regulates carbohydrate and fat metabolism: promotes the restoration of pancreatic cells and insulin production, improves glucose utilization, increases basal metabolism, reduces blood sugar and lipids, blocks the absorption of carbohydrates in the gastrointestinal tract, normalizes weight.\n1 serving of the cocktail contains 12.3 g of protein, which is 17.6% of the average daily requirement of an adult. The product also includes a complex of herbs that contribute to weight loss, and the chelated form of chromium provides glucose utilization.	Garcinia cambogia is a tree whose fruits contain hydroxyl citric acid, which suppresses lipogenesis, reduces the formation of fatty acids and cholesterol, increases the formation of glycogen, enhances thermogenesis. Garcinia extract is able to reduce fat production by 40-70% after eating and accelerates the breakdown of fat. At the same time, the transport of fatty acids into the mitochondria increases, followed by their oxidation. Hydroxyl citric acid suppresses appetite, affecting the neurons of the hypothalamus responsible for the feeling of hunger. Garcinia works especially well in combination with chromium. Under the influence of hydroxyl citric acid, serotonin is produced in the human body, which affects sleep, appetite and mood. With a decrease in the amount of food taken, the level of serotonin in the body decreases, and garcinia is able to raise it. Garcinia extract is indicated for people suffering from increased appetite and bouts of depression.\nEleutherococcus prickly (Eleutherococcus senticosus) – is an adaptogen, increases performance, reduces fatigue during exercise, increases basic metabolism and appetite, normalizes blood sugar levels.\nGymnema sylvestre – reduces glucose absorption in the gastrointestinal tract and stimulates the regeneration of pancreatic cells that produce insulin, which leads to an increase in insulin production, a decrease in blood sugar.\nRhodiola rosea – has a nootropic, adaptogenic and anti-stress effect, supports performance and suppresses appetite, reduces cravings for "jamming" stress.\nAromatic clove (Syzygium aromaticum) – has antiseptic, antibacterial, fungicidal, antiviral effect.\nConjugated linoleic acid (CLA) is a substance of natural origin, belongs to the irreplaceable PUFA of class ω–6. CLA increases lean muscle mass by an average of 1% per week. It has been found that CLA also prevents the deposition of fat in fat cells, while activating its burning in muscle cells, which helps to increase energy production and build muscle mass.\nChromium is a trace element that is part of the complex that ensures the maintenance of normal blood glucose levels. Together with insulin, it acts as a regulator of blood sugar levels, ensures normal insulin activity.\nAromatic clove (Syzygium aromaticum) – has a bacteriostatic and fungicidal effect on the types of fungi that cause skin disease\nWhey protein (concentrate and isolate) – in terms of the content of essential amino acids, it approaches the ideal protein, is fast and easily digested in the gastrointestinal tract.	Dietary supplement Nutri Bern is an additional source of protein, chromium, hydroxyl citric acid, eleutherosides.\n1 scoop (20 g) contains: whey protein concentrate (80% protein) - 8.92 g; whey protein isolate (93% protein) - 4.40 g; natural French vanilla powder - 1.99 g; non-dairy whitener in sunflower oil - 1.49 g; calcium caseinate (92% protein) - 1.16 g; Garcinia cambogia fruit skin extract - 496 mg; Eleutherococcus senticosus root - 496 mg; maltodextrin - 500 mg; xanthan gum -199 mg; Gymnema sylvestre leaves - 124 mg; Rhodiola rosea root extract - 124 mg; conjugated linoleic acid (CLA) - 80 mg; carnation flowers (Syzygium aromaticum) – 17.4 mg; chromium (in amino acid chelate) - 29.8 mcg (59.6% of TSA).\nExcipients: sucralose.	Adults take 1 measuring spoon, pre-dissolved in a glass of water or juice, 1 time a day. The duration of admission is 1 month. In weight loss programs, take 2 scoops without a "slide" (about 40 g of powder, which contain 23 g of protein, 10 g of carbohydrates, 3 g of fat, 160 kcal). Take a cocktail 1 time a day, replacing 1 meal.\nAttention! A cocktail cannot completely replace traditional food, so you should not replace it with more than one meal a day.	individual intolerance of components, pregnancy, breast-feeding.	\N
34	34	It has antiviral and antibacterial activity\nIt has an antiparasitic and antifungal effect\nRegulates the heart rate, strengthens the walls of blood vessels, has an antispasmodic effect\nProvides antioxidant protection\nImproves the quality of life in immunodeficiency conditions and AIDS	The complex of substances contained in olive leaves helps to maintain the elasticity and stability of the walls of blood vessels, prevents the formation of blood clots. Olive leaf extract has been proven to be effective as an antiviral agent, which also has bacteriostatic (including resistant strains of streptococcus and staphylococcus) and antifungal action in candidiasis. It also helps with chronic viral diseases, for example, herpes. The antiviral effect of olive leaves is realized through blocking the reproduction of viruses and stimulating the production of killer T-lymphocytes that destroy virus-infected cells. Olive leaves can be prescribed for influenza, inflammatory diseases of the musculoskeletal system (arthritis), chronic fatigue syndrome, fibromyalgia, tropical fever, cholelithiasis, colitis, prostatitis. Olive leaf tea is used as a remedy for fever.	European olive (Olea europaea) – the leaves contain oleuropein, which has an antispasmodic effect – relieves vascular spasm, including coronary, lowers blood pressure, restores heart rhythm, lowers cholesterol in the blood. Olive leaves have antiviral, antibacterial, antiparasitic, antifungal effect. Prevents chronic fatigue syndrome, disruption of the immune system.	Dietary supplement Olive Leaves is an additional source of flavonoids, contains oleuropein.\n1 capsule contains: extract from the leaves of the European olive (Olea europaea) - 420 mg.\nExcipients: cellulose, magnesium stearate, maltodextrin, gelatin.	Adults take 1-3 capsules daily with meals. The duration of admission is 1 month.	individual intolerance, pregnancy, breast-feeding.	\N
35	35	Regulates fat metabolism and cholesterol in the blood\nIt is part of the membranes of brain cells and the retina of the eye\nIt has a beneficial effect on the immune, nervous and cardiovascular systems\nProvides the production of anti-inflammatory prostaglandins\nReduces platelet aggregation and blood clotting	Omega-3 PUFAs are a family of polyunsaturated fatty acids (PUFAs) that are not formed in the human body, are indispensable and should come from animal and plant foods. The higher fatty acids of this family: eicosapentaenoic acid (EPA) and docosahexaenoic acid (DHA), are an important building material of the membranes of nerve cells and nerve fibers, the retina of the eye, from which bioregulators are formed in the body – prostaglandins and leukotrienes. α-linolenic acid, from which EPA and DHA are synthesized in the human body, is found in flax (44-61%), ginger (35-39%), mustard (14%) oil. However, only 10% of EPA and about 1% of DHA are formed from it. Therefore, higher omega-3 fatty acids should be obtained from animal products. There are especially many of them in the fat of fish that live mainly in cold seas (salmon, sardines, herring, anchovies, mackerel – these are the varieties that NSP uses to produce its Omega-3 PUFA).\nOmega-3 PUFA NSP is a high–quality fish oil product for daily use, necessary to support the life-supporting systems of the body: cardiovascular, immune, nervous.\nOmega-rich fish feed on shellfish and small fish, and therefore accumulate a lot of heavy metals during their lifetime. The NSP company uses high-quality raw materials from reliable, proven suppliers, the amount of harmful substances in which is several times less than the permissible safety standards, and strictly controls its quality with the help of high-precision tests.	Omega-3 PUFA reduces cholesterol and triglycerides in the blood, normalizes blood pressure and is a preventive measure for cardiovascular diseases, prevents the development of thrombosis. They slow down the development of tumors and are an effective means for the prevention of oncological diseases. The positive effect of Omega-3 in the treatment of skin diseases was noted. Reduce the manifestations of allergies, accelerate the healing of wounds and scars, help with peptic ulcer of the stomach and duodenum. Omega-3 helps with arthritis, arthrosis, osteochondrosis, and patients note a reduction in pain and restoration of joint mobility from the first (3-5) days of taking the drug. This is due to the production of anti-inflammatory prostaglandins and leukotrienes, which have a powerful anti-inflammatory effect. The antiarrhythmic effect of Omega-3 PUFA was detected. They are necessary for maintaining the normal state of the retina and vision function, for normal brain activity, improve brain performance and memory. Omega-3 is recommended for migraines and stress. Omega-3 PUFAs are especially necessary for the developing fetus to form organs and tissues, they must be added to the child's diet to support growth and full development.	1 capsule contains: edible fish fat - 1208 mg; eicosapentaenoic acid (EPA) content - 180 mg (30%); docosahexaenoic acid (DHA) content - 120 mg (17% of ASP); vitamin E (d-alpha tocopherol) content - 1 ME (1 mg) (6,7% of TSA)\nAuxiliary substances: gelatin	Adults and children over 14 years of age: 1 capsule 2 times a day with meals. The duration of admission is 1 month.	individual intolerance of components, pregnancy, breast-feeding, hemorrhagic syndrome.	Store in a dry, light-protected place at a temperature not higher than +25 ° C. After opening, store the jar in the refrigerator.
36	36	It is a source of calcium, magnesium, copper, zinc and boron\nProvides support for the osteoarticular apparatus\nPromotes the prevention of osteoporosis, injuries of the musculoskeletal system	Bone strength depends not only on calcium and vitamin D. At least 6 vitamins and 10 bioelements are required to ensure healthy bone tissue.\nOsteo Plus is a complex product containing vitamins: D, B6, B12, helping to restore collagen, bioelements: calcium, magnesium, phosphorus, iron, zinc, manganese, copper, boron, involved in the formation of bone and connective tissue, including bones, joints, ligaments, tendons. Phytoingredients enhance the effect of the product as an osteoprotector and additionally have an anti-inflammatory, analgesic, antiseptic effect. To combat osteoporosis, we recommend you the "Health of Your Bones” program, one of the products in which is Aosteo Plus.\nUnique phyto-vitamin-mineral formula.\nThere are results of clinical trials of taking Osteo Plus as an adjunct to the standard therapy of osteoporosis in conjunction with dietary supplements Wild Yams. Result: clinical manifestations (low bone density, lower back pain, muscle stiffness) decreased more markedly in the group where dietary supplements were taken compared to the control group.	Vitamin C – plays an important role in the synthesis and maturation of collagen, vitamin D metabolism. Vitamin C deficiency reduces the formation of vitamin D and increases the risk of osteoporosis.\nVitamin D – increases absorption of calcium and phosphorus in the gastrointestinal tract and reabsorption of calcium in the kidneys.\nVitamin B6 – together with copper is involved in the formation of collagen. Vitamin B6 deficiency often causes hip fractures.\nVitamin B12 – reduces homocysteine, a risk factor for osteoporosis.\nBoron – regulates the activity of vitamin D, and hormones that regulate the formation of bone tissue.\nCalcium is the main component of the bone matrix.\nMagnesium is part of the structure of the bone matrix, regulates the formation of bone tissue, the growth of hydroxylappatite crystals – the main mineral component of bones and the function of parathyroid hormone, reduces age–related bone loss, increases bone mineral density.\nManganese – participates in the formation of bone and connective tissue, determines the growth and strength of bone.\nCopper is involved in the formation of collagen. Copper deficiency in children causes growth retardation, skeletal disorders, inhibition of bone growth, fractures due to a decrease in bone mineral density.\nZinc – bone contains 30% of all zinc contained in the body, plays an important role in the regeneration of bone tissue. Zinc deficiency provokes bone destruction, a decrease in the effectiveness of vitamin D in the body.\nHorsetail (Equisetumarvense) – has an anti-inflammatory, bactericidal effect, is a source of silicon, thanks to which it stimulates the regeneration of connective and bone tissue.\nPapaya fruits (Carica papaya) – help to restore connective tissue in osteochondrosis, arthroarthritis, cerebral and spinal arachnoiditis.\nSeed parsley (Petroselinum crispum) – stimulates the activity of smooth muscles, has an antioxidant antispasmodic, analgesic and antibacterial effect.\nPineapple juice (Ananas comosus) – reduces joint and muscle pain.\nValerian officinalis root - has a soothing, antispasmodic effect.\nBetaine is a vitamin–like substance, a derivative of choline, involved in detoxification. Helps to maintain joint and liver health.\nLicorice root (Glycyrrhiza glabra) – has an anti-inflammatory effect, is indicated for rheumatic joint pain.	* Silicon content — 3.64 mg per capsule (12% of TSA).\nExcipients: cellulose, magnesium stearate, stearic acid, microcrystalline cellulose, tablet shell (Carnauba wax, cellulose coating, purified water).	Adults and children over 14 years of age – 1 tablet 1 time a day with meals. The duration of admission is 1 month. It is recommended to take 2-3 doses per year. If necessary, you can repeat it.	individual intolerance of components, pregnancy, breast-feeding.	\N
37	37	Supports the work of the genitourinary and reproductive systems in men.\nHarmonizes the nervous and endocrine systems, increases vitality.\nPsychogenic impotence in men, the manifestation of menopause in women, increases sexual desire.\nOncoprotective effect.	Achiv with Yohimbe NSP is a combination of phytoingredients that increase libido, endurance, and strengthen men's health. Designed to stimulate sexual potency and enhance reproductive ability in men, and is also an excellent tool for the harmony of sexual relations. Improves nutrition of the prostate gland, reduces nervousness, spasm of blood vessels, improves blood supply to the pelvic organs. Strengthens the cardiovascular and nervous systems, relieves stress. Regulates hormonal balance and manifestations of menopause in women.\nAn original, unparalleled product. Complex multidimensional action in erectile dysfunction. Unlike pharmacy analogues, it does not contain steroids. It is indicated for prostate cancer.	Yohimbe (Pausinystalia johimbe) — increases motor activity, increases heart rate, increases blood pressure. When using yohimbine, there is a rush of blood to the pelvic organs, sexual activity increases. At the same time, the activity of the nerve nodes of the spinal cord, which control erection, is stimulated. The indication for use is psychogenic impotence in men, the manifestation of menopause in women. It is contraindicated in hypertension, hepatic and renal insufficiency.\nSerenoa creeping or With palmetto (Serenoa repens) — has a diuretic and tonic effect. With regular intake, it stimulates the work of the endocrine system, sex glands, increases sperm secretion, increases libido and has an anti-inflammatory effect in infections of the genitourinary system, prevents prostate enlargement. It is used for enuresis, prostatitis, prostate adenoma. There is no toxicity.\nGotu Kola or Centella asiatica (Hydrocotyle asiatica) is used as a stimulating and tonic that increases potency. Gotu kola has a calming effect for nervous disorders. Improves blood circulation and oxygen supply to the tissue.\nDamiana sprawling (Turnera diffusa) — has a stimulating or soothing effect depending on the dose, has a diuretic, bactericidal effect. It is known for its ability to relieve tension in case of anxiety, nervousness, weakness, depression, exhaustion caused by emotional or sexual tension. With regular intake, it has a tonic effect on the genitals, increases libido. Damiana is recommended for neurasthenia, dysmenorrhea, inflammatory diseases, headaches.\nEleutherococcus prickly (Eleutherococcus senticosus) is an adaptogen, excites the central nervous system, increases mental and physical performance, reduces fatigue during physical exertion, increases basal metabolism. It is used to regulate hormonal balance, strengthen the heart and nervous systems, and for impotence.\nSassaparil officinalis (Smilax officinallis) is a drug that accelerates tissue regeneration, a diuretic. It has a restorative effect with a decrease in male potency, maintains the hormonal balance of the body and increases metabolism.\nAnnual pepper or cayenne, or chili (Capsicum annuum) — has an antiseptic and anti-inflammatory effect. Improves the functioning of the cardiovascular system, dilates blood capillaries, relieves vascular spasm and blood pressure, stimulates mucus secretion. It has an inhibitory effect in prostate cancer.\nGarlic seed (Allium sativum) — has an antimicrobial, antifungal effect, improves the functioning of the cardiovascular system, increases potency in men, thanks to improved blood circulation and increased blood flow to the pelvic organs.\nStellaria mediata or woodlouse (Stellaria media) — has antimicrobial activity against Staphylococcus and shigella, has a diuretic effect.\nHorsetail (Equisetum arvense) — has a diuretic, anti-inflammatory effect, is a source of silicon, thanks to which it stimulates the endocrine glands and the regeneration of connective tissue.\nNiacin (vitamin PP) — expands small blood vessels, improves microcirculation, provides normal permeability and stability of blood vessels. It plays a role in the regulation of the functional state of the central nervous system. It has antioxidant properties.	Dietary supplement Achiv with Yohimbe NSP is an additional source of phytosterols, vitamin PP (B3); and alkaloids (yohimbine).\n1 capsule contains: the bark of the Yohimbe root (Pausinystalia yohimbe) — 60.0 mg; the fruits of the Serenoa palm (Serenoa repens) — 53.4 mg; the aboveground part of Gotu kola (Hydrocotyle asiatica) — 43.6 mg; the leaves of damiana spreading (Turnera diffusa) — 38.8 mg; Eleutherococcus root (Eleutherococcus senticosus) — 30.0 mg; the root medicinal sassaparilla (Smilax officinallis) — 24.2 mg; annual pepper fruits (Capsicum annuum) — 15.7 mg; seed garlic (Allium sativum) — 15.7 mg; aboveground parts of medium stellaria (Stellaria media) — 9.7 mg; stems and cones of horsetail (Equisetum arvense) — 1.6 mg; niacin (vitamin PP or B3) — 10.0 mg (50%).\nExcipients: microcrystalline cellulose, gelatin.	Adults take 1 capsule 1 time a day with meals. The duration of admission is 1 month. If necessary, the reception can be repeated.	individual intolerance of components, arterial hypertension.	\N
38	38	It has antispasmodic and anti-inflammatory effects.\nEnhances the secretion of digestive enzymes and bile.\nImproves digestion.\nReduces gas formation.	AG-X (Anti-Gas complex) is a complex product that restores the functioning of the gastrointestinal tract. Normalizes the regularity of the stool by reducing spasm, bile secretion and improving peristalsis.\nA unique phytoformula based on a patented blend of papaya fruits, ginger roots, wild yams and other plants.	Papaya (Carica papaya) — contains the proteolytic enzyme papain, and also has an anti-inflammatory effect.\nMedicinal ginger (Zingiber officinale) — improves the digestion of food, suppresses the synthesis of pro-inflammatory prostaglandins, reducing inflammation and pain.\nPeppermint (Mentha piperita) and spearmint (Mentha spicata) — has choleretic, antiseptic and antitoxic effects, reduces the tone of smooth muscles, dilates blood vessels, relieves spasms and relieves pain, enhances the separation of digestive juices, has a calming effect.\nWild yam or Dioscorea (Dioscorea villosa) is an anti—inflammatory agent, has antispasmodic and diuretic effects.\nCommon fennel (Foeniculum vulgare) — increases the secretion of digestive juices, has antispasmodic, vasodilating, choleretic and antibacterial effects, regulates intestinal motility.\nDong Kwa or Chinese Angelica (Angelica sinensis) — has antispasmodic and anti-inflammatory effects, enhances intestinal motility, relieves pain, stimulates the secretion of bile and pancreatic juice, has a sedative effect.\nCatnip (Nepeta cataria) — improves digestion, stimulates appetite, reduces inflammation, relieves stress.	Dietary supplement AG-X is an additional source of papain, phytosterols, contains essential oils.\n1 capsule contains: papaya fruit (Carica papaya) — 100 mg; ginger root (Zingiber officinale) — 85 mg; peppermint leaves (Mentha piperita) — 77 mg; wild yam root (Dioscorea villosa) — 75 mg; fennel seeds (Foeniculum vulgare) — 72 mg; angelica root Chinese (Angelica sinensis) — 24 mg; mint leaves and flowers (Mentha spicata) — 20 mg; cat mint leaves (Nepeta cataria) — 18 mg.\nExcipients: cellulose, gelatin.	Adults take 1 capsule 3-4 times a day with meals.	individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
39	39	Reduces the level of cholesterol in the blood, prevents the development of atherosclerosis.\nImproves the condition of patients with diabetes mellitus.\nReduces the severity of inflammation.\nStimulates the healing of erosions, wounds.\nImproves the condition during menopause, has an oncoprotective effect.	Universal monophytopreparation of Active Longevity, contains protein, chlorophyll, plant estrogens with high hormonal activity.	Alfalfa (Medicago sativa) is a legume plant, rich in protein, vitamins, phytoestrogens, chlorophyll. Promotes the healing of erosions, ulcers, open wounds, helps in the fight against infection, increases the elasticity of the arteries, reduces cholesterol, triglycerides and blood sugar, increases hemoglobin, prevents the development of atherosclerosis and complications of diabetes. It is indicated for diseases of the gastrointestinal tract, liver, chronic and acute cystitis, prostatitis, arthritis, rheumatism. Alfalfa helps restore normal estrogen levels, is necessary for women during menopause and for the prevention of breast cancer.	Dietary supplement Alfalfa NSP contains flavonoids, tannins.\n1 capsule contains: aboveground parts of alfalfa (Medicago sativa) — 340 mg.\nAuxiliary substances: gelatin.	Adults take 1 capsule 3 times a day with meals. The duration of admission is 1 month.	individual intolerance of components, pregnancy, breast-feeding.	\N
40	40	Increases the body's defenses and stimulates the immune system.\nIt has anti-inflammatory and anti-allergic effects.\nPrevents the reproduction of bacteria and fungi.	A universal monophytopreparation of Active Longevity from the concentrate of the inner part of the aloe leaves. Certified by the International Scientific Council on Aloe. The gentle production process allows you to maintain a high level of mucopolysaccharides — 7,000 mg / l.	Aloe Vera (Aloe barbadensis) — the name of the most popular of the known varieties of aloe comes from the name of the island of Barbados in the Caribbean Sea. There are more than 350 species of this plant, but it is Aloe Barbadensis (Aloe Vera) that is endowed by nature with healing properties. Chinese residents also took aloe for various diseases of the gastrointestinal tract and skin diseases.\nAloe is a natural miracle healer. Its leaves contain a lot of active substances: anthraquinoglycoside barbaloin has antibacterial activity; achoin prevents blood clotting and the formation of blood clots; acemanan increases the level of immune protection. Aloe also has antimicrobial and antifungal effects, shows adaptogenic effect in allergy due to the ability to bind histamine, which is released in this condition. Aloe can also be considered as an anti-allergic substance.\nIt has a laxative, antiseptic and choleretic effect. Aloe has an enveloping effect and reduces the acidity of gastric juice. The laxative effect is due to the irritating effect on the intestinal mucosa and increased peristalsis. Time of onset of effect: 8-10 hours after administration. Aloe also softens intestinal spasms, especially after surgery.\nAnti-inflammatory, wound-healing properties, promotes the healing of irradiated tissues, including after sunburn, increases the general nonspecific resistance of the body and the resistance of mucous membranes to the action of damaging agents, accelerates regeneration processes.\nImproves metabolism, normalizes the complexion, smoothes the skin, tightens pores, eliminates puffiness, cleanses the skin of old dead cells. Relieves itching caused by insect bites. It has antimicrobial activity against streptococci, staphylococci, typhoid and dysentery bacilli, proteus.	Dietary supplement Aloe Vera NSP juice is an additional source of phenolic acids.\n1 tablespoon (15 ml) contains: concentrate of the inner part of the leaves of aloe vera (Aloe barbadensis) — 1.5 g.\nExcipients: purified water, citric acid, potassium sorbate, sodium benzoate.	Adults take 1-2 tablespoons (15-30 ml) a day with meals, after diluting the product in water or juice. Shake the bottle before use. The duration of admission is 1 month. If necessary, the reception can be repeated.	individual intolerance, pregnancy, breast-feeding, hemorrhoidal and uterine bleeding.	The opened bottle should be stored in the refrigerator for no more than 1 month.
41	41	It has an antioxidant effect.\nAccelerates regeneration, promotes healing of wounds and trophic ulcers.\nIt has an oncoprotective effect.	Free radicals are highly reactive substances that can harm our cells. They are formed constantly as a result of metabolism, as well as under the influence of external factors: environmental pollution, smoking, radiation. Antioxidants that can neutralize their activity help the body resist free radicals. Most people do not get enough antioxidants from food, so they need to take dietary supplements.\nAntioxidant NSP is a unique phytoformula of Active Longevity based on turmeric root, rosehip fruit, milk thistle seeds, a mixture of tocotrienols (vitamin E), alpha-lipoic acid and lycopene. The most powerful of all the antioxidant products presented in the line of NSP.	Turmeric (Curcuma longa) — increases the formation of bile and stimulates the emptying of the gallbladder. It exhibits antiparasitic and antibacterial activity. Accelerates wound healing. Suppresses the growth of malignant tumors of the skin, uterus and breast, slows down the growth of melanoma cells, breast and pancreatic cancer, prostate, inhibits the formation of blood capillaries in the tumor tissue.\nDog rose (Rosa canina) — fruits contain vitamin C, carotene, antioxidants, iron, manganese, magnesium. It has an anti-inflammatory effect, enhances regeneration processes, stimulates hormone synthesis and bile secretion.\nMilk thistle or milk thistle (Silybum marianum) is a plant whose seeds contain flavonoids (silybin, silidianin, silichristine – collectively referred to as silymarin). It has a pronounced hepatoprotective, antioxidant, anti-inflammatory effect, protects cell membranes, enhances regeneration.\nLycopene is a carotenoid, is an antioxidant, protects cell membranes from oxidation, has an anti-atherogenic effect. Its oncoprotective properties against prostate, breast, endometrial, and lung cancers are noted.\nTocotrienols are isomers of vitamin E, have antioxidant activity, protect cell membranes from oxidation, and have an oncoprotective effect.\nLipoic acid is an antioxidant, is part of a number of enzymes, participates in the formation of ATP, a universal source of energy for all biochemical processes. Deficiency leads to a decrease in muscle mass and brain mass, slowing growth.	Dietary supplement Antioxidant NSP is a source of flavolignans, lycopene, lipoic acid, an additional source of vitamin E.\n1 capsule contains: turmeric root (Curcuma longa) - 153.0 mg; a mixture of tocotrienols - 131.2 mg (5 mg of vitamin E – 33% of TSA); rose hips (Rosa canina) - 122.5 mg; milk thistle seeds (Silybum marianum) - 87.0 mg; alpha-lipoic acid - 2.3 mg (7.7% of TSA); lycopene - 1.4 mg (28% of TSA)\nAuxiliary substances: magnesium stearate, gelatin, silicon dioxide.	Adults take 1 capsule 2 times a day with meals for 3-4 weeks.	individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
42	42	Restores normal intestinal microflora.\nRegulates the work of the gastrointestinal tract.\nSupports the body's natural defense against bacteria and viruses.	If a person is healthy, eats right and leads a normal lifestyle, the intestinal flora does not make itself felt. But as soon as one of these components changes, troubles begin. Foreign microorganisms – enterococci, clostridia, staphylococci, yeast-like fungi can be present in a healthy body in small quantities. Their reproduction is hindered by normal intestinal microflora. A change in its qualitative composition leads to a violation of the microbial balance in the intestine – dysbiosis. One of the main reasons for the development of dysbiosis is the recently sharply increased consumption of antibiotics, sulfonamides and a number of other medications. Another reason is stress. Weakened immunity, inflammatory diseases of the gastrointestinal tract, food allergies, inadequate nutrition also lead to the development of dysbiosis. Clinical signs of dysbiosis are increased gas formation, abdominal pain, diarrhea, unstable stools or constipation may develop.\nThe product Bifidophilus Flora Force NSP gently and naturally restores the normal intestinal microflora.\nIt is necessary for pregnant and nursing mothers, the elderly, those who suffer from disorders of the gastrointestinal tract, underwent surgery, takes antibiotics (during the course and 2 weeks later).\nThe formula contains lacto and bifidobacteria in combination with prebiotics that increase the survival of microflora.\nThe product is used for direct intake, as well as as part of a fermented milk product.	Lactobacilli Bifidobacterium longum and Lactobacillus acidophilus, once in the gastrointestinal tract, easily multiply, displacing and ruthlessly cracking down on pathogenic microflora, including agitators of dysentery, salmonellosis, and also resist the formation of carcinogenic nitros compounds in the intestine.\nA complex of prebiotics (fructooligosaccharides, carrot powder, maltodextrin, safflower oil) improves the survival of microflora.	Dietary supplement Bifidophilus Flora Force NSP is a source of probiotic microorganisms (bifidobacteria and lactobacilli).\n1 capsule contains: Lactobacilli (Lactobacillus acidophilus) - 25 x 10 8 CFU*; Bifidobacteria (Bifidobacterium longum) - 10 x 108 CFU*; fructooligosaccharides, carrot powder, maltodextrin, safflower oil - 470 mg.\n* at the time of production.\nAuxiliary substances: gelatin, cellulose, magnesium stearate.	Adults and children over 14 years of age: 1 capsule per day with meals. The duration of admission is 1-2 months. If necessary, the reception can be repeated.	individual intolerance to the components of the product.	Store in a tightly closed bottle in the refrigerator (at a temperature not higher than +4 ° C).
43	43	It has powerful antiparasitic, antifungal properties\nExhibits antiseptic and wound healing properties\nIt has an immunomodulatory effect\nReduces allergic reactions \nIt has an antioxidant effect	It has a blood-purifying and detoxifying effect\nReduces blood sugar and cholesterol levels\nNormalizes blood pressure\nA rich source of iodine, helps to improve metabolism and the condition of the thyroid gland \nIt has an oncoprotective effect	Black Walnut (Juglans nigra) — the peel is rich in flavonoids, tannins, organic acids, essential oils, iron, cobalt, beta-carotene. In terms of vitamin C content, the nut peel is 8 times higher than black currant and 50 times higher than citrus fruits. It has a bactericidal, antiparasitic and anthelmintic effect. The components of the walnut peel help to cleanse the skin with exudative diathesis, eczema, herpes, psoriasis, ringworm. It helps with some forms of tuberculosis of the skin, larynx, tuberculous lymphadenitis, bronchial asthma, diarrhea, has an anti-inflammatory effect, reduces blood sugar levels.\n1 capsule contains: 24.9 mg of tannins (tannin) (12.5% of the TSA), 1.64 mg of flavonoids (32.8% of the adequate daily requirement).	Dietary supplement Black Walnut is an additional source of flavonoids and tannins.\n1 capsule contains: black walnut peel (Juglans nigra) — 500 mg.\nAuxiliary substances: magnesium stearate, silicon dioxide, gelatin.	Adults take 1 capsule 3 times a day with meals. The duration of admission is 2-3 weeks. If necessary, the reception can be repeated.	individual intolerance of components, pregnancy, breast-feeding.	\N
44	44	It has an antioxidant, oncoprotective, detoxifying, blood-purifying, immunomodulatory effect\nReduces pain syndrome, supports the immune system in secondary immunodeficiency\nIt has antibacterial, antiviral and antifungal effects	An original, unparalleled phytocomplex. The active component of a wide spectrum of action lapachol is contained only in the inner layer of the bark According to d'Arco, which is strictly controlled during the production of D'Arco NSP.\nClinical studies of this product have been conducted on a group of patients diagnosed with colpitis when taken against the background of basic therapy. The results demonstrated a more effective suppression of the growth of pathogenic microflora in the group where this dietary supplement was taken, a rapid decrease in clinical manifestations, restoration of normal colon microflora, normalization of leukocytes and ESR in the blood test.\nThe Indians of Brazil have used the inner bark (cambium) for centuries By D’Arco for the treatment of many diseases. The inner layer of the bark contains a huge amount of active substances, among which lapachol stands out, which has antibacterial, antiviral, antiparasitic and anti-inflammatory effects. In confirmation of its antifungal properties, mushrooms do not grow on the trunk of the Tabebuia tree. It promotes the production of interferon. Of particular interest is the fact that the ant tree suppresses the enzyme by which some viruses (hepatitis B and C, HIV, etc.) are introduced into the cell genome. Cambium quinones inhibit the growth of Helicobacter pylori and other bacteria. A positive result was obtained in patients with leukemia (pain syndrome decreased and general condition improved), lapachol helps to reduce malignant tumors.\nBased on the results of clinical trials, recommendations for the use of d'Arco NSP for bacterial, viral, fungal diseases, colitis, gastritis, rheumatism, lung diseases, prostatitis, inflammation of the genitourinary system, anemia, allergic conditions.\nAntiseptic effect on d’Arco NSP is enhanced with astragalus, garlic and chlorophyll.	According to D'Arco, ant tree, lapacho (Tabebuia heptaphylla) – the inner bark is a universal plant antibiotic with antiviral, antifungal and anthelmintic effect, stimulates the production of interferon. It contains lapachol and xyloidin, which have antifungal activity against many types of fungi, including vaginal fungi (candida, trichophyton), inhibit the reproduction and development of intracellular parasites (for example, malaria plasmodium). Bark By D’Arco contains substances that help reduce severe pain in arthritis and rheumatism, and also have an antiviral effect, Xylodine, together with lapachol, reduces the activity of enzymes, suppressing the reproduction of viruses. Quinones inhibit the growth of Helicobacter pylori and other bacteria. Lapachol has the ability to reduce malignant tumors and reduce pain syndromes during the tumor process, blocking the flow of oxygen to cancer cells, as a result of which the process of tumor development stops. It is used for malignant skin diseases, AIDS, venereal diseases (gonorrhea, syphilis). It has a tonic, pronounced analgesic and anti-inflammatory effect, promotes normalization of blood sugar levels.\nAstragalus membranaceus (Astragalus membranaceus) – has an immunostimulating effect, helps with frequent colds, high physical and mental stress, secondary immunodeficiency, including in cancer patients (stimulates the function of NK- and T-killer cells, promotes the production of interferon).\nSeed garlic is often called a natural antibiotic: allicin, di– and tri-sulfide compounds that are part of garlic show antibacterial activity even against some antibiotic-resistant bacteria.\nSodium chlorophyllin is a derivative of chlorophyll. Unlike pure chlorophyll, the copper complex is stable in an acidic environment, retains an emerald green color during long-term storage and is soluble in water. It has antibacterial, antioxidant and deodorizing effects.	1 capsule contains: dried inner bark By D’Arco (Tabebuia heptaphylla) - 485 mg; Astragalus root (Astragalus membraceus) - 5 mg; garlic bulb (Allium sativum) - 5 mg; sodium chlorophyllin (chlorophyll) - 5 mg.\nAuxiliary substances: magnesium stearate, silicon dioxide, gelatin.	Adults take 2 capsules 2 times a day with meals. The duration of admission is 1 month. If necessary, the reception can be repeated.\nThe contents of the capsules can be brewed in boiling water as tea.	individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
45	45	Promotes the absorption of calcium due to vitamin D3.\nStrengthens connective tissue.\nIt has an anti-inflammatory effect\nHelps to heal fractures, wounds.	Bon-C NSP has an anti-inflammatory effect, is indicated for fractures, arthrosis, habitual dislocations, caries and is a complex including: mullein, plantain, yarrow, rehmania, contains vitamin D3.\nA unique phytoformula. There are clinical trials proving the effectiveness of this product in the treatment of osteoporosis.	Plantain large (Plantago major) – stimulates secretion, is used for peptic ulcer with normal or low acidity.\nRehmannia glutinosa - has a tonic effect, reduces tachycardia, suppresses cough, has a hypotensive effect. It is used for arthritis, fractures, irregular menstrual cycle, as a diuretic.\nMullein (Verbascum thapsus) – has antiviral, anti-inflammatory and antihistamine effects. Eliminates congestion in the lungs, cleanses the bronchi, has an expectorant effect.\nYarrow (Achillea millefolium) – has a bactericidal, astringent, anti-inflammatory effect.	Dietary supplement Bon-Si NSP is an additional source of vitamin D3, flavonoids and iridoids.\n1 capsule contains: plantain leaves (Plantago major) — 126.2 mg; Rehmannia root (Rehmannia glutinosa) — 119.0 mg; mullein leaves (Verbascum thapsus) — 91.5 mg; aerial parts of yarrow (Achilleamille folium) — 91.5 mg; vitamin D3 — 120 IU (3.0 mcg) (30% of ASP).\nAuxiliary substances: gelatin.	Adults take 1 capsule 3 times a day with meals. The duration of admission is 2-3 weeks. If necessary, the reception can be repeated.	individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
138	138	\N	In this edition, our experts have collected and presented information about the unique properties and effectiveness of NSP products. There is also a special group of universal products of Active Longevity, which have antioxidant, detoxifying, oncoprotective, antibacterial and anti-inflammatory effects, regulate the functions of life-supporting systems of the body, stimulate the healing and restoration of various structures of the body, including bones and soft tissues.\nAll the material is offered in the format of a working notebook – a short reference book of unique effects of products with working pages for notes and recommendations. For the convenience of working with this publication, we have included a classification of NSP products based on the experience of their use, as well as the direction of action.	\N	\N	\N	\N	\N
46	46	Inhibits the synthesis of ATP in the mitochondria of tumor cells\nIt has a targeted effect on tumor cells\nInhibits the growth of blood vessels in affected tissues	A unique patented development of the NSP company. Monoproduct based on an extract of three-lobed asimina twigs (North America) collected during the period of maximum concentration of acetogenins. When collecting raw materials, nature-saving technologies are used.\nAmong the plant world, it is rare to find a plant that would help so effectively in the fight against cancer. Among such unique plants is asimina, which is native to North America. Its active substances, acetogenins, have the ability to block the production of energy in cancer cells and at the same time prevent the growth of blood vessels in the tumor tissue. Pah Pah of the NSP company based on azimina extract can be combined with therapeutic drugs used according to the standards of oncology treatment.	Pau Pau or Asimina triloba (Asimina triloba) – the highest content of active substances of acetogenins – in small twigs, seeds and tree bark. The action of acetogenins is aimed at reducing and stopping energy production in tumor cells that need a lot of energy, require high oxygen content and are very sensitive to hypoxia. Acetogenins inhibit the process of division of these cells, and also interfere with the mechanisms of elimination of antitumor drugs from them. Acetogenins also prevent the growth of new blood vessels in the tumor tissue. Disruption of the formation of new blood vessels feeding tumor tissues can stop tumor growth. This increases the chances of the patient's immune system to fight tumor cells more successfully.\nIt has been established that acetogenins have distinct antitumor activity against different cell lines and destroy even cancer cells that are insensitive to the action of chemotherapeutic agents. Studies have shown that acetogenins in the recommended doses do not show toxicity to normal cells and do not cause weight loss during chemotherapy.	1 capsule contains: extract of Pau Pau twigs (Asimina triloba) - 380 mg.\nAuxiliary substances: magnesium stearate, microcrystalline cellulose, gelatin.	Adults take 2 capsules 3 times a day with meals.	it is not recommended to use during pregnancy or presumptive pregnancy, as well as during breastfeeding and individual intolerance to individual components of the product. It is recommended to consult a doctor before use.\nWarning: Do not combine the drug with coenzyme Q10, as well as with drugs to stimulate thyroid function or with other biostimulants.	\N
47	47	It is a source of easily digestible, low-allergenic protein\nContains whey protein hydrolysate, includes free amino acids\nIt is recommended for digestive disorders, after operations, injuries, in weight loss and muscle mass enhancement programs	A unique protein formula in an easily digestible form. The presence of l-carnitine and magnesium improves energy production, heart function, muscle tissue, nervous and digestive systems.\nFor most people, there are no special problems with the assimilation of food protein. However, with impaired digestion and absorption in the gastrointestinal tract, a severe clinical condition, and food allergies, there is a need to consume proteins in an easily digestible – hydrolyzed form. Whey proteins are characterized by an optimal set of amino acids necessary for the synthesis of tissue proteins, and also play an important role in ensuring the functions of the endocrine glands, hematopoiesis, nervous system Peptovit with L-carnitine and magnesium – protein hydrolysate based on high-quality whey protein, which is enhanced by seven essential amino acids, L-carnitine and magnesium. It can be recommended for nutritional support of healthy and sick people. It is indispensable for the rehabilitation of patients after severe injuries and operations, for achieving high performance in sports, building muscle mass, increasing physical endurance, can be useful in the most stressful periods of a woman's life: during pregnancy and breast-feeding as a source of high-quality and low-allergenic protein.	Whey protein hydrolysate – 80% consists of peptides and 10% of free amino acids – the most easily digestible and low-allergenic forms of protein. 10% is non-split protein. The hydrolysate is enriched with 7 essential amino acids: valine, leucine, lysine, isoleucine, methionine, threonine and phenylalanine, which, according to WHO, make up the combination of proteins most effective for the human body.\nL-Carnitine – plays an important role in energy and fat metabolism, improves energy in muscle tissue, heart, accelerates the oxidation of long-chain fatty acids, which helps to reduce the fat content in the body.\nMagnesium – promotes the activation of enzymes that regulate fat, carbohydrate and protein metabolism, energy production, has a cardioprotective and antiarrhythmogenic effect. Magnesium relieves spasm, stabilizes blood pressure and has a positive effect on the nervous system.	1 tablet contains: whey protein hydrolysate - 533 mg; magnesium (aspartate, oxide) - 53.15 mg (14.1% of ASP), amino acids (in total in the serum and added): L-alanine - 22.0 mg, L-aspartic acid - 44.0 mg, L-carnitine - 50.0 mg, L-cysteine - 10.5 mg, L-histidine - 8.0 mg, L-isoleucine - 28.0 mg, L-proline - 22.5 mg, L-serine - 20.5 mg, L-threonine - 28.0 mg, L-tryptophan - 7.0 mg, L-leucine - 50.0 mg, L-lysine - 45.0 mg, L-methionine - 14.5 mg, L-phenylalanine - 28.0 mg, L-tyrosine - 15.0 mg, L-valine - 35.0 mg, glycine - 8.0 mg, L-arginine - 11.0 mg, L-glutamine - 70.0 mg.\nExcipients: microcrystalline cellulose, cellulose, stearic acid, silicon dioxide, magnesium stearate, shell for vitamin preparations (palm leaf wax, cellulose coating tablets, purified water).	Adults take 2 tablets 3 times a day with meals. The duration of admission is 1 month.	individual intolerance to the components of the product, pregnant and lactating women.	\N
48	48	It has an antioxidant and membrane stabilizing effect\nProtects the structures of the eye from the harmful effects of free radicals\nImproves the adaptation of vision in the dark	Many people have various vision problems throughout their lives. The eyes get tired, watery, react painfully to bright light, become inflamed. Eye health largely depends on the state of the body's antioxidant system, because it protects the eyes from the aggressive effects of bright light and ultraviolet radiation, which cause the formation of oxygen radicals. The first structure of the eye that is aggressively exposed to light is the iris, followed by the lens and the macula (yellow spot), which, as a light filter, protects the retina of the eye. With a deficiency of antioxidants, the lens collapses and becomes cloudy over time, and cataracts occur, and then the retina begins to irreversibly collapse. The depletion of the visual pigment rhodopsin occurs with an increased load on vision associated with working on a computer, watching TV and other activities of a modern person.\nPerfect Eye NSP (English: perfect Eyes) is a unique combination of nutritional components and antioxidants designed to improve vision. It prevents the destructive effect of free radicals, provides antioxidant protection to the lens, cornea and retina, and also restores the microcirculation of the eye. Perfect Eye NSP is an indispensable component of various vision support programs. It has an immunomodulatory and membranoprotective effect.\nA unique phyto-vitamin-mineral formula, a universal antioxidant. This is the most complete and balanced complex on the market in this segment.	Vitamin A is very important for eye health, it forms the visual pigment rhodopsin, which determines the generation and transmission of nerve impulses from the retina to the brain, as well as twilight vision.\nVitamin E protects the biological membranes of retinal cells from peroxidation. \nVitamin B2 is a part of the visual pigment, provides visual acuity and dark adaptation, prevention of cataracts, conjunctivitis, keratitis, chicken blindness, glaucoma, migraines associated with eye fatigue. Vitamin B6 – increases the content of glutathione in the lens and the production of pigment in the iris.\nBeta-carotene is a provitamin A, provides antioxidant protection, protects the membranes of retinal cells, normalizes metabolic processes in the cornea. Prevents the development of eye diseases such as progressive myopia, glaucoma, cataracts, uveitis, retinopathy of various etiologies, intraocular hemorrhages.\nLutein – zeaxanthin is formed from it in the tissues of the eye – the main pigment of the macula (macula). Lutein and zeaxanthin selectively absorb the dangerous blue part of the light flux spectrum, neutralizing the destructive effect of ultraviolet rays. Lutein deficiency leads to macular degeneration and damage to the retina. Elderly people often develop retinal dystrophy, a disease that leads to irreversible vision loss. It is the elderly, first of all, who are recommended to increase the intake of lutein.\nTaurine – participates in the transmission of nerve impulses, has anticonvulsant activity. Taurine contributes to the improvement of energy processes, stimulates recovery in dystrophic eye diseases, prevents the gluing of platelets, improving blood circulation. Taurine deficiency causes retinal dystrophy\nQuercitin has a powerful antioxidant effect, stabilizes cell membranes, protects vascular walls, normalizes histamine balance and modulates immune function. It has anti-edematous, antispasmodic, anti-inflammatory, radioprotective effect.\nCopper and zinc (in gluconate), selenium (in chelate) are part of antioxidant defense enzymes. Zinc also plays an important role in the regeneration of retinal cells.\nChromium (in chelate) is important for preventing the development of diabetic ophthalmopathy. \nBlueberry juice extract (Vaccinium myrtillus) – stimulates the production of the visual pigment rhodopsin and has a strong antioxidant effect, which significantly increases acuity and expands the field of vision, reduces eye fatigue, accelerates the renewal of retinal cells. Succinic acid, which is abundant in blueberries, helps to preserve the elasticity of the walls of blood vessels and reduce spasm of the cerebral vessels.	Dietary supplement Perfect Aiz NSP is an additional source of vitamins (E, A, B2, B6), beta-carotene, lutein, zinc, copper, chromium, selenium, contains anthocyanins.\nAuxiliary substances: gelatin, magnesium stearate, stearic acid, microcrystalline cellulose, maltodextrin, silicon dioxide.	Adults take 1 capsule daily with meals. The duration of admission is 1 month. If necessary, the reception can be repeated.	individual intolerance of the components. Pregnant and lactating women are advised to consult a doctor before starting use.	\N
49	49	Provides nutritional support to the prostate gland\nNormalizes the function of the prostate gland and urinary system\nReduces the risk of inflammatory diseases of the prostate gland, inhibits the development of prostate adenoma	The prostate gland (prostate) is extremely important for men's health, it is not for nothing that it has been called the "second heart". Her condition determines both sexual function, and the work of the urinary system, and the mental state of a man. The consequences of diseases and disorders of the prostate gland (frequent night visits to the toilet, difficulty and pain when urinating, pain of varying intensity in the back and perineum) reduce the quality of life of men. With age, these problems are joined by benign prostatic hyperplasia, which subsequently turns into an adenoma. The development of prostatitis and prostate adenoma can be prevented by using the complex product "Pro Formula". The complex preserves the full function of the male reproductive system and helps to reduce urination disorders, pain and the subsiding of inflammatory processes. The Pro Formula is effective in acute and chronic prostatitis, with adenoma of various stages, as well as with a decrease in male potency. In the latter case, the effect occurs gradually, but is characterized by a long-lasting effect. It is also recommended for all men with a preventive purpose after the age of 40-45 years.\nA unique formula to improve the function and support the health of the prostate gland. It is the basis in the program of nutritional support for men's health.	Zinc (in gluconate) is an integral part of various enzymes that play an essential role for growth, testosterone production, DNA synthesis, cell division, reproductive ability and prostate gland functions, and is necessary for immunity.\nKorean ginseng (Panax ginseng) – has an adaptogenic, antitumor and increases the overall resistance of the body effect. Stimulate sexual function.\nSugarcane extract (Saccharum officinarum) – contains octacosanol, which suppresses cholesterol synthesis, activates lipase, increases oxygen delivery to organs and tissues. It is useful for supporting energy, endurance and prevention of cardiovascular diseases.\nVitamin E is a key fat–soluble antioxidant that activates the immune system. It affects the work of the sex glands, stimulating the production of testosterone.\nEleutherococcus prickly (Eleutherococcus senticosus) is an adaptogen, reduces fatigue during physical exertion, increases basal metabolism, and is effective for impotence.\nWith Palmetto or Serenoa repens (Serenoa repens) – when taken regularly, it stimulates the endocrine system, including the sex glands, increases sperm secretion, increases libido and has an anti-inflammatory effect in infections of the genitourinary system, prevents prostate enlargement. High efficacy has been proven in enuresis, prostatitis, prostate adenoma.\nCurly parsley (Petroselinum crispum) – has a diuretic effect, increases the tone of the smooth muscles of the bladder. Stimulates the kidneys, normalizes the function of the adrenal glands, reduces blood pressure. Essential oils of parsley can provide an antibiotic effect in urinary tract infections.\nAfrican plum, pygeum (Pygeum africanum) – extract from plum bark reduces the growth of prostate cells, so it is used to treat prostatic hyperplasia. Pidgeum eliminates and reduces functional disorders of urination in diseases of the prostate gland, reduces the inflammatory reaction in the prostate tissue and enhances its secretory activity, relieves swelling. It has anti-inflammatory activity, has a decongestant effect, reduces the level of the hormone prolactin and blocks the accumulation of cholesterol in the prostate. The hormone prolactin increases the absorption of testosterone by the prostate, and cholesterol increases the number of receptors for dihydrotestosterone. The pidgeum cortex suppresses the formation of fibroblasts (connective tissue cells), which play a role in the development of benign prostatic hyperplasia, and also increases the secretion of androgens by the adrenal glands. In combination with So Palmetto, the effect of using pidgeum extract increases.	1 capsule contains: Korean ginseng extract - 72.1 mg, sugar cane extract - 60 mg, vitamin E (d-alpha tocopherol succinate) - 50 IU (335% of RUSP), Eleutherococcus prickly root - 50 mg, fruit extract with palmetto - 50 mg, parsley leaves - 50 mg, extract pyjeum bark - 25 mg, raw rice grains - 16 mg, zinc (in zinc gluconate) - 12.5 mg (83% of RUSP).\nAuxiliary substances: magnesium stearate, gelatin.	Adults take 1 capsule in the morning with meals.	individual intolerance of the components.	\N
139	139	\N	Do you want to lead an active and healthy lifestyle? Then this edition is for you. The brochure combines information about programs relevant to people of all ages.	\N	\N	\N	\N	\N
50	50	It is used in systemic enzyme therapy programs\nImproves the breakdown and assimilation of food proteins\nReduces blood viscosity and improves circulation\nIncreases elasticity of valves of veins and walls of vessels\nIt has an anti-inflammatory, anti-edematous, anti-allergic effect\nPromotes healing and changes the structure of scar tissue	In the 30s of the twentieth century, an idea was expressed, and in the 70s a new direction appeared in medicine - systemic enzyme therapy (SE), which is based on the action of proteolytic enzymes in the internal environment of the body after their absorption into the gastrointestinal tract. The use of enzymes in systemic enzyme therapy allows you to regulate blood clotting, the activity of inflammatory and immune processes, cleanse the body of decay products after injuries, operations, chronic inflammation, chemotherapy. The unique enzyme complex Protease Plus can be used for systemic enzyme therapy (between meals). Proteolytic enzymes can be taken for diseases associated with the destruction of cartilage (arthrosis, arthritis, osteochondrosis), purulent and inflammatory diseases (bronchitis with copious sputum, pleurisy, wound suppuration, trophic ulcers, etc.). The use of SE is effective in orthopedics and traumatology, in diabetic foot syndrome, which reduces the frequency of necrotic complications several times, in chronic prostatitis, fibrocystic mastopathy, adhesive intestinal obstruction, in vitiligo (stabilization of the process and skin repigmentation are noted). The complex is applicable both in immunodeficiency conditions and in oncology. The Protease Plus enzyme complex can also be used to enhance the digestive function of the stomach. In this case, it must be taken with food.\nA unique formula based on proteolytic enzymes derived from micellar fungi with the inclusion of beet plant fibers (fiber, pectins, legnins) as enzyme carriers. As a systemic enzyme preparation, the product can be used in high doses for a long time.\nThere are results of clinical trials on a group of patients with erectile dysfunction on the background of chronic prostatitis in basic therapy with additional intake of dietary supplements Protease Plus and dietary supplements Lozenges with zinc. The results of the extended therapy compared to the basic one: improvement of erection by 50%, orgasm – by 34%, libido – by 24%, the quality of sexual intercourse – by 39%.	A mixture of proteases — have a pronounced anti-inflammatory, decongestant, resorption, immunomodulatory effect, improve microcirculation and accelerate regeneration processes. They have the ability to activate macrophages and immune killer cells. Within the framework of SE, they work effectively at all stages of the development of malignant neoplasms, especially during radio or chemotherapy, as well as to alleviate the condition of patients in the terminal stage.\nVegetable fibers of beetroot (Beta vulgaris) — include cellulose, hemicellulose, pectin and lignin, which play the role of a carrier of proteolytic enzymes in the process of their promotion in the gastrointestinal tract.	1 capsule contains: vegetable proteases - 203 mg; vegetable fiber of beetroot (Beta vulgaris) - 267 mg. Proteolytic activity: 60 prot. units (60,000 HUT)/ caps.\nExcipients: tracite, gelatin.	Adults take 1 capsule 3 times a day with meals.	Individual intolerance to the components of the product, pregnancy and lactation.	\N
51	51	It has an antibacterial and anti-inflammatory effect in diseases.\nProvides support to the musculoskeletal system.\nAn indispensable product for athletes	The Boswellia Plus NSP formula can be taken for various inflammatory diseases, osteochondrosis, osteoarthritis, arthritis and rheumatoid arthritis. Athletes whose musculoskeletal system is experiencing significant loads also need it. It consists of 11 components, including 4 extracts (myrrh, pederia, prutnyak, fenugreek) and a mixture of herbs: celery, burkhavia, ayovan, syt, which enhance the anti-inflammatory effect. Helps strengthen the walls of blood vessels.\nA unique phytoformula developed by the company on the basis of Ayurvedic herbs. Unlike non-steroidal drugs, it has no side effects!	Boswellia (Boswellia Serrata) – boswellia resin has always been appreciated for its anti-inflammatory and antiseptic properties. The mechanism of action of boswelia is similar to the action of nonsteroidal anti–inflammatory drugs (NSAIDs) with the only difference - boswelia does not give side effects inherent in NSAIDs (ulceration of mucous membranes, bronchospasm, etc.).\nMyrrh or commiphora (Commiphora molmol) – has an antispasmodic and expectorant effect, relieves pain, has antibacterial activity.\nChinese sarsaparilla (Smilax china) – has a tonic, diuretic effect. It is used for rheumatism, psoriasis, syphilis, imbalance of sex hormones, premenstrual syndrome, sexual dysfunction, infertility.\nHolarena fluffy (Holarrhena antidysenterica) – has antibacterial, antiamoebic and anthelmintic activity. It is used for dysentery, helminthiasis, snake bites, bronchitis.\nPederia smelly (Paederia foetida) – used for coughing, rheumatism, infectious diseases.\nChinese prutnyak (Vitex negundo) – the active substances of this plant have a progesterone-like effect. It is used for menstrual disorders, menopause, premenstrual syndrome.\nSyt round (Cyperus rotundus) – grass and roots are used for colds, as a diuretic and diaphoretic.\nOdorous celery (Apium graveolens) – seeds and leaves are used as an analgesic and diuretic, for kidney diseases, gout, dermatitis.\nBoerhavia diffusa is a plant whose roots are used as an expectorant, diuretic, diaphoretic.\nSweet Ayovan (Trachyspermum ammi) – fruits are used as a diuretic and hypotensive.\nFenugreek hay (Trigonella foenum-graecum) – seeds have anti-inflammatory, sedative, antispasmodic effect, stimulates the secretion of digestive juices.	Dietary supplement Boswelia Plus NSP is an additional source of polyphenolic compounds, contains organic acids.\n1 capsule contains: myrrh resin extract (1:5) (Commifora mukul) — 28.57 mg; Chinese sassaparilla root (Smilax china) — 22.85 mg; Boswellia resin (Boswellia serrata) — 20.00 mg; Holarena antidysenteric bark (Holarrhena antidysenterica) - 17.14 mg; Pederia leaf extract (Paederia foetida) — 17.14 mg; extract of leaves of Chinese prutnyak (Vitex egundo) — 17.14 mg; roots of syti round (Cyperus rotundus) — 17.14 mg; seeds of fragrant celery (Apium graveolens) — 11.43 mg; root of burkhavia diffuse (Boerhaavia diffusa) — 11.43 mg; fruits of sweet-scented iowa (Trachyspermum ammi) — 11.43 mg; fenugreek seed extract (Trigonella foenum-graecum) — 5.71 mg.\nExcipients: cellulose, silicon dioxide, stearic acid, magnesium stearate, gelatin.	Boswelia Plus NSP can be taken for various inflammatory diseases, osteochondrosis, osteoarthritis, arthritis and rheumatoid arthritis. Athletes whose musculoskeletal system is experiencing significant loads also need it.\nAdults take 1-2 capsules 3 times a day with meals. The duration of admission is 1 month.	Individual intolerance to components, pregnancy, breast-feeding.	\N
52	52	It has a detoxifying, blood-purifying, antiseptic, immunostimulating, oncoprotective, expectorant effect \nHelps reduce cholesterol and prevents the development of atherosclerosis\nImproves damage healing and skin condition in acne and psoriasis\nIt is a source of phytoestrogens	Clover is an immunostimulator for bacterial and viral infections, has a wound-healing effect, cleanses the skin of acne in young men. It has antispasmodic, antitoxic, antiseptic, blood-purifying, diuretic, expectorant (tea based on it), antitumor effect, is indicated for allergic and skin diseases, including seborrhea, trophic ulcers, psoriasis, reduces cholesterol, prevents the development of atherosclerosis. Helps to improve blood circulation, improves vascular elasticity.\nA plant monopreparation of a wide spectrum of action.	Red clover (Trifolium pratense) is a plant of a wide spectrum of action. Contains phytoestrogens with high estrogen-like activity. Of all phytoestrogens, red clover isoflavones are the most structurally similar to the hormone estrogen. Clover is an immunostimulator for bacterial and viral infections, has a wound-healing effect, cleanses the skin from acne. It has antispasmodic, antitoxic, antiseptic, diuretic, expectorant (tea based on it), antitumor effect, is indicated for allergic and skin diseases, including seborrhea, trophic ulcers, psoriasis, reduces cholesterol, prevents the development of atherosclerosis.	1 capsule contains: red clover flowers (Trifolium pratense) - 320 mg.\nExcipients: cellulose, magnesium stearate, gelatin.	Adults take 2 capsules 3 times a day with meals. The duration of admission is 2 weeks with repeated admission if necessary.	Individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
53	53	Normalizes the function of the prostate gland, increases potency, preserves the reproductive function of men\nIt has an anti-inflammatory, diuretic effect, improves the normal functioning of the urinary system	Half of men over 40 years of age have impaired function, the development of benign prostatic hyperplasia or adenoma. By the age of 65, these disorders can already be found in most men. Inflammation of the prostate gland – prostatitis often occurs with hypothermia, acute and chronic infections in men at any age. All these disorders lead to enlargement of the prostate gland, compression of the urethra that passes through the prostate, which leads to impaired urination, as well as erectile dysfunction. With Palmetto, it will prevent or slow down the development of prostatitis and prostate adenoma. It is used for enuresis, prostatitis, prostate adenoma. With regular intake, it stimulates the endocrine system, including the sex glands, increases sperm production and increases libido, has an anti-inflammatory effect in infections of the genitourinary system, prevents prostate enlargement. So Palmetto is recommended for prostate enlargement and impotence.\nHerbal monopreparation to support men's health.	Serenoa creeping or With Palmetto (Serenoa repens) – suppresses the activity of an enzyme that provokes prostatic hyperplasia. Participates in mechanisms that counteract androgen-type baldness in women. It stimulates the endocrine system, including the sex glands, increases sperm secretion and increases libido, has an anti-inflammatory effect in infections of the genitourinary system.	Dietary supplement With Palmetto is an additional source of lipid-sterol compounds (b-sitosterol).\n1 capsule contains: fruits of the creeping serenoa (Serenoa repens) - 550 mg. Auxiliary substances: gelatin.	Adults take 1 capsule 2 times a day with meals. The duration of admission is 3 months.	Individual intolerance to the product.	\N
54	54	It has an oncoprotective effect\nEnhances immune activity	Scientists at Harvard University (USA) believe that a tumor will never reach a size of more than two cubic millimeters if the development of new blood vessels necessary for its nutrition is blocked. Such a blocker, called an antiangiogenic factor, is found in all cartilages. However, in shark cartilage, this factor is 1000 times more than in any other. Clinical studies have found that the extract obtained from this valuable material inhibits the development of lung cancer in humans. Shark Ray Formula is a combination of two of the strongest products known today that affect the human immune system: reishi mushroom and shark cartilage. This complex is recommended to reduce inflammation, accelerate the recovery of bone and connective tissue, joint diseases, as well as chronic skin diseases and reduced healing processes, psoriasis, allergodermatosis, ulcerative colitis, hemorrhoids.\nA unique formula. Environmental technologies are used in the production: sharks from different species are used, but none of them is endangered. Shark cartilage is taken from those sharks, which are then used entirely, i.e. these sharks are not killed just for the fins.	Shark cartilage – prevents the formation of new blood vessels necessary for the nutrition of cancer cells. Shark cartilage can be used to accelerate the restoration of bone and cartilage tissue in injuries, as well as to prevent exacerbations of psoriasis, allergodermatosis, ulcerative colitis, anal fissures, hemorrhoids, arthritis and arthrosis. Taking shark cartilage reduces pain in diseases of the joints. It stimulates the production of T- and B-lymphocyte cells and macrophages. Chondroitin sulfates, keratin sulfates have an anti-inflammatory effect.\nReishi mushroom or ganoderma (Ganoderma lucidum) – stimulates the activity of the immune system. It is an adaptogen, has an anti-inflammatory effect, increases the production of interferon.	Shark Ray Formula Dietary supplement is an additional source of chondroitin sulfate and calcium.\n1 capsule contains: shark cartilage (Shark cartilage) - 400 mg; mycelium of the reishi mushroom (Ganoderma lucidum) - 175 mg.\nAuxiliary substances: magnesium stearate, gelatin.	Adults take 1 capsule 3 times a day with meals. The duration of admission is 1 month. If necessary, the reception can be repeated in 1-2 months.	It is not recommended for pregnant and lactating women, with individual intolerance to the components of the product.	\N
55	55	Protein low-calorie cocktail with vitamin and mineral complex.\nLow-calorie product, does not contain cholesterol. It can be used in complex rehabilitation of patients with cardiovascular diseases.\nIncreases efficiency, promotes energy production.\nIt is recommended in weight loss programs.	Gluten and lactose free.\nSuitable for vegetarians.\nContains 14 g of high-quality vegetable protein per 1 serving.\nCaloric content - 134 kCal.	Proteins — pea protein, chickpea protein isolate, rice protein, whole grain quinoa powder. This protein will also help enrich the diet, including vegetarian. One serving of a cocktail is enough to get enough and replace one meal.\nVitamins — A, B1, B2, B3, pantothenic acid, B6, biotin, folic acid, B12, C, D3, E, K1. The cocktail will perfectly complement the diet with vitamins and bioelements, which significantly increases endurance and increases energy.\nMacro- and microelements — calcium, magnesium, phosphorus, iron, zinc, copper, selenium, iodine, manganese, chromium, potassium – will help strengthen the musculoskeletal system and immunity.\nDigestive enzymes — alpha-amylase, neutral protease, lactase, lipase, cellulase – improve the absorption of proteins, fats, carbohydrates and vegetable fibers.	Ingredients: pea protein, tapioca starch, sunflower oil powder, chickpea protein isolate, corn starch, vanilla flavor, calcium diphosphate, potassium chloride, thickeners (xanthan gum, guar gum), rice protein, whole grain quinoa powder, magnesium phosphate, calcium carbonate, sodium chloride, magnesium oxide, steviolglycoside sweetener, vitamin premix Smart Mil (maltodextrin, vitamin C (L-ascorbic acid), vitamin E (D-alpha tocopherol), vitamin B3 (nicotinamide), D-biotin, pantothenic acid (calcium d-pantothenate), vitamin A (retinol palmitate), vitamin B12 (cyancobalamin), vitamin B6 (pyridoxine hydrochloride), vitamin D3 (cholecalciferol), folic acid, vitamin B1 (thiamine hydrochloride), vitamin B2 (riboflavin), vitamin K1 (phylloquinone), multi-enzyme complex (alpha-amylase, protease, lactase, lipase, cellulase), chromium picolinate, iron fumarate, zinc citrate, maltodextrin, potassium iodide, manganese gluconate, sodium selenite, copper gluconate.	For adults, mix 2 measuring spoons of powder (34 g) well in 300 – 400 ml of water or milk. Take 1 time a day with meals. The duration of admission is 15 days. If necessary, the reception can be repeated.	Individual intolerance to dietary supplements, pregnancy, breast-feeding, conditions in which iodine preparations are contraindicated.	\N
56	56	Increases vitality, mental and physical performance\nStimulates brain function, memory and concentration\nTones for a long time without side effects\nReduces the feeling of hunger	Metabolic energy, which is produced in the human body, is a key factor in our health, physical and psycho-emotional state. In order to increase energy production, various kinds of caffeine-based stimulants (coffee, strong tea, energy) are often used. NSP has developed a very effective and balanced energy drink based on guarana. It acts for a longer time and does not have an excessive stimulating effect. The effectiveness of the drink is also provided by extracts of ginseng root, green tea, red grape peel, a complex of vitamins of group B. Thanks to the tonic effect of Solstic Energy, it increases physical performance, improves heart function, positively affects the central nervous system, improves memory, sharpness of thinking, attention, reaction speed, improves emotional state. Solstic Energy can be recommended to fight overweight, it dulls the feeling of hunger, increases endurance. It is suitable for both young people and elderly people who have an age-related decrease in energy production, as well as drivers and people who work at night.\nUnique phyto-vitamin formula. It contains B vitamins in a high dosage. Effectively increases mental and physical performance for 4-6 hours without strain on the heart. A low-calorie product. It is convenient to use and is presented in serving bags. The caloric content of 1 sachet is 17.6 kcal.	Guarana (Paullinia cupana) – contains caffeine analogues – methylxanthines, which have a milder and longer-lasting tonic effect on the body, compared with caffeine. The stimulating effect of guarana is twice as long as that of coffee and lasts 4-6 hours! But at the same time, guarana acts milder due to the fact that the methylxanthines of guarana are absorbed in the intestine much slower than regular caffeine, and do not have the side effects inherent in caffeine. Guarana extract increases blood supply to the brain, improves memory and concentration, increases physical endurance, accelerates the splitting of fats.\nReal ginseng (Panax ginseng) – has an adaptogenic, toning, stimulating effect, increases the body's resistance. Ginseng root extract increases physical and mental performance, improves the functioning of the cardiovascular system, normalizes blood pressure.\nChinese camellia or green tea (Camellia sinensis) – contain a rich spectrum of active substances, including caffeine, quercetin, rutin. Green tea is physiologically more active than black tea, it has an antioxidant, capillary-protective effect, has antibacterial activity, and stimulates hematopoiesis. Green tea increases fat oxidation and promotes weight loss.\nRed grape peel extract (Vitis vinifera) – contains a large amount of polyphenols, which have a strong antioxidant and membrane-protective effect, stabilizing blood capillaries.\nB vitamins (B1, B2, B3, B5, B6, B12) are the main participants in metabolic processes, metabolism and oxidation of carbohydrates, provide energy production for the brain. Deficiency of these vitamins manifests itself in the form of weakness, dizziness, memory impairment, depression.\nSucralose is a safe intensive sweetener that is obtained from sucrose.	Dietary supplement Solstic Energy is an additional source of gingosides, polyphenols (including catechins), organic acids, caffeine, B vitamins (B1, B2, B6, B12), pantothenic acid and vitamin PP.\nExcipients: maltodextrin, citric acid, a blend of natural citrus flavors, malic acid, sucralose, silicon dioxide.	Prepare a drink by dissolving 1 sachet in 0.5 liters of water, take at any time as needed.	Individual intolerance to the components, pregnancy, breast-feeding, increased nervous excitability, insomnia, high blood pressure, cardiac dysfunction, severe atherosclerosis, reception in the evening.	Please note that at high storage temperatures (above +25), the product may have a bitter taste.
57	57	It is indispensable for patients with type 2 diabetes mellitus, with impaired fat metabolism, atherosclerosis\nCan be used in weight loss programs\nIt is a sugar substitute, 300 times sweeter than sucrose\nIt has a beneficial effect on the intestinal microflora	With overweight, obesity, metabolic syndrome, type 2 diabetes, nutritionists recommend limiting the use of carbohydrates with food, or completely exclude from consumption sweet foods that contain sugar. In this case, the way out of the situation are sugar substitutes, of which there are currently more than a dozen. Stevia, which is native to Brazil and Paraguay, occupies a prominent place among natural sugar substitutes. The Indians of South America have been eating it for 1500 years. NSP offers an extract from stevia leaves enriched with inulin. Stevia has an antioxidant, adaptogenic, anti-inflammatory effect. With regular use of Stevia, blood glucose and blood viscosity decrease. Stevia can be recommended for people with excess weight, with an increase in cholesterol and blood sugar, and also used as a sweetener for drinks, culinary dishes (porridges, puddings), confectionery, pastries.\nA unique phytoformula that includes concentrated stevia extract and chicory root extract.\nStevia is 300 times sweeter than sugar and at the same time has zero calories, unlike synthetic sugar substitutes (saccharin, acesulfate, aspartame, etc.) Stevia is harmless with prolonged use.	Stevia honey (Stevia rebaudiana) – leaves contain glycosides (stevioside, rebaudiazide, etc.), which are 300 times sweeter than sugar and at the same time have zero calories. In addition to sweet glycosides, stevia contains many other useful substances: flavonoids (rutin, quercetin), vitamins. Stevioside inhibits the development of microorganisms in the oral cavity, protects teeth from caries, and gums from periodontal disease.\nInulin (from chicory root extract) is a source of dietary fiber that serves as a nutrient medium (prebiotic) for bifidobacteria.	Dietary supplement Stevia is a source of inulin.\n1 measuring spoon (300 mg) contains: extract from the leaves of Stevia honey (Stevia rebaudiana) - 24 mg; inulin (extract from chicory root) - 276 mg.	Adults take 2 measuring spoons (0.6 g) 2-3 times a day with meals, adding to tea, coffee and other beverages.	Individual intolerance to the components of the product, pregnant and lactating women.	\N
58	58	Supports the function of the cardiovascular system.\nRegulates blood pressure.\nNormalizes the nervous system.\nStimulates immune function.	A unique phytoformula of Active Longevity based on a patented blend of Ayurvedic herbs, peony, angelica, reishi mushroom, turmeric, ginseng, etc. Strengthens the life-supporting systems of the body.	Milk–flowered peony (Paeonia lactiflora) - the root is used to improve sleep, with vegetative-vascular diseases, hypermenorrhea. It has a sedative, antispasmodic effect.\nAngelica or Chinese angelica (Angelica sinensis) – the root prevents spasms, dilates blood vessels, reduces the formation of blood clots. It stimulates hematopoiesis, improves peripheral blood circulation, has anti-inflammatory, analgesic and soothing effects, enhances the secretion of digestive enzymes.\nTinder, reishi or ganoderma (Ganoderma lucidum) – stimulates the activity of the immune system. It has an anti-inflammatory and anti-allergic effect, reduces cholesterol synthesis, reduces the "gluing" of platelets, normalizes blood pressure. It is an excellent adaptogen that improves the functioning of all body systems.\nChinese wood (Lycium chinense) – fruits have antipyretic effect, relieve muscle and joint pain. It has a beneficial effect on the cardiovascular and nervous systems, normalizes the work of the liver and kidneys.\nTurmeric long (Curcuma longa) – active substances of the root have antispasmodic, choleretic, diuretic effects, reduce intoxication in liver diseases, improve the functioning of the gallbladder, they are used for thrombophlebitis.\nDeren medicinal or dogwood (Cornus officinalis) – fruits strengthen the walls of blood vessels, have a tonic effect.\nChinese volodushka or buplerum (Bupleurum chinense) – roots improve liver function, promote protein synthesis. They have a calming, choleretic and anti-inflammatory effect, reduce the permeability of blood capillaries.\nSalvia multi–root sage (Salvia multiorrhiosa) - roots increase the secretory activity of the gastrointestinal tract, which contributes to the digestion of food. It has anti-inflammatory, hemostatic, antimicrobial, expectorant and soothing effects.\nAchyranthes bidentata (Achyranthes bidentata) – the root has an anabolic and adaptogenic effect. It suppresses the synthesis of cholesterol, has anti-inflammatory, hypotensive, diuretic effect, stimulates the central nervous system.\nPoria cocos / (Poria cocos), a tinder mushroom — an ingredient of traditional Chinese medicine. It is used to normalize the work of the heart and lower blood sugar levels. By restoring the function of the spleen, poria prevents swelling, dizziness, urination problems and diarrhea. It is effective in many diseases, in particular, in chronic hepatitis. It provides the elimination of salts from the body, has anti-inflammatory and analgesic effect, improves blood circulation, lowers blood pressure, eliminates joint inflammation, reduces pain in the joints and spine, and also promotes the elimination of various toxins.\nAstragalus membranaceus – roots dilate coronary vessels, reduce blood pressure, have a calming and cardiotonic effect, improve blood circulation in the kidneys, have a diuretic and immuno-stimulating effect.\nAtractilodes bighead (Atractilodes macrocehyala) – the root has anti-inflammatory, diuretic and tonic effect.\nLigusticum or ligusticum (Ligusticum Wallichii) – the root is effective in coronary heart disease, reduces blood clotting, has an antispasmodic, soothing effect, normalizes and lengthens sleep. It has a bactericidal and antifungal effect.\nBrilliant privet (Ligustrum licidium) – fruits have a tonic for men (especially in combination with astragalus), have an anti-inflammatory and hepatoprotective effect.\nRemania glutinosa (Rehmannia glutinosa) – the root has a tonic effect on the cardiovascular system, has a diuretic effect.\nCommon ginseng (Panax ginseng) – the roots are used as an adaptogen and tonic. Ginseng increases physical and mental performance, improves the functioning of the cardiovascular system, normalizes blood pressure.\nSyt round (Cyperus rotundus) – roots are used for colds as a diaphoretic and diuretic, essential oils have an antibacterial effect. It has an anthelmintic and antifungal effect, relieves premenstrual pain and depression, stimulates sexual activity.	Dietary supplements for BP-C food are an additional source of flavonoids, tannins, anthraquinones, contains essential oils.\n1 capsule contains: Angelica sinensis (Angelica sinensis) root - 34.6 mg, dereza fruit (Lycium chinense) - 34.6 mg, tinder mushroom (Ganoderma lucidum) - 34.6 mg, peony root without bark (Paeonia lactiflora) - 34.6 mg, turmeric root (Curcuma longa) - 29.7 mg, sage root and rhizome (Salvia miltiorrhiza) - 29.7 mg, derena fruit without seeds (Cornus officinalis) - 29.7 mg, volodushka root (Bupleurum chinese) - 29.7 mg, astragalus root (Astragalus membranaceus) - 24.7 mg, Atractylodes rhizome (Atractylodes macrocephala) - 24.7 mg, coconut poria (Rogia cocos) - 24.7 mg, Achyranthes root (Achyranthes bidentata) - 24.7 mg, brilliant privet fruit (Ligustrum lucidum) - 24.7 mg, remania root (Rehmannia glutinosa) - 24.7 mg, flagella rhizome (Ligusticum wallichii) - 24.7 mg, ginseng root (Panax ginseng) - 19.8 mg, syti rhizome (Cyperus rotundus) - 19.8 mg.\nAuxiliary substances: gelatin.	BP-C normalizes the function of the cardiovascular system, improves the functioning of the liver, endocrine glands, and nervous system. It stimulates the immune function, increasing the body's defenses.\nAdults take 1 capsule 3 times a day with meals. The duration of admission is 2-3 weeks. If necessary, you can repeat it.	Individual intolerance to the components, pregnancy and lactation, copious menstruation in women.	\N
59	59	Normalizes the digestive function of the stomach, eliminates discomfort when eating\nBinds and neutralizes excess hydrochloric acid in the stomach\nIt has sorption properties	Excessively high acidity of the stomach, improving digestive function, can cause damage to the gastric mucosa and the duodenal bulb with the risk of ulcerative lesions. Throwing acidic stomach contents into the esophagus leads to damage to the lower third of the esophagus with the development of gastroesophageal reflux disease (GERD) and the occurrence of heartburn. One of the ways to combat the clinical consequences of increased gastric acidity is the appointment of medicines that envelop the mucous membrane of the esophagus and stomach, bind and partially neutralize hydrochloric acid and pepsin. Stomak Comfort is a complex product containing vegetable algae fibers (alginic acids), guar gum, isomalto-oligosaccharides, calcium carbonate, elm roots, ginger and licorice, papaya fruits. Stomak Comfort (stomach comfort) eliminates dyspeptic symptoms from the stomach (pain, acid belching, heartburn) associated with its increased secretory function. Neutralizes and binds hydrochloric acid, envelops and protects the mucous membrane of the esophagus, stomach and duodenum. It has an anti-inflammatory, antiseptic and wound healing effect, stimulates the secretion of mucus. Normalizes the digestive function of the stomach, eliminates discomfort when eating. It is not recommended for people with reduced secretion of hydrochloric acid\nA unique phyto-mineral formula that quickly and effectively relieves uncomfortable conditions in the stomach, including those associated with high secretory function.\nClinical trials of the product were conducted on patients with various pathologies of the stomach. When included in standard Stomac therapy, the comfort clinical manifestations (pain, bloating, stool disorders, heartburn) decreased more pronounced. The number of ulcers and erosions decreased significantly more than in the control group.	Xylitol is a substrate, creates an alkaline environment in the stomach cavity and promotes the destruction of bacteria.\nCalcium carbonate – neutralizes hydrochloric acid, reducing the acidity of the stomach.\nIsomalto-oligosaccharides are a fiber powder with a prebiotic function for feeding microflora, complement the effect of brown algae dietary fibers.\nAlginic acids of brown algae are a vegetable non–starchy polysaccharide, resistant to the action of hydrochloric acid and digestive enzymes. It has an enveloping and sorption effect, binds hydrochloric acid, enterotoxins, heavy metals (lead, mercury, cadmium, etc.).\nPapaya fruit concentrate (Carica papaya) – contains papain, an enzyme that breaks down proteins, works in the acidic environment of the stomach and has an anti–inflammatory effect.\nGuar gum (Cyamopsis tetragonoloba) is a soluble vegetable non–starchy polysaccharide resistant to hydrochloric acid and digestive enzymes. It has an enveloping and sorption effect, binds hydrochloric acid and enterotoxins.\nRusty elm (Ulmus rubra) – the bark contains mucus with an enveloping and bactericidal effect, tannins, catechins, flavonoids. Elm bark has a strong anti-inflammatory, wound-healing, astringent effect, which is important for inflammation and damage to the gastric mucosa.\nMedicinal ginger (Zingiber officinale) – has an antiseptic and immunomodulatory effect, suppresses the synthesis of pro-inflammatory prostaglandins, reducing inflammation and pain.\nLicorice naked (Glycyrrhiza glabra) – has an enveloping, anti-inflammatory and antispasmodic effect in gastritis against the background of increased acidity, peptic ulcer of the stomach and duodenum, increases mucus secretion.	Stomak Comfort dietary supplement is an additional source of glycyrrhizic acid, calcium, and contains papain.\n1 tablet contains: xylitol - 285 mg; fructose - 280 mg; calcium (in calcium carbonate) - 275 mg (27.5% of TSA); isomalto-oligosaccharides – 175 mg; alginic acids - 80 mg; papaya fruit concentrate (Carica papaya) - 40 mg; guar gum (Cyamopsis tetragonoloba) - 23 mg; rusty elm bark (Ulmus rubra) - 15 mg; ginger rhizome (Zingiber officinale) - 5 mg; licorice root extract (1:5) (Glycyrrhiza glabra) - 3 mg.\nAuxiliary ingredients: stearic acid, magnesium stearate, natural flavors.	Adults and children over 14 years of age should take, chewing, 1 tablet 2 times a day with meals.	Individual intolerance to the components, pregnancy and breast-feeding.	\N
65	65	Reduces cough and sore throat with colds and bronchitis.\nNormalizes the work of the respiratory system, restores the function of the bronchial tree, frees the airways from mucus.\nIt has an anti-inflammatory and antispasmodic effect.	Bres From (Ease of breathing) is a complex of plants that helps to normalize the work of the respiratory system and alleviate the condition of respiratory diseases. The combination of herbs helps to dilute and remove sputum, as well as protect the mucous membranes of the respiratory tract, reduce the inflammatory process.\nA unique phytoformula based on horseradish root, mullein, fenugreek, fennel and horseradish.	Horseradish (Armoracia rusticana) – has expectorant, anti-inflammatory, antimicrobial and analgesic effect.\nCommon mullein (Verbascum thapsus) – has a strong cleansing, expectorant, anti-inflammatory and wound healing effect, relieves spasms of smooth muscles, which is important for asthma and shortness of breath. It has antiviral activity against herpes and influenza viruses.\nFenugreek hay (Trigonella foenum-graecum) – seeds have anti-inflammatory and analgesic effect. It also has a sedative and antispasmodic effect, stimulates secretion. Helps to reduce cholesterol and normalize carbohydrate metabolism in diabetes mellitus.\nCommon fennel (Foenciculum vulgare) – has an antispasmodic and expectorant effect, dilates coronary and peripheral vessels.\nPoskonnik (Eupatorium perfoliatum) – has an anti-inflammatory, antispasmodic and soothing effect. It is used for diseases of the lungs and upper respiratory tract, as a refreshing breath and an analgesic. It stimulates the activity of macrophages, which determines its antibacterial properties. Posconnik was widely used by American Indians for diseases occurring with a high temperature, such as cholera, tropical fever, influenza, malaria and typhoid fever.	Dietary supplement Bres From is an additional source of flavonoids, contains essential oils.\n1 capsule contains: horseradish root (Armoracia rusticana) — 88 mg; leaves of mullein (Verbascum thapsus) — 88 mg; fenugreek seeds (Trigonella foenum-graecum) — 88 mg; fennel seeds (Foeniculum vulgare) — 88 mg; herb of horseradish (Eupatorium perfoliatum) — 88 mg.\nAuxiliary substances: gelatin.	Adults and children over 14 years of age should take 2 capsules 3-4 times a day with meals. The duration of admission is 1 month.	Individual intolerance to the components, pregnancy and breast-feeding.	\N
60	60	Source of 12 vitamins, 12 micro- and macroelements in an easily digestible form for a healthy lifestyle \nStrengthens the immune system \nSupports the full functioning of all body systems\nSource of B vitamins for normal nervous system function	Among the essential nutrition factors, the most important are vitamins and bioelements, the deficiency of which, with the current nature of nutrition, is inevitable in modern humans and does not depend on the season. Therefore, nutritionists recommend taking vitamin and mineral complexes (VMC) constantly throughout the year. The universal VMC "Super Complex" includes 12 vitamins and 12 of the most important bioelements in an easily digestible form, necessary for the normal functioning of the whole body in effective doses. The complex is enhanced with a patented blend of 7 phyto-ingredients, hesperidin and flavonoids of orange and grapefruit.\nA unique vitamin and mineral formula that includes phyto-ingredients and bioflavonoids that enhance the effect of the complex. Vitamins and bioelements are in an easily digestible form.	The formula includes vitamins C, D2, E, B1, B2, B3, pantothenic acid, B6, folic acid, B12, biotin and beta-carotene. Vitamins are an indispensable and irreplaceable part of the diet. They ensure the normal functioning of the body, are part of many enzymes, regulate metabolism, activate the immune system.\nThe block of bioelements includes: calcium (pantothenate, diphosphate), phosphorus (calcium phosphate), magnesium (oxide), potassium (bicarbonate, iodide), iron (fumarate), zinc (oxide), copper (gluconate), iodine (potassium iodide), chromium (amino acid chelate), manganese (amino acid chelate), molybdenum (amino acid chelate), selenium (amino acid chelate). Bioelements are essential nutrition factors. They are part of enzymes, provide water-electrolyte metabolism and electrical potential of cells, acid-base balance, are components of bone tissue, perform many other vital functions.\nCitrus bioflavonoids are antioxidants that are good for the heart, help protect brain functions, maintain connective tissue and improve blood circulation.\nHesperidin is a bioflavonoid, an antioxidant. Reduces the extensibility of veins, increases their tone, which helps to reduce venous congestion; reduces the permeability of capillaries and increases their resistance, improves microcirculation and lymph flow. Stimulates the production of collagen, promotes the strengthening of connective tissue,\nProtective mixture (dietary fiber with antioxidant and oncoprotective effect):\nBroccoli cabbage (Brassica oleracea) is rich in vitamins C, K, folic acid, calcium, iron, magnesium, phosphorus, potassium. It is an antioxidant, contains substances that can effectively resist the growth of cancer cells and the spread of the herpes virus.\nTurmeric (Curcuma longa) – the root has an antiseptic, antispasmodic effect, reduces intoxication in liver diseases, a powerful natural remedy that helps with inflammation and does not give side effects. Prevents the development of metastases in cancer patients with various forms of cancer.\nRosemary officinalis (Rosmarinus officinalis) is a strong stimulant and a source of several types of antioxidants. It contains iron, magnesium, phosphorus, potassium, sodium and zinc, which has a beneficial effect on strengthening the human immune system, has a tonic effect.\nBeetroot (Beta vulgaris) is a natural antiseptic used in violation of the gastrointestinal microflora.\nCommon tomato (Solanum lycopersicum) – contains antioxidants, reduces the risk of cancer.\nCarrot (Daucus carota) – has antiseptic and anti-inflammatory effect, a source of carotenoids.\nCabbage (Brassica oleracea) – promotes the elimination of cholesterol from the body, reduces blood sugar.	Dietary supplement Super Complex is an additional source of vitamins (E, D, C, B1, B2, B6, B12, PP, folic acid, pantothenic acid, biotin, b-carotene) and bioelements (iodine, copper, iron, zinc,).\n1 tablet contains:\nExcipients: microcrystalline cellulose, stearic acid, cellulose, silicon dioxide, magnesium stearate, shell for vitamin preparations (Carnauba wax, cellulose coating, purified water).	1 tablet 1 time a day with a meal. The duration of admission is 1 month. It is recommended to take 3-4 doses a year.	Individual intolerance to components, pregnancy, breast-feeding, conditions in which iodine preparations are contraindicated. Persons with thyroid disease are advised to consult an endocrinologist before use.	\N
61	61	It has an antioxidant and oncoprotective effect.\nProvides detoxification of the body.\nBlocks the action of estrogens in hormone-dependent tumors in women.	Brest Complex can be used for the prevention and treatment of some women's diseases, among them:\nprevention of oncological and dishormonal disorders in women;\nmastopathy, including fibrocystic;\npremenstrual syndrome;\nsome forms of infertility.\nA unique phytoformula of Active Longevity based on ancient recipes of China and Japan.	Common flax (Linum usitatissimum) – seeds contain up to 50% omega-3 PUFA and mucus, which have an enveloping and anti-inflammatory effect. It has weak estrogen-like activity, suppresses the activity of steroidogenesis enzymes in breast cells, exerting an oncoprotective effect.\nPomegranate (Punica granatum) – the bark and peel of fruits have anti-inflammatory, anthelmintic, fixing and oncoprotective effects.\nCalcium glucarate (calcium salt of glucaric acid) – participates in the formation of connective tissue elements, steroid hormones. It is a key factor in the detoxification process. It is found in apples, grapefruit, cherries, apricots, broccoli, Brussels sprouts. In the experiment, glucaric acid reduces the incidence of lung, skin, breast and colon cancer, prevents the induction of prostate cancer, which can be explained by its ability to bind and remove xenobiotics with carcinogenic activity from the body. Glucaric acid regulates hormonal balance in women and androgenic activity in men.\nKudzu or pueraria (Pueraria lobata) – the roots have strong estrogen-like activity. The ability of pueraria to have a hypotensive effect, relieve spasm of cerebral and coronary vessels, and reduce blood viscosity has been proven. Daidzein and cumestrol inhibit the activity of steroidogenesis enzymes in the endometrium, providing an oncoprotective effect.\nLutein is a carotenoid. It enters the body as part of vegetables and fruits, as well as eggs. Lutein and zeaxanthin formed from it in the tissues of the eye are antioxidants and inhibit the processes of peroxidation.\nGrifola curly or maitake (Grifola frondosa) is an edible mushroom. It has an adaptogenic and immunostimulating effect. Selectively inhibits the growth of atypical (cancer) cells, stimulates the activity of T-helpers. It is used as an adaptogen for chronic fatigue syndrome, secondary immunodeficiency, high blood pressure, diabetes mellitus.	Dietary supplement Brest complex is an additional source of lutein, contains tannins.\n1 capsule contains: linseed powder (Linum usitatissimum) - 267 mg; pomegranate extract (Punica granatum) - 75 mg; calcium D-glucarate - 75 mg; kudzu root extract (Pueraria lobata) - 50 mg; lutein (5%) - 24 mg (1.28 mg - 26.5%); Grifola curly (Grifola frondosa) - 4 mg.\nAuxiliary substances: magnesium stearate, gelatin.	Adults take 2-3 capsules a day with meals.	individual intolerance to dietary supplements, pregnancy and breast-feeding.	\N
62	62	Source of 12 vitamins, 12 micro- and macroelements in an easily digestible form for a healthy lifestyle in effective dosages\nStrengthens the immune system, improves performance\nSupports normal nervous system function \nA comprehensive source of dietary fiber and protein	Reducing food intake in weight loss programs, as well as low–quality products for daily nutrition inevitably entail a shortage of nutrients - vitamins, bioelements, carotenoids, etc., many of which are indispensable nutrition factors. One of the ways to correct such a deficiency is to include nutrients in the diet additionally in the form of dietary supplements.\nTNT (Eng. Total Nutrition Today – Full Nutrition today) is a complex product containing 12 vitamins and 12 bioelements, beta–carotene, lecithin, a mixture of dietary plant fibers, carbohydrates and protein. It allows not only to overcome the lack of essential nutrition factors, but also to replace one of the daily meals with a low-calorie food product. You just need to dilute the powder in water – and the drink is ready. It has a pleasant neutral taste, is useful for adults and for children. TNT is recommended for daily use, when doing sports, fitness, in weight correction programs and when traveling.\nA unique vitamin and mineral formula, enhanced with vegetable fibers, containing carbohydrates and proteins, in the form of a dry mixture for making a drink with a pleasant neutral taste. In weight loss programs, one meal can replace one meal. Low-calorie product: per serving 19 g - 7.8 g of carbohydrates, 70 kcal.	Vitamins: A, C, D3, E, B1, B2, B3, pantothenic acid, B6, folic acid, B12, biotin.\nVitamins are an indispensable and irreplaceable part of the diet. They ensure the normal functioning of the body, are part of many enzymes, regulate metabolism, activate the immune system.\nBioelements: calcium and phosphorus (tricalcium phosphate), magnesium (oxide), potassium (bicarbonate, iodide), iron (fumarate), zinc (gluconate), copper (citrate), manganese (citrate), iodine (potassium iodide), chromium (chloride), molybdenum (citrate), selenium (selenomethionine).\nBioelements are essential nutrition factors. They are part of enzymes, bone tissue, provide water-electrolyte metabolism and electrical potential of cells, acid-base balance, perform many other vital functions.\nDietary plant fibers are necessary for the normal functioning of the gastrointestinal tract, detoxification of the body and ensuring the assimilation of vitamins and bioelements that are part of the complex.\nFructose and maltodextrin (carbohydrates) are a source of energy, give the drink a sweet taste.\nSodium caseinate – contains a complete protein.\nProtective mixture (dietary fiber with antioxidant and oncoprotective effect):\nbroccoli flowers, tomatoes, carrots, cabbage, spinach and celery – contain antioxidants and other biologically active substances.\nTNT in your diet will make up for the deficiency of vitamins, bioelements and dietary fiber.	1 measuring spoon (19 g) contains:\nExcipients: non-dairy whitener (high oleic non-hydrogenated sunflower oil, maltodextrin, sodium caseinate (obtained from milk), mono and diglycerides, dicalia phosphate, soy lecithin, tocopherols), natural flavor (dry buttermilk), natural flavors, salt, cellulose, citrus pectin, montmorillonite (kaolinite).	Stir the contents of 1 measuring spoon until completely dissolved in 1 cup of warm or cold water. Do not use boiling water. Take adults 1 glass a day with meals. The duration of admission is 1 month.	Individual intolerance to components, pregnancy, breast-feeding.	\N
63	63	It has antibacterial, antifungal, antiviral, blood-purifying and anticoagulant effects\nAntioxidant, oncoprotector\nStimulates immune function, a universal longevity product	Una de Gato NSP is a complex of three plants: uncaria (cat's claw), astragalus and echinacea, which has antiviral, antibacterial, antifungal, anti–inflammatory, cytostatic effects.\nA unique phytoformula with a complex action.	Una de Gato (Una de Gato) or Uncaria hairy (Uncaria tomentosa) is a wild–growing creeper of the Peruvian jungle, in the shape of spikes resembling a cat's paw with claws. The bark has a pronounced immunostimulating effect, activates macrophages and T-lymphocytes. Prevents platelet aggregation and the formation of blood clots, causes a decrease in blood pressure. It has antioxidant, antiviral, antitumor and anti-inflammatory effects. It is used for immunodeficiency and allergic diseases, inflammatory diseases of the gastrointestinal tract, stomach ulcers, poisoning, dysbiosis, diseases of the genitourinary system, acute and chronic viral (shingles, genital herpes), bacterial and fungal infections, arthritis, rheumatism, diabetes, skin ulcers, menstrual cycle disorders. Cat's claw extract suppresses cell division, which is why it is used in oncology.\nAstragalus membranaceus (Astragalus membranaceus) – dilates coronary vessels, lowers blood pressure, has an immunostimulating effect. Enhances the production of interferon, contributing to the body's resistance to viral infections; supports the normal function of the immune system under high physical and mental stress, secondary immunodeficiency, including in cancer patients (stimulates the activity of NK killer cells).\nEchinacea purpurea (Echinacea purpurea) – the Indians of North America, the birthplace of echinacea, have used this plant since time immemorial as a means of acting against infectious diseases and increasing the level of protective forces. They used echinacea for snake bites (hence another name – "snake root"). The root of the plant increases the body's resistance to viral infections. It has cortisone-like activity and accelerates wound healing. Echinacea increases the number of white blood cells, activates macrophages, granulocytes and T-lymphocytes. Some polysaccharides of the plant, acting on certain T-lymphocyte receptors, cause increased production of interferon. It has been proven that echinacea has bacteriostatic, fungicidal, antiviral, antiallergic effects, being a universal and safe herbal antibiotic, is effective in chronic inflammatory diseases (rheumatism, polyarthritis, prostatitis, gynecological diseases), upper respiratory tract diseases, various wound processes (trophic ulcers, osteomyelitis), microbial eczema. Oncoprotector, blocks the division of cancer cells.	Dietary supplement Una de Gato NSP is a source of hydroxycinnamic acids.\n1 capsule contains: the inner bark of a cat's claw (Uncaria tomentosa) - 300 mg; the root of Astragalus membranaceus (Astragalus membranaceus) - 121 mg; the root of Echinacea purpurea (Echinacea rigrigea) - 25 mg.\nAuxiliary substances:microcrystalline cellulose, magnesium stearate, gelatin.	Adults take 1-2 capsules 1 time a day with meals. The duration of admission is 12-15 days. If necessary, the reception can be repeated.	Individual intolerance to components, pregnancy, breast-feeding.	\N
64	64	It has a mild diuretic effect, supports the normal functioning of the kidneys\nIt has antibacterial and anti-inflammatory effect\nPrevents the formation and promotes the dissolution of sand and stones in the urinary system\nPromote the excretion of uric acid salts from the body, prevent the deposition of crystals in the joints and urinary tract	Supporting the normal functioning of the kidneys is an extremely important task of supporting human health. Uro Lux has a multifaceted effect, improving kidney function. This is a plant complex of cranberries, parsley, hydrangea, corn stigmas, lemongrass, horsetail, marshmallow, dandelion, angelica, hops, barosma, lemon bioflavonoids, enhanced with vitamins C, B1, B2, PP, pantothenic and folic acid. It has antibacterial and diuretic effects, relieves puffiness.\nA unique phyto-vitamin formula that improves kidney function and supports kidney health.	Vitamin C – has an antioxidant effect, improves blood flow, stabilizes the wall of blood vessels, is indicated for nephritis and cystinuria.\nVitamins B1, B2, PP, pantothenic and folic acids – stimulate energy production, regulate renal metabolism, support immune function.\nPotassium and magnesium – help to stabilize the balance of electrolytes that are lost through the kidneys.\nHesperidin is a bioflavonoid, promotes the production of collagen, strengthens the walls of blood vessels, improves peripheral blood circulation and lymph flow, reduces blood viscosity. It has an antioxidant, vasoprotective, antiallergic, immunostimulating, antispasmodic effect. It is a nephroprotector.\nAmerican cranberry (Vaccinium macrocarpon) – relieves vasospasm, has anti-inflammatory, wound-healing, capillaroprotective and antioxidant effects. Cranberry has an antimicrobial effect on pyelonephritis and cystitis, enhances the effect of antibiotics and sulfonamides. Cranberry juice helps with urinary tract infections, prevents the formation of kidney stones. Cranberries prevent the attachment of bacteria to the walls of the mucous membranes of the genitourinary system, promotes their excretion from the body.\nCurly parsley (Petroselinum crispum) is useful for edema, has a strong diuretic effect, removes excess fluid and uric acid salts from tissues. Its greens contain retinol, ascorbic acid, thiamine, riboflavin, nicotinic acid, carotene, flavonoids, phytoncides. Fresh parsley juice stimulates the kidneys, normalizes the function of the adrenal glands and thyroid gland. Essential oils can provide an antibiotic effect in urinary tract infections. When using parsley, the tone of the smooth muscles of the uterus (!), intestines, and bladder increases. Parsley preparations are used for cystitis, urolithiasis, edema, (contraindicated in nephritis), with inflammation of the prostate gland.\nHydrangea arborescens (Hydrangea arborescens) – has a mild diuretic and wound healing effect, promotes the excretion of harmful substances from the body through the kidneys, reduces edema. It helps with chronic inflammatory diseases of the urinary tract, urine-acid (salt) diathesis, chronic inflammatory diseases of the female genital area. Hydrangea normalizes water-salt metabolism. Its active substances contribute to the excretion of uric acid from the body, preventing the deposition of crystals in the joints and urinary tract, have an antimicrobial effect.\nCorn stigmas (Zea mays) are fibers that are located around the corn cob. They are collected during the period of milky-waxy ripeness. Corn stigmas contain: vitamins C, E, K1, pantothenic acid, carotenoids, selenium, inositol, sterols, saponins, glycosides. It is a choleretic, diuretic, hemostatic agent, helps to eliminate inflammatory processes in men with symptoms of inflammation of the urinary tract. Regular intake improves potency. For women, in addition to improving sleep, the therapeutic effect is expressed in reducing uterine bleeding, inflammation in gynecological diseases, and urinary tract infections. Long-term use promotes the dissolution of stones (carbonates, urates, phosphates) in the ureters and kidneys. Corn stigmas are effective for edema associated with diseases of the cardiovascular system.\nChinese lemongrass (Schizandra chinensis) – has anti-inflammatory, antioxidant, antibacterial, tonic and adaptogenic effect, stimulates the central nervous system. Fruits contain a lot of organic acids – citric, malic, tartaric, oxalic, amber, ascorbic, rich in antioxidants, stimulate the heart and respiration, increase blood pressure. They are indicated for vegetative-vascular dystonia of the hypotonic type, in the period after infectious diseases, with fatigue, decreased performance, with impaired sexual function against the background of stress and neuroses.\nMarshmallow officinalis (Althaea officinalis) – the roots have an anti-inflammatory effect, stimulate the secretion and regeneration of tissues. They have an immunostimulating effect, increase the phagocytic activity of macrophages and the number of lymphocytes, stimulate humoral and cellular immunity.\nDandelion officinale (Taraxacum officinale) – the root has antibacterial, antiviral, fungicidal, anthelmintic, anticancerogenic, hepatoprotective, antispasmodic effect.\nAngelica or Chinese angelica (Angelica sinensis) – the active substances of the root prevent spasms, dilate blood vessels. They have anti-inflammatory, antispasmodic, diuretic effect, enhance gastric secretion.\nCommon hops (Humulus lupulus) – inflorescences are used as an analgesic for kidney stones, inflammation of the bladder, pyelonephritis, cystitis and frequent urge to urinate, urinary incontinence, as a sedative, antispasmodic. The extract from hop cones has strong estrogenic activity.\nHorsetail (Equisetum arvense) – has a diuretic, hemostatic, anti-inflammatory, bactericidal effect, promotes the removal of lead from the body. Silicic acid and its salts are part of most body tissues, affect the formation of bone tissue, collagen. Horsetail stimulates the regeneration of connective tissue and the activity of endocrine glands.\nBarosma birch or bucco (Barosma betulina) – the leaves have an antiseptic effect, have a diuretic effect. It is used for inflammation of the urinary tract – prostatitis, urethritis and cystitis.\nHesperidin (lemon bioflavonoid) is an antioxidant. Reduces the extensibility of veins, increases their tone, which helps to reduce venous congestion; reduces the permeability of capillaries and increases their resistance, improves microcirculation and lymph flow. It stimulates the production of collagen, promotes the strengthening of connective tissue.	1 capsule contains:\nAuxiliary substances: gelatin, microcrystalline cellulose, silicon dioxide, magnesium stearate.	Adults take 1 capsule 2 times a day with meals. The duration of admission is 1 month. After 1-2 months, the reception can be repeated.	Individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
154	154	\N	Compilers:\nDepartment of Urology and Andrology of the Ural State Medical Academy of Additional Education, Andrological Department of the City Hospital No. 5, Chelyabinsk.\nCandidate of Medical Sciences V.F. Bavilsky, Head. department Matygin A.S.\nDepartment of Preventive Medicine of the FPKMR RUDN\nDruzhinin P.V. - Head of the Department\nNovikov A.F. - Senior researcher of the Department, scientific consultant of the NSP.\nContent: 1.\nAndrogen deficiency. 2.\nErectile dysfunction. 3.\nMale infertility. 4.\nWays to maintain men's reproductive health. 5.\nMenopausal disorders in men and their correction. 6.	\N	\N	\N	\N	\N
66	66	Contribute to the prevention of infectious diseases\nStimulate the immune system\nActivate regeneration and promote wound healing\nImprove men's reproductive health and puberty	Zinc is a macronutrient, part of more than 300 enzymes, regulates protein biosynthesis, including collagen, which accelerates wound healing. It is necessary for the formation of bones and connective tissue, including cartilage. With zinc deficiency, growth suffers and cell division slows down. Zinc is part of the antioxidant enzyme superoxide dismutase, part of insulin, increases and restores taste and olfactory sensitivity. People with zinc deficiency usually suffer from infectious diseases often and for a long time. Zinc protects the liver from toxins. The important role of this macronutrient in the process of spermatogenesis and puberty is known, its deficiency leads to benign prostatic hyperplasia. With zinc deficiency, visual acuity decreases, anemia develops, allergic dermatitis appears, and allopecia develops.\nA decrease in the level of zinc in the body is not a rare phenomenon and can be caused by diarrhea, kidney disease, liver cirrhosis, diabetes mellitus, high levels of fiber intake, which increases the excretion of zinc with feces. In this case, it is necessary to obtain an additional amount of zinc in the composition of vitamin products. Lozenges with zinc are a complex product that contains zinc, vitamin C, glycine and a number of plant ingredients.\nA unique phyto-vitamin-mineral formula based on zinc in the form of tablets for resorption. Allows you to select an individual dosage of zinc in accordance with the current physiological need.\nThere are results of clinical trials conducted in a group of patients with erectile dysfunction on the background of chronic prostatitis in basic therapy with additional intake of dietary supplements Protease Plus and dietary supplements Lozenges with zinc (1 tablet per day sublingually). The results of the extended therapy compared with the basic one: an improvement in erection by 50% (+39% - the base group), orgasm - by 34% (27%), libido - by 24% (165), the quality of sexual intercourse - by 39% (29%).	Zinc is a part of enzymes, responsible for protein synthesis. It is necessary for the formation of bones and connective tissue, vision. Zinc-containing enzymes are involved in the synthesis of RNA and DNA and it is necessary for normal growth. It is a part of insulin, increases taste and olfactory sensitivity. The formation of immunity is impossible in conditions of zinc deficiency. It has a hepatoprotective effect. It is extremely important for spermatogenesis and puberty, its deficiency leads to benign prostatic hyperplasia. With zinc deficiency, anemia develops, allergic dermatitis, baldness appear, the clinical severity of influenza and mortality increases.\nVitamin C is a key water–soluble antioxidant, activates the production of interferon, stimulates the formation of collagen. In combination with bioflavonoids, vitamin C ensures the structural integrity of the capillary walls.\nGlycine is an interchangeable amino acid, found in large quantities in the cells of the brain and spinal cord. It has a sedative effect, reduces irritability, normalizes sleep, improves metabolic processes in brain tissues, weakens the craving for alcohol, has a positive effect on muscular dystrophy, participates in collagen synthesis. Glycine participates in detoxification processes by binding various endogenous and exogenous compounds.\nRusty elm (Ulmus rubra) – the bark of which contains mucus with bactericidal action, tannins, catechins, flavonoids, magnesium.It has a strong anti-inflammatory, wound-healing effect, is effective for renal and hepatic colic, joint pain.\nArabinogalactan is a water–soluble plant polysaccharide, often found in plants, fungi and bacteria, coniferous trees. It supports the immune system by increasing the activity of natural killer cells and macrophages.\nGuar gum (Cyamopsis tetragonoloba) is a vegetable, water–soluble, non-starchy polysaccharide that reduces the absorption of sugars and cholesterol from the intestine and reduces the level of sugar and cholesterol in the blood.\nEchinacea purpurea (Echinacea purpurea) – the Indians of North America, the homeland of echinacea, used this plant as a means of acting against infectious diseases and increasing the body's defenses. Caffeic acid glycoside, which is contained in the root of the plant, increases the body's resistance to infectious and viral infections. Another component, echinacin, has cortisone–like activity and accelerates wound healing. Echinacea increases the number of leukocytes, activates macrophages, granulocytes and T-lymphocytes, causes increased production of interferon. It has antibacterial, fungicidal and antiviral effects, has antiallergic and adaptogenic properties, is effective in inflammatory diseases (rheumatism, polyarthritis, prostatitis, gynecological diseases), diseases of the upper respiratory tract, various wound processes (trophic ulcers, osteomyelitis), microbial eczema.\nLicorice naked (Glycyrrhiza glabra) – known for its enveloping, expectorant and mild laxative effect. It stimulates secretion, increases the fluidity of mucus in the lungs and bronchioles, therefore licorice root is included in the composition of expectorants for lung diseases accompanied by cough. Licorice is used as an anti-inflammatory and antispasmodic agent to reduce muscle spasm, the effects are due to the action of bioflavonoids. Licorice is a natural stimulant of pancreatic activity, increases insulin production.	Dietary supplement Lozenges with zinc is an additional source of zinc and vitamin C.\n1 lozenge contains: zinc (in zinc acetate) - 5 mg (41.7% of ASP); fructose – 410 mg (1.17% of ASP); xylitol - 150 mg (1% of ASP); maltodextrin - 242.4 mg; vitamin C (ascorbic acid, sodium ascorbate) - 100 mg (111% of ASP); glycine - 75 mg (3% of ASP); rusty elm bark (Ulmus rubra) - 25 mg; arabinogalactan (Cyamopsis tetragonoloba) - 15 mg; guar gum - 20 mg; Echinacea purpurea root (Echinacea rigrigea) - 10 mg; licorice root extract (Glycurrhiza glabra) - 5 mg.\nExcipients: cellulose, non-dairy whitener (sunflower oil whitener, calcium caseinate, dicalcium phosphate, maltodextrin), stearic acid, orange flavor, peach flavor, magnesium stearate (rast.), silicon dioxide, eucalyptus leaf oil, L-menthol, peppermint herb oil.	Adults take 1-2 lozenges a day with meals. The duration of admission is 1 month.	Individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
67	67	It has an anti-allergic effect.\nNormalizes the digestive system.\nImproves liver function, has a choleretic effect.\nIt has an anti-inflammatory and antispasmodic effect in lung diseases.	Buplerum Plus is a complex that includes 12 herbs, helps fight inflammation and allergies. It normalizes lung function, has an antispasmodic, analgesic effect, increases secretion and dilutes sputum.\nA unique phytoformula of Active Longevity based on recipes of Chinese medicine. The composition of 1 capsule contains 4.0 mg of flavonoids (rutin) (13.3% of the adequate daily requirement), 3.8 mg of glycyrrhizic acid (38% of TSA).	Buplerum or Chinese volodushka (Bupleurum chinense) – roots are widely used in Chinese medicine as an anti-inflammatory and analgesic. They support the body's ability to fight inflammation by stimulating the production of cortisone, a hormone of the adrenal cortex. Buplerum also eliminates inflammation in allergic reactions, preventing the synthesis, release and action of histamine. It has a calming and choleretic effect. Improves liver function by increasing its glycogen content, promotes protein synthesis.\nMilk–flowered peony (Paeonia lactiflora) - the root has anti-inflammatory, antispasmodic, sedative effect, improves sleep. It is used for hypermenorrhea, vegetative-vascular diseases.\nTyphonium flagelliforme (Typhonium flagelliforme) – belongs to the class of aroids, contains ribosomal active protein (RIP), antioxidants, arginine, a number of methyl esters. Typhonium stimulates the immune system in resisting oncological diseases of the breast, intestines, rectum, prostate, liver, cervix, leukemia, exerting cytotoxic and antiproliferative effects. It is used as an expectorant for bronchitis, an antiemetic for early toxicosis of pregnant women, as an analgesic.\nChinese cinnamon or cassia (Cinnamomum cassia) – the bark is used as a spice called cassia, it tastes like cinnamon. It has a bactericidal and fungicidal, antispasmodic and analgesic effect, reduces blood sugar levels.\nAngelica or Chinese angelica (Angelica sinensis) – the root is able to prevent spasms, dilate blood vessels, reduce blood viscosity, improving peripheral blood circulation. It has an anti-inflammatory and soothing effect, enhances secretion.\nTinder mushroom (Poria cocos) is a fungus growth on a pine tree. Protects the urinary system from tumors, inhibits the growth of prostate cancer cells. It has a pronounced immunomodulatory effect: they activate macrophages, the production of T-helper cells, NK cells. Prevents the development of nephritis, has a hypoglycemic effect. The mushroom also has a tonic effect.\nBaikal skullcap (Scutellaria baicalensis) – the root has an antispasmodic, soothing, antipyretic, expectorant and anthelmintic effect. Prescribed for rheumatism, bronchitis, pneumonia.\nBitter orange or orange (Citrus aurantium) – active substances of fruits enhance lipolysis and increase thermogenesis. Essential oils have antiseptic, antimicrobial, anti-inflammatory, antitoxic, analgesic, antispasmodic, expectorant, diaphoretic, antidepressant, tonic effect.\nAtractilodes large–headed (Atractilodes macrocephala) - the root has an anti-inflammatory, diuretic and tonic effect.\nCommon ginseng (Panax ginseng) – the roots are used as an adaptogen and tonic. Ginseng increases physical and mental performance, improves the functioning of the cardiovascular system, normalizes blood pressure.\nMedicinal ginger (Zingiber officinale) – the rhizome suppresses the synthesis of pro-inflammatory prostaglandins, reducing inflammation and pain.\nLicorice naked (Glycirrhiza uralensis) – known for its enveloping, expectorant and mild laxative effect. Enhances secretory function and increases the activity of the ciliated epithelium in the trachea and bronchi. It stimulates secretion, therefore licorice is included in the composition of expectorants, diuretics and laxatives. It has an antispasmodic effect on the smooth muscles of the bronchi. Licorice contains substances similar in structure to cortisol, which have an extremely strong anti-inflammatory and antihistamine effect.	Dietary supplement Buplerum Plus is an additional source of flavonoids, glycyrrhizic acid, contains gingosides.\n1 capsule contains: roots of Chinese volodushka (Bupleurum chinese) - 77.6 mg; roots of milk-flowered peony (Paeonia lactiflora) - 58.2 mg; typhonium flagelliforme (Typhonium flagelliforme) - 48.5 mg; bark of Chinese cinnamon (Cinnamomum cassia) - 43.6 mg; roots of angelica (Angelica sinensis) - 38.8 mg; tinder mushroom (Poria cocos) - 38.8 mg; Baikal skullcap roots (Scutellaria baicalensis) - 38.8 mg; bitter orange fruits (Citrus aurantium) - 38.8 mg; large-headed atractylodes roots (Atractylodes macrocephala) - 29.1 mg; common ginseng root (Panax ginseng) - 29.1 mg; medicinal ginger root (Zingiber officinale) - 24.2 mg; Ural licorice root (Glycirrhiza uralensis) - 19.4 mg.\nAuxiliary substances: gelatin.	Adults take 2 capsules 2 times a day with meals. The duration of admission is 1 month.	Individual intolerance to components, pregnancy, breast-feeding.	\N
68	68	Improves the functioning of the gastrointestinal tract\nIt has a hepatoprotective and antiallergic effect\nHelps to improve the condition of the skin	\N	Burdock or burdock (Arctium lappa) – the root enhances the secretion of bile and pancreatic enzymes, stimulates intestinal motility. It is used for liver diseases, bile and kidney stones, constipation, hemorrhoids, gout, articular rheumatism. Burdock has anti-inflammatory, diuretic, antibacterial and fungicidal effects. The antiallergic effect of burdock is known to improve the condition of the skin and reduce itching. In dermatological practice, burdock is used for eczema, psoriasis, furunculosis, acne, dandruff. Externally – as baths for inflammation of the sebaceous glands, with lichen and fungus on the legs, as rinsing for ulcerative stomatitis and gum inflammation.	Dietary supplement Burdock is an additional source of inulin.\n1 capsule contains: burdock roots (Arctium lappa) — 360 mg.\nExcipients: cellulose, magnesium stearate, silicon dioxide, gelatin.	Adults take 2 capsules 2 times a day with meals for 3-4 weeks. If necessary, the reception can be repeated.	Individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
69	69	Promotes the formation and restoration of bone tissue\nStrengthens the walls of blood vessels\nNormalizes the nervous system	A unique vitamin and mineral formula that includes the main macro- and microelements in optimal amounts necessary for maximum absorption of calcium. The optimal ratio of calcium, magnesium and phosphorus in the composition, which is important for the exchange of these bioelements. There are clinical trials proving the effectiveness of this product in the treatment of osteoporosis.\nCalcium Magnesium Chelate contains calcium, magnesium and phosphorus in an easily digestible form (in the form of chelates and citrate). These bioelements are necessary for children to strengthen bone tissue during growth, as well as for women suffering from a lack of calcium and magnesium, especially during pregnancy, lactation, menopause. The composition of Calcium Magnesium Chelate also includes vitamin D3 (cholecalciferol), which promotes the absorption of calcium and helps restore bone tissue, as well as alfalfa, which contains ergocalciferol (vitamin D2) and phytoestrogens that help restore bone tissue in menopausal women.	Calcium – promotes the formation of bone tissue, participates in the transmission of a nerve signal, muscle contraction. Strengthening of bone tissue is especially important in old age, when calcium absorption decreases and its leaching from bones increases. As a result, osteoporosis (rarefaction of bone tissue) can develop, leading to frequent fractures with subsequent long-term recovery.\nMagnesium is also a part of bone tissue. In addition, magnesium performs many other important functions in the body. Lack of it leads to headaches, chronic fatigue, depression, seizures. Adequate supply of magnesium contributes to the fastest overcoming of stress, nervous overload.\nVitamin D3 (cholecalciferol) – helps to prevent osteoporosis and improve the absorption of calcium and phosphorus. Supports a strong immune system. It has a positive effect on skin health. Improves mood, increases vitality\nAlfalfa seed (Medicago sativa) – helps restore normal estrogen levels, is necessary for women during menopause and for the prevention of osteoporosis. It is rich in protein, vitamin D2, phytoestrogens, chlorophyll. Promotes the healing of erosions, ulcers, open wounds, helps in the fight against infection, increases the elasticity of the arteries, lowers cholesterol, triglycerides and blood sugar, increases hemoglobin content.	Dietary supplement Calcium Magnesium Chelate is an additional source of vitamin D, calcium, magnesium, phosphorus.\n1 tablet contains: calcium (in l-asparaginate, citrate, diphosphate) - 250 mg (25.0% of ASP); magnesium (in asparaginate, citrate, oxide) - 125 mg (31.3% of ASP); phosphorus (in dicalcium phosphate) - 140 mg (17.5% of ASP); vitamin D3 (cholecalciferol) - 133 ME (3.33 mcg - 33.3% of TSA); alfalfa (Medicago sativa) - 2 mg.\nExcipients: cellulose, magnesium stearate, microcrystalline cellulose, tablet coating (Carnauba wax, cellulose coating, purified water).	Adults take 1 tablet a day with meals. The duration of admission is 1 month. It is recommended to take 3-4 doses a year. If necessary, the reception can be repeated.	Individual intolerance to the components, pregnancy and breast-feeding.	\N
70	70	It has antibacterial and antiviral effect\nReduces blood viscosity, blood pressure, improves microcirculation\nReduces cholesterol in the blood	Pepper, Garlic, Parsley complex can be used for colds (pharyngitis, tonsillitis, otitis, arthritis, pneumonia, bronchitis), hypertension, atherosclerosis, myocardial infarction, coronary heart disease, thrombophlebitis, varicose veins, cerebral circulation disorders, intestinal infections, cystitis, urolithiasis.\nThe Maya Indians also used pepper to relieve pain and cough, for sore throats and other respiratory diseases. By the way, the history of the formation of Nature's Sunshine Products is also connected with this useful, but incredibly burning fruit. The desire to eliminate the sharp, bitter taste of pepper led the founder of the company Gene Hughes to organize the production of dietary supplements in capsules. Pepper, Garlic, Parsley complex can be used for colds (pharyngitis, tonsillitis, otitis, arthritis, pneumonia, bronchitis), hypertension, atherosclerosis, myocardial infarction, coronary heart disease, thrombophlebitis, varicose veins, cerebral circulation disorders, intestinal infections, cystitis, urolithiasis.	Cayenne pepper (Capsicum annuum) belongs to the group of hot peppers, which contains the alkaloid capsaicin, which gives it burning, beta–carotene and vitamin C. It has antiseptic and anti-inflammatory effects, improves the functioning of the cardiovascular system, relieves vascular spasm, dilating blood capillaries, reduces blood viscosity and blood pressure. Pepper accelerates scarring of ulcers, stimulates the secretion of saliva, mucus, has a choleretic effect. It has an inhibitory effect in prostate cancer.\nGarlic seed (Allium sativum.) — contains essential oil, allicin, to which it owes a specific smell, taste and powerful antibacterial effect. Reduces cholesterol levels in the blood, reduces blood viscosity and blood pressure, preventing the risk of cardiovascular diseases and stroke. It has antiviral and antifungal, anthelmintic action, is a natural antibiotic. It improves the secretory and motor function of the gastrointestinal tract, stimulates the secretion of bile, has a mild soothing effect. Garlic has long been famous as a means of increasing potency in men, thanks to improved blood circulation and increased blood flow to the pelvic organs. Studies show that garlic is able to protect the body from cancer (especially stomach and colon cancer).\nSeed parsley (Petroselinum crispum) is one of the most popular garden crops. Parsley greens are rich in vitamin C, beta-carotene, chlorophyll. It contains a rich set of vitamins, mineral salts and other active substances. Increases the tone of the smooth muscles of the intestine, bladder and uterus. Normalizes the function of the adrenal glands and thyroid gland. Essential oils of parsley have an antibiotic effect. Myristicin prevents the risk of developing cancer. At the same time, parsley preparations increase the risk of termination of pregnancy, as they stimulate the smooth muscles of the uterus. Parsley preparations are used for cystitis, urolithiasis, edema, renal spasms (contraindicated in nephritis), with inflammation of the prostate gland.	Dietary supplements Pepper, Garlic, Parsley are an additional source of flavonoids, allicin.\n1 capsule contains: garlic (Allium sativum) - 250 mg; cayenne pepper (Capsicum annuum) - 125 mg; parsley (Petroselinum crispum) - 125 mg.\nAuxiliary substances: gelatin.	Adults take 1-2 capsules 2 times a day with meals. The duration of admission is 3-4 weeks with repeated admission if necessary.	Individual intolerance to components, pregnancy, breast-feeding.	\N
170	170	\N	This edition has been in existence for many years, is regularly reprinted and improved. This book is an indispensable source of information for those who want to know how our products work, what they consist of, how to use them. The latest edition was updated with a description of last year's novelty: toothpaste with xylitol and soda, we also updated information on Colloidal minerals, which are now offered on Acai berry juice. One of the latest improvements is a convenient Application in which you can now see which of our products contain certain medicinal plants, vitamins, trace elements, biologically active substances, as well as their quantity, which also simplifies the choice of products. In addition, the cover design has become more modern and is made in the corporate style of the NSP company.	\N	\N	\N	\N	\N
71	71	Suppresses the growth of fungi in the gastrointestinal and genitourinary tract\nIt has antibacterial and antiparasitic effects\nNormalizes the digestive system	A unique complex including caprylic acid, elecampane, black walnut and raspberry leaves, which suppress the vital activity of fungi and helminths, normalize the intestinal microflora, reduce inflammation in the gastrointestinal tract.\nViolation of intestinal microbiocenosis (a change in the ratio of representatives of the intestinal microflora) is called dysbiosis. This is a common phenomenon that may be accompanied by an increase in the number of pathogenic bacteria, for example, Staphylococcus or yeast-like fungi of the genus Candida, which may be present in the normal microflora of the mouth, vagina and colon of most healthy people. Candidiasis disease is caused not just by the presence of fungi of the genus Candida, but by their reproduction in large numbers. Candidiasis most often occurs with a decrease in general and local immunity. In women, candidiasis is more often manifested in the form of vulvovaginitis, urethritis and cystitis are less common. Men are characterized by inflammation of the foreskin, urethritis, and with inflammation of the prostate gland, prostatitis can develop. In many cases, candidiasis spreads to many organs, affecting the mucous membranes (oral cavity, intestines, genitourinary system). Most people are carriers (nails, intestines, etc.) of candidiasis blastospores, but normally the latter are in a "dormant" state. Candide growth is inhibited by other bacteria and the immune system. During pregnancy, taking estrogen-containing drugs (for example, oral contraceptives) and antibiotics, yeast-like fungi can "go into growth".\nThe complex with caprylic acid is recommended to be prescribed for stomatitis, periodontal disease, cystitis, urethritis, vulvovaginitis, prostatitis, enterocolitis, dysbiosis and after the end of the course of antibiotics. It is possible to combine the reception of the complex with Bifidophilus Flora Force NSP and Chlorophyll.	Caprylic acid is a medium chain fatty acid derived from coconuts. Caprylic acid inhibits the growth of yeast fungi (first of all, the genus candida) and maintains a normal balance of microorganisms in the colon, genitourinary system and on the skin, without affecting beneficial saprophytic bacteria.\nDevyasil high (Inula helenium) – the root has an anti-inflammatory, choleretic, expectorant effect, which in combination with antimicrobial and anthelmintic action makes it an invaluable remedy for diseases of the gastrointestinal tract. Reduces increased motility and secretion, improves appetite. Devyasil is used for diseases of the liver and gallbladder, hemorrhoids, as well as respiratory diseases.\nBlack walnut (Juglans nigra) – green peel has an antiparasitic, antifungal, choleretic, anti-inflammatory, astringent effect, also helps to cleanse the skin with exudative diathesis, eczema, herpes, psoriasis, ringworm. It is used for some forms of tuberculosis (skin, larynx), tuberculous lymphadenitis, bronchial asthma. Tannins are responsible for the destruction of parasites, which also inhibit the growth of yeast fungi and other opportunistic microflora. The ancient Greeks and Romans used black walnut for skin and fungal diseases, American Indians – for intestinal worms.\nRed raspberry leaves (Rubus idaeus) – the leaves have astringent (fixing), antitoxic, antispasmodic effect. It is used for diseases of the urinary tract and colds, cough, fever. Infusion or decoction of leaves is taken for gastric bleeding, and also gargle with sore throat.	Dietary supplement Complex with caprylic acid is a source of caprylic acid, contains tannins.\n1 capsule contains: caprylic acid - 300 mg; elderberry root (Inula helenium) - 36 mg; walnut peel (Juglans nigra) - 32 mg; red raspberry leaves (Rubus idaeus) - 32 mg.\nExcipients: maltodextrin, gelatin.	Adults take 2 capsules 2 times a day with meals. The duration of admission is 2-3 weeks.	Individual intolerance to components, pregnancy, breast-feeding.	\N
72	72	Ensures the regularity of the chair\nHelps to remove toxic substances from the body\nNormalizes the function of the digestive system	A unique phytoformula that helps to effectively and gently solve the problem of constipation. It is not addictive.\nOne of the most common consequences of intestinal disorders is constipation, which affects more than half of middle-aged and older people. The famous French surgeon Andre Lamour testifies: "We can say with all confidence that the main cause of 90% of the serious diseases that humanity suffers from is constipation and retention of fecal masses that clog the intestines." In many cases, this opinion is quite true.	Buckthorn pursha or joster* (Rhamnus purshiana) is a woody plant, the dried and aged bark of which the American Indians used as a laxative and called "sacred bark". Fresh bark when ingested can cause poisoning and severe diarrhea. The active substances of the joster bark affect the receptors of the colon and enhance its peristalsis, which causes the laxative effect of buckthorn. Joster bark is a mild laxative and is not addictive. However, its effect occurs 8-10 hours after taking it, so it is better to take it at night. Joster reduces fermentation and putrefaction processes in the intestine, has a disinfecting and anti-inflammatory effect, stimulates secretion, helps to remove worms and parasites, restores intestinal tone. It is also indicated for cholelithiasis, hemorrhoids, anal fissures, varicose veins, hypertension.\n*Note: joster is a genus of plant, buckthorn is the name of the family to which it belongs.	Dietary supplement Cascara Sagrada NSP is a source of anthraquinones and tannins.\n1 capsule contains: dry bark of American buckthorn (Rhamnus purshiana) - 390 mg.\nAuxiliary substances: gelatin.	Adults take 1 capsule 2-3 times a day with meals. The duration of admission is 1 month. After 2-3 months, the reception can be repeated.	Individual intolerance to the components of the product, pregnancy and lactation, acute intestinal diseases, a tendency to diarrhea.	\N
73	73	Blocks the digestion of starchy carbohydrates\nSlows down the absorption of glucose into the blood\nReduces the formation of body fat and promotes weight loss	Carbo Grabbers is certainly necessary for people with impaired carbohydrate and fat metabolism. It can be used in various programs to reduce body weight with the drugs Loclo, Chromium Chelate NSP, Complex with Garcinia, Fat Grabbers, Nutri Bern, SmartMil, etc.\nA unique mono-phytoformula. There are clinical trials on the use of Carbo Grabbers in combination with obesity therapy according to the standard.	Common bean extract (Phaseolus vulgaris) – contains phaseolamine, which suppresses the digestive enzyme alpha-amylase and inhibits its activity by 56%. This enzyme breaks down complex carbohydrates, for example, white bread, potatoes. Reducing the rate of breakdown of starchy carbohydrates slows down the sharp rise in glucose and insulin levels in the blood, which normalizes glucose metabolism, reduces the biosynthesis of fatty acids from glucose, contributing to a decrease in body fat.	Dietary supplement Carbo Grabbers contains bean extract (phaseolamine).\n1 capsule contains: common bean extract (Phaseolus vulgaris) — 300 mg.\nExcipients: cellulose, magnesium stearate, silicon dioxide, gelatin.	Adults take 1-2 capsules with a carbohydrate-rich meal.	Individual intolerance to the components, pregnancy and breast-feeding.	\N
74	74	Strengthens the body's defense against bacteria and fungi\nIt has an anti-inflammatory effect\nImproves the function of the cardiovascular and nervous systems	An original, unparalleled phytoformula that has a complex antibacterial, antiseptic and anti-inflammatory effect.\nCC-A NSP is a composition of 10 plants aimed at improving immunity. CC-A NSP is recommended to be used as a means to increase natural protection against bacteria, viruses and fungi, to reduce inflammatory processes, improve the functioning of the cardiovascular and nervous systems.	Dog rose (Rosa canina) – fruits have an anti-inflammatory effect, enhance hormone synthesis and regeneration processes, stimulate immune function.\nChamomile pharmacy (Matricaria recutita) – flowers have anti-inflammatory, antiseptic, anti-allergic effect, relieves spasms of the bile ducts, enhances bile secretion, improves liver function. Chamomile contains caprylic acid, which has an antifungal effect.\nRusty elm (Ulmus rubra) – bark has a bactericidal, strong anti-inflammatory, wound healing, astringent effect, soothes cough. It is used for fever, joint pain, inflammatory processes in the gastrointestinal tract, lungs, urinary system.\nYarrow (Achillea millefolium) – grass and inflorescences have a bactericidal, astringent, anti-inflammatory effect.\nCayenne pepper (Capsicum annuum) – belongs to the group of hot peppers, contains the alkaloid capsaicin, which gives it a burning sensation. It has antiseptic and anti-inflammatory effect. Dilates blood capillaries, relieves vasospasm and blood viscosity, reducing blood pressure. Pepper helps with gastrointestinal diseases, accelerates scarring of ulcers, stimulates the secretion of saliva, mucus.\nWhite willow (Salix alba) – the bark contains substances that act as nonsteroidal anti-inflammatory drugs (NSAIDs) known in pharmacology. The bark also contains vitamin C and bioflavonoids, which have anti-inflammatory, antipyretic, antioxidant effects.\nPeppermint (Mentha piperita) – has an antiseptic effect, reduces the tone of smooth muscles, relieves spasms, dilates the vessels of the heart, brain, lungs, relieves pain, increases the secretion of digestive juices.\nSage (Salvia sclarea) – increases the secretory activity of the gastrointestinal tract. It has anti-inflammatory, antimicrobial, soothing effect.\nLemon sorghum (Cymbopogon citratus) – has an anti-inflammatory, antiviral, antibacterial effect, in particular, against Staphylococcus aureus. Active substances act against certain types of mold fungi and the causative agent of thrush, including strains that are poorly treatable with medications, prevent the "gluing" of platelets, have an anti-inflammatory effect. Lemon sorghum also has a sedative effect, relieves depressive states and headaches.	Dietary supplement SI Si-Hey NSP is an additional source of flavonoids, contains essential oils and tannins.\n1 capsule contains: rosehip (Rosa canina) fruits - 111 mg; aboveground parts of yarrow (Achillea millefolium) - 55 mg; chamomile flowers (Matricaria recutita) - 55 mg; rusty elm bark (Ulmus rubra) - 55 mg; cayenne pepper fruits (Capsicum annuum) - 27 mg; bark white willow (Salix alba) - 25 mg; peppermint leaves (Mentha piperita) - 20 mg; sage leaves (Salvia officinalis) - 15 mg; lemon sorghum grass (Cymbopogon citratus) - 14 mg.\nAuxiliary substances: gelatin, cellulose.	Adults take 2 capsules 2 times a day with meals. The duration of admission is 2-3 weeks. If necessary, the reception can be repeated.	Individual intolerance to components, pregnancy, breast-feeding.	\N
75	75	Promotes tissue renewal and rapid wound healing\nStimulates the body's immune system\nAccelerates regeneration processes\nIt has an antibacterial effect	Chlorophyll is a green pigment contained in plant chloroplasts, which includes magnesium. Chlorophyll is involved in photosynthesis. In the process of photosynthesis, carbon dioxide is converted into glucose and oxygen is released.\nThe first scientific data on chlorophyll were published in 1940 in the American Journal of Surgery. It has been proven that it accelerates the processes of tissue regeneration. Dr. Robert Nara, studying the effect of chlorophyll on the microecology of the oral cavity, developed a caries prevention program using toothpaste containing chlorophyll. The effectiveness of chlorophyll in infectious diseases is shown. In 1979, in the USA, the effectiveness of chlorophyll, which prevents the occurrence of colon tumors, was experimentally confirmed.\nIn 1950, scientist Howard Wescott made a report that with regular use of chlorophyll, bad breath and the smell of sweat disappear.\nIt has been established that chlorophyll promotes the formation of connective tissue, which helps to heal erosions, ulcers, open wounds, enhances immune function. Chlorophyll helps to remove toxins from the body, and also acts as a weak diuretic. It has a stimulating effect on various organs and systems – cardiovascular, respiratory, digestive, etc., has antioxidant activity. It increases the function of the thyroid gland and enhances the secretion of pancreatic enzymes, helps with anemia, regulates blood pressure, reduces nervousness. And, of course, one of the most amazing properties of chlorophyll is its antibacterial effect, and it does not matter whether it is an acute respiratory disease, sinusitis, chronic skin ulcer, cervical erosion, etc. Liquid chlorophyll can be used for douching in colpitis, as well as for rinsing the nasopharynx in ENT pathology.\nNSP releases Chlorophyll in the form of a solution, which provides better assimilation and a faster effect. It does not contain artificial preservatives.	Sodium-copper chlorophyllin is a water–soluble form of chlorophyll. Chlorophyll – a fat-soluble substance – is obtained from alfalfa. To convert it into a water-soluble form, it is combined with sodium salts of fatty acids and copper salts.\nBrief description of the action of chlorophyll:\nStops the growth of bacteria in wounds, anaerobic bacteria and fungi in the intestine\nEliminates bad breath and body odor\nBlocks tooth decay and gum inflammation\nIt counteracts: colds, sore throats, tonsillitis, pyorrhea, gingivitis, stomach and intestinal ulcers, skin inflammations, arthritis, etc.\nPromotes tissue regeneration and repair\nCounteracts radiation damage\nSupports healthy intestinal flora\nActivates the action of enzymes involved in the synthesis of vitamin K\nEnhances milk production in nursing mothers.\nMenthol oil (Mentha spicata) – has a pleasant sweet-mint taste, is used to support digestion and the immune system, refreshes the breath. It has an antiseptic and restorative effect.	Dietary supplement liquid chlorophyll is an additional source of chlorophyll.\n1 teaspoon (5 ml) contains: sodium-copper chlorophyllin (sodium cooper chlorophylinn) - 14.9 mg; menthol oil (Mentha spicata) - 4.35 mg.\nExcipients: purified water, vegetable glycerin.	Adults take 1 teaspoon diluted in a glass of water or another drink, 3 times a day with meals. The duration of admission is 1 month.	Individual intolerance to the components of the product, pregnancy, breast-feeding.	Store in a dry place at a temperature not higher than +25 °C. Keep the opened bottle in the refrigerator.
76	76	Enhances regeneration of cartilage, bone and connective tissue\nStimulates the synthesis of hyaluronic acid\nInhibits the action of proteolytic enzymes that destroy cartilage\nIt has an anti-inflammatory and analgesic effect, reduces pain in the joints and spine when walking and at rest	Regular use of chondroitin reduces, and sometimes completely eliminates the need for nonsteroidal anti-inflammatory drugs. Indications for use are: degenerative-dystrophic diseases of the joints and spine, primary arthrosis, intervertebral osteochondrosis, osteoarthritis, osteoporosis, fractures. To enhance the effect, it is recommended to combine the intake of Chondroitin with products Glucosamine NSP, Omega-3 PUFA, Calcium Magnesium Chelate, Osteo Plus.\nA unique chondroprotector based on low molecular weight fractions of salmon cartilage chondroitin sulfate with full absorption in the gastrointestinal tract.	Chondroitin sulfate – forms the basis of connective, cartilage and bone tissue. It is a structural component of cartilage, is produced by the cartilage tissue of the joints and is part of the synovial fluid that fills the joint cavity. A necessary component of chondroitin sulfate is glucosamine, the lack of which in the synovial fluid can cause crunching in the joints. A feature of chondroitin among proteoglycans is its ability to retain water in the cartilage. Stimulates the synthesis of hyaluronic acid, strengthening the connective tissue structures of cartilage, tendons, ligaments, skin and inhibits the action of enzymes that destroy connective tissue. It has analgesic and anti-inflammatory effect, promotes active regeneration of cartilage, reduces pain in the joints and spine at rest and when walking.	Dietary supplement Chondroitin is an additional source of chondroitin sulfate.\n1 capsule contains: chondroitin sulfate - 323 mg (53.8% of TSA).\nExcipients: maltodextrin, magnesium stearate, silicon dioxide, gelatin.	Adults take 1 capsule 2 times a day with meals. The duration of admission is 1 month.	Individual intolerance to the components of the product, pregnancy, breast-feeding, tendency to bleeding, thrombophlebitis.	\N
77	77	Regulates blood sugar levels in insulin resistance\nIncreases muscle tone, performance and endurance\nReduces the level of cholesterol in the blood	The most important biological role of chromium is to regulate carbohydrate metabolism and blood glucose levels. It regulates the deposition and use of glucose by cells, acting in conjunction with insulin. Chromium reduces the cell's need for insulin. Therefore, this trace element is primarily necessary for patients with diabetes mellitus, and its deficiency can cause diabetes. Chromium levels decrease in women during pregnancy and after the birth of a child, which can cause diabetes in pregnant women. Increased consumption of sugars and carbohydrate foods by a modern person washes chromium out of the body. After the age of 40, one in four experiences insulin resistance (at a normal level of insulin production). The reduction of chromium content in the soil has led to a chromium deficiency condition of almost the entire population.\nChromium Chelate NSP prevents such severe metabolic diseases as type II diabetes and atherosclerosis.\nChromium Chelate NSP contains chromium in chelated form, which contributes to its better assimilation in the body. The complex includes calcium and a mixture of herbs: horsetail, red clover and yarrow, which enhance the effect of the product.\nThere are clinical trials on the complex use of this product in the treatment of patients with type 2 diabetes mellitus according to the standard.	Chromium (in amino acid chelate) - the biological effect of chromium is diverse: it not only regulates blood glucose levels, but also thermogenesis, has a wound–healing effect (including in peptic ulcer disease), improves myocardial and nervous tissue metabolism, sexual function, supports thyroid function. Chromium is involved in the synthesis of DNA and RNA, lecithin, cholesterol, fatty acids and in the detoxification of metabolites in the liver.\nHorsetail (Equisetum arvense) – has an anti-inflammatory, bactericidal effect, is a source of silicon, thanks to which it stimulates the regeneration of connective tissue and the activity of endocrine glands.\nRed clover (Trifolium pratense) – finds application in cooking. Red clover is an immunostimulator for bacterial and viral infections, heals wounds and ulcers. Clover has a high content of phytoestrogens and helps especially well with the appearance of acne in young men and cleanses the skin of rashes, is indicated for seborrhea, psoriasis. It has antispasmodic, antiseptic, antitumor effect, reduces cholesterol, prevents the development of atherosclerosis.\nYarrow (Achillea millefolium) – grass and inflorescences have a bactericidal, wound-healing, anti-inflammatory, antispasmodic, anti-allergic effect.	Dietary supplement Chromium Chelate NSP is an additional source of chromium.\n1 tablet contains: chromium (a mixture of chelates with the following amino acids: alanine, arginine, aspartane, cystine, glutamic acid, glycine, histidine, isoleucine, leucine, lysine, methionine, phenylanine, proline, serine, threonine, tryptophan, tyrosine, valine) - 100 mcg (200% from ASP); calcium (in dicalcium phosphate) - 87.8 mg (8.78% of ASP); horsetail (Equisetum arvense) - 20 mg; red clover (Trifolium pratense) - 20 mg; yarrow (Achillea millefolium) - 20 mg.\nExcipients: cellulose, stearic acid, magnesium stearate.	Adults take 1 tablet a day with meals. The duration of admission is 1 month.	Individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
78	78	Improve the overall resistance of the body against infections, activate the immune system\nRemove toxins, improve the work of the whole body\nThey are a natural source of energy and slow down premature aging\nRegulate the water-electrolyte balance	The importance of mineral substances is difficult to overestimate. All of them are essential substances and are necessary for the normal functioning of our body. They are part of enzymes, hormones, and maintain a normal water-electrolyte balance in the body. The lack of even one of the bioelements can lead to metabolic disorders. Unfortunately, depletion of soil fertility, improper rotation of crops lead to a decrease in the normal content of elements in food. Antioxidants can interfere with oxidative processes in the cells of the human body, leading to DNA damage and rapid aging.\nIt is recommended to use this product for diabetes, obesity, heart and vascular diseases, joint pain, with a decrease in physical activity, as well as directly during sports and fitness. The active components of Acai berry juice develop muscle mass, help to cope with high physical exertion. As a result, subcutaneous fat is consumed for the necessary energy, thereby saving a person from unnecessary kilograms. Berries suppress hunger and reduce appetite.\nIt is an indispensable tool for hair nutrition to activate their growth, give a healthy shine, eliminate breakage.\nA unique phyto-mineral formula based on macro- and microelements in colloidal form from the water of the Great Salt Lake (Utah, USA), enhanced with antioxidants. Humic acids convert minerals into digestible chelates. The product is safe and universal for all ages, it can be given without restrictions, including to toddlers and elderly people with chronic diseases.	Macro- and microelements – the greatest amount contains: magnesium, iron, selenium, manganese, chromium, sodium, zinc.\nFulvic acid is a complex of humic substances that convert minerals into chelated compounds, which increases their digestibility.\nAcai berries (Euterpe oleracea) are the fruits of the Euterpe vegetable palm, contain about 3000 different active minerals and vitamins. Fruits contain a large amount of omega-fatty acids, proteins, calcium, magnesium, zinc, phosphorus, iron, vitamins E, A, C, B1, B2, B3, K, contain a lot of antioxidant substances, carotenoids, flavonoids, tocopherols, fibers, plant steroids. Acai berries have twice as many antioxidants as blueberries, 10 times more than grapes, 33 times more than red wine. Their active substances prevent oxidation processes associated with the formation of free radicals, and as a result – the following diseases: Alzheimer's disease, asthma, nervous system diseases, cataracts, respiratory system dysfunction, diabetes, arthritis, Parkinson's disease. In addition, the active substances of Acai berries have antitumor activity and can destroy cancer cells without harming healthy cells.\nGrape peel extract (Vitis vinifera) – contains resveratrol and has estrogen-like activity, is an antioxidant, capillaroprotector, has an oncoprotective effect.	Dietary supplement Colloidal minerals with Acai juice is an additional source of minerals (including magnesium, iron, selenium, manganese, chromium, sodium, zinc), organic acids and antioxidants.\n2 tablespoons (30 ml) contain: fulvic acid - 3.76 g, Acai berry concentrate (Euterpe oleracea) - 0.33 g, liquid mineral complex (at least 66 minerals) - 0.31 g, grape peel extract (Vitis vinifera) - 0.07 g.\nExcipients: purified water, vegetable glycerin, tartaric acid, xanthan gum, sodium benzoate, citric acid, natural flavor of Acai berries.	Adults take 30 ml (2 tablespoons) 2 times a day with meals. It can be dissolved in a glass of water.	Individual intolerance to components, pregnancy, breast-feeding.	Store in a dry place, at a temperature not higher than +25 ° C. After opening, store the bottle in the refrigerator.
79	79	It has a pronounced immunostimulating effect.\nIncreases the body's resistance to infectious diseases\nIt has an oncoprotective effect.	The normal functioning of the immune system is the key to the harmonious development of the body and longevity. With a weakened immune system, the body becomes susceptible to various infections, the risk of cancer increases. It has been proven that cow colostrum is an excellent natural source of all the necessary components to support the immune system. The composition of Colostrum NSP, in addition to colostrum, includes: astragalus and mushrooms with immunotropic action (maitake and shiitake), as well as inositol.\nA unique phyto-organic formula made on the basis of colostrum powder from colostrum skim milk from 1 milking of healthy cows.	Colostrum is a substance secreted by mammalian mammary gland in the last weeks of pregnancy and in the first 1-2 days after childbirth. Colostrum differs greatly in its composition from milk and contains a number of biologically active substances, including interferon, immunoglobulins that regulate the immune system, growth factor. Colostrum contains a wide range of antibodies to many pathogenic factors. When feeding colostrum in the newborn's body, passive immunity is developed.\nAstragalus membranaceus – dilates coronary vessels, lowers blood pressure, has a calming and cardiotonic effect, improves blood circulation. Stimulates the function of NK cells, promotes the production of interferon. It is indicated for frequent colds, high physical exertion, secondary immunodeficiency, oncology.\nInositol (vitamin B8) – has membrane-protective, anti-atherosclerotic, antioxidant properties. It helps to maintain the hydration of the hair, strengthen it and grow it. Improves digestion, as it stimulates the reproduction of beneficial microorganisms, and also participates in the regulation of intestinal motility and stomach. Inositol has unique soothing properties. This circumstance gives it the status of an effective means to eliminate the consequences of psychological stress, depression, neurosis, fear attacks, sleep disorders, blood pressure. The most common symptoms of inositol deficiency in the body are diseases of the digestive system, muscle dystrophy, stress, anxiety, insomnia, decreased mental performance, increased cholesterol in the blood, circulatory disorders, impaired vision, skin rashes, hair loss, impaired genital function, infertility.\nMaitake mushroom (Lentinus edodes) is an edible mushroom. It contains a large number of polysaccharides that have an adaptogenic and immunostimulating effect. Selectively inhibits the appearance and growth of atypical cells, stimulates the activity of T-helpers. It is used as a general tonic, for chronic fatigue syndrome, secondary immunodeficiency, high blood pressure, diabetes mellitus.\nShiitake mushroom (Lentinus edodes) is an edible mushroom rich in protein, contains ergosterol, which can be converted into vitamin D (if the mushrooms get enough sunlight), fiber, which reduces cholesterol levels in the blood by 45%. Shiitake is able to reduce blood sugar in diabetes and high blood pressure. The mushroom helps with ulcers of the gastrointestinal tract, gout, allergies and sexual impotence, increasing male potency. Shiitake extract can be used to slow down and prevent the development of benign and malignant tumors. Lentinan supports immunity in cancer patients by increasing the maturation rate of killer lymphocytes and enhancing their activity. The active substances of this higher fungus help the body to fight viruses (herpes, hepatitis, influenza, smallpox, polio), bacterial and fungal diseases. Shiitake is used for diabetes, cardiovascular diseases (atherosclerosis, tendency to thrombosis, coronary heart disease, hypertension).	Dietary supplement Colostrum NSP is an additional source of inositol, contains immunoglobulin G and polysaccharides.\n1 capsule contains: colostrum powder (from milk) - 250 mg; astragalus root (Astragalus membranaceus) - 80 mg; inositol - 40 mg (8%); whole maitake mushroom (Grifola frondosa) - 20 mg; shiitake mushroom, mycelium (Lentinus edodes) - 20 mg.\nAuxiliary substances: gelatin.	Adults take 1 capsule 4 times a day with meals. The duration of admission is 1 month.	Individual intolerance to the components, pregnancy and breast-feeding.	\N
80	80	It is a source of calcium and magnesium.\nRestores the normal structure of bone and cartilage tissue.\nRegulates the acid-base balance, lowers the level of acidity in the body.	It is difficult to overestimate the role of calcium in human life. Suffice it to say that its deficiency can cause many diseases. It is not enough to eat food rich in calcium, you need to make sure that it is absorbed (the calcium absorption coefficient is low and on average is 30%). With age, calcium deficiency develops: by the age of 40, it is observed in 50% of people, by the age of 60 – in 90%. Calcium deficiency is usually manifested by fatigue, early aging, decreased concentration, cramps of the calf muscles, diseases of the cardiovascular system. But in the blood, the normal calcium content can be determined, since it is being washed out of the bones, which leads to the development of osteoporosis. It is manifested by pain in the bones, impaired motor activity. It should be borne in mind that in some conditions calcium is excessively excreted from the body: strenuous physical work, intensive training for athletes, prolonged immobilization (restriction of mobility, bed rest).\nCalcium is an important element of the body's buffer system, which maintains the pH at the level necessary for each system and environment of the body. Unfortunately, the diet of most of us is made up in such a way that 80% of the products we consume daily are acid-forming. "Alkaline" products – fresh vegetables, fruits, dates, beans, almonds, linseed oil, etc. – make up no more than 20%. In most environments of our body, the reaction is alkaline (with the exception of the stomach, some parts of the intestine, vagina, skin). If we constantly take acid-forming products, this gradually leads to the development of acidosis, i.e. "acidification" of blood, lymph, intercellular fluid occurs, the work of enzymes and metabolism is disrupted. The natural pH of the Coral Calcium solution is alkaline and is 10-11, so it helps to restore the acid-base balance. This product is used not only for osteoporosis, but also for hypertension, destructive diseases (osteoarthritis, sciatica, heel spurs, etc.). Coral calcium is a powerful natural sorbent that binds chlorine (not only inorganic, but also organic), heavy metal salts, and toxins very quickly.\nCoral calcium is a natural product obtained from environmentally friendly corals collected in the sea near the Ryukyu Islands (Japan), which contain calcium and magnesium in a ratio of 2:1, which is optimal for calcium absorption. It can be used in the nutrition of children to compensate for nutritional deficiencies.	Montmorillonite (bentonite) – belongs to the subclass of layered silicates and is a unique source of iron, silicon, magnesium and other bioelements.\nSea coral – crushed corals collected in the sea near the Ryukyu Islands (Japan). They contain 20-28% calcium and 10-14% magnesium (2:1 ratio), as well as a small amount of other bioelements (potassium, phosphorus, iron, sulfur, silicon, chromium, manganese, copper, zinc, etc.). More than 4 million the Japanese regularly use coral calcium. It is used for diseases of the musculoskeletal system, hypertension. There are observations when, after 2-3 months of taking coral calcium, an improvement was observed in 80% of patients with rheumatoid polyarthritis.	Dietary supplement Coral Calcium is an additional source of calcium and magnesium.\n1 measuring spoon (1.5 g) contains: bentonite 22.5 mg, sea coral 1477.5 mg, calcium 325 mg (33% of TSA), magnesium 163 mg (41% of TSA).	For adults, dilute 1 measuring spoon (1.5 g) of powder in a glass of water or any drink, take 1-2 times a day with meals.	Individual intolerance to the components of the product.	\N
81	81	It has a restorative and immunomodulatory effect.\nIt has a bacteriostatic and antiviral effect.\nStimulates the formation of hematopoietic stem cells.\nIt has an oncoprotective effect.	The applied technology of cordyceps cultivation, purchased by NSP, is a guarantee of its high quality and physiological activity.	Cordyceps chinensis (Cordyceps sinensis) is a mushroom that is bred in China and Japan on cultivated silkworm plantations. It is registered in China as a health food product, it is used in soups and in the preparation of dietary meat and fish dishes. Dry and liquid extracts of Chinese cordyceps are widely used as part of dietary supplements and tonic soft drinks. It has a restorative, immune-modulating effect. Stimulates the activity of T-lymphocytes, natural killer cells (NK cells) and macrophages, while the activity and action of NK cells increases by 1.5 times; phagocytic function of macrophages increases by 73%; phagocytic index increases by 130%. Cordyceps also stimulates the formation of hematopoietic stem cells produced by the bone marrow, mononuclear tissue cells and fibroblasts. It activates the work of the hypothalamus, pituitary gland, increases the release of hormones, regulates metabolic processes, has a beneficial effect on nervous, endocrine, respiratory and sexual functions, has antiarrhythmic and hypotensive effects, lowers cholesterol, improves microcirculation and prevents thrombosis.	Dietary supplement Cordyceps NSP is an additional source of polysaccharides.\n1 capsule contains: Chinese cordyceps powder (Cordyceps sinensis) - 530 mg.\nExcipients: microcrystalline cellulose, magnesium stearate, gelatin.	Adults take 2 capsules 3 times a day with meals. The duration of admission is 1 month.	Individual intolerance to components, pregnancy, breast-feeding.	\N
82	82	Eliminates unpleasant manifestations of pre- and post-climax.\nHelps to balance the hormonal status.\nOptimizes the preparation and course of pregnancy and childbirth.	In the life of women there is an important period of restructuring of the hormonal system – this is the menopausal period. Menopause is not a disease, but a condition caused by a decrease in the production of estrogens by the female body. It is known that women who adhere to a diet with a predominance of plant foods suffer significantly less from the manifestations of menopause: headaches, a feeling of heat (hot flashes), vaginal dryness, mood changes, general discomfort, irregular menstruation. C-Ex helps the body to balance the hormonal status.\nA unique phytoformula for women and men.	Carpal bug or Cimicifuga (Cimicifuga racemosa) – reduces the production of luteinizing hormone. In the female body, luteinizing hormone stimulates the production of estrogen by the ovaries, which often cause polycystic ovaries, and in the male body – the production of testosterone. It has weak estrogenic activity. The appointment of cimicifuga leads to the elimination of vegetative vascular disorders and prevents depression that occur during the preclimacteric and menopausal periods, as well as reduces the manifestations of toxicosis and hypertension in pregnant women. Cimicifuga increases the volume of secretion, has an antispasmodic effect – relaxes the smooth muscles of the intestine and urinary tract, helps with menstrual pain, hypertension, rheumatism, headache, asthma.\nLicorice naked (Glycyrrhiza glabra) – stimulates the excretory function. It has an antispasmodic effect on smooth muscles. Licorice contains substances similar in structure to cortisol, they have a strong anti-inflammatory effect, it can be prescribed for Adisson's disease and hypofunction of the adrenal cortex, systemic lupus erythematosus, allergic dermatitis, pemphigus, eczema. Glycyrrhetinic acid, glycyrenate and glycyram (equal in activity to hydrocortisone) weakened the severity of anaphylactic shock in animals. Substances that reduce cholesterol levels in the blood and contribute to the disappearance of cholesterol plaques were isolated from licorice.\nEleutherococcus prickly (Eleutherococcus senticosus), "Siberian ginseng" – is an adaptogen, increases mental and physical performance, reduces fatigue, increases basal metabolism. It is used to regulate hormonal balance, strengthen the heart and nervous systems, and for impotence.\nSarsaparilla curative (Smilax officinalis) – stimulates the production of sex hormones, has a tonic effect on the genitals. It is used for imbalance of sex hormones, premenstrual syndrome, sexual dysfunction, infertility.\nMitchell repens is one of the best remedies that prepare the uterus and the entire body of a woman for childbirth. It is used to eliminate menstrual pain due to cramps, reduces uterine bleeding, tones the uterus.\nCnicus benedictus - regulates the menstrual cycle, usually used in combination with other herbs for menstrual ailments. It stimulates the secretion of gastric juice and bile, has a diuretic, expectorant effect.\nChamaelirium luteum – stimulates the uterus and ovaries, helps with pregnancy, painful menstruation, ovarian inflammation, amenorrhea (delayed menstruation) and menorrhagia (heavy bleeding), increases fertility. It is useful for strengthening male sexual function. It has an anti-inflammatory effect.	Dietary supplement C-X is an additional source of tannins, glycyrrhizic acid, contains eleuterosides, isoflavones.\n1 capsule contains: the root of the carpal bug (Cimicifuga gasemosa) - 84 mg; the root of licorice (Glycyrrhiza glabra) - 71 mg; the root of Eleutherococcus prickly (Eleutherococcus senticosus) - 62 mg; the root of sarsaparilla officinalis (Smilax officinalis) - 61 mg; the leaves and stems of Mitchell creeping (Mitchell repens) - 56 mg; aboveground parts of the blessed knicus (Cnicus benedictus) - 54 mg; root of Chamaelirium luteum (Chamaelirium luteum) - 32 mg.\nAuxiliary substances: gelatin.	Adults take 2 capsules 3 times a day with meals. The duration of admission is 1 month with repeated admission if necessary.	Individual intolerance to the components of the product, pregnancy and lactation.	\N
83	83	Stimulates the immune system, counteracts infectious diseases\nIt has an antioxidant effect	Prevention of infections, maintenance of the physiological balance of the body, prevention of oncology – this is an incomplete list of functions performed by the immune system. The occurrence of most diseases, such as cancer, atherosclerosis, myocardial infarction, diabetes, liver and kidney damage, is associated with the accumulation of free radicals and peroxide compounds in cells and tissues, which cause premature aging of the body. Therefore, the support of immunity and antioxidant defense systems is one of the main tasks of a healthy diet. NSP has developed a unique product - a Protective formula that contains a complex of ingredients that support immune function, and at the same time have a powerful antioxidant effect.\nA unique phytoformula enhanced with vitamins (A, C, E, as well as beta - carotene) and trace elements (zinc, selenium).\nThere are clinical trials of effective joint use of dietary supplements with standard treatment in elderly people with pathology of the cardiovascular system.	Vitamin A — enhances proliferative activity. Promotes immunity: enhances phagocytosis, the production of antibodies and lysozyme; increases the mass of the thymus and spleen, the number of immune cells and the activity of killer T lymphocytes. It has antioxidant activity.\nVitamin C is a key water—soluble antioxidant, activates the production of lysozyme and interferon, which counteract viral infection by destroying bacteria and viruses. Increases the formation of antibodies, the activity of NK-killers. In combination with bioflavonoids, vitamin C ensures the structural integrity of capillary walls and connective tissue.\nVitamin E is a key fat—soluble antioxidant, activates the immune system, has a cardioprotective and anticoagulant effect.\nZinc is a part of antioxidant enzymes, regulates cell regeneration and division, and stimulates immune function.\nSelenium is a part of antioxidant enzymes, simulates the formation of antibodies and the activity of neutrophils.\nBeta-carotene — provitamin A, is an antioxidant, has an effect on cell growth and differentiation. Promotes immunity: enhances the production of antibodies, the restoration of humoral immunity in the elderly to the level of a younger age, increases the activity of neutrophils, the number of killer T-lymphocytes. Reduces the risk of developing cancer.\nBarley (Hordeum vulgare) is an edible plant, characterized by a high content of antiviral and antibacterial substances. It is used in folk medicine for the treatment of fungal and inflammatory diseases of the skin, digestive and respiratory organs. Contains phytoestrogens with antioxidant activity.\nMedicinal asparagus or asparagus (Asparagus officinalis) — reduces blood clotting and prevents the formation of blood clots, increases mucus secretion in the gastrointestinal tract and in the bronchi. It is used as a diuretic, anti-inflammatory agent for diseases of the genitourinary sphere (pyelitis, nephritis, pyelonephritis), it is taken for rheumatism, arthritis, diabetes mellitus, tachycardia.\nAstragalus membranaceus — dilates coronary vessels, reduces pressure, has a calming and cardiotonic effect, improves blood circulation, has a diuretic and immunostimulating effect in frequent infections, secondary immunodeficiency, including in cancer patients (stimulates the function of NK cells, promotes the production of interferon).\nBroccoli (Brassica oleracea) — contains indoles and sulforaphane. It has an antibacterial effect, killing bacteria that are immune to antibiotics. Sulforaphane, along with indole-3-carbinol, has been found to inhibit tumor development. The first activates the ability of the immune system to fight cancer cells, and the second prevents the proliferation of cancer cells, stopping their division.\nCabbage (Brassica oleracea) — juice from the leaves is recommended for the treatment of peptic ulcer of the stomach and duodenum, gastritis and colitis. Cabbage leaves contribute to the elimination of cholesterol from the body, and cabbage juice reduces the sugar content in the blood. Regular consumption of fresh or sauerkraut leads to an improvement in bronchitis, intestinal lethargy, eczema, sciatica, rheumatism. Indoles have antitumor activity.\nReishi or ganoderma (Ganoderma lucidum) is a mushroom that stimulates the activity of the immune system. It has an anti-inflammatory and anti-allergic effect, reduces cholesterol synthesis, reduces the "gluing" of platelets, normalizes blood pressure. It is an adaptogen that improves the functioning of all body systems.\nEleutherococcus prickly (Eleutherococcus senticosus) is an adaptogen, increases efficiency, reduces fatigue, increases basic metabolism, normalizes blood sugar levels.\nBy d’Arco or ant tree (Tabebuia heptaphylla) is a tree whose bark has an antifungal effect in intestinal and vaginal candidiasis, suppresses mycotic pathogens, helps with parasitic infections, helps reduce severe pain in arthritis and rheumatism, has an antiviral effect, is an inducer of interferon. It stops the growth of certain types of malignant tumors, it is used for malignant skin diseases, AIDS, venereal diseases (gonorrhea, syphilis). It has an anti-inflammatory effect.\nChinese lemongrass (Schisandra chinensis) — contains tonic substances that have an adaptogenic, tonic and psychostimulating effect. Stimulates the work of the heart and respiratory apparatus. Increases blood pressure, performance and reduces fatigue during physical and mental exertion. It is indicated for asthenic syndrome, vegetative-vascular dystonia in hypotonic patients, in the period after infectious diseases, with fatigue, decreased performance and when engaged in activities associated with great mental and physical exertion. It is used for violations of sexual function against the background of neurasthenia.\nGuaiula (Parthenium integrifolium) is a shrub whose roots contain substances that have an immunostimulating effect, like the roots of echinacea.\nSoft wheat (Triticum aestivum) — has a restorative effect. It is used for respiratory diseases, especially with a debilitating cough. Contains phytoestrogens with antioxidant activity.	Dietary supplement The protective formula of NSP is an additional source of vitamins A, C, E, zinc, selenium, eleutherosides, schizandrine, contains b-carotene.\n1 capsule contains: vitamin A - 750 IU (0.23 mg - 26% of ASP); vitamin C - 120 mg (133% of ASP); vitamin E - 60 IU (60 mg - 400% of ASP); zinc (in gluconate and zinc oxide) - 5 mg (41.7% from ASP); selenium (in selenmethionine) - 25 mcg (45% of ASP - women, 33% of ASP - men); beta-carotene - 0.36 mg (7.2% of ASP); Asparagus officinalis stems - 17 mg, the root of the membranous astragalus (Astragalus membranaceus) - 17 mg, broccoli inflorescences (Brassica oleracea) - 17 mg; garden cabbage leaves (Brassica oleracea) - 17 mg, reishi mushroom (Ganoderma lucidum) - 17 mg, Eleutherococcus prickly root (Eleutherococcus senticosus) - 17 mg, bark According to d’Arco (Tabebuia heptaphylla) - 17 mg, fruits of Chinese lemongrass (Schisandra chinensis) - 17 mg, aboveground part and root of guaiula (Parthenium integrifollium) - 11 mg, aboveground parts of wheat (Triticum aestivum) - 11 mg.\nAuxiliary substances: gelatin, stearic acid, magnesium stearate.	Adults take 1 capsule in the morning with meals. The duration of admission is 2-3 weeks. If necessary, the reception can be repeated.	Individual intolerance to dietary supplements, pregnancy and lactation, increased nervous excitability, insomnia, high blood pressure, cardiac disorders, severe atherosclerosis.	\N
84	84	Anti-inflammatory effect\nImproves the state of the nervous system in depression, anxiety, insomnia, neurosis\nRegulates hormonal balance in menopausal disorders	Inflammation, which is initiated by the immune system, is a protective reaction of the body in response to the action of infectious factors, injuries or other damage to organs and systems. However, inflammatory processes that occur in diseases of the musculoskeletal system, gastrointestinal tract, liver, injuries and infections often aggravate the course of these diseases. This product has an anti-inflammatory effect, as well as normalizes the hormonal balance of a woman. It can have antiarrhythmic, cardiotonic, antispasmodic effects, normalizes microcirculation, improves the condition of the musculoskeletal system.\nA unique phytoformula of 8 plants that complement and enhance the effect of each other.	White willow (Salix alba) – the active ingredients of the bark act as nonsteroidal anti-inflammatory drugs (NSAIDs) known in pharmacology, with the difference that the bark of white willow does not give side effects. It has an anti-inflammatory, antioxidant effect. They have an effect on nerve endings, reduces pain. The bark also contains vitamin C and bioflavonoids, which have a capillary-protective and antioxidant effect\nCayenne pepper (Capsicum annuum), contains the alkaloid capsaicin, which gives it burning, beta-carotene, vitamins. It has an anti-inflammatory effect, improves the functioning of the cardiovascular system, relieves vascular spasm and blood viscosity, reducing blood pressure.\nValerian officinalis – has a soothing, anticonvulsant, antispasmodic, secretolytic effect. It is used for nervous excitement, insomnia, neuroses, angina pectoris, initial hypertension, menopause, migraine-like headaches, hysteria.\nCimicifuga or carpal bug (Cimicifuga racemosa) – inhibits the production of luteinizing hormone, which, in turn, reduces the secretion of estrogen in women and testosterone in men. It leads to the elimination of vegetative-vascular disorders and prevents depression that occurs during the preclimacteric and menopausal periods, as well as reduces the manifestations of toxicosis and hypertension in pregnant women. It has an anti-inflammatory and antispasmodic effect, helps with menstrual pain, headache, cough, asthma.\nMedicinal ginger (Zingiber officinale) – has an anti-inflammatory effect, suppressing the formation of pro-inflammatory prostaglandins, reduces pain.\nOrdinary hops (Humulus lupulus) – used as an analgesic, with frequent urge to urinate, urinary incontinence, insomnia, as a sedative, with neurasthenia, with nervous excitement, as an analgesic for neuralgia and sciatica. The extract from hop cones has a high estrogenic activity.\nMedicinal letter (Betonica officinalis) – has a calming effect, enhances metabolism, lowers blood pressure, has anti-inflammatory, anti-asthmatic and analgesic effect. It is used for increased nervous excitability, epilepsy, migraines, dizziness, joint pain, rheumatoid arthritis.\nMartinia scented (Harpagophytum procumbens) – is used for joint diseases (deforming osteoarthritis, osteochondrosis of the spine) to improve joint mobility, reduce the feeling of stiffness. Reduces the severity of pain syndrome, reduces swelling, rheumatoid and gouty arthritis, deforming osteoarthritis. It acts as an anti-inflammatory, cardiotonic, antiarrhythmic agent.	Dietary supplement Eight is an additional source of flavonoids, isovaleric acid, contains tannins, essential oils, salicin.\n1 capsule contains: white willow bark (Salix alba) - 100 mg; carpal bug root (Cimicifuga racemosa) - 73 mg; cayenne pepper fruit (Capsicum annuum) - 65 mg; Valerian officinalis root - 58 mg; ginger root (Zingiber officinale) - 56 mg; cones common hops (Humulus lupulus) - 35 mg; herb of the medicinal letter (Betonica officinalis) - 35 mg; the root of sweet martinia (Harpagophytum procumbens) - 3 mg.\nAuxiliary substances: gelatin.	Adults take 1 capsule 3 times a day with meals for 2-3 weeks. If necessary, the reception can be repeated.	Individual intolerance to the components of the product, pregnancy and lactation.	\N
85	85	It has an antitoxic, blood-purifying effect.\nNormalizes the digestive tract.\nIt has an anti-inflammatory and antiseptic effect.	E-tea can be used for inflammatory diseases of the urinary and digestive systems, constipation, hemorrhoids, rheumatism. It helps with coughs and colds. The product can be taken in capsules, or the contents of the capsules can be brewed as tea. A unique phytoformula of complex action.	Burdock large or burdock (Arctium lappa) — in folk medicine, burdock root is recommended to be taken orally for rheumatism and gout, as well as externally for skin diseases: eczema, acne and furunculosis. As a wound healing agent, it is applied to burns, wounds, cuts, abrasions, inflammations and swollen areas of the skin. It has a diuretic, analgesic, choleretic, antiallergic and disinfecting effect. Burdock alkaloids (arctigenin) have antitumor activity.\nSorrel sparrow (Rumex acetosella) — in folk medicine is used as an antiseptic, diaphoretic, diuretic, for diarrhea, dysentery, hemorrhoids, tuberculosis, kidney and urinary tract diseases, difficulty urinating. It is also recommended for uterine bleeding, fever, headache and liver diseases. It has astringent, choleretic, anti-inflammatory effect.\nSlippery elm (Ulmus rubra) — has strong anti-inflammatory, wound healing, astringent, diuretic effects, soothes cough. It is used for fever, renal and hepatic colic, joint pain, inflammatory phenomena in the gastrointestinal tract, lungs, urinary system.\nRhubarb officinale (Rheum officinale) — the root has a tonic and antibacterial effect. Anthraglycosides have a strong laxative effect. Chrysophanic acid also has a mild laxative effect. Tannoglycosides, on the contrary, have astringent properties. For this reason, medicines from rhubarb roots are widely used for various digestive disorders. Most often, in high doses, rhubarb is prescribed as a laxative for habitual constipation, sluggish intestinal peristalsis, copious accumulation of gases, hemorrhoids.	Dietary supplement E-tea is an additional source of flavonoids, contains tannins.\n1 capsule contains: burdock root (Arctium lappa) — 64.7 mg; grass sorrel sparrow (Rumex acetosella) — 49.2 mg; American elm bark (Ulmus rubra) — 12 mg; rhubarb root (Rheum officinale) — 3 mg.\nExcipients: rice oligodextrin, silicon dioxide, gelatin.	Adults take 2 capsules 3 times a day during meals for 5-7 days with repeated intake if necessary.	Individual intolerance to the components of the product, pregnancy and lactation.	\N
86	86	Reduces hunger, helps to regulate weight.\nBinds and removes cholesterol and saturated fats from the body.\nEnhances the motility of the colon, preventing constipation.	An important way to combat overweight is to reduce the absorption of fat from food by binding and removing cholesterol and triglycerides from the gastrointestinal tract. "Fat Grabbers" (eng. "capture fat"), absorbs and removes fats from the body, suppresses appetite, has a detoxifying effect and improves the motility of the large intestine. In combination with a diet, this product will allow you to lose excess weight. A unique phytoformula of complex action. According to Fat Grubbers, clinical trials were conducted proving the effectiveness of this dietary supplement in the weight correction program: in patients taking Fat Grubbers, hunger significantly decreased, which did not happen in the control group, and there was also a more effective reduction in cholesterol and weight loss due to fat loss, a higher reduction in hip girth.	Guar gum (Cyamopsis tetragonoloba) – belongs to the category of dietary fiber. It is obtained from the seeds of the pea tree (guar). It is not digested in the gastrointestinal tract. Reduces the absorption of carbohydrates and cholesterol from the intestine and reduces the level of glucose and cholesterol in the blood. It is used for diabetes and atherosclerosis. It has a laxative and detoxifying effect, normalizes the intestinal microflora.\nPlantain ovate or psyllium (Plantago ovata) – unlike other species of plantain grows in southern countries and contains the largest amount of mucus (up to 40%), which has a protective – enveloping effect on the mucous membrane of the gastrointestinal tract. The seeds are used as a mild laxative for spastic and atonic constipation and as an enveloping agent for gastritis and colitis. When in contact with water, the husk of plantain swells and forms a jelly-like mass that creates volume. Psilium together with guar gum, when ingested, give a feeling of filling and reduce appetite. At the same time, they stimulate the work of the intestines, soften the stool, which helps to get rid of constipation, helps with hemorrhoids. Plant polysaccharides act as sorbents, binding toxic substances, heavy metals, cholesterol, fatty acids, carcinogens, which reduces the risk of colon cancer and other diseases.\nLecithin (from the Greek lekithos – yolk) is necessary for the body as a building material for the renewal of cell membranes, as an emulsifier and a transporter for the movement of fat–soluble substances in the body, is an antioxidant. Lecithin protects the liver from fat infiltration.\nStellaria medium or woodlouse (Stellaria media) – used as an analgesic, soothing, anti-inflammatory, antiseptic. Stellate juice has antimicrobial activity against Staphylococcus and shigella. It is recommended to take it orally for constipation, chronic hepatitis and biliary dyskinesia.	Dietary supplement Fat Grabbers is an additional source of flavonoids, tannins, soluble dietary fiber.\n1 capsule contains: guar gum (Cyamopsistetragonolobus) - 203 mg; the shell of plantain seeds (Plantagoovata) - 203 mg; star grass (Stellariamedia) - 93.4 mg; lecithin - 23 mg (0.33% of ASP).\nExcipients: silicon dioxide, gelatin.	Adults take 2-3 capsules 3 times a day with meals, washed down with 1 glass of water, for 5-7 days with repeated intake if necessary.	Individual intolerance to components, pregnancy, breast-feeding.	\N
87	87	Helps to balance a woman's hormonal status.\nReduces the negative manifestations associated with pre- and post-climax.	A unique phytoformula that provides complex estrogen-progestin support for a woman's hormonal background.\nMenopause is a process of hormonal adjustment associated with a decrease in estrogen production, which all women go through at a certain age period. Sometimes there are symptoms such as a feeling of heat (hot flashes), headaches, vaginal dryness, irregular menstruation, mood changes and a state of general discomfort. There are ways to help make this transition less painful. Women who adhere to a diet with a predominance of plant foods experience much less inconvenience of this kind. There are plants: angelica (Chinese angelica), tsimitsifuga, licorice, which are sources of plant estrogens and help balance the hormonal background of the female body. Elimination of menopause manifestations with the help of phytoestrogens is recommended for women who have contraindications to hormone replacement therapy. NSP has developed a unique product – EF Si with Dong Kwa (English FC – Female Comfort – comfort of a woman), which allows you to successfully cope with the problems of menopause.\nPhytoestrogens provide complex estrogen-progestin support for a woman's hormonal background, eliminate the negative manifestations of menopause, slow down the destruction of bone tissue and reduce the risk of breast cancer. Ef Si with Dong Kva has an antitoxic, anti-inflammatory, antispasmodic effect. Taking Ef Si with Dong Kwa, you can help the body in all periods of life (before, during and after menopause).	Red raspberry (Rubus idaeus) – leaves have astringent, antitoxic effect. Infusion or decoction of leaves is taken for bleeding, excessive menstruation, as well as as an anti-inflammatory, antispasmodic agent, for diseases of the urinary tract.\nChinese angelica or Dong Kwa (Angelica sinensis) – improves peripheral blood circulation, has anti-inflammatory, antispasmodic, soothing effect. Dilates blood vessels and prevents spasms.\nMedicinal ginger (Zingiber officinale) – has an anti-inflammatory effect, reduces inflammation.\nLicorice naked (Glycyrrhiza glabra) – contains phytoestrogens, which have high estrogen-like activity. Glycyrrhizin and saponins stimulate mucus secretion. Bioflavonoids have an antispasmodic effect. Licorice contains substances similar in structure to cortisol, which have strong immunosuppressive and anti-inflammatory effects, it can be prescribed for Adisson's disease and hypofunction of the adrenal cortex, as well as for systemic lupus erythematosus, allergic dermatitis, pemphigus, eczema.\nCimicifuga or carpal bug (Cimicifuga racemosa) – inhibits the production of luteinizing hormone. In the female body, luteinizing hormone stimulates the secretion of estrogen by the ovaries, and in the male body – the secretion of testosterone. Its action restores the normal structure of the endometrium, relaxes the uterine muscles, reduces the contractility of the fallopian tubes. It has weak estrogenic activity. Cimicifuga can eliminate vegetative-vascular disorders and prevents depression that occurs during the preclimacteric and menopausal periods, as well as reduces the manifestations of toxicosis and hypertension in pregnant women. Cimicifuga has an anti-inflammatory and antispasmodic effect, relaxes smooth muscles, helps with menstrual pain, headache, asthma.\nBlessed Knicus (Cnicus benedictus) – stimulates the menstrual cycle, it is also usually used in combination with other herbs for menstrual ailments.\nMarshmallow officinalis (Althaea officinalis) – enhances regeneration, has an anti-inflammatory effect. It has immunostimulating properties and increases the phagocytic activity of macrophages, stimulates humoral and cellular immune response.\nPurple horsetail (Eupatorium purpureum) – has antispasmodic, anti-inflammatory and soothing effects. It stimulates the activity of macrophages, which determines its antibacterial properties. Flavonoids inhibit the activity of enzymes involved in the metabolism of steroid hormones in the endometrium, reducing the risk of cancer.	Dietary supplement Ef Si with Dong Kva is an additional source of flavonoids, glycyrrhizic acid, contains isoflavones and tannins.\n1 capsule contains: red raspberry leaves (Rubus idaeus) - 79 mg; Dong Kwa root (Angelica sinensis) - 71 mg; medicinal ginger root (Zingiber officinale) - 53 mg; licorice root (Glycyrrhiza glabra) - 53 mg; carpal bug root (Cimicifuga racemosa) - 36 mg; aboveground parts of the blessed knicus (Cnicus benedictus) - 36 mg; the root of the medicinal marshmallow (Althaea officinalis) - 36 mg; the leaves of the purple horsetail (Eupatorium purpureum) - 36 mg.\nAuxiliary substances: gelatin.	Adults take 1 capsule 3 times a day with meals. The duration of reception is 3-4 weeks. If necessary, the reception can be repeated.	Individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
88	88	They make up for the deficiency of digestive enzymes.\nImprove the breakdown and assimilation of nutrients.\nNormalize the work of the digestive organs.	Dozens of different enzymes are involved in the digestive processes, which are secreted by the salivary glands, glands of the gastric mucosa, pancreas, intestinal epithelial cells. There are 3 main groups of digestive enzymes: proteases that break down proteins, lipases that break down fats, and amylases that break down starchy carbohydrates. Digestive disorders are often associated with a deficiency and with various disorders of the enzymes. When the digestive system does not cope with its function, specific symptoms may appear, such as nausea or heaviness in the stomach, belching, bloating, pain and rumbling in the abdomen, loose or unformed stools. Poorly digested food can cause food allergies, colitis, excessive bacterial growth. Digestive Enzymes will help overcome the deficiency of their own digestive enzymes.\nA unique formula of enzymes of animal and vegetable origin. It is effective for insufficient pancreatic function, lack of hydrochloric acid of the stomach. Due to the presence of plant proteases and pepsin in its composition, it works not only in the lumen of the small intestine, but also in the stomach.\nClinical trials of Digestive Enzymes have shown that in combination therapy with the main drug treatment, abdominal pain, heartburn, nausea went away much faster, the need for diet, antacids and antispasmodics decreased, appetite increased in patients with diagnoses of gastritis, gastroduodenitis, atrophic gastritis, chronic pancreatitis, cholelithiasis and peptic ulcer of the stomach and duodenum.	Betaine hydrochloride (Betaine Hydrochloride) is a substance of plant origin, the cleavage of which forms hydrochloric acid. It normalizes the acidity of the stomach, improves digestion with a lack of hydrochloric acid in the stomach. It is useful for digestive disorders in the stomach, dyspepsia, a feeling of stomach overflow that occurs after eating.\nPancreatic alpha-amylase is an enzyme that breaks down starchy carbohydrates, obtained from the pancreas. The optimum pH is 6,7-7,0.\nPepsin is a proteolytic gastric enzyme that is produced by the main cells of the glands of the gastric mucosa. Pepsin works in an acidic environment and exhibits optimal activity at a pH of 1.4-2.5. In the case of an increase in pH, the activity of pepsin decreases, and at a pH of more than 6.0, it stops. The enzyme is destroyed by alcohol.\nBromelain is a proteolytic enzyme derived from pineapple fruit. Bromelain is active both in the acidic environment of the stomach and in the neutral environment of the small intestine (the pH optimum of bromelain is 4.5–9.8) Bromelain has proteolytic activity against a variety of proteins. Bromelain digests fish, meat, dairy products and legumes especially well.\nPapain is a proteolytic enzyme that breaks down proteins. It is found in pineapples, bananas, melon tree juice, kiwi fruits, mango, papaya (it is more in unripe fruits). By the nature of the enzymatic action, papain is called "vegetable pepsin". But unlike pepsin, papain is active not only in acidic, but also in neutral and alkaline environments (pH range 3-12, optimum pH 5-8).\nBovine bile extract – helps to digest and assimilate fats.\nPancreatin is an extract of digestive enzymes of the pancreas. The main enzymes included in its composition are amylase, lipase and proteases (trypsin and chymotrypsin). The enzymes trypsin and chymotrypsin digest proteins, alpha-amylase – starchy carbohydrates, and lipase – triglycerides. The maximum enzymatic activity of the enzyme is noted 30-45 minutes after administration.\nPancreatic lipase – obtained from the pancreas. It is an enzyme that breaks down triglycerides (fats).	Dietary supplement Digestive enzymes is an additional source of digestive enzymes and betaine.\n1 capsule contains: betaine hydrochloride - 162 mg; alpha-amylase - 90 mg; pepsin - 60 mg; bromelain - 50 mg; papain - 45 mg; bovine bile extract - 40 mg; pancreatin - 22.5 mg; lipase - 0.5 mg; protease activity - at least 300 units.FIP / 5000 units. USP/caps.; amylase activity - at least 3000 units of FIP / 5000 units of USP/ caps.; lipase activity - at least 2000 units of FIP / 900 units of USP/caps.\nExcipients: microcrystalline cellulose, magnesium stearate, silicon dioxide, gelatin.	\nAdults take 1-2 capsules 3 times a day during meals. The duration of reception is 3-4 weeks. If necessary, the reception can be repeated.	Individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
89	89	Suppresses the feeling of hunger.\nPromotes weight loss.\nStabilizes blood sugar and cholesterol levels.	In weight loss programs, a key role is played by reducing the caloric intake and reducing the amount of food consumed, which often becomes a difficult task. The garcinia complex is a product that has the ability to suppress hunger and reduces the manifestation of depression associated with a decrease in food intake.\nA unique phytomineral formula, the use of which allows you to achieve a good result in the normalization of body weight.\nIn clinical trials, the product was used in conjunction with the dietary supplement Chromium Chelate, as an additional therapy to the drug treatment of patients with diabetes mellitus. Results in a group of patients taking dietary supplements: a more pronounced decrease in the main symptoms (blood sugar, increased appetite, thirst, polyuria, dry mouth).	Garcinia cambogia (Garcinia cambogia) – has a direct effect on the neurons of the hypothalamus, responsible for the feeling of hunger. With a decrease in the amount of food taken, the level of serotonin in the body decreases, and garcinia is able to raise it. Promotes the production of serotonin, which improves sleep and mood. Thus, garcinia extract is indicated for people suffering from bulimia (increased appetite) and bouts of depression. The active substances of this plant block the synthesis of fatty acids from carbohydrates. At the same time, they maintain a high level of glucose in the blood, which also inhibits appetite. At the same time, the transport of intracellular fatty acids into the mitochondria increases, followed by their oxidation. Garcinia extract is able to reduce fat production by 40-70% within 12 hours after eating and accelerates the breakdown of excess fat. Garcinia works especially well in combination with chromium and L-carnitine. In South Asia, garcinia fruits are added to food, which makes it "more satisfying and enjoyable."\nStellaria medium or woodlouse (Stellaria media) – reduces blood pressure, improves coronary blood flow, can be used to relieve angina attacks. It has a tonic effect, increases metabolism.\nChromium is the most important trace element, the daily requirement for which is 50-100 micrograms. However, it is characterized by a low absorption coefficient (about 10%) and a fairly high rate of excretion from the body. The most important biological role of chromium is to regulate carbohydrate metabolism and blood glucose levels. It regulates the deposition and use of glucose by cells, acting in conjunction with insulin. Chromium increases the sensitivity of cellular receptors to insulin, reducing the need for it, enhances its effect. Chromium deficiency can cause diabetes and, in addition to an increase in glucose levels, leads to an increase in triglycerides and cholesterol in the blood. Therefore, chromium is of great importance for the prevention of diabetes mellitus, atherosclerosis and cardiovascular diseases, enhances the process of heat production by the body, increases protein biosynthesis and carbohydrate reserves in the cell.\nL-carnitine is a vitamin–like substance formed in the body. L-carnitine enhances the oxidation of fatty acids, transporting them to the energy stations of the cell – mitochondria, thereby stimulating the production of energy, which is important for the work of the brain, muscle tissue, especially cardiac muscles. Reduces excess body weight and reduces the fat content in skeletal muscles, has an anabolic effect, reducing the breakdown of protein and carbohydrates, enhances mental activity.	Dietary supplement Complex with garcinia is an additional source of hydroxyl citric acid and chromium.\n1 capsule contains: Garcinia cambogia fruit extract - 285 mg; Stellaria medium, aboveground parts (Stellaria media) - 100.65 mg; L-carnitine - 23.6 mg (7.9% of ASP); chromium (in amino acid chelate) - 35 mcg (70% of ASP).\nAuxiliary substances: magnesium stearate, silicon dioxide, gelatin.	Adults take 2 capsules 3 times a day 30 minutes before meals. The duration of admission is 1 month.	Individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
94	94	Improves blood microcirculation, lowers blood pressure, blood viscosity.\nNormalizes the work of the heart and blood vessels, enhances myocardial contraction.	Heart health largely depends on our nutrition, which contains a number of nutrients that have a cardioprotective effect. Hawthorn is one of the most well-known food cardioprotectors. Hawthorn Plus provides nutritional support to the heart, thanks to the action of three phytopreparations: hawthorn, garlic and cayenne pepper.\nA unique phytoformula of Active Longevity for the prevention and maintenance programs of diseases of the cardiovascular system, including atherosclerosis.	Hawthorn (Crataegus laevigata) – has a cardiotonic effect, enhances myocardial contractions and reduces excitability. Increases blood circulation in the coronary vessels and vessels of the brain, increases the sensitivity of the heart muscle to the action of cardiac glycosides, eliminates pain in the heart area. It is used for functional disorders of cardiac activity, cardialgia, hypertension, asthenoneurotic conditions.\nCayenne pepper (Capsicum annuum) – belongs to the group of hot peppers. Improves the functioning of the cardiovascular system, dilates blood capillaries, relieves vascular spasm and blood viscosity, reducing blood pressure. It has an inhibitory effect in prostate cancer.\nGarlic (Allium sativum) – it contains an essential oil – allicin, to which it owes a specific smell, taste and powerful antibacterial effect, and also contains phytosterols, bioflavonoids, vitamins. It has been established that garlic is able to lower cholesterol levels in the blood, reduce blood clotting and blood pressure, improving heart function and preventing heart attacks and strokes. Garlic has long been famous as a means of increasing potency in men, thanks to improved blood circulation and increased blood flow to the pelvic organs.	Dietary supplement Hawthorn Plus is a source of flavonoids and allicin.\n1 capsule contains: hawthorn fruit (Crataegus laevigata, C.monogyna) - 350 mg; cayenne pepper fruit (Capsicum appiim) - 93 mg; garlic (Allium sativum) -17 mg.\nAuxiliary substances: gelatin.	Adults take 1-3 capsules 3 times a day with meals. The course of application is 2-3 weeks.	Individual intolerance to the components is not recommended for pregnant and lactating women.	\N
90	90	Improves microcirculation.\nIt has an antispasmodic effect.\nProvides elasticity and strength of blood vessels.\nIncreases mental performance, improves memory, attention.	Normal blood flow ensures the supply of oxygen and nutrients to organs and tissues, as well as the elimination of toxic substances and metabolic products. Ingredients that relieve vasospasm, reduce blood viscosity, and strengthen the walls of blood vessels can help improve blood flow. Ginkgo / Gotu Kola has a systemic improvement of microcirculation, improves cerebral circulation, peripheral blood flow of deep arteries and venous blood flow, improves potency, has antispasmodic effect, stimulates regeneration and collagen formation. Reduces the risk of heart attack and stroke, provides oxygen to the brain. It is an effective neuroprotector – accelerates thinking, increases memory and concentration, helps with anxiety and depression, normalizes sleep, improves performance. Ginkgo / Gotu Kola will help to cope with negative age-related changes (dizziness, fluctuations in blood pressure, cold limbs).\nUnique phytomineral formula, improves peripheral blood circulation.	Ginkgo biloba (Ginkgo biloba) – has an antispasmodic effect, prevents capillary fragility. Ginkgo biloba improves microcirculation in all organs and tissues, including brain tissue, which improves its functioning. It is equally effective both in pediatric pathology (encephalopathy, dementia, lack of concentration, neurocirculatory dystonia) and in geriatric practice (senile dementia, Alzheimer's disease, decreased visual acuity, hearing loss, tinnitus). Students taking ginkgo biloba have improved academic performance. Ginkgo biloba also helps with varicose veins, hemorrhoidal vein thrombosis, obliterating diseases of the arteries of the lower extremities. The effect of ginkgo biloba increases with the duration of its intake.\nGotu kola or Centella asiatica (Centella asiatica) – reduces blood pressure and heart rate, increases hemoglobin levels, strengthens blood vessels, which improves cerebral circulation and oxygen supply to the brain, thereby increases mental abilities, accelerates thinking, improves memory and concentration. Gotu kola has a calming effect in nervous disorders and anxiety states, reduces the manifestation of depression. Improves higher nervous activity. In Asian countries, this plant is called "food for the brain." It has a wound-healing effect, which is associated with the activation of cell division. This increases the formation of collagen, which is necessary for the formation of connective tissue. Therefore, gotu kola enhances the processes of tissue regeneration and, above all, the restoration of skin damage. In oriental medicine, it is known as a remedy that promotes the restoration of mucous membranes and skin (small wounds, burns, cuts), as well as the healing of trophic ulcers. It is used as a stimulating and tonic that increases potency.	Dietary supplement for Ginko food/Gotu Kola is an additional source of flavonic and triterpene glycosides and flavonols, contains isoramnetin.\n1 tablet contains: Gotu kola herb (Centella asiatica) - 100 mg; Ginkgo biloba leaf extract (24% glycosides) - 40 mg; calcium (in dicalcium phosphate) - 73 mg (7.3% of TSA).\nExcipients: microcrystalline cellulose, cellulose, stearic acid, silicon dioxide, magnesium stearate, shell for vitamin preparations (Carnauba wax, cellulose coating, purified water).	Adults take 1/2 tablet 2 times a day during meals. The duration of admission is 1 month with repeated admission if necessary.	Individual intolerance to the components of the product, pregnant and lactating women, hemophilia.	\N
91	91	It is a chondroprotector.\nIt is necessary for the formation of connective tissue, cartilage, joint fluid.\nIt facilitates the course of inflammatory and degenerative diseases of the joints and spine.	The human body is constantly undergoing processes of regeneration of cartilage tissue of the joints and spine, which allows them to maintain their health. Hard work, sports loads, injuries, obesity, age can accelerate the degradation of cartilage tissue and at the same time slow down the rate of its recovery, which leads to the destruction of joints or spine and usually ends with osteoarthritis or osteochondrosis. With the progression of this process, the mobility of the joint decreases, which is accompanied by inflammation and the appearance of pain. As a result, the joint cannot function normally and often requires surgical replacement. Accelerate the regeneration of cartilage tissue and restore joint health will help chondroprotectors, one of which is glucosamine, which the body uses as a material for the synthesis of components of cartilage tissue. Glucosamine NSP is recommended to be used in conjunction with Chondroitin and MSM.\nA unique formula made from vegetable and animal raw materials. The effect of glucosamine from crab shell is enhanced by uncaria bark, which helps to reduce inflammation in the joints and stimulate the processes of regeneration and restoration of cartilage tissue.\nClinical trials were conducted in patients with osteoarthritis and rheumatoid arthritis on the background of basic therapy. In a larger number of subjects, morning stiffness, swelling, soreness decreased, and at the end of therapy, the inflammatory process decreased or disappeared completely.	Glucosamine hydrochloride – glucosamine is a part of connective tissue: cartilage, ligaments, tendons, heart valves, joint fluid, hair and nails. Glucosamine hydrochloride contains about 83-88% pure glucosamine, while glucosamine sulfate contains only 59-65%. When taken orally, glucosamine is well absorbed (glucosamine sulfate – up to 80%, glucosamine hydrochloride – up to 95% due to better solubility). Glucosamine hydrochloride is obtained from the shells of marine crustaceans or plant polysaccharides. The beneficial effect of glucosamine on cartilage metabolism has been established. Glucosamine weakens the work of enzymes that destroy cartilage tissue. The introduction of glucosamine also stimulates the synthesis of proteoglycans and collagen, increasing the production of extracellular matrix components, promotes the fixation of sulfur during the synthesis of chondroitinseric acid, facilitates the normal deposition of calcium in bone tissue. Glucosamine inhibits the development of degenerative processes in the joints, restores their function, reducing joint pain, reducing inflammatory processes. With prolonged use in osteoarthritis, glucosamine prevents the progression of osteoarthritis, reduces the severity of pain syndrome, increases the mobility of the affected joint. The use of glucosamine in conjunction with MSM leads to a significant reduction in pain syndrome in arthrosis.\nUncaria hairy or cat's claw (Uncaria tomentosa) – has a pronounced immunostimulating effect, activating macrophages and T-lymphocytes. Prevents the bonding of platelets and the formation of blood clots, reduces blood pressure. It exhibits antioxidant, antiviral, antitumor and anti-inflammatory properties. Uncaria is used for immunodeficiency and allergic conditions, inflammatory joint diseases, arthritis, rheumatism, lupus, acute and chronic viral, bacterial and fungal infections, shingles, genital herpes. The extract obtained from uncaria suppresses cell division, which is why it is used to help patients with malignant tumors.	Dietary supplement Glucosamine NSP is an additional source of glucosamine.\nComposition - 1 capsule: glucosamine hydrochloride (from crab shell) - 400 mg (80% of ASP), bark of Uncaria hairy (Uncaria tomentosa) - 50 mg.\nAuxiliary substances: gelatin, cellulose, maltodextrin, magnesium stearate, silicon dioxide.	Adults take 1 capsule daily with meals. The duration of admission is 1 month. After 2-3 months, the reception can be repeated.	Individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
92	92	Improves microcirculation and cerebral circulation.\nIncreases mental abilities, memory, reaction speed.\nAccelerates the healing of wounds, abrasions, burns.	One of the few products with the ability to improve venous outflow from the cranial cavity by controlling the mechanisms of migraine-like headaches.	Gotu kola or Centella asiatica (Centella asiatica) – has a beneficial effect on higher nervous activity. It has a calming effect in nervous disorders and anxiety states, reduces the manifestation of symptoms of depression. Reduces blood pressure and heart rate, increases hemoglobin levels, strengthens blood vessels, improves cerebral circulation and oxygen supply to the brain, thereby increases mental abilities, accelerates thinking, improves memory and concentration. In Asian countries, this plant is called "food for the brain." Gotu kola has a wound-healing effect, which is associated with the activation of cell division. This increases the formation of collagen, which is necessary for the formation of connective tissue. Therefore, gotu kola enhances the processes of tissue regeneration and, above all, the restoration of skin damage. In oriental medicine, it is known as a remedy that promotes the restoration of mucous membranes and skin (small wounds, burns, cuts), as well as the healing of trophic ulcers. It is used as a stimulating and tonic that increases potency.	Dietary supplement Gotu Kola NSP is an additional source of flavonoids, triterpene saponins and essential oils.\n1 capsule contains: Gotu Kola (Centella asiatica) - 395 mg. Auxiliary substances: gelatin.	Adults take 2 capsules 2 times a day with meals. The duration of admission is 3-4 weeks with repeated admission if necessary.	Individual intolerance to the components of the product, pregnancy, breast-feeding.	\N
93	93	It has an antioxidant and oncoprotective effect.\nStrengthens the walls of blood vessels, improves blood circulation.	Many processes in our body lead to the formation of free radicals. Therefore, the body needs powerful antioxidant protection. Antioxidants bind and neutralize free radicals.\nGrapine with Protectors is a complex of extracts from the skin and seeds of grapes (grape) and pine bark (pine), which have very high antioxidant activity. The product includes citrus bioflavonoids, hesperidin, vitamin C, which are antioxidants, and a complex of 8 dried plants that enhance the action of antioxidants. Grapine with Protectors protects cell membranes, strengthens the walls of blood vessels and improves peripheral blood circulation. Protects cell membranes and blood vessels from antioxidant stress. It has a wound-healing, antiseptic effect. It can be used as an oncoprotector (skin, breast, pancreatic cancer, melanoma).	Cultivated grapes (Vitis vinifera). A large number of polyphenols (anthocyanins, dihydroquercetin, resveratrol) were found in extracts of the skin and seeds of red grape varieties, which have a strong antioxidant and membrane-protective effect, stabilize blood capillaries. Resveratrol has weak estrogen-like activity.\nVitamin C is the most important water–soluble antioxidant.\nSeaside pine (Pinus maritima) – the bark contains a huge amount of polyphenolic substances. Demonstrates antiviral, anti-inflammatory, inhibiting cell division, antimutagenic action, protects the skin from the damaging effects of ultraviolet radiation. The extract has a strong antioxidant, capillaroprotective, antimicrobial effect. It is used for healing purulent wounds and ulcers, for rinsing the mouth and in toothpastes, reduces bleeding gums.\nBroccoli cabbage (Brassica oleracea) is rich in vitamins, carotenoids, and indoles. Sulforaphane has an antibacterial effect, killing bacteria that are immune to antibiotics. Sulforaphane also inhibits tumor development, along with indole-3-carbinol and synegrine. The first activates the immune system to fight tumor cells, and the second prevents the proliferation of cancer cells, stopping their division.\nCarrot (Daucus carota) – contains carotenoids, vitamins, flavonoids, anthocyanidins. It has antiseptic, anti-inflammatory, wound healing effect. Carotenoids and flavonoids are strong antioxidants.\nBeetroot (Beta vulgaris) – the root vegetable contains organic acids, magnesium, calcium, potassium, iron, iodine, vitamins, betaine, a large amount of antioxidants. Natural antiseptics contained in beets allow it to be used for infectious diseases, dysbiosis, to improve the condition of the microflora of the skin.\nRosemary officinalis (Rosmarinus officinalis) – has a tonic effect, relieves stress and nervous tension. It is recommended in the post-stroke period, due to its property to improve cerebral circulation, memory and vision. Helps with colds: its volatile substances are able to purify the room air from 80% of the microbes in it. It copes well with Staphylococcus, Streptococcus, E. coli and yeast fungi.\nCommon tomato (Solanum lycopersicum) – contains a large amount of carotenoids (lycopene), vitamins, organic acids, polyphenols. Eating tomatoes reduces the risk of cancer of the stomach, uterus, pancreas, prostate, mammary glands and oral cavity. Men who consume tomato juice or sauce daily reduce the risk of prostate cancer by 50%.\nTurmeric long (Curcuma longa) – slows down the growth of melanoma cells, breast and pancreatic cancer. Curcumin suppresses the growth of malignant tumors of the skin, uterus and breast. Cineol stops the growth of new blood vessels in tumors. Tumeron has an antiparasitic effect and inhibits the growth of bacteria. Accelerates wound healing.\nGarden cabbage (Brassica oleracea) – contains vitamins, carotenoids, indoles. Indoles have antitumor activity, vitamins and carotenoids have antioxidant activity.\nHesperidin is a plant flavonoid. It strengthens the walls of peripheral and coronary blood vessels, improves blood flow, relaxes the smooth muscles of the vessels, reducing blood pressure. Hesperidin reduces the severity of allergic reactions, asthma symptoms, has an antioxidant, anti-carcinogenic and anti-inflammatory effect.\nBioflavonoids (flavonoids or polyphenols) are plant pigments. More than 6,500 flavonoids are known. Anthocyanins determine the red, blue, purple color of flowers, and flavones and flavonols – yellow and orange. The human body is not able to synthesize flavonoid compounds, and for us they are irreplaceable nutrition factors. Flavonoids have antioxidant activity, are able to influence many metabolic enzymes, a number of flavonoids have antibacterial action. Flavonoids rutin and quercetin, called P-vitamins, in combination with ascorbic acid, have a membrane-protective effect, reduce the fragility of capillaries, inhibit blood clotting and increase the elasticity of red blood cells.	1 tablet contains: Vegetable base - 200 mg (broccoli flowers, cabbage leaves, carrot root, red beet root, rosemary leaves, tomato fruits, turmeric root, grapefruit bioflavonoid extract, hesperidin bioflavonoid extract, orange bioflavonoid extract), calcium in dicalcium phosphate - 38 mg (3.8% of the daily requirement), red grape skin extract - 50 mg, broccoli flowers - 34 mg, grape seed extract - 24 mg, vitamin C (ascorbic acid) - 20 mg (33% of the daily requirement), pine bark extract - 1 mg.\nExcipients: microcrystalline cellulose, stearic acid, magnesium stearate, silicon dioxide, vitamin shell (Carnauba wax, cellulose coating, purified water).	Adults take 1 tablet 2 times a day with meals for 3-4 weeks with repeated intake if necessary.	Individual intolerance to components, pregnancy, breast-feeding.	\N
95	95	It has an antioxidant effect.\nHelps to facilitate breathing in respiratory diseases.\nIt has an anti-inflammatory effect.	Resisting allergies is not an easy task. Modern medicine, unable to defeat allergies, suggests blocking the development of the allergic process with the help of antihistamines. The Gista Block of the NSP company has a similar effect, which stops the production of histamine.\nThe active substances of the components of this formula have antioxidant properties, protect cell membranes and vascular wall, regulate histamine balance, have immunomodulatory, oncoprotective, anti-inflammatory and anti-rheumatic effects.\nA unique phytomineral formula with a wide spectrum of action.	Quercetin (Quercetin) – obtained from the extract of Sophora japonica (Sophora japonica). Refers to polyphenols. It is found in large quantities in red wine, onions, green tea, fruits and vegetables. Quercetin has a powerful antioxidant and moderate phytoestrogenic effect, stabilizes cell membranes and protects vascular walls, normalizes histamine balance and modulates immune function. Radioprotective and antitumor effect are noted. It has been established that quercetin has a beneficial effect on the state of the prostate gland. It has anti-edematous, antispasmodic, anti-inflammatory effect.\nNettle dioecious (Urtica dioica) – used for anemia, fever, as a diuretic and anti-inflammatory agent, as well as as a lactation in nursing women. It is used for rheumatism, arthrosis, gastric diseases.\nBitter orange or orange (Citrus aurantium) – stimulates the formation of melanin and vitamin D. Enhances the breakdown of fats and increases heat production. It has an antiseptic, anti-rheumatic, wound healing, anti-inflammatory, antispasmodic, expectorant effect. It is useful for palpitations, relieves depression, fear, irritability.\nBromelain is an enzyme derived from pineapple. It is active both in the acidic environment of the stomach and in an alkaline environment (the optimum pH of bromelain is 4.5–9.8), and can also work in a neutral environment of the small intestine. Bromelain has proteolytic activity against a wide variety of proteins. It digests fish, meat, dairy products and legumes especially well. Bromelain increases the activity of macrophages, natural killer cells, T-lymphocytes, enhancing antitumor immunity and facilitating contact of killer cells with cancer cells.	Dietary supplement Gista Block is an additional source of quercitin, contains bromelain and synephrine.\n1 capsule contains: quercitin (Sophora japonica fruit extract - 84%) - 90 mg (75.6 mg - 252% of ASP); nettle leaves (Urtica dioica) - 90 mg; orange fruit powder (Citrus aurantium) - 70 mg; bromelain (pineapple extract - 21.5%) - 20 mg; calcium (in dicalcium phosphate) - 33 mg (3.3% of TSA).\nAuxiliary substances: magnesium stearate, microcrystalline cellulose, silicon dioxide, gelatin.	Adults take 1 capsule 1 time a day with meals. The duration of admission is 1 month.	Individual intolerance to components, pregnancy, breast-feeding.	\N
96	96	It has a pronounced antibacterial and antiparasitic effect.\nSuppresses the development of Helicobacter Pylori bacteria.	We know that with bacterial infections, doctors always prescribe antibiotics, the effect of which is not always harmless. HP Fighter has a strong antibacterial and antiseptic effect.\nIn 1980, a group of Australian researchers found that one of the causes of gastric and duodenal ulcers is a bacterium known as Helicobacter pylori, which lives in the lumen of the antrum of the stomach and adapts to an aggressive acidic environment.\nStudies have shown that the combination of plants such as Po d'Arco, carnation and elecampane has a strong deterrent effect on the development of Helicobacter pylori. Therefore, they were included in the HP Fighter. The dietary supplement also contains cayenne pepper and licorice, known for their antibacterial and anti-inflammatory effects. The combination of herbs provides antiparasitic and anthelmintic action, and cloves neutralize even the most persistent forms of parasites – cysts and eggs of worms. The product can be used not only as a drug for helicobacter infection, but also for various programs to cleanse the body of parasites.\nA unique phytoformula with antibacterial, antiseptic and antifungal effect. Licorice in the formula is used in a form free of glycyrrhizin, which does not give side effects in the form of increased blood pressure.	Licorice naked (Glycyrrhiza glabra) – stimulates secretory activity. It is known for its enveloping, secretolytic and mild laxative effect. Licorice has antibacterial, anti-inflammatory and antispasmodic effects on smooth muscles. Deglycyrrhizated licorice root extract (99% glycyrrhizin has been removed from licorice) is non-toxic. Suppresses the production of gastric juice in response to the introduction of histamine. It is used as an anti-inflammatory agent for hyperacid gastritis, gastric ulcer and duodenal ulcer, bronchial asthma, neurodermatitis, allergic and occupational dermatitis, eczema, rheumatism, gout, hemorrhoids.\nBy d’Arco or ant tree (Tabebuia heptaphylla) – bark is a powerful antiseptic. It has an antifungal effect in intestinal and vaginal candidiasis, suppresses pathogens of mycoses (dermatomycosis, histoplasmosis). It helps with parasitic infections, helps to reduce severe pain in arthritis and rheumatism, has an antiviral effect, promotes the production of interferon.\nAromatic clove (Syzygium aromaticum) is the main component of clove essential oil – eugenol is a very strong antiseptic, and also has a strong fungicidal effect on the types of fungi that cause skin disease. The essential oil of the plant suppresses the reproduction of tuberculosis bacillus.\nDevyasil (Inula racemosa) – has anti-inflammatory, anthelmintic, especially with ascariasis, and antimicrobial, expectorant effect, increases the excretion of bile, improves appetite.\nCayenne pepper (Capsicum annuum) – belongs to the group of hot peppers, contains the alkaloid capsaicin. It has an antiseptic and choleretic effect, dilates blood capillaries, accelerates scarring of ulcers, stimulates the secretion of saliva, mucus, has a choleretic effect.	Dietary supplement HP Fighter is an additional source of flavonoids.\n1 capsule contains: deglycyrrhized licorice root extract (Glycyrrhiza glabra) - 100 mg; bark extract According to d’Arco (Tabebuia heptaphylla) - 100 mg; extract of fragrant clove flowers (Syzygium aromaticum) - 100 mg; extract of elecampane root (Inula racemosa) - 100 mg; lecithin powder (97%) - 12 mg; fruits of cayenne pepper (Capsicum annuum) - 0.2 mg.\nExcipients: cellulose, gelatin.	Adults take 1-2 capsules 2 times a day during meals.	Individual intolerance of individual components. Pregnant and breast-feeding women are advised to consult a doctor before use	\N
97	97	Strengthens, nourishes the veins and increases their tone.\nPrevents the development of varicose veins, rosacea and other vascular disorders.\nSupports blood flow in the extremities and in the vessels of the heart.	The main cause of varicose veins is a violation of the tone of the walls of the veins. This may be due to a violation of the formation of collagen and elastin in the walls of blood vessels, which is a consequence of connective tissue dysplasia. To support vascular health are important: activation of the formation of connective tissue proteins and stabilization of vascular tone.\nTo support the health of veins and blood vessels, NSP has created a product based on horse chestnut fruit extract, known as a means to increase vascular tone, reduce blood viscosity and strengthen the vein wall. The effect of the extract is enhanced by venotonics and capillaroprotectors: fenugreek extract, vitamin C, bioflavonoids hesperidin and rutin. This "smart" formula perfectly illustrates the phrase: "the whole is greater than the sum of its parts."\nHorse chestnut fruits contain some toxic components. But the NSP company uses extraction methods, thanks to which this plant gives the product only useful properties without undesirable toxic effects.\nThe Vari-Gone is designed to support the tone, elasticity and nutrition of the walls of veins and blood vessels. Long-term use reduces the manifestation of varicose veins and vascular network, and also supports optimal blood flow to the heart and lower extremities.	Horse chestnut fruit extract (Aesculus hippocastanum) is rich in triterpene saponins (escin), tannins, vitamins C, K, B1, contains coumarin glycosides esculin, fraxin. Esculin reduces the permeability of capillaries, reduces the risk of thrombosis, increases the production of antithrombin, has a decongestant effect and reduces the fragility of capillaries. Escin has an angioprotective and venotonic effect and reduces blood viscosity. Horse chestnut is rich in antioxidants, including glycosides of quercetin and kaempferol. The active ingredients of horse chestnut improve metabolism and increase vascular strength, have anti-inflammatory and analgesic effects, help with post-thrombophlebitic syndrome and chronic venous insufficiency (including relieve swelling, cramps in the calf muscles, pain and a feeling of heaviness in the legs), varicose veins, trophic disorders, post-traumatic or postoperative soft tissue edema. The same properties allow the use of horse chestnut fruits in the treatment of hemorrhoids.\nHorse Chestnut:\nrelieves inflammation, swelling and heaviness in the legs;\nit has an analgesic effect;\nstrengthens the walls of blood vessels, reduces the permeability of capillaries;\nexpands the lumen of blood vessels, relieves spasm;\nreduces blood viscosity, prevents the formation and promotes the resorption of blood clots;\naccelerates the healing of wounds and trophic ulcers;\nprevents the occurrence of rosacea (vascular asterisks, meshes and meshes — persistent expansion of small vessels).\nThe effectiveness of horse chestnut fruit extract can be equated to wearing compression stockings to maintain the health of leg veins. There are also facts that say that this plant is useful for maintaining male reproductive health.\nVitamin C has a powerful antioxidant effect, prevents the destruction of the inner wall of capillaries (by neutralizing free radicals), eliminates oxygen starvation of cells, strengthens the connective tissue of large arteries, improves vascular tone, stimulates the synthesis of collagen and elastin, prevents the accumulation of cholesterol.\nFenugreek seeds (Trigonella foenum-graecum) — contain flavonoids, tannins, steroid saponins (diosgenin, tigogenin, yamogenin), thanks to which they have an anti-inflammatory, analgesic and antispasmodic effect.\nBioflavonoid hesperidin — increases vein tone, improves lymphatic drainage and microcirculation. It helps to strengthen the walls of blood vessels, increase blood flow in coronary vessels, reduce blood pressure and prevent bleeding. It reduces allergic reactions, asthma symptoms and has antioxidant, anti-carcinogenic and anti-inflammatory effects.\nBioflavonoid rutin — in combination with vitamin C has the ability to reduce the permeability and fragility of blood capillaries, has an antioxidant effect. Rutin increases the content of hyaluronic acid, which increases the elasticity of capillaries and reduces their permeability.	Dietary supplement "Veri-Gon" is an additional source of bioflavonoids, vitamin C and rutin.\n1 capsule contains: horse chestnut fruit extract (Aesculus hippocastanum) – 175.0 mg; vitamin C (ascorbic acid) – 48.5 mg (54% of AUP); fenugreek seeds (Trigonella foenum-graecum) – 45.0 mg; hesperidin – 30.0 mg (15% of AUP); lemon extract – 30.0 mg; rutin – 30.0 mg (54% of AUP).\nExcipients: microcrystalline cellulose, magnesium stearate, gelatin capsule (gelatin, water).	Take 1 capsule 2 times a day with meals.	Individual intolerance of components. Persons taking blood-thinning drugs, pregnant and lactating women should consult a doctor before use.	\N
98	98	Supports the work of the heart muscle\nIt is used as a fat burner in weight loss programs when doing sports\nImproves brain efficiency and cognitive function\nSupports liver function, reduces the severity of fatty hepatosis\nAntioxidant\nIncreases energy production and supports the work of muscle tissue	This nutrient, which is important for metabolism and energy production, is referred to as vitamin-like substances. It is believed that the need for L-carnitine is 300 — 900 mg, however, the physiological need for it is much higher and may exceed 1500 mg.\nThe action of L-carnitine is based on the transfer of fatty acids through the mitochondrial membrane, where they are burned, releasing energy. And energy production is a key factor in supporting the work of the heart, muscle tissue, liver, central nervous system, kidneys and other organs.\nIt allows you to burn significant fat deposits if you take the drug and perform physical exercises.\nDietary supplement L-carnitine can be recommended:\nas a cardioprotector – supports the work of the myocardium in everyday life and in critical conditions;\nas a neuroprotector – increases the efficiency of the brain and cognitive function in conditions of increased stress, as well as in acute and chronic diseases;\nas a hepatoprotector – supports the work of liver cells, reducing the severity of fatty hepatosis and preventing the development of liver failure;\nas a fat burner in weight loss and sports programs for adults and children;\nas an antioxidant, it is a radical trap, destroys peroxides and increases the activity of antioxidant defense enzymes;\nfor people involved in sports in order to increase energy production and support the work of muscle tissue.\nFor the production of the product, NSP uses encapsulated L-carnitine, which is protected by a special shell of cellulose derivatives and long-chain triglycerides, so that it is less hygroscopic than L-carnitine in its natural form, and retains its integrity on the way to the intestine.	L-carnitine is a derivative of aminobutyric acid, formed in the body from two essential amino acids lysine and methionine. It is also present in food, mainly as part of meat products. But as calculations show, a person lacks his own and food resources of L-carnitine, given that its formation in the body reaches a maximum in 14-15 years, and only decreases with age. In addition, cases of various congenital disorders of L-carnitine formation and metabolism are not uncommon.\nIndications for the appointment of L-carnitine\nDisorders of the heart:\nCoronary heart disease, cardiomyopathy (decreased carnitine content in the heart muscle);\nacute coronary syndrome, myocardial infarction, post-infarction condition;\ncardiac arrhythmias (reduces the number of ventricular extrasystoles).\nOverweight in children and adults:\nin weight loss programs;\nwhen doing sports for adults and children;\nrehabilitation after injuries and operations.\nSkeletal muscle disorders:\nmyopathy - increases physical endurance.\nHypotrophy in children and adults:\nhypotrophy in children and body weight deficiency in adults;\npremature babies, delayed physical development;\nweakening and exhaustion in oncological diseases.\nViolation of brain functions:\nchronic hypoxia of the brain;\nacute stroke;\ntraumatic brain injury;\nepilepsy.\nDiseases of the central nervous system:\nCNS degeneration processes – stimulates nerve growth factor, accelerates regeneration of neurons and peripheral nerves;\nage-related disorders (Alzheimer's disease, senile dementia);\ntype 2 diabetes mellitus – slows down damage to the nervous system;\nchronic fatigue syndrome (fatigue, drowsiness, hypotension);\nvegetative-vascular dystonia, asthenic syndrome;\ndecrease in the academic performance of schoolchildren and students;\nincreased mental stress;\na state of stress.\nAlso, taking L-carnitine is recommended for viral hepatitis, urolithiasis, type 1 diabetes mellitus, respiratory distress syndrome, overweight in children and adults, endothelial dysfunction, rehabilitation after serious illnesses, in the nutrition of an elderly person (compensation for reduced endogenous education and deterioration in the quality of nutrition) and many other problems.	Dietary supplement L-carnitine is an additional source of L-carnitine.\n1 capsule contains: L-carnitine 295 mg (98% of the adequate intake level).\nExcipients: cellulose, magnesium stearate (rast.), silicon dioxide, gelatin.	1-2 capsules a day with meals.	Individual intolerance to dietary supplement components. During pregnancy and lactation, it is necessary to consult a doctor before use.	Store in a dry place, protected from sunlight and inaccessible to children at a temperature not exceeding +30 ° C.
99	99	It has a powerful antimicrobial effect\nIt contains silver in the form of microscopic particles in a colloidal solution, which ensures maximum bioavailability of the active substance\nContains 100 micrograms of silver per 5 mg of gel\nNon-toxic\nDoes not contain alcohol\nSafe to use for children\nCleanses and moisturizes the skin	Due to the high silver content, a very small amount of gel is required for surface treatment. The tube holds 85 g of product – this is enough for a long time even for use by the whole family. But at the same time, it is convenient to take such a tube with you on the road, even on a plane.\nThe gel forms an invisible film on the surface of the skin, so that it has a long-lasting effect on the treated area.\nThe gel has a very wide spectrum of action – it can be used for injuries and injuries of varying severity, and it can also clean the skin when it is not possible to use soap and water.\nSilver relieves the inflammatory process, reduces swelling and prevents the formation of scars.\nThe gel is an effective cleansing, disinfecting agent. In its production, a special patented Aqua Sol technology is used, which involves the use of the smallest silver particles, thanks to which the maximum bioavailability of silver and its effective effect through the skin is achieved. These particles together with oxygen molecules form a compound of silver oxide (Ag4O4), in the structure of which silver is highly bioavailable. The gel is non-toxic, does not contain alcohol, and it can be used for children.	\N	\N	Gel "Silver Shield" is a universal remedy for all members of your family from the youngest to the older generation.\nWhat is used for:\nOpen wounds, cuts, scratches, abrasions, including on the mucous membranes\nSuppuration\nBedsore care\nAcne (blackheads)\nBurns\nEczema\nSkin irritations\nWith insect bites\nFor cleaning and disinfection of the skin	\N	\N
100	100	Relieves muscle tension and pain in muscles and joints\nIt provides nutritional support to the skin and subcutaneous tissue, improving its blood supply\nAn indispensable tool for sports and household injuries, insect bites	Essential oils are a mixture of volatile, fragrant substances released from plants. A very important characteristic of essential oils is that they quickly penetrate through the skin and enter the bloodstream.\nAromatherapy massage with the use of Tei-Fu Massage Lotion based on natural essential oils is a wonderful tool for relieving stress, nervous tension and improving well–being, relaxing muscles. The lotion contains: gaultheria leaf oil, menthol, camphor, eucalyptus leaf oil, sweet almond oil. The active ingredients penetrate deeply into the tissues, improving blood circulation and metabolism.\nPrecautions: The lotion has a tingling effect. Avoid contact with eyes. Keep out of reach of children. For external use only!	\N	Purified water, gaultheria leaf oil, menthol, camphor, eucalyptus leaf oil, cetearyl alcohol, sweet almond oil, stearic acid, glyceryl stearate / polythylene glycol-100 stearate, cetearyl alcohol / cetearet-20, butylene glycol, caprylic/ caprine triglyceride, preservatives: butylparaben, methylparaben, propylparaben, ethylparaben, phenoxyethanol, oil clove leaves, dimethicone, acrylates / With 10-30 alkyl acrylate crosspolymer, xanthan gum, squalane, tetranatrium EDTK, citric acid, allantoin, aloe vera, hydroxyethyl acrylate, polysorbate 6, sodium acryloyldimethyl, squalane, taurate copolymer.	It has a warming effect, used to improve the microcirculation of the skin. Apply two to three times a day.\nIndications for use:\nMyalgia and myasitis (muscle pain)\nSciatica, exacerbation of osteochondrosis and diseases of small joints\nSports and household injuries (bruises, sprains, dislocated joints, etc.)\nPost-traumatic complications: muscle spasms, scars, ankylosis (stiff joints)\nHeadache (rub into the neck, temples)\nToothache (rub into the projection area of the tooth)\nInsect bites and minor skin injuries (to the area of injury)	\N	\N
101	101	It has a strong antiseptic, antifungal and bactericidal effect\nIt is used for cuts, burns and inflammatory skin diseases\nHelps with dry skin, rashes, insect bites and burns from plants	Since ancient times, Australian aborigines have used tea tree oil (Melaleuca alternifolia) for infection of the kidneys, genitourinary tract, for local anesthesia. It is a powerful disinfectant, bactericidal, fungicidal agent. Neutralizes poisons during insect bites, affects the scabies mite. It has a mild analgesic effect. It is indicated for fungal diseases, vaginitis, ear diseases, burns, cuts, abrasions, skin infections. With a cold, a good effect is achieved by inhalation with tea tree oil. The healing properties of this oil have been confirmed by numerous clinical studies around the world. During World War II, tea tree oil was included in the first aid kit of army and Navy personnel in tropical countries.	\N	100% Australian tea tree oil (Melaleuca alternifolia)	For external use only! In case of skin damage, a small amount of oil can be applied to diseased, burned, chapped, etc. skin areas. It can be diluted in any pre-pasteurized vegetable oil (in a ratio of 1:5 - 1:10). If you have a cold, add 2-3 drops for inhalation.\nAttention! You can not use non-diluted oil on open wounds, burn wounds (after opening blisters) and mucous membranes. Keep out of reach of children. Avoid contact with eyes.	\N	\N
102	102	It has a wound-healing effect and improves the condition of the gums\nIt is recommended for the prevention and treatment of periodontal disease\nIt has a minty smell and a soft refreshing taste\nIt does not contain artificial colors, flavors, coarse abrasives, fluorides\nContains extracts of medicinal plant components\nVery little paste is required for brushing teeth, it is economical	\N	The composition of Sunshine Bright toothpaste with green tea leaf extract includes a whole set of herbal components that have a positive effect on the oral cavity:\nSilicon dioxide powder is a sorbent that perfectly removes stains from teeth.\nSodium bicarbonate (baking soda) – neutralizes bacterial acids that destroy tooth enamel.\nCalcium carbonate is a natural chalk of a high degree of purification, removes stains and food residues.\nStevia (Stevia rebaudiana) – contains steviosides, which not only have a sweet taste, but are also able to restrain the growth and reproduction of bacteria and other pathogenic microorganisms, saving our teeth from caries, and gums from periodontal disease.\nCarrageenan (Chondrus crispus) is a polysaccharide of red algae, has sorption ability.\nCorn oil (Zea mays) – has a softening effect.\nAstragalus extract (Astragalus sinicus) – provides a protective and anti-inflammatory effect for the oral mucosa.\nMyrrh resin (Commiphora myrrha) is a natural antiseptic, used in dentistry in the treatment of stomatitis and gingivitis.\nCanadian yellowcorn extract (Hydrastis canadensis) is a great antiseptic, stops bleeding, helps with periodontal disease.\nExtract of Icelandic moss (Cetraria islandica) – soothes inflamed membranes of the oral cavity, also has an antibacterial effect.\nGreen tea leaf extract (Camelia sinesis) – contains bioflavonoids and tannins that have a beneficial effect on the mucous membrane.\nBlack elderberry fruit extract is rich in vitamins, bioelements and tannins.\nAloe vera – has a wound-healing and bactericidal effect.	Sorbitol, silicon dioxide, purified water, glycerin, sodium bicarbonate, calcium carbonate, sodium lauroylsarcosinate, natural mint flavor, stevia (Stevia rebaudiana), sodium hydroxide solution, cellulose resin, carrageenan (Chondrus crispus), unsaponifiable corn oil (Zea mays), Astragalus extract (Astragalus sinicus), myrrh resin (Commiphora myrrha), Canadian yellowcorn extract (Hydrastis canadensis), Icelandic moss extract (Cetraria islandica), green tea leaf extract (Camelia sinesis), elderberry extract (Sambucus nigra), aloe vera.	Using a toothbrush, apply a small amount of paste (the size of a pea) to the teeth and clean all their surfaces with a brush movement from the gums. Rinse your mouth with warm water.\nThe unique composition of medicinal plants does not irritate the mucous membrane. The longer the application of the paste on the gums, the higher its effectiveness, so do not rush to rinse your mouth.	\N	\N
103	103	Protects sensitive lip skin from UV rays\nNourishes and softens the skin\nVitamins A, B5, C and E saturate the skin with antioxidants	The balm protects sensitive lip skin from UV rays. Vitamins A, B5, C and E saturate the skin with antioxidants, prevent the aging process, smooth the delicate skin of the lips and make it more elastic. The ingredients included in the balm provide the skin with useful nutrients.	\N	Beeswax, avobenzone, caprylic/caprine triglyceride, glycine of soy sterols, linoleic acid, natural vanilla flavor, ozokerite, PPG-15/SMDI copolymer, retinyl palmitate (vitamin A), castor oil, Jojoba seed oil, squalane, stevia, trihydroxystearin, octinoxate, lauryl pyroglutamic acid, pantenyl triacetate (vitamin B5), phospholipids, tetrahexyldecyl ascorbate (vitamin C), tocopheryl acetate (vitamin E).	To maintain natural hydration, apply to the lips as needed.\nAttention: for external use only.	\N	\N
104	104	moisturizes\ntones\ncleanses\nmattifies\nsoothes	A soft tonic gently cleanses the skin from dirt, soothes and refreshes it. Removes makeup residue. The formula fights the formation of sebum and instantly gives a matte finish. Protects against aggressive environmental factors and enhances natural protection against oxidative stress, increasing the ability of the skin to detoxify. You have never felt such freshness, hydration and purity as after using this tonic.\nIt does not contain parabens, paraffins, formaldehyde, silicones.\nLiquid. Fresh. Not sticky. Leaves a velvety feeling.	Rhodophyte red algae extract — reduces the amount of oxidized squalene on the skin surface, enhancing antioxidant protection. Reduces the amount of sebum and increases the production of lipids by skin cells. Protects the skin from contamination, restoring its barrier functions.\nPlankton extract is an exopolysaccharide produced by marine plankton. It is able to absorb and retain a large amount of sebum, providing a matte effect within 1 hour after application. It is important that the active ingredient does not dry the skin.\nAloe Vera gel — has soothing, moisturizing and antioxidant properties.\nWitch hazel hydrolate — has cleansing properties, tones the skin, soothes, moisturizes.\nVegetable glycerin — forms a protective moist film on the surface of the epidermis, saturates the skin and prevents moisture loss. Returns elasticity, softness and smoothness.	Water, glycerin, aloe Barbadian leaf juice, Jojoba wax esters PEG-120, phenoxyethanol, PPG-26-butet-26, PEG-40 hydrogenated castor oil, caprylyl glycol, ethylhexylglycerin, hexylene glycol, fragrance, witch hazel leaf juice, bicarbonate EDTA, lactic acid, butylene glycol, sodium hydroxide, extract plankton, phenethyl alcohol, potassium sorbate, sodium benzoate, citric acid hydrolyzed extract of red algae.	Moisten a clean cotton pad and apply the tonic to the entire face, avoiding the eye area. The tonic will help gently remove makeup residue.\nThe result: the skin shines, the pores are cleansed, the complexion is healthy, redness and irritation are removed. Now you can apply the cream.	\N	\N
109	109	anti-aging protection\nanti-aging care\ncombats wrinkles\nmoisturizes\ndark circles	Multifunctional cream for delicate skin around the eyes based on real "gifts of the sea" not only provides round-the-clock hydration, but also fights signs of aging. It provides prevention of the first wrinkles, fights loss of elasticity, tightens the skin, helps to eliminate puffiness and dark circles under the eyes and prevents moisture loss. Light, fresh texture, quickly absorbed. It is based on a biotechnological extract of marine microorganisms, which provides complete care for the area around the eyes.\nIt does not contain parabens, paraffins, formaldehyde, dyes, silicones, ethyl alcohol.\nLight and silky. Visually refreshing and quickly absorbed.	Xylitol — "wood sugar". Moisturizes and whitens, prevents dryness.\nSunscreen filters — day protection, prevent photoaging.\nE. crustaceum extract — (crustacean) is rich in bioavailable polyphenols. Provides complete care for the eye area. Increases the synthesis of collagen and elastin. Reduces the formation of glycation end products, providing the skin with a youthful appearance. Relieves puffiness. Combats traces of fatigue, improving microcirculation and strengthening the intercellular matrix.\nWakame extract is an extract of algae. Enriched with polysaccharides and vitamins. It has moisturizing, soothing and conditioning properties.	Water, ethylhexyl methoxycinnamate, butylene glycol, butyl methoxydibenzoylmethane, octocrylene, sodium polyacrylate, hexyldecyl laurate, hexyldecanol, polymethyl methacrylate, benzyl alcohol, glyceryl stearate, polyglyceryl-3 esters of candelilla/jojoba/rice bran, xylitol, cetearet-12, red powder algae, cetearyl alcohol, caprylyl glycol, potassium cetyl phosphate, sodium stearoyl lactylate, fragrance, sodium hydroxide, ethylhexylglycerin, glycerin, disodium EDTA, limonene, linalool, hexyl cinnamal, BHT, plankton extract, citronellol, geraniol, citral, undaria pinnata extract, tocopherol, sodium benzoate, potassium sorbate.	Apply along the contour of the eyes, including the upper eyelid with soft stroking circular movements. For daily use in the morning and evening.\nResult:. a radiant look without bags and dark circles, moisturized smooth skin.	\N	\N
105	105	protection from photoaging\nanti-aging care\nprevention of sagging of the frame\ntightens the oval of the face\nbrightens\nmoisturizes\ntones\nprotection from pollution	A powerful cream based on advanced anti-aging components is able to saturate even the deepest layers of the epidermis with moisture. With regular use, it brightens the skin of the face, moisturizes and restores, thanks to active ingredients and a peptide complex that controls sagging skin. Enriched with glycerin and trehalose for intensive hydration, stabilized vitamin C, which makes the skin more dense and homogeneous. The formula is also based on the innovative complex "gravity control", which fights sagging skin and improves resistance to gravity, and the active component of pink pepper for daily detoxification.\nAdvantages: it does not contain parabens, paraffins, formaldehyde, dyes, silicones, ethyl alcohol.\nSoft. Silk. Quickly absorbed. Easy to apply.	Sunscreen filters — day protection from UV rays, slow down photoaging.\nA complex of peptides is a complex of peptides. Fights sagging skin and improves its resistance to gravity. It stimulates the synthesis of elastin, supports the effectiveness of the architecture of elastic fibers and provides a significant lifting effect.\nPeruvian Pink Pepper extract is a natural bio—functional ingredient that is obtained from Peruvian pink pepper (Schinusmolle). It is rich in powerful bioavailable polyphenols quercitin and michelianin. Restores barrier functions and helps to reduce skin permeability. It has a rejuvenating effect, reducing wrinkles and giving the skin freshness. It has a cleansing effect: reduces sebum production, reduces the appearance of pores, moisturizes.\nShea butter — softens, moisturizes, restores the barrier functions of the skin. Fights wrinkles, improves skin elasticity and turgor. It is rich in vitamin E — a well-known antioxidant, the vitamin of youth.\nPomegranate seed oil is a favorite ingredient of aging skin. It nourishes, moisturizes, and has antioxidant properties.\nCherry seed oil is a real elixir for age—related skin. An antioxidant. Protection against photoaging. Moisturizes. Calms me down.\nStabilized vitamin C — promotes the production of collagen. Protects DNA from exogenous stress. Reduces melanogenesis by smoothing and brightening the skin.\nTrehalose is a natural moisturizing component with high hygroscopicity. Maintains an optimal degree of epidermal moisture.\nVegetable glycerin — forms a protective moist film on the surface of the epidermis, saturates the skin and prevents moisture loss. Returns elasticity, softness and smoothness.	Water, Ethylhexyl methoxycinnamate, glycerin, dicaprilyl carbonate, Butylene glycol, Caprylic/caprine triglyceride, Dicaprilyl ether, Cetyl alcohol, glyceryl stearate, butyl methoxybenzoylmethane, Octocrylene, propanediol, Carite oil, Polymethyl methacrylate, Pomegranate seed oil, Benzyl alcohol, PEG-75 stearate, Sodium polyacrylate, trehalose, cherry seed oil, white wax, stearet-20, cetet-20, ethylhexylglycerin, sorbitan laurate, ethyl ascorbic acid, disodium edta, lactic acid, hydroxyethyl cellulose, sodium hydroxide, cetyl ether acetyl dipeptide-1, BHT, extract of Peruvian pepper, tocopherol.	Apply to cleansed facial skin in the morning or afternoon with light patting movements along massage lines.\nThe result: velvety, taut, saturated with moisture skin, reliably protected from the harmful effects of sunlight. Significant reduction of wrinkles and strengthening of the oval of the face.	\N	\N
106	106	moisturizing\nanti-aging care\nanti-wrinkle\ntightening and strengthening of the skeleton\nantioxidant properties\nbrightens and seals the skin	A rich, soft night cream created specifically to take care of the skin during sleep, when cells are best restored. Purposefully fights wrinkles, making them visually less noticeable due to the fact that it seals and polishes them. Instantly affects dull and tired skin. Contains ingredients with high anti-aging activity that restore skin tone and strengthen tissues. Waking up every morning, you will be pleasantly surprised: the skin is rested, a visible lifting effect that will last for many hours.\nIt does not contain parabens, paraffins, formaldehyde, dyes, silicones, ethyl alcohol.\nDeep. Bushy. Not fat. Easy to apply.	Hyaluronic acid — due to its ability to bind and retain water, it acts as a direct humidifier, bringing moisture into the stratum corneum, and as an indirect humidifier, forming a film that prevents evaporation. The skin looks hydrated and retains moisture for a long time.\nShea butter and sunflower seed oil — mature skin loves ingredients rich in vitamins E, D3, A, F and K. Oils promote cell regeneration, are rich in polyunsaturated fats. Suitable for dry skin, perfectly moisturize.\nVitamin E is a vitamin of youth, a powerful antioxidant. Smoothes, soothes, keeps the skin hydrated.\nBarley seed extract is rich in polyphenol derivatives and has antioxidant properties. Anti-aging component, prevents the appearance of wrinkles. Improves microcirculation, nourishes the skin.\nVegetable glycerin — forms a protective moist film on the surface of the epidermis, saturates the skin and prevents moisture loss. Returns elasticity, softness and smoothness.	Water, isonyl isononanoate, cetearyl alcohol, octyldodecyl myristate, cetyl alcohol, Shea butter, glycerin, sunflower seed oil, Cetearyl glucoside, ammonium acryloyldimethyltaurate/VP copolymer, Phenoxyethanol, propylene glycol, Fragrance, Propanediol, xanthan gum, decylene glycol, Tocopheryl acetate, seed extract common barley, isopropyl myristate, sodium hyaluronate.	Apply to the previously cleansed skin of the face and neck in the evening before going to bed with light movements along massage lines.\nThe result: the contour of the face is restored, wrinkles are smoothed, the skin becomes elastic, soft, the complexion is healthy.	\N	\N
107	107	anti-aging protection\nanti-aging care\nanti-wrinkle\nlightening effect\nfights dark circles and bags under the eyes\nmoisturizes	Eye cream works in several ways: prevents moisture loss, restores and helps maintain a healthy balance of the delicate skin around the eyes, protects against the harmful effects of ultraviolet rays and environmental pollutants, stimulates collagen production, reducing facial and deep wrinkles, and also fights swelling and dark circles. It is based on a biotechnological extract of marine microorganisms, which provides complete care for the area around the eyes. The key to your beautiful appearance is your look. Xylitol, one of the innovative supplements of the formula, helps to lighten the area of the eye area, which visually refreshes the face.\nIt does not contain parabens, paraffins, formaldehyde, dyes, silicones, ethyl alcohol.\nLight and silky. Refreshes and absorbs quickly.	Xylitol — "wood sugar". Moisturizes and whitens, prevents dryness.\nSunscreen filters — day protection of the skin, prevent photoaging.\nE. crustaceum extract — (crustacean) is rich in bioavailable polyphenols. Provides complete care for the eye area. Increases the synthesis of collagen and elastin. Reduces the formation of glycation end products, providing the skin with a youthful appearance. Relieves puffiness. Combats traces of fatigue, improving microcirculation and strengthening the intercellular matrix.\nLotus extract is a symbol of beauty of Oriental women. Soothes and refreshes the skin, has a whitening effect.\nRice starch is suitable for sensitive skin, gives the skin a matte and even color.	Water, ethylhexyl methoxycinnamate, butylene glycol, butyl methoxydibenzoylmethane, octocrylene, sodium polyacrylate, hexyldecanol, rice starch, hexyldecillaurate, polymethyl methacrylate, benzyl alcohol, glyceryl stearate, polyglyceryl-3 esters of candelilla/jojoba/rice bran, carrageenan powder, cetearet-12 , xylitol, cetearyl alcohol, caprylyl glycol, potassium cetyl phosphate, sodium stearoyl lactylate, fragrance, sodium hydroxide, ethylhexylglycerin, disodium EDTA, BHT, plankton extract, tocopherol, lactic acid, sodium benzoate, lotus flower extract, potassium sorbate, maltodextrin.	Apply along the contour of the eyes, including the upper eyelid with soft stroking circular movements. For daily use in the morning and evening.\nThe result: a radiant look, smooth, moisturized skin, reduction of wrinkles.	\N	\N
108	108	long-term moisturizing\nuniversal care and age prevention\nsun protection\nrefreshes\nrestores\nbrightens	The light, non-greasy texture leaves the skin hydrated for a long time. The cream contains SPF15 filters, which will help protect the skin from photoaging and oxidative stress. The cream is enriched with the active complex Mega Moisturizer Active based on amino acids (proline, alanine, serine) and Pseudoalteromonas Ferment extract, which minimizes the evaporation of water from deeper layers of the epidermis and regenerates the skin. Provides palpable hydration for 48 hours and excellent universal care. The active ingredient obtained from pink pepper acts as a cleansing component.\nIt does not contain parabens, paraffins, formaldehyde, dyes, silicones, ethyl alcohol.\nLuxurious creamy texture. It is easy to apply and quickly absorbed, leaving no greasy shine.	Hyaluronic acid — promotes the formation of new cells, effectively moisturizes and restores skin tone. Due to its excellent ability to bind and retain water, it acts as an excellent moisturizing component: it delivers water to the stratum corneum, forms a film that prevents evaporation. The skin looks hydrated and stays that way for a long time.\nSunscreen filters — day protection, prevent photoaging.\nIllipe oil — has excellent nutritional properties. Rich in fatty acids. Improves skin elasticity.\nRice starch is suitable for sensitive skin, gives the skin a matte and even color.\nMega Moisturizer Active — it includes 2 innovative complexes of directional action. The complex based on the amino acids proline, alanine, serine and Pseudoalteromonas bacterium extract has an instant and long-lasting moisturizing effect. And the IQ-hydration complex forms a "smart" double fat layer on the skin surface, enhancing natural barrier properties, providing up to 48 hours of noticeable hydration and adapting the skin to environmental conditions.\nPeruvian Pink Pepper extract is a natural bio—functional ingredient that is obtained from Peruvian pink pepper (Schinus molle). It is rich in powerful bioavailable polyphenols quercitin and michelianin. Restores barrier functions and helps to reduce skin permeability. It has a rejuvenating effect, reducing wrinkles and giving the skin freshness. It has a cleansing effect: reduces sebum production, reduces the appearance of pores, moisturizes.	Water, ethylhexyl methoxycinnamate, butyl methoxydibenzoylmethane, octocrylene, glycerin, ilip seed oil, benzyl alcohol, cetyl alcohol, potassium cetyl phosphate, cetyl stearate, carbomer, cetearyl alcohol, cetearet-12, rice starch, isopentyldiol, polymethyl methacrylate, stearet-2, propanediol, caprylyl glycol, isostearyl isostearate, ethylhexylglycerin, fragrance, sodium hydroxide, Pseudoalteromonas bacterium enzyme extract, xanthan gum, disodium EDTA, limonene, linalool, hexyl cinnamal, sodium hyaluronate, stearic acid, BHT, proline, alanine, serine, sodium phosphate, citronellol, geraniol, citral, Peruvian pepper extract, tocopherol, citric acid.	Apply to cleansed face skin. Suitable for daily use in the morning and evening.\nThe result: smooth, elastic, well-hydrated and radiant with health skin. Surprisingly long and lasting hydration effect.	\N	\N
131	131	Made of California cedar\nDoes not contain mineral oils\nA soft shade for natural makeup	Our permanent hit is luxury eyebrow pencils. Improved formula: the new powdery luxury texture provides even softer application and perfect shading.\nSoft shades for natural eyebrow makeup. The pencil is made of California cedar, a high-quality wood that allows you to retain the properties of the product and does not absorb moisture.\nThe formula is resistant to high temperatures and mechanical influences, does not contain mineral oils. Tested and approved by dermatologists.	\N	\N	Eyebrows are a very important element in makeup, sometimes incorrectly designed eyebrows can spoil the overall impression. Brow pencils Bremani will help to cope with the situation.\nThe right accent on the eyebrows will give women at the age of a younger appearance and emphasize the natural beauty of a young girl.\nWomen with fair skin and hair should use a shade darker than the color of the hairs in the eyebrows. Older ladies can have their eyebrows drawn a little brighter, this will help to create a more elegant and light effect.	\N	\N
110	110	instant visual effect\nmoisturizes and makes the skin radiant\nrestores\nbrightens\nantioxidant and anti-aging protection\nfights traces of fatigue	The Cinderella Effect mask will instantly breathe vitality into the skin and make it shine! Signs of aging are "erased", and the face looks rested. The complexion regains its radiance. The mask is based on the extract of the leaves of Gaberlea Rhodope, which ensures the uniformity of the skin. The composition includes squalane of vegetable origin, known for its emollient properties, it is especially suitable for sensitive and dry skin. The mask is an excellent source of energy for a radical fight against dullness and dehydration will give the skin a real pleasure.\nAdvantages: it does not contain parabens, paraffins, formaldehyde, dyes, silicones, ethyl alcohol.\nSoft and delicate, like sorbet. Rich. Silk.	Shea butter is an emollient. Moisturizes, regenerates the skin barrier. Suitable for fighting wrinkles. Improves skin elasticity. It is rich in the "vitamin of youth" - vitamin E.\nSqualane is a "skin protector", regenerates the lipid film on the skin surface, actively moisturizes. Rejuvenating oil, oil without oil, vitamin oxygen – all this is said about squalane.\nRice oil is suitable for dry and mature skin. Moisturizes, deeply nourishes, whitens, smoothes.\nPomegranate seed oil is an ingredient for mature skin. It has antioxidant properties, nourishes and moisturizes.\nRice starch is suitable for sensitive skin. It has nourishing and whitening effects.\nThe extract of the leaves of Gaberlea Rhodope is rich in antioxidants. Stimulates the production of collagen and elastin. Protects skin proteins from oxidation. Brightens and tones the skin, gives it radiance.\nVegetable glycerin — forms a protective moist film on the surface of the epidermis, saturates the skin and prevents moisture loss. Returns elasticity, softness and smoothness.	Water, carite oil, isopentyldiol, glycerin, benzyl alcohol, Hydroxyethyl acrylate/Sodium acryloyldimethyl taurate copolymer, Squalane, PEG-100 stearate, Glyceryl stearate, Rice starch, Pomegranate seed oil, rice bran oil, caprylyl glycol, ethylhexylglycerin, fragrance, polysorbate 60, lactic acid, sorbitan isostearate, sodium hydroxide, extract of leaves of haberlea rhodope, dehydracetic acid, tocopherol.	Apply to the face and neck. Leave on for 10-15 minutes until completely absorbed. If necessary, remove the residue with a dry cloth or towel. Do not rinse. Apply 1-2 times a week instead of a day cream or before it (the skin itself will tell you if it needs additional hydration) in the morning when you want to look great.\nThe result: radiant health, transformed, smooth, elastic skin. Instant effect.	\N	\N
111	111	for normal and oily hair\nit preserves the pH balance of the scalp\ncleanses\nfights dandruff\nconditions	A mild formula for daily use. Suitable for men and women. Normalizes the balance of the scalp. Gives shine and a healthy look to dull hair, making it soft.	Zinc Gluconate — gently narrows pores and regulates sebum production. It has a powerful anti-aging effect, renewing the collagen matrix. Zinc has immunomodulatory, antiseptic properties, protects the structure of the hair and makes it soft. It is a cofactor of enzymes involved in the synthesis of nucleic acids and protein.\nArginine is an amino acid that stimulates the growth of capillaries.\nPanthenol is a precursor of pantothenic acid (vitamin B5). Due to its ability to retain moisture, panthenol has a beneficial effect on damaged and dry hair.\nVitamin E is an antioxidant. Increases oxygen absorption, improves blood circulation in the scalp. Promotes hair growth. Prevents loss of color and shine. Supports overall hair health.\nPolyquaternium is a 7—cationic polymer. Conditioner (improves hair combing), gives hair softness, silkiness, shine. Suppresses the ability of the hair to absorb moisture, so they hold the shape more easily.	Water, Sodium laureth sulfate, cocamidopropyl betaine, Sodium chloride, decyl glucoside, sodium benzoate, fragrance, phenoxyethanol, lactic acid, zinc gluconate, ethylhexylglycerin, disodium EDTA, PEG-150 pentaerythryl tetrastearate, Guar hydroxypropyltrimonium chloride, polysorbate 20, Tocopheryl acetate, arginine, linalool, polyquaternium-7, panthenol, limonene, PEG-6 caprylic/caprine glycerides, citric acid.\nDoes not contain: mineral oils, parabens, formaldehyde, denatured alcohol.	Apply a small amount of shampoo with gentle massaging movements to the scalp and hair. Rinse thoroughly with warm water.	\N	\N
112	112	for normal and oily hair\nit preserves the pH balance of the scalp\nfights greasiness\ngives energy\nand gives smoothness	A mild formula for daily use. Suitable for men and women. Gives shine and a healthy look to dull hair, making it soft. To achieve maximum effect, use together with shampoo from the same series.	Hydrolyzed keratin is a protein composed of amino acids, vitamins and trace elements. Cellular bridges are built from it, which provide strength to the hair. Aggressive hair dyes, styling tongs and other stressful effects lead to a decrease in the content of keratin and the destruction of its structure. Hydrolyzed keratin is similar to natural keratin, replaces it well, forms a protective film. It is especially effective in the care of damaged hair.\nGlycerin — maintains hydration for a long time, prevents water evaporation.\nVitamin E is an antioxidant. Increases oxygen absorption, improves blood circulation in the scalp. Promotes hair growth. Prevents loss of color and shine. Supports overall hair health.\nZinc Gluconate — gently narrows pores and regulates sebum production. It has a powerful anti-aging effect, renewing the collagen matrix. Zinc has immunomodulatory, antiseptic properties, protects the structure of the hair and makes it soft. It is a cofactor of enzymes involved in the synthesis of nucleic acids and protein.\nPanthenol is a precursor of pantothenic acid (vitamin B5). Due to its ability to retain moisture, panthenol has a beneficial effect on damaged and dry hair.\nAmodimethicone is silicone. Creates a film on the surface of the hair, protecting it from contamination and aggressive environmental influences. Gives hair shine and a healthy appearance, provides thermal protection.\nPolyquaternium is a 7—cationic polymer. Conditioner (improves hair combing), gives hair softness, silkiness, shine. Suppresses the ability of the hair to absorb moisture, so they hold the shape more easily.	Water, cetearyl alcohol, glycerin, cetriltrimethylammonium chloride, phenoxyethanol, fragrance, propylene glycol, amodimethicone, decylene glycol, zinc gluconate, lactic acid, tocopheryl acetate, linalool, polyquaternium-7, panthenol, limonene, hydrolyzed keratin, tridecet-10, sodium benzoate, citric acid, potassium sorbate.\nDoes not contain: mineral oils, parabens, formaldehyde, denatured alcohol.	Apply to wet hair with massage movements along the entire length, starting from the tips. Leave on for 2-3 minutes, rinse thoroughly with water. As a care and prevention, 1 time a week can be used as a mask. Apply to wet hair from the roots. Leave for 3 minutes. Rinse thoroughly.	\N	\N
113	113	for normal and damaged hair\nit gently cleanses\nrestores density and strength to the hair\ngives radiance and a well-groomed appearance	Radiant, soft hair from the first application. Suitable for men and women. A thick, rich shampoo with an exclusive complex, keratin and panthenol. It has moisturizing and firming effects, gives the hair a radiant and well-groomed appearance.	Panthenol is a precursor of pantothenic acid (vitamin B5). Due to its ability to retain moisture, panthenol has a beneficial effect on damaged and dry hair.\nVegetable keratin is approved according to COSMOS European standard of natural and organic cosmetics. It consists of peptides with a low molecular weight, derived from soy proteins and capable of penetrating deep into the hair. Helps to restore the damaged surface of the hair and its structure, returning them to a healthy appearance, strength.\nAmaranth leaf extract is rich in antioxidants. Helps to repair the damage caused to the hair during the oxidative process, restores the natural shine, softness, moisture level, provides the hair with a healthy appearance.\nIlluminating Active is a moisturizing and regenerating substance that gives radiance to any type of hair. Biotechnological compound of natural sugars obtained from wood and brown algae. Restores the cuticle of damaged hair, returning it to its natural radiance, softness and hydration. The hair regains its healthy appearance. Visible result after the first application.\nCationic conditioning particles are positively charged polymer particles similar in structure to hair cells. They have a pronounced restoring effect on the most damaged areas.	Water, Sodium laureth sulfate, cocamidopropyl betaine, sodium chloride, fragrance, Decyl glucoside, sodium benzoate, phenoxyethanol, Xylityl glucoside, sodium methyl Cocoyl taurate, PEG-80 hydrogenated glyceryl palmate, anhydroxylitol, maltitol, lactic acid, glycol distearate, Ethylhexylglycerin, Styrene/acrylate copolymer, Xylitol , lauret-4, polysorbate 20, guar hydroxypropyltrimonium chloride, benzophenone-4, polyquaternium-7, panthenol, hydrolyzed vegetable protein, propanediol, glycerin, grooved pelvetia extract, citric acid, sorrowful amaranth leaf extract, CI 17200.\nDoes not contain: mineral oils, parabens, formaldehyde, denatured alcohol.	Apply a small amount of shampoo with gentle massaging movements to the scalp and hair. Rinse thoroughly with warm water.	\N	\N
114	114	for normal and damaged hair\nit seals\nnourishes\nmoisturizes\nrestores natural shine\ngives smoothness	Suitable for daily use, for men and women. Translucent cream gel with a light texture and a delicate fruity-floral aroma. Seals the hair shaft, restores its surface, making the hair soft, pleasantly silky.	Cationic conditioning particles are positively charged polymer particles similar in structure to hair cells. They have a pronounced restoring effect on the most damaged areas.\nPanthenol is a precursor of pantothenic acid (vitamin B5). Due to its ability to retain moisture, panthenol has a beneficial effect on damaged and dry hair\nAmaranth leaf extract is rich in antioxidants. Helps to repair the damage caused to the hair during the oxidative process, restores the natural shine, softness, moisture level, provides the hair with a healthy appearance.\nIlluminating Active is a moisturizing and regenerating substance that gives radiance to any type of hair. Biotechnological compound of natural sugars obtained from wood and brown algae. Restores the cuticle of damaged hair, returning it to its natural radiance, softness and hydration. The hair regains its healthy appearance. Visible result after the first application.\nCoconut oil — has a structure similar to hair proteins. Penetrates into the hair shaft. Nourishes, moisturizes, softens.	Water, cetearyl alcohol, hydroxypropyl methylcellulose, stearamidoprpyl dimethylamine, coconut oil, phenoxyethanol, begentrimonium chloride, glycerin, fragrance, lactic acid, xylityl glucoside, dipropylene glycol, anhydroxylitol, caprylyl glycol, maltitol, panthenol, xyditol, hydrolyzed vegetable protein, ethidronic acid, propanediol, sodium benzoate, ethylhexylglycerin, grooved pelvetium extract, amaranth sad leaf extract, C117200, citric acid.\nDoes not contain: mineral oils, parabens, formaldehyde, denatured alcohol.	Apply to wet hair with massage movements along the entire length, starting from the tips. Leave on for 2-3 minutes, rinse thoroughly with water.	\N	\N
132	132	Made of California cedar\nDoes not contain mineral oils\nA soft shade for natural makeup	Our permanent hit is luxury eyebrow pencils. Improved formula: the new powdery luxury texture provides even softer application and perfect shading.\nSoft shades for natural eyebrow makeup. The pencil is made of California cedar, a high-quality wood that allows you to retain the properties of the product and does not absorb moisture.\nThe formula is resistant to high temperatures and mechanical influences, does not contain mineral oils. Tested and approved by dermatologists.	\N	\N	Eyebrows are a very important element in makeup, sometimes incorrectly designed eyebrows can spoil the overall impression. Brow pencils Bremani will help to cope with the situation.\nThe right accent on the eyebrows will give women at the age of a younger appearance and emphasize the natural beauty of a young girl.\nWomen with fair skin and hair should use a shade darker than the color of the hairs in the eyebrows. Older ladies can have their eyebrows drawn a little brighter, this will help to create a more elegant and light effect.	\N	\N
115	115	aromatherapy for relaxation\ngentle cleansing	Taking a shower with this gel every day, you gently cleanse the skin, leaving on it a charming aroma of sensual fragrance, sweet with a light citrus note. Enjoy this ritual and keep the scent of magnolia on your skin.	Magnolia extract — obtained from flowers and buds, reduces puffiness and has a relaxing effect. It is effectively used in the care of sensitive skin.\nGlycerin — forms a moist film on the surface of the epidermis. Restores elasticity, softness and smoothness to the skin.\nCocamidopropyl betaine is a mixture of surfactants with a low irritation index. Reduces the irritating effect of SLES. Suitable for sensitive skin.	Water, Sodium laureth sulfate, sodium chloride, cocamidopropite betaine, fragrance, sodium benzotriazolyl butylphenol sulfonate, Citric acid, disodium EDTA, Geraniol, butylphenyl methylpropional, Citronellol, magnesium nitrate, glycerin, butylene glycol, methyl chloroisothiazolinone, Methylisothiazolinone, extract of magnolia buds/flowers biondi , magnesium chloride, C117200, C119140.\nDo not contain: SLS, denatured alcohol, parabens, formaldehyde.	Apply to wet skin, massage, rinse with water.	\N	\N
116	116	aromatherapy for relaxation\nleaves the skin velvety\nperfectly softens	At the heart of the formula is magnolia extract, which is effectively used in the care of sensitive skin and reduces puffiness, has a relaxing effect. The luxurious and delicate aroma of magnolia with light citrus notes is created specifically for relaxation. Result: velvety, well-groomed skin.	Magnolia extract — obtained from flowers and buds, reduces puffiness and has a relaxing effect. It is effectively used in the care of sensitive skin.\nGlycerin — forms a moist film on the surface of the epidermis. Restores elasticity, softness and smoothness to the skin.	Water, ethylhexyl palmitate, fragrance, cetearet-3, glyceryl stearate, cetearyl alcohol, glycerin, phenixiethanol, cetyl alcohol, dimethicone, cetearet-20, benzyl alcohol, carbomer, ethylhexylglycerin, triethanolamine, sodium lauryl sulfate, geraniol, butylphenyl methylpropional, disodium EDTA, citronellol, citral, isoevgenol, butylene glycol, extract of buds/flowers of magnolia biondi.\nDoes not contain: parabens, petroleum products, silicones, denatured alcohol, formaldehyde-containing substances, PEG.	Apply to the skin after a shower, or at any time, as often as necessary. Rub with gentle massage movements.	\N	\N
117	117	gives firmness and elasticity\nreduces inflammation\nevens out tone\nmoisturizes\nprotects against oxidative stress\ninhibits premature aging	Youth activator, responsible for intensive nutrition and hydration, improves skin turgor, inhibits inflammatory reactions, relieves redness. The fluid serum is easy to apply, instantly absorbed, leaving a feeling of freshness. Suitable for all skin types, for daily use in the morning and evening. It contains 95% natural ingredients.\nIt does not contain parabens, silicones, mineral oils, ethyl alcohol.	NUTriVITA complex is based on chestnut peel concentrate (Castanea Sativa). It is rich in polyphenols. Antioxidant, strengthens blood vessels, reduces inflammation, suppresses the production of collagenase (an enzyme that destroys collagen), improves skin density, stimulates blood circulation.\nAhnfeltiopsis Concinna red algae gel — works as a "second skin": forms a protective film on the surface that protects against moisture loss. Softens.\nRice bran oil — oleic and linoleic acids in the composition of the oil soften and moisturize the skin. Palmitic acid and vitamin E prevent aging. And gamma-oryzanol protects the skin from free radicals.\nShea butter (karite) is obtained from the seeds of the African plant Vitellaria paradoxa. An antioxidant. Softens, moisturizes and nourishes the skin.\nNatural softening complex is an innovative herbal alternative to silicones. It has a high penetrating ability, gives silky skin, moisturizes. It is this complex that makes the serum formula effective, increasing the penetration of other active components.\nBlend of polyglycerides (oleic, linoleic and linolenic acids) from plant sources — approved by Ecocert. Provides a lifting effect. It is able to absorb water up to 200% of its own weight, thanks to which it actively moisturizes the skin and fills in wrinkles.	Water, cetearyl alcohol, glycerin, polyacrylate crosspolymer-6, cetearet-20, hexylene glycol, hydroxyacetophenone, caryl glycol, shea butter, caprylic/caprine/amber triglyceride, dicaprilyl carbonate, oleic/linoleic/linolenic polyglycerides, fragrance, brown algae extract / Ahnfeltiopsis conccina, rice bran oil / Oryza sativa, disodium EDTA, phenoxyethanol, sodium hydroxide, chlorphenesine, propylene glycol, sodium dehydroacetate, chestnut seed extract (Castanea sativa), tocopherol.	Apply a few drops of serum with gentle movements to the clean skin of the face and neck. Use before moisturizer.\nTry a beauty ritual before going to bed:\n\tapply a drop of the product on the pad of each finger of one hand;\n\tconnect the fingers of both hands;\n\tmassage the serum over the face and neck. Start from the center and move to the edges.	\N	\N
118	118	cleanses\nremoves makeup residues\nmoisturizes\nnarrows pores\nsoftens\nprovides a biological balance of the skin	Micellar gel for washing works like a magnet, pulling out and washing away makeup residues, excess sebum and other impurities. Gently cleanses the skin, leaving a pleasant feeling of softness and hydration. Enriched with extracts of magnolia and peony.\nDoes not contain: SLES, SLS, parabens, formaldehyde-containing substances, ethyl alcohol, silicones, mineral oils.\nCertificates: ISO, GMP, ECO. 89% natural ingredients.	Complex "Blooming skin", which includes 3 components:\n1. Peony extract — has a soothing effect, antioxidant, narrows pores, suitable for sensitive skin. Moon flower or divine flower — this is how ancient myths describe its origin. Peony, a rose without thorns, is considered one of the most effective floral components in skin care. It is said that women who use it become radiant, like this wonderful flower.\n2. Magnolia extract — skin protection, anti-inflammatory property, prevention of stress from UV radiation, suitable for sensitive skin. The age of the oldest magnolia fossils found is 100 million years old. This flower is a symbol of perfection, purity and beauty.\n3. "Healthy skin" is a cocktail of components that are useful for the skin.\nNatural prebiotic from chicory root — restores the balance and barrier properties of the skin microbiota by stimulating microorganisms living on the surface of the skin.\nBetaine is a natural osmolite from sugar beet. Protects cells from environmental stress and from dehydration. Moisturizes and protects the skin.\nDiglycerin is a natural moisturizer. It retains water well, therefore it helps to reduce transepidermal moisture loss (TEWL).\nVitamin PP (B3) — has a calming effect, moisturizes, brightens.\nChinese camellia leaf extract is a powerful antioxidant.\nXylitol — moisturizes.\nA blend of extra-soft surfactants	water, glycerin, diglycerin, acrylates / palmet-25 acrylate copolymer, sodium lauroyl glutamate, polysorbate 20, cocamidopropylbetaine, caprylyl glycol, xylitol, fragrance, sodium hydroxide, ethylhexylglycerin, propylene glycol, capril hydroxamic acid, niacinamide (vitamin B3), betaine, hydroxypropyl guar, inulin, alpha-glucan oligosaccharide, butylene glycol, extract of magnolia flowers and buds (Magnolia biondii), peony flower extract (Paeonia officinalis), potassium sorbate, sodium benzoate, Chinese camellia leaf extract (Camellia sinensis).	Take a little of the product in the palm of your hand and massage it into the skin of your face, mixing it with warm water. Rinse your face well and blot it with a towel.	\N	\N
119	119	cleanses the skin and hair\nmoisturizes\ncares\nconditions	It is important for every mother to choose the perfect remedy that gently and safely cleanses children's skin. The gel is specially designed for gentle cleansing of the baby's skin and hair. Does not cause irritation. The delicate formula contains soft surfactants and natural ingredients that are suitable even for sensitive baby skin. Based on chamomile and calendula flower water.\nDoes not contain: parabens, ethyl alcohol and ethanol, gluten, petrochemicals, mineral oils, silicones, lanolin, phthalates, irritating emulsifiers, synthetic flavors, ethoxylated ingredients, methylisothiazolinone, EDTA, dyes, urea, DEA, TEA or PEG, sulfates.\nCertificates: ISO, GMP, ECO. 98% natural ingredients.	Calendula water is an extract of calendula flowers and has a calming effect. Calendula contains alpha and beta caratinoids, which gives the effect of healthy skin.\nChamomile water has a calming and relaxing effect.\nApricot seed oil is an antioxidant, deep nutrition of the skin.\nCherry seed oil is rich in vitamin A, with a high content of antioxidants and oleic acid, the oil has a strong softening effect on the skin.\nThe phyto milk complex is responsible for skin renewal, protects against overdrying, maintains the lipid balance of the skin, moisturizes.	water, sodium lyroyl glutamate, glycerin, disodium cocoamphodiacetate, decylglucoside, roman chamomile flower water/anthemis nobilis, calendula officinalis flower water/calendula officinalis, citric acid, cocamidopropylbetaine, cocoylmethylglucamide, sodium chloride, xanthan gum, sorbitan caprylate, propanediol, propylene glycol, sodium benzoate, sesame seed oil/Sesamum Indicum, benzoin acid, phytic acid, fragrance, apricot seed oil/Prunus armeniaca, sucrose stearate, cherry seed oil/Prunus avium, sorbic acid, black cumin seed oil/Nigella sativa, aloe Barbadensis leaf juice powder, glyceryl caprylate, potassium sorbate, tocopherol, P-anisic acid, sunflower seed oil/Helianthus annuus	Gently apply to the skin and hair, lightly lather, rinse thoroughly with clean water. For external use only.	\N	\N
133	133	Contains reflective particles\nOlive oil\nThe composition is enriched with vitamin E	The most popular shade of powder - "Biscuit" - is now in a new compact package.	\N	\N	\N	\N	\N
134	134	Pearl Powder\nOlive oil\nThe composition is enriched with vitamin E\nReflective particles	A velvety shimmering shade with a satin effect on the skin. Ideal for highlighting cheekbones and giving the skin a glow.\nOur most popular color "Hazelnut" returns in a new compact package.	\N	\N	\N	\N	\N
135	135	it glides perfectly on the surface of the lips\nthe soft creamy texture is easily shaded\nthe case is made of California cedar	The soft, comfortable texture of the "Bremani" pencils is sure to please you. Pencils glide perfectly on the surface of the lips and are easily shaded.\nThe soft creamy texture of the pencil emphasizes the contour of your lips and prevents the spread of lipstick. The formula of this product consists of 90% natural ingredients, caring for your lips. The pencil is made of high-quality California cedar wood, this unique tree allows you to preserve all the unique properties of the product.\nThe formula has passed dermatological control and is recommended for use.	\N	\N	\N	\N	\N
120	120	nourishes\naccelerates regeneration\nmoisturizes\nsmoothes\nespecially suitable for dry skin	The high penetration of nutrients into your skin literally stops time! The cream is saturated with powerful, exclusive anti-aging components. Penetrates deeply into the skin, nourishes, moisturizes and accelerates regeneration processes.	Organic Pomegranate oil is rich in polyphenol, an anti–aging nutrient that fights dryness and restores the skin.\nGatuline® is an anti–aging component from beech buds, increases skin hydration by 30%, instantly softens.\nOrganic royal jelly extract is a powerful anti–aging component that stimulates the production of collagen, soothes the skin, reduces irritation.\nOrganic argan oil – restores the skin, nourishes, moisturizes.\nOrganic aloe vera gel – enhances the protective functions of the skin, moisturizes.\nOrganic shea butter is responsible for skin elasticity, cell renewal and hydrolipidic balance.	Water, caprylic/caprine triglyceride, glycerin, Cetearyl alcohol, Shea butter oil or extract (Butyrospermum Parkii), sunflower seed oil (Helianthus annuus), Dicaprilyl ether, Argan seed oil (Argania spinosa), Glyceryl stearate, fragrance, sodium stearoyl glutamate, Cetearyl glucoside, European beech bud extract (Fagus sylvatica), sodium benzoate, glyceryl caprylate, sorbitan caprylate, lauryl lysine, propanediol, xanthan gum, benzoic acid, Aloe Barbadensis leaf juice powder, Benzyl alcohol, citric acid, Royal jelly Extract, sodium hydroxide, pomegranate seed oil (Punica granatum), potassium sorbate, tocopherol, soybean oil, linalool, citronellol.	Apply to cleansed facial skin in the morning or afternoon with light patting movements along massage lines.	\N	\N
121	121	the high content of hyaluronic acid\nfills wrinkles\nwhitens\nprotects against pigmentation\nmakes the skin moisturized\nreturns a healthy complexion\nstrengthens the skin	A few drops of precious serum is all you need to switch to active hydration! Thanks to the hyaluronic acid complex, the product effectively restores balance, fills and revitalizes even the most dehydrated skin. Fights the signs of aging: fills in wrinkles, strengthens the epidermis. The skin instantly becomes moisturized and visually smooth.	Hyaluronic acid – intensively moisturizes the skin, protects, softens.\nEpidermosil ® - stimulates its own production of hyaluronic acid, renews the epidermis, participates in the process of moisture production.\nOrganic Lime Extract – contains vitamin C, brightens and evens skin tone.\nSorbitol is a natural sugar that prevents moisture loss.\nBiowhite (Exclusive Complex) is an exclusive complex based on white mulberry, saxifrage and grapes; prevents pigmentation, a rich source of antioxidants.\nAquaxyI TM – prevents dehydration of the skin, regulates the water balance. Promotes the production of hyaluronic acid in the epidermis.\nComplex of vitamins A, E and F – protects cells from aging, nourishes, enhances cell renewal.\nPanthenol (provitamin B5) is a regenerating, moisturizing active ingredient.\nVitamin C is an antioxidant involved in the production of collagen.	Water, Glycerin, Xylityl glucoside, Anhydroxylitol, Phenoxyethanol, Xylitol, Carbomer, Chlorphenesine, Sodium Polyacrylate, Propylene Glycol, Panthenol, Fragrance, Butylene Glycol, Hydrogenated Starch Hydrolysate (Sorbitol), Sodium Hydroxide, Glucose, Grape Extract (Vitis Vinifera), Lime Extract (Citrus Aurantifolia), Acrylates/C10 -30 alkyl acrylate crosspolymer, ascorbyl glucoside, disodium EDTA, isopropyl myristate, sodium sulfite, sodium metabisulfite, soybean oil (Glycine soja), mulberry root extract (Morus alba), Baikal skullcap root extract (Scutellaria baicalensis), silanetriol, Saxifraga sarmentosa extract, sodium hyaluronate, hyaluronic acid, sorbic acid, citric acid, potassium sorbate, sodium benzoate, linolenic acid, safflower dye seed oil (Carthamus tinctorius), tocopheryl acetate, retinyl palmitate, PEG-8, ascorbic acid, ascorbyl palmitate, tocopherol, geraniol, citronellol, limonene, benzyl salicylate, linalool, benzyl benzoate.	Apply a few drops of serum with gentle movements to the clean skin of the face and neck.	\N	\N
122	122	Gently and effectively cleanses the skin\nIncreases the protective reaction of the skin\nRestores the structure of the skin\nGives the skin a healthy blooming appearance	Gentle exfoliant cream, its active ingredients gently cleanse the skin. Apricot pits are used as an exfoliant (exfoliating agent), they gently remove dirt from the skin surface and exfoliate dead cells clogging the pores. Apricot kernel oil perfectly nourishes the skin.	Gentle exfoliant cream, its active ingredients gently cleanse the skin. Apricot pits are used as an exfoliant (exfoliating agent), they gently remove dirt from the skin surface and exfoliate dead cells clogging the pores. Apricot kernel oil perfectly nourishes the skin.\nGinseng extract and aloe vera leaf juice promote skin regeneration.\nChamomile extract has a soothing, anti-inflammatory and antiseptic effect.\nThe extract of the root of Echinacea purpurea has an analgesic effect, stimulates tissue granulation, increases the activity of phagocytes (increases the protective function of the skin), accelerates the healing process of wounds.\nGreen tea extract is a powerful antioxidant.	Water, apricot kernel powder, stearic acid, glycerin, cetearyl alcohol, apricot kernel oil, Phenoxyethanol, cellulose gum, fragrance, methylparaben, ethylparaben, butylparaben, isobutylparaben, propylparaben, green tea leaf extract, Chamomile flower extract, Echinacea purpurea root extract, root extract ginseng, aloe barbadian leaf juice.	Apply the scrub to slightly damp skin and massage it for a few minutes with gentle circular movements. Wash off the scrub with warm water. A mixture of natural plant extracts has a beneficial effect on the condition of the skin, has a healing effect, making it clean and smooth.\nPrecautions: for dry skin, use the scrub no more than once every two to three weeks, for oily skin – once a week. Do not use on the skin of the face in the area around the eyes. It is not recommended to use the scrub for irritated and injured skin.	\N	\N
123	123	Moisturizes, nourishes and has a conditioning effect on the skin\nSoftens and soothes sensitive skin\nVitamins C and A fight the harmful effects of free radicals\nProtects the skin from the negative effects of the environment and protects against frostbite\nReduces fine and large wrinkles\nImproves skin color and appearance\nGently cares for problematic, inflamed skin	Tropical Mists body cream is made with cocoa bean oil, contains natural plant extracts and vitamins necessary for the skin.	Cocoa butter perfectly softens and moisturizes the skin, and in addition, enhances the effect of other components.\nAloe vera has a bactericidal, healing and toning effect, is perfect for caring for problematic, dry, sensitive, oily, seborrheic skin of the face and body, is an excellent moisturizer and protects the skin from light exposure.\nGreen tea extract has astringent properties, effectively relieves puffiness. Chamomile extract softens skin irritation, has an anti-inflammatory, antiseptic, antispasmodic and regenerating effect.\nGrape seed extract is a hydrophilic antioxidant that acts in an aqueous environment, such as cell nuclei. Its antioxidant properties are 20 times higher than that of vitamin C.\nGinkgo biloba extract stimulates blood circulation, prevents capillary fragility, and has an anti-inflammatory effect.\nMethylsulfanylmethane is a substance containing sulfur. Non-toxic, does not contain metals. Sulfur, important for cellular respiration, is necessary for the formation of hair, nails, cartilage, has an anti-allergic effect; promotes the removal of lactic acid and toxins from tissues, which allows nutrients to penetrate there; helps the body to renew and restore damaged skin cells and connective tissue, restores their elasticity.\nVitamin C protects the skin from the harmful effects of free radicals, has antioxidant properties.\nVitamin A promotes faster renewal of the epidermis, controls pigmentation, normalizes the activity of the sebaceous glands, gives the skin a young and well-groomed appearance.	Purified water, glycerin, glyceryl stearate / polyethylene glycol-100 stearate, caprylic/caprine triglyceride, cetearyl alcohol, cocoa seed oil, cetearet-20, cetyl esters, phenoxyethanol, dimethyl sulfone, dimethicone, carbomer, apricot kernel oil, sweet almond oil, methylparaben, fragrance, butylparaben, tetranatrium EDTA, propylparaben, ethylparaben, chamomile flower extract, camellia oil leaf extract, ginkgo biloba leaf extract, Korean ginseng root extract, barbadian aloe leaf juice, grape seed extract, retinyl palmitate (vitamin A), tetrahexyldecyl ascorbate (vitamin C).	Tropical Mists Cocoa Butter cream is ideal for dry and sensitive skin, as well as for sunburned or chapped skin. Gently apply a small amount of cream to the skin in a circular motion.	\N	\N
124	124	It has a softening and relaxing effect on overstressed muscles and joints\nSoftens and moisturizes the skin thanks to the action of essential oils\nHelps to improve blood supply and increases tissue regeneration	The product works very effectively due to its fast and deep penetration through the skin, and a rich set of excellent vegetable oils makes it an excellent means for massage.	Gaulteria leaf oil — thanks to its warming and simultaneously cooling effect, it perfectly relieves muscle, arthric and rheumatic pains, helps with sprains.\nTea tree oil has gained worldwide recognition due to its healing properties: antiseptic, disinfectant, antibacterial and anti-inflammatory.\nAvocado oil — has antioxidant and regenerating properties. Regulates the metabolism of prostaglandins that control the skin's immunity, restores the structure of the epidermis, improves the moisture-retaining properties of the skin.\nSesame oil — has a harmonizing effect on the skin and the body as a whole, restores, moisturizes and nourishes the skin, eliminates peeling and irritation.\nOlive oil — perfectly nourishes and moisturizes the skin.\nEvening primrose oil — has pronounced healing, regenerating and rejuvenating properties.\nMint oil — has an antiseptic, antispasmodic, stimulating effect.	Safflower seed oil, sumac peel wax, beeswax, cyclomethicon, trihydrostearin, hydrogenated castor oil, gaulteria leaf oil, macadamia seed extract, hemp seed oil, mint leaf oil, avocado oil, European olive fruit oil, sesame seed extract, tea tree leaf oil, evening primrose oil, squalane, panthenyl triacetate (vitamin B), tetrahexyldecyl ascorbate (vitamin C), tocopherol (vitamin E), lecithin, isopropyl myristate.	It can be used for massage. Relaxes muscles, softens the skin. Apply the balm to the skin with gentle massaging movements.\nPrecautions: do not use on the skin of the face. Avoid contact with eyes. After application, wash your hands with soap. If the condition does not improve, or in case of irritation, consult a doctor.	\N	\N
125	125	Controls sweating, which is the cause of the smell\nQuickly absorbed, leaving no traces on clothes\nIt has anti-inflammatory, healing, soothing properties\nHypoallergenic\nOdorless – suitable for both women and men.	A soft, refreshing antiperspirant deodorant is a reliable protection against sweat for a long time.	Chamomile flower extract, has anti-inflammatory, healing, anti-allergic and softening effect.\nRosemary leaf extract has antiseptic, anti-inflammatory, analgesic, tonic effect. Stimulates local blood circulation.\nChinese camellia leaf extract moisturizes, relieves irritation and soothes the skin.\nThe juice of Aloe Barbadensis leaves softens, moisturizes, nourishes, regenerates the skin.\nAlso, the composition of the antiperspirant deodorant includes sea salt, which has antiseptic, anti-inflammatory, bactericidal properties.	Water, aluminum hydrochloride, sorbitol, stearet-21, ethylhexyl palmitate, isostearyl alcohol, cetyl alcohol, phenoxyethanol, fragrance, methylparaben, ethylparaben, butylparaben, isobutylparaben, propylparaben, sea salt, aloe barbadian leaf juice, chamomile extract, Chinese camellia leaf extract, rosemary leaf extract.	Passed dermatological examination and clinical trials. Suitable for use even for very sensitive skin.\nApply to clean skin of the armpits, after each body wash.	\N	\N
126	126	Softens, moisturizes and improves the condition of the skin\nPlant extracts protect the skin from the effects of free radicals\nRefreshes and soothes the skin due to the effects of natural ingredients\nIncreases the regeneration of skin cells\nDoes not contain alcohol\nThe unique formula of the product makes it possible to carefully care for problematic, inflamed skin\nAloe and witch hazel ("witch hazel") have a softening and refreshing effect on irritated skin.	\N	Witch hazel extract has an astringent, tonic effect, causes vasoconstriction, an excellent antiseptic.\nAloe vera has a bactericidal, healing and toning effect, is perfect for caring for problematic, dry, sensitive, oily, seborrheic skin of the face and body, is an excellent moisturizer and protects the skin from light exposure.\nGreen tea extract contains a complex of tannins with the ability to increase the stability of blood vessels, and proanthocyanides, having an antioxidant effect, prevent cell destruction. It has an astringent property, effectively relieves puffiness.\nChamomile extract contains flavonoids, caratinoids and other substances that soften skin irritation, have anti-inflammatory, antiseptic, antispasmodic and regenerating effects.\nGrape seed extract is a hydrophilic antioxidant that acts in an aqueous environment, such as cell nuclei. Its antioxidant properties are 50 times higher than vitamin E and 20 times higher than vitamin C.\nGinkgo biloba extract stimulates blood circulation, prevents capillary fragility, and has an anti-inflammatory effect.	Purified water, witch hazel extract, butylene glycol, carbomer, phenoxyethanol, chlorophyllin, glycerin, menthol, aloe barbadian leaf juice, methylparaben, benzoic acid, disodium EDTA, chamomile flower extract, ginkgo biloba leaf extract, camellia oil leaf extract, grape seed extract.	Apply to clean skin as needed to provide a calming effect. It can be used after shaving, helps to relieve irritation. It has a beneficial effect on sunburned, inflamed or sensitive skin. It is also used in case of itching from insect bites.	\N	\N
127	127	Softens, moisturizes and improves the condition of the skin\nPlant extracts protect the skin from the effects of free radicals\nRefreshes and soothes irritated skin\nIncreases the regeneration of skin cells\nThe unique formula of the gel makes it possible to carefully care for the skin	\N	Aloe Barbadian leaf juice has a bactericidal, healing and toning effect and is used for problematic, dry, sensitive, oily, seborrheic skin of the face. It is an excellent moisturizer and protects the skin from light exposure. It contains vitamins C and E — known antioxidants.\nChamomile flower extract has anti-inflammatory, wound healing and mild analgesic effect.\nChinese Camellia leaf extract (green tea) is a leader among plant antioxidants. Its unique properties are due to the high concentration of polyphenols, the activity of which is several times higher than the activity of the well-known skin protector from free radicals - vitamin E. Tea polyphenols also have anti-inflammatory and antibacterial effects, promote the penetration of biologically active substances into the skin. The caffeine contained in the extract improves blood microcirculation and skin nutrition, reduces puffiness; tannins give the skin elasticity.\nRosemary leaf extract has antiseptic, anti-inflammatory, analgesic, tonic effect. Stimulates local blood circulation.	Water, ethanol, butylene glycol, glycerin, polyethylene glycol-40, hydrogenated castor oil, Barbadian aloe leaf juice, chamomile flower extract, rosemary leaf extract, Chinese camellia leaf extract, fragrance, carbomer, tetranatrium EDTA, sodium hydroxide.	Apply to the skin after each shave.	\N	\N
128	128	Quickly moisturizes and softens the skin of the legs and feet.\nPromotes rapid healing of cracks on the skin of the feet.\nRelieves the feeling of fatigue and swelling of the legs.\nIt has antibacterial and antifungal effects.	\N	The lotion is specially designed for the skin of the feet and legs. It contains powerful moisturizing ingredients: aloe vera, apricot kernel oil and sweet almond oil. Natural essential oils not only give a refreshing aroma, but also work as a complex of antioxidants. Thanks to the rich plant complex, it has a tonic effect on the veins of the legs, antibacterial, antifungal, analgesic, healing local effect.	Purified water, glycerin, glyceryl stearate / polyethylene glycol-100 stearate, sunflower seed oil, cetearyl alcohol / cetearet-20, cetearyl alcohol, cetyl esters, a mixture of preservatives 2 (phenoxyethanol, methylparaben, ethylparaben, isobutylparaben, butylparaben, propylparaben), dimethicone, sweet oil almond, apricot kernel oil, fragrance/mixture antioxidants (grapefruit seed extract, lavender oil, peppermint oil, tea tree leaf oil, ylang-ylang flower oil, rosewood oil, menthol), carbomer, tetranatrium EDTC, camellia oil leaf extract, Korean ginseng root extract, chamomile flower extract (Matricaria), ginkgo biloba leaf extract, Echinacea purpurea root extract, retinyl palmitate / cholecalciferol, tetrahexyldecyl ascorbate, allantoin, aloe barbadensis leaf juice, grape seed extract (Vitis vinifera).	After taking a bath or shower, apply the lotion to the skin of the feet with gentle circular movements, let it soak in. Special attention should be paid to rough, dry skin on the heels.	\N	\N
129	129	Contains tocopherol acetate (vitamin E), which protects the skin from free radicals. \nContains bisabolol, which has an emollient property.\nIt does not contain ingredients of animal origin, mineral oil, petroleum jelly, silicone oils.	A voluminous saturated shine with a gel texture and shimmering particles. The gel-cream, caring texture of the gloss will never roll down on the lips. Translucent iridescent gloss emphasizes the natural shade of the lips and gives them radiance and incredible volume. The formula is rich in caring ingredients. The basis of the vitamin of youth is vitamin E and bisabolol, known for its rejuvenating and healing properties.\nEffect : soft, radiant, voluminous and very natural lips.	\N	\N	Apply lip gloss thickly.	\N	\N
130	130	Contains tocopherol acetate (vitamin E), which protects the skin from free radicals. \nContains bisabolol, which has an emollient property.\nIt does not contain ingredients of animal origin, mineral oil, petroleum jelly, silicone oils.	A voluminous saturated shine with a gel texture and shimmering particles. The gel-cream, caring texture of the gloss will never roll down on the lips. Translucent iridescent gloss emphasizes the natural shade of the lips and gives them radiance and incredible volume. The formula is rich in caring ingredients. The basis of the vitamin of youth is vitamin E and bisabolol, known for its rejuvenating and healing properties.\nEffect : soft, radiant, voluminous and very natural lips.	\N	\N	Apply lip gloss thickly.	\N	\N
136	136	\N	A convenient format for the presentation of a new product - Vitamin D3 NSP, already so beloved by consumers of the company's products, for your new partners and customers. In a compact and colorful booklet you will find a lot of useful and most important information about this product.	\N	\N	\N	\N	\N
137	137	\N	\N	\N	\N	\N	\N	\N
140	140	\N	From this book you will learn:\nhow to eliminate fat accumulation programs;\neffective methods of restoring health and achieving slimness;\nhow to turn on the body's natural ability to burn fat, become slim and forget about diets and exhausting workouts forever;\nsimple and effective psychological techniques;\na test to identify the strengths and weaknesses of the nervous system;\nand also what your coach won't tell you.\nAbout the authors:\nAnna Kotelnikova is a surgeon by education. Andrey Yashkov is an anesthesiologist and resuscitator. Doctors-nutritionists, naturopaths (studied at the Faculty of Advanced training of medical workers of the RUDN). Authors of trainings and seminars on self-healing techniques. Wellness coaches, experts in achieving slimness. They help thousands of people to maintain a healthy and active life.\n"Our body is like a combination lock. Your task is to choose the right numbers, and then you will get health and harmony for many years. In this book we have shared with you our practical experience. We told you what you need to do, why you need to do it, and even how you need to do it. But knowledge does not give results if it is not applied in practice."	\N	\N	\N	\N	\N
141	141	\N	Convenient, visual and accessible tools for working with NSP wellness programs. A5 booklets contain detailed information about the products included in the wellness programs. \nThe series came out:\nThe health of your joints\nThe health of your bones\nFitness\nConnective Tissue Health\nStop swelling\nTo help those who quit smoking\nThe health of your eyes\nHealthy heart\nAntiparasitic program\nProtection of vessels\nSkin, hair, nails\nClear head\nStop allergy\nThe health of your liver\nHealth with NSP all year round\nAntistress\nStrong immunity\nGastrointestinal health as a basis\nHealthy child\nMusculoskeletal rehabilitation program	\N	\N	\N	\N	\N
142	142	\N	Bright and concise A5 advertising booklet "Wow-serum" is a convenient and affordable tool for product promotion.	\N	\N	\N	\N	\N
143	143	\N	A concise A6 advertising booklet is a convenient and affordable tool for product promotion.\nIn the series came out:\nIndole-3-carbinol\nPaw Paw\nSmart Mil\nZambrosa\nNoni Juice\nChlorophyll\nLymphatic Drainage\nPhysical Asset	\N	\N	\N	\N	\N
144	144	\N	Collection of recommendations for the prevention of various diseases and health conditions.\nThe recommendations are the quintessence of many years of experience in the practical application of dietary supplements of the company NSP Ustinova Natalia Alekseevna, formerly a doctor, and today a naturopath and a leading diagnostician with 17 years of experience, an assistant Director of the company.\nWe reserve for the author the right to an individual view and approach to the choice of products, proven by successful results of working with them.	\N	\N	\N	\N	\N
145	145	\N	\N	\N	\N	\N	\N	\N
146	146	\N	The first issue in the framework of the project "Active longevity". The articles of the collection are devoted to the problems of preventive healthcare, the introduction of innovative methods and technologies of early diagnosis and prevention, restorative medicine and medical rehabilitation, ecology, preventive and curative nutrition based on ecological products and non-medicinal preparations from natural raw materials, the introduction of complementary medicine methodologies into domestic healthcare practice and other issues related to the health and longevity of the nation. NP "Health" is a partner of the first edition, which we are pleased to present to your attention. One of the articles in the collection is devoted to NSP products and kits.	\N	\N	\N	\N	\N
147	147	\N	A convenient, visual and accessible tool for work. It will help you navigate the company's product range.	\N	\N	\N	\N	\N
148	148	\N	Professional athlete and partner of NSP Pavel Lipnitsky presents to your attention this guide to action for amateur and professional athletes. The brochure summarizes the experience of using our dietary supplements in nutrition support programs and athletes' health correction.	\N	\N	\N	\N	\N
149	149	\N	We bring to your attention a reissue of the hit, which contains simple and proven health recipes for every day. This collection is based on the experience of long-term use of NSP products by consumers and professional physicians. The presented Supercomplexes include the most proven products, thanks to which our company has earned the trust of its consumers. Let this concise edition be your home health recipe book for the whole family. Ask for the brochure at the service centers and the delivery service.	\N	\N	\N	\N	\N
150	150	\N	We hasten to please everyone who is familiar with the popular publication-a guide to the products of NSP "Ecology of your body". The edition has been reissued and goes on sale again!\nAnd if this is the first time you hear about this booklet, we advise you to be the first to purchase it! The circulation is limited.\nThe human body is a large ecosystem in which everything is interconnected. This biological mechanism works for a full-fledged human life, and our task is to take care of it.\nWe have created this booklet to introduce you in an accessible language to the main systems of the human body, as well as to the products of the NSP company that will help support their key functions.	\N	\N	\N	\N	\N
151	151	\N	The book describes how, given the season of the year and knowing which organs and systems should be active during this period, it is possible to provide seasonal support to the human body by effectively using the NSP product range.	\N	\N	\N	\N	\N
152	152	\N	Cordyceps chinensis, a miracle mushroom that surpasses ginseng in its healing properties, has long been considered the "medicine of the land of immortality" in its homeland, China. For more than 2000 years, only members of the imperial family had the right to take medicines from it. Only recently, thanks to modern biotechnologies, scientists have learned to grow this rare mushroom on an industrial scale. Its products have been clinically tested in major medical institutions in the USA, Canada, and Japan, where its high preventive and general healing effect has been confirmed.\nToday, all the great Chinese athletes, winners of the World Championships and the Olympic Games include cordyceps in their diet. It is also approved by the Institute of Nutrition of the Russian Academy of Medical Sciences – the Russian Academy of Medical Sciences.\nThis brochure, addressed to everyone who cares about their health, tells in detail about the purpose and healing properties of the dietary supplement "Cordyceps NSP" ("CordycepsNSP") of the company "Nature's Sunshine Products".	\N	\N	\N	\N	\N
153	153	\N	Contents:\nI. What is MSM\nII. Sources of sulfur\nIII. Sulfur-containing compounds\nIV. How sulfur can be useful to a person\n\tThe use of MSM in various types of arthritis\n\tAllergy\n\tAsthma\n\tInflammation and pain\n\tThe use of MSM in oncology\n\tThe use of MSM in gastroenterology\n\tDiabetes\n\tGum disease\n\tHair\n\tSkin\n\tSnoring\nV. The use of MSM and its dosage\nVI. Literature\nAuthor:\nScientific consultant of the NSP company, Senior researcher of the Department of Preventive Medicine, RUDN Novikov A.F.	\N	\N	\N	\N	\N
155	155	\N	Compiled by:\nDruzhinin P.V. Head of the Department of Preventive Medicine of the Faculty of Advanced Training of Medical Workers of the RUDN (Moscow)\nEremenko A.I. Associate Professor of the Department of Maxillofacial Surgery and Dentistry of the State Medical University (St. Petersburg)\nNovikov A.F. Scientific consultant of the Representative Office of the NSP company.\nContent:\n1. Anatomical features of the maxillofacial region\n2.The main surgical dental diseases and principles of drug therapy with the use of dietary supplements of the company NSP\nA) Acute odontogenic inflammatory processes\nB) Dysbiosis of the oral cavity\nC) Non-ontogenic inflammatory diseases of the maxillofacial region\nD) Diseases of the salivary glands\nE) Diseases of the temporomandibular joint\n3. Preparation for planned surgical interventions in the oral cavity\n4. The use of dietary supplements of the company NSP for the prevention of complications of drug therapy of dental diseases	\N	\N	\N	\N	\N
156	156	\N	Authors:\nShaposhnikov V.A. Urologist\nDruzhinin P.V. Head of the Department of Preventive Medicine of the Faculty of Advanced Training of Medical Workers of the RUDN\nNovikov A.F. Senior lecturer of the Department of Preventive Medicine of the Faculty of Advanced Training of Medical Workers of the RUDN. Scientific consultant of the NSP company.\nContent:\n1. Anatomical structure of the prostate gland and its physiological functions\n2. Classification of prostate diseases\n3. Chronic infectious prostatitis\n4. Chronic non-infectious (abacterial) prostatitis\n5. Benign prostatic hyperplasia\n6. Phytotherapy and the use of dietary supplements of the company NSP for the correction of male reproductive health\nApplication. Information about the cost of drugs in Moscow	\N	\N	\N	\N	\N
157	157	\N	Compiled by: Druzhinin P.V., Head of the Department of Preventive Medicine of the Russian Academy of Medical Sciences\nNovikov A.F., PhD of the Department, scientific consultant of the NSP company\nLysikov Yu.A., Senior Researcher at the Research Institute of Nutrition of the Russian Academy of Medical Sciences\nContent:\n1. Lipid metabolism disorders. How relevant is this?\n2. Hyperlipoproteinemia\n3. Hypercholesterolemia\n4. Metabolic syndrome\n5. Vascular diseases. Atherosclerosis\n6. Lipid accumulation diseases\n7. Disorders of lipid metabolism in the liver. Fatty liver dystrophy\n8. Disorders of bile acid metabolism. Cholelithiasis\n9. Lipid distress syndrome\n10. Treatment of lipid metabolism disorders. The role of dietary supplements in prevention and treatment	\N	\N	\N	\N	\N
158	158	\N	Compiled by: Druzhinin P.V., Head of the Department of Preventive Medicine of the Russian Academy of Medical Sciences\nNovikov A.F., PhD of the Department, scientific consultant of the NSP company\nLysikov Yu.A., Senior Researcher at the Research Institute of Nutrition of the Russian Academy of Medical Sciences\nContent:\n1. Lipid metabolism disorders. How relevant is this?\n2. Hyperlipoproteinemia\n3. Hypercholesterolemia\n4. Metabolic syndrome\n5. Vascular diseases. Atherosclerosis\n6. Lipid accumulation diseases\n7. Disorders of lipid metabolism in the liver. Fatty liver dystrophy\n8. Disorders of bile acid metabolism. Cholelithiasis\n9. Lipid distress syndrome\n10. Treatment of lipid metabolism disorders. The role of dietary supplements in prevention and treatment	\N	\N	\N	\N	\N
159	159	\N	Compiled by: district general practitioner of the 1st category, city polyclinic No. 167 of the Southern Administrative District ofMoscow; employees of the Department of Preventive Medicine of the Russian Academy of Medical Sciences: Head of the Department P.V. Druzhinin, Senior Researcher S. A.F.Novikov\nContents:\nSection 1. The work of district doctors\nSection 2. Respiratory diseases\nSection 3. Diseases of the cardiovascular system\nSection 4. Diseases of the digestive system\nSection 5. Diseases of the musculoskeletal system\nSection 6. Briefly about the management of cancer patients\nSection 7. Interesting clinical cases	\N	\N	\N	\N	\N
160	160	\N	Compiled by: gynecologist-endocrinologist, doctor of the highest category M.M. Alekseeva\nReviewers: Ph.D. A.F.Novikov, Head of the Department of Preventive Medicine, Food Hygiene and Naturopathy, RUDN Ph.D. P.V.Druzhinin\nContent:\n1. Uterine fibroids\n1.1. General information about etiopathogenesis. Indications for conservative treatment\n1.2. Correction of somatic status. Dietary supplements in the treatment of iron deficiency conditions in fibroids\n1.3. Elimination of risk factors contributing to the development of fibroids (Correction of dietary regime, blood lipid spectrum)\n2. Mastopathy\n2.1. Definition and classification\n2.2. Etiopathogenesis\n2.3. Clinical picture and diagnosis\n2.4. Treatment\n3. Genital endometriosis\n3.1. The main theories of the occurrence of endometriosis\n3.2. Classification of endometriosis. Clinical features\n3.3. Treatment\n3.4. Dietary supplements and the state of pseudomenopause	\N	\N	\N	\N	\N
161	161	\N	Compiled by: rheumatologist E.A.Poddubskaya, Ph.D. A.F.Novikov, Head of the Department of Preventive Medicine of the FPC MR RUDN Ph.D. P.V.Druzhinin Contents:\n1. Structure of joints\n2. Definition of the disease\n3. Etiology of osteoarthritis\n4. Pathogenesis (What happens in the joint?)\n5. Risk factors (Who is more likely to get osteoarthritis)\n6. Morphological and anatomical changes in osteoarthritis\n7. Clinical manifestations\n8. Principles of osteoarthritis treatment\n9. The use of dietary supplements for osteoarthritis	\N	\N	\N	\N	\N
162	162	\N	The birthplace of the tea tree is Australia. Since time immemorial, the aborigines of Australia have used tea tree leaves as a medicinal remedy. The aborigines ground the leaves and prepared gruel from them, which was used to treat wounds. Crushed leaves were also used to protect against insects. Many secrets of this traditional medicine have been lost, so today we have to re-develop old recipes.\nIn our brochure, you will not only learn in detail about this plant, but also about how essential oil is obtained, what quality standards are imposed on it, its composition, action, scope of application and much, much more.	\N	\N	\N	\N	\N
163	163	\N	Compiled by: Druzhinin P.V., Head of the Department of Preventive Medicine of the Russian Academy of Medical Sciences\nNovikov A.F., PhD of the Department, scientific consultant of the NSP company\nLysikov Yu.A., Senior Researcher at the Research Institute of Nutrition of the Russian Academy of Medical Sciences\nContent:\n1. Lipid metabolism disorders. How relevant is this?\n2. Hyperlipoproteinemia\n3. Hypercholesterolemia\n4. Metabolic syndrome\n5. Vascular diseases. Atherosclerosis\n6. Lipid accumulation diseases\n7. Disorders of lipid metabolism in the liver. Fatty liver dystrophy\n8. Disorders of bile acid metabolism. Cholelithiasis\n9. Lipid distress syndrome\n10. Treatment of lipid metabolism disorders. The role of dietary supplements in prevention and treatment	\N	\N	\N	\N	\N
164	164	\N	Compiled by: Druzhinin P.V., Head of the Department of Preventive Medicine of the Russian Academy of Medical Sciences\nNovikov A.F., PhD of the Department, scientific consultant of the NSP company\nLysikov Yu.A., Senior Researcher at the Research Institute of Nutrition of the Russian Academy of Medical Sciences\nContent:\n1.Fat, oil, lipids… What are lipids? Classification of lipids\n2.The main functions of lipids in the human body\n3. Fatty acids and triglycerides\n(a)Fatty acids\n(b)Essential fatty acids\n(c)Trans fatty acids\n(d)Volatile fatty acids\n(e)Medium- and long-chain fatty acids\n(f)Triglycerides\n4.Waxes\n5.Phospholipids, glycolipids (sphingolipids) and steroids (steroids)\n(a)Phospholipids or glycerophospholipids\n(b)Glycolipids or sphingolipids\n((c)Steroids and Steroids\n(d)Cholesterol\n(e)Bile acids\n(f)Bile\n6.Isoprenoids and fat-soluble vitamins\n7.Lipoproteins\n8. Dietary fats. So what are we eating?\n9.Dietary supplements of the company NSP and lipid metabolism	\N	\N	\N	\N	\N
165	165	\N	Compiled by: Druzhinin P.V., Head of the Department of Preventive Medicine of the Russian Academy of Medical Sciences\nNovikov A.F., PhD of the Department, scientific consultant of the NSP company\nLysikov Yu.A., Senior Researcher at the Research Institute of Nutrition of the Russian Academy of Medical Sciences\nContent:\n1. The history of the use of enzyme preparations\n2. What are enzymes? The role of enzymes in the body\n3. Modern classification and characteristics of digestive enzymes\n4.Digestive container of the gastrointestinal tract\n5. Enzyme therapy of digestive function insufficiency\n6. Endogenous digestion. Justification of systemic enzyme therapy\n7. Orientation and mechanism of action of systemic enzymes\n8. Enzyme preparations of NSP company	\N	\N	\N	\N	\N
166	166	\N	Compiled by: Druzhinin P.V., Head of the Department of Preventive Medicine of the Russian Academy of Medical Sciences\nNovikov A.F., PhD of the Department, scientific consultant of the NSP company\nLysikov Yu.A., Senior Researcher at the Research Institute of Nutrition of the Russian Academy of Medical Sciences\nContent:\n1.What is dietary fiber? Concept and definition\n2.The main types of dietary fiber. Their structure and properties\n3. Modern classification of dietary fiber\n4. Physico-chemical properties of dietary fibers\n(a)Solubility in water\n(b)Hydrophilicity and water retention capacity\n(c)Sorption capacity\n(d)Digestibility of dietary fiber by bacterial enzymes\n(e)Dietary fiber as a source of nutrients\n5. Physiological effect of dietary fiber on the human body\n(a)Effect on the structure and function of the stomach\n(b)Influence on the structure and function of the small intestine\n(c)Influence on the structure and function of the colon\n(d)Effect on intestinal motility and food transit\n(e)Effect on intestinal microbiocenosis\n(f)Influence on the processes of digestion and absorption\n(g)Influence on metabolism and the work of organs and systems of the body\n(h)Dietary fiber in the prevention and treatment of diseases of the digestive system\n(i)Dietary fiber in the prevention and treatment of diseases of internal organs\n6. Consumption of dietary fiber. Basic standards\n7.The content of dietary fiber in food\n8. Dietary fiber in the composition of food additives\n9. Dietary fiber and entersorption\n(a)Entero-endogenous recycling of substances\n(b)Toxic danger to the human body\n(c)Basic principles and methods of detoxification of the body\n10. The program of prevention and treatment of intoxication using dietary supplements NSP\n11.Dietary fiber in NSP products	\N	\N	\N	\N	\N
167	167	\N	Your health depends on the pH balance.\nCan you imagine that the development of many diseases depends on one cause? Many nutritionists and phytotherapists now designate this hidden danger with two words: acid and alkali.\nHigh acidity destroys the most important systems in the body and it becomes defenseless against diseases. A balanced pH environment ensures the normal course of metabolic processes in the body, helping it to fight diseases. A healthy body has a supply of alkaline substances, which it uses if necessary.\nYou will learn more about the pH value and methods of influencing it from the brochure.	\N	\N	\N	\N	\N
168	168	\N	This brochure describes in detail the principles of using dietary supplements in the prevention and treatment of diseases. And also the results of clinical studies are given:\nThe results of the study of the drug "Digestive enzymes" in chronic gastritis. (Moscow, MGMSU, Department of Clinical Pharmacology, 2009)\nThe use of drugs "Complex with Garcinia" and "Chromium Chelate" in the treatment of diabetes mellitus. (Moscow, MGMSU, Department of Clinical Pharmacology, 2008)\nThe results of the use of the drugs "Osteo Plus" and "Wild Yams NSP" in the treatment of osteoporosis. (Moscow, MGMSU, Department of Clinical Pharmacology, 2008)\nThe results of the use of the drugs "Calcium Magnesium Chelate" and "Bon-Si" in the treatment of osteoporosis. (Moscow, MGMSU, Department of Clinical Pharmacology, 2008)\nThe use of the drug "Carbo Grabbers" in the treatment of obesity on the background of diabetes mellitus. (Moscow, MGMSU, Department of Clinical Pharmacology, 2009)	\N	\N	\N	\N	\N
169	169	\N	This brochure contains the results of clinical trials of some drugs, for example:\n1. Clinical study of the drug "Fat Grabbers". (Sunshine Scandinavia AS Company, Tiunsberg, Norway (Tensberg, Norway), 1999)\n2. Clinical efficacy of dietary supplement therapy using "Loclo", "Burdock" and "Echinacea" in patients with chronic pancreatitis. (Moscow, MGMSU, Department of Clinical Pharmacology, 2005)\n3. To study the clinical effectiveness of the treatment of patients with gastropathy caused by taking NSAIDs with the help of dietary supplements "Stomak Comfort". (Moscow, MGMSU, Department of Clinical Pharmacology, 2005)\n4. Clinical approbation of dietary supplements "According to D'Arco". (Kazakh Academy of Nutrition, 2003)\n5. Clinical testing of dietary supplements "Glucosamine". (Kazakh Academy of Nutrition, 2003)\n6. Clinical studies of the complex preparation "Protease Plus" and "Lozenges with zinc". (Moscow City Center for Sex Pathology, 2004)\n7. Study of the use of dietary supplements with antioxidant activity in coronary heart disease. (I.M. Sechenov MMA, Moscow)\n8. Clinical studies of the herbal preparation "Liv Gard". (MO, Zhukovsky, TSGB, 2004)\nAs well as additional information from the American scientific department of the company:\n1. The ability to capture free radicals by the active ingredients that are part of the fruits of Morinda Citrifolia L. (Noni). (Faculty of Medical Chemistry and Pharmacology, College of Pharmacy, University of Illinois, Chicago, USA, 2004)\n2. Noni juice of the NSP company surpasses in activity in immune stimulation the products of the company "Morinda" - Noni Tahitian juice (Morinda Tahitian). (David S. Pasco, Professor, Coordinator of Biological Research of Phytopreparations, University of Mississippi, USA)\n3. Vitamins "E" and "C" are confirmed as safe when prescribed in high doses. (The American Journal of the Clinical Nutrition, 2005)\n4. "Coral calcium" produced by NSP. (NSP Scientific Consultant Jeff Tuttle)	\N	\N	\N	\N	\N
171	171	\N	1. The use of dietary supplements from NSP in urology for the treatment of prostatitis.\nAuthor: Mudrik I.V., urologist, Kiev, Ukraine.\n2. Clinical application of the drug "So-Palmetto" by NSP.\nAuthor: Shaposhnikov V.A., urologist, St. Petersburg.\n3. "Gingko Biloba" and "Coenzyme Q10 plus" of the new generation, created on the basis of new technologies.\nAuthor: Fedorov S.N., KMN, Ukrainian Academy of Postgraduate Education, Kiev.\n4. Clinical and pathogenetic characteristics of non-rheumatic myocarditis. Dietary supplements in the treatment of myocarditis.\nAuthor: Matskevich S.A., BelMAPO, MOKB, Belarus.\n5. Rheumatism. The role of NSP phytopreparations in prevention and treatment.\nAuthor: Shchigoleva L.N., rheumatologist, Minsk, Belarus.\n6. Correction of thyroid diseases with phytopreparations of the company NSP.\nAuthor: Korzyk N.P., surgeon of the highest category, KMN, Kiev.\n7. Experience in the use of NSP drugs for gastric ulcer, duodenal ulcer and other diseases of the gastrointestinal tract.\nAuthors: Wojciechowski V.G., CMN, Department of Microbiology, National Medical University, Denisenko Y.M., endoscopist, Consultative and Diagnostic Center, Kiev.\n8. The use of nutraceuticals, parapharmaceuticals and probiotics in dermatology. Pathogenetic mechanisms of action of dietary supplements in skin diseases.\nAuthor: V.V. Antilevsky, CMN, dermatologist, Minsk.\n9. Experience of using the drug "Po D'Arco" by NSP for the treatment of patients with fungal lesions of the skin and nails.\nAuthor: S.G. Belyaev, dermatovenerologist of the 1st category, Central City Hospital, Dubna.\n10. Cosmetics that hide nothing (or how to prolong youth).\nAuthors: Novikov A.F., Mayorova A.V., Nikitina N.A., Department of Aesthetic Medicine and Department of Preventive Medicine of the Russian Academy of Medical Sciences.\n11. Prevention of complications of substance abuse with dietary supplements.\nAuthors: Druzhinin P.V., Novikov A.F., Department of Preventive Medicine of the Russian Academy of Medical Sciences.\n12. Money and neuroses. Application of dietary supplements of the company NSP.\nAuthor: Kozodaeva L.A., nutritionist, Moscow.\n13. The use of dietary supplements by NSP in the treatment of adaptation disorders and in neurological practice.\nAuthor: Razumova O.M., psychiatrist of the Moscow State Medical Institute, Minsk.\n14. Chronic renal failure and the use of dietary supplements.\nAuthor: Degtyar I.A., nephrologist, Minsk.\n15. Application of the NSP "Jurai" phytocomplex in nephrological practice.\nAuthor: T.P. Badalyan, nephrologist, Novosibirsk.	\N	\N	\N	\N	\N
172	172	\N	1. Review based on the materials of the VI International Symposium "Biologically active food additives and problems of optimizing nutrition of the population".\n2. On improving the system of professional training of distributors and medical workers on the use of Biologically Active Food Additives and their role in healthy nutrition.\nAuthors: Druzhinin P.V., Novikov A.F., Orlova G.G., Department of Preventive Medicine of the Russian Academy of Medical Sciences, Moscow.\n3. Nature + Experience + Science = Biologically Active additives from NSP.\nAuthor: NazarenkoG.B., cmn, ophthalmologist.\n4. Experience in the use of dietary supplements of the company NSP in pregnant women.\nAuthor: Lyashenko A.P., therapist of the 1st category, 3rd women's consultation, Minsk, Belarus.\n5. The use of dietary supplements from NSP in the treatment of habitual miscarriages.\nAuthor: Gorgoshidze B.V., KMN, Research Institute of Human Reproduction, Tbilisi, Georgia.\n6. The use of the NSP Echinacea dietary supplement as a plant immunostimulator in women with a history of miscarriage and the presence of interferon deficiency.\nAuthor: Pluzhnikova T.A., KMN, Center for the Prevention and Treatment of Miscarriage, St. Petersburg.\n7. Study of immunotropic and antioxidant properties of Bee pollen dietary supplements in refugee volunteers.\nAuthor: Korsantia B.M., DMN, Institute of Medical Biotechnology of the Academy of Sciences of Georgia, Dzidziguri N.G., 9th District Polyclinic, Tbilisi.\n8. "The Forgotten disease".\nAuthor: Gasparyan M.A., phthisiopediatrician, Balashikha, Moscow region.\n9. Prevention and treatment of colds.\nAuthor: Novikov A.F., STNS of the Department of Preventive Medicine of the Russian Academy of Medical Sciences, scientific consultant of the NSP company.\n10. Results of clinical use of probiotic drugs "Bifidophyllus Flora Force" in the correction of intestinal dysbiosis.\nAuthor: Zhernakova N.B., pediatrician, Medical Rehabilitation Center, St. Petersburg.\n11. Mucosal dysbiosis syndrome and the possibility of its correction with Biologically active Additives of the company NSP.\nAuthor: Khoroshilova N.V., KMN, immunologist, Moscow.\n12. Chronic tonsillitis and its complications.\nAuthor: E.A. Chudinova, otolaryngologist, Moscow.\n13. The use of NSP products in the treatment of patients with purulent-septic pathology.\nAuthor: Korzyk N.P., CMN, surgeon of the highest category, Kiev.\n14. Women's chronic inflammatory diseases.\nAuthor: Alekseeva M.M., gynecologist-endocrinologist, doctor of the highest category, polyclinic of the Ministry of Health of the Russian Federation, Moscow.\n15. The use of dietary supplements and phytopreparations in breast diseases.\nAuthor: Novikov A.F., STNS of the Department of Preventive Medicine of the Russian Academy of Medical Sciences, scientific consultant of the NSP company.\n16. Biologically active additives of NSP company in the complex therapy of menopausal syndrome.\nAuthor: Alekseeva M.M., gynecologist-endocrinologist, doctor of the highest category, polyclinic of the Ministry of Health of the Russian Federation, Moscow.\n17. The use of "Lecithin" by NSP for the treatment and prevention of atherosclerosis of cerebral vessels.\nAuthor: Reshetnyak S.P., neuropathologist of the 1st category, Lugansk.	\N	\N	\N	\N	\N
173	173	\N	The handbook contains a detailed description of medicinal herbs used in NSP products, including morphology, chemical composition, pharmacological action and application.\nThe reference book is illustrated with wonderful photographs and drawings from English botanical reference books.	\N	\N	\N	\N	\N
174	174	\N	Authors:\nLysikov Yu.A. Candidate of Medical Sciences - Scientific consultant of the Representative Office of NSP in Moscow.\nNovikov A.F. - Scientific consultant of the Representative Office of the NSP company in Moscow, Senior researcher of the Department of Preventive Medicine of the RUDN.\nShaposhnikov V.A. is a urologist of the highest category, a member of the St. Petersburg Society of Urologists.	\N	\N	\N	\N	\N
175	175	\N	\N	\N	\N	\N	\N	\N
176	176	\N	A series of T-shirts with original prints in corporate style. High-quality cotton, classic cut.\nThe future starts today (sizes S, M, L, XL, XXL)\nCat wants Omega (sizes S, M, L, XL, XXL)\nI drank Chlorophyll. Came, saw, won (sizes M, L, XL, XXL)\nMy grandmother eats supplements (sizes S, M, L, XL, XXL)\nBremani is on me (sizes S, M, L, XL)\nComposition: 100% cotton.	\N	\N	\N	\N	\N
177	177	\N	The compact and lightweight pillbox is designed for packaging and storing tablets and capsules.\nIt consists of two compartments with cells (four and three, respectively) and one large compartment. The pillbox is convenient to use at home and on the road: with its help, you can easily control the daily intake of dietary supplements.\nMade of durable plastic.	\N	\N	\N	\N	\N
\.


--
-- Data for Name: product_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_points (product_point_id, product_id, points_outer, points_inner, points_discount) FROM stdin;
1	1	14.14	14.39	0
2	2	16.27	16.52	0
3	3	23.99	24.24	0
4	4	17.26	17.51	0
5	5	14.38	14.63	0
6	6	14.38	14.63	0
7	7	11.82	12.07	0
8	8	27.77	28.02	0
9	9	7.9	8.15	0
10	10	20.92	21.17	0
11	11	23.67	23.92	0
12	12	16.16	16.41	0
13	13	14.53	14.78	0
14	14	14.57	14.82	0
15	15	9	9.25	0
16	16	23.37	23.62	0
17	17	8.28	8.53	0
18	18	13.57	13.82	0
19	19	17.32	17.57	0
20	20	11.72	11.97	0
21	21	12.02	12.27	0
22	22	22.95	23.2	0
23	23	15.11	15.36	0
24	24	20.59	20.84	0
25	25	18.17	18.42	0
26	26	20.72	20.97	0
27	27	22.91	23.16	0
28	28	19.47	19.72	0
29	29	8.71	8.96	0
30	30	13.68	13.93	0
31	31	25.9	26.15	0
32	32	11.46	11.71	0
33	33	11.81	12.06	0
34	34	19.52	19.77	0
35	35	10.36	10.61	0
36	36	22.85	23.1	0
37	37	14.13	14.38	0
38	38	20.72	20.97	0
39	39	14.08	14.33	0
40	40	26.29	26.54	0
41	41	13.59	13.84	0
42	42	17.54	17.79	0
43	43	23.21	23.46	0
44	44	11.2	11.45	0
45	45	19.3	19.55	0
46	46	26.26	26.51	0
47	47	18.59	18.84	0
48	48	9.41	9.66	0
49	49	10.84	11.09	0
50	50	11.09	11.34	0
51	51	14.78	15.03	0
52	52	18.48	18.73	0
53	53	9.3	9.55	0
54	54	21.64	21.89	0
55	55	5.61	5.86	0
56	56	17.26	17.51	0
57	57	11.66	11.91	0
58	58	14.58	14.83	0
59	59	17	17.25	0
60	60	7.44	7.69	0
61	61	12.31	12.56	0
62	62	29.87	30.12	0
63	63	28.56	28.81	0
64	64	22.06	22.31	0
65	65	20.34	20.59	0
66	66	28.37	28.62	0
67	67	15.63	15.87	0
68	68	17.9	18.15	0
69	69	36.03	36.28	0
70	70	66.77	67.02	0
71	71	16.69	16.94	0
72	72	16.21	16.46	0
73	73	15.19	15.44	0
74	74	11.12	11.37	0
75	75	10.66	10.91	0
76	76	16.46	16.71	0
77	77	11.46	11.71	0
78	78	18.94	19.19	0
79	79	17.94	18.19	0
80	80	22.18	22.43	0
81	81	13.5	13.75	0
82	82	18.57	18.82	0
83	83	22.03	22.28	0
84	84	8.43	8.68	0
85	85	20.42	20.67	0
86	86	16.65	16.9	0
87	87	17.94	18.19	0
88	88	27.96	28.21	0
89	89	15.93	16.18	0
90	90	25.43	25.73	0
91	91	13.39	13.64	0
92	92	26.95	27.2	0
93	93	2.21	2.46	0
94	94	16.62	16.87	0
95	95	13.45	13.7	0
96	96	11.98	12.23	0
97	97	14.28	14.53	0
98	98	27.96	28.51	0
99	99	26.54	26.67	0
100	100	26.54	26.67	0
101	101	11.18	11.31	0
102	102	7.15	7.28	0
103	103	7.97	8.1	0
104	104	20.25	20.75	0
105	105	21.8	22.3	0
106	106	22.2	22.7	0
107	107	23.96	24.46	0
108	108	10.35	10.85	0
109	109	25.13	25.63	0
110	110	24.69	25.19	0
111	111	25.53	26.03	0
112	112	26.36	26.86	0
113	113	8.54	9.04	0
114	114	12.91	13.41	0
115	115	12.91	13.41	0
116	116	12.53	13.03	0
117	117	22.35	22.85	0
118	118	11.78	12.28	0
119	119	10.16	10.66	0
120	120	12.17	12.67	0
121	121	9.3	9.8	0
122	122	17.01	17.76	0
123	123	8.22	8.97	0
124	124	14.82	15.57	0
125	125	18.54	19.29	0
126	126	18.29	19.04	0
127	127	10.49	11.24	0
128	128	14.72	15.47	0
129	129	14.79	14.84	0
130	130	17.49	17.54	0
131	131	11.18	11.23	0
132	132	8.29	8.34	0
133	133	8.29	8.34	0
134	134	18.14	18.19	0
135	135	11.18	11.23	0
136	136	0	14.59	0
137	137	0	17.49	0
138	138	0	11.18	0
139	139	0	8.29	0
140	140	0	8.29	0
141	141	0	18.14	0
142	142	0	11.18	0
143	143	0	11.46	0
144	144	0	18.94	0
145	145	0	17.94	0
146	146	0	22.18	0
147	147	0	13.5	0
148	148	0	18.57	0
149	149	0	22.03	0
150	150	0	8.43	0
151	151	0	20.42	0
152	152	0	16.65	0
153	153	0	17.94	0
154	154	0	11.72	0
155	155	0	12.02	0
156	156	0	22.95	0
157	157	0	15.11	0
158	158	0	20.59	0
159	159	0	18.17	0
160	160	0	20.72	0
161	161	0	22.91	0
162	162	0	19.47	0
163	163	0	8.71	0
164	164	0	13.68	0
165	165	0	25.9	0
166	166	0	11.46	0
167	167	0	11.81	0
168	168	0	19.52	0
169	169	0	11.46	0
170	170	0	11.81	0
171	171	0	19.52	0
172	172	0	10.36	0
173	173	0	22.85	0
174	174	0	26.29	0
175	175	0	20.72	0
176	176	0	22.18	0
177	177	0	13.54	0
\.


--
-- Data for Name: product_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_price (product_price_id, product_id, diller_price, distr_price, wholesale_price, consumer_price) FROM stdin;
1	1	16.36	18	16.36	18
2	2	16.36	18	16.36	18
3	3	29.49	32.44	29.49	32.44
4	4	21.21	23.33	16.36	18
5	5	17.67	19.44	21.21	23.33
6	6	17.62	19.44	17.67	19.44
7	7	14.53	15.98	17.62	19.44
8	8	34.13	37.54	34.13	37.54
9	9	9.71	10.68	9.71	10.68
10	10	25.72	28.29	25.72	28.29
11	11	29.09	32	29.09	32
12	12	19.86	21.85	19.86	21.85
13	13	17.86	19.65	17.86	19.65
14	14	17.91	19.7	17.91	19.7
15	15	11.06	12.17	11.06	12.17
16	16	28.73	31.6	28.73	31.6
17	17	10.17	11.19	10.17	11.19
18	18	16.67	18.34	16.67	18.34
19	19	21.29	23.42	21.29	23.42
20	20	14.4	15.84	14.4	15.84
21	21	14.77	16.25	14.4	15.84
22	22	28.21	31.03	14.77	16.25
23	23	18.57	20.43	28.21	31.03
24	24	25.31	27.84	18.57	20.43
25	25	22.33	24.56	25.31	27.84
26	26	25.47	28.02	22.33	24.56
27	27	28.15	30.97	25.47	28.02
28	28	23.94	26.33	28.15	30.97
29	29	10.71	11.78	23.94	26.33
30	30	16.81	18.49	10.71	11.78
31	31	31.84	35.02	16.81	18.49
32	32	14.09	15.05	31.84	35.02
33	33	14.52	15.97	14.09	15.05
34	34	23.99	26.39	14.52	15.97
35	35	12.71	14.05	23.99	26.39
36	36	28.08	30.89	28.08	30.89
37	37	17.37	19.11	28.08	30.89
38	38	25.46	28.01	17.37	19.11
39	39	17.31	19.04	25.46	28.01
40	40	32.32	35.55	17.31	19.04
41	41	16.71	18.38	32.32	35.55
42	42	21.56	23.75	16.71	18.38
43	43	28.53	31.28	21.56	23.75
44	44	13.76	15.14	28.53	31.28
45	45	23.72	26.09	13.76	15.14
46	46	32.27	35.5	23.72	26.09
47	47	22.85	25.14	32.27	35.5
48	48	11.56	12.72	22.85	25.14
49	49	13.32	14.65	11.56	12.72
50	50	13.64	15.01	13.32	14.65
51	51	18.18	20.03	13.64	15.01
52	52	22.73	25.01	18.18	20.03
53	53	11.44	12.58	22.73	25.01
54	54	26.6	29.26	11.44	12.58
55	55	6.9	7.59	26.6	29.26
56	56	21.21	23.33	6.9	7.59
57	57	14.33	15.76	21.21	23.33
58	58	17.92	19.71	14.33	15.76
59	59	20.9	22.99	17.92	19.71
60	60	9.15	10.06	20.9	22.99
61	61	15.13	16.64	9.15	10.06
62	62	36.72	40.39	15.13	16.64
63	63	35.1	38.61	36.72	40.39
64	64	27.11	29.82	35.1	38.61
65	65	25	27.5	27.11	29.82
66	66	34.86	38.35	25	27.5
67	67	19.21	21.13	34.86	38.35
68	68	22	24.2	19.21	21.13
69	69	44.28	48.71	22	24.2
70	70	82.06	90.27	44.28	48.71
71	71	20.52	22.57	82.06	90.27
72	72	19.93	21.92	20.52	22.57
73	73	18.67	20.54	19.93	21.92
74	74	13.66	15.03	19.93	21.92
75	75	13.1	14.41	13.66	15.03
76	76	20.24	22.26	13.1	14.41
77	77	14.09	15.5	20.24	22.26
78	78	23.28	25.61	14.09	15.5
79	79	22.05	24.26	23.28	25.61
80	80	27.26	29.99	22.05	24.26
81	81	16.59	18.25	27.26	29.99
82	82	22.83	25.11	16.59	18.25
83	83	27.08	29.79	22.83	25.11
84	84	10.36	11.4	27.08	29.79
85	85	25.1	27.61	10.36	11.4
86	86	20.46	22.51	25.1	27.61
87	87	22.05	24.21	20.46	22.51
88	88	34.36	37.8	22.05	24.21
89	89	19.58	21.51	34.36	37.8
90	90	31.32	34.48	19.58	21.51
91	91	16.46	18.11	31.32	34.48
92	92	33.13	34.44	16.46	18.11
93	93	2.72	2.99	33.13	34.44
94	94	20.43	22.47	2.72	2.99
95	95	16.54	18.49	20.43	22.47
96	96	14.73	16.2	16.54	18.49
97	97	17.55	19.31	14.73	16.2
98	98	34.36	37.8	17.55	19.31
99	99	32.62	35.88	32.62	35.88
100	100	32.62	35.88	13.75	15.12
101	101	13.75	15.12	32.62	35.88
102	102	8.79	9.67	13.75	15.12
103	103	8.79	10.27	8.79	9.67
104	104	24.89	27.38	13.75	15.12
105	105	26.8	29.48	8.79	9.67
106	106	27.28	30.01	24.89	27.38
107	107	29.45	32.4	26.8	29.48
108	108	12.72	13.99	27.28	30.01
109	109	30.89	33.98	29.45	32.4
110	110	30.35	33.37	12.72	13.99
111	111	31.38	34.52	30.89	33.98
112	112	32.4	35.64	31.38	34.52
113	113	10.49	11.54	31.38	34.52
114	114	15.87	17.46	32.4	35.64
115	115	15.87	17.46	15.87	17.46
116	116	15.4	16.94	15.87	17.46
117	117	27.47	30.22	15.4	16.94
118	118	14.48	15.93	27.47	30.22
119	119	12.48	13.73	14.48	15.93
120	120	14.95	16.45	12.48	13.73
121	121	11.43	12.57	14.95	16.45
122	122	20.91	23.01	14.95	16.45
123	123	10.1	11.11	11.43	12.57
124	124	18.22	20.04	14.48	15.93
125	125	22.79	24.07	18.22	20.04
126	126	22.48	24.73	22.79	24.07
127	127	12.89	14.18	22.48	24.73
128	128	18.09	19.9	12.89	14.18
129	129	18.17	19.99	11.43	12.57
130	130	21.49	23.64	18.17	19.99
131	131	13.75	15.12	21.49	23.64
132	132	10.19	11.21	13.75	15.12
133	133	10.19	11.21	21.49	23.64
134	134	22.3	24.53	22.48	24.73
135	135	12.48	13.73	18.17	19.99
136	136	13.78	15.12	12.48	13.73
137	137	23.29	25.62	13.78	15.12
138	138	7	8.64	23.29	25.62
139	139	11.11	13.64	12.48	13.73
140	140	11.67	14.35	23.29	25.62
141	141	11.67	14.35	11.11	13.64
142	142	12.15	14.94	11.67	14.35
143	143	12.15	14.94	12.15	14.94
144	144	10.73	13.19	12.15	14.94
145	145	12.4	15.09	10.73	13.19
146	146	12.4	15.09	10.73	13.19
147	147	13.22	16.35	12.4	15.09
148	148	13.22	16.35	13.22	16.35
149	149	13.22	16.35	12.15	14.94
150	150	16.27	20	13.22	16.35
151	151	16.27	20	16.27	20
152	152	16.27	20	16.27	20
153	153	16.27	20	16.27	20
154	154	16.27	20	16.27	20
155	155	12.56	15.45	16.27	20
156	156	15.31	18.93	12.56	15.45
157	157	15.31	18.93	12.56	15.45
158	158	15.31	18.93	15.31	18.93
159	159	15.31	18.93	16.27	20
160	160	15.31	18.93	12.56	15.45
161	161	15.31	16.45	16.27	20
162	162	14.14	12.75	15.31	16.45
163	163	14.14	18.93	14.14	12.75
164	164	14.14	17.49	14.14	18.93
165	165	12.93	17.49	14.14	17.49
166	166	14.14	17.49	14.14	17.49
167	167	14.14	15.91	12.93	17.49
168	168	12.93	17.49	14.14	15.91
169	169	15.31	17.49	12.93	17.49
170	170	14.14	15.91	15.31	17.49
171	171	14.14	18.93	14.14	15.91
172	172	16.27	17.49	14.14	18.93
173	173	16.27	17.43	16.27	17.49
174	174	15.18	20.1	14.14	18.93
175	175	12.56	20.3	16.27	17.43
176	176	14.14	15.46	16.27	17.42
177	177	16.27	17.42	14.14	15.46
\.


--
-- Data for Name: product_rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_rating (product_rating_id, product_id, rating_5, votes_number_5) FROM stdin;
1	1	3.75	15
2	2	4.21	12
3	3	4.32	10
4	4	4.59	26
5	5	4.75	17
6	6	3.99	18
7	7	4.86	26
8	8	4.51	45
9	9	4.67	12
10	10	3.85	8
11	11	3.94	45
12	12	4.58	13
13	13	4.97	14
14	14	4.26	23
15	15	4.51	14
16	16	3.74	120
17	17	4.96	5
18	18	4.32	12
19	19	4.57	12
20	20	5	3
21	21	4.5	78
22	22	4.44	45
23	23	4.59	12
24	24	4.87	49
25	25	4.61	56
26	26	4.63	12
27	27	4.88	47
28	28	4.05	68
29	29	4.89	54
30	30	4.6	29
31	31	4.89	34
32	32	4.51	87
33	33	4.32	96
34	34	4.93	36
35	35	4.25	58
36	36	4.81	57
37	37	4.51	68
38	38	4.63	94
39	39	4.58	57
40	40	4.98	63
41	41	4.57	26
42	42	4.34	59
43	43	4.78	87
44	44	3.78	13
45	45	4.51	48
46	46	4.92	75
47	47	4.65	10
48	48	4.57	9
49	49	4.62	34
50	50	4.84	2
51	51	4.87	68
52	52	4.32	47
53	53	4.24	48
54	54	3.97	27
55	55	4.96	31
56	56	4.57	13
57	57	4.68	2
58	58	4.85	68
59	59	4.57	67
60	60	4.96	10
61	61	4.97	9
62	62	4.68	16
63	63	4.87	18
64	64	4.67	16
65	65	4.98	24
66	66	4.91	34
67	67	4.94	13
68	68	4.93	45
69	69	4.97	26
70	70	4.68	37
71	71	4.38	24
72	72	4.31	10
73	73	4.36	10
74	74	4.58	18
75	75	4.87	16
76	76	4.52	51
77	77	4.53	34
78	78	4.38	57
79	79	4.95	34
80	80	4.67	29
81	81	4.62	68
82	82	4.85	67
83	83	4.61	54
84	84	4.69	94
85	85	4.48	31
86	86	4.35	35
87	87	4.67	28
88	88	4.85	34
89	89	4.98	67
90	90	4.87	62
91	91	4.61	29
92	92	4.63	37
93	93	4.67	28
94	94	4.69	61
95	95	4.87	27
96	96	4.96	4
97	97	4.87	37
98	98	4.37	58
99	99	4.56	37
100	100	4.58	32
101	101	3.99	100
102	102	4.89	18
103	103	4.76	48
104	104	3.87	26
105	105	4.59	34
106	106	4.68	57
107	107	4.79	68
108	108	4.78	61
109	109	4.73	39
110	110	4.59	26
111	111	4.89	37
112	112	4.86	84
113	113	4.57	51
114	114	4.38	39
115	115	4.69	67
116	116	4.76	54
117	117	4.81	92
118	118	4.89	30
119	119	4.87	37
120	120	4.65	18
121	121	4.97	67
122	122	4.7	39
123	123	4.8	48
124	124	4.98	67
125	125	4.68	24
126	126	4.19	26
127	127	4.37	37
128	128	4.69	67
129	129	4.87	64
130	130	4.67	95
131	131	4.96	52
132	132	4.38	53
133	133	4.97	54
134	134	3.97	59
135	135	4.69	67
136	136	4.98	61
137	137	4.68	52
138	138	4.79	67
139	139	4.59	63
140	140	4.89	69
141	141	4.98	94
142	142	4.58	51
143	143	4.38	36
144	144	4.18	61
145	145	4.95	31
146	146	4.87	57
147	147	4.68	48
148	148	4.57	26
149	149	4.69	27
150	150	4.87	59
151	151	4.19	86
152	152	4.28	54
153	153	4.62	67
154	154	4.76	96
155	155	4.26	34
156	156	4.38	57
157	157	4.59	57
158	158	5	63
159	159	4.28	13
160	160	4.37	18
161	161	4.28	29
162	162	4.39	56
163	163	5	10
164	164	4.25	75
165	165	4.25	62
166	166	4.37	38
167	167	4.22	67
168	168	4.68	39
169	169	4.15	96
170	170	4.89	67
171	171	4.57	34
172	172	4.26	67
173	173	4.87	54
174	174	4.86	67
175	175	4.95	31
176	176	4.87	61
177	177	4.58	37
\.


--
-- Data for Name: product_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_size (product_size_id, product_id, weight_g, length_cm, width_cm, height_cm, packing_material_id) FROM stdin;
1	1	156	8.2	9.54	12.58	1
2	2	451	8.5	10.35	13.62	1
3	3	745	9.1	9.87	17.52	1
4	4	456	10.5	10.25	10.38	1
5	5	123	7.9	9.84	9.85	1
6	6	423	5.8	10.59	14.67	1
7	7	154	7.15	12.57	15.63	1
8	8	523	8.9	9.84	18.52	1
9	9	678	8.79	10.56	19.87	1
10	10	412	10.85	9.84	20.34	1
11	11	451	15.8	13.57	18.75	1
12	12	745	9.5	9.56	13.62	1
13	13	321	8.6	8.57	17.52	1
14	14	843	7.96	9.84	19.64	1
15	15	543	6.38	9.27	10.58	1
16	16	713	9.54	14.57	20.38	1
17	17	524	8.57	13.57	16.52	1
18	18	123	9.67	24.13	18.96	1
19	19	154	8.56	13.45	17.62	1
20	20	167	9.64	10.84	12.85	1
21	21	176	9.53	11.92	10.84	1
22	22	765	9.87	12.52	10.67	1
23	23	543	9.67	13.52	17.52	1
24	24	567	6.53	9.51	16.52	1
25	25	154	12.35	10.35	10.98	1
26	26	165	13.58	12.57	9.85	1
27	27	435	14.56	9.57	8.53	1
28	28	167	9.87	10.57	9.64	1
29	29	189	8.63	13.2	10.68	1
30	30	325	9.54	16.4	15.86	1
31	31	256	6.57	12.67	10.62	1
32	32	315	5.68	12.54	13.57	1
33	33	256	6.98	16.57	9.68	1
34	34	278	8.95	13.54	10.26	1
35	35	289	9.87	16.24	12.85	1
36	36	341	6.87	13.54	9.62	1
37	37	242	8.56	14.24	10.63	1
38	38	265	9.87	13.51	15.46	1
39	39	135	6.57	13.24	13.35	1
40	40	167	8.95	10.52	10.98	1
41	41	452	8.62	13.57	9.95	1
42	42	351	9.57	19.23	9.84	1
43	43	675	6.52	10.57	10.85	1
44	44	412	6.57	12.57	11.65	1
45	45	532	9.87	15.48	13.65	1
46	46	732	10.56	10.97	11.35	1
47	47	713	12.59	9.23	10.35	1
48	48	231	17.56	9.87	11.96	1
49	49	451	12.58	8.67	15.62	1
50	50	132	13.57	9.87	18.52	1
51	51	156	12.98	10.57	15.24	1
52	52	532	23.57	12.57	13.52	1
53	53	413	24.58	13.57	14.3	1
54	54	316	12.57	18.41	18.52	1
55	55	732	13.56	13.95	9.62	1
56	56	832	12.54	10.85	9.65	1
57	57	513	9.87	9.62	14.52	1
58	58	513	12.57	10.57	14.52	1
59	59	213	16.57	9.67	14.86	1
60	60	631	15.89	12.8	9.67	1
61	61	523	13.57	10.62	12.53	1
62	62	734	16.84	13.52	9.62	1
63	63	312	13.57	10.55	8.75	1
64	64	634	12.57	13.62	13.52	1
65	65	832	13.57	10.94	23.85	1
66	66	312	13.5	9.67	19.62	1
67	67	412	18.74	8.63	15.75	1
68	68	412	16.5	8.63	18.62	1
69	69	554	16.54	9.86	15.78	1
70	70	613	13.57	10.36	20.35	1
71	71	534	16.53	16.85	13.56	1
72	72	743	14.53	16.53	14.53	1
73	73	845	18.93	9.57	18.75	1
74	74	945	17.53	13.5	14.53	1
75	75	312	18.52	10.35	12.53	1
76	76	534	16.52	12.52	14.53	1
77	77	312	18.94	13.68	12.53	1
78	78	512	19.4	10.63	17.58	1
79	79	123	18.43	13.59	16.94	1
80	80	145	16.57	10.35	13.52	1
81	81	323	19.54	12.66	10.63	1
82	82	642	16.54	15.82	9.85	1
83	83	645	9.62	14.59	8.62	1
84	84	125	18.6	13.52	9.62	1
85	85	632	16.5	10.63	11.94	1
86	86	734	12.5	9.64	13.57	1
87	87	412	9.84	16.57	18.53	1
88	88	523	9.86	19.54	19.62	1
89	89	612	8.62	14.56	13.57	1
90	90	423	12.34	13.95	19.56	1
91	91	534	9.84	15.82	17.42	1
92	92	613	9.63	16.32	15.3	1
93	93	732	13.54	17.52	16.37	1
94	94	164	15.37	12.34	19.52	1
95	95	189	9.56	12.53	13.6	1
96	96	284	8.76	16.82	14.52	1
97	97	183	12.35	16.92	15.8	1
98	98	187	13.57	17.82	19.63	1
99	99	167	12.59	13.57	15.2	1
100	100	189	8.95	16.59	16.37	1
101	101	176	14.52	14.52	14.58	1
102	102	198	9.87	10.96	10.96	1
103	103	321	18.53	14.52	9.82	1
104	104	523	8.53	10.35	8.52	1
105	105	632	17.59	13.57	9.6	1
106	106	715	13.57	15.26	18.52	1
107	107	482	9.67	10.96	13.52	1
108	108	369	13.59	11.59	9.57	1
109	109	414	12.35	12.57	10.62	1
110	110	713	16.59	16.96	8.57	1
111	111	234	15.86	14.58	9.68	1
112	112	436	17.59	10.63	10.58	1
113	113	327	14.59	18.59	9.63	1
114	114	438	13.6	13.57	10.57	1
115	115	614	15.63	14.5	11.52	1
116	116	437	17.53	13.57	16.58	1
117	117	513	14.23	14.57	12.37	1
118	118	623	9.82	10.57	18.53	1
119	119	743	9.84	9.68	10.68	1
120	120	645	11.23	10.63	9.67	1
121	121	342	10.59	18.92	9.82	1
122	122	425	9.85	12.58	10.56	1
123	123	341	9.84	10.85	11.23	1
124	124	624	10.23	16.53	9.86	1
125	125	613	14.59	13.58	15.82	1
126	126	425	15.96	13.62	16.38	1
127	127	614	12.59	9.37	15.92	1
128	128	845	11.25	12.35	8.52	1
129	129	635	9.85	9.65	10.63	1
130	130	523	8.52	10.62	9.57	1
131	131	452	10.26	13.58	16.57	1
132	132	632	13.52	14.62	23.28	1
133	133	714	14.53	18.59	10.59	1
134	134	243	9.84	12.53	14.85	1
135	135	531	8.53	16.53	8.57	1
136	136	468	10.25	16.58	12.37	3
137	137	132	8.56	10.56	15.98	3
138	138	526	6.35	9.56	16.83	3
139	139	289	8.95	8.75	17.52	3
140	140	256	9.52	13.59	14.86	3
141	141	268	8.42	14.62	11.96	3
142	142	265	12.4	13.25	10.57	3
143	143	289	16.5	11.45	9.62	3
144	144	275	17.5	18.32	14.57	3
145	145	289	18.56	14.57	12.32	3
146	146	348	19.5	13.62	16.55	3
147	147	289	15.2	10.62	10.96	3
148	148	295	12.3	13.52	11.58	3
149	149	304	14.56	13.57	19.86	3
150	150	342	15.9	14.53	16.52	3
151	151	581	13.56	16.59	17.63	3
152	152	412	14.23	13.58	19.54	3
153	153	823	9.82	14.3	10.52	3
154	154	523	11.56	18.74	8.75	3
155	155	461	16.54	19.63	13.62	3
156	156	348	17.85	14.68	18.78	3
157	157	362	12.56	19.62	16.38	3
158	158	382	15.63	13.58	14.76	3
159	159	264	12.98	18.96	13.26	3
160	160	189	10.85	17.85	14.87	3
161	161	342	9.67	10.95	16.37	3
162	162	189	11.35	13.62	14.57	3
163	163	236	14.59	9.67	18.92	3
164	164	278	15.89	10.58	12.53	3
165	165	415	13.57	11.55	15.31	3
166	166	342	15.89	13.57	12.56	3
167	167	536	9.87	19.68	14.84	3
168	168	821	10.65	20.5	21.4	3
169	169	354	12.57	13.58	10.62	3
170	170	385	11.63	11.62	9.82	3
171	171	451	14.59	10.67	10.32	3
172	172	342	19.54	9.62	11.52	3
173	173	241	13.51	10.85	11.75	3
174	174	298	10.52	11.62	16.53	3
175	175	351	19.8	13.58	10.56	3
176	176	891	10.25	17.52	11.56	3
177	177	567	13.54	10.67	10.63	3
\.


--
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_type (product_type_id, name, abbr, description) FROM stdin;
1	Dietary Supplement	\N	A product that provides additional nutrients to supplement one's diet
2	Medicine	\N	A substance or preparation used for treating or preventing diseases or medical conditions
3	Gel	\N	A semisolid substance with a gel-like consistency
4	Lotion	\N	A liquid or cream applied to the skin for moisturizing or medicinal purposes
5	Oil	\N	A viscous liquid substance that is often used for cooking, skincare, or lubrication
6	Toothpaste	\N	A paste or gel used with a toothbrush for cleaning and maintaining oral hygiene
7	Balsam	\N	A soothing and healing substance, often used for skin or hair care
8	Tonic	\N	A refreshing and invigorating liquid used for skincare or haircare
9	Cream	\N	A thick, smooth-textured substance applied to the skin for moisturizing or medicinal purposes
10	Face mask	\N	A skincare product applied to the face for various purposes, such as cleansing, hydrating, or rejuvenating
11	Shampoo	\N	A liquid or gel used for cleaning and conditioning the hair
12	Conditioner	\N	A product applied to the hair after shampooing to improve its manageability and appearance
13	Shower gel	\N	A liquid soap or cleanser used for cleansing the body during a shower
14	Body milk	\N	A moisturizing lotion or cream specifically formulated for the body
15	Serum	\N	A concentrated skincare product that delivers active ingredients to the skin
16	Scrub	\N	A product used for exfoliating and removing dead skin cells
17	Deodorant	\N	A product applied to the body to prevent or mask body odor
18	Lip gloss	\N	A cosmetic product that adds shine and color to the lips
19	Powder for makeup	\N	A finely ground cosmetic powder used for setting makeup or creating a matte finish
20	Blush	\N	A cosmetic product applied to the cheeks to add color and create a youthful appearance
21	Powder Eyebrow Pencil	\N	A cosmetic pencil used for filling in and shaping eyebrows
22	Lip Pencil	\N	A cosmetic pencil used for outlining and defining the lips
23	Booklet	\N	A small printed publication containing information or promotional material
24	Brochure	\N	A small booklet or pamphlet providing information about a product or service
25	Notepad	\N	A small pad of paper used for writing notes or memos
26	Book	\N	A written or printed work consisting of pages bound together
27	T-shirt	\N	A short-sleeved shirt typically made of cotton and worn as casual attire
28	Pillbox	\N	A small container for storing and organizing pills or medication
\.


--
-- Data for Name: purchase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase (purchase_id, customer_id, employee_id, shop_id, date, "time") FROM stdin;
\.


--
-- Data for Name: purchase_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_details (purchase_details_id, purchase_id, products, items_total, unique_items, bonus_value) FROM stdin;
\.


--
-- Data for Name: purchase_params; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_params (purchase_params_id, purchase_id, length_cm, width_cm, height_cm, weight_kg) FROM stdin;
\.


--
-- Data for Name: purchase_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_payment (purchase_payment_id, purchase_id, sum, payment_type_id, currency_id) FROM stdin;
\.


--
-- Data for Name: purchase_ship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_ship (purchase_ship_id, purchase_id, shipper_id, invoice_num, shipping_type_id) FROM stdin;
\.


--
-- Data for Name: purchase_ship_addr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_ship_addr (purchase_ship_addr_id, purchase_id, country_id, region, city_id, street, building, appartment, floor, entrance, has_fence, postal_code) FROM stdin;
\.


--
-- Data for Name: shipper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipper (shipper_id, name, country_id) FROM stdin;
1	CDEK	2
\.


--
-- Data for Name: shipper_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipper_contacts (shipper_contacts_id, shipper_id, name, phone, email, website) FROM stdin;
1	1	Sophy Latour	4(398)456-19-44	cdek-support@yandex.ru	cdek.com
\.


--
-- Data for Name: shipping_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_type (shipping_type_id, name, abbr, description) FROM stdin;
1	Door-Door	DD	From Door of the shop To Door of the customer
2	Point-Point	PP	From shipper Point To shipper Point
3	Door-Point	DP	From Door of the shop To shipper Point
4	Point-Door	PD	From shipper Point To Door of the customer
\.


--
-- Data for Name: shop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop (shop_id, admin_id, rating) FROM stdin;
1	1	\N
2	3	\N
\.


--
-- Data for Name: shop_addr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_addr (shop_addr_id, shop_id, country_id, region, city_id, street, building, appartment, floor, entrance, has_fence, postal_code) FROM stdin;
1	1	1	\N	1	Agtes	152a	56	43	C	f	33597
2	2	1	\N	1	Hytroin	45	89	34	A	f	58476
\.


--
-- Data for Name: shop_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_contacts (shop_contacts_id, shop_id, phone, email) FROM stdin;
1	1	8(123)576-98-01	textme@email.com
2	2	8(876)201-05-66	textmeto@gmail.com
\.


--
-- Data for Name: shop_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_payment (shop_payment_id, shop_id, salary_mod, bonus_mod, salary_day, collection_day) FROM stdin;
1	1	1	1	15	17
2	2	1	1	16	20
\.


--
-- Data for Name: shop_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_product (shop_product_id, shop_id, product_id, units_in_stock) FROM stdin;
1	1	1	157
2	1	2	214
3	1	3	171
4	1	4	154
5	1	5	187
6	1	6	167
7	1	7	198
8	1	8	162
9	1	9	214
10	1	10	194
11	1	11	241
12	1	12	165
13	1	13	174
14	1	14	158
15	1	15	198
16	1	16	162
17	1	17	140
18	1	18	174
19	1	19	185
20	1	20	174
21	1	21	213
22	1	22	165
23	1	23	184
24	1	24	124
25	1	25	184
26	1	26	175
27	1	27	124
28	1	28	167
29	1	29	187
30	1	30	189
31	1	31	164
32	1	32	158
33	1	33	241
34	1	34	275
35	1	35	168
36	1	36	124
37	1	37	184
38	1	38	214
39	1	39	157
40	1	40	192
41	1	41	162
42	1	42	184
43	1	43	158
44	1	44	197
45	1	45	167
46	1	46	148
47	1	47	162
48	1	48	187
49	1	49	199
50	1	50	196
51	1	51	162
52	1	52	183
53	1	53	176
54	1	54	199
55	1	55	174
56	1	56	134
57	1	57	196
58	1	58	243
59	1	59	244
60	1	60	256
61	1	61	218
62	1	62	216
63	1	63	213
64	1	64	255
65	1	65	248
66	1	66	246
67	1	67	257
68	1	68	259
69	1	69	263
70	1	70	143
71	1	71	257
72	1	72	155
73	1	73	148
74	1	74	163
75	1	75	311
76	1	76	145
77	1	77	167
78	1	78	143
79	1	79	150
80	1	80	168
81	1	81	158
82	1	82	163
83	1	83	180
84	1	84	197
85	1	85	143
86	1	86	182
87	1	87	150
88	1	88	176
89	1	89	184
90	1	90	130
91	1	91	213
92	1	92	218
93	1	93	164
94	1	94	284
95	1	95	265
96	1	96	213
97	1	97	257
98	1	98	315
99	1	99	25
100	1	100	59
101	1	101	67
102	1	102	29
103	1	103	34
104	1	104	56
105	1	105	48
106	1	106	39
107	1	107	67
108	1	108	14
109	1	109	89
110	1	110	62
111	1	111	58
112	1	112	39
113	1	113	46
114	1	114	50
115	1	115	29
116	1	116	37
117	1	117	48
118	1	118	62
119	1	119	79
120	1	120	82
121	1	121	37
122	1	122	53
123	1	123	28
124	1	124	37
125	1	125	39
126	1	126	61
127	1	127	68
128	1	128	34
129	1	129	57
130	1	130	68
131	1	131	43
132	1	132	39
133	1	133	42
134	1	134	48
135	1	135	62
136	1	136	29
137	1	137	26
138	1	138	37
139	1	139	64
140	1	140	79
141	1	141	86
142	1	142	81
143	1	143	59
144	1	144	60
145	1	145	48
146	1	146	62
147	1	147	38
148	1	148	57
149	1	149	64
150	1	150	12
151	1	151	84
152	1	152	52
153	1	153	81
154	1	154	16
155	1	155	52
156	1	156	59
157	1	157	67
158	1	158	84
159	1	159	69
160	1	160	43
161	1	161	56
162	1	162	5
163	1	163	19
164	1	164	63
165	1	165	67
166	1	166	59
167	1	167	43
168	1	168	59
169	1	169	57
170	1	170	68
171	1	171	49
172	1	172	68
173	1	173	59
174	1	174	43
175	1	175	57
176	1	176	18
177	1	177	59
178	2	1	59
179	2	2	67
180	2	3	53
181	2	4	84
182	2	5	71
183	2	6	68
184	2	7	84
185	2	8	67
186	2	9	89
187	2	10	75
188	2	11	61
189	2	12	87
190	2	13	64
191	2	14	95
192	2	15	67
193	2	16	58
194	2	17	57
195	2	18	56
196	2	19	54
197	2	20	58
198	2	21	55
199	2	22	52
200	2	23	91
201	2	24	83
202	2	25	76
203	2	26	56
204	2	27	76
205	2	28	75
206	2	29	62
207	2	30	54
208	2	31	98
209	2	32	68
210	2	33	59
211	2	34	67
212	2	35	77
213	2	36	66
214	2	37	69
215	2	38	55
216	2	39	56
217	2	40	51
218	2	41	50
219	2	42	80
220	2	43	86
221	2	44	57
222	2	45	64
223	2	46	74
224	2	47	76
225	2	48	63
226	2	49	59
227	2	50	67
228	2	51	68
229	2	52	59
230	2	53	57
231	2	54	64
232	2	55	68
233	2	56	94
234	2	57	87
235	2	58	86
236	2	59	82
237	2	60	76
238	2	61	72
239	2	62	75
240	2	63	74
241	2	64	81
242	2	65	86
243	2	66	89
244	2	67	84
245	2	68	61
246	2	69	67
247	2	70	92
248	2	71	94
249	2	72	73
250	2	73	96
251	2	74	42
252	2	75	84
253	2	76	69
254	2	77	88
255	2	78	94
256	2	79	97
257	2	80	61
258	2	81	68
259	2	82	84
260	2	83	76
261	2	84	89
262	2	85	94
263	2	86	86
264	2	87	76
265	2	88	65
266	2	89	69
267	2	90	74
268	2	91	86
269	2	92	81
270	2	93	89
271	2	94	63
272	2	95	72
273	2	96	74
274	2	97	76
275	2	98	45
276	2	99	43
277	2	100	17
278	2	101	29
279	2	102	34
280	2	103	35
281	2	104	27
282	2	105	26
283	2	106	25
284	2	107	34
285	2	108	38
286	2	109	39
287	2	110	44
288	2	111	42
289	2	112	18
290	2	113	19
291	2	114	34
292	2	115	38
293	2	116	19
294	2	117	25
295	2	118	29
296	2	119	38
297	2	120	37
298	2	121	35
299	2	122	43
300	2	123	42
301	2	124	47
302	2	125	35
303	2	126	39
304	2	127	18
305	2	128	16
306	2	129	17
307	2	130	16
308	2	131	24
309	2	132	29
310	2	133	42
311	2	134	44
312	2	135	47
313	2	136	16
314	2	137	24
315	2	138	28
316	2	139	43
317	2	140	40
318	2	141	16
319	2	142	18
320	2	143	19
321	2	144	34
322	2	145	38
323	2	146	36
324	2	147	42
325	2	148	26
326	2	149	27
327	2	150	25
328	2	151	20
329	2	152	19
330	2	153	17
331	2	154	16
332	2	155	25
333	2	156	49
334	2	157	47
335	2	158	40
336	2	159	43
337	2	160	46
338	2	161	35
339	2	162	38
340	2	163	34
341	2	164	31
342	2	165	38
343	2	166	39
344	2	167	36
345	2	168	33
346	2	169	26
347	2	170	24
348	2	171	28
349	2	172	25
350	2	173	27
351	2	174	35
352	2	175	31
353	2	176	18
354	2	177	15
\.


--
-- Data for Name: shop_renter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_renter (shop_renter_id, shop_id, name, contact_name, contact_phone, contact_email, rent_start_date, rent_termintaion_date, payment_day, payment_account, payment_sum, currency_id) FROM stdin;
1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	2	Renter Company	Jim Gordon	8(478)984-31-12	touchme@yandex.ru	2020-10-24	2025-10-24	18	123876187263481	5324	1
\.


--
-- Data for Name: shop_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_schedule (shop_schedule_id, shop_id, open_time, close_time) FROM stdin;
1	1	\N	\N
2	2	11:00:00	19:00:00
\.


--
-- Data for Name: shop_security; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_security (shop_security_id, shop_id, keys_num, is_protected, security_phone) FROM stdin;
1	1	\N	t	671312736
2	2	2	t	671312736
\.


--
-- Data for Name: shop_staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_staff (shop_staff_id, shop_id, staff_total_min, staff_total_max, staff_total_current, staff_shift_min, staff_shift_max, staff_shift_current) FROM stdin;
1	1	1	1000000	2	1	1000000	2
2	2	5	9	7	3	5	4
\.


--
-- Data for Name: shop_statistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_statistics (shop_statistics_id, shop_id, income_total, purchase_total) FROM stdin;
1	1	0	0
2	2	0	0
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (supplier_id, name, company_id) FROM stdin;
1	NSP Moscow	1
2	PSN Total	2
\.


--
-- Data for Name: supplier_addr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier_addr (supplier_addr_id, supplier_id, country_id, region, city_id) FROM stdin;
1	1	2	\N	2
2	2	1	\N	1
\.


--
-- Data for Name: supplier_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier_contacts (supplier_contacts_id, supplier_id, name, phone, email, website) FROM stdin;
1	1	Michail Narenkov	8(321)456-98-01	contact-us@natr.ru	natr.ru
2	2	Daniel Markov	8(467)351-56-81	contact-us@gmail.com	psn-total.com
\.


--
-- Name: brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_brand_id_seq', 11, true);


--
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_city_id_seq', 4, true);


--
-- Name: color_schema_color_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.color_schema_color_schema_id_seq', 3, true);


--
-- Name: company_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_company_id_seq', 2, true);


--
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_country_id_seq', 4, true);


--
-- Name: currency_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_currency_id_seq', 4, true);


--
-- Name: customer_bio_customer_bio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_bio_customer_bio_id_seq', 20, true);


--
-- Name: customer_contacts_customer_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_contacts_customer_contacts_id_seq', 20, true);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 20, true);


--
-- Name: customer_outer_distr_customer_outer_distr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_outer_distr_customer_outer_distr_id_seq', 20, true);


--
-- Name: customer_preferences_customer_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_preferences_customer_preferences_id_seq', 20, true);


--
-- Name: customer_ship_addr_customer_ship_addr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_ship_addr_customer_ship_addr_id_seq', 20, true);


--
-- Name: customer_statistics_customer_statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_statistics_customer_statistics_id_seq', 20, true);


--
-- Name: employee_access_level_employee_access_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_access_level_employee_access_level_id_seq', 1, true);


--
-- Name: employee_addr_liv_employee_addr_liv_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_addr_liv_employee_addr_liv_id_seq', 4, true);


--
-- Name: employee_addr_reg_employee_addr_reg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_addr_reg_employee_addr_reg_id_seq', 4, true);


--
-- Name: employee_bio_employee_bio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_bio_employee_bio_id_seq', 4, true);


--
-- Name: employee_contacts_employee_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_contacts_employee_contacts_id_seq', 4, true);


--
-- Name: employee_contract_type_employee_contract_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_contract_type_employee_contract_type_id_seq', 10, true);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 4, true);


--
-- Name: employee_hire_data_employee_hire_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_hire_data_employee_hire_data_id_seq', 4, true);


--
-- Name: employee_payment_employee_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_payment_employee_payment_id_seq', 4, true);


--
-- Name: employee_position_employee_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_position_employee_position_id_seq', 10, true);


--
-- Name: employee_preferences_employee_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_preferences_employee_preferences_id_seq', 4, true);


--
-- Name: employee_shift_employee_shift_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_shift_employee_shift_id_seq', 4, true);


--
-- Name: employee_specific_employee_specific_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_specific_employee_specific_id_seq', 4, true);


--
-- Name: employee_state_employee_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_state_employee_state_id_seq', 4, true);


--
-- Name: employee_status_employee_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_status_employee_status_id_seq', 7, true);


--
-- Name: exchange_rate_exchange_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exchange_rate_exchange_rate_id_seq', 3, true);


--
-- Name: family_status_family_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.family_status_family_status_id_seq', 14, true);


--
-- Name: gender_gender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gender_gender_id_seq', 3, true);


--
-- Name: language_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.language_language_id_seq', 4, true);


--
-- Name: measure_unit_measure_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.measure_unit_measure_unit_id_seq', 3, true);


--
-- Name: packing_material_packing_material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packing_material_packing_material_id_seq', 3, true);


--
-- Name: payment_type_payment_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_type_payment_type_id_seq', 3, true);


--
-- Name: post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_post_id_seq', 100, true);


--
-- Name: product_category_product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_product_category_id_seq', 8, true);


--
-- Name: product_data_product_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_data_product_data_id_seq', 177, true);


--
-- Name: product_form_product_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_form_product_form_id_seq', 10, true);


--
-- Name: product_info_product_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_info_product_info_id_seq', 177, true);


--
-- Name: product_points_product_point_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_points_product_point_id_seq', 198, true);


--
-- Name: product_price_product_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_price_product_price_id_seq', 177, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 177, true);


--
-- Name: product_rating_product_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_rating_product_rating_id_seq', 177, true);


--
-- Name: product_size_product_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_size_product_size_id_seq', 177, true);


--
-- Name: product_type_product_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_type_product_type_id_seq', 28, true);


--
-- Name: purchase_details_purchase_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_details_purchase_details_id_seq', 1, false);


--
-- Name: purchase_params_purchase_params_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_params_purchase_params_id_seq', 1, false);


--
-- Name: purchase_payment_purchase_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_payment_purchase_payment_id_seq', 1, false);


--
-- Name: purchase_purchase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_purchase_id_seq', 1, false);


--
-- Name: purchase_ship_addr_purchase_ship_addr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_ship_addr_purchase_ship_addr_id_seq', 1, false);


--
-- Name: purchase_ship_purchase_ship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_ship_purchase_ship_id_seq', 1, false);


--
-- Name: shipper_contacts_shipper_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipper_contacts_shipper_contacts_id_seq', 1, true);


--
-- Name: shipper_shipper_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipper_shipper_id_seq', 1, true);


--
-- Name: shipping_type_shipping_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_type_shipping_type_id_seq', 4, true);


--
-- Name: shop_addr_shop_addr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_addr_shop_addr_id_seq', 2, true);


--
-- Name: shop_contacts_shop_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_contacts_shop_contacts_id_seq', 2, true);


--
-- Name: shop_payment_shop_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_payment_shop_payment_id_seq', 2, true);


--
-- Name: shop_product_shop_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_product_shop_product_id_seq', 354, true);


--
-- Name: shop_renter_shop_renter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_renter_shop_renter_id_seq', 2, true);


--
-- Name: shop_schedule_shop_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_schedule_shop_schedule_id_seq', 2, true);


--
-- Name: shop_security_shop_security_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_security_shop_security_id_seq', 2, true);


--
-- Name: shop_shop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_shop_id_seq', 2, true);


--
-- Name: shop_staff_shop_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_staff_shop_staff_id_seq', 2, true);


--
-- Name: shop_statistics_shop_statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_statistics_shop_statistics_id_seq', 2, true);


--
-- Name: supplier_addr_supplier_addr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_addr_supplier_addr_id_seq', 2, true);


--
-- Name: supplier_contacts_supplier_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_contacts_supplier_contacts_id_seq', 2, true);


--
-- Name: supplier_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_supplier_id_seq', 2, true);


--
-- Name: brand pk_brand_brand_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT pk_brand_brand_id PRIMARY KEY (brand_id);


--
-- Name: city pk_city_city_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT pk_city_city_id PRIMARY KEY (city_id);


--
-- Name: color_schema pk_color_schema_color_schema_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color_schema
    ADD CONSTRAINT pk_color_schema_color_schema_id PRIMARY KEY (color_schema_id);


--
-- Name: company pk_company_company_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT pk_company_company_id PRIMARY KEY (company_id);


--
-- Name: country pk_country_country_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT pk_country_country_id PRIMARY KEY (country_id);


--
-- Name: currency pk_currency_currency_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT pk_currency_currency_id PRIMARY KEY (currency_id);


--
-- Name: customer_bio pk_customer_bio_customer_bio_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_bio
    ADD CONSTRAINT pk_customer_bio_customer_bio_id PRIMARY KEY (customer_bio_id);


--
-- Name: customer_contacts pk_customer_contacts_customer_contacts_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_contacts
    ADD CONSTRAINT pk_customer_contacts_customer_contacts_id PRIMARY KEY (customer_contacts_id);


--
-- Name: customer pk_customer_customer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT pk_customer_customer_id PRIMARY KEY (customer_id);


--
-- Name: customer_outer_distr pk_customer_outer_distr_customer_outer_distr_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_outer_distr
    ADD CONSTRAINT pk_customer_outer_distr_customer_outer_distr_id PRIMARY KEY (customer_outer_distr_id);


--
-- Name: customer_preferences pk_customer_preferences_customer_preferences_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_preferences
    ADD CONSTRAINT pk_customer_preferences_customer_preferences_id PRIMARY KEY (customer_preferences_id);


--
-- Name: customer_ship_addr pk_customer_ship_addr_customer_ship_addr_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_ship_addr
    ADD CONSTRAINT pk_customer_ship_addr_customer_ship_addr_id PRIMARY KEY (customer_ship_addr_id);


--
-- Name: customer_statistics pk_customer_statistics_customer_statistics_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_statistics
    ADD CONSTRAINT pk_customer_statistics_customer_statistics_id PRIMARY KEY (customer_statistics_id);


--
-- Name: employee_access_level pk_employee_access_level_employee_access_level_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_access_level
    ADD CONSTRAINT pk_employee_access_level_employee_access_level_id PRIMARY KEY (employee_access_level_id);


--
-- Name: employee_addr_liv pk_employee_addr_liv_employee_addr_liv_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_addr_liv
    ADD CONSTRAINT pk_employee_addr_liv_employee_addr_liv_id PRIMARY KEY (employee_addr_liv_id);


--
-- Name: employee_addr_reg pk_employee_addr_reg_employee_addr_reg_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_addr_reg
    ADD CONSTRAINT pk_employee_addr_reg_employee_addr_reg_id PRIMARY KEY (employee_addr_reg_id);


--
-- Name: employee_bio pk_employee_bio_employee_bio_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_bio
    ADD CONSTRAINT pk_employee_bio_employee_bio_id PRIMARY KEY (employee_bio_id);


--
-- Name: employee_contacts pk_employee_contacts_employee_contacts_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_contacts
    ADD CONSTRAINT pk_employee_contacts_employee_contacts_id PRIMARY KEY (employee_contacts_id);


--
-- Name: employee_contract_type pk_employee_contract_type_employee_contract_type_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_contract_type
    ADD CONSTRAINT pk_employee_contract_type_employee_contract_type_id PRIMARY KEY (employee_contract_type_id);


--
-- Name: employee pk_employee_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT pk_employee_employee_id PRIMARY KEY (employee_id);


--
-- Name: employee_hire_data pk_employee_hire_data_employee_hire_data_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_hire_data
    ADD CONSTRAINT pk_employee_hire_data_employee_hire_data_id PRIMARY KEY (employee_hire_data_id);


--
-- Name: employee_payment pk_employee_payment_employee_payment_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_payment
    ADD CONSTRAINT pk_employee_payment_employee_payment_id PRIMARY KEY (employee_payment_id);


--
-- Name: employee_position pk_employee_position_employee_position_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_position
    ADD CONSTRAINT pk_employee_position_employee_position_id PRIMARY KEY (employee_position_id);


--
-- Name: employee_preferences pk_employee_preferences_employee_preferences_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_preferences
    ADD CONSTRAINT pk_employee_preferences_employee_preferences_id PRIMARY KEY (employee_preferences_id);


--
-- Name: employee_shift pk_employee_shift_employee_shift_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_shift
    ADD CONSTRAINT pk_employee_shift_employee_shift_id PRIMARY KEY (employee_shift_id);


--
-- Name: employee_specific pk_employee_specific_employee_specific_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_specific
    ADD CONSTRAINT pk_employee_specific_employee_specific_id PRIMARY KEY (employee_specific_id);


--
-- Name: employee_state pk_employee_state_employee_state_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_state
    ADD CONSTRAINT pk_employee_state_employee_state_id PRIMARY KEY (employee_state_id);


--
-- Name: employee_status pk_employee_status_employee_status_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_status
    ADD CONSTRAINT pk_employee_status_employee_status_id PRIMARY KEY (employee_status_id);


--
-- Name: exchange_rate pk_exchange_rate_exchange_rate_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_rate
    ADD CONSTRAINT pk_exchange_rate_exchange_rate_id PRIMARY KEY (exchange_rate_id);


--
-- Name: family_status pk_family_status_family_status_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_status
    ADD CONSTRAINT pk_family_status_family_status_id PRIMARY KEY (family_status_id);


--
-- Name: gender pk_gender_gender_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT pk_gender_gender_id PRIMARY KEY (gender_id);


--
-- Name: language pk_language_language_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT pk_language_language_id PRIMARY KEY (language_id);


--
-- Name: measure_unit pk_measure_unit_measure_unit_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measure_unit
    ADD CONSTRAINT pk_measure_unit_measure_unit_id PRIMARY KEY (measure_unit_id);


--
-- Name: packing_material pk_packing_material_packing_material_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packing_material
    ADD CONSTRAINT pk_packing_material_packing_material_id PRIMARY KEY (packing_material_id);


--
-- Name: payment_type pk_payment_type_payment_type_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_type
    ADD CONSTRAINT pk_payment_type_payment_type_id PRIMARY KEY (payment_type_id);


--
-- Name: post pk_post_post_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT pk_post_post_id PRIMARY KEY (post_id);


--
-- Name: product_category pk_product_category_product_category_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT pk_product_category_product_category_id PRIMARY KEY (product_category_id);


--
-- Name: product_data pk_product_data_product_data_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_data
    ADD CONSTRAINT pk_product_data_product_data_id PRIMARY KEY (product_data_id);


--
-- Name: product_form pk_product_form_product_form_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_form
    ADD CONSTRAINT pk_product_form_product_form_id PRIMARY KEY (product_form_id);


--
-- Name: product_info pk_product_info_product_info_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_info
    ADD CONSTRAINT pk_product_info_product_info_id PRIMARY KEY (product_info_id);


--
-- Name: product_points pk_product_point_product_point_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_points
    ADD CONSTRAINT pk_product_point_product_point_id PRIMARY KEY (product_point_id);


--
-- Name: product_price pk_product_price_product_price_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price
    ADD CONSTRAINT pk_product_price_product_price_id PRIMARY KEY (product_price_id);


--
-- Name: product pk_product_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT pk_product_product_id PRIMARY KEY (product_id);


--
-- Name: product_rating pk_product_rating_product_rating_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_rating
    ADD CONSTRAINT pk_product_rating_product_rating_id PRIMARY KEY (product_rating_id);


--
-- Name: product_size pk_product_size_product_size_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_size
    ADD CONSTRAINT pk_product_size_product_size_id PRIMARY KEY (product_size_id);


--
-- Name: product_type pk_product_type_product_type_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT pk_product_type_product_type_id PRIMARY KEY (product_type_id);


--
-- Name: purchase_details pk_purchase_details_purchase_details_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_details
    ADD CONSTRAINT pk_purchase_details_purchase_details_id PRIMARY KEY (purchase_details_id);


--
-- Name: purchase_params pk_purchase_params_purchase_params_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_params
    ADD CONSTRAINT pk_purchase_params_purchase_params_id PRIMARY KEY (purchase_params_id);


--
-- Name: purchase_payment pk_purchase_payment_purchase_payment_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_payment
    ADD CONSTRAINT pk_purchase_payment_purchase_payment_id PRIMARY KEY (purchase_payment_id);


--
-- Name: purchase pk_purchase_purchase_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT pk_purchase_purchase_id PRIMARY KEY (purchase_id);


--
-- Name: purchase_ship_addr pk_purchase_ship_addr_purchase_ship_addr_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_ship_addr
    ADD CONSTRAINT pk_purchase_ship_addr_purchase_ship_addr_id PRIMARY KEY (purchase_ship_addr_id);


--
-- Name: purchase_ship pk_purchase_ship_purchase_ship_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_ship
    ADD CONSTRAINT pk_purchase_ship_purchase_ship_id PRIMARY KEY (purchase_ship_id);


--
-- Name: shipper_contacts pk_shipper_contacts_shipper_contacts_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper_contacts
    ADD CONSTRAINT pk_shipper_contacts_shipper_contacts_id PRIMARY KEY (shipper_contacts_id);


--
-- Name: shipper pk_shipper_shipper_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper
    ADD CONSTRAINT pk_shipper_shipper_id PRIMARY KEY (shipper_id);


--
-- Name: shipping_type pk_shipping_type_shipping_type_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_type
    ADD CONSTRAINT pk_shipping_type_shipping_type_id PRIMARY KEY (shipping_type_id);


--
-- Name: shop_addr pk_shop_addr_shop_addr_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_addr
    ADD CONSTRAINT pk_shop_addr_shop_addr_id PRIMARY KEY (shop_addr_id);


--
-- Name: shop_contacts pk_shop_contacts_shop_contacts_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_contacts
    ADD CONSTRAINT pk_shop_contacts_shop_contacts_id PRIMARY KEY (shop_contacts_id);


--
-- Name: shop_payment pk_shop_payment_shop_payment_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_payment
    ADD CONSTRAINT pk_shop_payment_shop_payment_id PRIMARY KEY (shop_payment_id);


--
-- Name: shop_product pk_shop_product_shop_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT pk_shop_product_shop_product_id PRIMARY KEY (shop_product_id);


--
-- Name: shop_renter pk_shop_renter_shop_renter_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_renter
    ADD CONSTRAINT pk_shop_renter_shop_renter_id PRIMARY KEY (shop_renter_id);


--
-- Name: shop_schedule pk_shop_schedule_shop_schedule_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_schedule
    ADD CONSTRAINT pk_shop_schedule_shop_schedule_id PRIMARY KEY (shop_schedule_id);


--
-- Name: shop_security pk_shop_security_shop_security_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_security
    ADD CONSTRAINT pk_shop_security_shop_security_id PRIMARY KEY (shop_security_id);


--
-- Name: shop pk_shop_shop_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT pk_shop_shop_id PRIMARY KEY (shop_id);


--
-- Name: shop_staff pk_shop_staff_shop_staff_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_staff
    ADD CONSTRAINT pk_shop_staff_shop_staff_id PRIMARY KEY (shop_staff_id);


--
-- Name: shop_statistics pk_shop_statistics_shop_statistics_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_statistics
    ADD CONSTRAINT pk_shop_statistics_shop_statistics_id PRIMARY KEY (shop_statistics_id);


--
-- Name: supplier_addr pk_supplier_addr_supplier_addr_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_addr
    ADD CONSTRAINT pk_supplier_addr_supplier_addr_id PRIMARY KEY (supplier_addr_id);


--
-- Name: supplier_contacts pk_supplier_contacts_supplier_contacts_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_contacts
    ADD CONSTRAINT pk_supplier_contacts_supplier_contacts_id PRIMARY KEY (supplier_contacts_id);


--
-- Name: supplier pk_supplier_supplier_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT pk_supplier_supplier_id PRIMARY KEY (supplier_id);


--
-- Name: brand unq_brand_description; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT unq_brand_description UNIQUE (description);


--
-- Name: brand unq_brand_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT unq_brand_name UNIQUE (name);


--
-- Name: city unq_city_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT unq_city_name UNIQUE (name);


--
-- Name: city unq_city_tel_area_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT unq_city_tel_area_code UNIQUE (tel_area_code);


--
-- Name: color_schema unq_color_schema_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color_schema
    ADD CONSTRAINT unq_color_schema_name UNIQUE (name);


--
-- Name: company unq_company_abbr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT unq_company_abbr UNIQUE (abbr);


--
-- Name: company unq_company_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT unq_company_name UNIQUE (name);


--
-- Name: country unq_country_capital_city_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT unq_country_capital_city_id UNIQUE (capital_city_id);


--
-- Name: country unq_country_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT unq_country_name UNIQUE (name);


--
-- Name: currency unq_currency_abbr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT unq_currency_abbr UNIQUE (abbr);


--
-- Name: currency unq_currency_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT unq_currency_name UNIQUE (name);


--
-- Name: currency unq_currency_signature; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT unq_currency_signature UNIQUE (signature);


--
-- Name: customer_bio unq_customer_bio_customer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_bio
    ADD CONSTRAINT unq_customer_bio_customer_id UNIQUE (customer_id);


--
-- Name: customer_contacts unq_customer_contacts_customer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_contacts
    ADD CONSTRAINT unq_customer_contacts_customer_id UNIQUE (customer_id);


--
-- Name: customer_contacts unq_customer_contacts_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_contacts
    ADD CONSTRAINT unq_customer_contacts_email UNIQUE (email);


--
-- Name: customer_contacts unq_customer_contacts_phone; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_contacts
    ADD CONSTRAINT unq_customer_contacts_phone UNIQUE (phone);


--
-- Name: customer_outer_distr unq_customer_outer_distr_customer_id_company_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_outer_distr
    ADD CONSTRAINT unq_customer_outer_distr_customer_id_company_id UNIQUE (customer_id, company_id);


--
-- Name: customer_preferences unq_customer_preferences_customer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_preferences
    ADD CONSTRAINT unq_customer_preferences_customer_id UNIQUE (customer_id);


--
-- Name: customer_ship_addr unq_customer_ship_addr_customer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_ship_addr
    ADD CONSTRAINT unq_customer_ship_addr_customer_id UNIQUE (customer_id);


--
-- Name: customer_statistics unq_customer_statistics_customer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_statistics
    ADD CONSTRAINT unq_customer_statistics_customer_id UNIQUE (customer_id);


--
-- Name: employee_access_level unq_employee_access_level_description; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_access_level
    ADD CONSTRAINT unq_employee_access_level_description UNIQUE (description);


--
-- Name: employee_access_level unq_employee_access_level_level; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_access_level
    ADD CONSTRAINT unq_employee_access_level_level UNIQUE (level);


--
-- Name: employee_addr_liv unq_employee_addr_liv_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_addr_liv
    ADD CONSTRAINT unq_employee_addr_liv_employee_id UNIQUE (employee_id);


--
-- Name: employee_addr_reg unq_employee_addr_reg_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_addr_reg
    ADD CONSTRAINT unq_employee_addr_reg_employee_id UNIQUE (employee_id);


--
-- Name: employee_bio unq_employee_bio_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_bio
    ADD CONSTRAINT unq_employee_bio_employee_id UNIQUE (employee_id);


--
-- Name: employee_contacts unq_employee_contacts_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_contacts
    ADD CONSTRAINT unq_employee_contacts_email UNIQUE (email);


--
-- Name: employee_contacts unq_employee_contacts_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_contacts
    ADD CONSTRAINT unq_employee_contacts_employee_id UNIQUE (employee_id);


--
-- Name: employee_contacts unq_employee_contacts_phone; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_contacts
    ADD CONSTRAINT unq_employee_contacts_phone UNIQUE (phone);


--
-- Name: employee_contract_type unq_employee_contract_type_contract_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_contract_type
    ADD CONSTRAINT unq_employee_contract_type_contract_type UNIQUE (contract_type);


--
-- Name: employee_contract_type unq_employee_contract_type_description; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_contract_type
    ADD CONSTRAINT unq_employee_contract_type_description UNIQUE (description);


--
-- Name: employee_hire_data unq_employee_hire_data_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_hire_data
    ADD CONSTRAINT unq_employee_hire_data_employee_id UNIQUE (employee_id);


--
-- Name: employee_payment unq_employee_payment_account_num; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_payment
    ADD CONSTRAINT unq_employee_payment_account_num UNIQUE (account_num);


--
-- Name: employee_payment unq_employee_payment_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_payment
    ADD CONSTRAINT unq_employee_payment_employee_id UNIQUE (employee_id);


--
-- Name: employee_payment unq_employee_payment_tax_account_num; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_payment
    ADD CONSTRAINT unq_employee_payment_tax_account_num UNIQUE (tax_account_num);


--
-- Name: employee_position unq_employee_position_description; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_position
    ADD CONSTRAINT unq_employee_position_description UNIQUE (description);


--
-- Name: employee_position unq_employee_position_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_position
    ADD CONSTRAINT unq_employee_position_name UNIQUE (name);


--
-- Name: employee_preferences unq_employee_preferences_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_preferences
    ADD CONSTRAINT unq_employee_preferences_employee_id UNIQUE (employee_id);


--
-- Name: employee_shift unq_employee_shift_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_shift
    ADD CONSTRAINT unq_employee_shift_employee_id UNIQUE (employee_id);


--
-- Name: employee_specific unq_employee_specific_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_specific
    ADD CONSTRAINT unq_employee_specific_employee_id UNIQUE (employee_id);


--
-- Name: employee_state unq_employee_state_employee_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_state
    ADD CONSTRAINT unq_employee_state_employee_id UNIQUE (employee_id);


--
-- Name: employee_status unq_employee_status_description; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_status
    ADD CONSTRAINT unq_employee_status_description UNIQUE (description);


--
-- Name: employee_status unq_employee_status_status; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_status
    ADD CONSTRAINT unq_employee_status_status UNIQUE (status);


--
-- Name: exchange_rate unq_exchange_rate_currency_from_currency_to; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_rate
    ADD CONSTRAINT unq_exchange_rate_currency_from_currency_to UNIQUE (currency_from, currency_to);


--
-- Name: family_status unq_family_status_description; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_status
    ADD CONSTRAINT unq_family_status_description UNIQUE (description);


--
-- Name: family_status unq_family_status_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family_status
    ADD CONSTRAINT unq_family_status_name UNIQUE (name);


--
-- Name: gender unq_gender_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender
    ADD CONSTRAINT unq_gender_name UNIQUE (name);


--
-- Name: language unq_language_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT unq_language_code UNIQUE (code);


--
-- Name: language unq_language_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT unq_language_name UNIQUE (name);


--
-- Name: language unq_language_name_native; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT unq_language_name_native UNIQUE (name_native);


--
-- Name: measure_unit unq_measure_unit_abbr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measure_unit
    ADD CONSTRAINT unq_measure_unit_abbr UNIQUE (abbr);


--
-- Name: measure_unit unq_measure_unit_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measure_unit
    ADD CONSTRAINT unq_measure_unit_name UNIQUE (name);


--
-- Name: packing_material unq_packing_material_description; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packing_material
    ADD CONSTRAINT unq_packing_material_description UNIQUE (description);


--
-- Name: packing_material unq_packing_material_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packing_material
    ADD CONSTRAINT unq_packing_material_name UNIQUE (name);


--
-- Name: payment_type unq_payment_type_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_type
    ADD CONSTRAINT unq_payment_type_name UNIQUE (name);


--
-- Name: post unq_post_customer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT unq_post_customer_id UNIQUE (title);


--
-- Name: product_category unq_product_category_abbr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT unq_product_category_abbr UNIQUE (abbr);


--
-- Name: product_category unq_product_category_description; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT unq_product_category_description UNIQUE (description);


--
-- Name: product_category unq_product_category_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT unq_product_category_name UNIQUE (name);


--
-- Name: product_data unq_product_data_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_data
    ADD CONSTRAINT unq_product_data_product_id UNIQUE (product_id);


--
-- Name: product_form unq_product_form_abbr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_form
    ADD CONSTRAINT unq_product_form_abbr UNIQUE (abbr);


--
-- Name: product_form unq_product_form_description; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_form
    ADD CONSTRAINT unq_product_form_description UNIQUE (description);


--
-- Name: product_form unq_product_form_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_form
    ADD CONSTRAINT unq_product_form_name UNIQUE (name);


--
-- Name: product_info unq_product_info_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_info
    ADD CONSTRAINT unq_product_info_product_id UNIQUE (product_id);


--
-- Name: product unq_product_outer_id_name_company_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT unq_product_outer_id_name_company_id UNIQUE (outer_id, name, company_id);


--
-- Name: product_points unq_product_point_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_points
    ADD CONSTRAINT unq_product_point_product_id UNIQUE (product_id);


--
-- Name: product_price unq_product_price_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price
    ADD CONSTRAINT unq_product_price_product_id UNIQUE (product_id);


--
-- Name: product_rating unq_product_rating_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_rating
    ADD CONSTRAINT unq_product_rating_product_id UNIQUE (product_id);


--
-- Name: product_size unq_product_size_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_size
    ADD CONSTRAINT unq_product_size_product_id UNIQUE (product_id);


--
-- Name: product_type unq_product_type_abbr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT unq_product_type_abbr UNIQUE (abbr);


--
-- Name: product_type unq_product_type_description; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT unq_product_type_description UNIQUE (description);


--
-- Name: product_type unq_product_type_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT unq_product_type_name UNIQUE (name);


--
-- Name: purchase_details unq_purchase_details_purchase_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_details
    ADD CONSTRAINT unq_purchase_details_purchase_id UNIQUE (purchase_id);


--
-- Name: purchase_params unq_purchase_params_purchase_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_params
    ADD CONSTRAINT unq_purchase_params_purchase_id UNIQUE (purchase_id);


--
-- Name: purchase_payment unq_purchase_payment_purchase_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_payment
    ADD CONSTRAINT unq_purchase_payment_purchase_id UNIQUE (purchase_id);


--
-- Name: purchase_ship_addr unq_purchase_ship_addr_purchase_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_ship_addr
    ADD CONSTRAINT unq_purchase_ship_addr_purchase_id UNIQUE (purchase_id);


--
-- Name: purchase_ship unq_purchase_ship_invoice_num; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_ship
    ADD CONSTRAINT unq_purchase_ship_invoice_num UNIQUE (invoice_num);


--
-- Name: purchase_ship unq_purchase_ship_purchase_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_ship
    ADD CONSTRAINT unq_purchase_ship_purchase_id UNIQUE (purchase_id);


--
-- Name: shipper_contacts unq_shipper_contacts_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper_contacts
    ADD CONSTRAINT unq_shipper_contacts_email UNIQUE (email);


--
-- Name: shipper_contacts unq_shipper_contacts_phone; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper_contacts
    ADD CONSTRAINT unq_shipper_contacts_phone UNIQUE (phone);


--
-- Name: shipper_contacts unq_shipper_contacts_shipper_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper_contacts
    ADD CONSTRAINT unq_shipper_contacts_shipper_id UNIQUE (shipper_id);


--
-- Name: shipper_contacts unq_shipper_contacts_website; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper_contacts
    ADD CONSTRAINT unq_shipper_contacts_website UNIQUE (website);


--
-- Name: shipper unq_shipper_name_country_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper
    ADD CONSTRAINT unq_shipper_name_country_id UNIQUE (name, country_id);


--
-- Name: shipping_type unq_shipping_type_abbr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_type
    ADD CONSTRAINT unq_shipping_type_abbr UNIQUE (abbr);


--
-- Name: shipping_type unq_shipping_type_description; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_type
    ADD CONSTRAINT unq_shipping_type_description UNIQUE (description);


--
-- Name: shipping_type unq_shipping_type_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_type
    ADD CONSTRAINT unq_shipping_type_name UNIQUE (name);


--
-- Name: shop_addr unq_shop_addr_shop_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_addr
    ADD CONSTRAINT unq_shop_addr_shop_id UNIQUE (shop_id);


--
-- Name: shop_contacts unq_shop_contacts_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_contacts
    ADD CONSTRAINT unq_shop_contacts_email UNIQUE (email);


--
-- Name: shop_contacts unq_shop_contacts_phone; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_contacts
    ADD CONSTRAINT unq_shop_contacts_phone UNIQUE (phone);


--
-- Name: shop_contacts unq_shop_contacts_shop_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_contacts
    ADD CONSTRAINT unq_shop_contacts_shop_id UNIQUE (shop_id);


--
-- Name: shop_payment unq_shop_payment_shop_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_payment
    ADD CONSTRAINT unq_shop_payment_shop_id UNIQUE (shop_id);


--
-- Name: shop_product unq_shop_product_shop_id_product_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT unq_shop_product_shop_id_product_id UNIQUE (shop_id, product_id);


--
-- Name: shop_renter unq_shop_renter_shop_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_renter
    ADD CONSTRAINT unq_shop_renter_shop_id UNIQUE (shop_id);


--
-- Name: shop_schedule unq_shop_schedule_shop_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_schedule
    ADD CONSTRAINT unq_shop_schedule_shop_id UNIQUE (shop_id);


--
-- Name: shop_security unq_shop_security_shop_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_security
    ADD CONSTRAINT unq_shop_security_shop_id UNIQUE (shop_id);


--
-- Name: shop_staff unq_shop_staff_shop_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_staff
    ADD CONSTRAINT unq_shop_staff_shop_id UNIQUE (shop_id);


--
-- Name: shop_statistics unq_shop_statistics_shop_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_statistics
    ADD CONSTRAINT unq_shop_statistics_shop_id UNIQUE (shop_id);


--
-- Name: supplier_addr unq_supplier_addr_supplier_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_addr
    ADD CONSTRAINT unq_supplier_addr_supplier_id UNIQUE (supplier_id);


--
-- Name: supplier_contacts unq_supplier_contacts_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_contacts
    ADD CONSTRAINT unq_supplier_contacts_email UNIQUE (email);


--
-- Name: supplier_contacts unq_supplier_contacts_phone; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_contacts
    ADD CONSTRAINT unq_supplier_contacts_phone UNIQUE (phone);


--
-- Name: supplier_contacts unq_supplier_contacts_supplier_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_contacts
    ADD CONSTRAINT unq_supplier_contacts_supplier_id UNIQUE (supplier_id);


--
-- Name: supplier_contacts unq_supplier_contacts_website; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_contacts
    ADD CONSTRAINT unq_supplier_contacts_website UNIQUE (website);


--
-- Name: supplier unq_supplier_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT unq_supplier_name UNIQUE (name);


--
-- Name: idx_post_content_fulltext; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_post_content_fulltext ON public.post USING gin (to_tsvector('english'::regconfig, content));


--
-- Name: brand fk_brand_company_id_company_company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT fk_brand_company_id_company_company_id FOREIGN KEY (company_id) REFERENCES public.company(company_id);


--
-- Name: country fk_capital_city_id_city_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT fk_capital_city_id_city_city_id FOREIGN KEY (capital_city_id) REFERENCES public.city(city_id);


--
-- Name: company fk_company_country_id_country_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT fk_company_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: city fk_country_id_country_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT fk_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: country fk_currency_id_currency_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT fk_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id);


--
-- Name: customer_bio fk_customer_bio_customer_id_customer_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_bio
    ADD CONSTRAINT fk_customer_bio_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: customer_bio fk_customer_bio_family_status_id_family_status_family_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_bio
    ADD CONSTRAINT fk_customer_bio_family_status_id_family_status_family_status_id FOREIGN KEY (family_status_id) REFERENCES public.family_status(family_status_id);


--
-- Name: customer_bio fk_customer_bio_gender_id_gender_gender_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_bio
    ADD CONSTRAINT fk_customer_bio_gender_id_gender_gender_id FOREIGN KEY (gender_id) REFERENCES public.gender(gender_id);


--
-- Name: customer_bio fk_customer_bio_language_id_language_language_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_bio
    ADD CONSTRAINT fk_customer_bio_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES public.language(language_id);


--
-- Name: customer_contacts fk_customer_contacts_customer_id_customer_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_contacts
    ADD CONSTRAINT fk_customer_contacts_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: customer_outer_distr fk_customer_outer_distr_customer_id_customer_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_outer_distr
    ADD CONSTRAINT fk_customer_outer_distr_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: customer_preferences fk_customer_preferences_color_schema_id_color_schema_color_sche; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_preferences
    ADD CONSTRAINT fk_customer_preferences_color_schema_id_color_schema_color_sche FOREIGN KEY (color_schema_id) REFERENCES public.color_schema(color_schema_id);


--
-- Name: customer_preferences fk_customer_preferences_currency_id_currency_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_preferences
    ADD CONSTRAINT fk_customer_preferences_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id);


--
-- Name: customer_preferences fk_customer_preferences_customer_id_customer_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_preferences
    ADD CONSTRAINT fk_customer_preferences_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: customer_preferences fk_customer_preferences_language_id_language_language_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_preferences
    ADD CONSTRAINT fk_customer_preferences_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES public.language(language_id);


--
-- Name: customer_ship_addr fk_customer_ship_addr_city_id_city_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_ship_addr
    ADD CONSTRAINT fk_customer_ship_addr_city_id_city_city_id FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: customer_ship_addr fk_customer_ship_addr_country_id_country_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_ship_addr
    ADD CONSTRAINT fk_customer_ship_addr_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: customer_ship_addr fk_customer_ship_addr_customer_id_customer_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_ship_addr
    ADD CONSTRAINT fk_customer_ship_addr_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: customer_statistics fk_customer_statistics_customer_id_customer_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_statistics
    ADD CONSTRAINT fk_customer_statistics_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: employee_addr_liv fk_employee_addr_liv_city_id_city_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_addr_liv
    ADD CONSTRAINT fk_employee_addr_liv_city_id_city_city_id FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: employee_addr_liv fk_employee_addr_liv_country_id_country_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_addr_liv
    ADD CONSTRAINT fk_employee_addr_liv_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: employee_addr_liv fk_employee_addr_liv_employee_id_employee_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_addr_liv
    ADD CONSTRAINT fk_employee_addr_liv_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: employee_addr_reg fk_employee_addr_reg_city_id_city_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_addr_reg
    ADD CONSTRAINT fk_employee_addr_reg_city_id_city_city_id FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: employee_addr_reg fk_employee_addr_reg_country_id_country_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_addr_reg
    ADD CONSTRAINT fk_employee_addr_reg_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: employee_addr_reg fk_employee_addr_reg_employee_id_employee_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_addr_reg
    ADD CONSTRAINT fk_employee_addr_reg_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: employee_bio fk_employee_bio_employee_id_employee_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_bio
    ADD CONSTRAINT fk_employee_bio_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: employee_bio fk_employee_bio_family_status_id_family_status_family_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_bio
    ADD CONSTRAINT fk_employee_bio_family_status_id_family_status_family_status_id FOREIGN KEY (family_status_id) REFERENCES public.family_status(family_status_id);


--
-- Name: employee_bio fk_employee_bio_gender_id_gender_gender_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_bio
    ADD CONSTRAINT fk_employee_bio_gender_id_gender_gender_id FOREIGN KEY (gender_id) REFERENCES public.gender(gender_id);


--
-- Name: employee_bio fk_employee_bio_language_id_language_language_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_bio
    ADD CONSTRAINT fk_employee_bio_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES public.language(language_id);


--
-- Name: employee_payment fk_employee_payment_currency_id_currency_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_payment
    ADD CONSTRAINT fk_employee_payment_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id);


--
-- Name: employee_payment fk_employee_payment_employee_id_employee_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_payment
    ADD CONSTRAINT fk_employee_payment_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: employee_preferences fk_employee_preferences_color_schema_id_color_schema_color_sche; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_preferences
    ADD CONSTRAINT fk_employee_preferences_color_schema_id_color_schema_color_sche FOREIGN KEY (color_schema_id) REFERENCES public.color_schema(color_schema_id);


--
-- Name: employee_preferences fk_employee_preferences_currency_id_currency_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_preferences
    ADD CONSTRAINT fk_employee_preferences_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id);


--
-- Name: employee_preferences fk_employee_preferences_employee_id_employee_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_preferences
    ADD CONSTRAINT fk_employee_preferences_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: employee_preferences fk_employee_preferences_language_id_language_language_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_preferences
    ADD CONSTRAINT fk_employee_preferences_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES public.language(language_id);


--
-- Name: employee_shift fk_employee_shift_employee_id_employee_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_shift
    ADD CONSTRAINT fk_employee_shift_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: employee_shift fk_employee_shift_manager_id_employee_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_shift
    ADD CONSTRAINT fk_employee_shift_manager_id_employee_employee_id FOREIGN KEY (manager_id) REFERENCES public.employee(employee_id);


--
-- Name: employee_shift fk_employee_shift_shop_id_shop_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_shift
    ADD CONSTRAINT fk_employee_shift_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: employee_specific fk_employee_specific_employee_id_employee_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_specific
    ADD CONSTRAINT fk_employee_specific_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: employee_state fk_employee_state_access_level_id_employee_access_level_employe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_state
    ADD CONSTRAINT fk_employee_state_access_level_id_employee_access_level_employe FOREIGN KEY (access_level_id) REFERENCES public.employee_access_level(employee_access_level_id);


--
-- Name: employee_state fk_employee_state_contract_type_id_employee_contract_type_emplo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_state
    ADD CONSTRAINT fk_employee_state_contract_type_id_employee_contract_type_emplo FOREIGN KEY (contract_type_id) REFERENCES public.employee_contract_type(employee_contract_type_id);


--
-- Name: employee_state fk_employee_state_employee_id_employee_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_state
    ADD CONSTRAINT fk_employee_state_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: employee_state fk_employee_state_position_id_employee_position_employee_positi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_state
    ADD CONSTRAINT fk_employee_state_position_id_employee_position_employee_positi FOREIGN KEY (position_id) REFERENCES public.employee_position(employee_position_id);


--
-- Name: employee_state fk_employee_state_status_id_employee_status_employee_status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_state
    ADD CONSTRAINT fk_employee_state_status_id_employee_status_employee_status_id FOREIGN KEY (status_id) REFERENCES public.employee_status(employee_status_id);


--
-- Name: exchange_rate fk_exchange_rate_currency_from_currency_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_rate
    ADD CONSTRAINT fk_exchange_rate_currency_from_currency_currency_id FOREIGN KEY (currency_from) REFERENCES public.currency(currency_id);


--
-- Name: exchange_rate fk_exchange_rate_currency_to_currency_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_rate
    ADD CONSTRAINT fk_exchange_rate_currency_to_currency_currency_id FOREIGN KEY (currency_to) REFERENCES public.currency(currency_id);


--
-- Name: country fk_language_id_language_language_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT fk_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES public.language(language_id);


--
-- Name: post fk_post_author_id_employee_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk_post_author_id_employee_employee_id FOREIGN KEY (author_id) REFERENCES public.employee(employee_id);


--
-- Name: post fk_post_language_id_language_language_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk_post_language_id_language_language_id FOREIGN KEY (language_id) REFERENCES public.language(language_id);


--
-- Name: product fk_product_company_id_company_company_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_product_company_id_company_company_id FOREIGN KEY (company_id) REFERENCES public.company(company_id);


--
-- Name: product_data fk_product_data_measure_unit_id_measure_unit_measure_unit_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_data
    ADD CONSTRAINT fk_product_data_measure_unit_id_measure_unit_measure_unit_id FOREIGN KEY (measure_unit_id) REFERENCES public.measure_unit(measure_unit_id);


--
-- Name: product_data fk_product_data_product_form_id_product_form_product_form_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_data
    ADD CONSTRAINT fk_product_data_product_form_id_product_form_product_form_id FOREIGN KEY (product_form_id) REFERENCES public.product_form(product_form_id);


--
-- Name: product_data fk_product_data_product_id_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_data
    ADD CONSTRAINT fk_product_data_product_id_product_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: product_info fk_product_info_product_id_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_info
    ADD CONSTRAINT fk_product_info_product_id_product_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: product_points fk_product_point_product_id_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_points
    ADD CONSTRAINT fk_product_point_product_id_product_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: product_price fk_product_price_product_id_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price
    ADD CONSTRAINT fk_product_price_product_id_product_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: product_rating fk_product_rating_product_id_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_rating
    ADD CONSTRAINT fk_product_rating_product_id_product_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: product_size fk_product_size_packing_material_id_packing_material_packing_ma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_size
    ADD CONSTRAINT fk_product_size_packing_material_id_packing_material_packing_ma FOREIGN KEY (packing_material_id) REFERENCES public.packing_material(packing_material_id);


--
-- Name: product_size fk_product_size_product_id_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_size
    ADD CONSTRAINT fk_product_size_product_id_product_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: purchase fk_purchase_customer_id_customer_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT fk_purchase_customer_id_customer_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: purchase_details fk_purchase_details_purchase_id_purchase_purchase_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_details
    ADD CONSTRAINT fk_purchase_details_purchase_id_purchase_purchase_id FOREIGN KEY (purchase_id) REFERENCES public.purchase(purchase_id);


--
-- Name: purchase fk_purchase_employee_id_employee_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT fk_purchase_employee_id_employee_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: purchase_params fk_purchase_params_purchase_id_purchase_purchase_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_params
    ADD CONSTRAINT fk_purchase_params_purchase_id_purchase_purchase_id FOREIGN KEY (purchase_id) REFERENCES public.purchase(purchase_id);


--
-- Name: purchase_payment fk_purchase_payment_currency_id_currency_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_payment
    ADD CONSTRAINT fk_purchase_payment_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id);


--
-- Name: purchase_payment fk_purchase_payment_payment_type_id_payment_type_payment_type_i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_payment
    ADD CONSTRAINT fk_purchase_payment_payment_type_id_payment_type_payment_type_i FOREIGN KEY (payment_type_id) REFERENCES public.payment_type(payment_type_id);


--
-- Name: purchase_payment fk_purchase_payment_purchase_id_purchase_purchase_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_payment
    ADD CONSTRAINT fk_purchase_payment_purchase_id_purchase_purchase_id FOREIGN KEY (purchase_id) REFERENCES public.purchase(purchase_id);


--
-- Name: purchase_ship_addr fk_purchase_ship_addr_city_id_city_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_ship_addr
    ADD CONSTRAINT fk_purchase_ship_addr_city_id_city_city_id FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: purchase_ship_addr fk_purchase_ship_addr_country_id_country_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_ship_addr
    ADD CONSTRAINT fk_purchase_ship_addr_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: purchase_ship_addr fk_purchase_ship_addr_purchase_id_purchase_purchase_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_ship_addr
    ADD CONSTRAINT fk_purchase_ship_addr_purchase_id_purchase_purchase_id FOREIGN KEY (purchase_id) REFERENCES public.purchase(purchase_id);


--
-- Name: purchase_ship fk_purchase_ship_purchase_id_purchase_purchase_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_ship
    ADD CONSTRAINT fk_purchase_ship_purchase_id_purchase_purchase_id FOREIGN KEY (purchase_id) REFERENCES public.purchase(purchase_id);


--
-- Name: purchase_ship fk_purchase_ship_shipper_id_shipper_shipper_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_ship
    ADD CONSTRAINT fk_purchase_ship_shipper_id_shipper_shipper_id FOREIGN KEY (shipper_id) REFERENCES public.shipper(shipper_id);


--
-- Name: purchase_ship fk_purchase_ship_shipping_type_id_shipping_type_shipping_type_i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_ship
    ADD CONSTRAINT fk_purchase_ship_shipping_type_id_shipping_type_shipping_type_i FOREIGN KEY (shipping_type_id) REFERENCES public.shipping_type(shipping_type_id);


--
-- Name: purchase fk_purchase_shop_id_shop_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT fk_purchase_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: shipper_contacts fk_shipper_contacts_shipper_id_shipper_shipper_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper_contacts
    ADD CONSTRAINT fk_shipper_contacts_shipper_id_shipper_shipper_id FOREIGN KEY (shipper_id) REFERENCES public.shipper(shipper_id);


--
-- Name: shipper fk_shipper_country_id_country_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipper
    ADD CONSTRAINT fk_shipper_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: shop_addr fk_shop_addr_city_id_city_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_addr
    ADD CONSTRAINT fk_shop_addr_city_id_city_city_id FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: shop_addr fk_shop_addr_country_id_country_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_addr
    ADD CONSTRAINT fk_shop_addr_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: shop_addr fk_shop_addr_shop_id_shop_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_addr
    ADD CONSTRAINT fk_shop_addr_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: shop fk_shop_admin_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT fk_shop_admin_employee_id FOREIGN KEY (admin_id) REFERENCES public.employee(employee_id);


--
-- Name: shop_contacts fk_shop_contacts_shop_id_shop_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_contacts
    ADD CONSTRAINT fk_shop_contacts_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: shop_payment fk_shop_payment_shop_id_shop_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_payment
    ADD CONSTRAINT fk_shop_payment_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: shop_product fk_shop_product_product_id_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT fk_shop_product_product_id_product_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: shop_product fk_shop_product_shop_id_shop_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT fk_shop_product_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: shop_renter fk_shop_renter_currency_id_currency_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_renter
    ADD CONSTRAINT fk_shop_renter_currency_id_currency_currency_id FOREIGN KEY (currency_id) REFERENCES public.currency(currency_id);


--
-- Name: shop_renter fk_shop_renter_shop_id_shop_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_renter
    ADD CONSTRAINT fk_shop_renter_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: shop_schedule fk_shop_schedule_shop_id_shop_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_schedule
    ADD CONSTRAINT fk_shop_schedule_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: shop_security fk_shop_security_shop_id_shop_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_security
    ADD CONSTRAINT fk_shop_security_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: shop_staff fk_shop_staff_shop_id_shop_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_staff
    ADD CONSTRAINT fk_shop_staff_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: shop_statistics fk_shop_statistics_shop_id_shop_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_statistics
    ADD CONSTRAINT fk_shop_statistics_shop_id_shop_shop_id FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: supplier_addr fk_supplier_addr_city_id_city_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_addr
    ADD CONSTRAINT fk_supplier_addr_city_id_city_city_id FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- Name: supplier_addr fk_supplier_addr_country_id_country_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_addr
    ADD CONSTRAINT fk_supplier_addr_country_id_country_country_id FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- Name: supplier_addr fk_supplier_addr_supplier_id_supplier_supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_addr
    ADD CONSTRAINT fk_supplier_addr_supplier_id_supplier_supplier_id FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);


--
-- Name: supplier_contacts fk_supplier_contacts_supplier_id_supplier_supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_contacts
    ADD CONSTRAINT fk_supplier_contacts_supplier_id_supplier_supplier_id FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);


--
-- Name: employee_position sfk_superior_id_employee_position_employee_position_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_position
    ADD CONSTRAINT sfk_superior_id_employee_position_employee_position_id FOREIGN KEY (superior_id) REFERENCES public.employee_position(employee_position_id);


--
-- PostgreSQL database dump complete
--

