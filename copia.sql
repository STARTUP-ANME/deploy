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
    nombre character varying(255) NOT NULL,
    abrev character varying(50),
    ruc character varying(11),
    direccion character varying(255),
    imagen bytea,
    fut boolean DEFAULT false NOT NULL,
    "plazoAdmin" integer,
    "plazoLegal" integer,
    email character varying(255),
    contrasena character varying(255),
    servidor character varying(255),
    puerto integer,
    ssl boolean DEFAULT false NOT NULL,
    "plantillaProveido" character varying(255),
    cargo character varying(255),
    "cargoInterno" character varying(255),
    licencia character varying(255),
    validar boolean DEFAULT false NOT NULL,
    "rutaMunicipalidad" character varying(255),
    manual boolean DEFAULT false NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "empresaId" integer NOT NULL,
    "ubigeoId" integer,
    "mesaParteId" integer,
    "horaInicio" time without time zone,
    "horaFin" time without time zone,
    "porVencer" integer DEFAULT 0 NOT NULL
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
    color character varying(30) NOT NULL,
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
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    codigo character varying(200) NOT NULL,
    grupo character varying(200) NOT NULL,
    descripcion character varying(200) NOT NULL,
    valor character varying(200) NOT NULL,
    "valorII" character varying(200) NOT NULL
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
-- Name: tipo_documento; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.tipo_documento (
    "tipoDocumentoId" integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    caracteres integer NOT NULL,
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
    "tipoExpedienteid" integer NOT NULL,
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
-- Name: tipo_expediente_tipoExpedienteid_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."tipo_expediente_tipoExpedienteid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE empresa."tipo_expediente_tipoExpedienteid_seq" OWNER TO postgres;

--
-- Name: tipo_expediente_tipoExpedienteid_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."tipo_expediente_tipoExpedienteid_seq" OWNED BY empresa.tipo_expediente."tipoExpedienteid";


--
-- Name: tipo_persona; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.tipo_persona (
    "tipoPersonaId" integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    tipo character varying(50) NOT NULL
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
-- Name: ubigeo; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.ubigeo (
    descripcion character varying(255) NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "ubigeoId" integer NOT NULL,
    "departamentoId" character varying(2) NOT NULL,
    "provinciaId" character varying(2) NOT NULL,
    "distritoId" character varying(2) NOT NULL,
    "regionId" character varying(2)
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
    descripcion character varying(255) NOT NULL,
    contenido text,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "menuId" integer NOT NULL
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
    "audIpMod" character varying(200),
    "menuId" integer NOT NULL,
    "usuarioId" integer NOT NULL
);


ALTER TABLE sistema.permisos_menu OWNER TO postgres;

--
-- Name: rol; Type: TABLE; Schema: sistema; Owner: postgres
--

CREATE TABLE sistema.rol (
    "rolId" integer NOT NULL,
    descripcion character varying NOT NULL,
    detalle character varying NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    interno boolean NOT NULL,
    correlativo boolean NOT NULL
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
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "usuarioId" integer NOT NULL,
    "personaId" integer,
    "usuarioNombre" character varying(150) NOT NULL,
    "rolId" integer NOT NULL,
    clave character varying(150) NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    avatar character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE sistema.usuario OWNER TO postgres;

--
-- Name: usuario_usuarioId_seq; Type: SEQUENCE; Schema: sistema; Owner: postgres
--

CREATE SEQUENCE sistema."usuario_usuarioId_seq"
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
    "unidadId" integer NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE sistema.usuarios_u_organicas OWNER TO postgres;

--
-- Name: usuarios_u_organicas_usuarioId_seq; Type: SEQUENCE; Schema: sistema; Owner: postgres
--

CREATE SEQUENCE sistema."usuarios_u_organicas_usuarioId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sistema."usuarios_u_organicas_usuarioId_seq" OWNER TO postgres;

--
-- Name: usuarios_u_organicas_usuarioId_seq; Type: SEQUENCE OWNED BY; Schema: sistema; Owner: postgres
--

ALTER SEQUENCE sistema."usuarios_u_organicas_usuarioId_seq" OWNED BY sistema.usuarios_u_organicas."usuarioId";


--
-- Name: archivo_adjunto; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.archivo_adjunto (
    id integer NOT NULL,
    "relacionId" integer NOT NULL,
    nombre character varying NOT NULL,
    extension character varying NOT NULL,
    "nombreFTP" character varying NOT NULL,
    ubicacion character varying NOT NULL,
    contenido character varying NOT NULL,
    origen character varying NOT NULL,
    destinos character varying NOT NULL,
    procesos character varying NOT NULL,
    tipo character varying NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.archivo_adjunto OWNER TO postgres;

--
-- Name: archivo_adjunto_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.archivo_adjunto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.archivo_adjunto_id_seq OWNER TO postgres;

--
-- Name: archivo_adjunto_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.archivo_adjunto_id_seq OWNED BY tramite.archivo_adjunto.id;


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
    massive boolean NOT NULL,
    "allDay" boolean NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    color character varying(50) NOT NULL,
    textcolor character varying(50) NOT NULL
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
    "audIpMod" character varying(200),
    "correlativoId" integer NOT NULL,
    "tipoDocumentoId" integer NOT NULL
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
    id integer NOT NULL,
    "unidadId" integer NOT NULL,
    "documentoId" integer NOT NULL,
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
-- Name: correlativo_unidad_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.correlativo_unidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.correlativo_unidad_id_seq OWNER TO postgres;

--
-- Name: correlativo_unidad_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.correlativo_unidad_id_seq OWNED BY tramite.correlativo_unidad.id;


--
-- Name: documento_interno; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.documento_interno (
    id integer NOT NULL,
    "documentoId" integer NOT NULL,
    "nroDocumento" character varying(50) NOT NULL,
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
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.documento_interno OWNER TO postgres;

--
-- Name: documento_interno_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.documento_interno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.documento_interno_id_seq OWNER TO postgres;

--
-- Name: documento_interno_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.documento_interno_id_seq OWNED BY tramite.documento_interno.id;


--
-- Name: encargado_uo; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.encargado_uo (
    id integer NOT NULL,
    "personaId" integer NOT NULL,
    "fInicio" timestamp with time zone NOT NULL,
    "fFin" timestamp with time zone NOT NULL,
    documento character varying(50) NOT NULL,
    "tipoDocId" integer NOT NULL,
    "cargoId" integer NOT NULL,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "uoId" integer NOT NULL
);


ALTER TABLE tramite.encargado_uo OWNER TO postgres;

--
-- Name: encargado_uo_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.encargado_uo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.encargado_uo_id_seq OWNER TO postgres;

--
-- Name: encargado_uo_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.encargado_uo_id_seq OWNED BY tramite.encargado_uo.id;


--
-- Name: encargado_uo_uoId_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite."encargado_uo_uoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite."encargado_uo_uoId_seq" OWNER TO postgres;

--
-- Name: encargado_uo_uoId_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite."encargado_uo_uoId_seq" OWNED BY tramite.encargado_uo."uoId";


--
-- Name: expediente; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.expediente (
    id integer NOT NULL,
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
    "fechaRegistro" timestamp with time zone NOT NULL,
    "usuarioId" integer NOT NULL,
    "remitenteId" integer NOT NULL,
    "tipoExpedienteId" integer NOT NULL,
    "procedimientoId" integer NOT NULL,
    anio integer,
    "estadoId" integer NOT NULL,
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
    "audIpMod" character varying(200)
);


ALTER TABLE tramite.expediente OWNER TO postgres;

--
-- Name: expediente_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.expediente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.expediente_id_seq OWNER TO postgres;

--
-- Name: expediente_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.expediente_id_seq OWNED BY tramite.expediente.id;


--
-- Name: expediente_mpv; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.expediente_mpv (
    id integer NOT NULL,
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
-- Name: expediente_mpv_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.expediente_mpv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.expediente_mpv_id_seq OWNER TO postgres;

--
-- Name: expediente_mpv_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.expediente_mpv_id_seq OWNED BY tramite.expediente_mpv.id;


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
    id integer NOT NULL,
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
-- Name: partida_presupuestal_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.partida_presupuestal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.partida_presupuestal_id_seq OWNER TO postgres;

--
-- Name: partida_presupuestal_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.partida_presupuestal_id_seq OWNED BY tramite.partida_presupuestal.id;


--
-- Name: personas; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.personas (
    nombres character varying(100) NOT NULL,
    documento character varying(50) NOT NULL,
    direccion text,
    email character varying(100),
    contrasena character varying(255),
    servidor character varying(50),
    puerto integer,
    ssl boolean DEFAULT false NOT NULL,
    telefono character varying(20),
    "docRep" character varying(50),
    "nombresRep" character varying(100),
    "apPatRep" character varying(100),
    "apMatRep" character varying(100),
    "emailConfirmado" boolean DEFAULT false NOT NULL,
    token character varying(255),
    "tokenExpiration" timestamp without time zone,
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "personaId" integer NOT NULL,
    "apePaterno" character varying(100) NOT NULL,
    "apeMaterno" character varying(100) NOT NULL,
    "repLegal" boolean DEFAULT false NOT NULL,
    "tipoPersonaId" integer NOT NULL,
    "tipoDocumentoId" integer NOT NULL
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
    id integer NOT NULL,
    "uOrganicaId" integer NOT NULL,
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
-- Name: procedimiento_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.procedimiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.procedimiento_id_seq OWNER TO postgres;

--
-- Name: procedimiento_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.procedimiento_id_seq OWNED BY tramite.procedimiento.id;


--
-- Name: proceso_tramite; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.proceso_tramite (
    id integer NOT NULL,
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
-- Name: proceso_tramite_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.proceso_tramite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.proceso_tramite_id_seq OWNER TO postgres;

--
-- Name: proceso_tramite_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.proceso_tramite_id_seq OWNED BY tramite.proceso_tramite.id;


--
-- Name: requisito; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.requisito (
    id integer NOT NULL,
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
-- Name: requisito_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.requisito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.requisito_id_seq OWNER TO postgres;

--
-- Name: requisito_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.requisito_id_seq OWNED BY tramite.requisito.id;


--
-- Name: rubro; Type: TABLE; Schema: tramite; Owner: postgres
--

CREATE TABLE tramite.rubro (
    id integer NOT NULL,
    "procedimientoId" integer NOT NULL,
    "partidaId" integer NOT NULL,
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
-- Name: rubro_id_seq; Type: SEQUENCE; Schema: tramite; Owner: postgres
--

CREATE SEQUENCE tramite.rubro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE tramite.rubro_id_seq OWNER TO postgres;

--
-- Name: rubro_id_seq; Type: SEQUENCE OWNED BY; Schema: tramite; Owner: postgres
--

ALTER SEQUENCE tramite.rubro_id_seq OWNED BY tramite.rubro.id;


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
    "audAnulado" character(1) DEFAULT 0 NOT NULL,
    "audFechaReg" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioReg" character varying(200),
    "audIpReg" character varying,
    "audFechaMod" timestamp without time zone DEFAULT now() NOT NULL,
    "audUsuarioMod" character varying(200),
    "audIpMod" character varying(200),
    "unidadOrganicaId" integer NOT NULL,
    abreviatura character varying(50) NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean NOT NULL,
    nivel integer NOT NULL,
    relacion character varying(255) NOT NULL,
    "sedeId" integer,
    tupa character(1),
    orden character varying DEFAULT ''::character varying
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
-- Name: tipo_documento tipoDocumentoId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_documento ALTER COLUMN "tipoDocumentoId" SET DEFAULT nextval('empresa."tipo_documento_tipoDocumentoId_seq"'::regclass);


--
-- Name: tipo_expediente tipoExpedienteid; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_expediente ALTER COLUMN "tipoExpedienteid" SET DEFAULT nextval('empresa."tipo_expediente_tipoExpedienteid_seq"'::regclass);


--
-- Name: tipo_persona tipoPersonaId; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_persona ALTER COLUMN "tipoPersonaId" SET DEFAULT nextval('empresa."tipo_persona_tipoPersonaId_seq"'::regclass);


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
-- Name: usuarios_u_organicas usuarioId; Type: DEFAULT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.usuarios_u_organicas ALTER COLUMN "usuarioId" SET DEFAULT nextval('sistema."usuarios_u_organicas_usuarioId_seq"'::regclass);


--
-- Name: archivo_adjunto id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.archivo_adjunto ALTER COLUMN id SET DEFAULT nextval('tramite.archivo_adjunto_id_seq'::regclass);


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
-- Name: correlativo_unidad id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo_unidad ALTER COLUMN id SET DEFAULT nextval('tramite.correlativo_unidad_id_seq'::regclass);


--
-- Name: documento_interno id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.documento_interno ALTER COLUMN id SET DEFAULT nextval('tramite.documento_interno_id_seq'::regclass);


--
-- Name: encargado_uo id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.encargado_uo ALTER COLUMN id SET DEFAULT nextval('tramite.encargado_uo_id_seq'::regclass);


--
-- Name: encargado_uo uoId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.encargado_uo ALTER COLUMN "uoId" SET DEFAULT nextval('tramite."encargado_uo_uoId_seq"'::regclass);


--
-- Name: expediente id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente ALTER COLUMN id SET DEFAULT nextval('tramite.expediente_id_seq'::regclass);


--
-- Name: expediente_mpv id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente_mpv ALTER COLUMN id SET DEFAULT nextval('tramite.expediente_mpv_id_seq'::regclass);


--
-- Name: expediente_vinculado id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente_vinculado ALTER COLUMN id SET DEFAULT nextval('tramite.expediente_vinculado_id_seq'::regclass);


--
-- Name: partida_presupuestal id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.partida_presupuestal ALTER COLUMN id SET DEFAULT nextval('tramite.partida_presupuestal_id_seq'::regclass);


--
-- Name: personas personaId; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.personas ALTER COLUMN "personaId" SET DEFAULT nextval('tramite."personas_personaId_seq"'::regclass);


--
-- Name: procedimiento id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.procedimiento ALTER COLUMN id SET DEFAULT nextval('tramite.procedimiento_id_seq'::regclass);


--
-- Name: proceso_tramite id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite ALTER COLUMN id SET DEFAULT nextval('tramite.proceso_tramite_id_seq'::regclass);


--
-- Name: requisito id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.requisito ALTER COLUMN id SET DEFAULT nextval('tramite.requisito_id_seq'::regclass);


--
-- Name: rubro id; Type: DEFAULT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.rubro ALTER COLUMN id SET DEFAULT nextval('tramite.rubro_id_seq'::regclass);


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
\.


--
-- Data for Name: configuracion; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.configuracion ("configuracionId", anio, uit, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: divisa; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.divisa ("divisaId", simbolo, descripcion, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.empresa (nombre, abrev, ruc, direccion, imagen, fut, "plazoAdmin", "plazoLegal", email, contrasena, servidor, puerto, ssl, "plantillaProveido", cargo, "cargoInterno", licencia, validar, "rutaMunicipalidad", manual, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "empresaId", "ubigeoId", "mesaParteId", "horaInicio", "horaFin", "porVencer") FROM stdin;
MODIFICADOOOOOOOOOOOOOOOOOOOOOO	TTTTT	32323232323	EEEEEEEEEEEEE	\N	f	\N	\N	FFFF@GMAIL.COM	3233232222	22	33	t	\N	\N	\N	\N	f	EEEEEEEEEEEEE	f	0	2024-09-09 22:59:21.472408	\N	\N	2024-09-09 23:19:35.288228	\N	\N	1	1177	7	02:00:00	12:00:00	4
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.estado ("estadoId", codigo, descripcion, color, tipo, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: parametro; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.parametro ("parametroId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", codigo, grupo, descripcion, valor, "valorII") FROM stdin;
\.


--
-- Data for Name: tipo_documento; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.tipo_documento ("tipoDocumentoId", descripcion, caracteres, tipo, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
1	RUC	11	Identificacion	0	2024-09-15 22:15:49.177521	\N	\N	2024-09-15 22:15:49.177521	\N	\N
2	DNI	8	Identificacion	0	2024-09-15 22:15:49.177521	\N	\N	2024-09-15 22:15:49.177521	\N	\N
\.


--
-- Data for Name: tipo_expediente; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.tipo_expediente ("tipoExpedienteid", codigo, descripcion, color, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: tipo_persona; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.tipo_persona ("tipoPersonaId", descripcion, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", tipo) FROM stdin;
4	JURIDICA	0	2024-09-15 22:13:33.520885	\N	\N	2024-09-15 22:13:33.520885	\N	\N	JURIDICA
5	NATURAL	0	2024-09-15 22:13:33.520885	\N	\N	2024-09-15 22:13:33.520885	\N	\N	NATURAL
\.


--
-- Data for Name: ubigeo; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa.ubigeo (descripcion, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "ubigeoId", "departamentoId", "provinciaId", "distritoId", "regionId") FROM stdin;
CHACHAPOYAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1	01	01	00	\N
BAGUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	3	01	02	00	\N
BONGARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	5	01	03	00	\N
LUYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	7	01	04	00	\N
RODRIGUEZ DE MENDOZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	9	01	05	00	\N
CONDORCANQUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	11	01	06	00	\N
UTCUBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	13	01	07	00	\N
HUARAZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	15	02	01	00	\N
AIJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	17	02	02	00	\N
BOLOGNESI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	19	02	03	00	\N
CARHUAZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	21	02	04	00	\N
CHACHAPOYAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	22	01	01	01	\N
ASUNCION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	24	01	01	02	\N
CASMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	25	02	05	00	\N
BALSAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	27	01	01	03	\N
CORONGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	28	02	06	00	\N
CHETO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	30	01	01	04	\N
HUAYLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	31	02	07	00	\N
CHILIQUIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	33	01	01	05	\N
HUARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	34	02	08	00	\N
CHUQUIBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	36	01	01	06	\N
MARISCAL LUZURIAGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	37	02	09	00	\N
GRANADA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	39	01	01	07	\N
PALLASCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	40	02	10	00	\N
POMABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	42	02	11	00	\N
HUANCAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	43	01	01	08	\N
RECUAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	45	02	12	00	\N
LA JALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	46	01	01	09	\N
SANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	48	02	13	00	\N
LEIMEBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	49	01	01	10	\N
SIHUAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	51	02	14	00	\N
LEVANTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	52	01	01	11	\N
YUNGAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	54	02	15	00	\N
MAGDALENA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	55	01	01	12	\N
ANTONIO RAIMONDI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	57	02	16	00	\N
MARISCAL CASTILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	58	01	01	13	\N
CARLOS FERMIN FITZCARRALD	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	60	02	17	00	\N
MOLINOPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	61	01	01	14	\N
PROV. CONST. DEL CALLAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	62	24	00	00	\N
ASUNCION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	63	02	18	00	\N
MONTEVIDEO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	64	01	01	15	\N
HUARMEY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	66	02	19	00	\N
OLLEROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	67	01	01	16	\N
OCROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	68	02	20	00	\N
QUINJALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	69	01	01	17	\N
ABANCAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	70	03	01	00	\N
SAN FCO DE DAGUAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	71	01	01	18	\N
AYMARAES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	72	03	02	00	\N
SAN ISIDRO DE MAINO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	73	01	01	19	\N
ANDAHUAYLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	74	03	03	00	\N
SOLOCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	75	01	01	20	\N
ANTABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	76	03	04	00	\N
SONCHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	77	01	01	21	\N
COTABAMBAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	78	03	05	00	\N
LA PECA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	79	01	02	01	\N
GRAU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	80	03	06	00	\N
ARAMANGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	81	01	02	02	\N
CHINCHEROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	82	03	07	00	\N
COPALLIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	83	01	02	03	\N
EL PARCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	84	01	02	04	\N
AREQUIPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	85	04	01	00	\N
BAGUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	86	01	02	05	\N
CAYLLOMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	87	04	02	00	\N
IMAZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	88	01	02	06	\N
CAMANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	89	04	03	00	\N
JUMBILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	90	01	03	01	\N
CARAVELI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	91	04	04	00	\N
COROSHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	92	01	03	02	\N
CASTILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	93	04	05	00	\N
CUISPES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	94	01	03	03	\N
CONDESUYOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	95	04	06	00	\N
CHISQUILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	96	01	03	04	\N
ISLAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	97	04	07	00	\N
CHURUJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	98	01	03	05	\N
FLORIDA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	99	01	03	06	\N
LA UNION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	100	04	08	00	\N
RECTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	101	01	03	07	\N
HUAMANGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	102	05	01	00	\N
SAN CARLOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	103	01	03	08	\N
CANGALLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	104	05	02	00	\N
SHIPASBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	105	01	03	09	\N
HUANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	106	05	03	00	\N
VALERA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	107	01	03	10	\N
LA MAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	108	05	04	00	\N
YAMBRASBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	109	01	03	11	\N
LUCANAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	110	05	05	00	\N
JAZAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	111	01	03	12	\N
PARINACOCHAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	112	05	06	00	\N
LAMUD	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	113	01	04	01	\N
VICTOR FAJARDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	114	05	07	00	\N
CAMPORREDONDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	115	01	04	02	\N
HUANCA SANCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	116	05	08	00	\N
COCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	117	01	04	03	\N
VILCAS HUAMAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	118	05	09	00	\N
COLCAMAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	119	01	04	04	\N
PAUCAR DEL SARA SARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	120	05	10	00	\N
CONILA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	121	01	04	05	\N
SUCRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	122	05	11	00	\N
INGUILPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	123	01	04	06	\N
CAJAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	124	06	01	00	\N
LONGUITA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	125	01	04	07	\N
CAJABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	126	06	02	00	\N
LONYA CHICO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	127	01	04	08	\N
CELENDIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	128	06	03	00	\N
LUYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	129	01	04	09	\N
CONTUMAZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	130	06	04	00	\N
LUYA VIEJO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	131	01	04	10	\N
CUTERVO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	132	06	05	00	\N
MARIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	133	01	04	11	\N
CHOTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	134	06	06	00	\N
OCALLI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	135	01	04	12	\N
HUALGAYOC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	136	06	07	00	\N
OCUMAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	137	01	04	13	\N
JAEN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	138	06	08	00	\N
PISUQUIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	139	01	04	14	\N
SANTA CRUZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	140	06	09	00	\N
SAN CRISTOBAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	141	01	04	15	\N
SAN MIGUEL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	142	06	10	00	\N
SAN FRANCISCO DE YESO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	143	01	04	16	\N
SAN IGNACIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	144	06	11	00	\N
SAN JERONIMO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	145	01	04	17	\N
SAN MARCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	146	06	12	00	\N
SAN JUAN DE LOPECANCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	147	01	04	18	\N
SAN PABLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	148	06	13	00	\N
SANTA CATALINA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	149	01	04	19	\N
CUSCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	150	07	01	00	\N
ACOMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	151	07	02	00	\N
SANTO TOMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	152	01	04	20	\N
TINGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	153	01	04	21	\N
ANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	154	07	03	00	\N
TRITA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	155	01	04	22	\N
CALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	156	07	04	00	\N
PROVIDENCIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	157	01	04	23	\N
CANAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	158	07	05	00	\N
SAN NICOLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	159	01	05	01	\N
CANCHIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	160	07	06	00	\N
CHUMBIVILCAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	161	07	07	00	\N
COCHAMAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	162	01	05	02	\N
ESPINAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	163	07	08	00	\N
CHIRIMOTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	164	01	05	03	\N
LA CONVENCION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	165	07	09	00	\N
HUAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	166	01	05	04	\N
PARURO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	167	07	10	00	\N
LIMABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	168	01	05	05	\N
PAUCARTAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	169	07	11	00	\N
LONGAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	170	01	05	06	\N
QUISPICANCHIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	171	07	12	00	\N
MILPUC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	172	01	05	07	\N
URUBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	173	07	13	00	\N
MCAL BENAVIDES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	174	01	05	08	\N
HUANCAVELICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	175	08	01	00	\N
OMIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	176	01	05	09	\N
ACOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	177	08	02	00	\N
SANTA ROSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	178	01	05	10	\N
ANGARAES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	179	08	03	00	\N
TOTORA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	180	01	05	11	\N
CASTROVIRREYNA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	181	08	04	00	\N
VISTA ALEGRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	182	01	05	12	\N
TAYACAJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	183	08	05	00	\N
NIEVA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	184	01	06	01	\N
HUAYTARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	185	08	06	00	\N
CHURCAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	186	08	07	00	\N
RIO SANTIAGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	187	01	06	02	\N
HUANUCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	188	09	01	00	\N
EL CENEPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	189	01	06	03	\N
AMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	190	09	02	00	\N
BAGUA GRANDE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	191	01	07	01	\N
DOS DE MAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	192	09	03	00	\N
CAJARURO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	193	01	07	02	\N
HUAMALIES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	194	09	04	00	\N
CUMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	195	01	07	03	\N
MARANON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	196	09	05	00	\N
EL MILAGRO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	197	01	07	04	\N
LEONCIO PRADO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	198	09	06	00	\N
JAMALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	199	01	07	05	\N
PACHITEA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	200	09	07	00	\N
LONYA GRANDE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	201	01	07	06	\N
PUERTO INCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	202	09	08	00	\N
YAMON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	203	01	07	07	\N
HUACAYBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	204	09	09	00	\N
HUARAZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	205	02	01	01	\N
LAURICOCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	206	09	10	00	\N
INDEPENDENCIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	207	02	01	02	\N
YAROWILCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	208	09	11	00	\N
COCHABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	209	02	01	03	\N
ICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	210	10	01	00	\N
COLCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	211	02	01	04	\N
CHINCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	212	10	02	00	\N
HUANCHAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	213	02	01	05	\N
NAZCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	214	10	03	00	\N
JANGAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	215	02	01	06	\N
PISCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	216	10	04	00	\N
LA LIBERTAD	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	217	02	01	07	\N
PALPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	218	10	05	00	\N
OLLEROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	219	02	01	08	\N
HUANCAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	220	11	01	00	\N
PAMPAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	221	02	01	09	\N
CONCEPCION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	222	11	02	00	\N
PARIACOTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	223	02	01	10	\N
JAUJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	224	11	03	00	\N
PIRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	225	02	01	11	\N
JUNIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	226	11	04	00	\N
TARICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	227	02	01	12	\N
TARMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	228	11	05	00	\N
AIJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	229	02	02	01	\N
YAULI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	230	11	06	00	\N
CORIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	231	02	02	03	\N
SATIPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	232	11	07	00	\N
HUACLLAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	233	02	02	05	\N
CHANCHAMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	234	11	08	00	\N
LA MERCED	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	235	02	02	06	\N
CHUPACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	236	11	09	00	\N
SUCCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	237	02	02	08	\N
TRUJILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	238	12	01	00	\N
CHIQUIAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	239	02	03	01	\N
BOLIVAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	240	12	02	00	\N
A PARDO LEZAMETA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	241	02	03	02	\N
SANCHEZ CARRION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	242	12	03	00	\N
AQUIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	243	02	03	04	\N
OTUZCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	244	12	04	00	\N
CAJACAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	245	02	03	05	\N
PACASMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	246	12	05	00	\N
HUAYLLACAYAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	247	02	03	10	\N
PATAZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	248	12	06	00	\N
HUASTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	249	02	03	11	\N
SANTIAGO DE CHUCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	250	12	07	00	\N
MANGAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	251	02	03	13	\N
ASCOPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	252	12	08	00	\N
PACLLON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	253	02	03	15	\N
CHEPEN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	254	12	09	00	\N
SAN MIGUEL DE CORPANQUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	255	02	03	17	\N
JULCAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	256	12	10	00	\N
TICLLOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	257	02	03	20	\N
GRAN CHIMU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	258	12	11	00	\N
ANTONIO RAIMONDI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	259	02	03	21	\N
VIRU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	260	12	12	00	\N
CANIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	261	02	03	22	\N
CHICLAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	262	13	01	00	\N
COLQUIOC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	263	02	03	23	\N
FERRENAFE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	264	13	02	00	\N
LAMBAYEQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	265	13	03	00	\N
LA PRIMAVERA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	266	02	03	24	\N
LIMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	267	14	01	00	\N
HUALLANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	268	02	03	25	\N
CAJATAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	269	14	02	00	\N
CARHUAZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	270	02	04	01	\N
CANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	271	14	03	00	\N
ACOPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	272	02	04	02	\N
CANETE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	273	14	04	00	\N
AMASHCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	274	02	04	03	\N
HUAURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	275	14	05	00	\N
ANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	276	02	04	04	\N
HUAROCHIRI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	277	14	06	00	\N
ATAQUERO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	278	02	04	05	\N
YAUYOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	279	14	07	00	\N
MARCARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	280	02	04	06	\N
HUARAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	281	14	08	00	\N
PARIAHUANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	282	02	04	07	\N
BARRANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	283	14	09	00	\N
SAN MIGUEL DE ACO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	284	02	04	08	\N
OYON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	285	14	10	00	\N
SHILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	286	02	04	09	\N
MAYNAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	287	15	01	00	\N
TINCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	288	02	04	10	\N
ALTO AMAZONAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	289	15	02	00	\N
YUNGAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	290	02	04	11	\N
LORETO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	291	15	03	00	\N
CASMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	292	02	05	01	\N
REQUENA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	293	15	04	00	\N
BUENA VISTA ALTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	294	02	05	02	\N
UCAYALI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	295	15	05	00	\N
COMANDANTE NOEL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	296	02	05	03	\N
MARISCAL RAMON CASTILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	297	15	06	00	\N
YAUTAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	298	02	05	05	\N
DATEM DEL MARAÑON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	299	15	07	00	\N
CORONGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	300	02	06	01	\N
TAMBOPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	301	16	01	00	\N
ACO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	302	02	06	02	\N
MANU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	303	16	02	00	\N
BAMBAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	304	02	06	03	\N
TAHUAMANU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	305	16	03	00	\N
CUSCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	306	02	06	04	\N
MARISCAL NIETO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	307	17	01	00	\N
LA PAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	308	02	06	05	\N
GENERAL SANCHEZ CERRO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	309	17	02	00	\N
YANAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	310	02	06	06	\N
ILO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	311	17	03	00	\N
YUPAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	312	02	06	07	\N
PASCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	313	18	01	00	\N
CARAZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	314	02	07	01	\N
DANIEL ALCIDES CARRION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	315	18	02	00	\N
HUALLANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	316	02	07	02	\N
OXAPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	317	18	03	00	\N
PIURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	318	19	01	00	\N
HUATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	319	02	07	03	\N
AYABACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	320	19	02	00	\N
HUAYLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	321	02	07	04	\N
HUANCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	322	19	03	00	\N
MATO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	323	02	07	05	\N
MORROPON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	324	19	04	00	\N
PAMPAROMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	325	02	07	06	\N
PAITA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	326	19	05	00	\N
PUEBLO LIBRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	327	02	07	07	\N
SULLANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	328	19	06	00	\N
SANTA CRUZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	329	02	07	08	\N
TALARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	330	19	07	00	\N
YURACMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	331	02	07	09	\N
SECHURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	332	19	08	00	\N
SANTO TORIBIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	333	02	07	10	\N
PUNO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	334	20	01	00	\N
HUARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	335	02	08	01	\N
AZANGARO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	336	20	02	00	\N
CAJAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	337	02	08	02	\N
CARABAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	338	20	03	00	\N
CHAVIN DE HUANTAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	339	02	08	03	\N
HUACACHI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	340	02	08	04	\N
CHUCUITO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	341	20	04	00	\N
HUACHIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	342	02	08	05	\N
HUANCANE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	343	20	05	00	\N
HUACCHIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	344	02	08	06	\N
LAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	345	20	06	00	\N
HUANTAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	346	02	08	07	\N
MELGAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	347	20	07	00	\N
MASIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	348	02	08	08	\N
SANDIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	349	20	08	00	\N
PAUCAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	350	02	08	09	\N
SAN ROMAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	351	20	09	00	\N
PONTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	352	02	08	10	\N
YUNGUYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	353	20	10	00	\N
RAHUAPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	354	02	08	11	\N
SAN ANTONIO DE PUTINA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	355	20	11	00	\N
RAPAYAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	356	02	08	12	\N
EL COLLAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	357	20	12	00	\N
SAN MARCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	358	02	08	13	\N
MOHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	359	20	13	00	\N
SAN PEDRO DE CHANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	360	02	08	14	\N
MOYOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	361	21	01	00	\N
UCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	362	02	08	15	\N
HUALLAGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	363	21	02	00	\N
ANRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	364	02	08	16	\N
LAMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	365	21	03	00	\N
PISCOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	366	02	09	01	\N
MARISCAL CACERES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	367	21	04	00	\N
CASCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	368	02	09	02	\N
RIOJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	369	21	05	00	\N
LUCMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	370	02	09	03	\N
SAN MARTIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	371	21	06	00	\N
FIDEL OLIVAS ESCUDERO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	372	02	09	04	\N
BELLAVISTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	373	21	07	00	\N
LLAMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	374	02	09	05	\N
TOCACHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	375	21	08	00	\N
LLUMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	376	02	09	06	\N
PICOTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	377	21	09	00	\N
MUSGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	378	02	09	07	\N
EL DORADO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	379	21	10	00	\N
ELEAZAR GUZMAN BARRON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	380	02	09	08	\N
TACNA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	381	22	01	00	\N
CABANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	382	02	10	01	\N
BOLOGNESI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	383	02	10	02	\N
TARATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	384	22	02	00	\N
CONCHUCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	385	02	10	03	\N
JORGE BASADRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	386	22	03	00	\N
HUACASCHUQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	387	02	10	04	\N
CANDARAVE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	388	22	04	00	\N
HUANDOVAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	389	02	10	05	\N
TUMBES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	390	23	01	00	\N
LACABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	391	02	10	06	\N
CONTRALMIRANTE VILLAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	392	23	02	00	\N
LLAPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	393	02	10	07	\N
ZARUMILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	394	23	03	00	\N
PALLASCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	395	02	10	08	\N
CALLAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	396	24	01	00	\N
PAMPAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	397	02	10	09	\N
CORONEL PORTILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	398	25	01	00	\N
SANTA ROSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	399	02	10	10	\N
PADRE ABAD	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	400	25	02	00	\N
TAUCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	401	02	10	11	\N
ATALAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	402	25	03	00	\N
POMABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	403	02	11	01	\N
PURUS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	404	25	04	00	\N
HUAYLLAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	405	02	11	02	\N
PURUS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	406	25	04	00	\N
PAROBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	407	02	11	03	\N
QUINUABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	408	02	11	04	\N
RECUAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	409	02	12	01	\N
COTAPARACO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	410	02	12	02	\N
HUAYLLAPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	411	02	12	03	\N
MARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	412	02	12	04	\N
PAMPAS CHICO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	413	02	12	05	\N
PARARIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	414	02	12	06	\N
TAPACOCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	415	02	12	07	\N
TICAPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	416	02	12	08	\N
LLACLLIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	417	02	12	09	\N
CATAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	418	02	12	10	\N
CHIMBOTE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	419	02	13	01	\N
CACERES DEL PERU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	420	02	13	02	\N
MACATE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	421	02	13	03	\N
MORO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	422	02	13	04	\N
NEPENA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	423	02	13	05	\N
SAMANCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	424	02	13	06	\N
SANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	425	02	13	07	\N
COISHCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	426	02	13	08	\N
NUEVO CHIMBOTE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	427	02	13	09	\N
SIHUAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	428	02	14	01	\N
ALFONSO UGARTE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	429	02	14	02	\N
CHINGALPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	430	02	14	03	\N
HUAYLLABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	431	02	14	04	\N
QUICHES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	432	02	14	05	\N
SICSIBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	433	02	14	06	\N
ACOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	434	02	14	07	\N
CASHAPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	435	02	14	08	\N
RAGASH	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	436	02	14	09	\N
SAN JUAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	437	02	14	10	\N
YUNGAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	438	02	15	01	\N
CASCAPARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	439	02	15	02	\N
MANCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	440	02	15	03	\N
MATACOTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	441	02	15	04	\N
QUILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	442	02	15	05	\N
RANRAHIRCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	443	02	15	06	\N
SHUPLUY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	444	02	15	07	\N
YANAMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	445	02	15	08	\N
LLAMELLIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	446	02	16	01	\N
ACZO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	447	02	16	02	\N
CHACCHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	448	02	16	03	\N
CHINGAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	449	02	16	04	\N
MIRGAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	450	02	16	05	\N
SAN JUAN DE RONTOY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	451	02	16	06	\N
SAN LUIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	452	02	17	01	\N
YAUYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	453	02	17	02	\N
SAN NICOLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	454	02	17	03	\N
CHACAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	455	02	18	01	\N
ACOCHACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	456	02	18	02	\N
HUARMEY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	457	02	19	01	\N
COCHAPETI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	458	02	19	02	\N
HUAYAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	459	02	19	03	\N
MALVAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	460	02	19	04	\N
CULEBRAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	461	02	19	05	\N
ACAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	462	02	20	01	\N
CAJAMARQUILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	463	02	20	02	\N
CARHUAPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	464	02	20	03	\N
COCHAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	465	02	20	04	\N
CONGAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	466	02	20	05	\N
LLIPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	467	02	20	06	\N
OCROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	468	02	20	07	\N
SAN CRISTOBAL DE RAJAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	469	02	20	08	\N
SAN PEDRO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	470	02	20	09	\N
SANTIAGO DE CHILCAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	471	02	20	10	\N
ABANCAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	472	03	01	01	\N
CIRCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	473	03	01	02	\N
CURAHUASI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	474	03	01	03	\N
CHACOCHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	475	03	01	04	\N
HUANIPACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	476	03	01	05	\N
LAMBRAMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	477	03	01	06	\N
PICHIRHUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	478	03	01	07	\N
SAN PEDRO DE CACHORA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	479	03	01	08	\N
TAMBURCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	480	03	01	09	\N
CHALHUANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	481	03	02	01	\N
CAPAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	482	03	02	02	\N
CARAYBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	483	03	02	03	\N
COLCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	484	03	02	04	\N
COTARUSE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	485	03	02	05	\N
CHAPIMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	486	03	02	06	\N
IHUAYLLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	487	03	02	07	\N
LUCRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	488	03	02	08	\N
POCOHUANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	489	03	02	09	\N
SANAICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	490	03	02	10	\N
SORAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	491	03	02	11	\N
TAPAIRIHUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	492	03	02	12	\N
TINTAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	493	03	02	13	\N
TORAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	494	03	02	14	\N
YANACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	495	03	02	15	\N
SAN JUAN DE CHACNA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	496	03	02	16	\N
JUSTO APU SAHUARAURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	497	03	02	17	\N
ANDAHUAYLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	498	03	03	01	\N
ANDARAPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	499	03	03	02	\N
CHIARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	500	03	03	03	\N
HUANCARAMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	501	03	03	04	\N
HUANCARAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	502	03	03	05	\N
KISHUARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	503	03	03	06	\N
PACOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	504	03	03	07	\N
PAMPACHIRI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	505	03	03	08	\N
SAN ANTONIO DE CACHI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	506	03	03	09	\N
SAN JERONIMO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	507	03	03	10	\N
TALAVERA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	508	03	03	11	\N
TURPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	509	03	03	12	\N
PACUCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	510	03	03	13	\N
POMACOCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	511	03	03	14	\N
STA MARIA DE CHICMO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	512	03	03	15	\N
TUMAY HUARACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	513	03	03	16	\N
HUAYANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	514	03	03	17	\N
SAN MIGUEL DE CHACCRAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	515	03	03	18	\N
KAQUIABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	516	03	03	19	\N
ANTABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	517	03	04	01	\N
EL ORO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	518	03	04	02	\N
HUAQUIRCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	519	03	04	03	\N
JUAN ESPINOZA MEDRANO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	520	03	04	04	\N
OROPESA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	521	03	04	05	\N
PACHACONAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	522	03	04	06	\N
SABAINO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	523	03	04	07	\N
TAMBOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	524	03	05	01	\N
COYLLURQUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	525	03	05	02	\N
COTABAMBAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	526	03	05	03	\N
HAQUIRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	527	03	05	04	\N
MARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	528	03	05	05	\N
CHALLHUAHUACHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	529	03	05	06	\N
CHUQUIBAMBILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	530	03	06	01	\N
CURPAHUASI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	531	03	06	02	\N
HUAILLATI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	532	03	06	03	\N
MAMARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	533	03	06	04	\N
MARISCAL GAMARRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	534	03	06	05	\N
MICAELA BASTIDAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	535	03	06	06	\N
PROGRESO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	536	03	06	07	\N
PATAYPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	537	03	06	08	\N
SAN ANTONIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	538	03	06	09	\N
TURPAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	539	03	06	10	\N
VILCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	540	03	06	11	\N
VIRUNDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	541	03	06	12	\N
SANTA ROSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	542	03	06	13	\N
CURASCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	543	03	06	14	\N
CHINCHEROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	544	03	07	01	\N
ONGOY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	545	03	07	02	\N
OCOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	546	03	07	03	\N
COCHARCAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	547	03	07	04	\N
ANCO HUALLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	548	03	07	05	\N
HUACCANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	549	03	07	06	\N
URANMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	550	03	07	07	\N
RANRACANCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	551	03	07	08	\N
AREQUIPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	552	04	01	01	\N
CAYMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	553	04	01	02	\N
CERRO COLORADO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	554	04	01	03	\N
CHARACATO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	555	04	01	04	\N
CHIGUATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	556	04	01	05	\N
LA JOYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	557	04	01	06	\N
MIRAFLORES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	558	04	01	07	\N
MOLLEBAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	559	04	01	08	\N
PAUCARPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	560	04	01	09	\N
POCSI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	561	04	01	10	\N
POLOBAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	562	04	01	11	\N
QUEQUENA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	563	04	01	12	\N
SABANDIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	564	04	01	13	\N
SACHACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	565	04	01	14	\N
SAN JUAN DE SIGUAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	566	04	01	15	\N
SAN JUAN DE TARUCANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	567	04	01	16	\N
SANTA ISABEL DE SIGUAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	568	04	01	17	\N
STA RITA DE SIGUAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	569	04	01	18	\N
SOCABAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	570	04	01	19	\N
TIABAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	571	04	01	20	\N
UCHUMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	572	04	01	21	\N
VITOR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	573	04	01	22	\N
YANAHUARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	574	04	01	23	\N
YARABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	575	04	01	24	\N
YURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	576	04	01	25	\N
MARIANO MELGAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	577	04	01	26	\N
JACOBO HUNTER	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	578	04	01	27	\N
ALTO SELVA ALEGRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	579	04	01	28	\N
JOSE LUIS BUSTAMANTE Y RIVERO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	580	04	01	29	\N
CHIVAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	581	04	02	01	\N
ACHOMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	582	04	02	02	\N
CABANACONDE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	583	04	02	03	\N
CAYLLOMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	584	04	02	04	\N
CALLALLI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	585	04	02	05	\N
COPORAQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	586	04	02	06	\N
HUAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	587	04	02	07	\N
HUANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	588	04	02	08	\N
ICHUPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	589	04	02	09	\N
LARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	590	04	02	10	\N
LLUTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	591	04	02	11	\N
MACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	592	04	02	12	\N
MADRIGAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	593	04	02	13	\N
SAN ANTONIO DE CHUCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	594	04	02	14	\N
SIBAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	595	04	02	15	\N
TAPAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	596	04	02	16	\N
TISCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	597	04	02	17	\N
TUTI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	598	04	02	18	\N
YANQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	599	04	02	19	\N
MAJES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	600	04	02	20	\N
CAMANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	601	04	03	01	\N
JOSE MARIA QUIMPER	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	602	04	03	02	\N
MARIANO N VALCARCEL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	603	04	03	03	\N
MARISCAL CACERES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	604	04	03	04	\N
NICOLAS DE PIEROLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	605	04	03	05	\N
OCONA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	606	04	03	06	\N
QUILCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	607	04	03	07	\N
SAMUEL PASTOR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	608	04	03	08	\N
CARAVELI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	609	04	04	01	\N
ACARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	610	04	04	02	\N
ATICO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	611	04	04	03	\N
ATIQUIPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	612	04	04	04	\N
BELLA UNION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	613	04	04	05	\N
CAHUACHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	614	04	04	06	\N
CHALA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	615	04	04	07	\N
CHAPARRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	616	04	04	08	\N
HUANUHUANU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	617	04	04	09	\N
JAQUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	618	04	04	10	\N
LOMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	619	04	04	11	\N
QUICACHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	620	04	04	12	\N
YAUCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	621	04	04	13	\N
APLAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	622	04	05	01	\N
ANDAGUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	623	04	05	02	\N
AYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	624	04	05	03	\N
CHACHAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	625	04	05	04	\N
CHILCAYMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	626	04	05	05	\N
CHOCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	627	04	05	06	\N
HUANCARQUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	628	04	05	07	\N
MACHAGUAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	629	04	05	08	\N
ORCOPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	630	04	05	09	\N
PAMPACOLCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	631	04	05	10	\N
TIPAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	632	04	05	11	\N
URACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	633	04	05	12	\N
UNON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	634	04	05	13	\N
VIRACO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	635	04	05	14	\N
CHUQUIBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	636	04	06	01	\N
ANDARAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	637	04	06	02	\N
CAYARANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	638	04	06	03	\N
CHICHAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	639	04	06	04	\N
IRAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	640	04	06	05	\N
SALAMANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	641	04	06	06	\N
YANAQUIHUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	642	04	06	07	\N
RIO GRANDE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	643	04	06	08	\N
MOLLENDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	644	04	07	01	\N
COCACHACRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	645	04	07	02	\N
DEAN VALDIVIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	646	04	07	03	\N
ISLAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	647	04	07	04	\N
MEJIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	648	04	07	05	\N
PUNTA DE BOMBON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	649	04	07	06	\N
COTAHUASI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	650	04	08	01	\N
ALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	651	04	08	02	\N
CHARCANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	652	04	08	03	\N
HUAYNACOTAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	653	04	08	04	\N
PAMPAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	654	04	08	05	\N
PUYCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	655	04	08	06	\N
QUECHUALLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	656	04	08	07	\N
SAYLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	657	04	08	08	\N
TAURIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	658	04	08	09	\N
TOMEPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	659	04	08	10	\N
TORO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	660	04	08	11	\N
AYACUCHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	661	05	01	01	\N
ACOS VINCHOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	662	05	01	02	\N
CARMEN ALTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	663	05	01	03	\N
CHIARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	664	05	01	04	\N
QUINUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	665	05	01	05	\N
SAN JOSE DE TICLLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	666	05	01	06	\N
SAN JUAN BAUTISTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	667	05	01	07	\N
SANTIAGO DE PISCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	668	05	01	08	\N
VINCHOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	669	05	01	09	\N
TAMBILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	670	05	01	10	\N
ACOCRO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	671	05	01	11	\N
SOCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	672	05	01	12	\N
OCROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	673	05	01	13	\N
PACAYCASA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	674	05	01	14	\N
JESUS NAZARENO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	675	05	01	15	\N
CANGALLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	676	05	02	01	\N
CHUSCHI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	677	05	02	04	\N
LOS MOROCHUCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	678	05	02	06	\N
PARAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	679	05	02	07	\N
TOTOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	680	05	02	08	\N
MARIA PARADO DE BELLIDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	681	05	02	11	\N
HUANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	682	05	03	01	\N
AYAHUANCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	683	05	03	02	\N
HUAMANGUILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	684	05	03	03	\N
IGUAIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	685	05	03	04	\N
LURICOCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	686	05	03	05	\N
SANTILLANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	687	05	03	07	\N
SIVIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	688	05	03	08	\N
LLOCHEGUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	689	05	03	09	\N
SAN MIGUEL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	690	05	04	01	\N
ANCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	691	05	04	02	\N
AYNA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	692	05	04	03	\N
CHILCAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	693	05	04	04	\N
CHUNGUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	694	05	04	05	\N
TAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	695	05	04	06	\N
LUIS CARRANZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	696	05	04	07	\N
SANTA ROSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	697	05	04	08	\N
PUQUIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	698	05	05	01	\N
AUCARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	699	05	05	02	\N
CABANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	700	05	05	03	\N
CARMEN SALCEDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	701	05	05	04	\N
CHAVINA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	702	05	05	06	\N
CHIPAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	703	05	05	08	\N
HUAC-HUAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	704	05	05	10	\N
LARAMATE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	705	05	05	11	\N
LEONCIO PRADO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	706	05	05	12	\N
LUCANAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	707	05	05	13	\N
LLAUTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	708	05	05	14	\N
OCANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	709	05	05	16	\N
OTOCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	710	05	05	17	\N
SANCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	711	05	05	20	\N
SAN JUAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	712	05	05	21	\N
SAN PEDRO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	713	05	05	22	\N
STA ANA DE HUAYCAHUACHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	714	05	05	24	\N
SANTA LUCIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	715	05	05	25	\N
SAISA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	716	05	05	29	\N
SAN PEDRO DE PALCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	717	05	05	31	\N
SAN CRISTOBAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	718	05	05	32	\N
CORACORA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	719	05	06	01	\N
CORONEL CASTANEDA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	720	05	06	04	\N
CHUMPI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	721	05	06	05	\N
PACAPAUSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	722	05	06	08	\N
PULLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	723	05	06	11	\N
PUYUSCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	724	05	06	12	\N
SAN FCO DE RAVACAYCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	725	05	06	15	\N
UPAHUACHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	726	05	06	16	\N
HUANCAPI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	727	05	07	01	\N
ALCAMENCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	728	05	07	02	\N
APONGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	729	05	07	03	\N
CANARIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	730	05	07	04	\N
CAYARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	731	05	07	06	\N
COLCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	732	05	07	07	\N
HUAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	733	05	07	08	\N
HUAMANQUIQUIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	734	05	07	09	\N
HUANCARAYLLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	735	05	07	10	\N
SARHUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	736	05	07	13	\N
VILCANCHOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	737	05	07	14	\N
ASQUIPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	738	05	07	15	\N
SANCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	739	05	08	01	\N
SACSAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	740	05	08	02	\N
SANTIAGO DE LUCANAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	741	05	08	03	\N
CARAPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	742	05	08	04	\N
VILCAS HUAMAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	743	05	09	01	\N
VISCHONGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	744	05	09	02	\N
ACCOMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	745	05	09	03	\N
CARHUANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	746	05	09	04	\N
CONCEPCION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	747	05	09	05	\N
HUAMBALPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	748	05	09	06	\N
SAURAMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	749	05	09	07	\N
INDEPENDENCIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	750	05	09	08	\N
PAUSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	751	05	10	01	\N
COLTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	752	05	10	02	\N
CORCULLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	753	05	10	03	\N
LAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	754	05	10	04	\N
MARCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	755	05	10	05	\N
OYOLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	756	05	10	06	\N
PARARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	757	05	10	07	\N
SAN JAVIER DE ALPABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	758	05	10	08	\N
SAN JOSE DE USHUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	759	05	10	09	\N
SARA SARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	760	05	10	10	\N
QUEROBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	761	05	11	01	\N
BELEN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	762	05	11	02	\N
CHALCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	763	05	11	03	\N
SAN SALVADOR DE QUIJE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	764	05	11	04	\N
PAICO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	765	05	11	05	\N
SANTIAGO DE PAUCARAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	766	05	11	06	\N
SAN PEDRO DE LARCAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	767	05	11	07	\N
SORAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	768	05	11	08	\N
HUACANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	769	05	11	09	\N
CHILCAYOC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	770	05	11	10	\N
MORCOLLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	771	05	11	11	\N
CAJAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	772	06	01	01	\N
ASUNCION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	773	06	01	02	\N
COSPAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	774	06	01	03	\N
CHETILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	775	06	01	04	\N
ENCANADA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	776	06	01	05	\N
JESUS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	777	06	01	06	\N
LOS BANOS DEL INCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	778	06	01	07	\N
LLACANORA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	779	06	01	08	\N
MAGDALENA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	780	06	01	09	\N
MATARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	781	06	01	10	\N
NAMORA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	782	06	01	11	\N
SAN JUAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	783	06	01	12	\N
CAJABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	784	06	02	01	\N
CACHACHI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	785	06	02	02	\N
CONDEBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	786	06	02	03	\N
SITACOCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	787	06	02	05	\N
CELENDIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	788	06	03	01	\N
CORTEGANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	789	06	03	02	\N
CHUMUCH	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	790	06	03	03	\N
HUASMIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	791	06	03	04	\N
JORGE CHAVEZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	792	06	03	05	\N
JOSE GALVEZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	793	06	03	06	\N
MIGUEL IGLESIAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	794	06	03	07	\N
OXAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	795	06	03	08	\N
SOROCHUCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	796	06	03	09	\N
SUCRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	797	06	03	10	\N
UTCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	798	06	03	11	\N
LA LIBERTAD DE PALLAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	799	06	03	12	\N
CONTUMAZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	800	06	04	01	\N
CHILETE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	801	06	04	03	\N
GUZMANGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	802	06	04	04	\N
SAN BENITO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	803	06	04	05	\N
CUPISNIQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	804	06	04	06	\N
TANTARICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	805	06	04	07	\N
YONAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	806	06	04	08	\N
STA CRUZ DE TOLEDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	807	06	04	09	\N
CUTERVO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	808	06	05	01	\N
CALLAYUC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	809	06	05	02	\N
CUJILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	810	06	05	03	\N
CHOROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	811	06	05	04	\N
LA RAMADA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	812	06	05	05	\N
PIMPINGOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	813	06	05	06	\N
QUEROCOTILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	814	06	05	07	\N
SAN ANDRES DE CUTERVO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	815	06	05	08	\N
SAN JUAN DE CUTERVO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	816	06	05	09	\N
SAN LUIS DE LUCMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	817	06	05	10	\N
SANTA CRUZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	818	06	05	11	\N
SANTO DOMINGO DE LA CAPILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	819	06	05	12	\N
SANTO TOMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	820	06	05	13	\N
SOCOTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	821	06	05	14	\N
TORIBIO CASANOVA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	822	06	05	15	\N
CHOTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	823	06	06	01	\N
ANGUIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	824	06	06	02	\N
COCHABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	825	06	06	03	\N
CONCHAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	826	06	06	04	\N
CHADIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	827	06	06	05	\N
CHIGUIRIP	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	828	06	06	06	\N
CHIMBAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	829	06	06	07	\N
HUAMBOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	830	06	06	08	\N
LAJAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	831	06	06	09	\N
LLAMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	832	06	06	10	\N
MIRACOSTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	833	06	06	11	\N
PACCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	834	06	06	12	\N
PION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	835	06	06	13	\N
QUEROCOTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	836	06	06	14	\N
TACABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	837	06	06	15	\N
TOCMOCHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	838	06	06	16	\N
SAN JUAN DE LICUPIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	839	06	06	17	\N
CHOROPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	840	06	06	18	\N
CHALAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	841	06	06	19	\N
BAMBAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	842	06	07	01	\N
CHUGUR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	843	06	07	02	\N
HUALGAYOC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	844	06	07	03	\N
JAEN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	845	06	08	01	\N
BELLAVISTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	846	06	08	02	\N
COLASAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	847	06	08	03	\N
CHONTALI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	848	06	08	04	\N
POMAHUACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	849	06	08	05	\N
PUCARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	850	06	08	06	\N
SALLIQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	851	06	08	07	\N
SAN FELIPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	852	06	08	08	\N
SAN JOSE DEL ALTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	853	06	08	09	\N
SANTA ROSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	854	06	08	10	\N
LAS PIRIAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	855	06	08	11	\N
HUABAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	856	06	08	12	\N
SANTA CRUZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	857	06	09	01	\N
CATACHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	858	06	09	02	\N
CHANCAIBANOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	859	06	09	03	\N
LA ESPERANZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	860	06	09	04	\N
NINABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	861	06	09	05	\N
PULAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	862	06	09	06	\N
SEXI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	863	06	09	07	\N
UTICYACU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	864	06	09	08	\N
YAUYUCAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	865	06	09	09	\N
ANDABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	866	06	09	10	\N
SAUCEPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	867	06	09	11	\N
SAN MIGUEL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	868	06	10	01	\N
CALQUIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	869	06	10	02	\N
LA FLORIDA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	870	06	10	03	\N
LLAPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	871	06	10	04	\N
NANCHOC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	872	06	10	05	\N
NIEPOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	873	06	10	06	\N
SAN GREGORIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	874	06	10	07	\N
SAN SILVESTRE DE COCHAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	875	06	10	08	\N
EL PRADO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	876	06	10	09	\N
UNION AGUA BLANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	877	06	10	10	\N
TONGOD	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	878	06	10	11	\N
CATILLUC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	879	06	10	12	\N
BOLIVAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	880	06	10	13	\N
SAN IGNACIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	881	06	11	01	\N
CHIRINOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	882	06	11	02	\N
HUARANGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	883	06	11	03	\N
NAMBALLE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	884	06	11	04	\N
LA COIPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	885	06	11	05	\N
SAN JOSE DE LOURDES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	886	06	11	06	\N
TABACONAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	887	06	11	07	\N
PEDRO GALVEZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	888	06	12	01	\N
ICHOCAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	889	06	12	02	\N
GREGORIO PITA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	890	06	12	03	\N
JOSE MANUEL QUIROZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	891	06	12	04	\N
EDUARDO VILLANUEVA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	892	06	12	05	\N
JOSE SABOGAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	893	06	12	06	\N
CHANCAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	894	06	12	07	\N
SAN PABLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	895	06	13	01	\N
SAN BERNARDINO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	896	06	13	02	\N
SAN LUIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	897	06	13	03	\N
TUMBADEN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	898	06	13	04	\N
CUSCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	899	07	01	01	\N
CCORCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	900	07	01	02	\N
POROY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	901	07	01	03	\N
SAN JERONIMO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	902	07	01	04	\N
SAN SEBASTIAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	903	07	01	05	\N
SANTIAGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	904	07	01	06	\N
SAYLLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	905	07	01	07	\N
WANCHAQ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	906	07	01	08	\N
ACOMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	907	07	02	01	\N
ACOPIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	908	07	02	02	\N
ACOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	909	07	02	03	\N
POMACANCHI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	910	07	02	04	\N
RONDOCAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	911	07	02	05	\N
SANGARARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	912	07	02	06	\N
MOSOC LLACTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	913	07	02	07	\N
ANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	914	07	03	01	\N
CHINCHAYPUJIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	915	07	03	02	\N
HUAROCONDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	916	07	03	03	\N
LIMATAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	917	07	03	04	\N
MOLLEPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	918	07	03	05	\N
PUCYURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	919	07	03	06	\N
ZURITE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	920	07	03	07	\N
CACHIMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	921	07	03	08	\N
ANCAHUASI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	922	07	03	09	\N
CALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	923	07	04	01	\N
COYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	924	07	04	02	\N
LAMAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	925	07	04	03	\N
LARES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	926	07	04	04	\N
PISAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	927	07	04	05	\N
SAN SALVADOR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	928	07	04	06	\N
TARAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	929	07	04	07	\N
YANATILE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	930	07	04	08	\N
YANAOCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	931	07	05	01	\N
CHECCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	932	07	05	02	\N
KUNTURKANKI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	933	07	05	03	\N
LANGUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	934	07	05	04	\N
LAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	935	07	05	05	\N
PAMPAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	936	07	05	06	\N
QUEHUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	937	07	05	07	\N
TUPAC AMARU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	938	07	05	08	\N
SICUANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	939	07	06	01	\N
COMBAPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	940	07	06	02	\N
CHECACUPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	941	07	06	03	\N
MARANGANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	942	07	06	04	\N
PITUMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	943	07	06	05	\N
SAN PABLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	944	07	06	06	\N
SAN PEDRO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	945	07	06	07	\N
TINTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	946	07	06	08	\N
SANTO TOMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	947	07	07	01	\N
CAPACMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	948	07	07	02	\N
COLQUEMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	949	07	07	03	\N
CHAMACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	950	07	07	04	\N
LIVITACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	951	07	07	05	\N
LLUSCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	952	07	07	06	\N
QUINOTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	953	07	07	07	\N
VELILLE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	954	07	07	08	\N
ESPINAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	955	07	08	01	\N
CONDOROMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	956	07	08	02	\N
COPORAQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	957	07	08	03	\N
OCORURO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	958	07	08	04	\N
PALLPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	959	07	08	05	\N
PICHIGUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	960	07	08	06	\N
SUYKUTAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	961	07	08	07	\N
ALTO PICHIGUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	962	07	08	08	\N
SANTA ANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	963	07	09	01	\N
ECHARATE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	964	07	09	02	\N
HUAYOPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	965	07	09	03	\N
MARANURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	966	07	09	04	\N
OCOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	967	07	09	05	\N
SANTA TERESA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	968	07	09	06	\N
VILCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	969	07	09	07	\N
QUELLOUNO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	970	07	09	08	\N
KIMBIRI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	971	07	09	09	\N
PICHARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	972	07	09	10	\N
PARURO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	973	07	10	01	\N
ACCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	974	07	10	02	\N
CCAPI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	975	07	10	03	\N
COLCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	976	07	10	04	\N
HUANOQUITE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	977	07	10	05	\N
OMACHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	978	07	10	06	\N
YAURISQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	979	07	10	07	\N
PACCARITAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	980	07	10	08	\N
PILLPINTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	981	07	10	09	\N
PAUCARTAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	982	07	11	01	\N
CAICAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	983	07	11	02	\N
COLQUEPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	984	07	11	03	\N
CHALLABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	985	07	11	04	\N
COSNIPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	986	07	11	05	\N
HUANCARANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	987	07	11	06	\N
URCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	988	07	12	01	\N
ANDAHUAYLILLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	989	07	12	02	\N
CAMANTI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	990	07	12	03	\N
CCARHUAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	991	07	12	04	\N
CCATCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	992	07	12	05	\N
CUSIPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	993	07	12	06	\N
HUARO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	994	07	12	07	\N
LUCRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	995	07	12	08	\N
MARCAPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	996	07	12	09	\N
OCONGATE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	997	07	12	10	\N
OROPESA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	998	07	12	11	\N
QUIQUIJANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	999	07	12	12	\N
URUBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1000	07	13	01	\N
CHINCHERO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1001	07	13	02	\N
HUAYLLABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1002	07	13	03	\N
MACHUPICCHU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1003	07	13	04	\N
MARAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1004	07	13	05	\N
OLLANTAYTAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1005	07	13	06	\N
YUCAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1006	07	13	07	\N
HUANCAVELICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1007	08	01	01	\N
ACOBAMBILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1008	08	01	02	\N
ACORIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1009	08	01	03	\N
CONAYCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1010	08	01	04	\N
CUENCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1011	08	01	05	\N
HUACHOCOLPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1012	08	01	06	\N
HUAYLLAHUARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1013	08	01	08	\N
IZCUCHACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1014	08	01	09	\N
LARIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1015	08	01	10	\N
MANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1016	08	01	11	\N
MARISCAL CACERES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1017	08	01	12	\N
MOYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1018	08	01	13	\N
NUEVO OCCORO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1019	08	01	14	\N
PALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1020	08	01	15	\N
PILCHACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1021	08	01	16	\N
VILCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1022	08	01	17	\N
YAULI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1023	08	01	18	\N
ASCENCION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1024	08	01	19	\N
HUANDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1025	08	01	20	\N
ACOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1026	08	02	01	\N
ANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1027	08	02	02	\N
ANDABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1028	08	02	03	\N
CAJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1029	08	02	04	\N
MARCAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1030	08	02	05	\N
PAUCARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1031	08	02	06	\N
POMACOCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1032	08	02	07	\N
ROSARIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1033	08	02	08	\N
LIRCAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1034	08	03	01	\N
ANCHONGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1035	08	03	02	\N
CALLANMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1036	08	03	03	\N
CONGALLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1037	08	03	04	\N
CHINCHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1038	08	03	05	\N
HUAYLLAY GRANDE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1039	08	03	06	\N
HUANCA HUANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1040	08	03	07	\N
JULCAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1041	08	03	08	\N
SAN ANTONIO DE ANTAPARCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1042	08	03	09	\N
STO TOMAS DE PATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1043	08	03	10	\N
SECCLLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1044	08	03	11	\N
CCOCHACCASA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1045	08	03	12	\N
CASTROVIRREYNA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1046	08	04	01	\N
ARMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1047	08	04	02	\N
AURAHUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1048	08	04	03	\N
CAPILLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1049	08	04	05	\N
COCAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1050	08	04	06	\N
CHUPAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1051	08	04	08	\N
HUACHOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1052	08	04	09	\N
HUAMATAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1053	08	04	10	\N
MOLLEPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1054	08	04	14	\N
SAN JUAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1055	08	04	22	\N
TANTARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1056	08	04	27	\N
TICRAPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1057	08	04	28	\N
SANTA ANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1058	08	04	29	\N
PAMPAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1059	08	05	01	\N
ACOSTAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1060	08	05	02	\N
ACRAQUIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1061	08	05	03	\N
AHUAYCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1062	08	05	04	\N
COLCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1063	08	05	06	\N
DANIEL HERNANDEZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1064	08	05	09	\N
HUACHOCOLPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1065	08	05	11	\N
HUARIBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1066	08	05	12	\N
NAHUIMPUQUIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1067	08	05	15	\N
PAZOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1068	08	05	17	\N
QUISHUAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1069	08	05	18	\N
SALCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1070	08	05	19	\N
SAN MARCOS DE ROCCHAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1071	08	05	20	\N
SURCUBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1072	08	05	23	\N
TINTAY PUNCU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1073	08	05	25	\N
SALCAHUASI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1074	08	05	26	\N
AYAVI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1075	08	06	01	\N
CORDOVA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1076	08	06	02	\N
HUAYACUNDO ARMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1077	08	06	03	\N
HUAYTARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1078	08	06	04	\N
LARAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1079	08	06	05	\N
OCOYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1080	08	06	06	\N
PILPICHACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1081	08	06	07	\N
QUERCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1082	08	06	08	\N
QUITO ARMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1083	08	06	09	\N
SAN ANTONIO DE CUSICANCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1084	08	06	10	\N
SAN FRANCISCO DE SANGAYAICO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1085	08	06	11	\N
SAN ISIDRO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1086	08	06	12	\N
SANTIAGO DE CHOCORVOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1087	08	06	13	\N
SANTIAGO DE QUIRAHUARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1088	08	06	14	\N
SANTO DOMINGO DE CAPILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1089	08	06	15	\N
TAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1090	08	06	16	\N
CHURCAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1091	08	07	01	\N
ANCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1092	08	07	02	\N
CHINCHIHUASI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1093	08	07	03	\N
EL CARMEN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1094	08	07	04	\N
LA MERCED	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1095	08	07	05	\N
LOCROJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1096	08	07	06	\N
PAUCARBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1097	08	07	07	\N
SAN MIGUEL DE MAYOC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1098	08	07	08	\N
SAN PEDRO DE CORIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1099	08	07	09	\N
PACHAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1100	08	07	10	\N
HUANUCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1101	09	01	01	\N
CHINCHAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1102	09	01	02	\N
CHURUBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1103	09	01	03	\N
MARGOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1104	09	01	04	\N
QUISQUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1105	09	01	05	\N
SAN FCO DE CAYRAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1106	09	01	06	\N
SAN PEDRO DE CHAULAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1107	09	01	07	\N
STA MARIA DEL VALLE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1108	09	01	08	\N
YARUMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1109	09	01	09	\N
AMARILIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1110	09	01	10	\N
PILLCO MARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1111	09	01	11	\N
AMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1112	09	02	01	\N
CAYNA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1113	09	02	02	\N
COLPAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1114	09	02	03	\N
CONCHAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1115	09	02	04	\N
HUACAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1116	09	02	05	\N
SAN FRANCISCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1117	09	02	06	\N
SAN RAFAEL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1118	09	02	07	\N
TOMAY KICHWA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1119	09	02	08	\N
LA UNION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1120	09	03	01	\N
CHUQUIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1121	09	03	07	\N
MARIAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1122	09	03	12	\N
PACHAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1123	09	03	14	\N
QUIVILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1124	09	03	16	\N
RIPAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1125	09	03	17	\N
SHUNQUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1126	09	03	21	\N
SILLAPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1127	09	03	22	\N
YANAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1128	09	03	23	\N
LLATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1129	09	04	01	\N
ARANCAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1130	09	04	02	\N
CHAVIN DE PARIARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1131	09	04	03	\N
JACAS GRANDE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1132	09	04	04	\N
JIRCAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1133	09	04	05	\N
MIRAFLORES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1134	09	04	06	\N
MONZON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1135	09	04	07	\N
PUNCHAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1136	09	04	08	\N
PUNOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1137	09	04	09	\N
SINGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1138	09	04	10	\N
TANTAMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1139	09	04	11	\N
HUACRACHUCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1140	09	05	01	\N
CHOLON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1141	09	05	02	\N
SAN BUENAVENTURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1142	09	05	05	\N
RUPA RUPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1143	09	06	01	\N
DANIEL ALOMIA ROBLES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1144	09	06	02	\N
HERMILIO VALDIZAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1145	09	06	03	\N
LUYANDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1146	09	06	04	\N
MARIANO DAMASO BERAUN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1147	09	06	05	\N
JOSE CRESPO Y CASTILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1148	09	06	06	\N
PANAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1149	09	07	01	\N
CHAGLLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1150	09	07	02	\N
MOLINO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1151	09	07	04	\N
UMARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1152	09	07	06	\N
HONORIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1153	09	08	01	\N
PUERTO INCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1154	09	08	02	\N
CODO DEL POZUZO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1155	09	08	03	\N
TOURNAVISTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1156	09	08	04	\N
YUYAPICHIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1157	09	08	05	\N
HUACAYBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1158	09	09	01	\N
PINRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1159	09	09	02	\N
CANCHABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1160	09	09	03	\N
COCHABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1161	09	09	04	\N
JESUS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1162	09	10	01	\N
BANOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1163	09	10	02	\N
SAN FRANCISCO DE ASIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1164	09	10	03	\N
QUEROPALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1165	09	10	04	\N
SAN MIGUEL DE CAURI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1166	09	10	05	\N
RONDOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1167	09	10	06	\N
JIVIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1168	09	10	07	\N
CHAVINILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1169	09	11	01	\N
APARICIO POMARES (CHUPAN)	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1170	09	11	02	\N
CAHUAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1171	09	11	03	\N
CHACABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1172	09	11	04	\N
JACAS CHICO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1173	09	11	05	\N
OBAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1174	09	11	06	\N
PAMPAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1175	09	11	07	\N
CHORAS                   	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1176	09	11	08	\N
ICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1177	10	01	01	\N
LA TINGUINA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1178	10	01	02	\N
LOS AQUIJES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1179	10	01	03	\N
PARCONA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1180	10	01	04	\N
PUEBLO NUEVO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1181	10	01	05	\N
SALAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1182	10	01	06	\N
SAN JOSE DE LOS MOLINOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1183	10	01	07	\N
SAN JUAN BAUTISTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1184	10	01	08	\N
SANTIAGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1185	10	01	09	\N
SUBTANJALLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1186	10	01	10	\N
YAUCA DEL ROSARIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1187	10	01	11	\N
TATE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1188	10	01	12	\N
PACHACUTEC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1189	10	01	13	\N
OCUCAJE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1190	10	01	14	\N
CHINCHA ALTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1191	10	02	01	\N
CHAVIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1192	10	02	02	\N
CHINCHA BAJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1193	10	02	03	\N
EL CARMEN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1194	10	02	04	\N
GROCIO PRADO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1195	10	02	05	\N
SAN PEDRO DE HUACARPANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1196	10	02	06	\N
SUNAMPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1197	10	02	07	\N
TAMBO DE MORA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1198	10	02	08	\N
ALTO LARAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1199	10	02	09	\N
PUEBLO NUEVO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1200	10	02	10	\N
SAN JUAN DE YANAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1201	10	02	11	\N
NAZCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1202	10	03	01	\N
CHANGUILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1203	10	03	02	\N
EL INGENIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1204	10	03	03	\N
MARCONA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1205	10	03	04	\N
VISTA ALEGRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1206	10	03	05	\N
PISCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1207	10	04	01	\N
HUANCANO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1208	10	04	02	\N
HUMAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1209	10	04	03	\N
INDEPENDENCIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1210	10	04	04	\N
PARACAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1211	10	04	05	\N
SAN ANDRES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1212	10	04	06	\N
SAN CLEMENTE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1213	10	04	07	\N
TUPAC AMARU INCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1214	10	04	08	\N
PALPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1215	10	05	01	\N
LLIPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1216	10	05	02	\N
RIO GRANDE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1217	10	05	03	\N
SANTA CRUZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1218	10	05	04	\N
TIBILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1219	10	05	05	\N
HUANCAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1220	11	01	01	\N
CARHUACALLANGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1221	11	01	03	\N
COLCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1222	11	01	04	\N
CULLHUAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1223	11	01	05	\N
CHACAPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1224	11	01	06	\N
CHICCHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1225	11	01	07	\N
CHILCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1226	11	01	08	\N
CHONGOS ALTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1227	11	01	09	\N
CHUPURO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1228	11	01	12	\N
EL TAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1229	11	01	13	\N
HUACRAPUQUIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1230	11	01	14	\N
HUALHUAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1231	11	01	16	\N
HUANCAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1232	11	01	18	\N
HUASICANCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1233	11	01	19	\N
HUAYUCACHI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1234	11	01	20	\N
INGENIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1235	11	01	21	\N
PARIAHUANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1236	11	01	22	\N
PILCOMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1237	11	01	23	\N
PUCARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1238	11	01	24	\N
QUICHUAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1239	11	01	25	\N
QUILCAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1240	11	01	26	\N
SAN AGUSTIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1241	11	01	27	\N
SAN JERONIMO DE TUNAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1242	11	01	28	\N
STO DOMINGO DE ACOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1243	11	01	31	\N
SANO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1244	11	01	32	\N
SAPALLANGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1245	11	01	33	\N
SICAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1246	11	01	34	\N
VIQUES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1247	11	01	36	\N
CONCEPCION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1248	11	02	01	\N
ACO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1249	11	02	02	\N
ANDAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1250	11	02	03	\N
COMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1251	11	02	04	\N
COCHAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1252	11	02	05	\N
CHAMBARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1253	11	02	06	\N
HEROINAS TOLEDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1254	11	02	07	\N
MANZANARES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1255	11	02	08	\N
MCAL CASTILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1256	11	02	09	\N
MATAHUASI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1257	11	02	10	\N
MITO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1258	11	02	11	\N
NUEVE DE JULIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1259	11	02	12	\N
ORCOTUNA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1260	11	02	13	\N
STA ROSA DE OCOPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1261	11	02	14	\N
SAN JOSE DE QUERO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1262	11	02	15	\N
JAUJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1263	11	03	01	\N
ACOLLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1264	11	03	02	\N
APATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1265	11	03	03	\N
ATAURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1266	11	03	04	\N
CANCHAILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1267	11	03	05	\N
EL MANTARO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1268	11	03	06	\N
HUAMALI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1269	11	03	07	\N
HUARIPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1270	11	03	08	\N
HUERTAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1271	11	03	09	\N
JANJAILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1272	11	03	10	\N
JULCAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1273	11	03	11	\N
LEONOR ORDONEZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1274	11	03	12	\N
LLOCLLAPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1275	11	03	13	\N
MARCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1276	11	03	14	\N
MASMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1277	11	03	15	\N
MOLINOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1278	11	03	16	\N
MONOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1279	11	03	17	\N
MUQUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1280	11	03	18	\N
MUQUIYAUYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1281	11	03	19	\N
PACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1282	11	03	20	\N
PACCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1283	11	03	21	\N
PANCAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1284	11	03	22	\N
PARCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1285	11	03	23	\N
POMACANCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1286	11	03	24	\N
RICRAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1287	11	03	25	\N
SAN LORENZO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1288	11	03	26	\N
SAN PEDRO DE CHUNAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1289	11	03	27	\N
SINCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1290	11	03	28	\N
TUNAN MARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1291	11	03	29	\N
YAULI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1292	11	03	30	\N
CURICACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1293	11	03	31	\N
MASMA CHICCHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1294	11	03	32	\N
SAUSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1295	11	03	33	\N
YAUYOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1296	11	03	34	\N
JUNIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1297	11	04	01	\N
CARHUAMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1298	11	04	02	\N
ONDORES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1299	11	04	03	\N
ULCUMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1300	11	04	04	\N
TARMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1301	11	05	01	\N
ACOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1302	11	05	02	\N
HUARICOLCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1303	11	05	03	\N
HUASAHUASI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1304	11	05	04	\N
LA UNION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1305	11	05	05	\N
PALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1306	11	05	06	\N
PALCAMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1307	11	05	07	\N
SAN PEDRO DE CAJAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1308	11	05	08	\N
TAPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1309	11	05	09	\N
LA OROYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1310	11	06	01	\N
CHACAPALPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1311	11	06	02	\N
HUAY HUAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1312	11	06	03	\N
MARCAPOMACOCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1313	11	06	04	\N
MOROCOCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1314	11	06	05	\N
PACCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1315	11	06	06	\N
STA BARBARA DE CARHUACAYAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1316	11	06	07	\N
SUITUCANCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1317	11	06	08	\N
YAULI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1318	11	06	09	\N
STA ROSA DE SACCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1319	11	06	10	\N
SATIPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1320	11	07	01	\N
COVIRIALI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1321	11	07	02	\N
LLAYLLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1322	11	07	03	\N
MAZAMARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1323	11	07	04	\N
PAMPA HERMOSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1324	11	07	05	\N
PANGOA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1325	11	07	06	\N
RIO NEGRO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1326	11	07	07	\N
RIO TAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1327	11	07	08	\N
CHANCHAMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1328	11	08	01	\N
SAN RAMON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1329	11	08	02	\N
VITOC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1330	11	08	03	\N
SAN LUIS DE SHUARO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1331	11	08	04	\N
PICHANAQUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1332	11	08	05	\N
PERENE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1333	11	08	06	\N
CHUPACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1334	11	09	01	\N
AHUAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1335	11	09	02	\N
CHONGOS BAJO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1336	11	09	03	\N
HUACHAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1337	11	09	04	\N
HUAMANCACA CHICO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1338	11	09	05	\N
SAN JUAN DE ISCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1339	11	09	06	\N
SAN JUAN DE JARPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1340	11	09	07	\N
TRES DE DICIEMBRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1341	11	09	08	\N
YANACANCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1342	11	09	09	\N
TRUJILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1343	12	01	01	\N
HUANCHACO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1344	12	01	02	\N
LAREDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1345	12	01	03	\N
MOCHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1346	12	01	04	\N
SALAVERRY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1347	12	01	05	\N
SIMBAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1348	12	01	06	\N
VICTOR LARCO HERRERA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1349	12	01	07	\N
POROTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1350	12	01	09	\N
EL PORVENIR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1351	12	01	10	\N
LA ESPERANZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1352	12	01	11	\N
FLORENCIA DE MORA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1353	12	01	12	\N
BOLIVAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1354	12	02	01	\N
BAMBAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1355	12	02	02	\N
CONDORMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1356	12	02	03	\N
LONGOTEA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1357	12	02	04	\N
UCUNCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1358	12	02	05	\N
UCHUMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1359	12	02	06	\N
HUAMACHUCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1360	12	03	01	\N
COCHORCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1361	12	03	02	\N
CURGOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1362	12	03	03	\N
CHUGAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1363	12	03	04	\N
MARCABAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1364	12	03	05	\N
SANAGORAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1365	12	03	06	\N
SARIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1366	12	03	07	\N
SARTIMBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1367	12	03	08	\N
OTUZCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1368	12	04	01	\N
AGALLPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1369	12	04	02	\N
CHARAT	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1370	12	04	03	\N
HUARANCHAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1371	12	04	04	\N
LA CUESTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1372	12	04	05	\N
PARANDAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1373	12	04	08	\N
SALPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1374	12	04	09	\N
SINSICAP	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1375	12	04	10	\N
USQUIL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1376	12	04	11	\N
MACHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1377	12	04	13	\N
SAN PEDRO DE LLOC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1378	12	05	01	\N
GUADALUPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1379	12	05	03	\N
JEQUETEPEQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1380	12	05	04	\N
PACASMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1381	12	05	06	\N
SAN JOSE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1382	12	05	08	\N
TAYABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1383	12	06	01	\N
BULDIBUYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1384	12	06	02	\N
CHILLIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1385	12	06	03	\N
HUAYLILLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1386	12	06	04	\N
HUANCASPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1387	12	06	05	\N
HUAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1388	12	06	06	\N
ONGON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1389	12	06	07	\N
PARCOY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1390	12	06	08	\N
PATAZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1391	12	06	09	\N
PIAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1392	12	06	10	\N
TAURIJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1393	12	06	11	\N
URPAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1394	12	06	12	\N
SANTIAGO DE CHALLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1395	12	06	13	\N
SANTIAGO DE CHUCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1396	12	07	01	\N
CACHICADAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1397	12	07	02	\N
MOLLEBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1398	12	07	03	\N
MOLLEPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1399	12	07	04	\N
QUIRUVILCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1400	12	07	05	\N
SANTA CRUZ DE CHUCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1401	12	07	06	\N
SITABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1402	12	07	07	\N
ANGASMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1403	12	07	08	\N
ASCOPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1404	12	08	01	\N
CHICAMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1405	12	08	02	\N
CHOCOPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1406	12	08	03	\N
SANTIAGO DE CAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1407	12	08	04	\N
MAGDALENA DE CAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1408	12	08	05	\N
PAIJAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1409	12	08	06	\N
RAZURI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1410	12	08	07	\N
CASA GRANDE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1411	12	08	08	\N
CHEPEN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1412	12	09	01	\N
PACANGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1413	12	09	02	\N
PUEBLO NUEVO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1414	12	09	03	\N
JULCAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1415	12	10	01	\N
CARABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1416	12	10	02	\N
CALAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1417	12	10	03	\N
HUASO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1418	12	10	04	\N
CASCAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1419	12	11	01	\N
LUCMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1420	12	11	02	\N
MARMOT	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1421	12	11	03	\N
SAYAPULLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1422	12	11	04	\N
VIRU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1423	12	12	01	\N
CHAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1424	12	12	02	\N
GUADALUPITO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1425	12	12	03	\N
CHICLAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1426	13	01	01	\N
CHONGOYAPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1427	13	01	02	\N
ETEN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1428	13	01	03	\N
ETEN PUERTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1429	13	01	04	\N
LAGUNAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1430	13	01	05	\N
MONSEFU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1431	13	01	06	\N
NUEVA ARICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1432	13	01	07	\N
OYOTUN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1433	13	01	08	\N
PICSI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1434	13	01	09	\N
PIMENTEL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1435	13	01	10	\N
REQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1436	13	01	11	\N
JOSE LEONARDO ORTIZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1437	13	01	12	\N
SANTA ROSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1438	13	01	13	\N
SANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1439	13	01	14	\N
LA VICTORIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1440	13	01	15	\N
CAYALTI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1441	13	01	16	\N
PATAPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1442	13	01	17	\N
POMALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1443	13	01	18	\N
PUCALA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1444	13	01	19	\N
TUMAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1445	13	01	20	\N
FERRENAFE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1446	13	02	01	\N
INCAHUASI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1447	13	02	02	\N
CANARIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1448	13	02	03	\N
PITIPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1449	13	02	04	\N
PUEBLO NUEVO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1450	13	02	05	\N
MANUEL ANTONIO MESONES MURO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1451	13	02	06	\N
LAMBAYEQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1452	13	03	01	\N
CHOCHOPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1453	13	03	02	\N
ILLIMO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1454	13	03	03	\N
JAYANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1455	13	03	04	\N
MOCHUMI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1456	13	03	05	\N
MORROPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1457	13	03	06	\N
MOTUPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1458	13	03	07	\N
OLMOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1459	13	03	08	\N
PACORA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1460	13	03	09	\N
SALAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1461	13	03	10	\N
SAN JOSE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1462	13	03	11	\N
TUCUME	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1463	13	03	12	\N
LIMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1464	14	01	01	\N
ANCON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1465	14	01	02	\N
ATE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1466	14	01	03	\N
BRENA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1467	14	01	04	\N
CARABAYLLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1468	14	01	05	\N
COMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1469	14	01	06	\N
CHACLACAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1470	14	01	07	\N
CHORRILLOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1471	14	01	08	\N
LA VICTORIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1472	14	01	09	\N
LA MOLINA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1473	14	01	10	\N
LINCE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1474	14	01	11	\N
LURIGANCHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1475	14	01	12	\N
LURIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1476	14	01	13	\N
MAGDALENA DEL MAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1477	14	01	14	\N
MIRAFLORES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1478	14	01	15	\N
PACHACAMAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1479	14	01	16	\N
PUEBLO LIBRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1480	14	01	17	\N
PUCUSANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1481	14	01	18	\N
PUENTE PIEDRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1482	14	01	19	\N
PUNTA HERMOSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1483	14	01	20	\N
PUNTA NEGRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1484	14	01	21	\N
RIMAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1485	14	01	22	\N
SAN BARTOLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1486	14	01	23	\N
SAN ISIDRO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1487	14	01	24	\N
BARRANCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1488	14	01	25	\N
SAN MARTIN DE PORRES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1489	14	01	26	\N
SAN MIGUEL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1490	14	01	27	\N
STA MARIA DEL MAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1491	14	01	28	\N
SANTA ROSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1492	14	01	29	\N
SANTIAGO DE SURCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1493	14	01	30	\N
SURQUILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1494	14	01	31	\N
VILLA MARIA DEL TRIUNFO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1495	14	01	32	\N
JESUS MARIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1496	14	01	33	\N
INDEPENDENCIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1497	14	01	34	\N
EL AGUSTINO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1498	14	01	35	\N
SAN JUAN DE MIRAFLORES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1499	14	01	36	\N
SAN JUAN DE LURIGANCHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1500	14	01	37	\N
SAN LUIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1501	14	01	38	\N
CIENEGUILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1502	14	01	39	\N
SAN BORJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1503	14	01	40	\N
VILLA EL SALVADOR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1504	14	01	41	\N
LOS OLIVOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1505	14	01	42	\N
SANTA ANITA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1506	14	01	43	\N
CAJATAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1507	14	02	01	\N
COPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1508	14	02	05	\N
GORGOR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1509	14	02	06	\N
HUANCAPON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1510	14	02	07	\N
MANAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1511	14	02	08	\N
CANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1512	14	03	01	\N
ARAHUAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1513	14	03	02	\N
HUAMANTANGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1514	14	03	03	\N
HUAROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1515	14	03	04	\N
LACHAQUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1516	14	03	05	\N
SAN BUENAVENTURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1517	14	03	06	\N
SANTA ROSA DE QUIVES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1518	14	03	07	\N
SAN VICENTE DE CANETE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1519	14	04	01	\N
CALANGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1520	14	04	02	\N
CERRO AZUL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1521	14	04	03	\N
COAYLLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1522	14	04	04	\N
CHILCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1523	14	04	05	\N
IMPERIAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1524	14	04	06	\N
LUNAHUANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1525	14	04	07	\N
MALA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1526	14	04	08	\N
NUEVO IMPERIAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1527	14	04	09	\N
PACARAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1528	14	04	10	\N
QUILMANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1529	14	04	11	\N
SAN ANTONIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1530	14	04	12	\N
SAN LUIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1531	14	04	13	\N
SANTA CRUZ DE FLORES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1532	14	04	14	\N
ZUNIGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1533	14	04	15	\N
ASIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1534	14	04	16	\N
HUACHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1535	14	05	01	\N
AMBAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1536	14	05	02	\N
CALETA DE CARQUIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1537	14	05	04	\N
CHECRAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1538	14	05	05	\N
HUALMAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1539	14	05	06	\N
HUAURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1540	14	05	07	\N
LEONCIO PRADO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1541	14	05	08	\N
PACCHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1542	14	05	09	\N
SANTA LEONOR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1543	14	05	11	\N
SANTA MARIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1544	14	05	12	\N
SAYAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1545	14	05	13	\N
VEGUETA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1546	14	05	16	\N
MATUCANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1547	14	06	01	\N
ANTIOQUIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1548	14	06	02	\N
CALLAHUANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1549	14	06	03	\N
CARAMPOMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1550	14	06	04	\N
CASTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1551	14	06	05	\N
CUENCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1552	14	06	06	\N
CHICLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1553	14	06	07	\N
HUANZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1554	14	06	08	\N
HUAROCHIRI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1555	14	06	09	\N
LAHUAYTAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1556	14	06	10	\N
LANGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1557	14	06	11	\N
MARIATANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1558	14	06	12	\N
RICARDO PALMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1559	14	06	13	\N
SAN ANDRES DE TUPICOCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1560	14	06	14	\N
SAN ANTONIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1561	14	06	15	\N
SAN BARTOLOME	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1562	14	06	16	\N
SAN DAMIAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1563	14	06	17	\N
SANGALLAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1564	14	06	18	\N
SAN JUAN DE TANTARANCHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1565	14	06	19	\N
SAN LORENZO DE QUINTI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1566	14	06	20	\N
SAN MATEO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1567	14	06	21	\N
SAN MATEO DE OTAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1568	14	06	22	\N
SAN PEDRO DE HUANCAYRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1569	14	06	23	\N
SANTA CRUZ DE COCACHACRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1570	14	06	24	\N
SANTA EULALIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1571	14	06	25	\N
SANTIAGO DE ANCHUCAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1572	14	06	26	\N
SANTIAGO DE TUNA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1573	14	06	27	\N
SANTO DOMINGO DE LOS OLLEROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1574	14	06	28	\N
SURCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1575	14	06	29	\N
HUACHUPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1576	14	06	30	\N
LARAOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1577	14	06	31	\N
SAN JUAN DE IRIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1578	14	06	32	\N
YAUYOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1579	14	07	01	\N
ALIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1580	14	07	02	\N
AYAUCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1581	14	07	03	\N
AYAVIRI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1582	14	07	04	\N
AZANGARO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1583	14	07	05	\N
CACRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1584	14	07	06	\N
CARANIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1585	14	07	07	\N
COCHAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1586	14	07	08	\N
COLONIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1587	14	07	09	\N
CHOCOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1588	14	07	10	\N
HUAMPARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1589	14	07	11	\N
HUANCAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1590	14	07	12	\N
HUANGASCAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1591	14	07	13	\N
HUANTAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1592	14	07	14	\N
HUANEC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1593	14	07	15	\N
LARAOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1594	14	07	16	\N
LINCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1595	14	07	17	\N
MIRAFLORES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1596	14	07	18	\N
OMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1597	14	07	19	\N
QUINCHES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1598	14	07	20	\N
QUINOCAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1599	14	07	21	\N
SAN JOAQUIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1600	14	07	22	\N
SAN PEDRO DE PILAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1601	14	07	23	\N
TANTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1602	14	07	24	\N
TAURIPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1603	14	07	25	\N
TUPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1604	14	07	26	\N
TOMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1605	14	07	27	\N
VINAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1606	14	07	28	\N
VITIS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1607	14	07	29	\N
HONGOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1608	14	07	30	\N
MADEAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1609	14	07	31	\N
PUTINZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1610	14	07	32	\N
CATAHUASI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1611	14	07	33	\N
HUARAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1612	14	08	01	\N
ATAVILLOS ALTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1613	14	08	02	\N
ATAVILLOS BAJO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1614	14	08	03	\N
AUCALLAMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1615	14	08	04	\N
CHANCAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1616	14	08	05	\N
IHUARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1617	14	08	06	\N
LAMPIAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1618	14	08	07	\N
PACARAOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1619	14	08	08	\N
SAN MIGUEL DE ACOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1620	14	08	09	\N
VEINTISIETE DE NOVIEMBRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1621	14	08	10	\N
STA CRUZ DE ANDAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1622	14	08	11	\N
SUMBILCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1623	14	08	12	\N
BARRANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1624	14	09	01	\N
PARAMONGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1625	14	09	02	\N
PATIVILCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1626	14	09	03	\N
SUPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1627	14	09	04	\N
SUPE PUERTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1628	14	09	05	\N
OYON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1629	14	10	01	\N
NAVAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1630	14	10	02	\N
CAUJUL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1631	14	10	03	\N
ANDAJES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1632	14	10	04	\N
PACHANGARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1633	14	10	05	\N
COCHAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1634	14	10	06	\N
IQUITOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1635	15	01	01	\N
ALTO NANAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1636	15	01	02	\N
FERNANDO LORES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1637	15	01	03	\N
LAS AMAZONAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1638	15	01	04	\N
MAZAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1639	15	01	05	\N
NAPO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1640	15	01	06	\N
PUTUMAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1641	15	01	07	\N
TORRES CAUSANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1642	15	01	08	\N
INDIANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1643	15	01	10	\N
PUNCHANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1644	15	01	11	\N
BELEN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1645	15	01	12	\N
SAN JUAN BAUTISTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1646	15	01	13	\N
TNTE MANUEL CLAVERO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1647	15	01	14	\N
YURIMAGUAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1648	15	02	01	\N
BALSAPUERTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1649	15	02	02	\N
JEBEROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1650	15	02	05	\N
LAGUNAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1651	15	02	06	\N
SANTA CRUZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1652	15	02	10	\N
TNTE CESAR LOPEZ ROJAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1653	15	02	11	\N
NAUTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1654	15	03	01	\N
PARINARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1655	15	03	02	\N
TIGRE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1656	15	03	03	\N
URARINAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1657	15	03	04	\N
TROMPETEROS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1658	15	03	05	\N
REQUENA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1659	15	04	01	\N
ALTO TAPICHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1660	15	04	02	\N
CAPELO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1661	15	04	03	\N
EMILIO SAN MARTIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1662	15	04	04	\N
MAQUIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1663	15	04	05	\N
PUINAHUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1664	15	04	06	\N
SAQUENA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1665	15	04	07	\N
SOPLIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1666	15	04	08	\N
TAPICHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1667	15	04	09	\N
JENARO HERRERA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1668	15	04	10	\N
YAQUERANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1669	15	04	11	\N
CONTAMANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1670	15	05	01	\N
VARGAS GUERRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1671	15	05	02	\N
PADRE MARQUEZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1672	15	05	03	\N
PAMPA HERMOZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1673	15	05	04	\N
SARAYACU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1674	15	05	05	\N
INAHUAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1675	15	05	06	\N
MARISCAL RAMON CASTILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1676	15	06	01	\N
PEBAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1677	15	06	02	\N
YAVARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1678	15	06	03	\N
SAN PABLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1679	15	06	04	\N
BARRANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1680	15	07	01	\N
ANDOAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1681	15	07	02	\N
CAHUAPANAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1682	15	07	03	\N
MANSERICHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1683	15	07	04	\N
MORONA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1684	15	07	05	\N
PASTAZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1685	15	07	06	\N
TAMBOPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1686	16	01	01	\N
INAMBARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1687	16	01	02	\N
LAS PIEDRAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1688	16	01	03	\N
LABERINTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1689	16	01	04	\N
MANU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1690	16	02	01	\N
FITZCARRALD	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1691	16	02	02	\N
MADRE DE DIOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1692	16	02	03	\N
HUEPETUHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1693	16	02	04	\N
INAPARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1694	16	03	01	\N
IBERIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1695	16	03	02	\N
TAHUAMANU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1696	16	03	03	\N
MOQUEGUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1697	17	01	01	\N
CARUMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1698	17	01	02	\N
CUCHUMBAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1699	17	01	03	\N
SAN CRISTOBAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1700	17	01	04	\N
TORATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1701	17	01	05	\N
SAMEGUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1702	17	01	06	\N
OMATE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1703	17	02	01	\N
COALAQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1704	17	02	02	\N
CHOJATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1705	17	02	03	\N
ICHUNA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1706	17	02	04	\N
LA CAPILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1707	17	02	05	\N
LLOQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1708	17	02	06	\N
MATALAQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1709	17	02	07	\N
PUQUINA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1710	17	02	08	\N
QUINISTAQUILLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1711	17	02	09	\N
UBINAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1712	17	02	10	\N
YUNGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1713	17	02	11	\N
ILO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1714	17	03	01	\N
EL ALGARROBAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1715	17	03	02	\N
PACOCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1716	17	03	03	\N
CHAUPIMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1717	18	01	01	\N
HUACHON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1718	18	01	03	\N
HUARIACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1719	18	01	04	\N
HUAYLLAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1720	18	01	05	\N
NINACACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1721	18	01	06	\N
PALLANCHACRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1722	18	01	07	\N
PAUCARTAMBO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1723	18	01	08	\N
SAN FCO DE ASIS DE YARUSYACAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1724	18	01	09	\N
SIMON BOLIVAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1725	18	01	10	\N
TICLACAYAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1726	18	01	11	\N
TINYAHUARCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1727	18	01	12	\N
VICCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1728	18	01	13	\N
YANACANCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1729	18	01	14	\N
YANAHUANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1730	18	02	01	\N
CHACAYAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1731	18	02	02	\N
GOYLLARISQUIZGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1732	18	02	03	\N
PAUCAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1733	18	02	04	\N
SAN PEDRO DE PILLAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1734	18	02	05	\N
SANTA ANA DE TUSI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1735	18	02	06	\N
TAPUC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1736	18	02	07	\N
VILCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1737	18	02	08	\N
OXAPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1738	18	03	01	\N
CHONTABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1739	18	03	02	\N
HUANCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1740	18	03	03	\N
PUERTO BERMUDEZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1741	18	03	04	\N
VILLA RICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1742	18	03	05	\N
POZUZO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1743	18	03	06	\N
PALCAZU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1744	18	03	07	\N
PIURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1745	19	01	01	\N
CASTILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1746	19	01	03	\N
CATACAOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1747	19	01	04	\N
LA ARENA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1748	19	01	05	\N
LA UNION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1749	19	01	06	\N
LAS LOMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1750	19	01	07	\N
TAMBO GRANDE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1751	19	01	09	\N
CURA MORI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1752	19	01	13	\N
EL TALLAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1753	19	01	14	\N
AYABACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1754	19	02	01	\N
FRIAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1755	19	02	02	\N
LAGUNAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1756	19	02	03	\N
MONTERO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1757	19	02	04	\N
PACAIPAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1758	19	02	05	\N
SAPILLICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1759	19	02	06	\N
SICCHEZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1760	19	02	07	\N
SUYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1761	19	02	08	\N
JILILI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1762	19	02	09	\N
PAIMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1763	19	02	10	\N
HUANCABAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1764	19	03	01	\N
CANCHAQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1765	19	03	02	\N
HUARMACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1766	19	03	03	\N
SONDOR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1767	19	03	04	\N
SONDORILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1768	19	03	05	\N
EL CARMEN DE LA FRONTERA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1769	19	03	06	\N
SAN MIGUEL DE EL FAIQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1770	19	03	07	\N
LALAQUIZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1771	19	03	08	\N
CHULUCANAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1772	19	04	01	\N
BUENOS AIRES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1773	19	04	02	\N
CHALACO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1774	19	04	03	\N
MORROPON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1775	19	04	04	\N
SALITRAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1776	19	04	05	\N
SANTA CATALINA DE MOSSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1777	19	04	06	\N
SANTO DOMINGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1778	19	04	07	\N
LA MATANZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1779	19	04	08	\N
YAMANGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1780	19	04	09	\N
SAN JUAN DE BIGOTE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1781	19	04	10	\N
PAITA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1782	19	05	01	\N
AMOTAPE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1783	19	05	02	\N
ARENAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1784	19	05	03	\N
LA HUACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1785	19	05	04	\N
PUEBLO NUEVO DE COLAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1786	19	05	05	\N
TAMARINDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1787	19	05	06	\N
VICHAYAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1788	19	05	07	\N
SULLANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1789	19	06	01	\N
BELLAVISTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1790	19	06	02	\N
LANCONES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1791	19	06	03	\N
MARCAVELICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1792	19	06	04	\N
MIGUEL CHECA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1793	19	06	05	\N
QUERECOTILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1794	19	06	06	\N
SALITRAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1795	19	06	07	\N
IGNACIO ESCUDERO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1796	19	06	08	\N
PARINAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1797	19	07	01	\N
EL ALTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1798	19	07	02	\N
LA BREA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1799	19	07	03	\N
LOBITOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1800	19	07	04	\N
MANCORA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1801	19	07	05	\N
LOS ORGANOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1802	19	07	06	\N
SECHURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1803	19	08	01	\N
VICE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1804	19	08	02	\N
BERNAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1805	19	08	03	\N
BELLAVISTA DE LA UNION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1806	19	08	04	\N
CRISTO NOS VALGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1807	19	08	05	\N
RINCONADA LLICUAR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1808	19	08	06	\N
PUNO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1809	20	01	01	\N
ACORA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1810	20	01	02	\N
ATUNCOLLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1811	20	01	03	\N
CAPACHICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1812	20	01	04	\N
COATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1813	20	01	05	\N
CHUCUITO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1814	20	01	06	\N
HUATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1815	20	01	07	\N
MANAZO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1816	20	01	08	\N
PAUCARCOLLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1817	20	01	09	\N
PICHACANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1818	20	01	10	\N
SAN ANTONIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1819	20	01	11	\N
TIQUILLACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1820	20	01	12	\N
VILQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1821	20	01	13	\N
PLATERIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1822	20	01	14	\N
AMANTANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1823	20	01	15	\N
AZANGARO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1824	20	02	01	\N
ACHAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1825	20	02	02	\N
ARAPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1826	20	02	03	\N
ASILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1827	20	02	04	\N
CAMINACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1828	20	02	05	\N
CHUPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1829	20	02	06	\N
JOSE DOMINGO CHOQUEHUANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1830	20	02	07	\N
MUNANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1831	20	02	08	\N
POTONI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1832	20	02	10	\N
SAMAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1833	20	02	12	\N
SAN ANTON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1834	20	02	13	\N
SAN JOSE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1835	20	02	14	\N
SAN JUAN DE SALINAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1836	20	02	15	\N
STGO DE PUPUJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1837	20	02	16	\N
TIRAPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1838	20	02	17	\N
MACUSANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1839	20	03	01	\N
AJOYANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1840	20	03	02	\N
AYAPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1841	20	03	03	\N
COASA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1842	20	03	04	\N
CORANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1843	20	03	05	\N
CRUCERO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1844	20	03	06	\N
ITUATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1845	20	03	07	\N
OLLACHEA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1846	20	03	08	\N
SAN GABAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1847	20	03	09	\N
USICAYOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1848	20	03	10	\N
JULI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1849	20	04	01	\N
DESAGUADERO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1850	20	04	02	\N
HUACULLANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1851	20	04	03	\N
PISACOMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1852	20	04	06	\N
POMATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1853	20	04	07	\N
ZEPITA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1854	20	04	10	\N
KELLUYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1855	20	04	12	\N
HUANCANE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1856	20	05	01	\N
COJATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1857	20	05	02	\N
INCHUPALLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1858	20	05	04	\N
PUSI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1859	20	05	06	\N
ROSASPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1860	20	05	07	\N
TARACO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1861	20	05	08	\N
VILQUE CHICO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1862	20	05	09	\N
HUATASANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1863	20	05	11	\N
LAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1864	20	06	01	\N
CABANILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1865	20	06	02	\N
CALAPUJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1866	20	06	03	\N
NICASIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1867	20	06	04	\N
OCUVIRI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1868	20	06	05	\N
PALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1869	20	06	06	\N
PARATIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1870	20	06	07	\N
PUCARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1871	20	06	08	\N
SANTA LUCIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1872	20	06	09	\N
VILAVILA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1873	20	06	10	\N
AYAVIRI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1874	20	07	01	\N
ANTAUTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1875	20	07	02	\N
CUPI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1876	20	07	03	\N
LLALLI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1877	20	07	04	\N
MACARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1878	20	07	05	\N
NUNOA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1879	20	07	06	\N
ORURILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1880	20	07	07	\N
SANTA ROSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1881	20	07	08	\N
UMACHIRI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1882	20	07	09	\N
SANDIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1883	20	08	01	\N
CUYOCUYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1884	20	08	03	\N
LIMBANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1885	20	08	04	\N
PHARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1886	20	08	05	\N
PATAMBUCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1887	20	08	06	\N
QUIACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1888	20	08	07	\N
SAN JUAN DEL ORO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1889	20	08	08	\N
YANAHUAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1890	20	08	10	\N
ALTO INAMBARI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1891	20	08	11	\N
SAN PEDRO DE PUTINA PUNCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1892	20	08	12	\N
JULIACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1893	20	09	01	\N
CABANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1894	20	09	02	\N
CABANILLAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1895	20	09	03	\N
CARACOTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1896	20	09	04	\N
YUNGUYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1897	20	10	01	\N
UNICACHI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1898	20	10	02	\N
ANAPIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1899	20	10	03	\N
COPANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1900	20	10	04	\N
CUTURAPI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1901	20	10	05	\N
OLLARAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1902	20	10	06	\N
TINICACHI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1903	20	10	07	\N
PUTINA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1904	20	11	01	\N
PEDRO VILCA APAZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1905	20	11	02	\N
QUILCA PUNCU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1906	20	11	03	\N
ANANEA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1907	20	11	04	\N
SINA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1908	20	11	05	\N
ILAVE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1909	20	12	01	\N
PILCUYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1910	20	12	02	\N
SANTA ROSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1911	20	12	03	\N
CAPASO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1912	20	12	04	\N
CONDURIRI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1913	20	12	05	\N
MOHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1914	20	13	01	\N
CONIMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1915	20	13	02	\N
TILALI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1916	20	13	03	\N
HUAYRAPATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1917	20	13	04	\N
MOYOBAMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1918	21	01	01	\N
CALZADA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1919	21	01	02	\N
HABANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1920	21	01	03	\N
JEPELACIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1921	21	01	04	\N
SORITOR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1922	21	01	05	\N
YANTALO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1923	21	01	06	\N
SAPOSOA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1924	21	02	01	\N
PISCOYACU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1925	21	02	02	\N
SACANCHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1926	21	02	03	\N
TINGO DE SAPOSOA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1927	21	02	04	\N
ALTO SAPOSOA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1928	21	02	05	\N
EL ESLABON	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1929	21	02	06	\N
LAMAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1930	21	03	01	\N
BARRANQUITA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1931	21	03	03	\N
CAYNARACHI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1932	21	03	04	\N
CUNUMBUQUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1933	21	03	05	\N
PINTO RECODO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1934	21	03	06	\N
RUMISAPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1935	21	03	07	\N
SHANAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1936	21	03	11	\N
TABALOSOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1937	21	03	13	\N
ZAPATERO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1938	21	03	14	\N
ALONSO DE ALVARADO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1939	21	03	15	\N
SAN ROQUE DE CUMBAZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1940	21	03	16	\N
JUANJUI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1941	21	04	01	\N
CAMPANILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1942	21	04	02	\N
HUICUNGO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1943	21	04	03	\N
PACHIZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1944	21	04	04	\N
PAJARILLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1945	21	04	05	\N
RIOJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1946	21	05	01	\N
POSIC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1947	21	05	02	\N
YORONGOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1948	21	05	03	\N
YURACYACU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1949	21	05	04	\N
NUEVA CAJAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1950	21	05	05	\N
ELIAS SOPLIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1951	21	05	06	\N
SAN FERNANDO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1952	21	05	07	\N
PARDO MIGUEL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1953	21	05	08	\N
AWAJUN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1954	21	05	09	\N
TARAPOTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1955	21	06	01	\N
ALBERTO LEVEAU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1956	21	06	02	\N
CACATACHI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1957	21	06	04	\N
CHAZUTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1958	21	06	06	\N
CHIPURANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1959	21	06	07	\N
EL PORVENIR	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1960	21	06	08	\N
HUIMBAYOC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1961	21	06	09	\N
JUAN GUERRA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1962	21	06	10	\N
MORALES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1963	21	06	11	\N
PAPAPLAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1964	21	06	12	\N
SAN ANTONIO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1965	21	06	16	\N
SAUCE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1966	21	06	19	\N
SHAPAJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1967	21	06	20	\N
LA BANDA DE SHILCAYO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1968	21	06	21	\N
BELLAVISTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1969	21	07	01	\N
SAN RAFAEL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1970	21	07	02	\N
SAN PABLO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1971	21	07	03	\N
ALTO BIAVO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1972	21	07	04	\N
HUALLAGA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1973	21	07	05	\N
BAJO BIAVO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1974	21	07	06	\N
TOCACHE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1975	21	08	01	\N
NUEVO PROGRESO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1976	21	08	02	\N
POLVORA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1977	21	08	03	\N
SHUNTE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1978	21	08	04	\N
UCHIZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1979	21	08	05	\N
PICOTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1980	21	09	01	\N
BUENOS AIRES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1981	21	09	02	\N
CASPIZAPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1982	21	09	03	\N
PILLUANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1983	21	09	04	\N
PUCACACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1984	21	09	05	\N
SAN CRISTOBAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1985	21	09	06	\N
SAN HILARION	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1986	21	09	07	\N
TINGO DE PONASA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1987	21	09	08	\N
TRES UNIDOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1988	21	09	09	\N
SHAMBOYACU	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1989	21	09	10	\N
SAN JOSE DE SISA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1990	21	10	01	\N
AGUA BLANCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1991	21	10	02	\N
SHATOJA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1992	21	10	03	\N
SAN MARTIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1993	21	10	04	\N
SANTA ROSA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1994	21	10	05	\N
TACNA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1995	22	01	01	\N
CALANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1996	22	01	02	\N
INCLAN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1997	22	01	04	\N
PACHIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1998	22	01	07	\N
PALCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	1999	22	01	08	\N
POCOLLAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2000	22	01	09	\N
SAMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2001	22	01	10	\N
ALTO DE LA ALIANZA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2002	22	01	11	\N
CIUDAD NUEVA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2003	22	01	12	\N
CORONEL GREGORIO ALBARRACIN L.ALFONSO UGARTE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2004	22	01	13	\N
TARATA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2005	22	02	01	\N
CHUCATAMANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2006	22	02	05	\N
ESTIQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2007	22	02	06	\N
ESTIQUE PAMPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2008	22	02	07	\N
SITAJARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2009	22	02	10	\N
SUSAPAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2010	22	02	11	\N
TARUCACHI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2011	22	02	12	\N
TICACO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2012	22	02	13	\N
LOCUMBA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2013	22	03	01	\N
ITE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2014	22	03	02	\N
ILABAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2015	22	03	03	\N
CANDARAVE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2016	22	04	01	\N
CAIRANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2017	22	04	02	\N
CURIBAYA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2018	22	04	03	\N
HUANUARA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2019	22	04	04	\N
QUILAHUANI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2020	22	04	05	\N
CAMILACA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2021	22	04	06	\N
TUMBES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2022	23	01	01	\N
CORRALES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2023	23	01	02	\N
LA CRUZ	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2024	23	01	03	\N
PAMPAS DE HOSPITAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2025	23	01	04	\N
SAN JACINTO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2026	23	01	05	\N
SAN JUAN DE LA VIRGEN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2027	23	01	06	\N
ZORRITOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2028	23	02	01	\N
CASITAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2029	23	02	02	\N
CANOAS DE PUNTA SAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2030	23	02	03	\N
ZARUMILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2031	23	03	01	\N
MATAPALO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2032	23	03	02	\N
PAPAYAL	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2033	23	03	03	\N
AGUAS VERDES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2034	23	03	04	\N
CALLAO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2035	24	01	01	\N
BELLAVISTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2036	24	01	02	\N
LA PUNTA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2037	24	01	03	\N
CARMEN DE LA LEGUA-REYNOSO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2038	24	01	04	\N
LA PERLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2039	24	01	05	\N
VENTANILLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2040	24	01	06	\N
CALLERIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2041	25	01	01	\N
YARINACOCHA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2042	25	01	02	\N
MASISEA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2043	25	01	03	\N
CAMPOVERDE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2044	25	01	04	\N
IPARIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2045	25	01	05	\N
NUEVA REQUENA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2046	25	01	06	\N
MANANTAY	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2047	25	01	07	\N
PADRE ABAD	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2048	25	02	01	\N
YRAZOLA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2049	25	02	02	\N
CURIMANA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2050	25	02	03	\N
RAIMONDI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2051	25	03	01	\N
TAHUANIA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2052	25	03	02	\N
YURUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2053	25	03	03	\N
SEPAHUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2054	25	03	04	\N
PURUS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2055	25	04	01	\N
AMAZONAS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	2	01	00	00	\N
ANCASH	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	4	02	00	00	\N
APURIMAC	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	6	03	00	00	\N
AREQUIPA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	8	04	00	00	\N
AYACUCHO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	10	05	00	00	\N
CAJAMARCA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	12	06	00	00	\N
CUSCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	14	07	00	00	\N
HUANCAVELICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	16	08	00	00	\N
HUANUCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	18	09	00	00	\N
ICA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	20	10	00	00	\N
JUNIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	23	11	00	00	\N
LA LIBERTAD	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	26	12	00	00	\N
LAMBAYEQUE	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	29	13	00	00	\N
LIMA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	32	14	00	00	\N
LORETO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	35	15	00	00	\N
MADRE DE DIOS	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	38	16	00	00	\N
MOQUEGUA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	41	17	00	00	\N
PASCO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	44	18	00	00	\N
PIURA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	47	19	00	00	\N
PUNO	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	50	20	00	00	\N
SAN MARTIN	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	53	21	00	00	\N
TACNA	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	56	22	00	00	\N
TUMBES	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	59	23	00	00	\N
UCAYALI	0	2024-09-07 13:05:46.182038	\N	\N	2024-09-07 13:05:46.182038	\N	\N	65	25	00	00	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1724806375363	CustomMigrationTemplate1724806375363
2	1725031042816	Angel1725031042816
3	1725714172096	Angel1725714172096
4	1725816425711	Angel1725816425711
5	1725818785303	Angel1725818785303
6	1725818893908	Angel1725818893908
7	1725922736726	Angel1725922736726
8	1725972862813	Angel1725972862813
9	1726104329126	Angel1726104329126
10	1726104379387	Angel1726104379387
11	1726191510660	Angel1726191510660
12	1726192937001	Angel1726192937001
13	1726414673085	Angel1726414673085
14	1726416769246	Angel1726416769246
15	1726434717271	Angel1726434717271
16	1726436264251	Angel1726436264251
17	1726438042439	Angel1726438042439
18	1726444471562	Angel1726444471562
19	1726528118377	Angel1726528118377
\.


--
-- Data for Name: accion; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.accion ("accionId", descripcion, accion, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
1	Mostrar	read	0	2024-09-12 00:42:46.766915	\N	\N	2024-09-12 00:42:46.766915	\N	\N
2	Editar	edit	0	2024-09-12 00:42:46.766915	\N	\N	2024-09-12 00:42:46.766915	\N	\N
3	Crear	create	0	2024-09-12 00:42:46.766915	\N	\N	2024-09-12 00:42:46.766915	\N	\N
4	Eliminar	delete	0	2024-09-12 00:42:46.766915	\N	\N	2024-09-12 00:42:46.766915	\N	\N
\.


--
-- Data for Name: config_email; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.config_email ("configEmailId", name, "user", pass, host, port, secure, "companyId") FROM stdin;
1	ANGEL MEZA	angelmn.dev@gmail.com	egja mopo fynz qssy	gmail	400	true	1
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.menu (descripcion, contenido, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "menuId") FROM stdin;
Administración	\N	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	1
Datos de la entidad	Entidad	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	2
Usuarios	Manage/ManageLogins	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	3
General	NULL	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	4
Inicio	Home/Index	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	5
Mantenimiento	NULL	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	6
Tupa	Mantenimiento/UOrganicasTupa	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	7
Personas	Mantenimiento/Personas	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	8
Sede	Mantenimiento/Sede	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	9
Unidad Orgánica	Mantenimiento/UnidadOrganica	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	10
Trámite	\N	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	11
Expedientes	Tramite/ExpedienteExterno	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	12
Correlativos	Mantenimiento/Correlativos	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	13
Bandeja de Entrada	Tramite/BandejaEntrada	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	14
Calendario	Mantenimiento/Calendario	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	15
Correlativos Unidades	Mantenimiento/CorrelativosUnidades	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	16
Documentos Internos	Tramite/DocumentosInternos	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	17
Expedientes MPV	Tramite/ExpedienteMPV	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	18
Roles	Manage/ManageRol	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	19
Parámetros	Mantenimiento/Parametros	0	2024-09-10 13:05:00.336574	\N	\N	2024-09-10 13:05:00.336574	\N	\N	20
\.


--
-- Data for Name: menu_accion; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.menu_accion ("menuId", "accionId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
1	1	0	2024-09-12 00:43:25.761463	\N	\N	2024-09-12 00:43:25.761463	\N	\N
2	1	0	2024-09-12 00:43:25.761463	\N	\N	2024-09-12 00:43:25.761463	\N	\N
3	1	0	2024-09-12 00:43:25.761463	\N	\N	2024-09-12 00:43:25.761463	\N	\N
1	2	0	2024-09-12 01:03:04.853184	\N	\N	2024-09-12 01:03:04.853184	\N	\N
\.


--
-- Data for Name: permiso_rol; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.permiso_rol ("rolId", "menuId", "accionId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
2	1	1	0	2024-09-13 02:07:21.163904	\N	\N	2024-09-13 02:07:21.163904	\N	\N
3	2	1	0	2024-09-13 02:10:00.379899	\N	\N	2024-09-13 02:10:00.379899	\N	\N
3	3	1	0	2024-09-13 02:10:00.379899	\N	\N	2024-09-13 02:10:00.379899	\N	\N
4	1	2	0	2024-09-13 02:10:21.542479	\N	\N	2024-09-13 02:10:21.542479	\N	\N
4	2	1	0	2024-09-13 02:10:21.542479	\N	\N	2024-09-13 02:10:21.542479	\N	\N
5	1	2	0	2024-09-13 12:10:43.349181	\N	\N	2024-09-13 12:10:43.349181	\N	\N
6	2	1	0	2024-09-13 12:24:37.402827	\N	\N	2024-09-13 12:24:37.402827	\N	\N
7	3	1	0	2024-09-13 12:50:15.16103	\N	\N	2024-09-13 12:50:15.16103	\N	\N
\.


--
-- Data for Name: permiso_usuario; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.permiso_usuario ("usuarioId", "menuId", "accionId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: permisos_menu; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.permisos_menu (ver, agregar, borrar, modificar, imprimir, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "menuId", "usuarioId") FROM stdin;
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.rol ("rolId", descripcion, detalle, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", interno, correlativo) FROM stdin;
2	PRUEBA DE TODO		0	2024-09-13 02:07:21.163904	\N	\N	2024-09-13 02:07:21.163904	\N	\N	f	f
3	ROL DE SEGUNDA PRUEBA		0	2024-09-13 02:10:00.379899	\N	\N	2024-09-13 02:10:00.379899	\N	\N	f	f
5	TE ESTAN LLAMDNO		0	2024-09-13 02:11:42.014912	\N	\N	2024-09-13 12:10:43.349181	\N	\N	f	f
6	OTRO ROL DE TODO		0	2024-09-13 12:24:37.402827	\N	\N	2024-09-13 12:24:37.402827	\N	\N	f	f
4	VAMOS PERU		1	2024-09-13 02:10:21.542479	\N	\N	2024-09-14 01:09:30.698799	\N	\N	f	f
7	todo en ndad		1	2024-09-13 12:50:15.16103	\N	\N	2024-09-14 01:13:18.245788	\N	\N	f	f
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.usuario ("audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "usuarioId", "personaId", "usuarioNombre", "rolId", clave, estado, avatar) FROM stdin;
0	2024-09-17 02:27:22.643098	\N	\N	2024-09-17 02:27:22.643098	\N	\N	20	2	ADMINISTRADOR	2	$2a$10$zQMDI2yG1OQxGRtZElvQCOBB7tAPLJTEGRAivMTIvM1/SBKTFTTwa	t	
\.


--
-- Data for Name: usuarios_u_organicas; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY sistema.usuarios_u_organicas ("usuarioId", "unidadId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: archivo_adjunto; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.archivo_adjunto (id, "relacionId", nombre, extension, "nombreFTP", ubicacion, contenido, origen, destinos, procesos, tipo, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: archivo_adjunto_mpv; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.archivo_adjunto_mpv (id, "relacionId", nombre, extension, "nombreFTP", ubicacion, contenido, origen, destinos, procesos, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: calendario; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.calendario ("calendarioId", title, start, "end", year, month, day, massive, "allDay", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", color, textcolor) FROM stdin;
\.


--
-- Data for Name: correlativo; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.correlativo (anio, correlativo, longitud, prefijo, "sedeId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "correlativoId", "tipoDocumentoId") FROM stdin;
\.


--
-- Data for Name: correlativo_unidad; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.correlativo_unidad (id, "unidadId", "documentoId", anio, correlativo, longitud, prefijo, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: documento_interno; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.documento_interno (id, "documentoId", "nroDocumento", anio, fecha, destinatarios, copias, referencia, contenido, asunto, adjuntos, "procesoReferenciaId", "origenId", "estadoId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: encargado_uo; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.encargado_uo (id, "personaId", "fInicio", "fFin", documento, "tipoDocId", "cargoId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "uoId") FROM stdin;
\.


--
-- Data for Name: expediente; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.expediente (id, "sedeId", "nroDocumento", cantidad, "tipoDocumentoId", asunto, descripcion, observaciones, "tipoTramiteId", "fechaLimite", "prioridadId", folio, monto, "fechaRegistro", "usuarioId", "remitenteId", "tipoExpedienteId", "procedimientoId", anio, "estadoId", referencia, "mpvId", "origenId", separado, "fechaRegularizado", correo, "personaRegistradorId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: expediente_mpv; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.expediente_mpv (id, "sedeId", "nroDocumento", cantidad, "tipoDocumentoId", asunto, descripcion, observaciones, "tipoTramiteId", "fechaLimite", "prioridadId", folio, monto, "fechaRegistro", "remitenteId", "tipoExpedienteId", "procedimientoId", anio, referencia, correo, "estadoId", motivo, "envioCorreo", "solicitudId", "personaRegistradorId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: expediente_vinculado; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.expediente_vinculado (id, "vinculoId", "expedienteId", "procesoId", fecha, "documentoId", documento, motivo, "usuarioId", activo, "referenciaId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: partida_presupuestal; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.partida_presupuestal (id, codigo, descripcion, estado, detalle, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: personas; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.personas (nombres, documento, direccion, email, contrasena, servidor, puerto, ssl, telefono, "docRep", "nombresRep", "apPatRep", "apMatRep", "emailConfirmado", token, "tokenExpiration", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "personaId", "apePaterno", "apeMaterno", "repLegal", "tipoPersonaId", "tipoDocumentoId") FROM stdin;
MIGUEL ANGEL	70354395	ICA	anme.code@gmail.com	\N	\N	\N	f	981104615	\N	\N	\N	\N	f	\N	\N	0	2024-09-15 22:16:41.485064	\N	\N	2024-09-15 22:16:41.485064	\N	\N	2	MEZA	NORBERTO	f	5	2
\.


--
-- Data for Name: procedimiento; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.procedimiento (id, "uOrganicaId", descripcion, plazo, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: proceso_tramite; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.proceso_tramite (id, "expedienteId", "origenId", "destinoId", etapa, orden, "referenciaId", "fRegistro", "fRecibido", "fAtencion", observaciones, motivo, leido, "fLeido", "estadoId", tramites, "tipoEnvioId", "documentoId", documento, folios, asunto, importancia, "usuarioCreaId", "usuarioRecibeId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: requisito; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.requisito (id, "expedienteId", "rubroId", cantidad, referencial, porcentaje, total, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: rubro; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.rubro (id, "procedimientoId", "partidaId", descripcion, tipo, monto, obligatorio, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: sede; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.sede ("sedeId", nombre, direccion, abreviacion, "ubigeoId", "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
2	Sede Principal	-	PRINC	1196	0	2024-09-08 18:04:37.557506	\N	\N	2024-09-08 18:04:37.557506	\N	\N
4	NUEVA SEDE	DIRECCIÓN\n	NUEVA	1193	0	2024-09-08 18:04:37.557506	\N	\N	2024-09-08 18:04:37.557506	\N	\N
5	CLINICA MUNICIPAL	AV. PRINCIPAL	CLIC	1193	0	2024-09-08 18:04:37.557506	\N	\N	2024-09-08 18:04:37.557506	\N	\N
\.


--
-- Data for Name: solicitud_mpv; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.solicitud_mpv (id, token, fecha, codigo, valido, "audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod") FROM stdin;
\.


--
-- Data for Name: unidad_organica; Type: TABLE DATA; Schema: tramite; Owner: postgres
--

COPY tramite.unidad_organica ("audAnulado", "audFechaReg", "audUsuarioReg", "audIpReg", "audFechaMod", "audUsuarioMod", "audIpMod", "unidadOrganicaId", abreviatura, nombre, estado, nivel, relacion, "sedeId", tupa, orden) FROM stdin;
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	6	GM	GERENCIA MUNICIPAL	t	2	111	2	1	\N
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	7	AL	ALCALDIA(DESPACHO)	f	1	0	2	1	\N
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	8	SG	OFICINA DE SECRETARIA GENERAL	f	3	24	2	1	\N
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	9	GAT	GERENCIA DE ADMINISTRACION TRIBUTARIA	f	3	24	2	1	\N
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	10	GDE	 GERENCIA DE DESARROLLO SOCIAL Y ECONOMICO	f	3	24	2	1	\N
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	11	GDU	GERENCIA DE DESARROLLO URBANO	f	3	24	2	1	\N
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	12	GSP	GERENCIA DE SERVICIOS PUBLICOS	f	3	24	2	1	\N
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	13	DRC	DIRECCION DE REGISTRO CIVIL	f	4	114	2	1	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	14	DOP	> DIRECCION DE OBRAS PUBLICAS Y LIQUIDACIONES	f	4	115	2	1	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	15	DOPC	DIRECCION DE OBRAS PRIVADA Y CATASTRO	f	4	115	2	1	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	16	DDC	DIRECCION DE DEFENSA CIVIL	f	4	115	2	1	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	17	DSS	DIRECCION DE SERVICIOS DE SANEAMIENTO	f	4	116	2	1	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	18	OAJ	OFICINA DE ASESORIA JURIDICA	f	3	24	2	1	\N
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	19	DTD	UNIDAD DE TRAMITE DOCUMENTARIO	f	4	112	2	0	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	20	DPS	DIRECCION DE PROGRAMAS SOCIALES	f	4	114	2	1	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	21	UII	UNIDAD DE IMAGEN INSTITUCIONAL	f	4	112	2	0	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	22	OA	OFICINA DE ADMINISTRACION	f	3	24	2	1	\N
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	23	UL	UNIDAD DE LOGISTICA	f	4	126	2	0	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	24	UC	UNIDAD DE CONTABILIDAD	f	4	126	2	0	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	25	UT	UNIDAD DE TESORERIA	f	4	126	2	0	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	26	UA	> UNIDAD DE ALMACEN	f	4	126	2	0	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	27	UA	> UNIDAD DE ALMACEN	f	4	126	2	0	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	28	RR.HH.	UNIDAD DE RECURSOS HUMANOS	f	4	126	2	0	24
0	2024-09-08 18:08:39.0723	\N	\N	2024-09-08 18:08:39.0723	\N	\N	29	PN	NOSE	f	2	111	2	1	\N
\.


--
-- Name: cargo_cargoId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."cargo_cargoId_seq"', 1, false);


--
-- Name: configuracion_configuracionId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."configuracion_configuracionId_seq"', 1, false);


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
-- Name: tipo_documento_tipoDocumentoId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."tipo_documento_tipoDocumentoId_seq"', 2, true);


--
-- Name: tipo_expediente_tipoExpedienteid_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."tipo_expediente_tipoExpedienteid_seq"', 1, false);


--
-- Name: tipo_persona_tipoPersonaId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."tipo_persona_tipoPersonaId_seq"', 5, true);


--
-- Name: ubigeo_ubigeoId_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."ubigeo_ubigeoId_seq"', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 19, true);


--
-- Name: accion_accionId_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('sistema."accion_accionId_seq"', 4, true);


--
-- Name: config_email_configEmailId_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('sistema."config_email_configEmailId_seq"', 1, true);


--
-- Name: menu_menuId_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('sistema."menu_menuId_seq"', 20, true);


--
-- Name: rol_rolId_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('sistema."rol_rolId_seq"', 7, true);


--
-- Name: usuario_usuarioId_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('sistema."usuario_usuarioId_seq"', 20, true);


--
-- Name: usuarios_u_organicas_usuarioId_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('sistema."usuarios_u_organicas_usuarioId_seq"', 1, false);


--
-- Name: archivo_adjunto_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.archivo_adjunto_id_seq', 1, false);


--
-- Name: archivo_adjunto_mpv_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.archivo_adjunto_mpv_id_seq', 1, false);


--
-- Name: calendario_calendarioId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."calendario_calendarioId_seq"', 1, false);


--
-- Name: correlativo_correlativoId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."correlativo_correlativoId_seq"', 1, false);


--
-- Name: correlativo_unidad_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.correlativo_unidad_id_seq', 1, false);


--
-- Name: documento_interno_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.documento_interno_id_seq', 1, false);


--
-- Name: encargado_uo_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.encargado_uo_id_seq', 1, false);


--
-- Name: encargado_uo_uoId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."encargado_uo_uoId_seq"', 1, false);


--
-- Name: expediente_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.expediente_id_seq', 1, false);


--
-- Name: expediente_mpv_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.expediente_mpv_id_seq', 1, false);


--
-- Name: expediente_vinculado_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.expediente_vinculado_id_seq', 1, false);


--
-- Name: partida_presupuestal_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.partida_presupuestal_id_seq', 1, false);


--
-- Name: personas_personaId_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite."personas_personaId_seq"', 2, true);


--
-- Name: procedimiento_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.procedimiento_id_seq', 1, false);


--
-- Name: proceso_tramite_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.proceso_tramite_id_seq', 1, false);


--
-- Name: requisito_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.requisito_id_seq', 1, false);


--
-- Name: rubro_id_seq; Type: SEQUENCE SET; Schema: tramite; Owner: postgres
--

SELECT pg_catalog.setval('tramite.rubro_id_seq', 1, false);


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

SELECT pg_catalog.setval('tramite."unidad_organica_unidadOrganicaId_seq"', 29, true);


--
-- Name: tipo_expediente PK_0d76f6130fff814631308f46026; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_expediente
    ADD CONSTRAINT "PK_0d76f6130fff814631308f46026" PRIMARY KEY ("tipoExpedienteid");


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
-- Name: tipo_persona PK_87068d7c3e47727cc24566d131a; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.tipo_persona
    ADD CONSTRAINT "PK_87068d7c3e47727cc24566d131a" PRIMARY KEY ("tipoPersonaId");


--
-- Name: ubigeo PK_a6f9160c215e6ec0964be7b919c; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa.ubigeo
    ADD CONSTRAINT "PK_a6f9160c215e6ec0964be7b919c" PRIMARY KEY ("ubigeoId");


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
-- Name: usuarios_u_organicas PK_f5377fbc24d601cee3c694dca76; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.usuarios_u_organicas
    ADD CONSTRAINT "PK_f5377fbc24d601cee3c694dca76" PRIMARY KEY ("usuarioId");


--
-- Name: rol PK_facc3d8a3785a82fbae5b77ed01; Type: CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY sistema.rol
    ADD CONSTRAINT "PK_facc3d8a3785a82fbae5b77ed01" PRIMARY KEY ("rolId");


--
-- Name: expediente_mpv PK_05633a64fe1ce7f599927860a91; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente_mpv
    ADD CONSTRAINT "PK_05633a64fe1ce7f599927860a91" PRIMARY KEY (id);


--
-- Name: unidad_organica PK_0d3df3f35028d8653c39d0a5dd1; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.unidad_organica
    ADD CONSTRAINT "PK_0d3df3f35028d8653c39d0a5dd1" PRIMARY KEY ("unidadOrganicaId");


--
-- Name: procedimiento PK_290c2cf23959a62f3971c5295a3; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.procedimiento
    ADD CONSTRAINT "PK_290c2cf23959a62f3971c5295a3" PRIMARY KEY (id);


--
-- Name: sede PK_3c324ca6751ed090225a933b8f4; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.sede
    ADD CONSTRAINT "PK_3c324ca6751ed090225a933b8f4" PRIMARY KEY ("sedeId");


--
-- Name: personas PK_470c85d09b2137727bd7f51c952; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.personas
    ADD CONSTRAINT "PK_470c85d09b2137727bd7f51c952" PRIMARY KEY ("personaId");


--
-- Name: proceso_tramite PK_4807f4d31eaa456790c87deb2fd; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.proceso_tramite
    ADD CONSTRAINT "PK_4807f4d31eaa456790c87deb2fd" PRIMARY KEY (id);


--
-- Name: correlativo PK_4a37027cfba8d3f2055b955ab1b; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo
    ADD CONSTRAINT "PK_4a37027cfba8d3f2055b955ab1b" PRIMARY KEY ("correlativoId");


--
-- Name: documento_interno PK_5e000302e244dbd11fe251d705b; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.documento_interno
    ADD CONSTRAINT "PK_5e000302e244dbd11fe251d705b" PRIMARY KEY (id);


--
-- Name: solicitud_mpv PK_605cdf40b66db9fd320f407672d; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.solicitud_mpv
    ADD CONSTRAINT "PK_605cdf40b66db9fd320f407672d" PRIMARY KEY (id);


--
-- Name: expediente PK_62a450e7494894059223c5d223b; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.expediente
    ADD CONSTRAINT "PK_62a450e7494894059223c5d223b" PRIMARY KEY (id);


--
-- Name: archivo_adjunto PK_73899c5938ca83b6ccf54ddcf88; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.archivo_adjunto
    ADD CONSTRAINT "PK_73899c5938ca83b6ccf54ddcf88" PRIMARY KEY (id);


--
-- Name: archivo_adjunto_mpv PK_8ae21471b43257a6999bec2da1f; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.archivo_adjunto_mpv
    ADD CONSTRAINT "PK_8ae21471b43257a6999bec2da1f" PRIMARY KEY (id);


--
-- Name: requisito PK_94cf717715ddf9d0ddc8e4b704f; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.requisito
    ADD CONSTRAINT "PK_94cf717715ddf9d0ddc8e4b704f" PRIMARY KEY (id);


--
-- Name: partida_presupuestal PK_99fbd89a56409df5e1a37f792e3; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.partida_presupuestal
    ADD CONSTRAINT "PK_99fbd89a56409df5e1a37f792e3" PRIMARY KEY (id);


--
-- Name: correlativo_unidad PK_9bc3a0037563b96154ea5deb342; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo_unidad
    ADD CONSTRAINT "PK_9bc3a0037563b96154ea5deb342" PRIMARY KEY (id);


--
-- Name: rubro PK_a535543d69343eea7cf4ec9b6cf; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.rubro
    ADD CONSTRAINT "PK_a535543d69343eea7cf4ec9b6cf" PRIMARY KEY (id);


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
-- Name: encargado_uo PK_f478540059e8d19333c6f6de9cc; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.encargado_uo
    ADD CONSTRAINT "PK_f478540059e8d19333c6f6de9cc" PRIMARY KEY (id, "uoId");


--
-- Name: personas UQ_8fc56f72924ee1cf3181f8ea937; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.personas
    ADD CONSTRAINT "UQ_8fc56f72924ee1cf3181f8ea937" UNIQUE (documento);


--
-- Name: correlativo UQ_ee396e3403f03cb12cfb8edb29d; Type: CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo
    ADD CONSTRAINT "UQ_ee396e3403f03cb12cfb8edb29d" UNIQUE ("tipoDocumentoId");


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
-- Name: sede FK_191cf83351aaa0fbdb50981c207; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.sede
    ADD CONSTRAINT "FK_191cf83351aaa0fbdb50981c207" FOREIGN KEY ("ubigeoId") REFERENCES empresa.ubigeo("ubigeoId");


--
-- Name: personas FK_226c990e981ebfcdd0331ea7d40; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.personas
    ADD CONSTRAINT "FK_226c990e981ebfcdd0331ea7d40" FOREIGN KEY ("tipoPersonaId") REFERENCES empresa.tipo_persona("tipoPersonaId");


--
-- Name: unidad_organica FK_3121580a6d8efc9a0fcf7fae7ad; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.unidad_organica
    ADD CONSTRAINT "FK_3121580a6d8efc9a0fcf7fae7ad" FOREIGN KEY ("sedeId") REFERENCES tramite.sede("sedeId");


--
-- Name: correlativo FK_699302d51d0ce1358471af1e481; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo
    ADD CONSTRAINT "FK_699302d51d0ce1358471af1e481" FOREIGN KEY ("sedeId") REFERENCES tramite.sede("sedeId");


--
-- Name: correlativo FK_ee396e3403f03cb12cfb8edb29d; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.correlativo
    ADD CONSTRAINT "FK_ee396e3403f03cb12cfb8edb29d" FOREIGN KEY ("tipoDocumentoId") REFERENCES empresa.tipo_documento("tipoDocumentoId");


--
-- Name: personas FK_f6e02a9b6af249fd75d33131e58; Type: FK CONSTRAINT; Schema: tramite; Owner: postgres
--

ALTER TABLE ONLY tramite.personas
    ADD CONSTRAINT "FK_f6e02a9b6af249fd75d33131e58" FOREIGN KEY ("tipoDocumentoId") REFERENCES empresa.tipo_documento("tipoDocumentoId");


--
-- PostgreSQL database dump complete
--

