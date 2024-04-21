--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE "dev-user";
ALTER ROLE "dev-user" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:DTt76YeHEA9MYQY4bSYcGg==$A7IDrFkdZvakV6yAAia0KaM2dxIMY8TolkzGDEWtwjM=:oA7f4c/6Gj+sWZgeEMgvqtliLgmMzsRLvezPKTZU85k=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

--
-- PostgreSQL database dump complete
--

--
-- Database "casdoor" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

--
-- Name: casdoor; Type: DATABASE; Schema: -; Owner: dev-user
--

CREATE DATABASE casdoor WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE casdoor OWNER TO "dev-user";

\connect casdoor

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
-- Name: adapter; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.adapter (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    "table" character varying(100),
    use_same_db boolean,
    type character varying(100),
    database_type character varying(100),
    host character varying(100),
    port integer,
    "user" character varying(100),
    password character varying(150),
    database character varying(100)
);


ALTER TABLE public.adapter OWNER TO "dev-user";

--
-- Name: application; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.application (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    logo character varying(200),
    homepage_url character varying(100),
    description character varying(100),
    organization character varying(100),
    cert character varying(100),
    header_html text,
    enable_password boolean,
    enable_sign_up boolean,
    enable_signin_session boolean,
    enable_auto_signin boolean,
    enable_code_signin boolean,
    enable_saml_compress boolean,
    enable_saml_c14n10 boolean,
    enable_saml_post_binding boolean,
    enable_web_authn boolean,
    enable_link_with_email boolean,
    org_choice_mode character varying(255),
    saml_reply_url character varying(100),
    providers text,
    signin_methods character varying(2000),
    signup_items character varying(2000),
    signin_items text,
    grant_types character varying(1000),
    tags text,
    saml_attributes character varying(1000),
    client_id character varying(100),
    client_secret character varying(100),
    redirect_uris character varying(1000),
    token_format character varying(100),
    token_fields character varying(1000),
    expire_in_hours integer,
    refresh_expire_in_hours integer,
    signup_url character varying(200),
    signin_url character varying(200),
    forget_url character varying(200),
    affiliation_url character varying(100),
    terms_of_use character varying(100),
    signup_html text,
    signin_html text,
    theme_data json,
    footer_html text,
    form_css text,
    form_css_mobile text,
    form_offset integer,
    form_side_html text,
    form_background_url character varying(200),
    failed_signin_limit integer,
    failed_signin_frozen_time integer
);


ALTER TABLE public.application OWNER TO "dev-user";

