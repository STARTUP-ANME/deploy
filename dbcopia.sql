--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: empresa; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA empresa;


ALTER SCHEMA empresa OWNER TO postgres;

--
-- Name: sistema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sistema;


ALTER SCHEMA sistema OWNER TO postgres;

--
-- Name: tramite; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tramite;


ALTER SCHEMA tramite OWNER TO postgres;

--
-- Name: estado_tipo_enum; Type: TYPE; Schema: empresa; Owner: postgres
--

CREATE TYPE empresa.estado_tipo_enum AS ENUM (
    'tramite',
    'bandeja'
);


ALTER TYPE empresa.estado_tipo_enum OWNER TO postgres;

--
-- Name: tipo_documento_tipo_enum; Type: TYPE; Schema: empresa; Owner: postgres
--

CREATE TYPE empresa.tipo_documento_tipo_enum AS ENUM (
    'Identificacion',
    'contrato',
    'tramite',
    'correlativo'
);


ALTER TYPE empresa.tipo_documento_tipo_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cargo; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.cargo (
    "cargoId" integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.cargo OWNER TO postgres;

--
-- Name: cargo_cargoId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."cargo_cargoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."cargo_cargoId_seq" OWNER TO postgres;

--
-- Name: cargo_cargoId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."cargo_cargoId_seq" OWNED BY empresa.cargo."cargoId";


--
-- Name: configuracion; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.configuracion (
    "configuracionId" integer NOT NULL,
    anio integer NOT NULL,
    uit numeric(10,2) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.configuracion OWNER TO postgres;

--
-- Name: configuracion_configuracionId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."configuracion_configuracionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."configuracion_configuracionId_seq" OWNER TO postgres;

--
-- Name: configuracion_configuracionId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."configuracion_configuracionId_seq" OWNED BY empresa.configuracion."configuracionId";


--
-- Name: dias; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.dias (
    "diaId" integer NOT NULL,
    codigo character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.dias OWNER TO postgres;

--
-- Name: dias_diaId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."dias_diaId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."dias_diaId_seq" OWNER TO postgres;

--
-- Name: dias_diaId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."dias_diaId_seq" OWNED BY empresa.dias."diaId";


--
-- Name: divisa; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.divisa (
    "divisaId" integer NOT NULL,
    simbolo character varying(10) NOT NULL,
    descripcion character varying(255) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.divisa OWNER TO postgres;

--
-- Name: divisa_divisaId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."divisa_divisaId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."divisa_divisaId_seq" OWNER TO postgres;

--
-- Name: divisa_divisaId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."divisa_divisaId_seq" OWNED BY empresa.divisa."divisaId";


--
-- Name: empresa; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.empresa (
    "empresaId" integer NOT NULL,
    nombre character varying(255) NOT NULL,
    abrev character varying(50),
    ruc character varying(11),
    direccion character varying(255),
    "ubigeoId" integer,
    fut boolean DEFAULT false NOT NULL,
    "plazoAdmin" integer,
    "plazoLegal" integer,
    "mesaParteId" integer,
    "porVencer" integer DEFAULT 0 NOT NULL,
    email character varying(255),
    contrasena character varying(255),
    servidor character varying(255),
    puerto integer,
    ssl boolean DEFAULT false NOT NULL,
    "plantillaProveido" character varying(255),
    "horaInicio" time without time zone,
    "horaFin" time without time zone,
    cargo character varying(255),
    "cargoInterno" character varying(255),
    licencia character varying(255),
    validar boolean DEFAULT false NOT NULL,
    "rutaMunicipalidad" character varying(255),
    manual boolean DEFAULT false NOT NULL,
    whatsapp boolean DEFAULT false NOT NULL,
    telefono character varying(15) DEFAULT ''::character varying NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    imagen character varying(255)
);


ALTER TABLE empresa.empresa OWNER TO postgres;

--
-- Name: empresa_empresaId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."empresa_empresaId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."empresa_empresaId_seq" OWNER TO postgres;

--
-- Name: empresa_empresaId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."empresa_empresaId_seq" OWNED BY empresa.empresa."empresaId";


--
-- Name: estado; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.estado (
    "estadoId" integer NOT NULL,
    codigo character varying(20) NOT NULL,
    descripcion character varying(255) NOT NULL,
    color character varying(30),
    tipo empresa.estado_tipo_enum NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.estado OWNER TO postgres;

--
-- Name: estado_estadoId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."estado_estadoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."estado_estadoId_seq" OWNER TO postgres;

--
-- Name: estado_estadoId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."estado_estadoId_seq" OWNED BY empresa.estado."estadoId";


--
-- Name: parametro; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.parametro (
    "parametroId" integer NOT NULL,
    codigo character varying(200) NOT NULL,
    grupo character varying(200) NOT NULL,
    descripcion character varying(200) NOT NULL,
    valor character varying(200) NOT NULL,
    "valorII" character varying(200) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.parametro OWNER TO postgres;

--
-- Name: parametro_parametroId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."parametro_parametroId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."parametro_parametroId_seq" OWNER TO postgres;

--
-- Name: parametro_parametroId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."parametro_parametroId_seq" OWNED BY empresa.parametro."parametroId";


--
-- Name: prioridad; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.prioridad (
    "prioridadId" integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.prioridad OWNER TO postgres;

--
-- Name: prioridad_prioridadId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."prioridad_prioridadId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."prioridad_prioridadId_seq" OWNER TO postgres;

--
-- Name: prioridad_prioridadId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."prioridad_prioridadId_seq" OWNED BY empresa.prioridad."prioridadId";


--
-- Name: proceso; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.proceso (
    "procesoId" integer NOT NULL,
    codigo character varying(20) NOT NULL,
    descripcion character varying(255) NOT NULL,
    valor character varying(255) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.proceso OWNER TO postgres;

--
-- Name: proceso_procesoId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."proceso_procesoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."proceso_procesoId_seq" OWNER TO postgres;

--
-- Name: proceso_procesoId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."proceso_procesoId_seq" OWNED BY empresa.proceso."procesoId";


--
-- Name: tipo_documento; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.tipo_documento (
    "tipoDocumentoId" integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    caracteres integer,
    tipo empresa.tipo_documento_tipo_enum NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.tipo_documento OWNER TO postgres;

--
-- Name: tipo_documento_tipoDocumentoId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."tipo_documento_tipoDocumentoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."tipo_documento_tipoDocumentoId_seq" OWNER TO postgres;

--
-- Name: tipo_documento_tipoDocumentoId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."tipo_documento_tipoDocumentoId_seq" OWNED BY empresa.tipo_documento."tipoDocumentoId";


--
-- Name: tipo_expediente; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.tipo_expediente (
    "tipoExpedienteId" integer NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion character varying(255) NOT NULL,
    color character varying(20) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.tipo_expediente OWNER TO postgres;

--
-- Name: tipo_expediente_tipoExpedienteId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."tipo_expediente_tipoExpedienteId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."tipo_expediente_tipoExpedienteId_seq" OWNER TO postgres;

--
-- Name: tipo_expediente_tipoExpedienteId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."tipo_expediente_tipoExpedienteId_seq" OWNED BY empresa.tipo_expediente."tipoExpedienteId";


--
-- Name: tipo_persona; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.tipo_persona (
    "tipoPersonaId" integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    tipo character varying(50) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.tipo_persona OWNER TO postgres;

--
-- Name: tipo_persona_tipoPersonaId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."tipo_persona_tipoPersonaId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."tipo_persona_tipoPersonaId_seq" OWNER TO postgres;

--
-- Name: tipo_persona_tipoPersonaId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."tipo_persona_tipoPersonaId_seq" OWNED BY empresa.tipo_persona."tipoPersonaId";


--
-- Name: tipo_tramite; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.tipo_tramite (
    "tipoTramiteId" integer NOT NULL,
    codigo character varying(255) NOT NULL,
    descripcion character varying(15) NOT NULL,
    valor integer NOT NULL,
    "valorII" integer NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.tipo_tramite OWNER TO postgres;

--
-- Name: tipo_tramite_tipoTramiteId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."tipo_tramite_tipoTramiteId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."tipo_tramite_tipoTramiteId_seq" OWNER TO postgres;

--
-- Name: tipo_tramite_tipoTramiteId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."tipo_tramite_tipoTramiteId_seq" OWNED BY empresa.tipo_tramite."tipoTramiteId";


--
-- Name: token; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.token (
    "tokenId" integer NOT NULL,
    token character varying(255) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.token OWNER TO postgres;

--
-- Name: token_tokenId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."token_tokenId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."token_tokenId_seq" OWNER TO postgres;

--
-- Name: token_tokenId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."token_tokenId_seq" OWNED BY empresa.token."tokenId";


--
-- Name: ubigeo; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.ubigeo (
    "ubigeoId" integer NOT NULL,
    "departamentoId" character varying(2) NOT NULL,
    "provinciaId" character varying(2) NOT NULL,
    "distritoId" character varying(2) NOT NULL,
    descripcion character varying(255) NOT NULL,
    "regionId" character varying(2),
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE empresa.ubigeo OWNER TO postgres;

--
-- Name: ubigeo_ubigeoId_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."ubigeo_ubigeoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."ubigeo_ubigeoId_seq" OWNER TO postgres;

--
-- Name: ubigeo_ubigeoId_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."ubigeo_ubigeoId_seq" OWNED BY empresa.ubigeo."ubigeoId";


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: accion; Type: TABLE; Schema: sistema; Owner: postgres
--

CREATE TABLE sistema.accion (
    "accionId" integer NOT NULL,
    descripcion character varying(200) NOT NULL,
    accion character varying(50) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE sistema.accion OWNER TO postgres;

--
-- Name: accion_accionId_seq; Type: SEQUENCE; Schema: sistema; Owner: postgres
--

CREATE SEQUENCE sistema."accion_accionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sistema."accion_accionId_seq" OWNER TO postgres;

--
-- Name: accion_accionId_seq; Type: SEQUENCE OWNED BY; Schema: sistema; Owner: postgres
--

ALTER SEQUENCE sistema."accion_accionId_seq" OWNED BY sistema.accion."accionId";


--
-- Name: config_email; Type: TABLE; Schema: sistema; Owner: postgres
--

CREATE TABLE sistema.config_email (
    "configEmailId" integer NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    "user" character varying(100) NOT NULL,
    pass character varying(200) NOT NULL,
    host character varying(50) NOT NULL,
    port character varying(20) NOT NULL,
    secure character varying(100) DEFAULT true NOT NULL,
    "companyId" integer NOT NULL
);


ALTER TABLE sistema.config_email OWNER TO postgres;

--
-- Name: config_email_configEmailId_seq; Type: SEQUENCE; Schema: sistema; Owner: postgres
--

CREATE SEQUENCE sistema."config_email_configEmailId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sistema."config_email_configEmailId_seq" OWNER TO postgres;

--
-- Name: config_email_configEmailId_seq; Type: SEQUENCE OWNED BY; Schema: sistema; Owner: postgres
--

ALTER SEQUENCE sistema."config_email_configEmailId_seq" OWNED BY sistema.config_email."configEmailId";


--
-- Name: menu; Type: TABLE; Schema: sistema; Owner: postgres
--

CREATE TABLE sistema.menu (
    "menuId" integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    contenido text,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE sistema.menu OWNER TO postgres;

--
-- Name: menu_accion; Type: TABLE; Schema: sistema; Owner: postgres
--

CREATE TABLE sistema.menu_accion (
    "menuId" integer NOT NULL,
    "accionId" integer NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE sistema.menu_accion OWNER TO postgres;

--
-- Name: menu_menuId_seq; Type: SEQUENCE; Schema: sistema; Owner: postgres
--

CREATE SEQUENCE sistema."menu_menuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sistema."menu_menuId_seq" OWNER TO postgres;

--
-- Name: menu_menuId_seq; Type: SEQUENCE OWNED BY; Schema: sistema; Owner: postgres
--

ALTER SEQUENCE sistema."menu_menuId_seq" OWNED BY sistema.menu."menuId";


--
-- Name: permiso_rol; Type: TABLE; Schema: sistema; Owner: postgres
--

CREATE TABLE sistema.permiso_rol (
    "rolId" integer NOT NULL,
    "menuId" integer NOT NULL,
    "accionId" integer NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE sistema.permiso_rol OWNER TO postgres;

--
-- Name: permiso_usuario; Type: TABLE; Schema: sistema; Owner: postgres
--

CREATE TABLE sistema.permiso_usuario (
    "usuarioId" integer NOT NULL,
    "menuId" integer NOT NULL,
    "accionId" integer NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE sistema.permiso_usuario OWNER TO postgres;

--
-- Name: permisos_menu; Type: TABLE; Schema: sistema; Owner: postgres
--

CREATE TABLE sistema.permisos_menu (
    "menuId" integer NOT NULL,
    "usuarioId" integer NOT NULL,
    ver bit(1) NOT NULL,
    agregar bit(1) NOT NULL,
    borrar bit(1) NOT NULL,
    modificar bit(1) NOT NULL,
    imprimir bit(1) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE sistema.permisos_menu OWNER TO postgres;

--
-- Name: rol; Type: TABLE; Schema: sistema; Owner: postgres
--

CREATE TABLE sistema.rol (
    "rolId" integer NOT NULL,
    descripcion character varying NOT NULL,
    detalle character varying DEFAULT ''::character varying NOT NULL,
    interno boolean NOT NULL,
    correlativo boolean,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE sistema.rol OWNER TO postgres;

--
-- Name: rol_rolId_seq; Type: SEQUENCE; Schema: sistema; Owner: postgres
--

CREATE SEQUENCE sistema."rol_rolId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sistema."rol_rolId_seq" OWNER TO postgres;

--
-- Name: rol_rolId_seq; Type: SEQUENCE OWNED BY; Schema: sistema; Owner: postgres
--

ALTER SEQUENCE sistema."rol_rolId_seq" OWNED BY sistema.rol."rolId";


--
-- Name: usuario; Type: TABLE; Schema: sistema; Owner: postgres
--

CREATE TABLE sistema.usuario (
    "usuarioId" integer NOT NULL,
    "personaId" integer,
    "usuarioNombre" character varying(150) NOT NULL,
    clave character varying(150) NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    "rolId" integer,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE sistema.usuario OWNER TO postgres;

--
-- Name: usuario_usuarioId_seq; Type: SEQUENCE; Schema: sistema; Owner: postgres
--

CREATE SEQUENCE sistema."usuario_usuarioId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sistema."usuario_usuarioId_seq" OWNER TO postgres;

--
-- Name: usuario_usuarioId_seq; Type: SEQUENCE OWNED BY; Schema: sistema; Owner: postgres
--

ALTER SEQUENCE sistema."usuario_usuarioId_seq" OWNED BY sistema.usuario."usuarioId";


--
-- Name: usuarios_u_organicas; Type: TABLE; Schema: sistema; Owner: postgres
--

CREATE TABLE sistema.usuarios_u_organicas (
    "usuarioId" integer NOT NULL,
    "unidadOrganicaId" integer NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "select" boolean DEFAULT false NOT NULL
);


ALTER TABLE sistema.usuarios_u_organicas OWNER TO postgres;

--
-- Name: archivo_adjunto; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.archivo_adjunto (
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "archivoAdjuntoId" integer NOT NULL,
    "expedienteId" integer NOT NULL,
    url character varying NOT NULL,
    "origenId" integer,
    destinos integer,
    procesos integer,
    tipo integer,
    nombre character varying NOT NULL,
    extension character varying NOT NULL
);


ALTER TABLE tramite.archivo_adjunto OWNER TO postgres;

--
-- Name: archivo_adjunto_archivoAdjuntoId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."archivo_adjunto_archivoAdjuntoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."archivo_adjunto_archivoAdjuntoId_seq" OWNER TO postgres;

--
-- Name: archivo_adjunto_archivoAdjuntoId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."archivo_adjunto_archivoAdjuntoId_seq" OWNED BY tramite.archivo_adjunto."archivoAdjuntoId";


--
-- Name: archivo_adjunto_mpv; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.archivo_adjunto_mpv (
    id integer NOT NULL,
    "relacionId" integer NOT NULL,
    nombre character varying(255) NOT NULL,
    extension character varying(50) NOT NULL,
    "nombreFTP" character varying(255) NOT NULL,
    ubicacion character varying(500) NOT NULL,
    contenido text NOT NULL,
    origen character varying(100) NOT NULL,
    destinos character varying(255) NOT NULL,
    procesos character varying(255) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.archivo_adjunto_mpv OWNER TO postgres;

--
-- Name: archivo_adjunto_mpv_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.archivo_adjunto_mpv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.archivo_adjunto_mpv_id_seq OWNER TO postgres;

--
-- Name: archivo_adjunto_mpv_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.archivo_adjunto_mpv_id_seq OWNED BY tramite.archivo_adjunto_mpv.id;


--
-- Name: calendario; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.calendario (
    "calendarioId" integer NOT NULL,
    title character varying(255) NOT NULL,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    day integer NOT NULL,
    color character varying(50) NOT NULL,
    textcolor character varying(50) NOT NULL,
    massive boolean NOT NULL,
    "allDay" boolean NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.calendario OWNER TO postgres;

--
-- Name: calendario_calendarioId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."calendario_calendarioId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."calendario_calendarioId_seq" OWNER TO postgres;

--
-- Name: calendario_calendarioId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."calendario_calendarioId_seq" OWNED BY tramite.calendario."calendarioId";


--
-- Name: correlativo; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.correlativo (
    "correlativoId" integer NOT NULL,
    "tipoExpedienteId" integer NOT NULL,
    anio integer NOT NULL,
    correlativo integer NOT NULL,
    longitud integer NOT NULL,
    prefijo character varying(50) NOT NULL,
    "sedeId" integer NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.correlativo OWNER TO postgres;

--
-- Name: correlativo_correlativoId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."correlativo_correlativoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."correlativo_correlativoId_seq" OWNER TO postgres;

--
-- Name: correlativo_correlativoId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."correlativo_correlativoId_seq" OWNED BY tramite.correlativo."correlativoId";


--
-- Name: correlativo_unidad; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.correlativo_unidad (
    "correlativoUnidadId" integer NOT NULL,
    "unidadOrganicaId" integer NOT NULL,
    "tipoDocumentoId" integer NOT NULL,
    anio integer NOT NULL,
    correlativo integer NOT NULL,
    longitud integer NOT NULL,
    prefijo character varying(50) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.correlativo_unidad OWNER TO postgres;

--
-- Name: correlativo_unidad_correlativoUnidadId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."correlativo_unidad_correlativoUnidadId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."correlativo_unidad_correlativoUnidadId_seq" OWNER TO postgres;

--
-- Name: correlativo_unidad_correlativoUnidadId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."correlativo_unidad_correlativoUnidadId_seq" OWNED BY tramite.correlativo_unidad."correlativoUnidadId";


--
-- Name: documento_interno; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.documento_interno (
    anio integer NOT NULL,
    fecha timestamp with time zone NOT NULL,
    destinatarios text,
    copias text,
    referencia text,
    contenido text,
    asunto character varying(255) NOT NULL,
    adjuntos text,
    "procesoReferenciaId" integer,
    "origenId" integer,
    "estadoId" integer,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "documentoInternoId" integer NOT NULL,
    "tipoDocumentoId" integer NOT NULL,
    "nroDocumento" character varying(150) NOT NULL
);


ALTER TABLE tramite.documento_interno OWNER TO postgres;

--
-- Name: documento_interno_documentoInternoId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."documento_interno_documentoInternoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."documento_interno_documentoInternoId_seq" OWNER TO postgres;

--
-- Name: documento_interno_documentoInternoId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."documento_interno_documentoInternoId_seq" OWNED BY tramite.documento_interno."documentoInternoId";


--
-- Name: encargado_uo; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.encargado_uo (
    "encargadoUOId" integer NOT NULL,
    "fechaInicio" timestamp with time zone NOT NULL,
    "fechaFin" timestamp with time zone,
    documento character varying(50) NOT NULL,
    "unidadOrganicaId" integer NOT NULL,
    "personaId" integer NOT NULL,
    "tipoDocumentoId" integer NOT NULL,
    "cargoId" integer NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.encargado_uo OWNER TO postgres;

--
-- Name: encargado_uo_encargadoUOId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."encargado_uo_encargadoUOId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."encargado_uo_encargadoUOId_seq" OWNER TO postgres;

--
-- Name: encargado_uo_encargadoUOId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."encargado_uo_encargadoUOId_seq" OWNED BY tramite.encargado_uo."encargadoUOId";


--
-- Name: expediente; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.expediente (
    "sedeId" integer NOT NULL,
    "nroDocumento" character varying(50) NOT NULL,
    cantidad integer NOT NULL,
    "tipoDocumentoId" integer,
    asunto character varying(255) NOT NULL,
    descripcion text,
    observaciones text,
    "tipoTramiteId" integer,
    "fechaLimite" timestamp with time zone,
    "prioridadId" integer,
    folio integer,
    monto numeric(10,2),
    "fechaRegistro" timestamp with time zone NOT NULL,
    "usuarioId" integer,
    "remitenteId" integer,
    "tipoExpedienteId" integer NOT NULL,
    "procedimientoId" integer,
    anio integer,
    "estadoId" integer,
    referencia character varying(255),
    "mpvId" integer,
    "origenId" integer,
    separado boolean DEFAULT false NOT NULL,
    "fechaRegularizado" timestamp with time zone,
    correo character varying(255),
    "personaRegistradorId" integer,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "expedienteId" integer NOT NULL,
    uuid character varying(255),
    "empresaId" integer
);


ALTER TABLE tramite.expediente OWNER TO postgres;

--
-- Name: expediente_expedienteId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."expediente_expedienteId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."expediente_expedienteId_seq" OWNER TO postgres;

--
-- Name: expediente_expedienteId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."expediente_expedienteId_seq" OWNED BY tramite.expediente."expedienteId";


--
-- Name: expediente_mpv; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.expediente_mpv (
    "expedienteMPVId" integer NOT NULL,
    "sedeId" integer NOT NULL,
    "nroDocumento" character varying(50) NOT NULL,
    cantidad integer NOT NULL,
    "tipoDocumentoId" integer NOT NULL,
    asunto character varying(255) NOT NULL,
    descripcion text,
    observaciones text,
    "tipoTramiteId" integer NOT NULL,
    "fechaLimite" timestamp with time zone,
    "prioridadId" integer NOT NULL,
    folio integer,
    monto numeric(10,2),
    "fechaRegistro" date NOT NULL,
    "remitenteId" integer NOT NULL,
    "tipoExpedienteId" integer NOT NULL,
    "procedimientoId" integer NOT NULL,
    anio integer,
    referencia character varying(255),
    correo character varying(255),
    "estadoId" integer NOT NULL,
    motivo text,
    "envioCorreo" boolean DEFAULT false NOT NULL,
    "solicitudId" integer,
    "personaRegistradorId" integer,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.expediente_mpv OWNER TO postgres;

--
-- Name: expediente_mpv_expedienteMPVId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."expediente_mpv_expedienteMPVId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."expediente_mpv_expedienteMPVId_seq" OWNER TO postgres;

--
-- Name: expediente_mpv_expedienteMPVId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."expediente_mpv_expedienteMPVId_seq" OWNED BY tramite.expediente_mpv."expedienteMPVId";


--
-- Name: expediente_vinculado; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.expediente_vinculado (
    id integer NOT NULL,
    "vinculoId" integer NOT NULL,
    "expedienteId" integer NOT NULL,
    "procesoId" integer NOT NULL,
    fecha timestamp with time zone NOT NULL,
    "documentoId" integer NOT NULL,
    documento character varying(255),
    motivo text,
    "usuarioId" integer NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    "referenciaId" integer,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.expediente_vinculado OWNER TO postgres;

--
-- Name: expediente_vinculado_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.expediente_vinculado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.expediente_vinculado_id_seq OWNER TO postgres;

--
-- Name: expediente_vinculado_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.expediente_vinculado_id_seq OWNED BY tramite.expediente_vinculado.id;


--
-- Name: partida_presupuestal; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.partida_presupuestal (
    "partidaId" integer NOT NULL,
    codigo character varying(50) NOT NULL,
    descripcion text,
    estado boolean DEFAULT true NOT NULL,
    detalle text,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.partida_presupuestal OWNER TO postgres;

--
-- Name: partida_presupuestal_partidaId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."partida_presupuestal_partidaId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."partida_presupuestal_partidaId_seq" OWNER TO postgres;

--
-- Name: partida_presupuestal_partidaId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."partida_presupuestal_partidaId_seq" OWNED BY tramite.partida_presupuestal."partidaId";


--
-- Name: personas; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.personas (
    "personaId" integer NOT NULL,
    nombres character varying(255),
    "apePaterno" character varying(100),
    "apeMaterno" character varying(100),
    documento character varying(50),
    direccion text,
    email character varying(100),
    "repLegal" boolean DEFAULT false NOT NULL,
    contrasena character varying(255),
    servidor character varying(50),
    puerto integer,
    ssl boolean,
    telefono character varying(20),
    "docRep" character varying(50),
    "nombresRep" character varying(100),
    "apPatRep" character varying(100),
    "apMatRep" character varying(100),
    "emailConfirmado" boolean DEFAULT false,
    token character varying(255),
    "tokenExpiration" timestamp without time zone,
    "tipoPersonaId" integer NOT NULL,
    "tipoDocumentoId" integer NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.personas OWNER TO postgres;

--
-- Name: personas_personaId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."personas_personaId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."personas_personaId_seq" OWNER TO postgres;

--
-- Name: personas_personaId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."personas_personaId_seq" OWNED BY tramite.personas."personaId";


--
-- Name: procedimiento; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.procedimiento (
    "procedimientoId" integer NOT NULL,
    "unidadOrganicaId" integer NOT NULL,
    descripcion text NOT NULL,
    plazo integer,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.procedimiento OWNER TO postgres;

--
-- Name: procedimiento_procedimientoId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."procedimiento_procedimientoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."procedimiento_procedimientoId_seq" OWNER TO postgres;

--
-- Name: procedimiento_procedimientoId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."procedimiento_procedimientoId_seq" OWNED BY tramite.procedimiento."procedimientoId";


--
-- Name: proceso_tramite; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.proceso_tramite (
    "procesoTramiteId" integer NOT NULL,
    "expedienteId" integer NOT NULL,
    "origenId" integer NOT NULL,
    "destinoId" integer NOT NULL,
    etapa text NOT NULL,
    orden integer NOT NULL,
    "referenciaId" integer,
    "fRegistro" timestamp without time zone,
    "fRecibido" timestamp without time zone,
    "fAtencion" timestamp without time zone,
    observaciones text,
    motivo text,
    leido boolean DEFAULT false NOT NULL,
    "fLeido" timestamp without time zone,
    "estadoId" integer,
    tramites text,
    "tipoEnvioId" integer,
    "documentoId" integer,
    documento text,
    folios text,
    asunto text,
    importancia text,
    "usuarioCreaId" integer,
    "usuarioRecibeId" integer,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.proceso_tramite OWNER TO postgres;

--
-- Name: proceso_tramite_procesoTramiteId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."proceso_tramite_procesoTramiteId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."proceso_tramite_procesoTramiteId_seq" OWNER TO postgres;

--
-- Name: proceso_tramite_procesoTramiteId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."proceso_tramite_procesoTramiteId_seq" OWNED BY tramite.proceso_tramite."procesoTramiteId";


--
-- Name: requisito; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.requisito (
    "requisitoId" integer NOT NULL,
    "expedienteId" integer NOT NULL,
    "rubroId" integer NOT NULL,
    cantidad integer NOT NULL,
    referencial text,
    porcentaje numeric(5,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.requisito OWNER TO postgres;

--
-- Name: requisito_requisitoId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."requisito_requisitoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."requisito_requisitoId_seq" OWNER TO postgres;

--
-- Name: requisito_requisitoId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."requisito_requisitoId_seq" OWNED BY tramite.requisito."requisitoId";


--
-- Name: rubro; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.rubro (
    "rubroId" integer NOT NULL,
    "procedimientoId" integer NOT NULL,
    "partidaId" integer,
    descripcion text NOT NULL,
    tipo character varying(50) NOT NULL,
    monto numeric(10,2) NOT NULL,
    obligatorio boolean NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.rubro OWNER TO postgres;

--
-- Name: rubro_rubroId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."rubro_rubroId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."rubro_rubroId_seq" OWNER TO postgres;

--
-- Name: rubro_rubroId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."rubro_rubroId_seq" OWNED BY tramite.rubro."rubroId";


--
-- Name: sede; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.sede (
    "sedeId" integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(255) NOT NULL,
    abreviacion character varying(20) NOT NULL,
    "ubigeoId" integer NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.sede OWNER TO postgres;

--
-- Name: sede_sedeId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."sede_sedeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."sede_sedeId_seq" OWNER TO postgres;

--
-- Name: sede_sedeId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."sede_sedeId_seq" OWNED BY tramite.sede."sedeId";


--
-- Name: solicitud_mpv; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.solicitud_mpv (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    fecha date NOT NULL,
    codigo character varying(50) NOT NULL,
    valido boolean NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.solicitud_mpv OWNER TO postgres;

--
-- Name: solicitud_mpv_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.solicitud_mpv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.solicitud_mpv_id_seq OWNER TO postgres;

--
-- Name: solicitud_mpv_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.solicitud_mpv_id_seq OWNED BY tramite.solicitud_mpv.id;


--
-- Name: unidad_organica; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.unidad_organica (
    "unidadOrganicaId" integer NOT NULL,
    abreviatura character varying(50) NOT NULL,
    nombre character varying(255) NOT NULL,
    nivel integer NOT NULL,
    "sedeId" integer,
    tupa boolean DEFAULT false NOT NULL,
    "relacionId" integer,
    estado boolean DEFAULT true NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "ordenId" integer
);


ALTER TABLE tramite.unidad_organica OWNER TO postgres;

--
-- Name: unidad_organica_unidadOrganicaId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."unidad_organica_unidadOrganicaId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."unidad_organica_unidadOrganicaId_seq" OWNER TO postgres;

--
-- Name: unidad_organica_unidadOrganicaId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."unidad_organica_unidadOrganicaId_seq" OWNED BY tramite.unidad_organica."unidadOrganicaId";


--
-- Name: cargo cargoId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.cargo ALTER COLUMN "cargoId" SET DEFAULT nextval('empresa."cargo_cargoId_seq"'::regclass);


--
-- Name: configuracion configuracionId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.configuracion ALTER COLUMN "configuracionId" SET DEFAULT nextval('empresa."configuracion_configuracionId_seq"'::regclass);


--
-- Name: dias diaId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.dias ALTER COLUMN "diaId" SET DEFAULT nextval('empresa."dias_diaId_seq"'::regclass);


--
-- Name: divisa divisaId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.divisa ALTER COLUMN "divisaId" SET DEFAULT nextval('empresa."divisa_divisaId_seq"'::regclass);


--
-- Name: empresa empresaId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.empresa ALTER COLUMN "empresaId" SET DEFAULT nextval('empresa."empresa_empresaId_seq"'::regclass);


--
-- Name: estado estadoId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.estado ALTER COLUMN "estadoId" SET DEFAULT nextval('empresa."estado_estadoId_seq"'::regclass);


--
-- Name: parametro parametroId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.parametro ALTER COLUMN "parametroId" SET DEFAULT nextval('empresa."parametro_parametroId_seq"'::regclass);


--
-- Name: prioridad prioridadId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.prioridad ALTER COLUMN "prioridadId" SET DEFAULT nextval('empresa."prioridad_prioridadId_seq"'::regclass);


--
-- Name: proceso procesoId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.proceso ALTER COLUMN "procesoId" SET DEFAULT nextval('empresa."proceso_procesoId_seq"'::regclass);


--
-- Name: tipo_documento tipoDocumentoId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_documento ALTER COLUMN "tipoDocumentoId" SET DEFAULT nextval('empresa."tipo_documento_tipoDocumentoId_seq"'::regclass);


--
-- Name: tipo_expediente tipoExpedienteId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_expediente ALTER COLUMN "tipoExpedienteId" SET DEFAULT nextval('empresa."tipo_expediente_tipoExpedienteId_seq"'::regclass);


--
-- Name: tipo_persona tipoPersonaId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_persona ALTER COLUMN "tipoPersonaId" SET DEFAULT nextval('empresa."tipo_persona_tipoPersonaId_seq"'::regclass);


--
-- Name: tipo_tramite tipoTramiteId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_tramite ALTER COLUMN "tipoTramiteId" SET DEFAULT nextval('empresa."tipo_tramite_tipoTramiteId_seq"'::regclass);


--
-- Name: token tokenId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.token ALTER COLUMN "tokenId" SET DEFAULT nextval('empresa."token_tokenId_seq"'::regclass);


--
-- Name: ubigeo ubigeoId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.ubigeo ALTER COLUMN "ubigeoId" SET DEFAULT nextval('empresa."ubigeo_ubigeoId_seq"'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: accion accionId; Type: DEFAULT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.accion ALTER COLUMN "accionId" SET DEFAULT nextval('sistema."accion_accionId_seq"'::regclass);


--
-- Name: config_email configEmailId; Type: DEFAULT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.config_email ALTER COLUMN "configEmailId" SET DEFAULT nextval('sistema."config_email_configEmailId_seq"'::regclass);


--
-- Name: menu menuId; Type: DEFAULT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.menu ALTER COLUMN "menuId" SET DEFAULT nextval('sistema."menu_menuId_seq"'::regclass);


--
-- Name: rol rolId; Type: DEFAULT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.rol ALTER COLUMN "rolId" SET DEFAULT nextval('sistema."rol_rolId_seq"'::regclass);


--
-- Name: usuario usuarioId; Type: DEFAULT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.usuario ALTER COLUMN "usuarioId" SET DEFAULT nextval('sistema."usuario_usuarioId_seq"'::regclass);


--
-- Name: archivo_adjunto archivoAdjuntoId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.archivo_adjunto ALTER COLUMN "archivoAdjuntoId" SET DEFAULT nextval('tramite."archivo_adjunto_archivoAdjuntoId_seq"'::regclass);


--
-- Name: archivo_adjunto_mpv id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.archivo_adjunto_mpv ALTER COLUMN id SET DEFAULT nextval('tramite.archivo_adjunto_mpv_id_seq'::regclass);


--
-- Name: calendario calendarioId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.calendario ALTER COLUMN "calendarioId" SET DEFAULT nextval('tramite."calendario_calendarioId_seq"'::regclass);


--
-- Name: correlativo correlativoId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo ALTER COLUMN "correlativoId" SET DEFAULT nextval('tramite."correlativo_correlativoId_seq"'::regclass);


--
-- Name: correlativo_unidad correlativoUnidadId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo_unidad ALTER COLUMN "correlativoUnidadId" SET DEFAULT nextval('tramite."correlativo_unidad_correlativoUnidadId_seq"'::regclass);


--
-- Name: documento_interno documentoInternoId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.documento_interno ALTER COLUMN "documentoInternoId" SET DEFAULT nextval('tramite."documento_interno_documentoInternoId_seq"'::regclass);


--
-- Name: encargado_uo encargadoUOId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.encargado_uo ALTER COLUMN "encargadoUOId" SET DEFAULT nextval('tramite."encargado_uo_encargadoUOId_seq"'::regclass);


--
-- Name: expediente expedienteId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente ALTER COLUMN "expedienteId" SET DEFAULT nextval('tramite."expediente_expedienteId_seq"'::regclass);


--
-- Name: expediente_mpv expedienteMPVId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente_mpv ALTER COLUMN "expedienteMPVId" SET DEFAULT nextval('tramite."expediente_mpv_expedienteMPVId_seq"'::regclass);


--
-- Name: expediente_vinculado id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente_vinculado ALTER COLUMN id SET DEFAULT nextval('tramite.expediente_vinculado_id_seq'::regclass);


--
-- Name: partida_presupuestal partidaId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.partida_presupuestal ALTER COLUMN "partidaId" SET DEFAULT nextval('tramite."partida_presupuestal_partidaId_seq"'::regclass);


--
-- Name: personas personaId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.personas ALTER COLUMN "personaId" SET DEFAULT nextval('tramite."personas_personaId_seq"'::regclass);


--
-- Name: procedimiento procedimientoId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.procedimiento ALTER COLUMN "procedimientoId" SET DEFAULT nextval('tramite."procedimiento_procedimientoId_seq"'::regclass);


--
-- Name: proceso_tramite procesoTramiteId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite ALTER COLUMN "procesoTramiteId" SET DEFAULT nextval('tramite."proceso_tramite_procesoTramiteId_seq"'::regclass);


--
-- Name: requisito requisitoId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.requisito ALTER COLUMN "requisitoId" SET DEFAULT nextval('tramite."requisito_requisitoId_seq"'::regclass);


--
-- Name: rubro rubroId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.rubro ALTER COLUMN "rubroId" SET DEFAULT nextval('tramite."rubro_rubroId_seq"'::regclass);


--
-- Name: sede sedeId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.sede ALTER COLUMN "sedeId" SET DEFAULT nextval('tramite."sede_sedeId_seq"'::regclass);


--
-- Name: solicitud_mpv id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.solicitud_mpv ALTER COLUMN id SET DEFAULT nextval('tramite.solicitud_mpv_id_seq'::regclass);


--
-- Name: unidad_organica unidadOrganicaId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.unidad_organica ALTER COLUMN "unidadOrganicaId" SET DEFAULT nextval('tramite."unidad_organica_unidadOrganicaId_seq"'::regclass);


--
-- Data for Name: cargo; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.cargo ("cargoId", descripcion, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
1	GERENTE	0	2024-10-16 12:35:46.044993	\N	\N	2024-10-16 12:35:46.044993	\N	\N
2	SUBGERENTE	0	2024-10-16 12:35:57.276362	\N	\N	2024-10-16 12:35:57.276362	\N	\N
3	JEFE	0	2024-10-16 12:36:03.787902	\N	\N	2024-10-16 12:36:03.787902	\N	\N
4	ENCARGADO(A)	0	2024-10-16 12:36:09.707139	\N	\N	2024-10-16 12:36:09.707139	\N	\N
5	ASISTENTE	0	2024-10-16 12:36:16.072327	\N	\N	2024-10-16 12:36:16.072327	\N	\N
6	SECRETARIO(A)	0	2024-10-16 12:36:22.803085	\N	\N	2024-10-16 12:36:22.803085	\N	\N
\.


--
-- Data for Name: configuracion; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.configuracion ("configuracionId", anio, uit, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
1	2020	4300.00	0	2024-10-02 12:50:45.054056	\N	\N	2024-10-02 12:50:45.054056	\N	\N
2	2023	4950.00	0	2024-10-02 12:50:45.054056	\N	\N	2024-10-02 12:50:45.054056	\N	\N
\.


--
-- Data for Name: dias; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.dias ("diaId", codigo, descripcion, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: divisa; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.divisa ("divisaId", simbolo, descripcion, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.empresa ("empresaId", nombre, abrev, ruc, direccion, "ubigeoId", fut, "plazoAdmin", "plazoLegal", "mesaParteId", "porVencer", email, contrasena, servidor, puerto, ssl, "plantillaProveido", "horaInicio", "horaFin", cargo, "cargoInterno", licencia, validar, "rutaMunicipalidad", manual, whatsapp, telefono, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", imagen) FROM stdin;
1	MUNICIPALIDAD ANME	AM	10703543958	Calle lima dmeed	1177	f	\N	\N	131	15	ANGEL@GMAILCOM	121212	121	21	f	\N	08:00:00	05:00:00	\N	\N	\N	f	WWW.COMO.PE	f	f		0	2024-10-16 23:51:22.027619	\N	\N	2024-10-16 23:51:22.027619	\N	\N	https://upload.wikimedia.org/wikipedia/commons/1/1c/EscudoPuebloLibreLima.png
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.estado ("estadoId", codigo, descripcion, color, tipo, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
503	E,S	REGISTRADO	 	tramite	0	2024-10-11 12:34:08.215138	\N	\N	2024-10-11 12:34:08.215138	\N	\N
504	E,C,S	ENVIADO	 	tramite	0	2024-10-22 22:45:15.479265	\N	\N	2024-10-22 22:45:15.479265	\N	\N
\.


--
-- Data for Name: parametro; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.parametro ("parametroId", codigo, grupo, descripcion, valor, "valorII", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: prioridad; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.prioridad ("prioridadId", descripcion, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
272	URGENTE	0	2024-10-06 14:55:21.494054	\N	\N	2024-10-06 14:55:21.494054	\N	\N
271	NORMAL	0	2024-10-06 14:55:21.494054	\N	\N	2024-10-06 14:55:21.494054	\N	\N
\.


--
-- Data for Name: proceso; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.proceso ("procesoId", codigo, descripcion, valor, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: tipo_documento; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.tipo_documento ("tipoDocumentoId", descripcion, caracteres, tipo, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
301	DNI	8	Identificacion	0	2024-10-05 17:05:45.918019	\N	\N	2024-10-05 17:05:45.918019	\N	\N
302	RUC	11	Identificacion	0	2024-10-05 17:05:45.918019	\N	\N	2024-10-05 17:05:45.918019	\N	\N
602	OFICIO	0	tramite	0	2024-10-05 17:16:14.495428	\N	\N	2024-10-05 17:16:14.495428	\N	\N
603	OFICIO MULTIPLE	0	tramite	0	2024-10-05 17:16:32.376284	\N	\N	2024-10-05 17:16:32.376284	\N	\N
2	RESOLUCIÓN	0	contrato	0	2024-10-16 12:45:19.791922	\N	\N	2024-10-16 12:45:19.791922	\N	\N
3	CONTRATO	0	contrato	0	2024-10-16 12:45:19.791922	\N	\N	2024-10-16 12:45:19.791922	\N	\N
4	MEMORANDUM	0	contrato	0	2024-10-16 12:45:19.791922	\N	\N	2024-10-16 12:45:19.791922	\N	\N
\.


--
-- Data for Name: tipo_expediente; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.tipo_expediente ("tipoExpedienteId", codigo, descripcion, color, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
261	TDE	EXTERNO	#2CC9FD	0	2024-10-18 02:24:36.445349	\N	\N	2024-10-18 02:24:36.445349	\N	\N
262	TDI	INTERNO	#FE8D54	0	2024-10-18 02:25:26.991458	\N	\N	2024-10-18 02:25:26.991458	\N	\N
263	MPV	MESA PARTES VIRTUAL	#74d42e	0	2024-10-18 02:25:26.991458	\N	\N	2024-10-18 02:25:26.991458	\N	\N
\.


--
-- Data for Name: tipo_persona; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.tipo_persona ("tipoPersonaId", descripcion, tipo, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
291	NATURAL	natural	0	2024-10-05 14:16:42.160879	\N	\N	2024-10-05 14:16:42.160879	\N	\N
292	JURIDICA	juridica	0	2024-10-05 14:16:42.160879	\N	\N	2024-10-05 14:16:42.160879	\N	\N
\.


--
-- Data for Name: tipo_tramite; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.tipo_tramite ("tipoTramiteId", codigo, descripcion, valor, "valorII", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
283	A	TUPA	15	3	0	2024-10-06 14:35:01.032075	\N	\N	2024-10-06 14:35:01.032075	\N	\N
282	A	LEGAL	15	3	0	2024-10-06 14:35:01.032075	\N	\N	2024-10-06 14:35:01.032075	\N	\N
281	A	ADMINISTRATIVO	15	3	0	2024-10-06 14:35:01.032075	\N	\N	2024-10-06 14:35:01.032075	\N	\N
284	E	ADMINISTRATIVO	7	1	0	2024-10-06 14:39:09.971781	\N	\N	2024-10-06 14:39:09.971781	\N	\N
\.


--
-- Data for Name: token; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.token ("tokenId", token, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: ubigeo; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.ubigeo ("ubigeoId", "departamentoId", "provinciaId", "distritoId", descripcion, "regionId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
1	01	01	00	CHACHAPOYAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2	01	00	00	DEPARTAMENTO AMAZONAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
3	01	02	00	BAGUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
4	02	00	00	DEPARTAMENTO ANCASH	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
5	01	03	00	BONGARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
6	03	00	00	DEPARTAMENTO APURIMAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
7	01	04	00	LUYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
8	04	00	00	DEPARTAMENTO AREQUIPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
9	01	05	00	RODRIGUEZ DE MENDOZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
10	05	00	00	DEPARTAMENTO AYACUCHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
11	01	06	00	CONDORCANQUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
12	06	00	00	DEPARTAMENTO CAJAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
13	01	07	00	UTCUBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
14	07	00	00	DEPARTAMENTO CUSCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
15	02	01	00	HUARAZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
16	08	00	00	DEPARTAMENTO HUANCAVELICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
17	02	02	00	AIJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
18	09	00	00	DEPARTAMENTO HUANUCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
19	02	03	00	BOLOGNESI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
20	10	00	00	DEPARTAMENTO ICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
21	02	04	00	CARHUAZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
22	01	01	01	CHACHAPOYAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
23	11	00	00	DEPARTAMENTO JUNIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
24	01	01	02	ASUNCION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
25	02	05	00	CASMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
26	12	00	00	DEPARTAMENTO LA LIBERTAD	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
27	01	01	03	BALSAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
28	02	06	00	CORONGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
29	13	00	00	DEPARTAMENTO LAMBAYEQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
30	01	01	04	CHETO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
31	02	07	00	HUAYLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
32	14	00	00	DEPARTAMENTO LIMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
33	01	01	05	CHILIQUIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
34	02	08	00	HUARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
35	15	00	00	DEPARTAMENTO LORETO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
36	01	01	06	CHUQUIBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
37	02	09	00	MARISCAL LUZURIAGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
38	16	00	00	DEPARTAMENTO MADRE DE DIOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
39	01	01	07	GRANADA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
40	02	10	00	PALLASCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
41	17	00	00	DEPARTAMENTO MOQUEGUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
42	02	11	00	POMABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
43	01	01	08	HUANCAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
44	18	00	00	DEPARTAMENTO PASCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
45	02	12	00	RECUAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
46	01	01	09	LA JALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
47	19	00	00	DEPARTAMENTO PIURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
48	02	13	00	SANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
49	01	01	10	LEIMEBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
50	20	00	00	DEPARTAMENTO PUNO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
51	02	14	00	SIHUAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
52	01	01	11	LEVANTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
53	21	00	00	DEPARTAMENTO SAN MARTIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
54	02	15	00	YUNGAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
55	01	01	12	MAGDALENA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
56	22	00	00	DEPARTAMENTO TACNA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
57	02	16	00	ANTONIO RAIMONDI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
58	01	01	13	MARISCAL CASTILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
59	23	00	00	DEPARTAMENTO TUMBES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
60	02	17	00	CARLOS FERMIN FITZCARRALD	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
61	01	01	14	MOLINOPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
62	24	00	00	PROV. CONST. DEL CALLAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
63	02	18	00	ASUNCION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
64	01	01	15	MONTEVIDEO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
65	25	00	00	DEPARTAMENTO UCAYALI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
66	02	19	00	HUARMEY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
67	01	01	16	OLLEROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
68	02	20	00	OCROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
69	01	01	17	QUINJALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
70	03	01	00	ABANCAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
71	01	01	18	SAN FCO DE DAGUAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
72	03	02	00	AYMARAES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
73	01	01	19	SAN ISIDRO DE MAINO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
74	03	03	00	ANDAHUAYLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
75	01	01	20	SOLOCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
76	03	04	00	ANTABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
77	01	01	21	SONCHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
78	03	05	00	COTABAMBAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
79	01	02	01	LA PECA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
80	03	06	00	GRAU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
81	01	02	02	ARAMANGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
82	03	07	00	CHINCHEROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
83	01	02	03	COPALLIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
84	01	02	04	EL PARCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
85	04	01	00	AREQUIPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
86	01	02	05	BAGUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
87	04	02	00	CAYLLOMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
88	01	02	06	IMAZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
89	04	03	00	CAMANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
90	01	03	01	JUMBILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
91	04	04	00	CARAVELI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
92	01	03	02	COROSHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
93	04	05	00	CASTILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
94	01	03	03	CUISPES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
95	04	06	00	CONDESUYOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
96	01	03	04	CHISQUILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
97	04	07	00	ISLAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
98	01	03	05	CHURUJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
99	01	03	06	FLORIDA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
100	04	08	00	LA UNION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
101	01	03	07	RECTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
102	05	01	00	HUAMANGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
103	01	03	08	SAN CARLOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
104	05	02	00	CANGALLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
105	01	03	09	SHIPASBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
106	05	03	00	HUANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
107	01	03	10	VALERA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
108	05	04	00	LA MAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
109	01	03	11	YAMBRASBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
110	05	05	00	LUCANAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
111	01	03	12	JAZAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
112	05	06	00	PARINACOCHAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
113	01	04	01	LAMUD	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
114	05	07	00	VICTOR FAJARDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
115	01	04	02	CAMPORREDONDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
116	05	08	00	HUANCA SANCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
117	01	04	03	COCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
118	05	09	00	VILCAS HUAMAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
119	01	04	04	COLCAMAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
120	05	10	00	PAUCAR DEL SARA SARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
121	01	04	05	CONILA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
122	05	11	00	SUCRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
123	01	04	06	INGUILPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
124	06	01	00	CAJAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
125	01	04	07	LONGUITA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
126	06	02	00	CAJABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
127	01	04	08	LONYA CHICO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
128	06	03	00	CELENDIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
129	01	04	09	LUYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
130	06	04	00	CONTUMAZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
131	01	04	10	LUYA VIEJO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
132	06	05	00	CUTERVO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
133	01	04	11	MARIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
134	06	06	00	CHOTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
135	01	04	12	OCALLI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
136	06	07	00	HUALGAYOC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
137	01	04	13	OCUMAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
138	06	08	00	JAEN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
139	01	04	14	PISUQUIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
140	06	09	00	SANTA CRUZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
141	01	04	15	SAN CRISTOBAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
142	06	10	00	SAN MIGUEL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
143	01	04	16	SAN FRANCISCO DE YESO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
144	06	11	00	SAN IGNACIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
145	01	04	17	SAN JERONIMO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
146	06	12	00	SAN MARCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
147	01	04	18	SAN JUAN DE LOPECANCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
148	06	13	00	SAN PABLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
149	01	04	19	SANTA CATALINA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
150	07	01	00	CUSCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
151	07	02	00	ACOMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
152	01	04	20	SANTO TOMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
153	01	04	21	TINGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
154	07	03	00	ANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
155	01	04	22	TRITA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
156	07	04	00	CALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
157	01	04	23	PROVIDENCIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
158	07	05	00	CANAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
159	01	05	01	SAN NICOLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
160	07	06	00	CANCHIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
161	07	07	00	CHUMBIVILCAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
162	01	05	02	COCHAMAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
163	07	08	00	ESPINAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
164	01	05	03	CHIRIMOTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
165	07	09	00	LA CONVENCION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
166	01	05	04	HUAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
167	07	10	00	PARURO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
168	01	05	05	LIMABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
169	07	11	00	PAUCARTAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
170	01	05	06	LONGAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
171	07	12	00	QUISPICANCHIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
172	01	05	07	MILPUC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
173	07	13	00	URUBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
174	01	05	08	MCAL BENAVIDES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
175	08	01	00	HUANCAVELICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
176	01	05	09	OMIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
177	08	02	00	ACOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
178	01	05	10	SANTA ROSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
179	08	03	00	ANGARAES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
180	01	05	11	TOTORA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
181	08	04	00	CASTROVIRREYNA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
182	01	05	12	VISTA ALEGRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
183	08	05	00	TAYACAJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
184	01	06	01	NIEVA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
185	08	06	00	HUAYTARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
186	08	07	00	CHURCAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
187	01	06	02	RIO SANTIAGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
188	09	01	00	HUANUCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
189	01	06	03	EL CENEPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
190	09	02	00	AMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
191	01	07	01	BAGUA GRANDE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
192	09	03	00	DOS DE MAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
193	01	07	02	CAJARURO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
194	09	04	00	HUAMALIES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
195	01	07	03	CUMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
196	09	05	00	MARANON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
197	01	07	04	EL MILAGRO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
198	09	06	00	LEONCIO PRADO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
199	01	07	05	JAMALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
200	09	07	00	PACHITEA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
201	01	07	06	LONYA GRANDE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
202	09	08	00	PUERTO INCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
203	01	07	07	YAMON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
204	09	09	00	HUACAYBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
205	02	01	01	HUARAZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
206	09	10	00	LAURICOCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
207	02	01	02	INDEPENDENCIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
208	09	11	00	YAROWILCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
209	02	01	03	COCHABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
210	10	01	00	ICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
211	02	01	04	COLCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
212	10	02	00	CHINCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
213	02	01	05	HUANCHAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
214	10	03	00	NAZCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
215	02	01	06	JANGAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
216	10	04	00	PISCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
217	02	01	07	LA LIBERTAD	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
218	10	05	00	PALPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
219	02	01	08	OLLEROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
220	11	01	00	HUANCAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
221	02	01	09	PAMPAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
222	11	02	00	CONCEPCION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
223	02	01	10	PARIACOTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
224	11	03	00	JAUJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
225	02	01	11	PIRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
226	11	04	00	JUNIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
227	02	01	12	TARICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
228	11	05	00	TARMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
229	02	02	01	AIJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
230	11	06	00	YAULI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
231	02	02	03	CORIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
232	11	07	00	SATIPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
233	02	02	05	HUACLLAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
234	11	08	00	CHANCHAMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
235	02	02	06	LA MERCED	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
236	11	09	00	CHUPACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
237	02	02	08	SUCCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
238	12	01	00	TRUJILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
239	02	03	01	CHIQUIAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
240	12	02	00	BOLIVAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
241	02	03	02	A PARDO LEZAMETA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
242	12	03	00	SANCHEZ CARRION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
243	02	03	04	AQUIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
244	12	04	00	OTUZCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
245	02	03	05	CAJACAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
246	12	05	00	PACASMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
247	02	03	10	HUAYLLACAYAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
248	12	06	00	PATAZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
249	02	03	11	HUASTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
250	12	07	00	SANTIAGO DE CHUCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
251	02	03	13	MANGAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
252	12	08	00	ASCOPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
253	02	03	15	PACLLON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
254	12	09	00	CHEPEN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
255	02	03	17	SAN MIGUEL DE CORPANQUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
256	12	10	00	JULCAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
257	02	03	20	TICLLOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
258	12	11	00	GRAN CHIMU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
259	02	03	21	ANTONIO RAIMONDI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
260	12	12	00	VIRU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
261	02	03	22	CANIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
262	13	01	00	CHICLAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
263	02	03	23	COLQUIOC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
264	13	02	00	FERRENAFE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
265	13	03	00	LAMBAYEQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
266	02	03	24	LA PRIMAVERA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
267	14	01	00	LIMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
268	02	03	25	HUALLANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
269	14	02	00	CAJATAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
270	02	04	01	CARHUAZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
271	14	03	00	CANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
272	02	04	02	ACOPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
273	14	04	00	CANETE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
274	02	04	03	AMASHCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
275	14	05	00	HUAURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
276	02	04	04	ANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
277	14	06	00	HUAROCHIRI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
278	02	04	05	ATAQUERO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
279	14	07	00	YAUYOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
280	02	04	06	MARCARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
281	14	08	00	HUARAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
282	02	04	07	PARIAHUANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
283	14	09	00	BARRANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
284	02	04	08	SAN MIGUEL DE ACO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
285	14	10	00	OYON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
286	02	04	09	SHILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
287	15	01	00	MAYNAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
288	02	04	10	TINCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
289	15	02	00	ALTO AMAZONAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
290	02	04	11	YUNGAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
291	15	03	00	LORETO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
292	02	05	01	CASMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
293	15	04	00	REQUENA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
294	02	05	02	BUENA VISTA ALTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
295	15	05	00	UCAYALI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
296	02	05	03	COMANDANTE NOEL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
297	15	06	00	MARISCAL RAMON CASTILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
298	02	05	05	YAUTAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
299	15	07	00	DATEM DEL MARAÑON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
300	02	06	01	CORONGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
301	16	01	00	TAMBOPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
302	02	06	02	ACO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
303	16	02	00	MANU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
304	02	06	03	BAMBAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
305	16	03	00	TAHUAMANU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
306	02	06	04	CUSCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
307	17	01	00	MARISCAL NIETO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
308	02	06	05	LA PAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
309	17	02	00	GENERAL SANCHEZ CERRO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
310	02	06	06	YANAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
311	17	03	00	ILO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
312	02	06	07	YUPAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
313	18	01	00	PASCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
314	02	07	01	CARAZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
315	18	02	00	DANIEL ALCIDES CARRION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
316	02	07	02	HUALLANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
317	18	03	00	OXAPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
318	19	01	00	PIURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
319	02	07	03	HUATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
320	19	02	00	AYABACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
321	02	07	04	HUAYLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
322	19	03	00	HUANCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
323	02	07	05	MATO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
324	19	04	00	MORROPON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
325	02	07	06	PAMPAROMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
326	19	05	00	PAITA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
327	02	07	07	PUEBLO LIBRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
328	19	06	00	SULLANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
329	02	07	08	SANTA CRUZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
330	19	07	00	TALARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
331	02	07	09	YURACMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
332	19	08	00	SECHURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
333	02	07	10	SANTO TORIBIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
334	20	01	00	PUNO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
335	02	08	01	HUARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
336	20	02	00	AZANGARO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
337	02	08	02	CAJAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
338	20	03	00	CARABAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
339	02	08	03	CHAVIN DE HUANTAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
340	02	08	04	HUACACHI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
341	20	04	00	CHUCUITO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
342	02	08	05	HUACHIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
343	20	05	00	HUANCANE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
344	02	08	06	HUACCHIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
345	20	06	00	LAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
346	02	08	07	HUANTAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
347	20	07	00	MELGAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
348	02	08	08	MASIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
349	20	08	00	SANDIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
350	02	08	09	PAUCAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
351	20	09	00	SAN ROMAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
352	02	08	10	PONTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
353	20	10	00	YUNGUYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
354	02	08	11	RAHUAPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
355	20	11	00	SAN ANTONIO DE PUTINA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
356	02	08	12	RAPAYAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
357	20	12	00	EL COLLAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
358	02	08	13	SAN MARCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
359	20	13	00	MOHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
360	02	08	14	SAN PEDRO DE CHANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
361	21	01	00	MOYOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
362	02	08	15	UCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
363	21	02	00	HUALLAGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
364	02	08	16	ANRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
365	21	03	00	LAMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
366	02	09	01	PISCOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
367	21	04	00	MARISCAL CACERES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
368	02	09	02	CASCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
369	21	05	00	RIOJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
370	02	09	03	LUCMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
371	21	06	00	SAN MARTIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
372	02	09	04	FIDEL OLIVAS ESCUDERO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
373	21	07	00	BELLAVISTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
374	02	09	05	LLAMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
375	21	08	00	TOCACHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
376	02	09	06	LLUMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
377	21	09	00	PICOTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
378	02	09	07	MUSGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
379	21	10	00	EL DORADO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
380	02	09	08	ELEAZAR GUZMAN BARRON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
381	22	01	00	TACNA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
382	02	10	01	CABANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
383	02	10	02	BOLOGNESI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
384	22	02	00	TARATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
385	02	10	03	CONCHUCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
386	22	03	00	JORGE BASADRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
387	02	10	04	HUACASCHUQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
388	22	04	00	CANDARAVE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
389	02	10	05	HUANDOVAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
390	23	01	00	TUMBES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
391	02	10	06	LACABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
392	23	02	00	CONTRALMIRANTE VILLAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
393	02	10	07	LLAPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
394	23	03	00	ZARUMILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
395	02	10	08	PALLASCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
396	24	01	00	CALLAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
397	02	10	09	PAMPAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
398	25	01	00	CORONEL PORTILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
399	02	10	10	SANTA ROSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
400	25	02	00	PADRE ABAD	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
401	02	10	11	TAUCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
402	25	03	00	ATALAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
403	02	11	01	POMABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
404	25	04	00	PURUS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
405	02	11	02	HUAYLLAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
406	25	04	00	PURUS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
407	02	11	03	PAROBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
408	02	11	04	QUINUABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
409	02	12	01	RECUAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
410	02	12	02	COTAPARACO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
411	02	12	03	HUAYLLAPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
412	02	12	04	MARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
413	02	12	05	PAMPAS CHICO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
414	02	12	06	PARARIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
415	02	12	07	TAPACOCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
416	02	12	08	TICAPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
417	02	12	09	LLACLLIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
418	02	12	10	CATAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
419	02	13	01	CHIMBOTE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
420	02	13	02	CACERES DEL PERU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
421	02	13	03	MACATE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
422	02	13	04	MORO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
423	02	13	05	NEPENA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
424	02	13	06	SAMANCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
425	02	13	07	SANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
426	02	13	08	COISHCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
427	02	13	09	NUEVO CHIMBOTE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
428	02	14	01	SIHUAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
429	02	14	02	ALFONSO UGARTE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
430	02	14	03	CHINGALPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
431	02	14	04	HUAYLLABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
432	02	14	05	QUICHES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
433	02	14	06	SICSIBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
434	02	14	07	ACOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
435	02	14	08	CASHAPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
436	02	14	09	RAGASH	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
437	02	14	10	SAN JUAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
438	02	15	01	YUNGAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
439	02	15	02	CASCAPARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
440	02	15	03	MANCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
441	02	15	04	MATACOTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
442	02	15	05	QUILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
443	02	15	06	RANRAHIRCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
444	02	15	07	SHUPLUY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
445	02	15	08	YANAMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
446	02	16	01	LLAMELLIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
447	02	16	02	ACZO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
448	02	16	03	CHACCHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
449	02	16	04	CHINGAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
450	02	16	05	MIRGAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
451	02	16	06	SAN JUAN DE RONTOY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
452	02	17	01	SAN LUIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
453	02	17	02	YAUYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
454	02	17	03	SAN NICOLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
455	02	18	01	CHACAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
456	02	18	02	ACOCHACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
457	02	19	01	HUARMEY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
458	02	19	02	COCHAPETI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
459	02	19	03	HUAYAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
460	02	19	04	MALVAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
461	02	19	05	CULEBRAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
462	02	20	01	ACAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
463	02	20	02	CAJAMARQUILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
464	02	20	03	CARHUAPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
465	02	20	04	COCHAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
466	02	20	05	CONGAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
467	02	20	06	LLIPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
468	02	20	07	OCROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
469	02	20	08	SAN CRISTOBAL DE RAJAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
470	02	20	09	SAN PEDRO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
471	02	20	10	SANTIAGO DE CHILCAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
472	03	01	01	ABANCAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
473	03	01	02	CIRCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
474	03	01	03	CURAHUASI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
475	03	01	04	CHACOCHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
476	03	01	05	HUANIPACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
477	03	01	06	LAMBRAMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
478	03	01	07	PICHIRHUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
479	03	01	08	SAN PEDRO DE CACHORA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
480	03	01	09	TAMBURCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
481	03	02	01	CHALHUANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
482	03	02	02	CAPAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
483	03	02	03	CARAYBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
484	03	02	04	COLCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
485	03	02	05	COTARUSE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
486	03	02	06	CHAPIMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
487	03	02	07	IHUAYLLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
488	03	02	08	LUCRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
489	03	02	09	POCOHUANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
490	03	02	10	SANAICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
491	03	02	11	SORAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
492	03	02	12	TAPAIRIHUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
493	03	02	13	TINTAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
494	03	02	14	TORAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
495	03	02	15	YANACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
496	03	02	16	SAN JUAN DE CHACNA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
497	03	02	17	JUSTO APU SAHUARAURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
498	03	03	01	ANDAHUAYLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
499	03	03	02	ANDARAPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
500	03	03	03	CHIARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
501	03	03	04	HUANCARAMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
502	03	03	05	HUANCARAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
503	03	03	06	KISHUARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
504	03	03	07	PACOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
505	03	03	08	PAMPACHIRI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
506	03	03	09	SAN ANTONIO DE CACHI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
507	03	03	10	SAN JERONIMO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
508	03	03	11	TALAVERA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
509	03	03	12	TURPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
510	03	03	13	PACUCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
511	03	03	14	POMACOCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
512	03	03	15	STA MARIA DE CHICMO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
513	03	03	16	TUMAY HUARACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
514	03	03	17	HUAYANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
515	03	03	18	SAN MIGUEL DE CHACCRAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
516	03	03	19	KAQUIABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
517	03	04	01	ANTABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
518	03	04	02	EL ORO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
519	03	04	03	HUAQUIRCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
520	03	04	04	JUAN ESPINOZA MEDRANO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
521	03	04	05	OROPESA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
522	03	04	06	PACHACONAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
523	03	04	07	SABAINO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
524	03	05	01	TAMBOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
525	03	05	02	COYLLURQUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
526	03	05	03	COTABAMBAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
527	03	05	04	HAQUIRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
528	03	05	05	MARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
529	03	05	06	CHALLHUAHUACHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
530	03	06	01	CHUQUIBAMBILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
531	03	06	02	CURPAHUASI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
532	03	06	03	HUAILLATI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
533	03	06	04	MAMARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
534	03	06	05	MARISCAL GAMARRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
535	03	06	06	MICAELA BASTIDAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
536	03	06	07	PROGRESO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
537	03	06	08	PATAYPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
538	03	06	09	SAN ANTONIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
539	03	06	10	TURPAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
540	03	06	11	VILCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
541	03	06	12	VIRUNDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
542	03	06	13	SANTA ROSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
543	03	06	14	CURASCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
544	03	07	01	CHINCHEROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
545	03	07	02	ONGOY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
546	03	07	03	OCOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
547	03	07	04	COCHARCAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
548	03	07	05	ANCO HUALLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
549	03	07	06	HUACCANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
550	03	07	07	URANMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
551	03	07	08	RANRACANCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
552	04	01	01	AREQUIPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
553	04	01	02	CAYMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
554	04	01	03	CERRO COLORADO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
555	04	01	04	CHARACATO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
556	04	01	05	CHIGUATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
557	04	01	06	LA JOYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
558	04	01	07	MIRAFLORES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
559	04	01	08	MOLLEBAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
560	04	01	09	PAUCARPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
561	04	01	10	POCSI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
562	04	01	11	POLOBAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
563	04	01	12	QUEQUENA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
564	04	01	13	SABANDIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
565	04	01	14	SACHACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
566	04	01	15	SAN JUAN DE SIGUAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
567	04	01	16	SAN JUAN DE TARUCANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
568	04	01	17	SANTA ISABEL DE SIGUAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
569	04	01	18	STA RITA DE SIGUAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
570	04	01	19	SOCABAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
571	04	01	20	TIABAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
572	04	01	21	UCHUMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
573	04	01	22	VITOR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
574	04	01	23	YANAHUARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
575	04	01	24	YARABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
576	04	01	25	YURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
577	04	01	26	MARIANO MELGAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
578	04	01	27	JACOBO HUNTER	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
579	04	01	28	ALTO SELVA ALEGRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
580	04	01	29	JOSE LUIS BUSTAMANTE Y RIVERO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
581	04	02	01	CHIVAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
582	04	02	02	ACHOMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
583	04	02	03	CABANACONDE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
584	04	02	04	CAYLLOMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
585	04	02	05	CALLALLI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
586	04	02	06	COPORAQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
587	04	02	07	HUAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
588	04	02	08	HUANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
589	04	02	09	ICHUPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
590	04	02	10	LARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
591	04	02	11	LLUTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
592	04	02	12	MACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
593	04	02	13	MADRIGAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
594	04	02	14	SAN ANTONIO DE CHUCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
595	04	02	15	SIBAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
596	04	02	16	TAPAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
597	04	02	17	TISCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
598	04	02	18	TUTI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
599	04	02	19	YANQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
600	04	02	20	MAJES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
601	04	03	01	CAMANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
602	04	03	02	JOSE MARIA QUIMPER	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
603	04	03	03	MARIANO N VALCARCEL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
604	04	03	04	MARISCAL CACERES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
605	04	03	05	NICOLAS DE PIEROLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
606	04	03	06	OCONA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
607	04	03	07	QUILCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
608	04	03	08	SAMUEL PASTOR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
609	04	04	01	CARAVELI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
610	04	04	02	ACARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
611	04	04	03	ATICO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
612	04	04	04	ATIQUIPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
613	04	04	05	BELLA UNION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
614	04	04	06	CAHUACHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
615	04	04	07	CHALA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
616	04	04	08	CHAPARRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
617	04	04	09	HUANUHUANU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
618	04	04	10	JAQUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
619	04	04	11	LOMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
620	04	04	12	QUICACHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
621	04	04	13	YAUCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
622	04	05	01	APLAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
623	04	05	02	ANDAGUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
624	04	05	03	AYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
625	04	05	04	CHACHAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
626	04	05	05	CHILCAYMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
627	04	05	06	CHOCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
628	04	05	07	HUANCARQUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
629	04	05	08	MACHAGUAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
630	04	05	09	ORCOPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
631	04	05	10	PAMPACOLCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
632	04	05	11	TIPAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
633	04	05	12	URACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
634	04	05	13	UNON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
635	04	05	14	VIRACO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
636	04	06	01	CHUQUIBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
637	04	06	02	ANDARAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
638	04	06	03	CAYARANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
639	04	06	04	CHICHAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
640	04	06	05	IRAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
641	04	06	06	SALAMANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
642	04	06	07	YANAQUIHUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
643	04	06	08	RIO GRANDE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
644	04	07	01	MOLLENDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
645	04	07	02	COCACHACRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
646	04	07	03	DEAN VALDIVIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
647	04	07	04	ISLAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
648	04	07	05	MEJIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
649	04	07	06	PUNTA DE BOMBON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
650	04	08	01	COTAHUASI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
651	04	08	02	ALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
652	04	08	03	CHARCANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
653	04	08	04	HUAYNACOTAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
654	04	08	05	PAMPAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
655	04	08	06	PUYCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
656	04	08	07	QUECHUALLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
657	04	08	08	SAYLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
658	04	08	09	TAURIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
659	04	08	10	TOMEPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
660	04	08	11	TORO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
661	05	01	01	AYACUCHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
662	05	01	02	ACOS VINCHOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
663	05	01	03	CARMEN ALTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
664	05	01	04	CHIARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
665	05	01	05	QUINUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
666	05	01	06	SAN JOSE DE TICLLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
667	05	01	07	SAN JUAN BAUTISTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
668	05	01	08	SANTIAGO DE PISCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
669	05	01	09	VINCHOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
670	05	01	10	TAMBILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
671	05	01	11	ACOCRO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
672	05	01	12	SOCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
673	05	01	13	OCROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
674	05	01	14	PACAYCASA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
675	05	01	15	JESUS NAZARENO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
676	05	02	01	CANGALLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
677	05	02	04	CHUSCHI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
678	05	02	06	LOS MOROCHUCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
679	05	02	07	PARAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
680	05	02	08	TOTOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
681	05	02	11	MARIA PARADO DE BELLIDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
682	05	03	01	HUANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
683	05	03	02	AYAHUANCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
684	05	03	03	HUAMANGUILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
685	05	03	04	IGUAIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
686	05	03	05	LURICOCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
687	05	03	07	SANTILLANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
688	05	03	08	SIVIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
689	05	03	09	LLOCHEGUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
690	05	04	01	SAN MIGUEL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
691	05	04	02	ANCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
692	05	04	03	AYNA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
693	05	04	04	CHILCAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
694	05	04	05	CHUNGUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
695	05	04	06	TAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
696	05	04	07	LUIS CARRANZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
697	05	04	08	SANTA ROSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
698	05	05	01	PUQUIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
699	05	05	02	AUCARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
700	05	05	03	CABANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
701	05	05	04	CARMEN SALCEDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
702	05	05	06	CHAVINA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
703	05	05	08	CHIPAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
704	05	05	10	HUAC-HUAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
705	05	05	11	LARAMATE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
706	05	05	12	LEONCIO PRADO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
707	05	05	13	LUCANAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
708	05	05	14	LLAUTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
709	05	05	16	OCANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
710	05	05	17	OTOCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
711	05	05	20	SANCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
712	05	05	21	SAN JUAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
713	05	05	22	SAN PEDRO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
714	05	05	24	STA ANA DE HUAYCAHUACHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
715	05	05	25	SANTA LUCIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
716	05	05	29	SAISA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
717	05	05	31	SAN PEDRO DE PALCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
718	05	05	32	SAN CRISTOBAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
719	05	06	01	CORACORA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
720	05	06	04	CORONEL CASTANEDA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
721	05	06	05	CHUMPI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
722	05	06	08	PACAPAUSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
723	05	06	11	PULLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
724	05	06	12	PUYUSCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
725	05	06	15	SAN FCO DE RAVACAYCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
726	05	06	16	UPAHUACHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
727	05	07	01	HUANCAPI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
728	05	07	02	ALCAMENCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
729	05	07	03	APONGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
730	05	07	04	CANARIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
731	05	07	06	CAYARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
732	05	07	07	COLCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
733	05	07	08	HUAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
734	05	07	09	HUAMANQUIQUIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
735	05	07	10	HUANCARAYLLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
736	05	07	13	SARHUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
737	05	07	14	VILCANCHOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
738	05	07	15	ASQUIPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
739	05	08	01	SANCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
740	05	08	02	SACSAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
741	05	08	03	SANTIAGO DE LUCANAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
742	05	08	04	CARAPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
743	05	09	01	VILCAS HUAMAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
744	05	09	02	VISCHONGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
745	05	09	03	ACCOMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
746	05	09	04	CARHUANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
747	05	09	05	CONCEPCION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
748	05	09	06	HUAMBALPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
749	05	09	07	SAURAMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
750	05	09	08	INDEPENDENCIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
751	05	10	01	PAUSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
752	05	10	02	COLTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
753	05	10	03	CORCULLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
754	05	10	04	LAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
755	05	10	05	MARCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
756	05	10	06	OYOLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
757	05	10	07	PARARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
758	05	10	08	SAN JAVIER DE ALPABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
759	05	10	09	SAN JOSE DE USHUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
760	05	10	10	SARA SARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
761	05	11	01	QUEROBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
762	05	11	02	BELEN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
763	05	11	03	CHALCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
764	05	11	04	SAN SALVADOR DE QUIJE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
765	05	11	05	PAICO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
766	05	11	06	SANTIAGO DE PAUCARAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
767	05	11	07	SAN PEDRO DE LARCAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
768	05	11	08	SORAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
769	05	11	09	HUACANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
770	05	11	10	CHILCAYOC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
771	05	11	11	MORCOLLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
772	06	01	01	CAJAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
773	06	01	02	ASUNCION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
774	06	01	03	COSPAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
775	06	01	04	CHETILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
776	06	01	05	ENCANADA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
777	06	01	06	JESUS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
778	06	01	07	LOS BANOS DEL INCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
779	06	01	08	LLACANORA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
780	06	01	09	MAGDALENA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
781	06	01	10	MATARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
782	06	01	11	NAMORA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
783	06	01	12	SAN JUAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
784	06	02	01	CAJABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
785	06	02	02	CACHACHI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
786	06	02	03	CONDEBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
787	06	02	05	SITACOCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
788	06	03	01	CELENDIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
789	06	03	02	CORTEGANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
790	06	03	03	CHUMUCH	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
791	06	03	04	HUASMIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
792	06	03	05	JORGE CHAVEZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
793	06	03	06	JOSE GALVEZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
794	06	03	07	MIGUEL IGLESIAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
795	06	03	08	OXAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
796	06	03	09	SOROCHUCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
797	06	03	10	SUCRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
798	06	03	11	UTCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
799	06	03	12	LA LIBERTAD DE PALLAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
800	06	04	01	CONTUMAZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
801	06	04	03	CHILETE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
802	06	04	04	GUZMANGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
803	06	04	05	SAN BENITO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
804	06	04	06	CUPISNIQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
805	06	04	07	TANTARICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
806	06	04	08	YONAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
807	06	04	09	STA CRUZ DE TOLEDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
808	06	05	01	CUTERVO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
809	06	05	02	CALLAYUC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
810	06	05	03	CUJILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
811	06	05	04	CHOROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
812	06	05	05	LA RAMADA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
813	06	05	06	PIMPINGOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
814	06	05	07	QUEROCOTILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
815	06	05	08	SAN ANDRES DE CUTERVO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
816	06	05	09	SAN JUAN DE CUTERVO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
817	06	05	10	SAN LUIS DE LUCMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
818	06	05	11	SANTA CRUZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
819	06	05	12	SANTO DOMINGO DE LA CAPILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
820	06	05	13	SANTO TOMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
821	06	05	14	SOCOTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
822	06	05	15	TORIBIO CASANOVA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
823	06	06	01	CHOTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
824	06	06	02	ANGUIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
825	06	06	03	COCHABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
826	06	06	04	CONCHAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
827	06	06	05	CHADIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
828	06	06	06	CHIGUIRIP	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
829	06	06	07	CHIMBAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
830	06	06	08	HUAMBOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
831	06	06	09	LAJAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
832	06	06	10	LLAMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
833	06	06	11	MIRACOSTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
834	06	06	12	PACCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
835	06	06	13	PION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
836	06	06	14	QUEROCOTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
837	06	06	15	TACABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
838	06	06	16	TOCMOCHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
839	06	06	17	SAN JUAN DE LICUPIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
840	06	06	18	CHOROPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
841	06	06	19	CHALAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
842	06	07	01	BAMBAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
843	06	07	02	CHUGUR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
844	06	07	03	HUALGAYOC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
845	06	08	01	JAEN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
846	06	08	02	BELLAVISTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
847	06	08	03	COLASAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
848	06	08	04	CHONTALI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
849	06	08	05	POMAHUACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
850	06	08	06	PUCARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
851	06	08	07	SALLIQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
852	06	08	08	SAN FELIPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
853	06	08	09	SAN JOSE DEL ALTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
854	06	08	10	SANTA ROSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
855	06	08	11	LAS PIRIAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
856	06	08	12	HUABAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
857	06	09	01	SANTA CRUZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
858	06	09	02	CATACHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
859	06	09	03	CHANCAIBANOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
860	06	09	04	LA ESPERANZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
861	06	09	05	NINABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
862	06	09	06	PULAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
863	06	09	07	SEXI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
864	06	09	08	UTICYACU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
865	06	09	09	YAUYUCAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
866	06	09	10	ANDABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
867	06	09	11	SAUCEPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
868	06	10	01	SAN MIGUEL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
869	06	10	02	CALQUIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
870	06	10	03	LA FLORIDA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
871	06	10	04	LLAPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
872	06	10	05	NANCHOC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
873	06	10	06	NIEPOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
874	06	10	07	SAN GREGORIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
875	06	10	08	SAN SILVESTRE DE COCHAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
876	06	10	09	EL PRADO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
877	06	10	10	UNION AGUA BLANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
878	06	10	11	TONGOD	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
879	06	10	12	CATILLUC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
880	06	10	13	BOLIVAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
881	06	11	01	SAN IGNACIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
882	06	11	02	CHIRINOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
883	06	11	03	HUARANGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
884	06	11	04	NAMBALLE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
885	06	11	05	LA COIPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
886	06	11	06	SAN JOSE DE LOURDES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
887	06	11	07	TABACONAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
888	06	12	01	PEDRO GALVEZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
889	06	12	02	ICHOCAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
890	06	12	03	GREGORIO PITA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
891	06	12	04	JOSE MANUEL QUIROZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
892	06	12	05	EDUARDO VILLANUEVA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
893	06	12	06	JOSE SABOGAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
894	06	12	07	CHANCAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
895	06	13	01	SAN PABLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
896	06	13	02	SAN BERNARDINO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
897	06	13	03	SAN LUIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
898	06	13	04	TUMBADEN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
899	07	01	01	CUSCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
900	07	01	02	CCORCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
901	07	01	03	POROY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
902	07	01	04	SAN JERONIMO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
903	07	01	05	SAN SEBASTIAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
904	07	01	06	SANTIAGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
905	07	01	07	SAYLLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
906	07	01	08	WANCHAQ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
907	07	02	01	ACOMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
908	07	02	02	ACOPIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
909	07	02	03	ACOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
910	07	02	04	POMACANCHI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
911	07	02	05	RONDOCAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
912	07	02	06	SANGARARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
913	07	02	07	MOSOC LLACTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
914	07	03	01	ANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
915	07	03	02	CHINCHAYPUJIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
916	07	03	03	HUAROCONDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
917	07	03	04	LIMATAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
918	07	03	05	MOLLEPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
919	07	03	06	PUCYURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
920	07	03	07	ZURITE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
921	07	03	08	CACHIMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
922	07	03	09	ANCAHUASI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
923	07	04	01	CALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
924	07	04	02	COYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
925	07	04	03	LAMAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
926	07	04	04	LARES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
927	07	04	05	PISAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
928	07	04	06	SAN SALVADOR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
929	07	04	07	TARAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
930	07	04	08	YANATILE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
931	07	05	01	YANAOCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
932	07	05	02	CHECCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
933	07	05	03	KUNTURKANKI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
934	07	05	04	LANGUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
935	07	05	05	LAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
936	07	05	06	PAMPAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
937	07	05	07	QUEHUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
938	07	05	08	TUPAC AMARU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
939	07	06	01	SICUANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
940	07	06	02	COMBAPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
941	07	06	03	CHECACUPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
942	07	06	04	MARANGANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
943	07	06	05	PITUMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
944	07	06	06	SAN PABLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
945	07	06	07	SAN PEDRO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
946	07	06	08	TINTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
947	07	07	01	SANTO TOMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
948	07	07	02	CAPACMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
949	07	07	03	COLQUEMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
950	07	07	04	CHAMACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
951	07	07	05	LIVITACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
952	07	07	06	LLUSCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
953	07	07	07	QUINOTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
954	07	07	08	VELILLE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
955	07	08	01	ESPINAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
956	07	08	02	CONDOROMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
957	07	08	03	COPORAQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
958	07	08	04	OCORURO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
959	07	08	05	PALLPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
960	07	08	06	PICHIGUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
961	07	08	07	SUYKUTAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
962	07	08	08	ALTO PICHIGUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
963	07	09	01	SANTA ANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
964	07	09	02	ECHARATE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
965	07	09	03	HUAYOPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
966	07	09	04	MARANURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
967	07	09	05	OCOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
968	07	09	06	SANTA TERESA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
969	07	09	07	VILCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
970	07	09	08	QUELLOUNO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
971	07	09	09	KIMBIRI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
972	07	09	10	PICHARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
973	07	10	01	PARURO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
974	07	10	02	ACCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
975	07	10	03	CCAPI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
976	07	10	04	COLCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
977	07	10	05	HUANOQUITE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
978	07	10	06	OMACHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
979	07	10	07	YAURISQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
980	07	10	08	PACCARITAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
981	07	10	09	PILLPINTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
982	07	11	01	PAUCARTAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
983	07	11	02	CAICAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
984	07	11	03	COLQUEPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
985	07	11	04	CHALLABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
986	07	11	05	COSNIPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
987	07	11	06	HUANCARANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
988	07	12	01	URCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
989	07	12	02	ANDAHUAYLILLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
990	07	12	03	CAMANTI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
991	07	12	04	CCARHUAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
992	07	12	05	CCATCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
993	07	12	06	CUSIPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
994	07	12	07	HUARO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
995	07	12	08	LUCRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
996	07	12	09	MARCAPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
997	07	12	10	OCONGATE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
998	07	12	11	OROPESA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
999	07	12	12	QUIQUIJANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1000	07	13	01	URUBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1001	07	13	02	CHINCHERO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1002	07	13	03	HUAYLLABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1003	07	13	04	MACHUPICCHU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1004	07	13	05	MARAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1005	07	13	06	OLLANTAYTAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1006	07	13	07	YUCAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1007	08	01	01	HUANCAVELICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1008	08	01	02	ACOBAMBILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1009	08	01	03	ACORIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1010	08	01	04	CONAYCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1011	08	01	05	CUENCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1012	08	01	06	HUACHOCOLPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1013	08	01	08	HUAYLLAHUARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1014	08	01	09	IZCUCHACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1015	08	01	10	LARIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1016	08	01	11	MANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1017	08	01	12	MARISCAL CACERES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1018	08	01	13	MOYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1019	08	01	14	NUEVO OCCORO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1020	08	01	15	PALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1021	08	01	16	PILCHACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1022	08	01	17	VILCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1023	08	01	18	YAULI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1024	08	01	19	ASCENCION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1025	08	01	20	HUANDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1026	08	02	01	ACOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1027	08	02	02	ANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1028	08	02	03	ANDABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1029	08	02	04	CAJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1030	08	02	05	MARCAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1031	08	02	06	PAUCARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1032	08	02	07	POMACOCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1033	08	02	08	ROSARIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1034	08	03	01	LIRCAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1035	08	03	02	ANCHONGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1036	08	03	03	CALLANMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1037	08	03	04	CONGALLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1038	08	03	05	CHINCHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1039	08	03	06	HUAYLLAY GRANDE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1040	08	03	07	HUANCA HUANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1041	08	03	08	JULCAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1042	08	03	09	SAN ANTONIO DE ANTAPARCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1043	08	03	10	STO TOMAS DE PATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1044	08	03	11	SECCLLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1045	08	03	12	CCOCHACCASA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1046	08	04	01	CASTROVIRREYNA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1047	08	04	02	ARMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1048	08	04	03	AURAHUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1049	08	04	05	CAPILLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1050	08	04	06	COCAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1051	08	04	08	CHUPAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1052	08	04	09	HUACHOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1053	08	04	10	HUAMATAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1054	08	04	14	MOLLEPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1055	08	04	22	SAN JUAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1056	08	04	27	TANTARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1057	08	04	28	TICRAPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1058	08	04	29	SANTA ANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1059	08	05	01	PAMPAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1060	08	05	02	ACOSTAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1061	08	05	03	ACRAQUIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1062	08	05	04	AHUAYCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1063	08	05	06	COLCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1064	08	05	09	DANIEL HERNANDEZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1065	08	05	11	HUACHOCOLPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1066	08	05	12	HUARIBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1067	08	05	15	NAHUIMPUQUIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1068	08	05	17	PAZOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1069	08	05	18	QUISHUAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1070	08	05	19	SALCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1071	08	05	20	SAN MARCOS DE ROCCHAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1072	08	05	23	SURCUBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1073	08	05	25	TINTAY PUNCU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1074	08	05	26	SALCAHUASI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1075	08	06	01	AYAVI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1076	08	06	02	CORDOVA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1077	08	06	03	HUAYACUNDO ARMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1078	08	06	04	HUAYTARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1079	08	06	05	LARAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1080	08	06	06	OCOYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1081	08	06	07	PILPICHACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1082	08	06	08	QUERCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1083	08	06	09	QUITO ARMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1084	08	06	10	SAN ANTONIO DE CUSICANCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1085	08	06	11	SAN FRANCISCO DE SANGAYAICO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1086	08	06	12	SAN ISIDRO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1087	08	06	13	SANTIAGO DE CHOCORVOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1088	08	06	14	SANTIAGO DE QUIRAHUARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1089	08	06	15	SANTO DOMINGO DE CAPILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1090	08	06	16	TAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1091	08	07	01	CHURCAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1092	08	07	02	ANCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1093	08	07	03	CHINCHIHUASI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1094	08	07	04	EL CARMEN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1095	08	07	05	LA MERCED	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1096	08	07	06	LOCROJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1097	08	07	07	PAUCARBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1098	08	07	08	SAN MIGUEL DE MAYOC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1099	08	07	09	SAN PEDRO DE CORIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1100	08	07	10	PACHAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1101	09	01	01	HUANUCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1102	09	01	02	CHINCHAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1103	09	01	03	CHURUBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1104	09	01	04	MARGOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1105	09	01	05	QUISQUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1106	09	01	06	SAN FCO DE CAYRAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1107	09	01	07	SAN PEDRO DE CHAULAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1108	09	01	08	STA MARIA DEL VALLE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1109	09	01	09	YARUMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1110	09	01	10	AMARILIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1111	09	01	11	PILLCO MARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1112	09	02	01	AMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1113	09	02	02	CAYNA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1114	09	02	03	COLPAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1115	09	02	04	CONCHAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1116	09	02	05	HUACAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1117	09	02	06	SAN FRANCISCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1118	09	02	07	SAN RAFAEL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1119	09	02	08	TOMAY KICHWA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1120	09	03	01	LA UNION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1121	09	03	07	CHUQUIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1122	09	03	12	MARIAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1123	09	03	14	PACHAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1124	09	03	16	QUIVILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1125	09	03	17	RIPAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1126	09	03	21	SHUNQUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1127	09	03	22	SILLAPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1128	09	03	23	YANAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1129	09	04	01	LLATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1130	09	04	02	ARANCAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1131	09	04	03	CHAVIN DE PARIARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1132	09	04	04	JACAS GRANDE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1133	09	04	05	JIRCAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1134	09	04	06	MIRAFLORES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1135	09	04	07	MONZON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1136	09	04	08	PUNCHAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1137	09	04	09	PUNOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1138	09	04	10	SINGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1139	09	04	11	TANTAMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1140	09	05	01	HUACRACHUCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1141	09	05	02	CHOLON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1142	09	05	05	SAN BUENAVENTURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1143	09	06	01	RUPA RUPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1144	09	06	02	DANIEL ALOMIA ROBLES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1145	09	06	03	HERMILIO VALDIZAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1146	09	06	04	LUYANDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1147	09	06	05	MARIANO DAMASO BERAUN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1148	09	06	06	JOSE CRESPO Y CASTILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1149	09	07	01	PANAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1150	09	07	02	CHAGLLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1151	09	07	04	MOLINO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1152	09	07	06	UMARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1153	09	08	01	HONORIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1154	09	08	02	PUERTO INCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1155	09	08	03	CODO DEL POZUZO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1156	09	08	04	TOURNAVISTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1157	09	08	05	YUYAPICHIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1158	09	09	01	HUACAYBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1159	09	09	02	PINRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1160	09	09	03	CANCHABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1161	09	09	04	COCHABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1162	09	10	01	JESUS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1163	09	10	02	BANOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1164	09	10	03	SAN FRANCISCO DE ASIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1165	09	10	04	QUEROPALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1166	09	10	05	SAN MIGUEL DE CAURI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1167	09	10	06	RONDOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1168	09	10	07	JIVIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1169	09	11	01	CHAVINILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1170	09	11	02	APARICIO POMARES (CHUPAN)	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1171	09	11	03	CAHUAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1172	09	11	04	CHACABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1173	09	11	05	JACAS CHICO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1174	09	11	06	OBAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1175	09	11	07	PAMPAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1176	09	11	08	CHORAS                   	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1177	10	01	01	ICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1178	10	01	02	LA TINGUINA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1179	10	01	03	LOS AQUIJES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1180	10	01	04	PARCONA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1181	10	01	05	PUEBLO NUEVO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1182	10	01	06	SALAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1183	10	01	07	SAN JOSE DE LOS MOLINOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1184	10	01	08	SAN JUAN BAUTISTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1185	10	01	09	SANTIAGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1186	10	01	10	SUBTANJALLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1187	10	01	11	YAUCA DEL ROSARIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1188	10	01	12	TATE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1189	10	01	13	PACHACUTEC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1190	10	01	14	OCUCAJE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1191	10	02	01	CHINCHA ALTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1192	10	02	02	CHAVIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1193	10	02	03	CHINCHA BAJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1194	10	02	04	EL CARMEN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1195	10	02	05	GROCIO PRADO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1196	10	02	06	SAN PEDRO DE HUACARPANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1197	10	02	07	SUNAMPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1198	10	02	08	TAMBO DE MORA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1199	10	02	09	ALTO LARAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1200	10	02	10	PUEBLO NUEVO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1201	10	02	11	SAN JUAN DE YANAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1202	10	03	01	NAZCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1203	10	03	02	CHANGUILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1204	10	03	03	EL INGENIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1205	10	03	04	MARCONA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1206	10	03	05	VISTA ALEGRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1207	10	04	01	PISCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1208	10	04	02	HUANCANO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1209	10	04	03	HUMAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1210	10	04	04	INDEPENDENCIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1211	10	04	05	PARACAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1212	10	04	06	SAN ANDRES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1213	10	04	07	SAN CLEMENTE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1214	10	04	08	TUPAC AMARU INCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1215	10	05	01	PALPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1216	10	05	02	LLIPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1217	10	05	03	RIO GRANDE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1218	10	05	04	SANTA CRUZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1219	10	05	05	TIBILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1220	11	01	01	HUANCAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1221	11	01	03	CARHUACALLANGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1222	11	01	04	COLCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1223	11	01	05	CULLHUAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1224	11	01	06	CHACAPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1225	11	01	07	CHICCHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1226	11	01	08	CHILCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1227	11	01	09	CHONGOS ALTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1228	11	01	12	CHUPURO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1229	11	01	13	EL TAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1230	11	01	14	HUACRAPUQUIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1231	11	01	16	HUALHUAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1232	11	01	18	HUANCAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1233	11	01	19	HUASICANCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1234	11	01	20	HUAYUCACHI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1235	11	01	21	INGENIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1236	11	01	22	PARIAHUANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1237	11	01	23	PILCOMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1238	11	01	24	PUCARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1239	11	01	25	QUICHUAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1240	11	01	26	QUILCAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1241	11	01	27	SAN AGUSTIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1242	11	01	28	SAN JERONIMO DE TUNAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1243	11	01	31	STO DOMINGO DE ACOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1244	11	01	32	SANO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1245	11	01	33	SAPALLANGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1246	11	01	34	SICAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1247	11	01	36	VIQUES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1248	11	02	01	CONCEPCION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1249	11	02	02	ACO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1250	11	02	03	ANDAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1251	11	02	04	COMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1252	11	02	05	COCHAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1253	11	02	06	CHAMBARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1254	11	02	07	HEROINAS TOLEDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1255	11	02	08	MANZANARES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1256	11	02	09	MCAL CASTILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1257	11	02	10	MATAHUASI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1258	11	02	11	MITO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1259	11	02	12	NUEVE DE JULIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1260	11	02	13	ORCOTUNA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1261	11	02	14	STA ROSA DE OCOPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1262	11	02	15	SAN JOSE DE QUERO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1263	11	03	01	JAUJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1264	11	03	02	ACOLLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1265	11	03	03	APATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1266	11	03	04	ATAURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1267	11	03	05	CANCHAILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1268	11	03	06	EL MANTARO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1269	11	03	07	HUAMALI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1270	11	03	08	HUARIPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1271	11	03	09	HUERTAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1272	11	03	10	JANJAILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1273	11	03	11	JULCAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1274	11	03	12	LEONOR ORDONEZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1275	11	03	13	LLOCLLAPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1276	11	03	14	MARCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1277	11	03	15	MASMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1278	11	03	16	MOLINOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1279	11	03	17	MONOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1280	11	03	18	MUQUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1281	11	03	19	MUQUIYAUYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1282	11	03	20	PACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1283	11	03	21	PACCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1284	11	03	22	PANCAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1285	11	03	23	PARCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1286	11	03	24	POMACANCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1287	11	03	25	RICRAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1288	11	03	26	SAN LORENZO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1289	11	03	27	SAN PEDRO DE CHUNAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1290	11	03	28	SINCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1291	11	03	29	TUNAN MARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1292	11	03	30	YAULI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1293	11	03	31	CURICACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1294	11	03	32	MASMA CHICCHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1295	11	03	33	SAUSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1296	11	03	34	YAUYOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1297	11	04	01	JUNIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1298	11	04	02	CARHUAMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1299	11	04	03	ONDORES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1300	11	04	04	ULCUMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1301	11	05	01	TARMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1302	11	05	02	ACOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1303	11	05	03	HUARICOLCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1304	11	05	04	HUASAHUASI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1305	11	05	05	LA UNION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1306	11	05	06	PALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1307	11	05	07	PALCAMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1308	11	05	08	SAN PEDRO DE CAJAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1309	11	05	09	TAPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1310	11	06	01	LA OROYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1311	11	06	02	CHACAPALPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1312	11	06	03	HUAY HUAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1313	11	06	04	MARCAPOMACOCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1314	11	06	05	MOROCOCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1315	11	06	06	PACCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1316	11	06	07	STA BARBARA DE CARHUACAYAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1317	11	06	08	SUITUCANCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1318	11	06	09	YAULI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1319	11	06	10	STA ROSA DE SACCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1320	11	07	01	SATIPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1321	11	07	02	COVIRIALI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1322	11	07	03	LLAYLLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1323	11	07	04	MAZAMARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1324	11	07	05	PAMPA HERMOSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1325	11	07	06	PANGOA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1326	11	07	07	RIO NEGRO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1327	11	07	08	RIO TAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1328	11	08	01	CHANCHAMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1329	11	08	02	SAN RAMON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1330	11	08	03	VITOC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1331	11	08	04	SAN LUIS DE SHUARO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1332	11	08	05	PICHANAQUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1333	11	08	06	PERENE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1334	11	09	01	CHUPACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1335	11	09	02	AHUAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1336	11	09	03	CHONGOS BAJO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1337	11	09	04	HUACHAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1338	11	09	05	HUAMANCACA CHICO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1339	11	09	06	SAN JUAN DE ISCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1340	11	09	07	SAN JUAN DE JARPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1341	11	09	08	TRES DE DICIEMBRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1342	11	09	09	YANACANCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1343	12	01	01	TRUJILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1344	12	01	02	HUANCHACO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1345	12	01	03	LAREDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1346	12	01	04	MOCHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1347	12	01	05	SALAVERRY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1348	12	01	06	SIMBAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1349	12	01	07	VICTOR LARCO HERRERA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1350	12	01	09	POROTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1351	12	01	10	EL PORVENIR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1352	12	01	11	LA ESPERANZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1353	12	01	12	FLORENCIA DE MORA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1354	12	02	01	BOLIVAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1355	12	02	02	BAMBAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1356	12	02	03	CONDORMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1357	12	02	04	LONGOTEA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1358	12	02	05	UCUNCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1359	12	02	06	UCHUMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1360	12	03	01	HUAMACHUCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1361	12	03	02	COCHORCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1362	12	03	03	CURGOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1363	12	03	04	CHUGAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1364	12	03	05	MARCABAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1365	12	03	06	SANAGORAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1366	12	03	07	SARIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1367	12	03	08	SARTIMBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1368	12	04	01	OTUZCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1369	12	04	02	AGALLPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1370	12	04	03	CHARAT	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1371	12	04	04	HUARANCHAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1372	12	04	05	LA CUESTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1373	12	04	08	PARANDAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1374	12	04	09	SALPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1375	12	04	10	SINSICAP	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1376	12	04	11	USQUIL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1377	12	04	13	MACHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1378	12	05	01	SAN PEDRO DE LLOC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1379	12	05	03	GUADALUPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1380	12	05	04	JEQUETEPEQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1381	12	05	06	PACASMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1382	12	05	08	SAN JOSE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1383	12	06	01	TAYABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1384	12	06	02	BULDIBUYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1385	12	06	03	CHILLIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1386	12	06	04	HUAYLILLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1387	12	06	05	HUANCASPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1388	12	06	06	HUAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1389	12	06	07	ONGON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1390	12	06	08	PARCOY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1391	12	06	09	PATAZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1392	12	06	10	PIAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1393	12	06	11	TAURIJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1394	12	06	12	URPAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1395	12	06	13	SANTIAGO DE CHALLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1396	12	07	01	SANTIAGO DE CHUCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1397	12	07	02	CACHICADAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1398	12	07	03	MOLLEBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1399	12	07	04	MOLLEPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1400	12	07	05	QUIRUVILCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1401	12	07	06	SANTA CRUZ DE CHUCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1402	12	07	07	SITABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1403	12	07	08	ANGASMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1404	12	08	01	ASCOPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1405	12	08	02	CHICAMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1406	12	08	03	CHOCOPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1407	12	08	04	SANTIAGO DE CAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1408	12	08	05	MAGDALENA DE CAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1409	12	08	06	PAIJAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1410	12	08	07	RAZURI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1411	12	08	08	CASA GRANDE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1412	12	09	01	CHEPEN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1413	12	09	02	PACANGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1414	12	09	03	PUEBLO NUEVO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1415	12	10	01	JULCAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1416	12	10	02	CARABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1417	12	10	03	CALAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1418	12	10	04	HUASO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1419	12	11	01	CASCAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1420	12	11	02	LUCMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1421	12	11	03	MARMOT	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1422	12	11	04	SAYAPULLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1423	12	12	01	VIRU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1424	12	12	02	CHAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1425	12	12	03	GUADALUPITO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1426	13	01	01	CHICLAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1427	13	01	02	CHONGOYAPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1428	13	01	03	ETEN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1429	13	01	04	ETEN PUERTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1430	13	01	05	LAGUNAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1431	13	01	06	MONSEFU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1432	13	01	07	NUEVA ARICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1433	13	01	08	OYOTUN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1434	13	01	09	PICSI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1435	13	01	10	PIMENTEL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1436	13	01	11	REQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1437	13	01	12	JOSE LEONARDO ORTIZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1438	13	01	13	SANTA ROSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1439	13	01	14	SANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1440	13	01	15	LA VICTORIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1441	13	01	16	CAYALTI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1442	13	01	17	PATAPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1443	13	01	18	POMALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1444	13	01	19	PUCALA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1445	13	01	20	TUMAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1446	13	02	01	FERRENAFE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1447	13	02	02	INCAHUASI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1448	13	02	03	CANARIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1449	13	02	04	PITIPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1450	13	02	05	PUEBLO NUEVO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1451	13	02	06	MANUEL ANTONIO MESONES MURO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1452	13	03	01	LAMBAYEQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1453	13	03	02	CHOCHOPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1454	13	03	03	ILLIMO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1455	13	03	04	JAYANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1456	13	03	05	MOCHUMI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1457	13	03	06	MORROPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1458	13	03	07	MOTUPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1459	13	03	08	OLMOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1460	13	03	09	PACORA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1461	13	03	10	SALAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1462	13	03	11	SAN JOSE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1463	13	03	12	TUCUME	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1464	14	01	01	LIMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1465	14	01	02	ANCON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1466	14	01	03	ATE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1467	14	01	04	BRENA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1468	14	01	05	CARABAYLLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1469	14	01	06	COMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1470	14	01	07	CHACLACAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1471	14	01	08	CHORRILLOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1472	14	01	09	LA VICTORIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1473	14	01	10	LA MOLINA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1474	14	01	11	LINCE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1475	14	01	12	LURIGANCHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1476	14	01	13	LURIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1477	14	01	14	MAGDALENA DEL MAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1478	14	01	15	MIRAFLORES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1479	14	01	16	PACHACAMAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1480	14	01	17	PUEBLO LIBRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1481	14	01	18	PUCUSANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1482	14	01	19	PUENTE PIEDRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1483	14	01	20	PUNTA HERMOSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1484	14	01	21	PUNTA NEGRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1485	14	01	22	RIMAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1486	14	01	23	SAN BARTOLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1487	14	01	24	SAN ISIDRO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1488	14	01	25	BARRANCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1489	14	01	26	SAN MARTIN DE PORRES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1490	14	01	27	SAN MIGUEL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1491	14	01	28	STA MARIA DEL MAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1492	14	01	29	SANTA ROSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1493	14	01	30	SANTIAGO DE SURCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1494	14	01	31	SURQUILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1495	14	01	32	VILLA MARIA DEL TRIUNFO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1496	14	01	33	JESUS MARIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1497	14	01	34	INDEPENDENCIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1498	14	01	35	EL AGUSTINO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1499	14	01	36	SAN JUAN DE MIRAFLORES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1500	14	01	37	SAN JUAN DE LURIGANCHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1501	14	01	38	SAN LUIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1502	14	01	39	CIENEGUILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1503	14	01	40	SAN BORJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1504	14	01	41	VILLA EL SALVADOR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1505	14	01	42	LOS OLIVOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1506	14	01	43	SANTA ANITA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1507	14	02	01	CAJATAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1508	14	02	05	COPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1509	14	02	06	GORGOR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1510	14	02	07	HUANCAPON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1511	14	02	08	MANAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1512	14	03	01	CANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1513	14	03	02	ARAHUAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1514	14	03	03	HUAMANTANGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1515	14	03	04	HUAROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1516	14	03	05	LACHAQUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1517	14	03	06	SAN BUENAVENTURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1518	14	03	07	SANTA ROSA DE QUIVES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1519	14	04	01	SAN VICENTE DE CANETE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1520	14	04	02	CALANGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1521	14	04	03	CERRO AZUL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1522	14	04	04	COAYLLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1523	14	04	05	CHILCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1524	14	04	06	IMPERIAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1525	14	04	07	LUNAHUANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1526	14	04	08	MALA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1527	14	04	09	NUEVO IMPERIAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1528	14	04	10	PACARAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1529	14	04	11	QUILMANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1530	14	04	12	SAN ANTONIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1531	14	04	13	SAN LUIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1532	14	04	14	SANTA CRUZ DE FLORES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1533	14	04	15	ZUNIGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1534	14	04	16	ASIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1535	14	05	01	HUACHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1536	14	05	02	AMBAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1537	14	05	04	CALETA DE CARQUIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1538	14	05	05	CHECRAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1539	14	05	06	HUALMAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1540	14	05	07	HUAURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1541	14	05	08	LEONCIO PRADO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1542	14	05	09	PACCHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1543	14	05	11	SANTA LEONOR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1544	14	05	12	SANTA MARIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1545	14	05	13	SAYAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1546	14	05	16	VEGUETA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1547	14	06	01	MATUCANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1548	14	06	02	ANTIOQUIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1549	14	06	03	CALLAHUANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1550	14	06	04	CARAMPOMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1551	14	06	05	CASTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1552	14	06	06	CUENCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1553	14	06	07	CHICLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1554	14	06	08	HUANZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1555	14	06	09	HUAROCHIRI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1556	14	06	10	LAHUAYTAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1557	14	06	11	LANGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1558	14	06	12	MARIATANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1559	14	06	13	RICARDO PALMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1560	14	06	14	SAN ANDRES DE TUPICOCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1561	14	06	15	SAN ANTONIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1562	14	06	16	SAN BARTOLOME	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1563	14	06	17	SAN DAMIAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1564	14	06	18	SANGALLAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1565	14	06	19	SAN JUAN DE TANTARANCHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1566	14	06	20	SAN LORENZO DE QUINTI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1567	14	06	21	SAN MATEO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1568	14	06	22	SAN MATEO DE OTAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1569	14	06	23	SAN PEDRO DE HUANCAYRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1570	14	06	24	SANTA CRUZ DE COCACHACRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1571	14	06	25	SANTA EULALIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1572	14	06	26	SANTIAGO DE ANCHUCAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1573	14	06	27	SANTIAGO DE TUNA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1574	14	06	28	SANTO DOMINGO DE LOS OLLEROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1575	14	06	29	SURCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1576	14	06	30	HUACHUPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1577	14	06	31	LARAOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1578	14	06	32	SAN JUAN DE IRIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1579	14	07	01	YAUYOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1580	14	07	02	ALIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1581	14	07	03	AYAUCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1582	14	07	04	AYAVIRI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1583	14	07	05	AZANGARO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1584	14	07	06	CACRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1585	14	07	07	CARANIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1586	14	07	08	COCHAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1587	14	07	09	COLONIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1588	14	07	10	CHOCOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1589	14	07	11	HUAMPARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1590	14	07	12	HUANCAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1591	14	07	13	HUANGASCAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1592	14	07	14	HUANTAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1593	14	07	15	HUANEC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1594	14	07	16	LARAOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1595	14	07	17	LINCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1596	14	07	18	MIRAFLORES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1597	14	07	19	OMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1598	14	07	20	QUINCHES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1599	14	07	21	QUINOCAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1600	14	07	22	SAN JOAQUIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1601	14	07	23	SAN PEDRO DE PILAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1602	14	07	24	TANTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1603	14	07	25	TAURIPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1604	14	07	26	TUPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1605	14	07	27	TOMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1606	14	07	28	VINAC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1607	14	07	29	VITIS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1608	14	07	30	HONGOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1609	14	07	31	MADEAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1610	14	07	32	PUTINZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1611	14	07	33	CATAHUASI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1612	14	08	01	HUARAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1613	14	08	02	ATAVILLOS ALTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1614	14	08	03	ATAVILLOS BAJO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1615	14	08	04	AUCALLAMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1616	14	08	05	CHANCAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1617	14	08	06	IHUARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1618	14	08	07	LAMPIAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1619	14	08	08	PACARAOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1620	14	08	09	SAN MIGUEL DE ACOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1621	14	08	10	VEINTISIETE DE NOVIEMBRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1622	14	08	11	STA CRUZ DE ANDAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1623	14	08	12	SUMBILCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1624	14	09	01	BARRANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1625	14	09	02	PARAMONGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1626	14	09	03	PATIVILCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1627	14	09	04	SUPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1628	14	09	05	SUPE PUERTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1629	14	10	01	OYON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1630	14	10	02	NAVAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1631	14	10	03	CAUJUL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1632	14	10	04	ANDAJES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1633	14	10	05	PACHANGARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1634	14	10	06	COCHAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1635	15	01	01	IQUITOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1636	15	01	02	ALTO NANAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1637	15	01	03	FERNANDO LORES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1638	15	01	04	LAS AMAZONAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1639	15	01	05	MAZAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1640	15	01	06	NAPO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1641	15	01	07	PUTUMAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1642	15	01	08	TORRES CAUSANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1643	15	01	10	INDIANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1644	15	01	11	PUNCHANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1645	15	01	12	BELEN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1646	15	01	13	SAN JUAN BAUTISTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1647	15	01	14	TNTE MANUEL CLAVERO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1648	15	02	01	YURIMAGUAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1649	15	02	02	BALSAPUERTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1650	15	02	05	JEBEROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1651	15	02	06	LAGUNAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1652	15	02	10	SANTA CRUZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1653	15	02	11	TNTE CESAR LOPEZ ROJAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1654	15	03	01	NAUTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1655	15	03	02	PARINARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1656	15	03	03	TIGRE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1657	15	03	04	URARINAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1658	15	03	05	TROMPETEROS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1659	15	04	01	REQUENA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1660	15	04	02	ALTO TAPICHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1661	15	04	03	CAPELO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1662	15	04	04	EMILIO SAN MARTIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1663	15	04	05	MAQUIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1664	15	04	06	PUINAHUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1665	15	04	07	SAQUENA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1666	15	04	08	SOPLIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1667	15	04	09	TAPICHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1668	15	04	10	JENARO HERRERA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1669	15	04	11	YAQUERANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1670	15	05	01	CONTAMANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1671	15	05	02	VARGAS GUERRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1672	15	05	03	PADRE MARQUEZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1673	15	05	04	PAMPA HERMOZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1674	15	05	05	SARAYACU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1675	15	05	06	INAHUAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1676	15	06	01	MARISCAL RAMON CASTILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1677	15	06	02	PEBAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1678	15	06	03	YAVARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1679	15	06	04	SAN PABLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1680	15	07	01	BARRANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1681	15	07	02	ANDOAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1682	15	07	03	CAHUAPANAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1683	15	07	04	MANSERICHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1684	15	07	05	MORONA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1685	15	07	06	PASTAZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1686	16	01	01	TAMBOPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1687	16	01	02	INAMBARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1688	16	01	03	LAS PIEDRAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1689	16	01	04	LABERINTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1690	16	02	01	MANU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1691	16	02	02	FITZCARRALD	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1692	16	02	03	MADRE DE DIOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1693	16	02	04	HUEPETUHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1694	16	03	01	INAPARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1695	16	03	02	IBERIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1696	16	03	03	TAHUAMANU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1697	17	01	01	MOQUEGUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1698	17	01	02	CARUMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1699	17	01	03	CUCHUMBAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1700	17	01	04	SAN CRISTOBAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1701	17	01	05	TORATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1702	17	01	06	SAMEGUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1703	17	02	01	OMATE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1704	17	02	02	COALAQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1705	17	02	03	CHOJATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1706	17	02	04	ICHUNA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1707	17	02	05	LA CAPILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1708	17	02	06	LLOQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1709	17	02	07	MATALAQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1710	17	02	08	PUQUINA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1711	17	02	09	QUINISTAQUILLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1712	17	02	10	UBINAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1713	17	02	11	YUNGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1714	17	03	01	ILO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1715	17	03	02	EL ALGARROBAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1716	17	03	03	PACOCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1717	18	01	01	CHAUPIMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1718	18	01	03	HUACHON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1719	18	01	04	HUARIACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1720	18	01	05	HUAYLLAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1721	18	01	06	NINACACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1722	18	01	07	PALLANCHACRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1723	18	01	08	PAUCARTAMBO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1724	18	01	09	SAN FCO DE ASIS DE YARUSYACAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1725	18	01	10	SIMON BOLIVAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1726	18	01	11	TICLACAYAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1727	18	01	12	TINYAHUARCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1728	18	01	13	VICCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1729	18	01	14	YANACANCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1730	18	02	01	YANAHUANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1731	18	02	02	CHACAYAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1732	18	02	03	GOYLLARISQUIZGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1733	18	02	04	PAUCAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1734	18	02	05	SAN PEDRO DE PILLAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1735	18	02	06	SANTA ANA DE TUSI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1736	18	02	07	TAPUC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1737	18	02	08	VILCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1738	18	03	01	OXAPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1739	18	03	02	CHONTABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1740	18	03	03	HUANCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1741	18	03	04	PUERTO BERMUDEZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1742	18	03	05	VILLA RICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1743	18	03	06	POZUZO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1744	18	03	07	PALCAZU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1745	19	01	01	PIURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1746	19	01	03	CASTILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1747	19	01	04	CATACAOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1748	19	01	05	LA ARENA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1749	19	01	06	LA UNION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1750	19	01	07	LAS LOMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1751	19	01	09	TAMBO GRANDE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1752	19	01	13	CURA MORI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1753	19	01	14	EL TALLAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1754	19	02	01	AYABACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1755	19	02	02	FRIAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1756	19	02	03	LAGUNAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1757	19	02	04	MONTERO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1758	19	02	05	PACAIPAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1759	19	02	06	SAPILLICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1760	19	02	07	SICCHEZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1761	19	02	08	SUYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1762	19	02	09	JILILI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1763	19	02	10	PAIMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1764	19	03	01	HUANCABAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1765	19	03	02	CANCHAQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1766	19	03	03	HUARMACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1767	19	03	04	SONDOR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1768	19	03	05	SONDORILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1769	19	03	06	EL CARMEN DE LA FRONTERA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1770	19	03	07	SAN MIGUEL DE EL FAIQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1771	19	03	08	LALAQUIZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1772	19	04	01	CHULUCANAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1773	19	04	02	BUENOS AIRES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1774	19	04	03	CHALACO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1775	19	04	04	MORROPON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1776	19	04	05	SALITRAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1777	19	04	06	SANTA CATALINA DE MOSSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1778	19	04	07	SANTO DOMINGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1779	19	04	08	LA MATANZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1780	19	04	09	YAMANGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1781	19	04	10	SAN JUAN DE BIGOTE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1782	19	05	01	PAITA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1783	19	05	02	AMOTAPE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1784	19	05	03	ARENAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1785	19	05	04	LA HUACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1786	19	05	05	PUEBLO NUEVO DE COLAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1787	19	05	06	TAMARINDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1788	19	05	07	VICHAYAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1789	19	06	01	SULLANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1790	19	06	02	BELLAVISTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1791	19	06	03	LANCONES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1792	19	06	04	MARCAVELICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1793	19	06	05	MIGUEL CHECA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1794	19	06	06	QUERECOTILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1795	19	06	07	SALITRAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1796	19	06	08	IGNACIO ESCUDERO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1797	19	07	01	PARINAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1798	19	07	02	EL ALTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1799	19	07	03	LA BREA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1800	19	07	04	LOBITOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1801	19	07	05	MANCORA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1802	19	07	06	LOS ORGANOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1803	19	08	01	SECHURA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1804	19	08	02	VICE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1805	19	08	03	BERNAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1806	19	08	04	BELLAVISTA DE LA UNION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1807	19	08	05	CRISTO NOS VALGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1808	19	08	06	RINCONADA LLICUAR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1809	20	01	01	PUNO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1810	20	01	02	ACORA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1811	20	01	03	ATUNCOLLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1812	20	01	04	CAPACHICA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1813	20	01	05	COATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1814	20	01	06	CHUCUITO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1815	20	01	07	HUATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1816	20	01	08	MANAZO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1817	20	01	09	PAUCARCOLLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1818	20	01	10	PICHACANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1819	20	01	11	SAN ANTONIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1820	20	01	12	TIQUILLACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1821	20	01	13	VILQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1822	20	01	14	PLATERIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1823	20	01	15	AMANTANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1824	20	02	01	AZANGARO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1825	20	02	02	ACHAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1826	20	02	03	ARAPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1827	20	02	04	ASILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1828	20	02	05	CAMINACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1829	20	02	06	CHUPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1830	20	02	07	JOSE DOMINGO CHOQUEHUANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1831	20	02	08	MUNANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1832	20	02	10	POTONI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1833	20	02	12	SAMAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1834	20	02	13	SAN ANTON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1835	20	02	14	SAN JOSE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1836	20	02	15	SAN JUAN DE SALINAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1837	20	02	16	STGO DE PUPUJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1838	20	02	17	TIRAPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1839	20	03	01	MACUSANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1840	20	03	02	AJOYANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1841	20	03	03	AYAPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1842	20	03	04	COASA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1843	20	03	05	CORANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1844	20	03	06	CRUCERO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1845	20	03	07	ITUATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1846	20	03	08	OLLACHEA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1847	20	03	09	SAN GABAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1848	20	03	10	USICAYOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1849	20	04	01	JULI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1850	20	04	02	DESAGUADERO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1851	20	04	03	HUACULLANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1852	20	04	06	PISACOMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1853	20	04	07	POMATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1854	20	04	10	ZEPITA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1855	20	04	12	KELLUYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1856	20	05	01	HUANCANE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1857	20	05	02	COJATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1858	20	05	04	INCHUPALLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1859	20	05	06	PUSI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1860	20	05	07	ROSASPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1861	20	05	08	TARACO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1862	20	05	09	VILQUE CHICO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1863	20	05	11	HUATASANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1864	20	06	01	LAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1865	20	06	02	CABANILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1866	20	06	03	CALAPUJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1867	20	06	04	NICASIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1868	20	06	05	OCUVIRI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1869	20	06	06	PALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1870	20	06	07	PARATIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1871	20	06	08	PUCARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1872	20	06	09	SANTA LUCIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1873	20	06	10	VILAVILA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1874	20	07	01	AYAVIRI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1875	20	07	02	ANTAUTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1876	20	07	03	CUPI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1877	20	07	04	LLALLI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1878	20	07	05	MACARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1879	20	07	06	NUNOA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1880	20	07	07	ORURILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1881	20	07	08	SANTA ROSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1882	20	07	09	UMACHIRI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1883	20	08	01	SANDIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1884	20	08	03	CUYOCUYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1885	20	08	04	LIMBANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1886	20	08	05	PHARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1887	20	08	06	PATAMBUCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1888	20	08	07	QUIACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1889	20	08	08	SAN JUAN DEL ORO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1890	20	08	10	YANAHUAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1891	20	08	11	ALTO INAMBARI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1892	20	08	12	SAN PEDRO DE PUTINA PUNCO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1893	20	09	01	JULIACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1894	20	09	02	CABANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1895	20	09	03	CABANILLAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1896	20	09	04	CARACOTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1897	20	10	01	YUNGUYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1898	20	10	02	UNICACHI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1899	20	10	03	ANAPIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1900	20	10	04	COPANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1901	20	10	05	CUTURAPI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1902	20	10	06	OLLARAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1903	20	10	07	TINICACHI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1904	20	11	01	PUTINA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1905	20	11	02	PEDRO VILCA APAZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1906	20	11	03	QUILCA PUNCU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1907	20	11	04	ANANEA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1908	20	11	05	SINA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1909	20	12	01	ILAVE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1910	20	12	02	PILCUYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1911	20	12	03	SANTA ROSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1912	20	12	04	CAPASO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1913	20	12	05	CONDURIRI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1914	20	13	01	MOHO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1915	20	13	02	CONIMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1916	20	13	03	TILALI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1917	20	13	04	HUAYRAPATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1918	21	01	01	MOYOBAMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1919	21	01	02	CALZADA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1920	21	01	03	HABANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1921	21	01	04	JEPELACIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1922	21	01	05	SORITOR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1923	21	01	06	YANTALO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1924	21	02	01	SAPOSOA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1925	21	02	02	PISCOYACU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1926	21	02	03	SACANCHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1927	21	02	04	TINGO DE SAPOSOA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1928	21	02	05	ALTO SAPOSOA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1929	21	02	06	EL ESLABON	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1930	21	03	01	LAMAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1931	21	03	03	BARRANQUITA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1932	21	03	04	CAYNARACHI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1933	21	03	05	CUNUMBUQUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1934	21	03	06	PINTO RECODO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1935	21	03	07	RUMISAPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1936	21	03	11	SHANAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1937	21	03	13	TABALOSOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1938	21	03	14	ZAPATERO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1939	21	03	15	ALONSO DE ALVARADO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1940	21	03	16	SAN ROQUE DE CUMBAZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1941	21	04	01	JUANJUI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1942	21	04	02	CAMPANILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1943	21	04	03	HUICUNGO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1944	21	04	04	PACHIZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1945	21	04	05	PAJARILLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1946	21	05	01	RIOJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1947	21	05	02	POSIC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1948	21	05	03	YORONGOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1949	21	05	04	YURACYACU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1950	21	05	05	NUEVA CAJAMARCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1951	21	05	06	ELIAS SOPLIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1952	21	05	07	SAN FERNANDO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1953	21	05	08	PARDO MIGUEL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1954	21	05	09	AWAJUN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1955	21	06	01	TARAPOTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1956	21	06	02	ALBERTO LEVEAU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1957	21	06	04	CACATACHI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1958	21	06	06	CHAZUTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1959	21	06	07	CHIPURANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1960	21	06	08	EL PORVENIR	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1961	21	06	09	HUIMBAYOC	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1962	21	06	10	JUAN GUERRA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1963	21	06	11	MORALES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1964	21	06	12	PAPAPLAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1965	21	06	16	SAN ANTONIO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1966	21	06	19	SAUCE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1967	21	06	20	SHAPAJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1968	21	06	21	LA BANDA DE SHILCAYO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1969	21	07	01	BELLAVISTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1970	21	07	02	SAN RAFAEL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1971	21	07	03	SAN PABLO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1972	21	07	04	ALTO BIAVO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1973	21	07	05	HUALLAGA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1974	21	07	06	BAJO BIAVO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1975	21	08	01	TOCACHE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1976	21	08	02	NUEVO PROGRESO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1977	21	08	03	POLVORA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1978	21	08	04	SHUNTE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1979	21	08	05	UCHIZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1980	21	09	01	PICOTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1981	21	09	02	BUENOS AIRES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1982	21	09	03	CASPIZAPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1983	21	09	04	PILLUANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1984	21	09	05	PUCACACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1985	21	09	06	SAN CRISTOBAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1986	21	09	07	SAN HILARION	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1987	21	09	08	TINGO DE PONASA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1988	21	09	09	TRES UNIDOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1989	21	09	10	SHAMBOYACU	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1990	21	10	01	SAN JOSE DE SISA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1991	21	10	02	AGUA BLANCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1992	21	10	03	SHATOJA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1993	21	10	04	SAN MARTIN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1994	21	10	05	SANTA ROSA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1995	22	01	01	TACNA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1996	22	01	02	CALANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1997	22	01	04	INCLAN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1998	22	01	07	PACHIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
1999	22	01	08	PALCA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2000	22	01	09	POCOLLAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2001	22	01	10	SAMA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2002	22	01	11	ALTO DE LA ALIANZA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2003	22	01	12	CIUDAD NUEVA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2004	22	01	13	CORONEL GREGORIO ALBARRACIN L.ALFONSO UGARTE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2005	22	02	01	TARATA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2006	22	02	05	CHUCATAMANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2007	22	02	06	ESTIQUE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2008	22	02	07	ESTIQUE PAMPA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2009	22	02	10	SITAJARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2010	22	02	11	SUSAPAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2011	22	02	12	TARUCACHI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2012	22	02	13	TICACO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2013	22	03	01	LOCUMBA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2014	22	03	02	ITE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2015	22	03	03	ILABAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2016	22	04	01	CANDARAVE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2017	22	04	02	CAIRANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2018	22	04	03	CURIBAYA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2019	22	04	04	HUANUARA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2020	22	04	05	QUILAHUANI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2021	22	04	06	CAMILACA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2022	23	01	01	TUMBES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2023	23	01	02	CORRALES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2024	23	01	03	LA CRUZ	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2025	23	01	04	PAMPAS DE HOSPITAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2026	23	01	05	SAN JACINTO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2027	23	01	06	SAN JUAN DE LA VIRGEN	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2028	23	02	01	ZORRITOS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2029	23	02	02	CASITAS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2030	23	02	03	CANOAS DE PUNTA SAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2031	23	03	01	ZARUMILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2032	23	03	02	MATAPALO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2033	23	03	03	PAPAYAL	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2034	23	03	04	AGUAS VERDES	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2035	24	01	01	CALLAO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2036	24	01	02	BELLAVISTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2037	24	01	03	LA PUNTA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2038	24	01	04	CARMEN DE LA LEGUA-REYNOSO	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2039	24	01	05	LA PERLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2040	24	01	06	VENTANILLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2041	25	01	01	CALLERIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2042	25	01	02	YARINACOCHA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2043	25	01	03	MASISEA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2044	25	01	04	CAMPOVERDE	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2045	25	01	05	IPARIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2046	25	01	06	NUEVA REQUENA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2047	25	01	07	MANANTAY	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2048	25	02	01	PADRE ABAD	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2049	25	02	02	YRAZOLA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2050	25	02	03	CURIMANA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2051	25	03	01	RAIMONDI	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2052	25	03	02	TAHUANIA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2053	25	03	03	YURUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2054	25	03	04	SEPAHUA	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
2055	25	04	01	PURUS	\N	0	2024-10-02 12:46:15.991037	\N	\N	2024-10-02 12:46:15.991037	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1724806375363	CustomMigrationTemplate1724806375363
2	1727872724982	Angel1727872724982
3	1728345207393	Angel1728345207393
4	1728345270034	Angel1728345270034
5	1728348123390	Angel1728348123390
6	1728428011866	Angel1728428011866
7	1728430091785	Angel1728430091785
8	1728437439047	Angel1728437439047
9	1728648905996	Angel1728648905996
10	1728650093659	Angel1728650093659
11	1729125049596	Angel1729125049596
12	1729129909486	Angel1729129909486
13	1729215638912	Angel1729215638912
14	1729454843142	Angel1729454843142
15	1729644838631	Angel1729644838631
16	1729646135739	Angel1729646135739
17	1729646568967	Angel1729646568967
18	1729646706224	Angel1729646706224
19	1729646985822	Angel1729646985822
20	1729728907645	Angel1729728907645
\.


--
-- Data for Name: accion; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.accion ("accionId", descripcion, accion, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: config_email; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.config_email ("configEmailId", name, "user", pass, host, port, secure, "companyId") FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.menu ("menuId", descripcion, contenido, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
1	Administración		0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
2	Datos de la entidad	Entidad	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
3	Usuarios	Manage/ManageLogins	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
4	General	\N	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
5	Inicio	Home/Index	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
6	Mantenimiento	\N	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
7	Tupa	Mantenimiento/UOrganicasTupa	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
8	Personas	Mantenimiento/Personas	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
9	Sede	Mantenimiento/Sede	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
10	Unidad Orgánica	Mantenimiento/UnidadOrganica	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
11	Trámite		0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
12	Expedientes	Tramite/ExpedienteExterno	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
13	Correlativos	Mantenimiento/Correlativos	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
14	Bandeja de Entrada	Tramite/BandejaEntrada	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
1014	Calendario	Mantenimiento/Calendario	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
2014	Correlativos Unidades	Mantenimiento/CorrelativosUnidades	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
2015	Documentos Internos	Tramite/DocumentosInternos	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
2016	Expedientes MPV	Tramite/ExpedienteMPV	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
2017	Roles	Manage/ManageRol	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
2018	Parámetros	Mantenimiento/Parametros	0	2024-10-02 22:57:43.139463	\N	\N	2024-10-02 22:57:43.139463	\N	\N
\.


--
-- Data for Name: menu_accion; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.menu_accion ("menuId", "accionId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: permiso_rol; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.permiso_rol ("rolId", "menuId", "accionId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: permiso_usuario; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.permiso_usuario ("usuarioId", "menuId", "accionId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: permisos_menu; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.permisos_menu ("menuId", "usuarioId", ver, agregar, borrar, modificar, imprimir, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.rol ("rolId", descripcion, detalle, interno, correlativo, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
2	ADMINISTRADOR		f	t	0	2024-10-02 12:49:28.412986	\N	\N	2024-10-02 12:49:28.412986	\N	\N
3	MESA DE PARTES		f	\N	0	2024-10-02 12:49:28.412986	\N	\N	2024-10-02 12:49:28.412986	\N	\N
4	MESA DE PARTES		f	t	0	2024-10-02 12:49:28.412986	\N	\N	2024-10-02 12:49:28.412986	\N	\N
5	TRAMITE		t	\N	0	2024-10-02 12:49:28.412986	\N	\N	2024-10-02 12:49:28.412986	\N	\N
6	SECRETARIA		t	\N	0	2024-10-02 12:49:28.412986	\N	\N	2024-10-02 12:49:28.412986	\N	\N
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.usuario ("usuarioId", "personaId", "usuarioNombre", clave, estado, avatar, "rolId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
1	1	angel	$2a$10$DgeaIJP0myY46o7jBuzyYuoxbEMViQ.GRmiKvZ3Z9r/bbi0ZCbUMS	t		\N	0	2024-10-03 00:46:11.2054	\N	\N	2024-10-17 12:57:27.088493	\N	\N
\.


--
-- Data for Name: usuarios_u_organicas; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.usuarios_u_organicas ("usuarioId", "unidadOrganicaId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "select") FROM stdin;
1	24	0	2024-10-07 23:39:40.151966	\N	\N	2024-10-08 00:13:42.478088	\N	\N	f
1	114	0	2024-10-07 23:39:40.151966	\N	\N	2024-10-08 00:13:42.478088	\N	\N	f
1	113	0	2024-10-07 23:39:40.151966	\N	\N	2024-10-08 00:13:42.478088	\N	\N	f
1	115	0	2024-10-07 23:39:40.151966	\N	\N	2024-10-08 00:13:42.478088	\N	\N	f
1	111	0	2024-10-07 23:39:40.151966	\N	\N	2024-10-08 00:13:42.478088	\N	\N	f
1	112	0	2024-10-07 23:39:40.151966	\N	\N	2024-10-08 00:13:43.467966	\N	\N	t
\.


--
-- Data for Name: archivo_adjunto; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.archivo_adjunto ("audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "archivoAdjuntoId", "expedienteId", url, "origenId", destinos, procesos, tipo, nombre, extension) FROM stdin;
0	2024-10-18 00:04:33.623313	\N	\N	2024-10-18 00:04:33.623313	\N	\N	4	15	http://localhost:5001/public-files/87556ae9-1697-4469-aad3-85bc5d94eb4b/guiaxmlfacturaversion_2-110_2_0_1.pdf	112	0	0	0	guiaxmlfacturaversion_2-110_2_0_1.pdf	pdf
0	2024-10-18 00:04:33.623313	\N	\N	2024-10-18 00:04:33.623313	\N	\N	5	15	http://localhost:5001/public-files/87556ae9-1697-4469-aad3-85bc5d94eb4b/aspectos_tcnicos_-_emisor_electrnico_0-datos_q_tiene_el_qr.pdf	112	0	0	0	aspectos_tcnicos_-_emisor_electrnico_0-datos_q_tiene_el_qr.pdf	pdf
0	2024-10-18 02:12:23.495222	\N	\N	2024-10-18 02:12:23.495222	\N	\N	6	17	http://localhost:5001/public-files/87aad776-056b-4b77-a327-739acce7f4b4/sello.pdf	112	0	0	0	sello.pdf	pdf
0	2024-10-18 02:12:23.495222	\N	\N	2024-10-18 02:12:23.495222	\N	\N	7	17	http://localhost:5001/public-files/87aad776-056b-4b77-a327-739acce7f4b4/20534338806-007377.xml	112	0	0	0	20534338806-007377.xml	xml
0	2024-10-18 02:12:23.495222	\N	\N	2024-10-18 02:12:23.495222	\N	\N	8	17	http://localhost:5001/public-files/87aad776-056b-4b77-a327-739acce7f4b4/peakpx.jpg	112	0	0	0	peakpx.jpg	jpg
0	2024-10-19 01:28:27.700185	\N	\N	2024-10-19 01:28:27.700185	\N	\N	9	21	http://localhost:5001/public-files/23087455-af93-47bc-8798-2c6c7027e786/hoja_tramite_td02831_18_10_2024.pdf	112	0	0	0	hoja_tramite_td02831_18_10_2024.pdf	pdf
0	2024-10-19 01:28:27.700185	\N	\N	2024-10-19 01:28:27.700185	\N	\N	10	21	http://localhost:5001/public-files/23087455-af93-47bc-8798-2c6c7027e786/cfv3-4-manual_de_firmas_xml.pdf	112	0	0	0	cfv3-4-manual_de_firmas_xml.pdf	pdf
0	2024-10-19 01:28:27.700185	\N	\N	2024-10-19 01:28:27.700185	\N	\N	11	21	http://localhost:5001/public-files/23087455-af93-47bc-8798-2c6c7027e786/file.png	112	0	0	0	file.png	png
0	2024-10-23 12:44:02.476106	\N	\N	2024-10-23 12:44:02.476106	\N	\N	12	42	http://localhost:5001/public-files/e2bd997c-0c5f-47e2-aaed-8d8eb9b8bacb/captura_de_pantalla_2024-10-22_091742.png	112	0	0	0	captura_de_pantalla_2024-10-22_091742.png	png
0	2024-10-23 12:44:02.476106	\N	\N	2024-10-23 12:44:02.476106	\N	\N	13	42	http://localhost:5001/public-files/e2bd997c-0c5f-47e2-aaed-8d8eb9b8bacb/camscanner_02-07-2024_13.50.pdf	112	0	0	0	camscanner_02-07-2024_13.50.pdf	pdf
0	2024-10-24 21:33:17.990993	\N	\N	2024-10-24 21:33:17.990993	\N	\N	14	45	http://localhost:5002/public-files/bc2d6ac0-4104-4b4a-ba4d-7cd7f81cb28f/conformidad_recepcion_01_10_2024.pdf	112	0	0	0	conformidad_recepcion_01_10_2024.pdf	pdf
\.


--
-- Data for Name: archivo_adjunto_mpv; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.archivo_adjunto_mpv (id, "relacionId", nombre, extension, "nombreFTP", ubicacion, contenido, origen, destinos, procesos, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: calendario; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.calendario ("calendarioId", title, start, "end", year, month, day, color, textcolor, massive, "allDay", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
108	feriado de la nada	2024-10-10 05:00:00+00	2024-10-10 05:00:00+00	2024	10	10			f	f	0	2024-10-08 21:03:19.397802	\N	\N	2024-10-08 21:03:19.397802	\N	\N
109	Feriado	2024-01-07 05:00:00+00	2024-01-07 05:00:00+00	2024	1	7	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
110	Feriado	2024-01-14 05:00:00+00	2024-01-14 05:00:00+00	2024	1	14	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
111	Feriado	2024-01-21 05:00:00+00	2024-01-21 05:00:00+00	2024	1	21	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
112	Feriado	2024-01-28 05:00:00+00	2024-01-28 05:00:00+00	2024	1	28	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
113	Feriado	2024-02-04 05:00:00+00	2024-02-04 05:00:00+00	2024	2	4	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
114	Feriado	2024-02-11 05:00:00+00	2024-02-11 05:00:00+00	2024	2	11	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
115	Feriado	2024-02-18 05:00:00+00	2024-02-18 05:00:00+00	2024	2	18	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
116	Feriado	2024-02-25 05:00:00+00	2024-02-25 05:00:00+00	2024	2	25	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
117	Feriado	2024-03-03 05:00:00+00	2024-03-03 05:00:00+00	2024	3	3	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
118	Feriado	2024-03-10 05:00:00+00	2024-03-10 05:00:00+00	2024	3	10	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
119	Feriado	2024-03-17 05:00:00+00	2024-03-17 05:00:00+00	2024	3	17	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
120	Feriado	2024-03-24 05:00:00+00	2024-03-24 05:00:00+00	2024	3	24	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
121	Feriado	2024-03-31 05:00:00+00	2024-03-31 05:00:00+00	2024	3	31	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
122	Feriado	2024-04-07 05:00:00+00	2024-04-07 05:00:00+00	2024	4	7	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
123	Feriado	2024-04-14 05:00:00+00	2024-04-14 05:00:00+00	2024	4	14	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
124	Feriado	2024-04-21 05:00:00+00	2024-04-21 05:00:00+00	2024	4	21	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
125	Feriado	2024-04-28 05:00:00+00	2024-04-28 05:00:00+00	2024	4	28	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
126	Feriado	2024-05-05 05:00:00+00	2024-05-05 05:00:00+00	2024	5	5	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
127	Feriado	2024-05-12 05:00:00+00	2024-05-12 05:00:00+00	2024	5	12	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
128	Feriado	2024-05-19 05:00:00+00	2024-05-19 05:00:00+00	2024	5	19	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
129	Feriado	2024-05-26 05:00:00+00	2024-05-26 05:00:00+00	2024	5	26	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
130	Feriado	2024-06-02 05:00:00+00	2024-06-02 05:00:00+00	2024	6	2	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
131	Feriado	2024-06-09 05:00:00+00	2024-06-09 05:00:00+00	2024	6	9	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
132	Feriado	2024-06-16 05:00:00+00	2024-06-16 05:00:00+00	2024	6	16	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
133	Feriado	2024-06-23 05:00:00+00	2024-06-23 05:00:00+00	2024	6	23	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
134	Feriado	2024-06-30 05:00:00+00	2024-06-30 05:00:00+00	2024	6	30	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
135	Feriado	2024-07-07 05:00:00+00	2024-07-07 05:00:00+00	2024	7	7	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
136	Feriado	2024-07-14 05:00:00+00	2024-07-14 05:00:00+00	2024	7	14	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
137	Feriado	2024-07-21 05:00:00+00	2024-07-21 05:00:00+00	2024	7	21	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
138	Feriado	2024-07-28 05:00:00+00	2024-07-28 05:00:00+00	2024	7	28	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
139	Feriado	2024-08-04 05:00:00+00	2024-08-04 05:00:00+00	2024	8	4	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
140	Feriado	2024-08-11 05:00:00+00	2024-08-11 05:00:00+00	2024	8	11	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
141	Feriado	2024-08-18 05:00:00+00	2024-08-18 05:00:00+00	2024	8	18	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
142	Feriado	2024-08-25 05:00:00+00	2024-08-25 05:00:00+00	2024	8	25	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
143	Feriado	2024-09-01 05:00:00+00	2024-09-01 05:00:00+00	2024	9	1	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
144	Feriado	2024-09-08 05:00:00+00	2024-09-08 05:00:00+00	2024	9	8	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
145	Feriado	2024-09-15 05:00:00+00	2024-09-15 05:00:00+00	2024	9	15	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
146	Feriado	2024-09-22 05:00:00+00	2024-09-22 05:00:00+00	2024	9	22	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
147	Feriado	2024-09-29 05:00:00+00	2024-09-29 05:00:00+00	2024	9	29	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
148	Feriado	2024-10-06 05:00:00+00	2024-10-06 05:00:00+00	2024	10	6	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
149	Feriado	2024-10-13 05:00:00+00	2024-10-13 05:00:00+00	2024	10	13	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
150	Feriado	2024-10-20 05:00:00+00	2024-10-20 05:00:00+00	2024	10	20	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
151	Feriado	2024-10-27 05:00:00+00	2024-10-27 05:00:00+00	2024	10	27	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
152	Feriado	2024-11-03 05:00:00+00	2024-11-03 05:00:00+00	2024	11	3	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
153	Feriado	2024-11-10 05:00:00+00	2024-11-10 05:00:00+00	2024	11	10	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
154	Feriado	2024-11-17 05:00:00+00	2024-11-17 05:00:00+00	2024	11	17	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
155	Feriado	2024-11-24 05:00:00+00	2024-11-24 05:00:00+00	2024	11	24	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
156	Feriado	2024-12-01 05:00:00+00	2024-12-01 05:00:00+00	2024	12	1	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
157	Feriado	2024-12-08 05:00:00+00	2024-12-08 05:00:00+00	2024	12	8	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
158	Feriado	2024-12-15 05:00:00+00	2024-12-15 05:00:00+00	2024	12	15	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
159	Feriado	2024-12-22 05:00:00+00	2024-12-22 05:00:00+00	2024	12	22	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
160	Feriado	2024-12-29 05:00:00+00	2024-12-29 05:00:00+00	2024	12	29	red-500	white	f	f	0	2024-10-24 18:44:12.888281	\N	\N	2024-10-24 18:44:12.888281	\N	\N
55	PRUEBA	2024-10-09 05:00:00+00	2024-10-09 05:00:00+00	2024	10	9			f	f	0	2024-10-08 20:23:05.101645	\N	\N	2024-10-08 20:23:05.101645	\N	\N
56	Feriado	2024-01-06 05:00:00+00	2024-01-06 05:00:00+00	2024	1	6	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
57	Feriado	2024-01-13 05:00:00+00	2024-01-13 05:00:00+00	2024	1	13	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
58	Feriado	2024-01-20 05:00:00+00	2024-01-20 05:00:00+00	2024	1	20	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
59	Feriado	2024-01-27 05:00:00+00	2024-01-27 05:00:00+00	2024	1	27	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
60	Feriado	2024-02-03 05:00:00+00	2024-02-03 05:00:00+00	2024	2	3	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
61	Feriado	2024-02-10 05:00:00+00	2024-02-10 05:00:00+00	2024	2	10	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
62	Feriado	2024-02-17 05:00:00+00	2024-02-17 05:00:00+00	2024	2	17	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
63	Feriado	2024-02-24 05:00:00+00	2024-02-24 05:00:00+00	2024	2	24	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
64	Feriado	2024-03-02 05:00:00+00	2024-03-02 05:00:00+00	2024	3	2	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
65	Feriado	2024-03-09 05:00:00+00	2024-03-09 05:00:00+00	2024	3	9	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
66	Feriado	2024-03-16 05:00:00+00	2024-03-16 05:00:00+00	2024	3	16	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
67	Feriado	2024-03-23 05:00:00+00	2024-03-23 05:00:00+00	2024	3	23	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
68	Feriado	2024-03-30 05:00:00+00	2024-03-30 05:00:00+00	2024	3	30	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
69	Feriado	2024-04-06 05:00:00+00	2024-04-06 05:00:00+00	2024	4	6	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
70	Feriado	2024-04-13 05:00:00+00	2024-04-13 05:00:00+00	2024	4	13	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
71	Feriado	2024-04-20 05:00:00+00	2024-04-20 05:00:00+00	2024	4	20	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
72	Feriado	2024-04-27 05:00:00+00	2024-04-27 05:00:00+00	2024	4	27	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
73	Feriado	2024-05-04 05:00:00+00	2024-05-04 05:00:00+00	2024	5	4	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
74	Feriado	2024-05-11 05:00:00+00	2024-05-11 05:00:00+00	2024	5	11	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
75	Feriado	2024-05-18 05:00:00+00	2024-05-18 05:00:00+00	2024	5	18	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
76	Feriado	2024-05-25 05:00:00+00	2024-05-25 05:00:00+00	2024	5	25	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
77	Feriado	2024-06-01 05:00:00+00	2024-06-01 05:00:00+00	2024	6	1	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
78	Feriado	2024-06-08 05:00:00+00	2024-06-08 05:00:00+00	2024	6	8	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
79	Feriado	2024-06-15 05:00:00+00	2024-06-15 05:00:00+00	2024	6	15	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
80	Feriado	2024-06-22 05:00:00+00	2024-06-22 05:00:00+00	2024	6	22	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
81	Feriado	2024-06-29 05:00:00+00	2024-06-29 05:00:00+00	2024	6	29	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
82	Feriado	2024-07-06 05:00:00+00	2024-07-06 05:00:00+00	2024	7	6	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
83	Feriado	2024-07-13 05:00:00+00	2024-07-13 05:00:00+00	2024	7	13	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
84	Feriado	2024-07-20 05:00:00+00	2024-07-20 05:00:00+00	2024	7	20	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
85	Feriado	2024-07-27 05:00:00+00	2024-07-27 05:00:00+00	2024	7	27	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
86	Feriado	2024-08-03 05:00:00+00	2024-08-03 05:00:00+00	2024	8	3	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
87	Feriado	2024-08-10 05:00:00+00	2024-08-10 05:00:00+00	2024	8	10	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
88	Feriado	2024-08-17 05:00:00+00	2024-08-17 05:00:00+00	2024	8	17	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
89	Feriado	2024-08-24 05:00:00+00	2024-08-24 05:00:00+00	2024	8	24	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
90	Feriado	2024-08-31 05:00:00+00	2024-08-31 05:00:00+00	2024	8	31	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
91	Feriado	2024-09-07 05:00:00+00	2024-09-07 05:00:00+00	2024	9	7	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
92	Feriado	2024-09-14 05:00:00+00	2024-09-14 05:00:00+00	2024	9	14	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
93	Feriado	2024-09-21 05:00:00+00	2024-09-21 05:00:00+00	2024	9	21	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
94	Feriado	2024-09-28 05:00:00+00	2024-09-28 05:00:00+00	2024	9	28	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
95	Feriado	2024-10-05 05:00:00+00	2024-10-05 05:00:00+00	2024	10	5	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
96	Feriado	2024-10-12 05:00:00+00	2024-10-12 05:00:00+00	2024	10	12	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
97	Feriado	2024-10-19 05:00:00+00	2024-10-19 05:00:00+00	2024	10	19	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
98	Feriado	2024-10-26 05:00:00+00	2024-10-26 05:00:00+00	2024	10	26	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
99	Feriado	2024-11-02 05:00:00+00	2024-11-02 05:00:00+00	2024	11	2	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
100	Feriado	2024-11-09 05:00:00+00	2024-11-09 05:00:00+00	2024	11	9	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
101	Feriado	2024-11-16 05:00:00+00	2024-11-16 05:00:00+00	2024	11	16	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
102	Feriado	2024-11-23 05:00:00+00	2024-11-23 05:00:00+00	2024	11	23	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
103	Feriado	2024-11-30 05:00:00+00	2024-11-30 05:00:00+00	2024	11	30	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
104	Feriado	2024-12-07 05:00:00+00	2024-12-07 05:00:00+00	2024	12	7	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
105	Feriado	2024-12-14 05:00:00+00	2024-12-14 05:00:00+00	2024	12	14	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
106	Feriado	2024-12-21 05:00:00+00	2024-12-21 05:00:00+00	2024	12	21	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
107	Feriado	2024-12-28 05:00:00+00	2024-12-28 05:00:00+00	2024	12	28	red-500	white	f	f	0	2024-10-08 20:23:41.323194	\N	\N	2024-10-08 20:23:41.323194	\N	\N
\.


--
-- Data for Name: correlativo; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.correlativo ("correlativoId", "tipoExpedienteId", anio, correlativo, longitud, prefijo, "sedeId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
3	263	2024	0	8	MPV	2	0	2024-10-18 02:27:59.98211	\N	\N	2024-10-18 02:27:59.98211	\N	\N
2	262	2024	0	8	TDI	2	0	2024-10-18 02:27:29.025617	\N	\N	2024-10-18 02:27:29.025617	\N	\N
1	261	2024	16	8	TD	2	0	2024-10-18 02:26:24.564802	\N	\N	2024-10-24 21:33:17.990993	\N	\N
\.


--
-- Data for Name: correlativo_unidad; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.correlativo_unidad ("correlativoUnidadId", "unidadOrganicaId", "tipoDocumentoId", anio, correlativo, longitud, prefijo, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: documento_interno; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.documento_interno (anio, fecha, destinatarios, copias, referencia, contenido, asunto, adjuntos, "procesoReferenciaId", "origenId", "estadoId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "documentoInternoId", "tipoDocumentoId", "nroDocumento") FROM stdin;
\.


--
-- Data for Name: encargado_uo; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.encargado_uo ("encargadoUOId", "fechaInicio", "fechaFin", documento, "unidadOrganicaId", "personaId", "tipoDocumentoId", "cargoId", estado, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
2	2024-10-20 05:00:00+00	\N	2024	24	4	3	1	t	0	2024-10-19 13:32:20.618129	\N	\N	2024-10-19 13:32:20.618129	\N	\N
1	2024-10-19 05:00:00+00	2024-10-19 05:00:00+00	2024	24	1	3	1	f	0	2024-10-19 13:29:26.902934	\N	\N	2024-10-19 13:32:20.638695	\N	\N
3	2024-10-23 05:00:00+00	\N	2024	120	5	3	5	t	0	2024-10-22 12:08:53.43526	\N	\N	2024-10-22 12:08:53.43526	\N	\N
4	2024-10-23 05:00:00+00	\N	2024	119	2	3	3	t	0	2024-10-22 12:09:16.387459	\N	\N	2024-10-22 12:09:16.387459	\N	\N
5	2024-10-23 05:00:00+00	\N	2024	112	3	3	2	t	0	2024-10-22 12:10:38.702289	\N	\N	2024-10-22 12:10:38.702289	\N	\N
6	2024-10-23 05:00:00+00	\N	2024	113	3	3	3	t	0	2024-10-22 12:11:30.314492	\N	\N	2024-10-22 12:11:30.314492	\N	\N
\.


--
-- Data for Name: expediente; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.expediente ("sedeId", "nroDocumento", cantidad, "tipoDocumentoId", asunto, descripcion, observaciones, "tipoTramiteId", "fechaLimite", "prioridadId", folio, monto, "fechaRegistro", "usuarioId", "remitenteId", "tipoExpedienteId", "procedimientoId", anio, "estadoId", referencia, "mpvId", "origenId", separado, "fechaRegularizado", correo, "personaRegistradorId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "expedienteId", uuid, "empresaId") FROM stdin;
2		1	602	fffff	eee	gggggggggggggggggg	281	2024-10-17 00:50:06.649+00	271	33	0.00	2024-10-17 00:50:46.048+00	1	2	201	\N	2024	503	ffffffffffffff	\N	112	f	\N		\N	0	2024-10-17 00:50:46.116125	\N	\N	2024-10-17 00:50:46.116125	\N	\N	11	74557a21-93a2-4330-875e-ad292f6ea93d	1
2		1	602	eeeeeeeeeee	rrrrrrrrrr	fffffffffffffffff	281	2024-10-17 01:02:00.648+00	271	22	0.00	2024-10-17 01:02:22.498+00	1	4	201	\N	2024	503	eeeeeeeeeeeer	\N	112	f	\N		\N	0	2024-10-17 01:02:22.563995	\N	\N	2024-10-17 01:02:22.563995	\N	\N	12	c2edcf7a-b180-43b3-983a-dc9715ed417f	1
2		1	602	ffffffff	eeeeeeeeee	dddddddddddd	281	2024-10-17 01:03:22.417+00	271	2323	0.00	2024-10-17 01:08:16.809+00	1	5	201	\N	2024	503	rrrrrrrrrrrr	\N	112	f	\N		\N	0	2024-10-17 01:08:16.924487	\N	\N	2024-10-17 01:08:16.924487	\N	\N	13	e2d4a2b2-5970-4dbc-8951-f352ef9fb2bf	1
2		1	602	dddddddddd	INSPECCIÓN TECNICA DE SEGURIDAD EN EDIFICACIONES POSTERIOR AL INICIO DE ACTIVIDADES PARA ESTABLECIMIENTOS OBJETO DE INSPECCIÓN CLASIFICADOS CON NIVEL DE RIESGO MEDIO - 	fffffffffffffff	283	2024-10-16 23:46:27.921+00	271	43	\N	2024-10-16 23:47:18.205+00	1	1	201	1120	2024	503	udududududd	\N	112	f	\N		\N	0	2024-10-16 23:47:18.251465	\N	\N	2024-10-16 23:47:18.251465	\N	\N	9	4380d4f2-2902-4149-a0a9-76a886c5febc	1
2		1	602	eeeeeeee	dd	eeeeeeeee	281	2024-10-16 23:59:48.069+00	271	333	\N	2024-10-17 00:00:21.987+00	1	4	201	\N	2024	503	hohohoh	\N	112	f	\N		\N	0	2024-10-17 00:00:22.060783	\N	\N	2024-10-17 00:00:22.060783	\N	\N	10	e794ed61-e86a-4aff-99cc-db50d27daf5c	1
2		1	602	ffffffffffffffffffff	rrrrrrrrrrrrr	ffffffffffffffffffff	281	2024-10-17 02:40:55.52+00	271	4343	\N	2024-10-17 02:41:22.429+00	1	4	201	\N	2024	503	fffffffffffffffff	\N	112	f	\N		\N	0	2024-10-17 02:41:22.518647	\N	\N	2024-10-17 02:41:22.518647	\N	\N	14	c3220922-7540-45b5-9566-1bb9490f4390	1
2		1	602	ffffffffffffffffffff	rrrrrrrrrrr	ddddddddddddddddd	281	2024-10-18 00:03:20.146+00	271	333	\N	2024-10-18 00:04:33.571+00	1	4	201	\N	2024	503	eeeeeeeeeeeeeeee	\N	112	f	\N		\N	0	2024-10-18 00:04:33.623313	\N	\N	2024-10-18 00:04:33.623313	\N	\N	15	87556ae9-1697-4469-aad3-85bc5d94eb4b	1
2		1	602	www	dddddd	fffffffffffffff	281	2024-10-18 00:39:25.609+00	271	3333	\N	2024-10-18 00:39:46.941+00	1	4	201	\N	2024	503	wwwwwwwww	\N	112	f	\N		\N	0	2024-10-18 00:39:47.09442	\N	\N	2024-10-18 00:39:47.09442	\N	\N	16	a3188480-7807-4261-9b37-7832ef302a42	1
2		1	602	ddddddddd	3333333	333333	281	2024-10-18 02:11:41.785+00	271	444	\N	2024-10-18 02:12:23.426+00	1	1	201	\N	2024	503	eeeeeeeeee	\N	112	f	\N		\N	0	2024-10-18 02:12:23.495222	\N	\N	2024-10-18 02:12:23.495222	\N	\N	17	87aad776-056b-4b77-a327-739acce7f4b4	1
2	TD00000001	1	602	ffffffffffffffffff	eeeeeeeeeeeeee	ffffffffffffffffffff	281	2024-10-18 12:08:29.252+00	271	33	\N	2024-10-18 12:08:48.014+00	1	4	201	\N	2024	503	fffffffffffffffffffff	\N	112	f	\N		\N	0	2024-10-18 12:08:48.064751	\N	\N	2024-10-18 12:08:48.064751	\N	\N	18	ce12c06f-86e1-4197-b791-f30342059930	1
2	TD00000001	1	602	grg	rgrg	grgrg	281	2024-10-18 12:11:05.856+00	271	3333	\N	2024-10-18 12:11:24.759+00	1	1	201	\N	2024	503	grggggggggg	\N	112	f	\N		\N	0	2024-10-18 12:11:24.775992	\N	\N	2024-10-18 12:11:24.775992	\N	\N	19	3b48a4af-fae1-4607-a3f4-b9905db1f355	1
2	TD00000002	1	602	tttggggggggggggg	ttttttttttt	gggggggggggggg	281	2024-11-08 12:36:16.168+00	271	333	\N	2024-10-18 12:36:16.168+00	1	4	201	\N	2024	503	ggggggggggggggggggg	\N	112	f	\N		\N	0	2024-10-18 12:36:16.294264	\N	\N	2024-10-18 12:36:16.294264	\N	\N	20	6c8bc99d-be11-4ca9-9cd8-30d00379c068	1
2	TD00000003	1	602	eeeee	fffffffffffffffff	fffff	281	2024-11-09 01:28:27.447+00	271	344	\N	2024-10-19 01:28:27.447+00	1	1	201	\N	2024	503	eeeeeeee	\N	112	f	\N		\N	0	2024-10-19 01:28:27.700185	\N	\N	2024-10-19 01:28:27.700185	\N	\N	21	23087455-af93-47bc-8798-2c6c7027e786	1
2	TD00000004	1	602	efffffffffff	eeeeee	ffffffffff	281	2024-11-09 00:32:18.568+00	271	444	4.00	2024-10-20 00:32:18.568+00	1	4	201	\N	2024	503	ffffffffffffffff	\N	112	f	\N		\N	0	2024-10-20 00:32:18.667867	\N	\N	2024-10-20 00:32:18.667867	\N	\N	22	79810bb5-e522-4d01-b7ff-77a2bc645e51	1
2	TD00000005	1	602	ffffffffff	rrrrrrrr	fffffffffffff	281	2024-11-08 18:03:32.532+00	271	333	\N	2024-10-20 18:03:32.532+00	1	1	201	\N	2024	503	fffffffff	\N	112	f	\N		\N	0	2024-10-20 18:03:32.58153	\N	\N	2024-10-20 18:03:32.58153	\N	\N	23	14c9dd77-c87d-405b-bb8b-d8300bdfdbf0	1
2	TD00000006	1	602	sws	ww	sssssssssss	281	2024-11-12 02:19:39.945+00	271	22	\N	2024-10-22 02:19:39.945+00	1	4	201	\N	2024	503	sssssssssss	\N	112	f	\N		\N	0	2024-10-22 02:19:40.041378	\N	\N	2024-10-22 02:19:40.041378	\N	\N	24	3ad7a7d7-1867-4f7f-a0e5-9c1c3d9419e8	1
2	TD00000008	1	602	5555555555555555555	YYYYYYYYYYYYYYYYYYY	RRRRRRRRRRRRR	281	2024-11-12 22:40:33.819+00	271	45454	\N	2024-10-22 22:40:33.819+00	1	1	201	\N	2024	504	YYYYYYYYYYYYYYY	\N	112	f	\N		\N	0	2024-10-22 22:40:33.908506	\N	\N	2024-10-22 22:45:22.120556	\N	\N	26	5fc871f0-d011-4ba8-90f6-8f0d9b8b8bdb	1
2	TD00000011	1	602	ggggggggggggggggggg	hhhhhhhhhhhhhhhhh	yyyyyyyyyyyyyyyyyyyy	281	2024-11-13 02:05:30.247+00	271	777	0.00	2024-10-23 02:05:30.247+00	1	1	261	\N	2024	503	hhhhhhhhhhhhhhhhhhhhhhhhhhhh	\N	112	f	\N		\N	0	2024-10-23 01:58:47.767063	\N	\N	2024-10-23 02:05:30.319154	\N	\N	41	ce1bf33b-3c4d-4b40-8984-a62fd8fca084	1
2	TD00000011	1	602	tttt	4444	5555tt	281	2024-11-13 01:46:11.012+00	271	4333	0.00	2024-10-23 01:46:11.012+00	1	4	261	\N	2024	\N	hhhh	\N	112	t	\N		\N	1	2024-10-23 01:30:33.503687	\N	\N	2024-10-23 01:56:52.666786	\N	\N	38	f2c90699-d33a-465e-950b-a5bb0dd7d3e3	1
2	TD00000010	1	\N				\N	\N	\N	0	0.00	2024-10-23 01:32:23.354+00	1	\N	261	\N	2024	\N		\N	112	t	\N		\N	1	2024-10-23 01:32:23.396839	\N	\N	2024-10-23 01:58:23.922188	\N	\N	39	3a8e6075-471e-4be6-9261-e9caba46fa06	1
2	TD00000009	1	602	rrrrrrrrrrrrrrrrrrr	eeeeeeeeeeeeeeeee	rrrrrrrrrrrrrrrrrrrr	281	2024-11-12 23:22:47.612+00	271	3333	\N	2024-10-22 23:22:47.612+00	1	1	201	\N	2024	503	yyyyyyyyyyyyyyyy	\N	112	f	\N		\N	1	2024-10-22 23:22:47.756846	\N	\N	2024-10-23 01:58:28.726528	\N	\N	29	0c8211f4-1c0c-45f0-aaf9-9fb39bad069f	1
2	TD00000007	1	602	ssssssssssssssssssssssssssssssss	wwwwwwwwwwwwwwwww	ssssssssssss	281	2024-11-12 12:03:09.034+00	271	222	\N	2024-10-22 12:03:09.034+00	1	1	201	\N	2024	503	wwww	\N	112	f	\N		\N	1	2024-10-22 12:03:09.15147	\N	\N	2024-10-23 01:58:32.948898	\N	\N	25	ce3f88bb-a8f2-4153-9482-774d08eeb9d8	1
2	TD00000010	1	602	gggggggggggggggggggggggg	rrrrrrrrrrrrrrrrr	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	281	2024-11-13 02:05:03.439+00	271	4455	0.00	2024-10-23 02:05:03.439+00	1	4	261	\N	2024	503	rrrrrrrrrrrr	\N	112	f	\N		\N	0	2024-10-23 01:58:47.767063	\N	\N	2024-10-23 02:05:03.568605	\N	\N	40	5103c910-3a83-4d64-924c-cd98bec222a2	1
2	TD00000013	1	\N				\N	\N	\N	0	0.00	2024-10-23 12:42:08.814+00	1	\N	261	\N	2024	503		\N	112	t	\N		\N	0	2024-10-23 12:42:09.027594	\N	\N	2024-10-23 12:42:09.027594	\N	\N	43	dec5e195-a1b7-4f50-a635-67492a9011cd	1
2	TD00000012	1	602	YYYYYYYYYYYYYYYYYY	TTTTTTTTTTTTTTTT	TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT	281	2024-11-13 12:44:02.345+00	271	34343	0.00	2024-10-23 12:44:02.345+00	1	2	261	\N	2024	504	RRRRRRRRRRRRRRRRRRRRRRRRRRRR	\N	112	f	\N		\N	0	2024-10-23 12:42:09.027594	\N	\N	2024-10-24 00:19:56.516376	\N	\N	42	e2bd997c-0c5f-47e2-aaed-8d8eb9b8bacb	1
2	TD00000014	1	602	ssssssssssssss	ccccccccccccccc	vdvd	281	2024-11-14 00:46:52.488+00	271	\N	\N	2024-10-24 00:46:52.488+00	1	1	201	\N	2024	503	ssssssssssssssss	\N	112	f	\N		\N	0	2024-10-24 00:46:52.646329	\N	\N	2024-10-24 00:46:52.646329	\N	\N	44	075a2ed8-b11a-4eeb-90c6-5873bd9a7384	1
2	TD00000015	1	602	cccccccccccc	ssssssssss	ddddddddddddddd	281	2024-11-14 21:33:17.854+00	271	333	\N	2024-10-24 21:33:17.854+00	1	4	201	\N	2024	503	ssssssssssssssssss	\N	112	f	\N		\N	0	2024-10-24 21:33:17.990993	\N	\N	2024-10-24 21:33:17.990993	\N	\N	45	bc2d6ac0-4104-4b4a-ba4d-7cd7f81cb28f	1
\.


--
-- Data for Name: expediente_mpv; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.expediente_mpv ("expedienteMPVId", "sedeId", "nroDocumento", cantidad, "tipoDocumentoId", asunto, descripcion, observaciones, "tipoTramiteId", "fechaLimite", "prioridadId", folio, monto, "fechaRegistro", "remitenteId", "tipoExpedienteId", "procedimientoId", anio, referencia, correo, "estadoId", motivo, "envioCorreo", "solicitudId", "personaRegistradorId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: expediente_vinculado; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.expediente_vinculado (id, "vinculoId", "expedienteId", "procesoId", fecha, "documentoId", documento, motivo, "usuarioId", activo, "referenciaId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: partida_presupuestal; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.partida_presupuestal ("partidaId", codigo, descripcion, estado, detalle, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: personas; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.personas ("personaId", nombres, "apePaterno", "apeMaterno", documento, direccion, email, "repLegal", contrasena, servidor, puerto, ssl, telefono, "docRep", "nombresRep", "apPatRep", "apMatRep", "emailConfirmado", token, "tokenExpiration", "tipoPersonaId", "tipoDocumentoId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
1	MIGUEL ANGEL	MEZA	NORBERTO	70354395			f	\N	\N	\N	\N		\N	\N	\N	\N	f	\N	\N	291	301	0	2024-10-07 00:30:06.748709	\N	\N	2024-10-07 00:30:06.748709	\N	\N
2	GUILLERMO	MEZA	NORBERTO	70354367			f	\N	\N	\N	\N		\N	\N	\N	\N	f	\N	\N	291	301	0	2024-10-07 00:45:55.537524	\N	\N	2024-10-07 00:45:55.537524	\N	\N
3	TELEFONICA DEL PERU SAA			20100017491	JR. DOMINGO MARTINEZ LUJAN NRO. 1130 LIMA LIMA SURQUILLO		f	\N	\N	\N	\N		\N	\N	\N	\N	f	\N	\N	292	302	0	2024-10-07 00:46:22.45043	\N	\N	2024-10-07 00:46:22.45043	\N	\N
4	ANTONIA	NORBERTO	RAMOS	23225680			f	\N	\N	\N	\N		\N	\N	\N	\N	f	\N	\N	291	301	0	2024-10-16 23:59:59.798944	\N	\N	2024-10-16 23:59:59.798944	\N	\N
5	ELIAS	MEZA	HUAMAN	23225698			f	\N	\N	\N	\N		\N	\N	\N	\N	f	\N	\N	291	301	0	2024-10-17 01:03:39.593718	\N	\N	2024-10-17 01:03:39.593718	\N	\N
\.


--
-- Data for Name: procedimiento; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.procedimiento ("procedimientoId", "unidadOrganicaId", descripcion, plazo, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
1010	112	ACCESO A LA INFORMACIÓN PÚBLICA CREADA U OBTENIDA POR LA ENTIDAD, QUE SE ENCUENTRE EN SU POSESIÓN O BAJO SU CONTROL - 	10	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1011	112	PROCEDIMIENTO NO CONTENCIOSO DE SEPARACIÓN CONVENCIONAL  - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1012	112	PROCEDIMIENTO NO CONTENCIOSO DE DIVORCIO ULTERIOR  - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1013	112	RECONOCIMIENTO Y REGISTRO DE ORGANIZACIONES SOCIALES Y ÓRGANO DIRECTIVO - 	10	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1014	122	RECURSO DE RECONSIDERACIÓN - 	30	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1015	122	RECURSO DE APELACIÓN  - 	30	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1016	118	AUTORIZACIÓN PARA INSTALACIÓN DE INFRAESTRUCTURA NECESARIA PARA LA PRESTACIÓN DE SERVICIOS PÚBLICOS DE TELECOMUNICACIONES - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1017	118	AMPLIACIÓN DE PLAZO DE AUTORIZACIÓN PARA INSTALACIÓN DE INFRAESTRUCTURA DE TELECOMUNICACIONES - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1018	118	REGULARIZACIÓN DE INFRAESTRUCTURA DE TELECOMUNICACIONES INSTALADA - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1019	118	AUTORIZACIÓN DE INSTALACIÓN DE ANTENAS O ESTACIONES DE RADIOCOMUNICACIÓN - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1020	118	AUTORIZACIÓN PARA LA REALIZACIÓN DE OBRAS DE INSTALACIÓN, AMPLIACIÓN O MANTENIMIENTO DE LA INFRAESTRUCTURA PARA PRESTACIÓN DE SERVICIOS PÚBLICOS, EN ÁREAS DE USO PÚBLICO (NO VINCULADAS A TELECOMUNICACIONES) - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1021	118	AUTORIZACIÓN PARA INSTALACIÓN DOMICILIARIA DEL SERVICIO DE AGUA, DESAGUE Y ENERGÍA ELÉCTRICA, EN ÁREAS DE USO PÚBLICO - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1022	118	AUTORIZACIÓN PARA TRABAJOS DE CONSTRUCCIÓN, MODIFICACIÓN Y/O REFACCIÓN DE SARDINELES, PISTAS, VEREDAS Y/O BERMAS, EN ÁREAS DE USO PÚBLICO - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1023	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD A: APROBACIÓN AUTOMATICA CON FIRMA DE PROFESIONALES - HABILITACIONES URBANAS DE TERRENOS EN LOS QUE SE DESARROLLEN PROYECTOS DE INVERSIÓN PÚBLICA, DE ASOCIACIÓN PUBLICO - PRIVADA O DE CONCESIÓN PRIVADA QUE SE REALICEN, PARA LA PRESTACIÓN DE SERVICIOS PÚBLICOS ESENCIALES O PARA LA EJECUCIÓN DE INFRAESTRUCTURA PÚBLICA  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1024	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD A: APROBACIÓN AUTOMATICA CON FIRMA DE PROFESIONALES - HABILITACIONES URBANAS CORRESPONDIENTES A PROGRAMAS PROMOVIDOS POR EL SECTOR VIVIENDA, PARA LA REUBICACIÓN DE BENEFICIARIOS DE ATENCIÓN EXTRAORDINARIA DEL BONO FAMILIAR HABITACIONAL, ESTABLECIDOS EN EL NUMERAL 3.2.1 DEL ARTÍCULO 3, DE LA LEY N° 27829, QUE CREA EL BONO FAMILIAR HABITACIONAL (BFH) - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1025	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD B: APROBACIÓN DE PROYECTOS CON EVALUACIÓN POR LA MUNICIPALIDAD - HABILITACIONES URBANAS DE USO RESIDENCIAL DE UNIDADES PREDIALES NO MAYORES DE CINCO (5) HECTÁREAS, QUE CONSTITUYAN ISLAS RÚSTICAS Y QUE CONFORMEN UN LOTE ÚNICO, SIEMPRE Y CUANDO NO ÉSTE AFECTO AL PLAN VIAL PROVINCIAL O METROPOLITANO - 	20	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1026	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD B: APROBACIÓN DE PROYECTOS CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - HABILITACIONES URBANAS DE USO RESIDENCIAL DE UNIDADES PREDIALES NO MAYORES DE CINCO (5) HECTÁREAS, QUE CONSTITUYAN ISLAS RÚSTICAS Y QUE CONFORMEN UN LOTE ÚNICO, SIEMPRE Y CUANDO NO ÉSTE AFECTO AL PLAN VIAL PROVINCIAL O METROPOLITANO  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1027	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - HABILITACIONES URBANAS QUE SE VAYAN A EJECUTAR POR ETAPAS, CON SUJECIÓN A UN PROYECTO INTEGRAL  - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1028	119	LICENCIA DE HABILITACION URBANA - MODALIDAD C - APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - PROYECTO INTEGRAL DE HABILITACIÓN URBANA - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1029	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - HABILITACIONES URBANAS CON CONSTRUCCIÓN SIMULTÁNEA QUE SOLICITEN VENTA GARANTIZADA DE LOTES - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1030	119	LICENCIA DE HABILITACION URBANA - MODALIDAD C - APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - HABILITACIÓN URBANA CON CONSTRUCCIÓN SIMULTÁNEA - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1031	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - HABILITACIONES URBANAS CON CONSTRUCCIÓN SIMULTÁNEA DE VIVIENDAS, EN LAS QUE EL NÚMERO, DIMENSIONES DE LOTES A HABILITAR Y TIPO DE VIVIENDAS A EDIFICAR SE DEFINAN EN EL PROYECTO, SIEMPRE QUE SU FINALIDAD SEA LA VENTA DE VIVIENDAS EDIFICADAS  - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1032	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - HABILITACIONES URBANAS QUE NO SE ENCUENTREN CONTEMPLADAS EN LAS MODALIDADES A, B Y D - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1033	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - HABILITACIONES URBANAS QUE SE VAYAN A EJECUTAR POR ETAPAS, CON SUJECIÓN A UN PROYECTO INTEGRAL - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1034	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - HABILITACIONES URBANAS CON CONSTRUCCIÓN SIMULTÁNEA QUE SOLICITEN VENTA GARANTIZADA DE LOTES  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1035	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - HABILITACIONES URBANAS CON CONSTRUCCIÓN SIMULTÁNEA DE VIVIENDAS, EN LAS QUE EL NÚMERO, DIMENSIONES DE LOTES A HABILITAR Y TIPO DE VIVIENDAS A EDIFICAR SE DEFINAN EN EL PROYECTO, SIEMPRE QUE SU FINALIDAD SEA LA VENTA DE VIVIENDAS EDIFICADAS  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1036	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - HABILITACIONES URBANAS QUE NO SE ENCUENTREN CONTEMPLADAS EN LAS MODALIDADES A, B Y D - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1037	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - HABILITACIONES URBANAS DE PREDIOS QUE NO COLINDEN CON ÁREAS URBANAS O COLINDEN CON PREDIOS QUE CUENTEN CON PROYECTOS DE HABILITACIÓN URBANA APROBADOS Y NO EJECUTADOS, Y POR TANTO, SE REQUIERE DE LA FORMULACIÓN DE UN PLANEAMIENTO INTEGRAL - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1038	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - HABILITACIONES URBANAS DE PREDIOS QUE COLINDEN CON ZONAS ARQUEOLÓGICAS, BIENES INMUEBLES INTEGRANTES DEL PATRIMONIO CULTURAL DE LA NACIÓN O CON ÁREAS NATURALES PROTEGIDAS  - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1132	113	LICENCIA DE FUNCIONAMIENTO CORPORATIVA PARA MERCADOS DE ABASTOS, GALERÍAS COMERCIALES Y CENTROS COMERCIALES (Con ITSE previa) - 	8	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1039	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - HABILITACIONES URBANAS CON O SIN CONSTRUCCIÓN SIMULTÁNEA, PARA FINES DE INDUSTRIA, COMERCIO Y USOS ESPECIALES (OU) - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1040	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - HABILITACIONES URBANAS DE PREDIOS QUE NO COLINDEN CON ÁREAS URBANAS O COLINDEN CON PREDIOS QUE CUENTEN CON PROYECTOS DE HABILITACIÓN URBANA APROBADOS Y NO EJECUTADOS, Y POR TANTO, SE REQUIERE DE LA FORMULACIÓN DE UN PLANEAMIENTO INTEGRAL - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1041	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - HABILITACIONES URBANAS DE PREDIOS QUE COLINDEN CON ZONAS ARQUEOLÓGICAS, BIENES INMUEBLES INTEGRANTES DEL PATRIMONIO CULTURAL DE LA NACIÓN O CON ÁREAS NATURALES PROTEGIDAS - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1042	119	LICENCIA DE HABILITACIÓN URBANA - MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - HABILITACIONES URBANAS CON O SIN CONSTRUCCIÓN SIMULTÁNEA, PARA FINES DE INDUSTRIA, COMERCIO Y USOS ESPECIALES (OU) - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1043	119	MODIFICACIONES NO SUSTANCIALES DE PROYECTOS APROBADOS DE HABILITACIÓN URBANA - MODALIDAD A (ANTES DE SU EJECUCIÓN)  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1044	119	MODIFICACIONES NO SUSTANCIALES DE PROYECTOS APROBADOS DE HABILITACIÓN URBANA - MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN POR LA MUNICIPALIDAD (ANTES DE SU EJECUCIÓN) - 	13	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1045	119	MODIFICACIONES NO SUSTANCIALES DE PROYECTOS APROBADOS DE HABILITACIÓN URBANA - MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS (ANTES DE SU EJECUCIÓN)  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1046	119	MODIFICACIONES NO SUSTANCIALES DE PROYECTOS APROBADOS DE HABILITACIÓN URBANA - MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS (ANTES DE SU EJECUCIÓN) - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1047	119	MODIFICACIONES NO SUSTANCIALES DE PROYECTOS APROBADOS DE HABILITACIÓN URBANA - MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA (ANTES DE SU EJECUCIÓN) - 	18	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1048	119	MODIFICACIONES NO SUSTANCIALES DE PROYECTOS APROBADOS DE HABILITACIÓN URBANA - MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA (ANTES DE SU EJECUCIÓN) - 	18	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1049	119	MODIFICACIONES NO SUSTANCIALES DE PROYECTOS APROBADOS DE HABILITACIÓN URBANA - MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS (ANTES DE SU EJECUCIÓN) - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1050	119	RECEPCIÓN DE OBRAS DE HABILITACIÓN URBANA SIN VARIACIONES - MODALIDAD A  - 	10	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1051	119	RECEPCIÓN DE OBRAS DE HABILITACIÓN URBANA SIN VARIACIONES - MODALIDAD B  - 	10	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1052	119	RECEPCIÓN DE OBRAS DE HABILITACIÓN URBANA SIN VARIACIONES - MODALIDAD C - 	10	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1053	119	RECEPCIÓN DE OBRAS DE HABILITACIÓN URBANA SIN VARIACIONES - MODALIDAD D  - 	10	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1054	119	INDEPENDIZACIÓN O PARCELACIÓN DE TERRENOS RÚSTICOS UBICADOS DENTRO DEL ÁREA URBANA O DE EXPANSIÓN URBANA  - 	10	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1055	119	SUBDIVISIÓN DE LOTE URBANO. - 	10	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1056	119	REGULARIZACIÓN DE HABILITACIONES URBANAS EJECUTADAS - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1057	119	REGULARIZACIÓN DE HABILITACIONES URBANAS Y DE EDIFICACIONES EJECUTADAS - 	20	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1058	119	NUMERACIÓN MUNICIPAL  - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1059	119	CONSTANCIA DE POSESIÓN PARA LA FACTIBILIDAD DE SERVICIOS BÁSICOS - 	20	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1060	119	SOLICITUD DE CAMBIO DE ZONIFICACIÒN - 	30	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1061	119	VISACIÓN DE PLANO PARA CASOS DE RECTIFICACIÓN O DELIMITACIÓN DE ÁREAS O LINDEROS - 	20	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1062	119	LICENCIA DE EDIFICACIÓN MODALIDAD A: APROBACIÓN AUTOMÁTICA CON FIRMA DE PROFESIONALES - REMODELACIÓN DE UNA VIVIENDA UNIFAMILIAR, SIN MODIFICACIÒN ESTRUCTURAL, NI CAMBIO DE USO, NI AUMENTO DE ÀREA TECHADA  - 	20	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1063	119	CERTIFICADO DE JURISDICCIÓN - 	20	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1064	119	LICENCIA DE EDIFICACIÓN MODALIDAD A: APROBACIÓN AUTOMÁTICA CON FIRMA DE PROFESIONALES - CONSTRUCCIÓN DE UNA VIVIENDA UNIFAMILIAR DE HASTA 120 M2 CONSTRUIDOS, SIEMPRE QUE CONSTITUYA LA ÚNICA EDIFICACIÓN EN EL LOTE - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1065	119	LICENCIA DE EDIFICACIÓN MODALIDAD A: APROBACIÓN AUTOMÁTICA CON FIRMA DE PROFESIONALES - AMPLIACIÓN DE UNA VIVIENDA UNIFAMILIAR CUYA EDIFICACIÓN ORIGINAL CUENTE CON LICENCIA DE CONSTRUCCIÓN, CONFORMIDAD DE OBRA, O DECLARATORIA DE FÁBRICA Y/O DE EDIFICACIÓN SIN CARGA Y LA SUMATORIA DEL ÁREA TECHADA DE AMBAS NO SUPERE LOS 200 M2 - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1066	119	LICENCIA DE EDIFICACIÓN MODALIDAD A: APROBACIÓN AUTOMÁTICA CON FIRMA DE PROFESIONALES - CONSTRUCCIÓN DE CERCOS DE MÁS DE 20 M. DE LONGITUD, SIEMPRE QUE EL INMUEBLE NO SE ENCUENTRE BAJO EL RÈGIMEN DE UNIDADES INMOBILIARIAS DE PROPIEDAD EXCLUSIVA Y PROPIEDAD COMÙN, DE ACUERDO A LA LEGISLACIÓN DE LA MATERIA  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1067	119	LICENCIA DE EDIFICACIÓN MODALIDAD A: APROBACIÓN AUTOMÁTICA CON FIRMA DE PROFESIONALES - AMPLIACIONES Y REMODELACIONES CONSIDERADAS OBRAS MENORES, SEGÚN LO ESTABLECIDO EN LA NORMA TÉCNICA G.040 "DEFINICIONES" DEL RNE  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1068	119	LICENCIA DE EDIFICACIÓN MODALIDAD A: APROBACIÓN AUTOMÁTICA CON FIRMA DE PROFESIONALES - EDIFICACIONES DE CARÁCTER MILITAR DE LAS FUERZAS ARMADAS Y LAS DE CARÁCTER POLICIAL DE LA POLICÍA NACIONAL DEL PERÚ, ASÍ COMO LOS ESTABLECIMIENTOS DE RECLUSIÓN PENAL - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1069	119	LICENCIA DE EDIFICACIÓN MODALIDAD A: APROBACIÓN AUTOMÁTICA CON FIRMA DE PROFESIONALES - EDIFICACIONES DE ESTABLECIMIENTOS DE SALUD ESTATALES  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1070	119	LICENCIA DE EDIFICACIÓN MODALIDAD A: APROBACIÓN AUTOMÁTICA CON FIRMA DE PROFESIONALES - EDIFICACIONES DE INSTITUCIONES EDUCATIVAS ESTATALES  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1071	119	LICENCIA DE EDIFICACIÓN MODALIDAD A: APROBACIÓN AUTOMÁTICA CON FIRMAS DE PROFESIONALES - EDIFICACIONES NECESARIAS PARA EL DESARROLLO DE PROYECTOS DE INVERSIÓN PÚBLICA, DE ASOCIACIÓN PÚBLICA - PRIVADA O DE CONCESIÓN PRIVADA QUE SE REALICEN, PARA LA PRESTACIÓN DE SERVICIOS PÚBLICOS ESENCIALES O PARA LA EJECUCIÓN DE INFRAESTRUCTURA PÚBLICA - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1133	113	LICENCIA DE FUNCIONAMIENTO PARA CESIONARIOS EN EDIFICACIONES CALIFICADAS CON NIVEL DE RIESGO MEDIO (Con ITSE posterior)  - 	2	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1072	119	LICENCIA DE EDIFICACIÓN MODALIDAD A: APROBACIÓN AUTOMÁTICA CON FIRMAS DE PROFESIONALES - EDIFICACIONES CORRESPONDIENTES A PROGRAMAS PROMOVIDOS POR EL SECTOR VIVIENDA, PARA LA REUBICACIÓN DE BENEFICIARIOS DE ATENCIÓN EXTRAORDINARIA DEL BONO FAMILIAR HABITACIONAL ESTABLECIDOS EN EL NUMERAL 3.2.1 DEL ARTÍCULO 3, DE LA LEY N°27829, LEY QUE CREA EL BONO FAMILIAR HABITACIONAL (BFH)  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1073	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN POR LA MUNICIPALIDAD - EDIFICACIÓNES PARA FINES DE VIVIENDA UNIFAMILIAR, MULTIFAMILIAR, O CONDOMINIOS DE VIVIENDA UNIFAMILIAR Y/O MULTIFAMILIAR NO MAYORES A CINCO (5) PISOS SIEMPRE QUE EL PROYECTO TENGA UN MÁXIMO DE 3000 M2 DE ÁREA TECHADA - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1074	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN POR LA MUNICIPALIDAD - CONSTRUCCIÓN DE CERCOS EN INMUEBLES QUE SE ENCUENTREN BAJO EL RÉGIMEN DE UNIDADES INMOBILIARIAS DE PROPIEDAD EXCLUSIVA Y DE PROPIEDAD COMÚN, DE ACUERDO A LA LEGISLACIÓN DE LA MATERIA - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1075	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN POR LA MUNICIPALIDAD - OBRAS DE AMPLIACIÓN O REMODELACIÓN DE UNA EDIFICACIÓN EXISTENTE PARA FINES DE VIVIENDA CON MODIFICACIÓN ESTRUCTURAL, AUMENTO DE ÁREA TECHADA O CAMBIO DE USO  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1076	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN POR LA MUNICIPALIDAD - PARA DEMOLICIÓN PARCIAL  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1077	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN POR LA MUNICIPALIDAD - OBRAS DE AMPLIACIÓN O REMODELACIÓN DE UNA EDIFICACIÓN EXISTENTE, PARA FINES DE VIVIENDA, CON MODIFICACIÓN ESTRUCTURAL, AUMENTO DE ÁREA TECHADA O CAMBIO DE USO EN FORMA CONJUNTA CON DEMOLICIÓN PARCIAL  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1078	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - EDIFICACIÓNES PARA FINES DE VIVIENDA UNIFAMILIAR, MULTIFAMILIAR, O CONDOMINIOS DE VIVIENDA UNIFAMILIAR Y/O MULTIFAMILIAR NO MAYORES A CINCO (5) PISOS Y QUE NO SUPEREN LOS 3000 M2 DE ÁREA TECHADA - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1079	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - CONSTRUCCIÓN DE CERCOS EN INMUEBLES QUE SE ENCUENTREN BAJO EL RÉGIMEN DE UNIDADES INMOBILIARIAS DE PROPIEDAD EXCLUSIVA Y DE PROPIEDAD COMÚN, DE ACUERDO A LA LEGISLACIÓN DE LA MATERIA  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1080	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - OBRAS DE AMPLIACIÓN O REMODELACIÓN DE UNA EDIFICACIÓN EXISTENTE PARA FINES DE VIVIENDA CON MODIFICACIÓN ESTRUCTURAL, AUMENTO DE AREA TECHADA O CAMBIO DE USO - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1081	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÒN DE PROYECTO CON EVALUACIÒN PREVIA POR LOS REVISORES URBANOS - PARA DEMOLICIÓN PARCIAL  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1082	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - OBRAS DE AMPLIACIÓN O REMODELACIÓN DE UNA EDIFICACIÓN EXISTENTE, PARA FINES DE VIVIENDA CON MODIFICACIÓN ESTRUCTURAL, AUMENTO DE ÁREA TECHADA O CAMBIO DE USO EN FORMA CONJUNTA CON DEMOLICIÓN PARCIAL - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1083	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - DEMOLICIÓN TOTAL DE EDIFICACIONES HASTA CINCO (5) PISOS DE ALTURA Y/O QUE CUENTEN CON SEMISÓTANOS Y SÓTANOS, SIEMPRE QUE NO REQUIERA EL USO DE EXPLOSIVOS - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1084	119	LICENCIA DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - MODIFICACIÓN DE PROYECTO DE EDIFICACIONES QUE CORRESPONDAN A ETAPAS DE UN PROYECTO INTEGRAL APROBADO CON ANTERIORIDAD O CON PLAZO VENCIDO - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1085	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - EDIFICACIONES PARA FINES DE VIVIENDA MULTIFAMILIAR, QUINTA O CONDOMINIOS QUE INCLUYAN VIVIENDA MULTIFAMILIAR DE MÁS DE CINCO (5) PISOS O 3,000 M2 ÁREA TECHADA  - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1086	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - EDIFICACIONES PARA FINES DIFERENTES DE VIVIENDA A EXCEPCIÓN DE LAS PREVISTAS EN LA MODALIDAD D - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1087	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - EDIFICACIONES DE USO MIXTO CON VIVIENDA  - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1088	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - INTERVENCIONES QUE SE DESARROLLEN EN PREDIOS, QUE CONSTITUYAN PARTE INTEGRANTE DEL PATRIMONIO CULTURAL DE LA NACIÓN, DECLARADOS POR EL MINISTERIO DE CULTURA  - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1089	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - EDIFICACIONES PARA LOCALES COMERCIALES, CULTURALES, CENTROS DE DIVERSIÓN Y SALAS DE ESPECTÁCULOS QUE INDIVIDUALMENTE O EN CONJUNTO CUENTEN CON UN MÁXIMO DE 30,000 M2 DE ÁREA TECHADA  - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1090	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - EDIFICACIONES PARA MERCADOS QUE CUENTEN CON UN MÁXIMO DE 15,000 M2 DE ÁREA TECHADA  - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1091	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - LOCALES PARA ESPECTÁCULOS DEPORTIVOS DE HASTA 20,000 OCUPANTES - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1092	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - TODAS LAS DEMÁS EDIFICACIONES QUE NO SE ENCUENTREN CONTEMPLADAS EN LAS MODALIDADES A, B Y D  - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1093	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - EDIFICACIONES PARA FINES DE VIVIENDA MULTIFAMILIAR, QUINTA O CONDOMINIOS QUE INCLUYAN VIVIENDA MULTIFAMILIAR DE MÁS DE CINCO (5) PISOS O 3,000 M2 ÁREA TECHADA - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1094	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - EDIFICACIONES PARA FINES DIFERENTES DE VIVIENDA A EXCEPCIÓN DE LAS PREVISTAS EN LA MODALIDAD D - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1095	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - EDIFICACIONES DE USO MIXTO CON VIVIENDA  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1134	113	LICENCIA DE FUNCIONAMIENTO PARA CESIONARIOS EN EDIFICACIONES CALIFICADAS CON NIVEL DE RIESGO ALTO (Con ITSE previa)  - 	8	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1096	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - INTERVENCIONES QUE SE DESARROLLEN EN PREDIOS, QUE CONSTITUYAN PARTE INTEGRANTE DEL PATRIMONIO CULTURAL DE LA NACIÓN, DECLARADOS POR EL MINISTERIO DE CULTURA  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1097	119	LICENCIA DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - EDIFICACIONES PARA LOCALES COMERCIALES, CULTURALES, CENTROS DE DIVERSIÓN Y SALAS DE ESPECTÁCULOS QUE INDIVIDUALMENTE O EN CONJUNTO CUENTEN CON UN MÁXIMO DE 30,000 M2 DE ÁREA TECHADA - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1098	119	LICENCIA DE EDIFICACIÓN MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - EDIFICACIONES PARA FINES DE INDUSTRIA  - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1099	119	LICENCIA DE EDIFICACIÓN MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - EDIFICACIONES PARA LOCALES COMERCIALES, CULTURALES, CENTROS DE DIVERSIÓN Y SALAS DE ESPECTÁCULOS, QUE INDIVIDUALMENTE O EN CONJUNTO CUENTEN CON MÁS DE 30,000 M2 DE ÁREA TECHADA - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1100	119	LICENCIA DE EDIFICACIÓN MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - EDIFICACIONES PARA FINES EDUCATIVOS, SALUD, HOSPEDAJE, ESTABLECIMIENTOS DE EXPENDIO DE COMBUSTIBLES Y TERMINALES DE TRANSPORTE  - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1101	119	LICENCIA DE EDIFICACIÓN MODALIDAD C Y D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - PROYECTO INTEGRAL DE EDIFICACIÓN  - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1102	119	LICENCIA DE EDIFICACIÓN MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - EDIFICACIONES PARA FINES DE INDUSTRIA - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1103	119	LICENCIA DE EDIFICACIÓN MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - EDIFICACIONES PARA FINES EDUCATIVOS, SALUD, HOSPEDAJE, ESTABLECIMIENTOS DE EXPENDIO DE COMBUSTIBLES Y TERMINALES DE TRANSPORTE - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1104	119	LICENCIA DE EDIFICACIÓN MODALIDAD D: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - REMODELACIÓN Y/O AMPLIACIÓN  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1105	119	MODIFICACIÓN NO SUSTANCIAL DE PROYECTO APROBADO DE EDIFICACIÓN MODALIDAD A: APROBACIÓN AUTOMÁTICA CON FIRMA DE PROFESIONALES - DESPUÉS DE EMITIDA LA LICENCIA DE EDIFICACIÓN (ANTES DE SU EJECUCIÓN) - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1106	119	MODIFICACIÓN NO SUSTANCIAL DE PROYECTO APROBADO DE EDIFICACIÓN MODALIDAD B: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LOS REVISORES URBANOS - DESPUÉS DE EMITIDA LA LICENCIA DE EDIFICACIÓN (ANTES DE SU EJECUCIÓN) - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1107	119	MODIFICACIÓN NO SUSTANCIAL DE PROYECTO APROBADO DE EDIFICACIÓN MODALIDAD C: APROBACIÓN DE PROYECTO CON EVALUACIÓN PREVIA POR LA COMISIÓN TÉCNICA - DESPUÉS DE EMITIDA LA LICENCIA DE EDIFICACIÓN (ANTES DE SU EJECUCIÓN) - 	25	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1108	119	ANTEPROYECTO EN CONSULTA PARA LA MODALIDAD B: EVALUACIÓN POR LOS REVISORES URBANOS  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1109	119	CONFORMIDAD DE OBRA Y DECLARATORIA DE EDIFICACIÓN SIN VARIACIONES PARA LA MODALIDAD A - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1110	119	CONFORMIDAD DE OBRA Y DECLARATORIA DE EDIFICACIÓN SIN VARIACIONES PARA LA MODALIDAD B - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1111	119	CONFORMIDAD DE OBRA Y DECLARATORIA DE EDIFICACIÓN SIN VARIACIONES PARA LA MODALIDAD C - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1112	119	CONFORMIDAD DE OBRA Y DECLARATORIA DE EDIFICACIÓN SIN VARIACIONES PARA LA MODALIDAD D - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1113	119	CONFORMIDAD DE OBRA Y DECLARATORIA DE EDIFICACIÓN CON VARIACIONES PARA LA MODALIDAD A - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1114	119	CONFORMIDAD DE OBRA Y DECLARATORIA DE EDIFICACIÓN CON VARIACIONES PARA LA MODALIDAD B - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1115	119	CONFORMIDAD DE OBRA Y DECLARATORIA DE EDIFICACIÓN CON VARIACIONES PARA LA MODALIDAD C - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1116	119	CONFORMIDAD DE OBRA Y DECLARATORIA DE EDIFICACIÓN CON VARIACIONES PARA LA MODALIDAD D - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1117	119	LICENCIA DE REGULARIZACIÓN DE EDIFICACIONES - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1118	119	REVALIDACIÓN DE LICENCIA DE EDIFICACIÓN Y/O HABILITACIONES URBANAS - 	10	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1119	120	INSPECCIÓN TECNICA DE SEGURIDAD EN EDIFICACIONES POSTERIOR AL INICIO DE ACTIVIDADES PARA ESTABLECIMIENTOS OBJETO DE INSPECCIÓN CLASIFICADOS CON NIVEL DE RIESGO BAJO - 	9	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1120	120	INSPECCIÓN TECNICA DE SEGURIDAD EN EDIFICACIONES POSTERIOR AL INICIO DE ACTIVIDADES PARA ESTABLECIMIENTOS OBJETO DE INSPECCIÓN CLASIFICADOS CON NIVEL DE RIESGO MEDIO - 	9	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1121	120	INSPECCIÓN TECNICA DE SEGURIDAD EN EDIFICACIONES PREVIA AL INICIO DE ACTIVIDADES PARA ESTABLECIMIENTOS OBJETO DE INSPECCIÓN CLASIFICADOS CON NIVEL DE RIESGO ALTO - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1122	120	INSPECCIÓN TECNICA DE SEGURIDAD EN EDIFICACIONES PREVIA AL INICIO DE ACTIVIDADES PARA ESTABLECIMIENTOS OBJETO DE INSPECCIÓN CLASIFICADOS CON NIVEL DE RIESGO MUY ALTO  - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1123	120	RENOVACIÓN DEL CERTIFICADO DE INSPECCIÓN TÉCNICA DE SEGURIDAD EN EDIFICACIONES PARA ESTABLECIMIENTOS OBJETO DE INSPECCIÓN CLASIFICADOS CON NIVEL DE RIESGO BAJO - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1124	120	RENOVACIÓN DEL CERTIFICADO DE INSPECCIÓN TÉCNICA DE SEGURIDAD EN EDIFICACIONES PARA ESTABLECIMIENTOS OBJETO DE INSPECCIÓN CLASIFICADOS CON NIVEL DE RIESGO MEDIO - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1125	120	RENOVACIÓN DEL CERTIFICADO DE INSPECCIÓN TÉCNICA DE SEGURIDAD EN EDIFICACIONES PARA ESTABLECIMIENTOS OBJETO DE INSPECCIÓN CLASIFICADOS CON NIVEL DE RIESGO ALTO - 	9	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1126	120	RENOVACIÓN DEL CERTIFICADO DE INSPECCIÓN TÉCNICA DE SEGURIDAD EN EDIFICACIONES PARA ESTABLECIMIENTOS OBJETO DE INSPECCIÓN CLASIFICADOS CON NIVEL DE RIESGO MUY ALTO  - 	9	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1127	120	EVALUACIÓN DE CONDICIONES DE SEGURIDAD EN ESPECTÁCULOS PÚBLICOS DEPORTIVOS Y NO DEPORTIVOS (ECSE) CON UNA CONCURRENCIA DE HASTA 3,000 PERSONAS - 	6	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1128	113	LICENCIA DE FUNCIONAMIENTO PARA EDIFICACIONES CALIFICADAS CON NIVEL DE RIESGO BAJO (Con ITSE posterior) - 	2	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1129	113	LICENCIA DE FUNCIONAMIENTO PARA EDIFICACIONES CALIFICADAS CON NIVEL DE RIESGO MEDIO (Con ITSE posterior) - 	2	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1130	113	LICENCIA DE FUNCIONAMIENTO PARA EDIFICACIONES CALIFICADAS CON NIVEL DE RIESGO ALTO (Con ITSE previa) - 	8	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1131	113	LICENCIA DE FUNCIONAMIENTO PARA EDIFICACIONES CALIFICADAS CON NIVEL DE RIESGO MUY ALTO (Con ITSE previa) - 	8	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1135	113	LICENCIA DE FUNCIONAMIENTO PARA CESIONARIOS EN EDIFICACIONES CALIFICADAS CON NIVEL DE RIESGO MUY ALTO (Con ITSE previa)  - 	8	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1136	113	LICENCIA DE FUNCIONAMIENTO PARA CAMBIO DE GIRO - 	1	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1137	113	LICENCIA PROVISIONAL DE FUNCIONAMIENTO PARA BODEGAS - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1138	113	TRANSFERENCIA DE LICENCIA DE FUNCIONAMIENTO O CAMBIO DE DENOMINACIÓN O NOMBRE COMERCIAL DE LA PERSONA JURÍDICA  - 	1	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1139	113	CESE DE ACTIVIDADES  - 	1	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1140	113	AUTORIZACIÓN TEMPORAL PARA EL DESARROLLO DE ESPECTÁCULOS PÚBLICOS DEPORTIVOS Y NO DEPORTIVOS (CON UNA CONCURRENCIA DE HASTA 3,000 PERSONAS) - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1141	113	AUTORIZACIÓN PARA EL DESARROLLO DE EVENTOS Y/O ESPECTÁCULOS PÚBLICOS NO DEPORTIVOS REALIZADOS EN LA VÍA PÚBLICA O LUGARES NO CONFINADOS (ABIERTOS AL PÚBLICO) EVENTUALES  - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1142	113	AUTORIZACIÓN PARA LA INSTALACIÓN O UBICACIÓN DE ANUNCIOS Y/O AVISOS - SIMPLES (ADOSADOS A LA FACHADA) Y/O TOLDOS SIN ILUMINACIÓN - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1143	113	AUTORIZACIÓN PARA LA INSTALACIÓN O UBICACIÓN DE ANUNCIOS Y/O AVISOS - LUMINOSOS O ILUMINADOS - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1144	113	AUTORIZACIÓN PARA LA INSTALACIÓN O UBICACIÓN DE ANUNCIOS Y/O AVISOS - PANELES MONUMENTALES  - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1145	113	AUTORIZACIÓN PARA LA INSTALACIÓN O UBICACIÓN DE AVISOS Y/O ELEMENTOS DE PUBLICIDAD EXTERIOR TEMPORAL (AFICHES, CARTELES, BANDEROLAS, GIGANTOGRAFÍAS Y PASACALLES)  - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1146	113	DEVOLUCIÓN Y/O COMPENSACIÓN DE PAGO INDEBIDO O EN EXCESO EN MATERIA TRIBUTARIA - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1147	113	SOLICITUD DE INAFECTACIÓN AL PAGO DEL IMPUESTO PREDIAL DE INSTITUCIONES PÚBLICAS O PRIVADAS DE ACUERDO A LEY - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1148	113	SOLICITUD DE INAFECTACIÓN DE LA 50 UIT DE LA BASE IMPONIBLE DEL IMPUESTO PREDIAL DE PENSIONISTAS PROPIETARIOS Y ADULTO MAYOR - 	45	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1149	113	INSCRIPCIÓN DE PREDIO EN REGISTRO DE PADRÓN DE CONTRIBUYENTES AL IMPUESTO PREDIAL - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1150	113	CAMBIO DE DATOS Y/O NOMBRE DEL TITULAR EN PADRÓN DE CONTRIBUYENTES DEL IMPUESTO PREDIAL POR TRANSFERENCIA  - 	7	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1151	113	DESCARGO DE PREDIO EN REGISTRO DE PADRÓN DE CONTRIBUYENTES AL IMPUESTO PREDIAL POR TRANSFERENCIA DE PROPIEDAD (CAMBIO DE TITULAR) - 	6	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1152	113	SOLICITUD DE MODIFICACIÓN DE DATOS Y/O RECTIFICACIÓN DE DATOS RESPECTO DE LAS DECLARACIONES JURADAS DEL IMPUESTO PREDIAL) - 	6	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1153	113	SOLICITUD DE PRESCRIPCIÓN DE LA DEUDA TRIBUTARIA - 	6	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1154	113	SOLICITUD DE RECURSO DE RECLAMACIÓN SOBRE LOS VALORES TRIBUTARIOS - 	20	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1155	117	INSCRIPCIÓN DE NACIMIENTO ORDINARI0 DENTRO DE LOS 60 DÍAS HÁBILES DESPUÉS DE NACIDO - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1156	117	INSCRIPCIÓN DE NACIMIENTO EXTEMPORÁNEO FUERA DE LOS 60 DÍAS HÁBILES DESPUÉS DE NACIDO - 	4	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1157	117	INSCRIPCIÓN DE NACIMIENTO DE HIJOS DE PERUANOS NACIDOS EN EL EXTRANJERO - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1158	117	MATRIMONIO CIVIL ORDINARIO: EXPEDIENTE MATRIMONIAL (APERTURA DEL PLIEGO) - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1159	117	INSCRIPCIÓN DE MATRIMONIO CELEBRADO EN EL EXTRANJERO - 	10	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1160	117	INSCRIPCIÓN DE DEFUNCIÓN - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1161	117	INSCRIPCIÓN DE ADOPCIÓN ADMINISTRATIVO, NOTARIAL O JUDICIAL - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1162	117	ANOTACIONES MARGINALES O TEXTUALES ADMINISTRATIVA, NOTARIAL O JUDICIAL (EN EL ACTA DE NACIMIENTO, MATRIMONIO O DEFUNCIÓN) - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1163	117	INSCRIPCIÓN DE RECONOCIMIENTO DE LA PATERNIDAD O LA MATERNIDAD NOTARIAL, TESTAMENTO, JUDICIAL O VOLUNTARIO)  - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1164	117	CERTIFICADO DE SOLTERÍA O VIUDEZ  - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1165	117	RECTIFICACIÓN ADMINISTRATIVA DE PARTIDA DE NACIMIENTO, MATRIMONIO Y/O DEFUNCIÓN (Administrativa, Notarial o Judicial) - 	10	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1166	117	REPOSICIÓN DE ACTAS REGISTRALES (NACIMIENTO, MATRIMONIO Y DEFUNCIÓN) - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1167	117	RECONSTITUCIÓN DE ACTAS REGISTRALES - 	30	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1168	117	CANCELACIÓN DE ACTAS REGISTRALES  - 	30	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1169	117	EXPEDICIÓN DE CONSTANCIA NEGATIVA DE INSCRIPCIÓN DE NACIMIENTO, MATRIMONIO O DEFUNCIÓN - 	5	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1170	121	APERTURA DE SERVICIO DE AGUA POTABLE Y ALCANTARILLADO - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1171	121	CAMBIO DE NOMBRE DE USUARIO REGISTRADO - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1172	121	CAMBIO DE TARIFA - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1173	121	CERTIFICADO DE FACTIBILIDAD DEL SERVICIO DE AGUA POTABLE Y ALCANTARILLADO - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1174	121	INDEPENDIZACIÓN DE AGUA POTABLE - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1175	121	REHABILITACIÓN DE SERVICIO DE AGUA POTABLE Y ALCANTARILLADO - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1176	121	SUSPENSIÓN TEMPORAL DEL SERVICIO DE AGUA POTABLE Y ALCANTARILLADO - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1177	112	EXPEDICIÓN DE COPIAS CERTIFICADAS DE RESOLUCIONES, ORDENANZAS, ACUERDOS, EDICTOS Y OTROS DOCUMENTOS EXISTENTES EN EL ARCHIVO MUNICIPAL - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1178	119	CERTIFICADO NEGATIVO DE CATASTRO - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1179	119	VISACIÓN DE PLANOS PARA FINES DE ELECTRIFICACIÓN, AGUA Y/O OTROS TRAMITES - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1180	119	COPIA DE PLANOS  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1181	120	DUPLICADO DEL CERTIFICADO DE INSPECCIÓN TÉCNICA DE SEGURIDAD EN EDIFICACIONES  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1182	113	DUPLICADO DE LICENCIA DE FUNCIONAMIENTO O AUTORIZACIÓN MUNICIPAL - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1183	113	CONSTANCIA DE NO ADEUDO TRIBUTARIO (IMPUESTO PREDIAL Y/O ARBITRIOS) Y DE NO ESTAR INSCRITO EN EL PADRÓN GENERAL DE CONTRIBUYENTES Y OTROS  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1184	117	COPIA CERTIFICADA DE ACTAS, PARTIDAS Y/O EXPEDIENTES (NACIMIENTOS, MATRIMONIO, DEFUNCIÓN Y OTROS) - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1185	117	REPROGRAMACIÓN DE FECHA Y HORA DE MATRIMONIO (PEDIDO EFECTUADO CON 3 DÍAS HÁBILES DE ANTICIPACIÓN)  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
1186	117	CONSTANCIA DE MATRIMONIO  - 	15	0	2024-10-15 02:05:34.676051	\N	\N	2024-10-15 02:05:34.676051	\N	\N
\.


--
-- Data for Name: proceso_tramite; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.proceso_tramite ("procesoTramiteId", "expedienteId", "origenId", "destinoId", etapa, orden, "referenciaId", "fRegistro", "fRecibido", "fAtencion", observaciones, motivo, leido, "fLeido", "estadoId", tramites, "tipoEnvioId", "documentoId", documento, folios, asunto, importancia, "usuarioCreaId", "usuarioRecibeId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
1	25	112	24		1	\N	2024-10-22 17:32:25.109	\N	\N			f	\N	504		1	\N			ssssssssssssssssssssssssssssssss	1	1	\N	0	2024-10-22 22:32:25.147849	\N	\N	2024-10-22 22:32:25.147849	\N	\N
3	26	112	24		1	\N	2024-10-22 17:45:22.049	\N	\N			f	\N	504		1	\N			5555555555555555555	1	1	\N	0	2024-10-22 22:45:22.120556	\N	\N	2024-10-22 22:45:22.120556	\N	\N
4	42	112	113		1	\N	2024-10-23 19:19:56.506	\N	\N			f	\N	504		1	\N			YYYYYYYYYYYYYYYYYY	1	1	\N	0	2024-10-24 00:19:56.516376	\N	\N	2024-10-24 00:19:56.516376	\N	\N
\.


--
-- Data for Name: requisito; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.requisito ("requisitoId", "expedienteId", "rubroId", cantidad, referencial, porcentaje, total, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: rubro; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.rubro ("rubroId", "procedimientoId", "partidaId", descripcion, tipo, monto, obligatorio, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: sede; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.sede ("sedeId", nombre, direccion, abreviacion, "ubigeoId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
2	Sede Principal	-	PRINC	1196	0	2024-10-02 12:47:54.422989	\N	\N	2024-10-02 12:47:54.422989	\N	\N
4	NUEVA SEDE	DIRECCIÓN\n	NUEVA	1193	0	2024-10-02 12:47:54.422989	\N	\N	2024-10-02 12:47:54.422989	\N	\N
5	CLINICA MUNICIPAL	AV. PRINCIPAL	CLIC	1193	0	2024-10-02 12:47:54.422989	\N	\N	2024-10-02 12:47:54.422989	\N	\N
\.


--
-- Data for Name: solicitud_mpv; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.solicitud_mpv (id, token, fecha, codigo, valido, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: unidad_organica; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.unidad_organica ("unidadOrganicaId", abreviatura, nombre, nivel, "sedeId", tupa, "relacionId", estado, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "ordenId") FROM stdin;
111	AL	ALCALDIA(DESPACHO)	1	2	t	\N	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	\N
24	GM	GERENCIA MUNICIPAL	2	2	t	111	t	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	\N
112	SG	OFICINA DE SECRETARIA GENERAL	3	2	t	24	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	\N
113	GAT	GERENCIA DE ADMINISTRACION TRIBUTARIA	3	2	t	24	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	\N
114	GDE	 GERENCIA DE DESARROLLO SOCIAL Y ECONOMICO	3	2	t	24	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	\N
115	GDU	GERENCIA DE DESARROLLO URBANO	3	2	t	24	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	\N
116	GSP	GERENCIA DE SERVICIOS PUBLICOS	3	2	t	24	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	\N
117	DRC	DIRECCION DE REGISTRO CIVIL	4	2	t	114	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
118	DOP	> DIRECCION DE OBRAS PUBLICAS Y LIQUIDACIONES	4	2	t	115	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
119	DOPC	DIRECCION DE OBRAS PRIVADA Y CATASTRO	4	2	t	115	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
120	DDC	DIRECCION DE DEFENSA CIVIL	4	2	t	115	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
121	DSS	DIRECCION DE SERVICIOS DE SANEAMIENTO	4	2	t	116	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
122	OAJ	OFICINA DE ASESORIA JURIDICA	3	2	t	24	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	\N
123	DTD	> UNIDAD DE TRAMITE DOCUMENTARIO	4	2	f	112	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
124	DPS	DIRECCION DE PROGRAMAS SOCIALES	4	2	t	114	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
125	UII	UNIDAD DE IMAGEN INSTITUCIONAL	4	2	f	112	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
126	OA	OFICINA DE ADMINISTRACION	3	2	t	24	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	\N
127	UL	UNIDAD DE LOGISTICA	4	2	f	126	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
128	UC	UNIDAD DE CONTABILIDAD	4	2	f	126	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
129	UT	UNIDAD DE TESORERIA	4	2	f	126	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
130	UA	> UNIDAD DE ALMACEN	4	2	f	126	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
131	UA	> UNIDAD DE ALMACEN	4	2	f	126	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
1111	RR.HH.	UNIDAD DE RECURSOS HUMANOS	4	2	f	126	f	0	2024-10-07 23:38:03.585749	\N	\N	2024-10-07 23:38:03.585749	\N	\N	24
\.


--
-- Name: cargo_cargoId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."cargo_cargoId_seq"', 6, true);


--
-- Name: configuracion_configuracionId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."configuracion_configuracionId_seq"', 1, false);


--
-- Name: dias_diaId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."dias_diaId_seq"', 1, false);


--
-- Name: divisa_divisaId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."divisa_divisaId_seq"', 1, false);


--
-- Name: empresa_empresaId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."empresa_empresaId_seq"', 1, true);


--
-- Name: estado_estadoId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."estado_estadoId_seq"', 1, false);


--
-- Name: parametro_parametroId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."parametro_parametroId_seq"', 1, false);


--
-- Name: prioridad_prioridadId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."prioridad_prioridadId_seq"', 2, true);


--
-- Name: proceso_procesoId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."proceso_procesoId_seq"', 1, false);


--
-- Name: tipo_documento_tipoDocumentoId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."tipo_documento_tipoDocumentoId_seq"', 5, true);


--
-- Name: tipo_expediente_tipoExpedienteId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."tipo_expediente_tipoExpedienteId_seq"', 1, false);


--
-- Name: tipo_persona_tipoPersonaId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."tipo_persona_tipoPersonaId_seq"', 2, true);


--
-- Name: tipo_tramite_tipoTramiteId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."tipo_tramite_tipoTramiteId_seq"', 10, true);


--
-- Name: token_tokenId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."token_tokenId_seq"', 1, false);


--
-- Name: ubigeo_ubigeoId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."ubigeo_ubigeoId_seq"', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 20, true);


--
-- Name: accion_accionId_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('sistema."accion_accionId_seq"', 1, false);


--
-- Name: config_email_configEmailId_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('sistema."config_email_configEmailId_seq"', 1, false);


--
-- Name: menu_menuId_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('sistema."menu_menuId_seq"', 1, false);


--
-- Name: rol_rolId_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('sistema."rol_rolId_seq"', 1, false);


--
-- Name: usuario_usuarioId_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('sistema."usuario_usuarioId_seq"', 1, true);


--
-- Name: archivo_adjunto_archivoAdjuntoId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."archivo_adjunto_archivoAdjuntoId_seq"', 14, true);


--
-- Name: archivo_adjunto_mpv_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.archivo_adjunto_mpv_id_seq', 1, false);


--
-- Name: calendario_calendarioId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."calendario_calendarioId_seq"', 160, true);


--
-- Name: correlativo_correlativoId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."correlativo_correlativoId_seq"', 2, true);


--
-- Name: correlativo_unidad_correlativoUnidadId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."correlativo_unidad_correlativoUnidadId_seq"', 1, false);


--
-- Name: documento_interno_documentoInternoId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."documento_interno_documentoInternoId_seq"', 1, false);


--
-- Name: encargado_uo_encargadoUOId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."encargado_uo_encargadoUOId_seq"', 6, true);


--
-- Name: expediente_expedienteId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."expediente_expedienteId_seq"', 45, true);


--
-- Name: expediente_mpv_expedienteMPVId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."expediente_mpv_expedienteMPVId_seq"', 1, false);


--
-- Name: expediente_vinculado_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.expediente_vinculado_id_seq', 1, false);


--
-- Name: partida_presupuestal_partidaId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."partida_presupuestal_partidaId_seq"', 1, false);


--
-- Name: personas_personaId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."personas_personaId_seq"', 5, true);


--
-- Name: procedimiento_procedimientoId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."procedimiento_procedimientoId_seq"', 1, false);


--
-- Name: proceso_tramite_procesoTramiteId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."proceso_tramite_procesoTramiteId_seq"', 4, true);


--
-- Name: requisito_requisitoId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."requisito_requisitoId_seq"', 1, false);


--
-- Name: rubro_rubroId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."rubro_rubroId_seq"', 1, false);


--
-- Name: sede_sedeId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."sede_sedeId_seq"', 1, false);


--
-- Name: solicitud_mpv_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.solicitud_mpv_id_seq', 1, false);


--
-- Name: unidad_organica_unidadOrganicaId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."unidad_organica_unidadOrganicaId_seq"', 1, false);


--
-- Name: tipo_documento PK_13a1aa5b635c7ab49a65e9c8191; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_documento
    ADD CONSTRAINT "PK_13a1aa5b635c7ab49a65e9c8191" PRIMARY KEY ("tipoDocumentoId");


--
-- Name: empresa PK_2be886fa4f1ef24329186957e6b; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.empresa
    ADD CONSTRAINT "PK_2be886fa4f1ef24329186957e6b" PRIMARY KEY ("empresaId");


--
-- Name: cargo PK_395ef3cbeb5609d502d0c5c960a; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.cargo
    ADD CONSTRAINT "PK_395ef3cbeb5609d502d0c5c960a" PRIMARY KEY ("cargoId");


--
-- Name: configuracion PK_3e9e55a74c566ac6430feb307f8; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.configuracion
    ADD CONSTRAINT "PK_3e9e55a74c566ac6430feb307f8" PRIMARY KEY ("configuracionId");


--
-- Name: parametro PK_5eaf409d178e3ee5064b1d64284; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.parametro
    ADD CONSTRAINT "PK_5eaf409d178e3ee5064b1d64284" PRIMARY KEY ("parametroId");


--
-- Name: tipo_tramite PK_751d6b271c0f4270d49c572e07a; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_tramite
    ADD CONSTRAINT "PK_751d6b271c0f4270d49c572e07a" PRIMARY KEY ("tipoTramiteId");


--
-- Name: tipo_persona PK_87068d7c3e47727cc24566d131a; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_persona
    ADD CONSTRAINT "PK_87068d7c3e47727cc24566d131a" PRIMARY KEY ("tipoPersonaId");


--
-- Name: proceso PK_8a370b3aa6c5e89c604e44dcb6d; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.proceso
    ADD CONSTRAINT "PK_8a370b3aa6c5e89c604e44dcb6d" PRIMARY KEY ("procesoId");


--
-- Name: dias PK_92216d54e32bd079dbf31dd9602; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.dias
    ADD CONSTRAINT "PK_92216d54e32bd079dbf31dd9602" PRIMARY KEY ("diaId");


--
-- Name: ubigeo PK_a6f9160c215e6ec0964be7b919c; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.ubigeo
    ADD CONSTRAINT "PK_a6f9160c215e6ec0964be7b919c" PRIMARY KEY ("ubigeoId");


--
-- Name: token PK_bb402e674ae9363a98e291ac2b7; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.token
    ADD CONSTRAINT "PK_bb402e674ae9363a98e291ac2b7" PRIMARY KEY ("tokenId");


--
-- Name: prioridad PK_dcb1bfc7c713ce209235b82a10d; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.prioridad
    ADD CONSTRAINT "PK_dcb1bfc7c713ce209235b82a10d" PRIMARY KEY ("prioridadId");


--
-- Name: tipo_expediente PK_e0994ea21d47cc4f8e5e3585985; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_expediente
    ADD CONSTRAINT "PK_e0994ea21d47cc4f8e5e3585985" PRIMARY KEY ("tipoExpedienteId");


--
-- Name: estado PK_e48fef7fd07fb6eda14e0de8423; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.estado
    ADD CONSTRAINT "PK_e48fef7fd07fb6eda14e0de8423" PRIMARY KEY ("estadoId");


--
-- Name: divisa PK_f7ebcb4b3923581be5253ffe043; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.divisa
    ADD CONSTRAINT "PK_f7ebcb4b3923581be5253ffe043" PRIMARY KEY ("divisaId");


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: usuarios_u_organicas PK_0aee4281857cb2fb485a988f9c3; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.usuarios_u_organicas
    ADD CONSTRAINT "PK_0aee4281857cb2fb485a988f9c3" PRIMARY KEY ("usuarioId", "unidadOrganicaId", "select");


--
-- Name: usuario PK_3c54fa6dc8ea47587ea5b09aab5; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.usuario
    ADD CONSTRAINT "PK_3c54fa6dc8ea47587ea5b09aab5" PRIMARY KEY ("usuarioId");


--
-- Name: accion PK_3e3e9fd937d817fb206b79d85e2; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.accion
    ADD CONSTRAINT "PK_3e3e9fd937d817fb206b79d85e2" PRIMARY KEY ("accionId");


--
-- Name: permiso_usuario PK_59c1c074f263bd3244985d7fe77; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.permiso_usuario
    ADD CONSTRAINT "PK_59c1c074f263bd3244985d7fe77" PRIMARY KEY ("usuarioId", "menuId", "accionId");


--
-- Name: menu PK_8c3f94b41b7d5645aa48cdf3f84; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.menu
    ADD CONSTRAINT "PK_8c3f94b41b7d5645aa48cdf3f84" PRIMARY KEY ("menuId");


--
-- Name: config_email PK_97cfcefae884a675012c613bf42; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.config_email
    ADD CONSTRAINT "PK_97cfcefae884a675012c613bf42" PRIMARY KEY ("configEmailId");


--
-- Name: permiso_rol PK_a109b10908f1f5cdb339be1880d; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.permiso_rol
    ADD CONSTRAINT "PK_a109b10908f1f5cdb339be1880d" PRIMARY KEY ("rolId", "menuId", "accionId");


--
-- Name: permisos_menu PK_c033933b8d7edcc5386ae4a95a6; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.permisos_menu
    ADD CONSTRAINT "PK_c033933b8d7edcc5386ae4a95a6" PRIMARY KEY ("menuId", "usuarioId");


--
-- Name: menu_accion PK_f137c042bfcf25231c5255d5535; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.menu_accion
    ADD CONSTRAINT "PK_f137c042bfcf25231c5255d5535" PRIMARY KEY ("menuId", "accionId");


--
-- Name: rol PK_facc3d8a3785a82fbae5b77ed01; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.rol
    ADD CONSTRAINT "PK_facc3d8a3785a82fbae5b77ed01" PRIMARY KEY ("rolId");


--
-- Name: unidad_organica PK_0d3df3f35028d8653c39d0a5dd1; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.unidad_organica
    ADD CONSTRAINT "PK_0d3df3f35028d8653c39d0a5dd1" PRIMARY KEY ("unidadOrganicaId");


--
-- Name: documento_interno PK_1bd4bde768976fdb7dcfd19f03c; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.documento_interno
    ADD CONSTRAINT "PK_1bd4bde768976fdb7dcfd19f03c" PRIMARY KEY ("documentoInternoId");


--
-- Name: procedimiento PK_1e626d8696103049d0bd538fd1a; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.procedimiento
    ADD CONSTRAINT "PK_1e626d8696103049d0bd538fd1a" PRIMARY KEY ("procedimientoId");


--
-- Name: expediente PK_204940a4745a0287a109913365a; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente
    ADD CONSTRAINT "PK_204940a4745a0287a109913365a" PRIMARY KEY ("expedienteId");


--
-- Name: sede PK_3c324ca6751ed090225a933b8f4; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.sede
    ADD CONSTRAINT "PK_3c324ca6751ed090225a933b8f4" PRIMARY KEY ("sedeId");


--
-- Name: proceso_tramite PK_4265da467744c3227c34f931a24; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite
    ADD CONSTRAINT "PK_4265da467744c3227c34f931a24" PRIMARY KEY ("procesoTramiteId");


--
-- Name: personas PK_470c85d09b2137727bd7f51c952; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.personas
    ADD CONSTRAINT "PK_470c85d09b2137727bd7f51c952" PRIMARY KEY ("personaId");


--
-- Name: correlativo PK_4a37027cfba8d3f2055b955ab1b; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo
    ADD CONSTRAINT "PK_4a37027cfba8d3f2055b955ab1b" PRIMARY KEY ("correlativoId");


--
-- Name: partida_presupuestal PK_5a24de7a6cfabba51a27ab20803; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.partida_presupuestal
    ADD CONSTRAINT "PK_5a24de7a6cfabba51a27ab20803" PRIMARY KEY ("partidaId");


--
-- Name: encargado_uo PK_5d08fdd204074fe12ca5132ecc9; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.encargado_uo
    ADD CONSTRAINT "PK_5d08fdd204074fe12ca5132ecc9" PRIMARY KEY ("encargadoUOId");


--
-- Name: solicitud_mpv PK_605cdf40b66db9fd320f407672d; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.solicitud_mpv
    ADD CONSTRAINT "PK_605cdf40b66db9fd320f407672d" PRIMARY KEY (id);


--
-- Name: expediente_mpv PK_65391483548aeef869fe88d64d7; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente_mpv
    ADD CONSTRAINT "PK_65391483548aeef869fe88d64d7" PRIMARY KEY ("expedienteMPVId");


--
-- Name: rubro PK_68ab6fb726805432d86697bee63; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.rubro
    ADD CONSTRAINT "PK_68ab6fb726805432d86697bee63" PRIMARY KEY ("rubroId");


--
-- Name: archivo_adjunto PK_79e534f2eaf42b68db50cb4706e; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.archivo_adjunto
    ADD CONSTRAINT "PK_79e534f2eaf42b68db50cb4706e" PRIMARY KEY ("archivoAdjuntoId");


--
-- Name: archivo_adjunto_mpv PK_8ae21471b43257a6999bec2da1f; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.archivo_adjunto_mpv
    ADD CONSTRAINT "PK_8ae21471b43257a6999bec2da1f" PRIMARY KEY (id);


--
-- Name: calendario PK_dac4d50f68f59bab090f7684525; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.calendario
    ADD CONSTRAINT "PK_dac4d50f68f59bab090f7684525" PRIMARY KEY ("calendarioId");


--
-- Name: expediente_vinculado PK_ed24b3a3431bb8df0370e209f21; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente_vinculado
    ADD CONSTRAINT "PK_ed24b3a3431bb8df0370e209f21" PRIMARY KEY (id);


--
-- Name: correlativo_unidad PK_f00f50fe1a08c629232bbbb5a58; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo_unidad
    ADD CONSTRAINT "PK_f00f50fe1a08c629232bbbb5a58" PRIMARY KEY ("correlativoUnidadId");


--
-- Name: requisito PK_f752b86a3fc1e1f23cf2c3943c6; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.requisito
    ADD CONSTRAINT "PK_f752b86a3fc1e1f23cf2c3943c6" PRIMARY KEY ("requisitoId");


--
-- Name: correlativo REL_2b03c592381cb7839bc74a7d37; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo
    ADD CONSTRAINT "REL_2b03c592381cb7839bc74a7d37" UNIQUE ("tipoExpedienteId");


--
-- Name: permiso_usuario FK_327f6d5969af6c9f370f265319a; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.permiso_usuario
    ADD CONSTRAINT "FK_327f6d5969af6c9f370f265319a" FOREIGN KEY ("accionId") REFERENCES sistema.accion("accionId");


--
-- Name: menu_accion FK_3b39f666e8ee4326527930151e8; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.menu_accion
    ADD CONSTRAINT "FK_3b39f666e8ee4326527930151e8" FOREIGN KEY ("menuId") REFERENCES sistema.menu("menuId") ON DELETE CASCADE;


--
-- Name: usuarios_u_organicas FK_548fc449f3bab7168a2025be94d; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.usuarios_u_organicas
    ADD CONSTRAINT "FK_548fc449f3bab7168a2025be94d" FOREIGN KEY ("unidadOrganicaId") REFERENCES tramite.unidad_organica("unidadOrganicaId");


--
-- Name: usuario FK_611daf5befc024d9e0bd7bdf4da; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.usuario
    ADD CONSTRAINT "FK_611daf5befc024d9e0bd7bdf4da" FOREIGN KEY ("rolId") REFERENCES sistema.rol("rolId");


--
-- Name: permiso_rol FK_6d386d73d7d1c1c3ec32963fbeb; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.permiso_rol
    ADD CONSTRAINT "FK_6d386d73d7d1c1c3ec32963fbeb" FOREIGN KEY ("accionId") REFERENCES sistema.accion("accionId");


--
-- Name: permiso_usuario FK_a57742a9c87b372c3a3ba35702f; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.permiso_usuario
    ADD CONSTRAINT "FK_a57742a9c87b372c3a3ba35702f" FOREIGN KEY ("menuId") REFERENCES sistema.menu("menuId");


--
-- Name: usuario FK_aa5c122ee9bc3ce4daf6af75dde; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.usuario
    ADD CONSTRAINT "FK_aa5c122ee9bc3ce4daf6af75dde" FOREIGN KEY ("personaId") REFERENCES tramite.personas("personaId");


--
-- Name: permiso_rol FK_e51d22d8e6a42cca78a497101a0; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.permiso_rol
    ADD CONSTRAINT "FK_e51d22d8e6a42cca78a497101a0" FOREIGN KEY ("menuId") REFERENCES sistema.menu("menuId");


--
-- Name: menu_accion FK_e85fe72b0c7d0935e669aaa96e2; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.menu_accion
    ADD CONSTRAINT "FK_e85fe72b0c7d0935e669aaa96e2" FOREIGN KEY ("accionId") REFERENCES sistema.accion("accionId") ON DELETE CASCADE;


--
-- Name: usuarios_u_organicas FK_f5377fbc24d601cee3c694dca76; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.usuarios_u_organicas
    ADD CONSTRAINT "FK_f5377fbc24d601cee3c694dca76" FOREIGN KEY ("usuarioId") REFERENCES sistema.usuario("usuarioId");


--
-- Name: permiso_usuario FK_f6018a859855dd0c83458cdcd65; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.permiso_usuario
    ADD CONSTRAINT "FK_f6018a859855dd0c83458cdcd65" FOREIGN KEY ("usuarioId") REFERENCES sistema.usuario("usuarioId");


--
-- Name: permiso_rol FK_f7b0f5e44a27ac2ee16a1a87bf7; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.permiso_rol
    ADD CONSTRAINT "FK_f7b0f5e44a27ac2ee16a1a87bf7" FOREIGN KEY ("rolId") REFERENCES sistema.rol("rolId");


--
-- Name: proceso_tramite FK_00104125a04b30c958f4330e982; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite
    ADD CONSTRAINT "FK_00104125a04b30c958f4330e982" FOREIGN KEY ("destinoId") REFERENCES tramite.unidad_organica("unidadOrganicaId");


--
-- Name: proceso_tramite FK_015574ad1f5bc1d9bff50154265; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite
    ADD CONSTRAINT "FK_015574ad1f5bc1d9bff50154265" FOREIGN KEY ("usuarioRecibeId") REFERENCES sistema.usuario("usuarioId");


--
-- Name: unidad_organica FK_121c60d25528ebe38a511c13b79; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.unidad_organica
    ADD CONSTRAINT "FK_121c60d25528ebe38a511c13b79" FOREIGN KEY ("ordenId") REFERENCES tramite.unidad_organica("unidadOrganicaId");


--
-- Name: sede FK_191cf83351aaa0fbdb50981c207; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.sede
    ADD CONSTRAINT "FK_191cf83351aaa0fbdb50981c207" FOREIGN KEY ("ubigeoId") REFERENCES empresa.ubigeo("ubigeoId");


--
-- Name: rubro FK_21045856ac8bdf45962f91e0ee0; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.rubro
    ADD CONSTRAINT "FK_21045856ac8bdf45962f91e0ee0" FOREIGN KEY ("partidaId") REFERENCES tramite.partida_presupuestal("partidaId");


--
-- Name: personas FK_226c990e981ebfcdd0331ea7d40; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.personas
    ADD CONSTRAINT "FK_226c990e981ebfcdd0331ea7d40" FOREIGN KEY ("tipoPersonaId") REFERENCES empresa.tipo_persona("tipoPersonaId");


--
-- Name: correlativo FK_2b03c592381cb7839bc74a7d379; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo
    ADD CONSTRAINT "FK_2b03c592381cb7839bc74a7d379" FOREIGN KEY ("tipoExpedienteId") REFERENCES empresa.tipo_expediente("tipoExpedienteId");


--
-- Name: proceso_tramite FK_2cd5b3f96bdaae0c7bcd7bccf76; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite
    ADD CONSTRAINT "FK_2cd5b3f96bdaae0c7bcd7bccf76" FOREIGN KEY ("expedienteId") REFERENCES tramite.expediente("expedienteId");


--
-- Name: unidad_organica FK_3121580a6d8efc9a0fcf7fae7ad; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.unidad_organica
    ADD CONSTRAINT "FK_3121580a6d8efc9a0fcf7fae7ad" FOREIGN KEY ("sedeId") REFERENCES tramite.sede("sedeId");


--
-- Name: proceso_tramite FK_317a50f012ddb8b15b08dbcc8bc; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite
    ADD CONSTRAINT "FK_317a50f012ddb8b15b08dbcc8bc" FOREIGN KEY ("origenId") REFERENCES tramite.unidad_organica("unidadOrganicaId");


--
-- Name: expediente FK_3272e15de101017f16e539eb662; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente
    ADD CONSTRAINT "FK_3272e15de101017f16e539eb662" FOREIGN KEY ("sedeId") REFERENCES tramite.sede("sedeId");


--
-- Name: correlativo_unidad FK_423125e9096ae6917eeea015d7e; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo_unidad
    ADD CONSTRAINT "FK_423125e9096ae6917eeea015d7e" FOREIGN KEY ("tipoDocumentoId") REFERENCES empresa.tipo_documento("tipoDocumentoId");


--
-- Name: unidad_organica FK_4e90bd50a75597712f1ea8ed027; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.unidad_organica
    ADD CONSTRAINT "FK_4e90bd50a75597712f1ea8ed027" FOREIGN KEY ("relacionId") REFERENCES tramite.unidad_organica("unidadOrganicaId");


--
-- Name: proceso_tramite FK_558371f6ace4315ea09cacc97c1; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite
    ADD CONSTRAINT "FK_558371f6ace4315ea09cacc97c1" FOREIGN KEY ("usuarioCreaId") REFERENCES sistema.usuario("usuarioId");


--
-- Name: expediente FK_57926b13adbd6134ff3840d4e5a; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente
    ADD CONSTRAINT "FK_57926b13adbd6134ff3840d4e5a" FOREIGN KEY ("prioridadId") REFERENCES empresa.prioridad("prioridadId");


--
-- Name: correlativo FK_699302d51d0ce1358471af1e481; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo
    ADD CONSTRAINT "FK_699302d51d0ce1358471af1e481" FOREIGN KEY ("sedeId") REFERENCES tramite.sede("sedeId");


--
-- Name: expediente FK_69ab853f59c0831ce874d01169e; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente
    ADD CONSTRAINT "FK_69ab853f59c0831ce874d01169e" FOREIGN KEY ("origenId") REFERENCES tramite.unidad_organica("unidadOrganicaId");


--
-- Name: encargado_uo FK_6baba8c778776e2372bf9a4b923; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.encargado_uo
    ADD CONSTRAINT "FK_6baba8c778776e2372bf9a4b923" FOREIGN KEY ("unidadOrganicaId") REFERENCES tramite.unidad_organica("unidadOrganicaId");


--
-- Name: encargado_uo FK_70b851cc17ca171cf7b94867c0b; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.encargado_uo
    ADD CONSTRAINT "FK_70b851cc17ca171cf7b94867c0b" FOREIGN KEY ("cargoId") REFERENCES empresa.cargo("cargoId");


--
-- Name: encargado_uo FK_9506f2131c5fccb775df78ae4ab; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.encargado_uo
    ADD CONSTRAINT "FK_9506f2131c5fccb775df78ae4ab" FOREIGN KEY ("personaId") REFERENCES tramite.personas("personaId");


--
-- Name: expediente FK_97525bff5d3feb4cd8f85765fd2; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente
    ADD CONSTRAINT "FK_97525bff5d3feb4cd8f85765fd2" FOREIGN KEY ("empresaId") REFERENCES empresa.empresa("empresaId");


--
-- Name: rubro FK_983ae5abc6533d57be75184c1b0; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.rubro
    ADD CONSTRAINT "FK_983ae5abc6533d57be75184c1b0" FOREIGN KEY ("procedimientoId") REFERENCES tramite.procedimiento("procedimientoId");


--
-- Name: expediente FK_9f26f96be1c2966f326b29acce7; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente
    ADD CONSTRAINT "FK_9f26f96be1c2966f326b29acce7" FOREIGN KEY ("estadoId") REFERENCES empresa.estado("estadoId");


--
-- Name: proceso_tramite FK_a70d3482f44bf85f4ebd5765a9b; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite
    ADD CONSTRAINT "FK_a70d3482f44bf85f4ebd5765a9b" FOREIGN KEY ("referenciaId") REFERENCES tramite.proceso_tramite("procesoTramiteId");


--
-- Name: expediente FK_ac194adeb6052f1cd60a4b18571; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente
    ADD CONSTRAINT "FK_ac194adeb6052f1cd60a4b18571" FOREIGN KEY ("remitenteId") REFERENCES tramite.personas("personaId");


--
-- Name: expediente FK_aef42ef912565d33fbea4435c3a; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente
    ADD CONSTRAINT "FK_aef42ef912565d33fbea4435c3a" FOREIGN KEY ("tipoDocumentoId") REFERENCES empresa.tipo_documento("tipoDocumentoId");


--
-- Name: proceso_tramite FK_b6d63d0552e1501fa4ffc211e5e; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite
    ADD CONSTRAINT "FK_b6d63d0552e1501fa4ffc211e5e" FOREIGN KEY ("estadoId") REFERENCES empresa.estado("estadoId");


--
-- Name: procedimiento FK_b9499d4f444e90c32cec6c8126d; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.procedimiento
    ADD CONSTRAINT "FK_b9499d4f444e90c32cec6c8126d" FOREIGN KEY ("unidadOrganicaId") REFERENCES tramite.unidad_organica("unidadOrganicaId");


--
-- Name: correlativo_unidad FK_ba26c0d81e8f04f612e08bc6c4d; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo_unidad
    ADD CONSTRAINT "FK_ba26c0d81e8f04f612e08bc6c4d" FOREIGN KEY ("unidadOrganicaId") REFERENCES tramite.unidad_organica("unidadOrganicaId");


--
-- Name: archivo_adjunto FK_bb591259d7364e74b86b49cb401; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.archivo_adjunto
    ADD CONSTRAINT "FK_bb591259d7364e74b86b49cb401" FOREIGN KEY ("expedienteId") REFERENCES tramite.expediente("expedienteId");


--
-- Name: encargado_uo FK_c93ef6bf1f9eee5cc072d9f60c9; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.encargado_uo
    ADD CONSTRAINT "FK_c93ef6bf1f9eee5cc072d9f60c9" FOREIGN KEY ("tipoDocumentoId") REFERENCES empresa.tipo_documento("tipoDocumentoId");


--
-- Name: proceso_tramite FK_ce22e0a4a498b53e8cf053ff59f; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite
    ADD CONSTRAINT "FK_ce22e0a4a498b53e8cf053ff59f" FOREIGN KEY ("documentoId") REFERENCES empresa.tipo_documento("tipoDocumentoId");


--
-- Name: requisito FK_d8266e35ef77af19af516422048; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.requisito
    ADD CONSTRAINT "FK_d8266e35ef77af19af516422048" FOREIGN KEY ("rubroId") REFERENCES tramite.rubro("rubroId");


--
-- Name: archivo_adjunto FK_de30851d49f50b9bf7bb504b83d; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.archivo_adjunto
    ADD CONSTRAINT "FK_de30851d49f50b9bf7bb504b83d" FOREIGN KEY ("origenId") REFERENCES tramite.unidad_organica("unidadOrganicaId");


--
-- Name: personas FK_f6e02a9b6af249fd75d33131e58; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.personas
    ADD CONSTRAINT "FK_f6e02a9b6af249fd75d33131e58" FOREIGN KEY ("tipoDocumentoId") REFERENCES empresa.tipo_documento("tipoDocumentoId");


--
-- PostgreSQL database dump complete
--