--
-- Name: casbin_api_rule; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.casbin_api_rule (
    id bigint NOT NULL,
    ptype character varying(100) DEFAULT ''::character varying NOT NULL,
    v0 character varying(100) DEFAULT ''::character varying NOT NULL,
    v1 character varying(100) DEFAULT ''::character varying NOT NULL,
    v2 character varying(100) DEFAULT ''::character varying NOT NULL,
    v3 character varying(100) DEFAULT ''::character varying NOT NULL,
    v4 character varying(100) DEFAULT ''::character varying NOT NULL,
    v5 character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.casbin_api_rule OWNER TO "dev-user";

--
-- Name: casbin_api_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: dev-user
--

CREATE SEQUENCE public.casbin_api_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.casbin_api_rule_id_seq OWNER TO "dev-user";

--
-- Name: casbin_api_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev-user
--

ALTER SEQUENCE public.casbin_api_rule_id_seq OWNED BY public.casbin_api_rule.id;


--
-- Name: casbin_rule; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.casbin_rule (
    id bigint NOT NULL,
    ptype character varying(100) DEFAULT ''::character varying NOT NULL,
    v0 character varying(100) DEFAULT ''::character varying NOT NULL,
    v1 character varying(100) DEFAULT ''::character varying NOT NULL,
    v2 character varying(100) DEFAULT ''::character varying NOT NULL,
    v3 character varying(100) DEFAULT ''::character varying NOT NULL,
    v4 character varying(100) DEFAULT ''::character varying NOT NULL,
    v5 character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.casbin_rule OWNER TO "dev-user";

--
-- Name: casbin_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: dev-user
--

CREATE SEQUENCE public.casbin_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.casbin_rule_id_seq OWNER TO "dev-user";

--
-- Name: casbin_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev-user
--

ALTER SEQUENCE public.casbin_rule_id_seq OWNED BY public.casbin_rule.id;


--
-- Name: casbin_user_rule; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.casbin_user_rule (
    id bigint NOT NULL,
    ptype character varying(100) DEFAULT ''::character varying NOT NULL,
    v0 character varying(100) DEFAULT ''::character varying NOT NULL,
    v1 character varying(100) DEFAULT ''::character varying NOT NULL,
    v2 character varying(100) DEFAULT ''::character varying NOT NULL,
    v3 character varying(100) DEFAULT ''::character varying NOT NULL,
    v4 character varying(100) DEFAULT ''::character varying NOT NULL,
    v5 character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.casbin_user_rule OWNER TO "dev-user";

--
-- Name: casbin_user_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: dev-user
--

CREATE SEQUENCE public.casbin_user_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.casbin_user_rule_id_seq OWNER TO "dev-user";

--
-- Name: casbin_user_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev-user
--

ALTER SEQUENCE public.casbin_user_rule_id_seq OWNED BY public.casbin_user_rule.id;


--
-- Name: cert; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.cert (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    scope character varying(100),
    type character varying(100),
    crypto_algorithm character varying(100),
    bit_size integer,
    expire_in_years integer,
    certificate text,
    private_key text
);


ALTER TABLE public.cert OWNER TO "dev-user";

--
-- Name: enforcer; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.enforcer (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    description character varying(100),
    model character varying(100),
    adapter character varying(100),
    enforcer text
);


ALTER TABLE public.enforcer OWNER TO "dev-user";

--
-- Name: group; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public."group" (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    manager character varying(100),
    contact_email character varying(100),
    type character varying(100),
    parent_id character varying(100),
    is_top_group boolean,
    title character varying(255),
    key character varying(255),
    children text,
    is_enabled boolean
);


ALTER TABLE public."group" OWNER TO "dev-user";

--
-- Name: invitation; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.invitation (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    code character varying(100),
    is_regexp boolean,
    quota integer,
    used_count integer,
    application character varying(100),
    username character varying(100),
    email character varying(100),
    phone character varying(100),
    signup_group character varying(100),
    default_code character varying(100),
    state character varying(100)
);


ALTER TABLE public.invitation OWNER TO "dev-user";

--
-- Name: ldap; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.ldap (
    id character varying(100) NOT NULL,
    owner character varying(100),
    created_time character varying(100),
    server_name character varying(100),
    host character varying(100),
    port integer,
    enable_ssl boolean,
    username character varying(100),
    password character varying(100),
    base_dn character varying(100),
    filter character varying(200),
    filter_fields character varying(100),
    auto_sync integer,
    last_sync character varying(100)
);


ALTER TABLE public.ldap OWNER TO "dev-user";

--
-- Name: model; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.model (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    description character varying(100),
    model_text text
);


ALTER TABLE public.model OWNER TO "dev-user";

--
-- Name: organization; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.organization (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    website_url character varying(100),
    logo character varying(200),
    logo_dark character varying(200),
    favicon character varying(100),
    password_type character varying(100),
    password_salt character varying(100),
    password_options character varying(100),
    country_codes character varying(200),
    default_avatar character varying(200),
    default_application character varying(100),
    tags text,
    languages character varying(255),
    theme_data json,
    master_password character varying(100),
    default_password character varying(100),
    master_verification_code character varying(100),
    init_score integer,
    enable_soft_deletion boolean,
    is_profile_public boolean,
    mfa_items character varying(300),
    account_items character varying(5000)
);


ALTER TABLE public.organization OWNER TO "dev-user";

--
-- Name: payment; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.payment (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    provider character varying(100),
    type character varying(100),
    product_name character varying(100),
    product_display_name character varying(100),
    detail character varying(255),
    tag character varying(100),
    currency character varying(100),
    price double precision,
    return_url character varying(1000),
    "user" character varying(100),
    person_name character varying(100),
    person_id_card character varying(100),
    person_email character varying(100),
    person_phone character varying(100),
    invoice_type character varying(100),
    invoice_title character varying(100),
    invoice_tax_id character varying(100),
    invoice_remark character varying(100),
    invoice_url character varying(255),
    out_order_id character varying(100),
    pay_url character varying(2000),
    success_url character varying(2000),
    state character varying(100),
    message character varying(2000)
);


ALTER TABLE public.payment OWNER TO "dev-user";

--
-- Name: permission; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.permission (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    description character varying(100),
    users text,
    groups text,
    roles text,
    domains text,
    model character varying(100),
    adapter character varying(100),
    resource_type character varying(100),
    resources text,
    actions text,
    effect character varying(100),
    is_enabled boolean,
    submitter character varying(100),
    approver character varying(100),
    approve_time character varying(100),
    state character varying(100)
);


ALTER TABLE public.permission OWNER TO "dev-user";

--
-- Name: permission_rule; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.permission_rule (
    id bigint NOT NULL,
    ptype character varying(100) DEFAULT ''::character varying NOT NULL,
    v0 character varying(100) DEFAULT ''::character varying NOT NULL,
    v1 character varying(100) DEFAULT ''::character varying NOT NULL,
    v2 character varying(100) DEFAULT ''::character varying NOT NULL,
    v3 character varying(100) DEFAULT ''::character varying NOT NULL,
    v4 character varying(100) DEFAULT ''::character varying NOT NULL,
    v5 character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.permission_rule OWNER TO "dev-user";

--
-- Name: permission_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: dev-user
--

CREATE SEQUENCE public.permission_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permission_rule_id_seq OWNER TO "dev-user";

--
-- Name: permission_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev-user
--

ALTER SEQUENCE public.permission_rule_id_seq OWNED BY public.permission_rule.id;


--
-- Name: plan; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.plan (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    description character varying(100),
    price double precision,
    currency character varying(100),
    period character varying(100),
    product character varying(100),
    payment_providers character varying(100),
    is_enabled boolean,
    role character varying(100)
);


ALTER TABLE public.plan OWNER TO "dev-user";

--
-- Name: pricing; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.pricing (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    description character varying(100),
    plans text,
    is_enabled boolean,
    trial_duration integer,
    application character varying(100)
);


ALTER TABLE public.pricing OWNER TO "dev-user";

--
-- Name: product; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.product (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    image character varying(100),
    detail character varying(1000),
    description character varying(200),
    tag character varying(100),
    currency character varying(100),
    price double precision,
    quantity integer,
    sold integer,
    providers character varying(255),
    return_url character varying(1000),
    state character varying(100)
);


ALTER TABLE public.product OWNER TO "dev-user";

--
-- Name: provider; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.provider (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    category character varying(100),
    type character varying(100),
    sub_type character varying(100),
    method character varying(100),
    client_id character varying(200),
    client_secret character varying(3000),
    client_id2 character varying(100),
    client_secret2 character varying(500),
    cert character varying(100),
    custom_auth_url character varying(200),
    custom_token_url character varying(200),
    custom_user_info_url character varying(200),
    custom_logo character varying(200),
    scopes character varying(100),
    user_mapping character varying(500),
    host character varying(100),
    port integer,
    disable_ssl boolean,
    title character varying(100),
    content character varying(2000),
    receiver character varying(100),
    region_id character varying(100),
    sign_name character varying(100),
    template_code character varying(100),
    app_id character varying(100),
    endpoint character varying(1000),
    intranet_endpoint character varying(100),
    domain character varying(100),
    bucket character varying(100),
    path_prefix character varying(100),
    metadata text,
    id_p text,
    issuer_url character varying(100),
    enable_sign_authn_request boolean,
    provider_url character varying(200)
);


ALTER TABLE public.provider OWNER TO "dev-user";

--
-- Name: radius_accounting; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.radius_accounting (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time timestamp without time zone,
    username character varying(255),
    service_type bigint,
    nas_id character varying(255),
    nas_ip_addr character varying(255),
    nas_port_id character varying(255),
    nas_port_type bigint,
    nas_port bigint,
    framed_ip_addr character varying(255),
    framed_ip_netmask character varying(255),
    acct_session_id character varying(255),
    acct_session_time bigint,
    acct_input_total bigint,
    acct_output_total bigint,
    acct_input_packets bigint,
    acct_output_packets bigint,
    acct_terminate_cause bigint,
    last_update timestamp without time zone,
    acct_start_time timestamp without time zone,
    acct_stop_time timestamp without time zone
);


ALTER TABLE public.radius_accounting OWNER TO "dev-user";

--
-- Name: record; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.record (
    id integer NOT NULL,
    owner character varying(100),
    name character varying(100),
    created_time character varying(100),
    organization character varying(100),
    client_ip character varying(100),
    "user" character varying(100),
    method character varying(100),
    request_uri character varying(1000),
    action character varying(1000),
    language character varying(100),
    object text,
    response text,
    is_triggered boolean
);


ALTER TABLE public.record OWNER TO "dev-user";

--
-- Name: record_id_seq; Type: SEQUENCE; Schema: public; Owner: dev-user
--

CREATE SEQUENCE public.record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.record_id_seq OWNER TO "dev-user";

--
-- Name: record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev-user
--

ALTER SEQUENCE public.record_id_seq OWNED BY public.record.id;


--
-- Name: resource; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.resource (
    owner character varying(100) NOT NULL,
    name character varying(180) NOT NULL,
    created_time character varying(100),
    "user" character varying(100),
    provider character varying(100),
    application character varying(100),
    tag character varying(100),
    parent character varying(100),
    file_name character varying(255),
    file_type character varying(100),
    file_format character varying(100),
    file_size integer,
    url character varying(255),
    description character varying(255)
);


ALTER TABLE public.resource OWNER TO "dev-user";

--
-- Name: role; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.role (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    description character varying(100),
    users text,
    groups text,
    roles text,
    domains text,
    is_enabled boolean
);


ALTER TABLE public.role OWNER TO "dev-user";

--
-- Name: session; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.session (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    application character varying(100) NOT NULL,
    created_time character varying(100),
    session_id text
);


ALTER TABLE public.session OWNER TO "dev-user";

--
-- Name: subscription; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.subscription (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    display_name character varying(100),
    created_time character varying(100),
    description character varying(100),
    "user" character varying(100),
    pricing character varying(100),
    plan character varying(100),
    payment character varying(100),
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    period character varying(100),
    state character varying(100)
);


ALTER TABLE public.subscription OWNER TO "dev-user";

--
-- Name: syncer; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.syncer (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    organization character varying(100),
    type character varying(100),
    database_type character varying(100),
    ssl_mode character varying(100),
    ssh_type character varying(100),
    host character varying(100),
    port integer,
    "user" character varying(100),
    password character varying(150),
    ssh_host character varying(100),
    ssh_port integer,
    ssh_user character varying(100),
    ssh_password character varying(150),
    cert character varying(100),
    database character varying(100),
    "table" character varying(100),
    table_columns text,
    affiliation_table character varying(100),
    avatar_base_url character varying(100),
    error_text text,
    sync_interval integer,
    is_read_only boolean,
    is_enabled boolean
);


ALTER TABLE public.syncer OWNER TO "dev-user";

--
-- Name: token; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.token (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    application character varying(100),
    organization character varying(100),
    "user" character varying(100),
    code character varying(100),
    access_token text,
    refresh_token text,
    access_token_hash character varying(100),
    refresh_token_hash character varying(100),
    expires_in integer,
    scope character varying(100),
    token_type character varying(100),
    code_challenge character varying(100),
    code_is_used boolean,
    code_expire_in bigint
);


ALTER TABLE public.token OWNER TO "dev-user";

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.transaction (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    provider character varying(100),
    category character varying(100),
    type character varying(100),
    product_name character varying(100),
    product_display_name character varying(100),
    detail character varying(255),
    tag character varying(100),
    currency character varying(100),
    amount double precision,
    return_url character varying(1000),
    "user" character varying(100),
    application character varying(100),
    payment character varying(100),
    state character varying(100)
);


ALTER TABLE public.transaction OWNER TO "dev-user";

--
-- Name: user; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public."user" (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    deleted_time character varying(100),
    id character varying(100),
    external_id character varying(100),
    type character varying(100),
    password character varying(150),
    password_salt character varying(100),
    password_type character varying(100),
    display_name character varying(100),
    first_name character varying(100),
    last_name character varying(100),
    avatar character varying(500),
    avatar_type character varying(100),
    permanent_avatar character varying(500),
    email character varying(100),
    email_verified boolean,
    phone character varying(100),
    country_code character varying(6),
    region character varying(100),
    location character varying(100),
    address text,
    affiliation character varying(100),
    title character varying(100),
    id_card_type character varying(100),
    id_card character varying(100),
    homepage character varying(100),
    bio character varying(100),
    tag character varying(100),
    language character varying(100),
    gender character varying(100),
    birthday character varying(100),
    education character varying(100),
    score integer,
    karma integer,
    ranking integer,
    balance double precision,
    currency character varying(100),
    is_default_avatar boolean,
    is_online boolean,
    is_admin boolean,
    is_forbidden boolean,
    is_deleted boolean,
    signup_application character varying(100),
    hash character varying(100),
    pre_hash character varying(100),
    access_key character varying(100),
    access_secret character varying(100),
    access_token text,
    created_ip character varying(100),
    last_signin_time character varying(100),
    last_signin_ip character varying(100),
    github character varying(100),
    google character varying(100),
    qq character varying(100),
    wechat character varying(100),
    facebook character varying(100),
    dingtalk character varying(100),
    weibo character varying(100),
    gitee character varying(100),
    linkedin character varying(100),
    wecom character varying(100),
    lark character varying(100),
    gitlab character varying(100),
    adfs character varying(100),
    baidu character varying(100),
    alipay character varying(100),
    casdoor character varying(100),
    infoflow character varying(100),
    apple character varying(100),
    azuread character varying(100),
    azureadb2c character varying(100),
    slack character varying(100),
    steam character varying(100),
    bilibili character varying(100),
    okta character varying(100),
    douyin character varying(100),
    line character varying(100),
    amazon character varying(100),
    auth0 character varying(100),
    battlenet character varying(100),
    bitbucket character varying(100),
    box character varying(100),
    cloudfoundry character varying(100),
    dailymotion character varying(100),
    deezer character varying(100),
    digitalocean character varying(100),
    discord character varying(100),
    dropbox character varying(100),
    eveonline character varying(100),
    fitbit character varying(100),
    gitea character varying(100),
    heroku character varying(100),
    influxcloud character varying(100),
    instagram character varying(100),
    intercom character varying(100),
    kakao character varying(100),
    lastfm character varying(100),
    mailru character varying(100),
    meetup character varying(100),
    microsoftonline character varying(100),
    naver character varying(100),
    nextcloud character varying(100),
    onedrive character varying(100),
    oura character varying(100),
    patreon character varying(100),
    paypal character varying(100),
    salesforce character varying(100),
    shopify character varying(100),
    soundcloud character varying(100),
    spotify character varying(100),
    strava character varying(100),
    stripe character varying(100),
    tiktok character varying(100),
    tumblr character varying(100),
    twitch character varying(100),
    twitter character varying(100),
    typetalk character varying(100),
    uber character varying(100),
    vk character varying(100),
    wepay character varying(100),
    xero character varying(100),
    yahoo character varying(100),
    yammer character varying(100),
    yandex character varying(100),
    zoom character varying(100),
    metamask character varying(100),
    web3onboard character varying(100),
    custom character varying(100),
    "webauthnCredentials" bytea,
    preferred_mfa_type character varying(100),
    recovery_codes character varying(1000),
    totp_secret character varying(100),
    mfa_phone_enabled boolean,
    mfa_email_enabled boolean,
    invitation character varying(100),
    invitation_code character varying(100),
    face_ids text,
    ldap character varying(100),
    properties text,
    roles text,
    permissions text,
    groups character varying(1000),
    last_signin_wrong_time character varying(100),
    signin_wrong_times integer,
    "managedAccounts" bytea
);


ALTER TABLE public."user" OWNER TO "dev-user";

--
-- Name: verification_record; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.verification_record (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    remote_addr character varying(100),
    type character varying(10),
    "user" character varying(100) NOT NULL,
    provider character varying(100) NOT NULL,
    receiver character varying(100) NOT NULL,
    code character varying(10) NOT NULL,
    "time" bigint NOT NULL,
    is_used boolean
);


ALTER TABLE public.verification_record OWNER TO "dev-user";

--
-- Name: webhook; Type: TABLE; Schema: public; Owner: dev-user
--

CREATE TABLE public.webhook (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    organization character varying(100),
    url character varying(200),
    method character varying(100),
    content_type character varying(100),
    headers text,
    events character varying(1000),
    is_user_extended boolean,
    single_org_only boolean,
    is_enabled boolean
);


ALTER TABLE public.webhook OWNER TO "dev-user";

--
-- Name: casbin_api_rule id; Type: DEFAULT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.casbin_api_rule ALTER COLUMN id SET DEFAULT nextval('public.casbin_api_rule_id_seq'::regclass);


--
-- Name: casbin_rule id; Type: DEFAULT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.casbin_rule ALTER COLUMN id SET DEFAULT nextval('public.casbin_rule_id_seq'::regclass);


--
-- Name: casbin_user_rule id; Type: DEFAULT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.casbin_user_rule ALTER COLUMN id SET DEFAULT nextval('public.casbin_user_rule_id_seq'::regclass);


--
-- Name: permission_rule id; Type: DEFAULT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.permission_rule ALTER COLUMN id SET DEFAULT nextval('public.permission_rule_id_seq'::regclass);


--
-- Name: record id; Type: DEFAULT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.record ALTER COLUMN id SET DEFAULT nextval('public.record_id_seq'::regclass);


--
-- Data for Name: adapter; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.adapter (owner, name, created_time, "table", use_same_db, type, database_type, host, port, "user", password, database) FROM stdin;
built-in	api-adapter-built-in	2024-04-21T15:44:19Z	casbin_api_rule	t				0			
built-in	user-adapter-built-in	2024-04-21T15:44:19Z	casbin_user_rule	t				0			
\.


--
-- Data for Name: application; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.application (owner, name, created_time, display_name, logo, homepage_url, description, organization, cert, header_html, enable_password, enable_sign_up, enable_signin_session, enable_auto_signin, enable_code_signin, enable_saml_compress, enable_saml_c14n10, enable_saml_post_binding, enable_web_authn, enable_link_with_email, org_choice_mode, saml_reply_url, providers, signin_methods, signup_items, signin_items, grant_types, tags, saml_attributes, client_id, client_secret, redirect_uris, token_format, token_fields, expire_in_hours, refresh_expire_in_hours, signup_url, signin_url, forget_url, affiliation_url, terms_of_use, signup_html, signin_html, theme_data, footer_html, form_css, form_css_mobile, form_offset, form_side_html, form_background_url, failed_signin_limit, failed_signin_frozen_time) FROM stdin;
admin	app-built-in	2024-04-21T15:44:16Z	Casdoor	https://cdn.casbin.org/img/casdoor-logo_1185x256.png	https://casdoor.org		built-in	cert-built-in		t	t	f	f	f	f	f	f	f	f			[{"owner":"","name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"prompted":false,"signupGroup":"","rule":"None","provider":null}]	[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}]	[{"name":"ID","visible":false,"required":true,"prompted":false,"customCss":"","label":"","placeholder":"","regex":"","rule":"Random"},{"name":"Username","visible":true,"required":true,"prompted":false,"customCss":"","label":"","placeholder":"","regex":"","rule":"None"},{"name":"Display name","visible":true,"required":true,"prompted":false,"customCss":"","label":"","placeholder":"","regex":"","rule":"None"},{"name":"Password","visible":true,"required":true,"prompted":false,"customCss":"","label":"","placeholder":"","regex":"","rule":"None"},{"name":"Confirm password","visible":true,"required":true,"prompted":false,"customCss":"","label":"","placeholder":"","regex":"","rule":"None"},{"name":"Email","visible":true,"required":true,"prompted":false,"customCss":"","label":"","placeholder":"","regex":"","rule":"Normal"},{"name":"Phone","visible":true,"required":true,"prompted":false,"customCss":"","label":"","placeholder":"","regex":"","rule":"None"},{"name":"Agreement","visible":true,"required":true,"prompted":false,"customCss":"","label":"","placeholder":"","regex":"","rule":"None"}]	null	null	[]	null	6ec1f17d1ce29865e1ea	93bf86361b24ff0a780b93493845a9bb42280333	[]	JWT	[]	168	0								\N				2			0	0
\.


--
-- Data for Name: casbin_api_rule; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.casbin_api_rule (id, ptype, v0, v1, v2, v3, v4, v5) FROM stdin;
1	p	built-in	*	*	*	*	*
2	p	app	*	*	*	*	*
3	p	*	*	POST	/api/signup	*	*
4	p	*	*	GET	/api/get-email-and-phone	*	*
5	p	*	*	POST	/api/login	*	*
6	p	*	*	GET	/api/get-app-login	*	*
7	p	*	*	POST	/api/logout	*	*
8	p	*	*	GET	/api/logout	*	*
9	p	*	*	POST	/api/callback	*	*
10	p	*	*	GET	/api/get-account	*	*
11	p	*	*	GET	/api/userinfo	*	*
12	p	*	*	GET	/api/user	*	*
13	p	*	*	GET	/api/health	*	*
14	p	*	*	*	/api/webhook	*	*
15	p	*	*	GET	/api/get-qrcode	*	*
16	p	*	*	GET	/api/get-webhook-event	*	*
17	p	*	*	GET	/api/get-captcha-status	*	*
18	p	*	*	*	/api/login/oauth	*	*
19	p	*	*	GET	/api/get-application	*	*
20	p	*	*	GET	/api/get-organization-applications	*	*
21	p	*	*	GET	/api/get-user	*	*
22	p	*	*	GET	/api/get-user-application	*	*
23	p	*	*	GET	/api/get-resources	*	*
24	p	*	*	GET	/api/get-records	*	*
25	p	*	*	GET	/api/get-product	*	*
26	p	*	*	POST	/api/buy-product	*	*
27	p	*	*	GET	/api/get-payment	*	*
28	p	*	*	POST	/api/update-payment	*	*
29	p	*	*	POST	/api/invoice-payment	*	*
30	p	*	*	POST	/api/notify-payment	*	*
31	p	*	*	POST	/api/unlink	*	*
32	p	*	*	POST	/api/set-password	*	*
33	p	*	*	POST	/api/send-verification-code	*	*
34	p	*	*	GET	/api/get-captcha	*	*
35	p	*	*	POST	/api/verify-captcha	*	*
36	p	*	*	POST	/api/verify-code	*	*
37	p	*	*	POST	/api/reset-email-or-phone	*	*
38	p	*	*	POST	/api/upload-resource	*	*
39	p	*	*	GET	/.well-known/openid-configuration	*	*
40	p	*	*	*	/.well-known/jwks	*	*
41	p	*	*	GET	/api/get-saml-login	*	*
42	p	*	*	POST	/api/acs	*	*
43	p	*	*	GET	/api/saml/metadata	*	*
44	p	*	*	*	/api/saml/redirect	*	*
45	p	*	*	*	/cas	*	*
46	p	*	*	*	/scim	*	*
47	p	*	*	*	/api/webauthn	*	*
48	p	*	*	GET	/api/get-release	*	*
49	p	*	*	GET	/api/get-default-application	*	*
50	p	*	*	GET	/api/get-prometheus-info	*	*
51	p	*	*	*	/api/metrics	*	*
52	p	*	*	GET	/api/get-pricing	*	*
53	p	*	*	GET	/api/get-plan	*	*
54	p	*	*	GET	/api/get-subscription	*	*
55	p	*	*	GET	/api/get-provider	*	*
56	p	*	*	GET	/api/get-organization-names	*	*
57	p	*	*	GET	/api/get-all-objects	*	*
58	p	*	*	GET	/api/get-all-actions	*	*
59	p	*	*	GET	/api/get-all-roles	*	*
60	p	*	*	GET	/api/get-invitation-info	*	*
61	p	*	*	GET	/api/faceid-signin-begin	*	*
\.


--
-- Data for Name: casbin_rule; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) FROM stdin;
\.


--
-- Data for Name: casbin_user_rule; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.casbin_user_rule (id, ptype, v0, v1, v2, v3, v4, v5) FROM stdin;
\.


--
-- Data for Name: cert; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.cert (owner, name, created_time, display_name, scope, type, crypto_algorithm, bit_size, expire_in_years, certificate, private_key) FROM stdin;
admin	cert-built-in	2024-04-21T15:44:16Z	Built-in Cert	JWT	x509	RS256	4096	20	-----BEGIN CERTIFICATE-----\nMIIE3TCCAsWgAwIBAgIDAeJAMA0GCSqGSIb3DQEBCwUAMCgxDjAMBgNVBAoTBWFk\nbWluMRYwFAYDVQQDEw1jZXJ0LWJ1aWx0LWluMB4XDTI0MDQyMTE1NDQxOVoXDTQ0\nMDQyMTE1NDQxOVowKDEOMAwGA1UEChMFYWRtaW4xFjAUBgNVBAMTDWNlcnQtYnVp\nbHQtaW4wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQC/Q6T+Ij7szRDS\ntxBJZxGmrlzb0D8XPqh72p0abIRaokxGYa2M42KyIa2rOphFYqvlLNw8PWMQjGCO\nlg6D4HaHOU9XdE9fTTZoA1Ns30eG5eXa0Gk9g15URiw6mMicD7PTpDlMqItS8G3x\nNGX/6qC8pFip1JgZlvCgH1BDJH7x3CP/4c9fRxLh0qSqqOnerq/JGz4uE3vnTSFe\nhyNyJWiuk6pr9MC/+lqX1loti0J+30yuD+sL/G9ADCljThqK+OQ8hi5O/Uy05/Rx\nhpcWHgyVtt1Un8QaKaUGM/OQpjdjqeJWC+cw5gOj/RIPmd0tLdcCaqls1RtEPMin\noz5ogOWukJmrk+tRk/JqP+LED0kV1GrLGcOi9Ppxu3NcUGfM9fKyiBVG6y/cbGn4\nurTz1uZ83TlOufG97c4uY/2/xnrI7eGe2Yevm5ieEPa9xnpWwInO6uNpqwybU9G3\n+xLKQVeZNV8Mc6wbx+Tda5mWlbvQ+wxK6deNHN3ziFu7ARjaWVLX196YbY5p7SAL\nIMqIQWKIv2Ni4am82K5uTmtgNLyEHbqKToNep47VMXZKA9a0vupaW+01fTdZqYhp\nl/3SN6lxOmqSt5qcVpJb7rk8CLw6+tauiMHwRfv1bp2LvKF+sBbKSzptKYrSfR/c\nWItQWayq0FNAA/b/OQo+vAiMwaE9VQIDAQABoxAwDjAMBgNVHRMBAf8EAjAAMA0G\nCSqGSIb3DQEBCwUAA4ICAQBmludtr58GYst1ehS7Fb0KAJMujbYHS5QFEz0Bvgfz\n+iaawGDdHkWKDy2uKfXTX3/j0eyHALCiCj+o8WOrh/P21gDJotyCw31vDqZHfzjn\n9AD7WjNuADT/1ldRkXHYv/NITwYX4x/0xXXiTWVD3zDr+n04VyXRagVzdv/ShFSR\nzlUay3Ew80SqRdsIwXDJ9atDg9Up04KYzOfBkAytpqhnAkdfypUU+93kgo0t6TjK\nreKNz+E//FpUapTNBbiK1n4gkG6ASbzqszEv2F7CBTCWamjVFpEiXBKc5aMUqNqI\nRqa432PsYCPjM0+AzyibVoQILrOKReOi3qB9I6CHmxb6HKa0QVpFPeOu3QVnv3ok\nDw+NSldrnjc7g4x9iU8wYUUkR/I1+ZNtx57okJkaG0aLwUE09rsn2PDgy5wUbal4\nvuxOhi41Ej/DVT8KUYywNvo23jh3Pdtaiosf5A2eRPMI7brEV8KQ2VGP3VLqh2Q1\neIIPcwcK3v6XqIRdU7IPJ5rXfeD9WOijqdUQz5Cb80xHrtBYR7sjkvdyAd39g/l9\nXjgPORhlTkv90PN7QeXVZeZisaKx8WdTljVI9TtwIHHjM32PUZoyHQOanH3t9HQ7\nq4oIQTKAqTFCNeHljwMIJ+Alwk6kfs8dJgN/jCSs7PpU6d9UgkVI7rLPZwifl5L5\nBg==\n-----END CERTIFICATE-----\n	-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n
\.


--
-- Data for Name: enforcer; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.enforcer (owner, name, created_time, updated_time, display_name, description, model, adapter, enforcer) FROM stdin;
built-in	api-enforcer-built-in	2024-04-21T15:44:19Z	2024-04-21 15:44:19	API Enforcer		built-in/api-model-built-in	built-in/api-adapter-built-in	\N
built-in	user-enforcer-built-in	2024-04-21T15:44:19Z	2024-04-21 15:44:19	User Enforcer		built-in/user-model-built-in	built-in/user-adapter-built-in	\N
\.


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public."group" (owner, name, created_time, updated_time, display_name, manager, contact_email, type, parent_id, is_top_group, title, key, children, is_enabled) FROM stdin;
\.


--
-- Data for Name: invitation; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.invitation (owner, name, created_time, updated_time, display_name, code, is_regexp, quota, used_count, application, username, email, phone, signup_group, default_code, state) FROM stdin;
\.


--
-- Data for Name: ldap; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.ldap (id, owner, created_time, server_name, host, port, enable_ssl, username, password, base_dn, filter, filter_fields, auto_sync, last_sync) FROM stdin;
ldap-built-in	built-in	2024-04-21T15:44:19Z	BuildIn LDAP Server	example.com	389	f	cn=buildin,dc=example,dc=com	123	ou=BuildIn,dc=example,dc=com		null	0	
\.


--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.model (owner, name, created_time, display_name, description, model_text) FROM stdin;
built-in	api-model-built-in	2024-04-21T15:44:19Z	API Model		[request_definition]\nr = subOwner, subName, method, urlPath, objOwner, objName\n\n[policy_definition]\np = subOwner, subName, method, urlPath, objOwner, objName\n\n[role_definition]\ng = _, _\n\n[policy_effect]\ne = some(where (p.eft == allow))\n\n[matchers]\nm = (r.subOwner == p.subOwner || p.subOwner == "*") && \\\n    (r.subName == p.subName || p.subName == "*" || r.subName != "anonymous" && p.subName == "!anonymous") && \\\n    (r.method == p.method || p.method == "*") && \\\n    (r.urlPath == p.urlPath || p.urlPath == "*") && \\\n    (r.objOwner == p.objOwner || p.objOwner == "*") && \\\n    (r.objName == p.objName || p.objName == "*") || \\\n    (r.subOwner == r.objOwner && r.subName == r.objName)
built-in	user-model-built-in	2024-04-21T15:44:19Z	Built-in Model		[request_definition]\nr = sub, obj, act\n\n[policy_definition]\np = sub, obj, act\n\n[role_definition]\ng = _, _\n\n[policy_effect]\ne = some(where (p.eft == allow))\n\n[matchers]\nm = g(r.sub, p.sub) && r.obj == p.obj && r.act == p.act
\.


--
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.organization (owner, name, created_time, display_name, website_url, logo, logo_dark, favicon, password_type, password_salt, password_options, country_codes, default_avatar, default_application, tags, languages, theme_data, master_password, default_password, master_verification_code, init_score, enable_soft_deletion, is_profile_public, mfa_items, account_items) FROM stdin;
admin	built-in	2024-04-21T15:44:16Z	Built-in Organization	https://example.com			https://cdn.casbin.org/img/casbin/favicon.ico	plain		["AtLeast6"]	["US","ES","FR","DE","GB","CN","JP","KR","VN","ID","SG","IN"]	https://cdn.casbin.org/img/casbin.svg		[]	["en","zh","es","fr","de","id","ja","ko","ru","vi","pt"]	\N				2000	f	f	null	[{"name":"Organization","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":""},{"name":"ID","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":""},{"name":"Name","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":""},{"name":"Display name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":""},{"name":"Avatar","visible":true,"viewRule":"Public","modifyRule":"Self","regex":""},{"name":"User type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":""},{"name":"Password","visible":true,"viewRule":"Self","modifyRule":"Self","regex":""},{"name":"Email","visible":true,"viewRule":"Public","modifyRule":"Self","regex":""},{"name":"Phone","visible":true,"viewRule":"Public","modifyRule":"Self","regex":""},{"name":"Country code","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":""},{"name":"Country/Region","visible":true,"viewRule":"Public","modifyRule":"Self","regex":""},{"name":"Location","visible":true,"viewRule":"Public","modifyRule":"Self","regex":""},{"name":"Affiliation","visible":true,"viewRule":"Public","modifyRule":"Self","regex":""},{"name":"Title","visible":true,"viewRule":"Public","modifyRule":"Self","regex":""},{"name":"Homepage","visible":true,"viewRule":"Public","modifyRule":"Self","regex":""},{"name":"Bio","visible":true,"viewRule":"Public","modifyRule":"Self","regex":""},{"name":"Tag","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":""},{"name":"Signup application","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":""},{"name":"Roles","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":""},{"name":"Permissions","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":""},{"name":"Groups","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":""},{"name":"3rd-party logins","visible":true,"viewRule":"Self","modifyRule":"Self","regex":""},{"name":"Properties","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":""},{"name":"Is admin","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":""},{"name":"Is forbidden","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":""},{"name":"Is deleted","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":""},{"name":"Multi-factor authentication","visible":true,"viewRule":"Self","modifyRule":"Self","regex":""},{"name":"WebAuthn credentials","visible":true,"viewRule":"Self","modifyRule":"Self","regex":""},{"name":"Managed accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":""}]
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.payment (owner, name, created_time, display_name, provider, type, product_name, product_display_name, detail, tag, currency, price, return_url, "user", person_name, person_id_card, person_email, person_phone, invoice_type, invoice_title, invoice_tax_id, invoice_remark, invoice_url, out_order_id, pay_url, success_url, state, message) FROM stdin;
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.permission (owner, name, created_time, display_name, description, users, groups, roles, domains, model, adapter, resource_type, resources, actions, effect, is_enabled, submitter, approver, approve_time, state) FROM stdin;
built-in	permission-built-in	2024-04-21T15:44:16Z	Built-in Permission	Built-in Permission	["built-in/*"]	[]	[]	[]	model-built-in		Application	["app-built-in"]	["Read","Write","Admin"]	Allow	t	admin	admin	2024-04-21T15:44:16Z	Approved
\.


--
-- Data for Name: permission_rule; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.permission_rule (id, ptype, v0, v1, v2, v3, v4, v5) FROM stdin;
1	p	built-in/*	app-built-in	read	allow		built-in/permission-built-in
2	p	built-in/*	app-built-in	write	allow		built-in/permission-built-in
3	p	built-in/*	app-built-in	admin	allow		built-in/permission-built-in
\.


--
-- Data for Name: plan; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.plan (owner, name, created_time, display_name, description, price, currency, period, product, payment_providers, is_enabled, role) FROM stdin;
\.


--
-- Data for Name: pricing; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.pricing (owner, name, created_time, display_name, description, plans, is_enabled, trial_duration, application) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.product (owner, name, created_time, display_name, image, detail, description, tag, currency, price, quantity, sold, providers, return_url, state) FROM stdin;
\.


--
-- Data for Name: provider; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.provider (owner, name, created_time, display_name, category, type, sub_type, method, client_id, client_secret, client_id2, client_secret2, cert, custom_auth_url, custom_token_url, custom_user_info_url, custom_logo, scopes, user_mapping, host, port, disable_ssl, title, content, receiver, region_id, sign_name, template_code, app_id, endpoint, intranet_endpoint, domain, bucket, path_prefix, metadata, id_p, issuer_url, enable_sign_authn_request, provider_url) FROM stdin;
admin	provider_captcha_default	2024-04-21T15:44:16Z	Captcha Default	Captcha	Default													null		0	f																f	
\.


--
-- Data for Name: radius_accounting; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.radius_accounting (owner, name, created_time, username, service_type, nas_id, nas_ip_addr, nas_port_id, nas_port_type, nas_port, framed_ip_addr, framed_ip_netmask, acct_session_id, acct_session_time, acct_input_total, acct_output_total, acct_input_packets, acct_output_packets, acct_terminate_cause, last_update, acct_start_time, acct_stop_time) FROM stdin;
\.


--
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.record (id, owner, name, created_time, organization, client_ip, "user", method, request_uri, action, language, object, response, is_triggered) FROM stdin;
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.resource (owner, name, created_time, "user", provider, application, tag, parent, file_name, file_type, file_format, file_size, url, description) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.role (owner, name, created_time, display_name, description, users, groups, roles, domains, is_enabled) FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.session (owner, name, application, created_time, session_id) FROM stdin;
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.subscription (owner, name, display_name, created_time, description, "user", pricing, plan, payment, start_time, end_time, period, state) FROM stdin;
\.


--
-- Data for Name: syncer; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.syncer (owner, name, created_time, organization, type, database_type, ssl_mode, ssh_type, host, port, "user", password, ssh_host, ssh_port, ssh_user, ssh_password, cert, database, "table", table_columns, affiliation_table, avatar_base_url, error_text, sync_interval, is_read_only, is_enabled) FROM stdin;
\.


--
-- Data for Name: token; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.token (owner, name, created_time, application, organization, "user", code, access_token, refresh_token, access_token_hash, refresh_token_hash, expires_in, scope, token_type, code_challenge, code_is_used, code_expire_in) FROM stdin;
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.transaction (owner, name, created_time, display_name, provider, category, type, product_name, product_display_name, detail, tag, currency, amount, return_url, "user", application, payment, state) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public."user" (owner, name, created_time, updated_time, deleted_time, id, external_id, type, password, password_salt, password_type, display_name, first_name, last_name, avatar, avatar_type, permanent_avatar, email, email_verified, phone, country_code, region, location, address, affiliation, title, id_card_type, id_card, homepage, bio, tag, language, gender, birthday, education, score, karma, ranking, balance, currency, is_default_avatar, is_online, is_admin, is_forbidden, is_deleted, signup_application, hash, pre_hash, access_key, access_secret, access_token, created_ip, last_signin_time, last_signin_ip, github, google, qq, wechat, facebook, dingtalk, weibo, gitee, linkedin, wecom, lark, gitlab, adfs, baidu, alipay, casdoor, infoflow, apple, azuread, azureadb2c, slack, steam, bilibili, okta, douyin, line, amazon, auth0, battlenet, bitbucket, box, cloudfoundry, dailymotion, deezer, digitalocean, discord, dropbox, eveonline, fitbit, gitea, heroku, influxcloud, instagram, intercom, kakao, lastfm, mailru, meetup, microsoftonline, naver, nextcloud, onedrive, oura, patreon, paypal, salesforce, shopify, soundcloud, spotify, strava, stripe, tiktok, tumblr, twitch, twitter, typetalk, uber, vk, wepay, xero, yahoo, yammer, yandex, zoom, metamask, web3onboard, custom, "webauthnCredentials", preferred_mfa_type, recovery_codes, totp_secret, mfa_phone_enabled, mfa_email_enabled, invitation, invitation_code, face_ids, ldap, properties, roles, permissions, groups, last_signin_wrong_time, signin_wrong_times, "managedAccounts") FROM stdin;
built-in	admin	2024-04-21T15:44:16Z			b0ab5676-f899-40dd-aac0-347caac99e3e		normal-user	123		plain	Admin			https://cdn.casbin.org/img/casbin.svg			admin@example.com	f	12345678910	US			[]	Example Inc.						staff					2000	0	1	0		f	f	t	f	f	app-built-in						127.0.0.1																																																																																\\x6e756c6c		null		f	f			null		{}	null	null	null		0	\\x6e756c6c
\.


--
-- Data for Name: verification_record; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.verification_record (owner, name, created_time, remote_addr, type, "user", provider, receiver, code, "time", is_used) FROM stdin;
\.


--
-- Data for Name: webhook; Type: TABLE DATA; Schema: public; Owner: dev-user
--

COPY public.webhook (owner, name, created_time, organization, url, method, content_type, headers, events, is_user_extended, single_org_only, is_enabled) FROM stdin;
\.


--
-- Name: casbin_api_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev-user
--

SELECT pg_catalog.setval('public.casbin_api_rule_id_seq', 61, true);


--
-- Name: casbin_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev-user
--

SELECT pg_catalog.setval('public.casbin_rule_id_seq', 1, false);


--
-- Name: casbin_user_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev-user
--

SELECT pg_catalog.setval('public.casbin_user_rule_id_seq', 1, false);


--
-- Name: permission_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev-user
--

SELECT pg_catalog.setval('public.permission_rule_id_seq', 3, true);


--
-- Name: record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev-user
--

SELECT pg_catalog.setval('public.record_id_seq', 1, false);


--
-- Name: adapter adapter_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.adapter
    ADD CONSTRAINT adapter_pkey PRIMARY KEY (owner, name);


--
-- Name: application application_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT application_pkey PRIMARY KEY (owner, name);


--
-- Name: casbin_api_rule casbin_api_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.casbin_api_rule
    ADD CONSTRAINT casbin_api_rule_pkey PRIMARY KEY (id);


--
-- Name: casbin_rule casbin_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.casbin_rule
    ADD CONSTRAINT casbin_rule_pkey PRIMARY KEY (id);


--
-- Name: casbin_user_rule casbin_user_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.casbin_user_rule
    ADD CONSTRAINT casbin_user_rule_pkey PRIMARY KEY (id);


--
-- Name: cert cert_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.cert
    ADD CONSTRAINT cert_pkey PRIMARY KEY (owner, name);


--
-- Name: enforcer enforcer_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.enforcer
    ADD CONSTRAINT enforcer_pkey PRIMARY KEY (owner, name);


--
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (owner, name);


--
-- Name: invitation invitation_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.invitation
    ADD CONSTRAINT invitation_pkey PRIMARY KEY (owner, name);


--
-- Name: ldap ldap_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.ldap
    ADD CONSTRAINT ldap_pkey PRIMARY KEY (id);


--
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (owner, name);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (owner, name);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (owner, name);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (owner, name);


--
-- Name: permission_rule permission_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.permission_rule
    ADD CONSTRAINT permission_rule_pkey PRIMARY KEY (id);


--
-- Name: plan plan_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT plan_pkey PRIMARY KEY (owner, name);


--
-- Name: pricing pricing_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.pricing
    ADD CONSTRAINT pricing_pkey PRIMARY KEY (owner, name);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (owner, name);


--
-- Name: provider provider_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (owner, name);


--
-- Name: radius_accounting radius_accounting_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.radius_accounting
    ADD CONSTRAINT radius_accounting_pkey PRIMARY KEY (owner, name);


--
-- Name: record record_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_pkey PRIMARY KEY (id);


--
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (owner, name);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (owner, name);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (owner, name, application);


--
-- Name: subscription subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_pkey PRIMARY KEY (owner, name);


--
-- Name: syncer syncer_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.syncer
    ADD CONSTRAINT syncer_pkey PRIMARY KEY (owner, name);


--
-- Name: token token_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pkey PRIMARY KEY (owner, name);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (owner, name);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (owner, name);


--
-- Name: verification_record verification_record_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.verification_record
    ADD CONSTRAINT verification_record_pkey PRIMARY KEY (owner, name);


--
-- Name: webhook webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: dev-user
--

ALTER TABLE ONLY public.webhook
    ADD CONSTRAINT webhook_pkey PRIMARY KEY (owner, name);


--
-- Name: IDX_casbin_api_rule_ptype; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_api_rule_ptype" ON public.casbin_api_rule USING btree (ptype);


--
-- Name: IDX_casbin_api_rule_v0; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_api_rule_v0" ON public.casbin_api_rule USING btree (v0);


--
-- Name: IDX_casbin_api_rule_v1; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_api_rule_v1" ON public.casbin_api_rule USING btree (v1);


--
-- Name: IDX_casbin_api_rule_v2; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_api_rule_v2" ON public.casbin_api_rule USING btree (v2);


--
-- Name: IDX_casbin_api_rule_v3; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_api_rule_v3" ON public.casbin_api_rule USING btree (v3);


--
-- Name: IDX_casbin_api_rule_v4; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_api_rule_v4" ON public.casbin_api_rule USING btree (v4);


--
-- Name: IDX_casbin_api_rule_v5; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_api_rule_v5" ON public.casbin_api_rule USING btree (v5);


--
-- Name: IDX_casbin_rule_ptype; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_rule_ptype" ON public.casbin_rule USING btree (ptype);


--
-- Name: IDX_casbin_rule_v0; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_rule_v0" ON public.casbin_rule USING btree (v0);


--
-- Name: IDX_casbin_rule_v1; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_rule_v1" ON public.casbin_rule USING btree (v1);


--
-- Name: IDX_casbin_rule_v2; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_rule_v2" ON public.casbin_rule USING btree (v2);


--
-- Name: IDX_casbin_rule_v3; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_rule_v3" ON public.casbin_rule USING btree (v3);


--
-- Name: IDX_casbin_rule_v4; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_rule_v4" ON public.casbin_rule USING btree (v4);


--
-- Name: IDX_casbin_rule_v5; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_rule_v5" ON public.casbin_rule USING btree (v5);


--
-- Name: IDX_casbin_user_rule_ptype; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_user_rule_ptype" ON public.casbin_user_rule USING btree (ptype);


--
-- Name: IDX_casbin_user_rule_v0; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_user_rule_v0" ON public.casbin_user_rule USING btree (v0);


--
-- Name: IDX_casbin_user_rule_v1; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_user_rule_v1" ON public.casbin_user_rule USING btree (v1);


--
-- Name: IDX_casbin_user_rule_v2; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_user_rule_v2" ON public.casbin_user_rule USING btree (v2);


--
-- Name: IDX_casbin_user_rule_v3; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_user_rule_v3" ON public.casbin_user_rule USING btree (v3);


--
-- Name: IDX_casbin_user_rule_v4; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_user_rule_v4" ON public.casbin_user_rule USING btree (v4);


--
-- Name: IDX_casbin_user_rule_v5; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_casbin_user_rule_v5" ON public.casbin_user_rule USING btree (v5);


--
-- Name: IDX_invitation_code; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_invitation_code" ON public.invitation USING btree (code);


--
-- Name: IDX_permission_rule_ptype; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_permission_rule_ptype" ON public.permission_rule USING btree (ptype);


--
-- Name: IDX_permission_rule_v0; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_permission_rule_v0" ON public.permission_rule USING btree (v0);


--
-- Name: IDX_permission_rule_v1; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_permission_rule_v1" ON public.permission_rule USING btree (v1);


--
-- Name: IDX_permission_rule_v2; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_permission_rule_v2" ON public.permission_rule USING btree (v2);


--
-- Name: IDX_permission_rule_v3; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_permission_rule_v3" ON public.permission_rule USING btree (v3);


--
-- Name: IDX_permission_rule_v4; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_permission_rule_v4" ON public.permission_rule USING btree (v4);


--
-- Name: IDX_permission_rule_v5; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_permission_rule_v5" ON public.permission_rule USING btree (v5);


--
-- Name: IDX_radius_accounting_acct_session_id; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_radius_accounting_acct_session_id" ON public.radius_accounting USING btree (acct_session_id);


--
-- Name: IDX_radius_accounting_acct_start_time; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_radius_accounting_acct_start_time" ON public.radius_accounting USING btree (acct_start_time);


--
-- Name: IDX_radius_accounting_acct_stop_time; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_radius_accounting_acct_stop_time" ON public.radius_accounting USING btree (acct_stop_time);


--
-- Name: IDX_radius_accounting_username; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_radius_accounting_username" ON public.radius_accounting USING btree (username);


--
-- Name: IDX_record_name; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_record_name" ON public.record USING btree (name);


--
-- Name: IDX_record_owner; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_record_owner" ON public.record USING btree (owner);


--
-- Name: IDX_token_access_token_hash; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_token_access_token_hash" ON public.token USING btree (access_token_hash);


--
-- Name: IDX_token_code; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_token_code" ON public.token USING btree (code);


--
-- Name: IDX_token_refresh_token_hash; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_token_refresh_token_hash" ON public.token USING btree (refresh_token_hash);


--
-- Name: IDX_user_created_time; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_user_created_time" ON public."user" USING btree (created_time);


--
-- Name: IDX_user_email; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_user_email" ON public."user" USING btree (email);


--
-- Name: IDX_user_external_id; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_user_external_id" ON public."user" USING btree (external_id);


--
-- Name: IDX_user_id; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_user_id" ON public."user" USING btree (id);


--
-- Name: IDX_user_id_card; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_user_id_card" ON public."user" USING btree (id_card);


--
-- Name: IDX_user_invitation; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_user_invitation" ON public."user" USING btree (invitation);


--
-- Name: IDX_user_invitation_code; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_user_invitation_code" ON public."user" USING btree (invitation_code);


--
-- Name: IDX_user_phone; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_user_phone" ON public."user" USING btree (phone);


--
-- Name: IDX_verification_record_receiver; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_verification_record_receiver" ON public.verification_record USING btree (receiver);


--
-- Name: IDX_webhook_organization; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE INDEX "IDX_webhook_organization" ON public.webhook USING btree (organization);


--
-- Name: UQE_group_name; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE UNIQUE INDEX "UQE_group_name" ON public."group" USING btree (name);


--
-- Name: UQE_provider_name; Type: INDEX; Schema: public; Owner: dev-user
--

CREATE UNIQUE INDEX "UQE_provider_name" ON public.provider USING btree (name);


--
-- PostgreSQL database dump complete
--

--
-- Database "full-stack-db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

--
-- Name: full-stack-db; Type: DATABASE; Schema: -; Owner: dev-user
--

CREATE DATABASE "full-stack-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "full-stack-db" OWNER TO "dev-user";

\connect -reuse-previous=on "dbname='full-stack-db'"

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

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

