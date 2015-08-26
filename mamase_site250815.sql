--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE easy_thumbnails_source OWNER TO postgres;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_source_id_seq OWNER TO postgres;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE easy_thumbnails_thumbnail OWNER TO postgres;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_thumbnail_id_seq OWNER TO postgres;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE easy_thumbnails_thumbnaildimensions OWNER TO postgres;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_thumbnaildimensions_id_seq OWNER TO postgres;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: essay_essay_question; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE essay_essay_question (
    question_ptr_id integer NOT NULL
);


ALTER TABLE essay_essay_question OWNER TO postgres;

--
-- Name: event_eventindexpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_eventindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL
);


ALTER TABLE event_eventindexpage OWNER TO postgres;

--
-- Name: event_eventindexrelatedlink; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_eventindexrelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE event_eventindexrelatedlink OWNER TO postgres;

--
-- Name: event_eventindexrelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE event_eventindexrelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE event_eventindexrelatedlink_id_seq OWNER TO postgres;

--
-- Name: event_eventindexrelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE event_eventindexrelatedlink_id_seq OWNED BY event_eventindexrelatedlink.id;


--
-- Name: event_eventpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_eventpage (
    page_ptr_id integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    body text NOT NULL,
    location text NOT NULL,
    maps_url character varying(200) NOT NULL,
    cost integer NOT NULL,
    category_id integer,
    main_image_id integer
);


ALTER TABLE event_eventpage OWNER TO postgres;

--
-- Name: event_eventpagetag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_eventpagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE event_eventpagetag OWNER TO postgres;

--
-- Name: event_eventpagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE event_eventpagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE event_eventpagetag_id_seq OWNER TO postgres;

--
-- Name: event_eventpagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE event_eventpagetag_id_seq OWNED BY event_eventpagetag.id;


--
-- Name: filer_clipboard; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE filer_clipboard (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE filer_clipboard OWNER TO postgres;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filer_clipboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_clipboard_id_seq OWNER TO postgres;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filer_clipboard_id_seq OWNED BY filer_clipboard.id;


--
-- Name: filer_clipboarditem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE filer_clipboarditem (
    id integer NOT NULL,
    clipboard_id integer NOT NULL,
    file_id integer NOT NULL
);


ALTER TABLE filer_clipboarditem OWNER TO postgres;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filer_clipboarditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_clipboarditem_id_seq OWNER TO postgres;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filer_clipboarditem_id_seq OWNED BY filer_clipboarditem.id;


--
-- Name: filer_file; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE filer_file (
    id integer NOT NULL,
    file character varying(255),
    _file_size integer,
    sha1 character varying(40) NOT NULL,
    has_all_mandatory_data boolean NOT NULL,
    original_filename character varying(255),
    name character varying(255) NOT NULL,
    description text,
    uploaded_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    is_public boolean NOT NULL,
    folder_id integer,
    owner_id integer,
    polymorphic_ctype_id integer
);


ALTER TABLE filer_file OWNER TO postgres;

--
-- Name: filer_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filer_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_file_id_seq OWNER TO postgres;

--
-- Name: filer_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filer_file_id_seq OWNED BY filer_file.id;


--
-- Name: filer_folder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE filer_folder (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    uploaded_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    owner_id integer,
    parent_id integer,
    CONSTRAINT filer_folder_level_check CHECK ((level >= 0)),
    CONSTRAINT filer_folder_lft_check CHECK ((lft >= 0)),
    CONSTRAINT filer_folder_rght_check CHECK ((rght >= 0)),
    CONSTRAINT filer_folder_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE filer_folder OWNER TO postgres;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filer_folder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_folder_id_seq OWNER TO postgres;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filer_folder_id_seq OWNED BY filer_folder.id;


--
-- Name: filer_folderpermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE filer_folderpermission (
    id integer NOT NULL,
    type smallint NOT NULL,
    everybody boolean NOT NULL,
    can_edit smallint,
    can_read smallint,
    can_add_children smallint,
    folder_id integer,
    group_id integer,
    user_id integer
);


ALTER TABLE filer_folderpermission OWNER TO postgres;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filer_folderpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filer_folderpermission_id_seq OWNER TO postgres;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filer_folderpermission_id_seq OWNED BY filer_folderpermission.id;


--
-- Name: filer_image; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE filer_image (
    file_ptr_id integer NOT NULL,
    _height integer,
    _width integer,
    date_taken timestamp with time zone,
    default_alt_text character varying(255),
    default_caption character varying(255),
    author character varying(255),
    must_always_publish_author_credit boolean NOT NULL,
    must_always_publish_copyright boolean NOT NULL,
    subject_location character varying(64)
);


ALTER TABLE filer_image OWNER TO postgres;

--
-- Name: gallery_gallery; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE gallery_gallery (
    page_ptr_id integer NOT NULL,
    image1_id integer,
    image2_id integer,
    image3_id integer,
    image4_id integer,
    image5_id integer,
    image6_id integer,
    image1_caption character varying(255) NOT NULL,
    image2_caption character varying(255) NOT NULL,
    image3_caption character varying(255) NOT NULL,
    image4_caption character varying(255) NOT NULL,
    image5_caption character varying(255) NOT NULL,
    image6_caption character varying(255) NOT NULL
);


ALTER TABLE gallery_gallery OWNER TO postgres;

--
-- Name: galleryapp_gallery; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE galleryapp_gallery (
    page_ptr_id integer NOT NULL,
    gallery_slug character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE galleryapp_gallery OWNER TO postgres;

--
-- Name: galleryapp_image; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE galleryapp_image (
    page_ptr_id integer NOT NULL,
    image_slug character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    date date NOT NULL,
    gallery_id character varying(50)
);


ALTER TABLE galleryapp_image OWNER TO postgres;

--
-- Name: home_homepage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE home_homepage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE home_homepage OWNER TO postgres;

--
-- Name: mamasemedia_mediapage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mamasemedia_mediapage (
    page_ptr_id integer NOT NULL,
    description text NOT NULL,
    author character varying(255) NOT NULL,
    date_created date NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE mamasemedia_mediapage OWNER TO postgres;

--
-- Name: mamasemedia_mediapagerelatedlink; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mamasemedia_mediapagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    embedded_link character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    image_id integer,
    page_id integer NOT NULL
);


ALTER TABLE mamasemedia_mediapagerelatedlink OWNER TO postgres;

--
-- Name: mamasemedia_mediapagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mamasemedia_mediapagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mamasemedia_mediapagerelatedlink_id_seq OWNER TO postgres;

--
-- Name: mamasemedia_mediapagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mamasemedia_mediapagerelatedlink_id_seq OWNED BY mamasemedia_mediapagerelatedlink.id;


--
-- Name: multichoice_answer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE multichoice_answer (
    id integer NOT NULL,
    question_id integer NOT NULL,
    content character varying(1000) NOT NULL,
    correct boolean NOT NULL
);


ALTER TABLE multichoice_answer OWNER TO postgres;

--
-- Name: multichoice_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE multichoice_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE multichoice_answer_id_seq OWNER TO postgres;

--
-- Name: multichoice_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE multichoice_answer_id_seq OWNED BY multichoice_answer.id;


--
-- Name: multichoice_mcquestion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE multichoice_mcquestion (
    question_ptr_id integer NOT NULL,
    answer_order character varying(30)
);


ALTER TABLE multichoice_mcquestion OWNER TO postgres;

--
-- Name: news_categorypage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE news_categorypage (
    page_ptr_id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text NOT NULL
);


ALTER TABLE news_categorypage OWNER TO postgres;

--
-- Name: news_informationpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE news_informationpage (
    page_ptr_id integer NOT NULL,
    date date NOT NULL,
    body text NOT NULL
);


ALTER TABLE news_informationpage OWNER TO postgres;

--
-- Name: news_newsindexpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE news_newsindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL
);


ALTER TABLE news_newsindexpage OWNER TO postgres;

--
-- Name: news_newsindexrelatedlink; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE news_newsindexrelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE news_newsindexrelatedlink OWNER TO postgres;

--
-- Name: news_newsindexrelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE news_newsindexrelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE news_newsindexrelatedlink_id_seq OWNER TO postgres;

--
-- Name: news_newsindexrelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE news_newsindexrelatedlink_id_seq OWNED BY news_newsindexrelatedlink.id;


--
-- Name: news_newspage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE news_newspage (
    page_ptr_id integer NOT NULL,
    date date NOT NULL,
    intro text NOT NULL,
    body text NOT NULL,
    category_id integer,
    main_image_id integer,
    link_document_id integer
);


ALTER TABLE news_newspage OWNER TO postgres;

--
-- Name: news_newspagetag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE news_newspagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE news_newspagetag OWNER TO postgres;

--
-- Name: news_newspagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE news_newspagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE news_newspagetag_id_seq OWNER TO postgres;

--
-- Name: news_newspagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE news_newspagetag_id_seq OWNED BY news_newspagetag.id;


--
-- Name: news_nocommentpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE news_nocommentpage (
    page_ptr_id integer NOT NULL,
    date date NOT NULL,
    intro text NOT NULL,
    body text NOT NULL,
    category_id integer,
    link_document_id integer
);


ALTER TABLE news_nocommentpage OWNER TO postgres;

--
-- Name: partners_partnerindexpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE partners_partnerindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL
);


ALTER TABLE partners_partnerindexpage OWNER TO postgres;

--
-- Name: partners_partnerlogo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE partners_partnerlogo (
    id integer NOT NULL,
    partner_logo character varying(100) NOT NULL,
    title character varying(255),
    url character varying(200) NOT NULL
);


ALTER TABLE partners_partnerlogo OWNER TO postgres;

--
-- Name: partners_partnerlogo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE partners_partnerlogo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE partners_partnerlogo_id_seq OWNER TO postgres;

--
-- Name: partners_partnerlogo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE partners_partnerlogo_id_seq OWNED BY partners_partnerlogo.id;


--
-- Name: partners_partnerpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE partners_partnerpage (
    page_ptr_id integer NOT NULL,
    bio text NOT NULL,
    main_image_id integer,
    website character varying(100)
);


ALTER TABLE partners_partnerpage OWNER TO postgres;

--
-- Name: quiz_category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quiz_category (
    id integer NOT NULL,
    category character varying(250)
);


ALTER TABLE quiz_category OWNER TO postgres;

--
-- Name: quiz_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quiz_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quiz_category_id_seq OWNER TO postgres;

--
-- Name: quiz_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE quiz_category_id_seq OWNED BY quiz_category.id;


--
-- Name: quiz_progress; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quiz_progress (
    id integer NOT NULL,
    user_id integer NOT NULL,
    score character varying(1024) NOT NULL
);


ALTER TABLE quiz_progress OWNER TO postgres;

--
-- Name: quiz_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quiz_progress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quiz_progress_id_seq OWNER TO postgres;

--
-- Name: quiz_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE quiz_progress_id_seq OWNED BY quiz_progress.id;


--
-- Name: quiz_question; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quiz_question (
    id integer NOT NULL,
    category_id integer,
    sub_category_id integer,
    figure character varying(100),
    content character varying(1000) NOT NULL,
    explanation text NOT NULL
);


ALTER TABLE quiz_question OWNER TO postgres;

--
-- Name: quiz_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quiz_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quiz_question_id_seq OWNER TO postgres;

--
-- Name: quiz_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE quiz_question_id_seq OWNED BY quiz_question.id;


--
-- Name: quiz_question_quiz; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quiz_question_quiz (
    id integer NOT NULL,
    question_id integer NOT NULL,
    quiz_id integer NOT NULL
);


ALTER TABLE quiz_question_quiz OWNER TO postgres;

--
-- Name: quiz_question_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quiz_question_quiz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quiz_question_quiz_id_seq OWNER TO postgres;

--
-- Name: quiz_question_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE quiz_question_quiz_id_seq OWNED BY quiz_question_quiz.id;


--
-- Name: quiz_quiz; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quiz_quiz (
    id integer NOT NULL,
    title character varying(60) NOT NULL,
    description text NOT NULL,
    url character varying(60) NOT NULL,
    category_id integer,
    random_order boolean NOT NULL,
    max_questions integer,
    answers_at_end boolean NOT NULL,
    exam_paper boolean NOT NULL,
    single_attempt boolean NOT NULL,
    pass_mark smallint NOT NULL,
    success_text text NOT NULL,
    fail_text text NOT NULL,
    draft boolean NOT NULL,
    CONSTRAINT quiz_quiz_max_questions_check CHECK ((max_questions >= 0))
);


ALTER TABLE quiz_quiz OWNER TO postgres;

--
-- Name: quiz_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quiz_quiz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quiz_quiz_id_seq OWNER TO postgres;

--
-- Name: quiz_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE quiz_quiz_id_seq OWNED BY quiz_quiz.id;


--
-- Name: quiz_sitting; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quiz_sitting (
    id integer NOT NULL,
    user_id integer NOT NULL,
    quiz_id integer NOT NULL,
    question_order character varying(1024) NOT NULL,
    question_list character varying(1024) NOT NULL,
    incorrect_questions character varying(1024) NOT NULL,
    current_score integer NOT NULL,
    complete boolean NOT NULL,
    user_answers text NOT NULL,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone
);


ALTER TABLE quiz_sitting OWNER TO postgres;

--
-- Name: quiz_sitting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quiz_sitting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quiz_sitting_id_seq OWNER TO postgres;

--
-- Name: quiz_sitting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE quiz_sitting_id_seq OWNED BY quiz_sitting.id;


--
-- Name: quiz_subcategory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quiz_subcategory (
    id integer NOT NULL,
    sub_category character varying(250),
    category_id integer
);


ALTER TABLE quiz_subcategory OWNER TO postgres;

--
-- Name: quiz_subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quiz_subcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quiz_subcategory_id_seq OWNER TO postgres;

--
-- Name: quiz_subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE quiz_subcategory_id_seq OWNED BY quiz_subcategory.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE taggit_tag OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggit_tag_id_seq OWNER TO postgres;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE taggit_taggeditem OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggit_taggeditem_id_seq OWNER TO postgres;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: testapp_tpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE testapp_tpage (
    page_ptr_id integer NOT NULL,
    author character varying(255) NOT NULL,
    body text NOT NULL,
    date_created date NOT NULL,
    date_modified date NOT NULL
);


ALTER TABLE testapp_tpage OWNER TO postgres;

--
-- Name: thingspeak_channel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE thingspeak_channel (
    id integer NOT NULL,
    data_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    latitide double precision NOT NULL,
    longitude double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    elevation text NOT NULL,
    last_entry_id integer NOT NULL
);


ALTER TABLE thingspeak_channel OWNER TO postgres;

--
-- Name: thingspeak_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE thingspeak_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE thingspeak_channel_id_seq OWNER TO postgres;

--
-- Name: thingspeak_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE thingspeak_channel_id_seq OWNED BY thingspeak_channel.id;


--
-- Name: thingspeak_channelfield; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE thingspeak_channelfield (
    id integer NOT NULL,
    field text NOT NULL,
    added timestamp with time zone NOT NULL,
    channel_id integer NOT NULL,
    tag text NOT NULL
);


ALTER TABLE thingspeak_channelfield OWNER TO postgres;

--
-- Name: thingspeak_channelfield_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE thingspeak_channelfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE thingspeak_channelfield_id_seq OWNER TO postgres;

--
-- Name: thingspeak_channelfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE thingspeak_channelfield_id_seq OWNED BY thingspeak_channelfield.id;


--
-- Name: thingspeak_feed; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE thingspeak_feed (
    id integer NOT NULL,
    entry_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    channel_id integer NOT NULL
);


ALTER TABLE thingspeak_feed OWNER TO postgres;

--
-- Name: thingspeak_feed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE thingspeak_feed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE thingspeak_feed_id_seq OWNER TO postgres;

--
-- Name: thingspeak_feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE thingspeak_feed_id_seq OWNED BY thingspeak_feed.id;


--
-- Name: thingspeak_feedfield; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE thingspeak_feedfield (
    id integer NOT NULL,
    reading text NOT NULL,
    added timestamp with time zone NOT NULL,
    "channelField_id" integer NOT NULL,
    feed_id integer NOT NULL
);


ALTER TABLE thingspeak_feedfield OWNER TO postgres;

--
-- Name: thingspeak_feedfield_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE thingspeak_feedfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE thingspeak_feedfield_id_seq OWNER TO postgres;

--
-- Name: thingspeak_feedfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE thingspeak_feedfield_id_seq OWNED BY thingspeak_feedfield.id;


--
-- Name: thingspeak_loggerdata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE thingspeak_loggerdata (
    id integer NOT NULL,
    raw_data text NOT NULL,
    added timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE thingspeak_loggerdata OWNER TO postgres;

--
-- Name: thingspeak_loggerdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE thingspeak_loggerdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE thingspeak_loggerdata_id_seq OWNER TO postgres;

--
-- Name: thingspeak_loggerdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE thingspeak_loggerdata_id_seq OWNED BY thingspeak_loggerdata.id;


--
-- Name: true_false_tf_question; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE true_false_tf_question (
    question_ptr_id integer NOT NULL,
    correct boolean NOT NULL
);


ALTER TABLE true_false_tf_question OWNER TO postgres;

--
-- Name: utils_channel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE utils_channel (
    id integer NOT NULL,
    data_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    latitide double precision NOT NULL,
    longitude double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    elevation text NOT NULL,
    last_entry_id integer NOT NULL
);


ALTER TABLE utils_channel OWNER TO postgres;

--
-- Name: utils_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utils_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utils_channel_id_seq OWNER TO postgres;

--
-- Name: utils_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE utils_channel_id_seq OWNED BY utils_channel.id;


--
-- Name: utils_channelfield; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE utils_channelfield (
    id integer NOT NULL,
    tag text NOT NULL,
    field text NOT NULL,
    added timestamp with time zone NOT NULL,
    channel_id integer NOT NULL
);


ALTER TABLE utils_channelfield OWNER TO postgres;

--
-- Name: utils_channelfield_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utils_channelfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utils_channelfield_id_seq OWNER TO postgres;

--
-- Name: utils_channelfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE utils_channelfield_id_seq OWNED BY utils_channelfield.id;


--
-- Name: utils_emailrecipient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE utils_emailrecipient (
    id integer NOT NULL,
    role character varying(200) NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(200) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE utils_emailrecipient OWNER TO postgres;

--
-- Name: utils_emailrecipient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utils_emailrecipient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utils_emailrecipient_id_seq OWNER TO postgres;

--
-- Name: utils_emailrecipient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE utils_emailrecipient_id_seq OWNED BY utils_emailrecipient.id;


--
-- Name: utils_feed; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE utils_feed (
    id integer NOT NULL,
    entry_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    channel_id integer NOT NULL
);


ALTER TABLE utils_feed OWNER TO postgres;

--
-- Name: utils_feed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utils_feed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utils_feed_id_seq OWNER TO postgres;

--
-- Name: utils_feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE utils_feed_id_seq OWNED BY utils_feed.id;


--
-- Name: utils_feedfield; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE utils_feedfield (
    id integer NOT NULL,
    reading text NOT NULL,
    added timestamp with time zone NOT NULL,
    "channelField_id" integer NOT NULL,
    feed_id integer NOT NULL
);


ALTER TABLE utils_feedfield OWNER TO postgres;

--
-- Name: utils_feedfield_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utils_feedfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utils_feedfield_id_seq OWNER TO postgres;

--
-- Name: utils_feedfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE utils_feedfield_id_seq OWNED BY utils_feedfield.id;


--
-- Name: utils_loggerdata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE utils_loggerdata (
    id integer NOT NULL,
    raw_data text NOT NULL,
    added timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE utils_loggerdata OWNER TO postgres;

--
-- Name: utils_loggerdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utils_loggerdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utils_loggerdata_id_seq OWNER TO postgres;

--
-- Name: utils_loggerdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE utils_loggerdata_id_seq OWNED BY utils_loggerdata.id;


--
-- Name: video_embeddedvideoindexpage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE video_embeddedvideoindexpage (
    page_ptr_id integer NOT NULL,
    intro text NOT NULL
);


ALTER TABLE video_embeddedvideoindexpage OWNER TO postgres;

--
-- Name: video_embeddedvideoindexrelatedlink; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE video_embeddedvideoindexrelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    link_page_id integer,
    page_id integer NOT NULL
);


ALTER TABLE video_embeddedvideoindexrelatedlink OWNER TO postgres;

--
-- Name: video_embeddedvideoindexrelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE video_embeddedvideoindexrelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE video_embeddedvideoindexrelatedlink_id_seq OWNER TO postgres;

--
-- Name: video_embeddedvideoindexrelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE video_embeddedvideoindexrelatedlink_id_seq OWNED BY video_embeddedvideoindexrelatedlink.id;


--
-- Name: video_embeddedvideopage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE video_embeddedvideopage (
    page_ptr_id integer NOT NULL,
    video_link character varying(200) NOT NULL,
    description text NOT NULL,
    category_id integer
);


ALTER TABLE video_embeddedvideopage OWNER TO postgres;

--
-- Name: video_embeddedvideopagetag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE video_embeddedvideopagetag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE video_embeddedvideopagetag OWNER TO postgres;

--
-- Name: video_embeddedvideopagetag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE video_embeddedvideopagetag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE video_embeddedvideopagetag_id_seq OWNER TO postgres;

--
-- Name: video_embeddedvideopagetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE video_embeddedvideopagetag_id_seq OWNED BY video_embeddedvideopagetag.id;


--
-- Name: visualization_channel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE visualization_channel (
    id integer NOT NULL,
    data_id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    latitide double precision NOT NULL,
    longitude double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    elevation text NOT NULL,
    last_entry_id integer NOT NULL
);


ALTER TABLE visualization_channel OWNER TO postgres;

--
-- Name: visualization_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE visualization_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE visualization_channel_id_seq OWNER TO postgres;

--
-- Name: visualization_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE visualization_channel_id_seq OWNED BY visualization_channel.id;


--
-- Name: visualization_channelfield; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE visualization_channelfield (
    id integer NOT NULL,
    tag text NOT NULL,
    field text NOT NULL,
    added timestamp with time zone NOT NULL,
    channel_id integer NOT NULL
);


ALTER TABLE visualization_channelfield OWNER TO postgres;

--
-- Name: visualization_channelfield_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE visualization_channelfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE visualization_channelfield_id_seq OWNER TO postgres;

--
-- Name: visualization_channelfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE visualization_channelfield_id_seq OWNED BY visualization_channelfield.id;


--
-- Name: visualization_feed; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE visualization_feed (
    id integer NOT NULL,
    entry_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    channel_id integer NOT NULL
);


ALTER TABLE visualization_feed OWNER TO postgres;

--
-- Name: visualization_feed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE visualization_feed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE visualization_feed_id_seq OWNER TO postgres;

--
-- Name: visualization_feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE visualization_feed_id_seq OWNED BY visualization_feed.id;


--
-- Name: visualization_feedfield; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE visualization_feedfield (
    id integer NOT NULL,
    reading text NOT NULL,
    added timestamp with time zone NOT NULL,
    "channelField_id" integer NOT NULL,
    feed_id integer NOT NULL
);


ALTER TABLE visualization_feedfield OWNER TO postgres;

--
-- Name: visualization_feedfield_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE visualization_feedfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE visualization_feedfield_id_seq OWNER TO postgres;

--
-- Name: visualization_feedfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE visualization_feedfield_id_seq OWNED BY visualization_feedfield.id;


--
-- Name: visualization_loggerdata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE visualization_loggerdata (
    id integer NOT NULL,
    raw_data text NOT NULL,
    added timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE visualization_loggerdata OWNER TO postgres;

--
-- Name: visualization_loggerdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE visualization_loggerdata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE visualization_loggerdata_id_seq OWNER TO postgres;

--
-- Name: visualization_loggerdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE visualization_loggerdata_id_seq OWNED BY visualization_loggerdata.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE wagtailcore_grouppagepermission OWNER TO postgres;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_grouppagepermission_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_grouppagepermission_id_seq OWNED BY wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE wagtailcore_page OWNER TO postgres;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_page_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_page_id_seq OWNED BY wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


ALTER TABLE wagtailcore_pagerevision OWNER TO postgres;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_pagerevision_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_pagerevision_id_seq OWNED BY wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE wagtailcore_pageviewrestriction OWNER TO postgres;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_pageviewrestriction_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_id_seq OWNED BY wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL
);


ALTER TABLE wagtailcore_site OWNER TO postgres;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailcore_site_id_seq OWNER TO postgres;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailcore_site_id_seq OWNED BY wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer
);


ALTER TABLE wagtaildocs_document OWNER TO postgres;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtaildocs_document_id_seq OWNER TO postgres;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtaildocs_document_id_seq OWNED BY wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


ALTER TABLE wagtailembeds_embed OWNER TO postgres;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailembeds_embed_id_seq OWNER TO postgres;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailembeds_embed_id_seq OWNED BY wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE wagtailforms_formsubmission OWNER TO postgres;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailforms_formsubmission_id_seq OWNER TO postgres;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailforms_formsubmission_id_seq OWNED BY wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_filter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailimages_filter (
    id integer NOT NULL,
    spec character varying(255) NOT NULL
);


ALTER TABLE wagtailimages_filter OWNER TO postgres;

--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailimages_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailimages_filter_id_seq OWNER TO postgres;

--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailimages_filter_id_seq OWNED BY wagtailimages_filter.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


ALTER TABLE wagtailimages_image OWNER TO postgres;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailimages_image_id_seq OWNER TO postgres;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailimages_image_id_seq OWNED BY wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(255) NOT NULL,
    filter_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE wagtailimages_rendition OWNER TO postgres;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailimages_rendition_id_seq OWNER TO postgres;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailimages_rendition_id_seq OWNED BY wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(200) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


ALTER TABLE wagtailredirects_redirect OWNER TO postgres;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailredirects_redirect_id_seq OWNER TO postgres;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailredirects_redirect_id_seq OWNED BY wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_editorspick; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailsearch_editorspick (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE wagtailsearch_editorspick OWNER TO postgres;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailsearch_editorspick_id_seq OWNER TO postgres;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailsearch_editorspick_id_seq OWNED BY wagtailsearch_editorspick.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


ALTER TABLE wagtailsearch_query OWNER TO postgres;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailsearch_query_id_seq OWNER TO postgres;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailsearch_query_id_seq OWNED BY wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE wagtailsearch_querydailyhits OWNER TO postgres;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailsearch_querydailyhits_id_seq OWNER TO postgres;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailsearch_querydailyhits_id_seq OWNED BY wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE wagtailusers_userprofile OWNER TO postgres;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wagtailusers_userprofile_id_seq OWNER TO postgres;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wagtailusers_userprofile_id_seq OWNED BY wagtailusers_userprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_eventindexrelatedlink ALTER COLUMN id SET DEFAULT nextval('event_eventindexrelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_eventpagetag ALTER COLUMN id SET DEFAULT nextval('event_eventpagetag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboard ALTER COLUMN id SET DEFAULT nextval('filer_clipboard_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboarditem ALTER COLUMN id SET DEFAULT nextval('filer_clipboarditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_file ALTER COLUMN id SET DEFAULT nextval('filer_file_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folder ALTER COLUMN id SET DEFAULT nextval('filer_folder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folderpermission ALTER COLUMN id SET DEFAULT nextval('filer_folderpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mamasemedia_mediapagerelatedlink ALTER COLUMN id SET DEFAULT nextval('mamasemedia_mediapagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY multichoice_answer ALTER COLUMN id SET DEFAULT nextval('multichoice_answer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_newsindexrelatedlink ALTER COLUMN id SET DEFAULT nextval('news_newsindexrelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_newspagetag ALTER COLUMN id SET DEFAULT nextval('news_newspagetag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partners_partnerlogo ALTER COLUMN id SET DEFAULT nextval('partners_partnerlogo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_category ALTER COLUMN id SET DEFAULT nextval('quiz_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_progress ALTER COLUMN id SET DEFAULT nextval('quiz_progress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_question ALTER COLUMN id SET DEFAULT nextval('quiz_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_question_quiz ALTER COLUMN id SET DEFAULT nextval('quiz_question_quiz_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_quiz ALTER COLUMN id SET DEFAULT nextval('quiz_quiz_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_sitting ALTER COLUMN id SET DEFAULT nextval('quiz_sitting_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_subcategory ALTER COLUMN id SET DEFAULT nextval('quiz_subcategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY thingspeak_channel ALTER COLUMN id SET DEFAULT nextval('thingspeak_channel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY thingspeak_channelfield ALTER COLUMN id SET DEFAULT nextval('thingspeak_channelfield_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY thingspeak_feed ALTER COLUMN id SET DEFAULT nextval('thingspeak_feed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY thingspeak_feedfield ALTER COLUMN id SET DEFAULT nextval('thingspeak_feedfield_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY thingspeak_loggerdata ALTER COLUMN id SET DEFAULT nextval('thingspeak_loggerdata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utils_channel ALTER COLUMN id SET DEFAULT nextval('utils_channel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utils_channelfield ALTER COLUMN id SET DEFAULT nextval('utils_channelfield_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utils_emailrecipient ALTER COLUMN id SET DEFAULT nextval('utils_emailrecipient_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utils_feed ALTER COLUMN id SET DEFAULT nextval('utils_feed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utils_feedfield ALTER COLUMN id SET DEFAULT nextval('utils_feedfield_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utils_loggerdata ALTER COLUMN id SET DEFAULT nextval('utils_loggerdata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY video_embeddedvideoindexrelatedlink ALTER COLUMN id SET DEFAULT nextval('video_embeddedvideoindexrelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY video_embeddedvideopagetag ALTER COLUMN id SET DEFAULT nextval('video_embeddedvideopagetag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visualization_channel ALTER COLUMN id SET DEFAULT nextval('visualization_channel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visualization_channelfield ALTER COLUMN id SET DEFAULT nextval('visualization_channelfield_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visualization_feed ALTER COLUMN id SET DEFAULT nextval('visualization_feed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visualization_feedfield ALTER COLUMN id SET DEFAULT nextval('visualization_feedfield_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visualization_loggerdata ALTER COLUMN id SET DEFAULT nextval('visualization_loggerdata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('wagtailcore_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('wagtailcore_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('wagtaildocs_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('wagtailembeds_embed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_filter ALTER COLUMN id SET DEFAULT nextval('wagtailimages_filter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('wagtailimages_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('wagtailimages_rendition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_editorspick ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	1	4
8	2	4
9	1	5
10	1	6
11	1	7
12	2	5
13	2	6
14	2	7
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 14, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add image	2	add_image
2	Can change image	2	change_image
3	Can delete image	2	delete_image
4	Can access Wagtail admin	4	access_admin
5	Can add document	5	add_document
6	Can change document	5	change_document
7	Can delete document	5	delete_document
8	Can add log entry	6	add_logentry
9	Can change log entry	6	change_logentry
10	Can delete log entry	6	delete_logentry
11	Can add site	7	add_site
12	Can change site	7	change_site
13	Can delete site	7	delete_site
14	Can add permission	8	add_permission
15	Can change permission	8	change_permission
16	Can delete permission	8	delete_permission
17	Can add group	9	add_group
18	Can change group	9	change_group
19	Can delete group	9	delete_group
20	Can add user	10	add_user
21	Can change user	10	change_user
22	Can delete user	10	delete_user
23	Can add content type	11	add_contenttype
24	Can change content type	11	change_contenttype
25	Can delete content type	11	delete_contenttype
26	Can add session	12	add_session
27	Can change session	12	change_session
28	Can delete session	12	delete_session
29	Can add Tag	13	add_tag
30	Can change Tag	13	change_tag
31	Can delete Tag	13	delete_tag
32	Can add Tagged Item	14	add_taggeditem
33	Can change Tagged Item	14	change_taggeditem
34	Can delete Tagged Item	14	delete_taggeditem
35	Can add Site	15	add_site
36	Can change Site	15	change_site
37	Can delete Site	15	delete_site
38	Can add page	1	add_page
39	Can change page	1	change_page
40	Can delete page	1	delete_page
41	Can add Page Revision	16	add_pagerevision
42	Can change Page Revision	16	change_pagerevision
43	Can delete Page Revision	16	delete_pagerevision
44	Can add Group Page Permission	17	add_grouppagepermission
45	Can change Group Page Permission	17	change_grouppagepermission
46	Can delete Group Page Permission	17	delete_grouppagepermission
47	Can add Page View Restriction	18	add_pageviewrestriction
48	Can change Page View Restriction	18	change_pageviewrestriction
49	Can delete Page View Restriction	18	delete_pageviewrestriction
50	Can add query	19	add_query
51	Can change query	19	change_query
52	Can delete query	19	delete_query
53	Can add Query Daily Hits	20	add_querydailyhits
54	Can change Query Daily Hits	20	change_querydailyhits
55	Can delete Query Daily Hits	20	delete_querydailyhits
56	Can add Editor's Pick	21	add_editorspick
57	Can change Editor's Pick	21	change_editorspick
58	Can delete Editor's Pick	21	delete_editorspick
59	Can add filter	22	add_filter
60	Can change filter	22	change_filter
61	Can delete filter	22	delete_filter
62	Can add rendition	23	add_rendition
63	Can change rendition	23	change_rendition
64	Can delete rendition	23	delete_rendition
65	Can add User Profile	24	add_userprofile
66	Can change User Profile	24	change_userprofile
67	Can delete User Profile	24	delete_userprofile
68	Can add Embed	25	add_embed
69	Can change Embed	25	change_embed
70	Can delete Embed	25	delete_embed
71	Can add Redirect	26	add_redirect
72	Can change Redirect	26	change_redirect
73	Can delete Redirect	26	delete_redirect
74	Can add Form Submission	27	add_formsubmission
75	Can change Form Submission	27	change_formsubmission
76	Can delete Form Submission	27	delete_formsubmission
77	Can add home page	3	add_homepage
78	Can change home page	3	change_homepage
79	Can delete home page	3	delete_homepage
80	Can add logger data	28	add_loggerdata
81	Can change logger data	28	change_loggerdata
82	Can delete logger data	28	delete_loggerdata
83	Can add channel	29	add_channel
84	Can change channel	29	change_channel
85	Can delete channel	29	delete_channel
86	Can add channel field	30	add_channelfield
87	Can change channel field	30	change_channelfield
88	Can delete channel field	30	delete_channelfield
89	Can add feed	31	add_feed
90	Can change feed	31	change_feed
91	Can delete feed	31	delete_feed
92	Can add feed field	32	add_feedfield
93	Can change feed field	32	change_feedfield
94	Can delete feed field	32	delete_feedfield
95	Can add gallery	33	add_gallery
96	Can change gallery	33	change_gallery
97	Can delete gallery	33	delete_gallery
98	Can add embedded video index related link	34	add_embeddedvideoindexrelatedlink
99	Can change embedded video index related link	34	change_embeddedvideoindexrelatedlink
100	Can delete embedded video index related link	34	delete_embeddedvideoindexrelatedlink
101	Can add embedded video index page	35	add_embeddedvideoindexpage
102	Can change embedded video index page	35	change_embeddedvideoindexpage
103	Can delete embedded video index page	35	delete_embeddedvideoindexpage
104	Can add embedded video page	36	add_embeddedvideopage
105	Can change embedded video page	36	change_embeddedvideopage
106	Can delete embedded video page	36	delete_embeddedvideopage
107	Can add event page tag	37	add_eventpagetag
108	Can change event page tag	37	change_eventpagetag
109	Can delete event page tag	37	delete_eventpagetag
110	Can add event page	38	add_eventpage
111	Can change event page	38	change_eventpage
112	Can delete event page	38	delete_eventpage
113	Can add event index related link	39	add_eventindexrelatedlink
114	Can change event index related link	39	change_eventindexrelatedlink
115	Can delete event index related link	39	delete_eventindexrelatedlink
116	Can add event index page	40	add_eventindexpage
117	Can change event index page	40	change_eventindexpage
118	Can delete event index page	40	delete_eventindexpage
119	Can add news page tag	41	add_newspagetag
120	Can change news page tag	41	change_newspagetag
121	Can delete news page tag	41	delete_newspagetag
122	Can add category page	42	add_categorypage
123	Can change category page	42	change_categorypage
124	Can delete category page	42	delete_categorypage
125	Can add news page	43	add_newspage
126	Can change news page	43	change_newspage
127	Can delete news page	43	delete_newspage
128	Can add news index related link	44	add_newsindexrelatedlink
129	Can change news index related link	44	change_newsindexrelatedlink
130	Can delete news index related link	44	delete_newsindexrelatedlink
131	Can add news index page	45	add_newsindexpage
132	Can change news index page	45	change_newsindexpage
133	Can delete news index page	45	delete_newsindexpage
134	Can add logger data	46	add_loggerdata
135	Can change logger data	46	change_loggerdata
136	Can delete logger data	46	delete_loggerdata
137	Can add channel	47	add_channel
138	Can change channel	47	change_channel
139	Can delete channel	47	delete_channel
140	Can add channel field	48	add_channelfield
141	Can change channel field	48	change_channelfield
142	Can delete channel field	48	delete_channelfield
143	Can add feed	49	add_feed
144	Can change feed	49	change_feed
145	Can delete feed	49	delete_feed
146	Can add feed field	50	add_feedfield
147	Can change feed field	50	change_feedfield
148	Can delete feed field	50	delete_feedfield
149	Can add Category	51	add_category
150	Can change Category	51	change_category
151	Can delete Category	51	delete_category
152	Can add Sub-Category	52	add_subcategory
153	Can change Sub-Category	52	change_subcategory
154	Can delete Sub-Category	52	delete_subcategory
155	Can add Quiz	53	add_quiz
156	Can change Quiz	53	change_quiz
157	Can delete Quiz	53	delete_quiz
158	Can add User Progress	54	add_progress
159	Can change User Progress	54	change_progress
160	Can delete User Progress	54	delete_progress
161	Can add sitting	55	add_sitting
162	Can change sitting	55	change_sitting
163	Can delete sitting	55	delete_sitting
164	Can see completed exams.	55	view_sittings
165	Can add Question	56	add_question
166	Can change Question	56	change_question
167	Can delete Question	56	delete_question
168	Can add True/False Question	57	add_tf_question
169	Can change True/False Question	57	change_tf_question
170	Can delete True/False Question	57	delete_tf_question
171	Can add Multiple Choice Question	58	add_mcquestion
172	Can change Multiple Choice Question	58	change_mcquestion
173	Can delete Multiple Choice Question	58	delete_mcquestion
174	Can add Answer	59	add_answer
175	Can change Answer	59	change_answer
176	Can delete Answer	59	delete_answer
177	Can add Essay style question	60	add_essay_question
178	Can change Essay style question	60	change_essay_question
179	Can delete Essay style question	60	delete_essay_question
180	Can add attendee	61	add_attendee
181	Can change attendee	61	change_attendee
182	Can delete attendee	61	delete_attendee
183	Can add watchlist	62	add_watchlist
184	Can change watchlist	62	change_watchlist
185	Can delete watchlist	62	delete_watchlist
186	Can add partner logo	63	add_partnerlogo
187	Can change partner logo	63	change_partnerlogo
188	Can delete partner logo	63	delete_partnerlogo
189	Can add Folder	64	add_folder
190	Can change Folder	64	change_folder
191	Can delete Folder	64	delete_folder
192	Can use directory listing	64	can_use_directory_listing
193	Can add folder permission	65	add_folderpermission
194	Can change folder permission	65	change_folderpermission
195	Can delete folder permission	65	delete_folderpermission
196	Can add file	66	add_file
197	Can change file	66	change_file
198	Can delete file	66	delete_file
199	Can add clipboard	67	add_clipboard
200	Can change clipboard	67	change_clipboard
201	Can delete clipboard	67	delete_clipboard
202	Can add clipboard item	68	add_clipboarditem
203	Can change clipboard item	68	change_clipboarditem
204	Can delete clipboard item	68	delete_clipboarditem
205	Can add image	69	add_image
206	Can change image	69	change_image
207	Can delete image	69	delete_image
208	Can add source	70	add_source
209	Can change source	70	change_source
210	Can delete source	70	delete_source
211	Can add thumbnail	71	add_thumbnail
212	Can change thumbnail	71	change_thumbnail
213	Can delete thumbnail	71	delete_thumbnail
214	Can add thumbnail dimensions	72	add_thumbnaildimensions
215	Can change thumbnail dimensions	72	change_thumbnaildimensions
216	Can delete thumbnail dimensions	72	delete_thumbnaildimensions
217	Can add gallery	73	add_gallery
218	Can change gallery	73	change_gallery
219	Can delete gallery	73	delete_gallery
220	Can add image	74	add_image
221	Can change image	74	change_image
222	Can delete image	74	delete_image
223	Can add t page	75	add_tpage
224	Can change t page	75	change_tpage
225	Can delete t page	75	delete_tpage
226	Can add embedded video page tag	76	add_embeddedvideopagetag
227	Can change embedded video page tag	76	change_embeddedvideopagetag
228	Can delete embedded video page tag	76	delete_embeddedvideopagetag
229	Can add logger data	77	add_loggerdata
230	Can change logger data	77	change_loggerdata
231	Can delete logger data	77	delete_loggerdata
232	Can add channel	78	add_channel
233	Can change channel	78	change_channel
234	Can delete channel	78	delete_channel
235	Can add channel field	79	add_channelfield
236	Can change channel field	79	change_channelfield
237	Can delete channel field	79	delete_channelfield
238	Can add feed	80	add_feed
239	Can change feed	80	change_feed
240	Can delete feed	80	delete_feed
241	Can add feed field	81	add_feedfield
242	Can change feed field	81	change_feedfield
243	Can delete feed field	81	delete_feedfield
244	Can add email recipient	82	add_emailrecipient
245	Can change email recipient	82	change_emailrecipient
246	Can delete email recipient	82	delete_emailrecipient
247	Can add partner page	83	add_partnerpage
248	Can change partner page	83	change_partnerpage
249	Can delete partner page	83	delete_partnerpage
250	Can add partner index page	84	add_partnerindexpage
251	Can change partner index page	84	change_partnerindexpage
252	Can delete partner index page	84	delete_partnerindexpage
253	Can add no comment page	85	add_nocommentpage
254	Can change no comment page	85	change_nocommentpage
255	Can delete no comment page	85	delete_nocommentpage
256	Can add post gis geometry columns	86	add_postgisgeometrycolumns
257	Can change post gis geometry columns	86	change_postgisgeometrycolumns
258	Can delete post gis geometry columns	86	delete_postgisgeometrycolumns
259	Can add post gis spatial ref sys	87	add_postgisspatialrefsys
260	Can change post gis spatial ref sys	87	change_postgisspatialrefsys
261	Can delete post gis spatial ref sys	87	delete_postgisspatialrefsys
262	Can add media page related link	88	add_mediapagerelatedlink
263	Can change media page related link	88	change_mediapagerelatedlink
264	Can delete media page related link	88	delete_mediapagerelatedlink
265	Can add media page	89	add_mediapage
266	Can change media page	89	change_mediapage
267	Can delete media page	89	delete_mediapage
268	Can add information page	90	add_informationpage
269	Can change information page	90	change_informationpage
270	Can delete information page	90	delete_informationpage
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 270, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$20000$qkLnYLwVM5JN$Ej/PujWxUQ6L9spcMnlqM6e4czB4/WSvbTz5MHAocX8=	2015-08-25 19:16:42.680357+03	t	upande			u@c.com	t	t	2015-08-03 16:15:31.916383+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2015-08-13 16:32:01.800342+03	1	unesco	1		63	1
2	2015-08-13 16:32:27.497257+03	2	university-of-twente	1		63	1
3	2015-08-13 16:32:42.872641+03	3	wagenigenur	1		63	1
4	2015-08-13 16:33:00.643449+03	4	maasai-mara-university	1		63	1
5	2015-08-13 16:33:10.970701+03	5	snv	1		63	1
6	2015-08-13 16:33:22.855563+03	6	brabantse	1		63	1
7	2015-08-13 16:33:35.578445+03	7	hsbc	1		63	1
8	2015-08-13 16:33:48.992085+03	8	giz	1		63	1
9	2015-08-13 16:34:08.817001+03	9	egerton-university	1		63	1
10	2015-08-13 16:36:29.793116+03	10	deltares	1		63	1
11	2015-08-13 16:36:46.240639+03	11	wwf	1		63	1
12	2015-08-13 16:37:08.617134+03	12	kingdom-of-netherlands	1		63	1
13	2015-08-21 12:13:16.899825+03	12	kingdom-of-netherlands	2	Changed partner_logo.	63	1
14	2015-08-21 12:13:40.306155+03	11	wwf	2	Changed partner_logo.	63	1
15	2015-08-21 12:13:54.524936+03	10	deltares	2	Changed partner_logo.	63	1
16	2015-08-21 12:14:43.993554+03	7	hsbc	2	Changed partner_logo.	63	1
17	2015-08-21 12:15:14.745374+03	5	snv	2	Changed partner_logo.	63	1
18	2015-08-21 12:15:31.297673+03	4	maasai-mara-university	2	Changed partner_logo.	63	1
19	2015-08-21 12:15:50.375631+03	3	wagenigenur	2	Changed partner_logo.	63	1
20	2015-08-21 12:16:10.920748+03	2	university-of-twente	2	Changed partner_logo.	63	1
21	2015-08-21 12:16:39.569568+03	1	unesco	2	Changed partner_logo.	63	1
22	2015-08-21 12:18:57.851046+03	7	hsbc	2	No fields changed.	63	1
23	2015-08-21 12:19:19.125634+03	13	mara farming	1		63	1
24	2015-08-21 12:20:01.812299+03	14	mrwua	1		63	1
25	2015-08-21 12:20:18.691461+03	15	wrma	1		63	1
26	2015-08-21 12:54:04.215409+03	9	egerton-university	2	Changed partner_logo.	63	1
27	2015-08-21 12:55:32.442184+03	9	egerton-university	2	No fields changed.	63	1
28	2015-08-21 13:03:40.798312+03	7	hsbc	2	Changed partner_logo.	63	1
29	2015-08-21 13:10:20.347157+03	10	deltares	2	Changed partner_logo.	63	1
30	2015-08-21 13:12:15.633605+03	8	giz	2	Changed partner_logo.	63	1
31	2015-08-21 14:23:47.644492+03	12	kingdom-of-netherlands	2	Changed url.	63	1
32	2015-08-21 14:45:15.831907+03	11	wwf	2	Changed url.	63	1
33	2015-08-21 14:46:22.805801+03	4	maasai-mara-university	2	Changed url.	63	1
34	2015-08-21 14:47:22.367814+03	1	unesco	2	Changed url.	63	1
35	2015-08-21 14:48:24.450891+03	2	university-of-twente	2	Changed url.	63	1
36	2015-08-21 14:50:51.251761+03	5	snv	2	Changed url.	63	1
37	2015-08-21 14:52:05.091723+03	7	hsbc	2	Changed url.	63	1
38	2015-08-21 14:54:34.575454+03	9	egerton-university	2	Changed url.	63	1
39	2015-08-21 14:56:10.339888+03	6	brabantse	2	Changed url.	63	1
40	2015-08-21 14:57:17.066336+03	10	deltares	2	Changed url.	63	1
41	2015-08-21 14:59:08.440214+03	8	giz	2	Changed url.	63	1
42	2015-08-21 15:00:21.187144+03	3	wagenigenur	2	Changed url.	63	1
43	2015-08-21 15:01:13.618861+03	15	wrma	2	Changed url.	63	1
44	2015-08-24 16:37:39.029953+03	13	mara farming	2	Changed partner_logo and url.	63	1
45	2015-08-24 16:37:57.203873+03	2	university-of-twente	2	Changed partner_logo.	63	1
46	2015-08-24 16:40:33.852208+03	1	unesco	2	Changed partner_logo.	63	1
47	2015-08-24 16:43:13.485107+03	12	kingdom-of-netherlands	2	Changed partner_logo.	63	1
48	2015-08-24 16:45:57.857418+03	6	brabantse	2	Changed partner_logo.	63	1
49	2015-08-24 18:14:58.608788+03	13	mara farming	2	Changed partner_logo.	63	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 49, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	wagtailimages	image
3	home	homepage
4	wagtailadmin	admin
5	wagtaildocs	document
6	admin	logentry
7	sites	site
8	auth	permission
9	auth	group
10	auth	user
11	contenttypes	contenttype
12	sessions	session
13	taggit	tag
14	taggit	taggeditem
15	wagtailcore	site
16	wagtailcore	pagerevision
17	wagtailcore	grouppagepermission
18	wagtailcore	pageviewrestriction
19	wagtailsearch	query
20	wagtailsearch	querydailyhits
21	wagtailsearch	editorspick
22	wagtailimages	filter
23	wagtailimages	rendition
24	wagtailusers	userprofile
25	wagtailembeds	embed
26	wagtailredirects	redirect
27	wagtailforms	formsubmission
28	thingspeak	loggerdata
29	thingspeak	channel
30	thingspeak	channelfield
31	thingspeak	feed
32	thingspeak	feedfield
33	gallery	gallery
34	video	embeddedvideoindexrelatedlink
35	video	embeddedvideoindexpage
36	video	embeddedvideopage
37	event	eventpagetag
38	event	eventpage
39	event	eventindexrelatedlink
40	event	eventindexpage
41	news	newspagetag
42	news	categorypage
43	news	newspage
44	news	newsindexrelatedlink
45	news	newsindexpage
46	visualization	loggerdata
47	visualization	channel
48	visualization	channelfield
49	visualization	feed
50	visualization	feedfield
51	quiz	category
52	quiz	subcategory
53	quiz	quiz
54	quiz	progress
55	quiz	sitting
56	quiz	question
57	true_false	tf_question
58	multichoice	mcquestion
59	multichoice	answer
60	essay	essay_question
61	event	attendee
62	event	watchlist
63	partners	partnerlogo
64	filer	folder
65	filer	folderpermission
66	filer	file
67	filer	clipboard
68	filer	clipboarditem
69	filer	image
70	easy_thumbnails	source
71	easy_thumbnails	thumbnail
72	easy_thumbnails	thumbnaildimensions
73	galleryapp	gallery
74	galleryapp	image
75	testapp	tpage
76	video	embeddedvideopagetag
77	utils	loggerdata
78	utils	channel
79	utils	channelfield
80	utils	feed
81	utils	feedfield
82	utils	emailrecipient
83	partners	partnerpage
84	partners	partnerindexpage
85	news	nocommentpage
86	gis	postgisgeometrycolumns
87	gis	postgisspatialrefsys
88	mamasemedia	mediapagerelatedlink
89	mamasemedia	mediapage
90	news	informationpage
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 90, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-08-03 16:13:29.846541+03
2	auth	0001_initial	2015-08-03 16:13:29.911665+03
3	admin	0001_initial	2015-08-03 16:13:29.936242+03
4	contenttypes	0002_remove_content_type_name	2015-08-03 16:13:29.987173+03
5	auth	0002_alter_permission_name_max_length	2015-08-03 16:13:30.004624+03
6	auth	0003_alter_user_email_max_length	2015-08-03 16:13:30.022348+03
7	auth	0004_alter_user_username_opts	2015-08-03 16:13:30.039518+03
8	auth	0005_alter_user_last_login_null	2015-08-03 16:13:30.058264+03
9	auth	0006_require_contenttypes_0002	2015-08-03 16:13:30.060264+03
10	taggit	0001_initial	2015-08-03 16:13:30.238569+03
11	wagtailimages	0001_initial	2015-08-03 16:13:30.329716+03
12	wagtailcore	0001_initial	2015-08-03 16:13:30.779541+03
13	wagtailcore	0002_initial_data	2015-08-03 16:13:30.781218+03
14	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2015-08-03 16:13:30.782894+03
15	wagtailcore	0004_page_locked	2015-08-03 16:13:30.784915+03
16	wagtailcore	0005_add_page_lock_permission_to_moderators	2015-08-03 16:13:30.789048+03
17	wagtailcore	0006_add_lock_page_permission	2015-08-03 16:13:30.793256+03
18	wagtailcore	0007_page_latest_revision_created_at	2015-08-03 16:13:30.796239+03
19	wagtailcore	0008_populate_latest_revision_created_at	2015-08-03 16:13:30.798437+03
20	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2015-08-03 16:13:30.800711+03
21	wagtailcore	0010_change_page_owner_to_null_on_delete	2015-08-03 16:13:30.802921+03
22	wagtailcore	0011_page_first_published_at	2015-08-03 16:13:30.805176+03
23	wagtailcore	0012_extend_page_slug_field	2015-08-03 16:13:30.807547+03
24	wagtailcore	0013_update_golive_expire_help_text	2015-08-03 16:13:30.809735+03
25	wagtailcore	0014_add_verbose_name	2015-08-03 16:13:30.811948+03
26	wagtailcore	0015_add_more_verbose_names	2015-08-03 16:13:30.814144+03
27	wagtailcore	0016_change_page_url_path_to_text_field	2015-08-03 16:13:30.816369+03
28	wagtailimages	0002_initial_data	2015-08-03 16:13:30.84462+03
29	wagtailimages	0003_fix_focal_point_fields	2015-08-03 16:13:30.987253+03
30	wagtailimages	0004_make_focal_point_key_not_nullable	2015-08-03 16:13:31.031761+03
31	wagtailimages	0005_make_filter_spec_unique	2015-08-03 16:13:31.074332+03
32	wagtailimages	0006_add_verbose_names	2015-08-03 16:13:31.279543+03
33	wagtailsearch	0001_initial	2015-08-03 16:13:31.402486+03
34	wagtailsearch	0002_add_verbose_names	2015-08-03 16:13:31.624719+03
35	wagtailredirects	0001_initial	2015-08-03 16:13:31.679461+03
36	wagtailredirects	0002_add_verbose_names	2015-08-03 16:13:31.795373+03
37	wagtailforms	0001_initial	2015-08-03 16:13:31.849847+03
38	wagtailforms	0002_add_verbose_names	2015-08-03 16:13:31.9477+03
39	news	0001_initial	2015-08-03 16:13:32.942846+03
40	news	0002_auto_20150730_0952	2015-08-03 16:13:34.34273+03
41	event	0001_initial	2015-08-03 16:13:34.936925+03
42	gallery	0001_initial	2015-08-03 16:13:35.025781+03
43	home	0001_initial	2015-08-03 16:13:35.10054+03
44	home	0002_create_homepage	2015-08-03 16:13:35.154854+03
45	home	0003_homepage_body	2015-08-03 16:13:35.29819+03
46	sessions	0001_initial	2015-08-03 16:13:35.325829+03
47	sites	0001_initial	2015-08-03 16:13:35.351674+03
48	thingspeak	0001_initial	2015-08-03 16:13:35.383049+03
49	thingspeak	0002_channel_feeds	2015-08-03 16:13:35.432287+03
50	thingspeak	0003_auto_20150716_0854	2015-08-03 16:13:35.733437+03
51	thingspeak	0004_auto_20150716_0956	2015-08-03 16:13:35.879847+03
52	thingspeak	0005_auto_20150717_1258	2015-08-03 16:13:36.413866+03
53	thingspeak	0006_auto_20150720_1059	2015-08-03 16:13:36.457115+03
54	video	0001_initial	2015-08-03 16:13:36.836835+03
55	wagtailadmin	0001_create_admin_access_permissions	2015-08-03 16:13:36.873061+03
56	wagtaildocs	0001_initial	2015-08-03 16:13:36.976386+03
57	wagtaildocs	0002_initial_data	2015-08-03 16:13:37.009255+03
58	wagtaildocs	0003_add_verbose_names	2015-08-03 16:13:37.360915+03
59	wagtailembeds	0001_initial	2015-08-03 16:13:37.39937+03
60	wagtailembeds	0002_add_verbose_names	2015-08-03 16:13:37.414286+03
61	wagtailusers	0001_initial	2015-08-03 16:13:37.511716+03
62	wagtailusers	0002_add_verbose_name_on_userprofile	2015-08-03 16:13:37.787433+03
63	wagtailusers	0003_add_verbose_names	2015-08-03 16:13:37.882004+03
64	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2015-08-03 16:13:37.886182+03
65	visualization	0001_initial	2015-08-06 12:53:11.89824+03
66	event	0002_auto_20150806_1237	2015-08-06 15:37:36.688969+03
67	gallery	0002_auto_20150806_1237	2015-08-06 15:37:36.751449+03
68	event	0002_auto_20150810_0835	2015-08-12 17:55:09.388603+03
69	event	0003_merge	2015-08-12 17:55:09.393355+03
70	gallery	0002_auto_20150812_1159	2015-08-12 17:55:28.168816+03
71	partners	0001_initial	2015-08-12 17:55:32.911931+03
72	partners	0002_auto_20150811_0843	2015-08-12 17:55:32.923993+03
73	partners	0003_partnerlogo_title	2015-08-12 17:55:32.944579+03
74	partners	0004_auto_20150812_0719	2015-08-12 17:55:32.957889+03
75	partners	0005_auto_20150812_0730	2015-08-12 17:55:32.979975+03
76	partners	0006_auto_20150812_0735	2015-08-12 17:55:33.004166+03
77	partners	0007_auto_20150812_0740	2015-08-12 17:55:33.016367+03
78	easy_thumbnails	0001_initial	2015-08-13 16:20:57.98723+03
79	easy_thumbnails	0002_thumbnaildimensions	2015-08-13 16:20:58.020312+03
80	filer	0001_initial	2015-08-13 16:20:59.049857+03
81	filer	0002_auto_20150606_2003	2015-08-13 16:20:59.292188+03
82	galleryapp	0001_initial	2015-08-13 16:20:59.496331+03
83	galleryapp	0002_auto_20150813_1210	2015-08-13 16:21:07.302127+03
84	galleryapp	0003_auto_20150813_1210	2015-08-13 16:21:07.304871+03
85	galleryapp	0004_auto_20150813_1249	2015-08-13 16:21:07.307097+03
86	galleryapp	0005_auto_20150813_1306	2015-08-13 16:21:07.309314+03
87	galleryapp	0006_remove_image_image	2015-08-13 16:21:07.311726+03
88	galleryapp	0007_image_image	2015-08-13 16:21:07.314146+03
89	testapp	0001_initial	2015-08-14 18:07:55.184724+03
90	testapp	0002_auto_20150814_0853	2015-08-14 18:07:55.533058+03
91	testapp	0003_auto_20150814_0905	2015-08-14 18:07:55.636485+03
92	testapp	0004_auto_20150814_1224	2015-08-14 18:07:55.736645+03
93	event	0003_auto_20150817_1503	2015-08-17 18:12:07.126475+03
94	event	0002_auto_20150803_0952	2015-08-17 18:12:47.497755+03
95	event	0004_merge	2015-08-17 18:12:54.43192+03
96	video	0002_auto_20150817_0948	2015-08-17 18:12:54.746151+03
97	utils	0001_initial	2015-08-20 12:28:11.18071+03
98	utils	0002_emailrecipient	2015-08-20 12:28:11.20692+03
99	partners	0002_partnerindexpage_partnerpage	2015-08-20 21:12:18.789957+03
100	partners	0003_partnerpage_website	2015-08-21 10:24:27.106799+03
101	partners	0004_remove_partnerpage_date	2015-08-21 10:31:07.777561+03
103	gis	0001_initial	2015-08-21 14:13:25.156202+03
104	news	0002_auto_20150821_1115	2015-08-21 14:13:25.486264+03
105	partners	0005_auto_20150821_0747	2015-08-21 14:13:25.758036+03
106	partners	0006_auto_20150821_1111	2015-08-21 14:13:26.012843+03
107	news	0003_auto_20150821_1247	2015-08-21 16:28:25.863432+03
108	mamasemedia	0001_initial	2015-08-24 15:02:43.172347+03
109	mamasemedia	0002_auto_20150825_1755	2015-08-25 21:29:27.100593+03
110	news	0004_auto_20150825_1755	2015-08-25 21:29:27.366833+03
111	news	0005_informationpage	2015-08-26 13:30:44.196649+03
112	partners	0005_partnerlogo_url	2015-08-26 13:31:58.127896+03
113	partners	0007_merge	2015-08-26 13:31:58.130852+03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 113, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
zlszuni2nbc408dsis3b8fpq6onvqgg9	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-08-17 16:18:18.832515+03
8mood5gzk93azc3r939xb2xbsmeap52d	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-08-19 15:14:18.64822+03
af87tf8foiwcq89lvny77voc2ijt0mw0	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-08-20 15:32:31.985286+03
kgdd8i2c87p4ceeolp08yf5w3jr202tb	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-08-21 16:44:14.323651+03
9ae5vd02mjwxnugw4qtm24xmq4nedfym	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-09-03 09:44:09.249754+03
j1i3jr7neqsex39yz4a1noz4n7tqmw2j	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-09-04 09:14:32.048069+03
qlcyu82j7288erzcxhcafnhmr8x6etx2	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-09-04 09:34:06.861513+03
0ih7gc6p7lvtm5y7mp2p2bvsjhz8xbpf	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-09-04 10:20:44.243343+03
v6pq49rrzxflwjye5aop86dov7vzjk8k	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-09-04 12:12:25.049729+03
szu9ye4xaa0ohjwhtny9kaxnyhwwrvty	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-09-07 16:36:43.804182+03
ji1qcj75uth141q45ivnou0gie99ovfo	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-09-08 08:51:12.300963+03
ieya4jja53bnt2ow3c10mwmshgc4lnkc	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-09-08 16:51:58.463163+03
1ii4jfirorwy3bortp6k3stb5taamo48	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-09-08 17:07:44.142892+03
171go9htzx0lmpy713t2q8p7otaqyclk	MTg5OWI0NDlmNjE1NDFlYmVkZmUxOTZhMDg3NjU2NjFlYzRkMjQzMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjEwZDNhMGMwZmRhNWQ2MDAxMDVjNWJiYzBmNTc1YzljY2E4ZTVmNmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-09-08 19:16:42.683248+03
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: essay_essay_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY essay_essay_question (question_ptr_id) FROM stdin;
\.


--
-- Data for Name: event_eventindexpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY event_eventindexpage (page_ptr_id, intro) FROM stdin;
6	<p>An awesome events index page</p>
\.


--
-- Data for Name: event_eventindexrelatedlink; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY event_eventindexrelatedlink (id, sort_order, link_external, title, link_page_id, page_id) FROM stdin;
1	0	https://www.google.co.ke	google	\N	6
\.


--
-- Name: event_eventindexrelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('event_eventindexrelatedlink_id_seq', 1, true);


--
-- Data for Name: event_eventpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY event_eventpage (page_ptr_id, start_date, end_date, body, location, maps_url, cost, category_id, main_image_id) FROM stdin;
17	2015-08-04 21:00:00+03	2015-08-10 21:00:00+03	<p>Come and pick the brains of some of the brightest minds in GIS</p>	<p>United Bible Societies, Ngong Road, Kenya</p>	https://www.google.co.ke/maps/place/United+Bible+Societies/@-1.2972928,36.7766541,18z/data=!4m7!1m4!3m3!1s0x182f1a74a1656165:0xdbc32224ee89f89c!2sUnited+Bible+Societies!3b1!3m1!1s0x182f1a74a1656165:0x	0	\N	1
18	2015-08-04 21:00:00+03	2015-08-10 21:00:00+03	<p>Come and pick the brains of some of the brightest minds in GIS</p>	<p>United Bible Societies, Ngong Road, Kenya</p>	https://www.google.co.ke/maps/place/United+Bible+Societies/@-1.2972928,36.7766541,18z/data=!4m7!1m4!3m3!1s0x182f1a74a1656165:0xdbc32224ee89f89c!2sUnited+Bible+Societies!3b1!3m1!1s0x182f1a74a1656165:0x	0	\N	1
\.


--
-- Data for Name: event_eventpagetag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY event_eventpagetag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Name: event_eventpagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('event_eventpagetag_id_seq', 1, false);


--
-- Data for Name: filer_clipboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_clipboard (id, user_id) FROM stdin;
\.


--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filer_clipboard_id_seq', 1, false);


--
-- Data for Name: filer_clipboarditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_clipboarditem (id, clipboard_id, file_id) FROM stdin;
\.


--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filer_clipboarditem_id_seq', 1, false);


--
-- Data for Name: filer_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_file (id, file, _file_size, sha1, has_all_mandatory_data, original_filename, name, description, uploaded_at, modified_at, is_public, folder_id, owner_id, polymorphic_ctype_id) FROM stdin;
\.


--
-- Name: filer_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filer_file_id_seq', 1, false);


--
-- Data for Name: filer_folder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_folder (id, name, uploaded_at, created_at, modified_at, lft, rght, tree_id, level, owner_id, parent_id) FROM stdin;
\.


--
-- Name: filer_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filer_folder_id_seq', 1, false);


--
-- Data for Name: filer_folderpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_folderpermission (id, type, everybody, can_edit, can_read, can_add_children, folder_id, group_id, user_id) FROM stdin;
\.


--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filer_folderpermission_id_seq', 1, false);


--
-- Data for Name: filer_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filer_image (file_ptr_id, _height, _width, date_taken, default_alt_text, default_caption, author, must_always_publish_author_credit, must_always_publish_copyright, subject_location) FROM stdin;
\.


--
-- Data for Name: gallery_gallery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gallery_gallery (page_ptr_id, image1_id, image2_id, image3_id, image4_id, image5_id, image6_id, image1_caption, image2_caption, image3_caption, image4_caption, image5_caption, image6_caption) FROM stdin;
30	8	9	10	11	12	13	Deforestation in Mara Forest	Elephants crossing Mara River	Charcoal burning in Mara Forest	Wildebeest crossing	Mara's River source	Plateau
\.


--
-- Data for Name: galleryapp_gallery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY galleryapp_gallery (page_ptr_id, gallery_slug, name, description) FROM stdin;
32	gallery2	gallery2	asdsdsda
\.


--
-- Data for Name: galleryapp_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY galleryapp_image (page_ptr_id, image_slug, name, image, description, date, gallery_id) FROM stdin;
\.


--
-- Data for Name: home_homepage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY home_homepage (page_ptr_id, body) FROM stdin;
3	
23	
\.


--
-- Data for Name: mamasemedia_mediapage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mamasemedia_mediapage (page_ptr_id, description, author, date_created, name) FROM stdin;
\.


--
-- Data for Name: mamasemedia_mediapagerelatedlink; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mamasemedia_mediapagerelatedlink (id, sort_order, embedded_link, title, image_id, page_id) FROM stdin;
\.


--
-- Name: mamasemedia_mediapagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mamasemedia_mediapagerelatedlink_id_seq', 1, false);


--
-- Data for Name: multichoice_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY multichoice_answer (id, question_id, content, correct) FROM stdin;
\.


--
-- Name: multichoice_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('multichoice_answer_id_seq', 1, false);


--
-- Data for Name: multichoice_mcquestion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY multichoice_mcquestion (question_ptr_id, answer_order) FROM stdin;
\.


--
-- Data for Name: news_categorypage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY news_categorypage (page_ptr_id, name, description) FROM stdin;
10	Tech	<p>Any content that is tech related</p>
31	Test	<p>Test test test</p>
12	publicity	<p>publicity content</p>
11	GIS	<p>GIS Content</p>
39	Event Reports	<p>News items on upcoming and past events</p>
40	Updates	<p>What is new?</p>
37	main_category	<p>A header category. Meant to contain the other categories and not to be a category itself</p>
38	newsletters	<p>News published after a stipulated period</p>
\.


--
-- Data for Name: news_informationpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY news_informationpage (page_ptr_id, date, body) FROM stdin;
\.


--
-- Data for Name: news_newsindexpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY news_newsindexpage (page_ptr_id, intro) FROM stdin;
4	<p>An awesome news page</p>
\.


--
-- Data for Name: news_newsindexrelatedlink; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY news_newsindexrelatedlink (id, sort_order, link_external, title, link_page_id, page_id) FROM stdin;
1	0	https://www.google.co.ke	google	\N	4
\.


--
-- Name: news_newsindexrelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('news_newsindexrelatedlink_id_seq', 1, true);


--
-- Data for Name: news_newspage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY news_newspage (page_ptr_id, date, intro, body, category_id, main_image_id, link_document_id) FROM stdin;
8	2015-08-03	<p>The on-going season has put a lot of stress on the Mara and other parts of the region. The Mara River and its two main tributaries, Amala and Nyangores, have recorded low discharge levels.<br/></p>	<h2>RAPID ASSESSMENT</h2><p><embed alt="Mamase image" embedtype="image" format="left" id="14"/>The current low river flows have negative effects on water quality, quantity and the habitat available for fish and invertebrates community. The inefficient and poorly regulated uses of water for agriculture and other forms of development will be controlled and optimized through strategic planning, careful monitoring and regulation of the resources by water authorities.</p><p>In late March, the MaMaSe Initiative, through its partners in Mara River Basin, conducted a Rapid Assessment test along the Mara River and its tributaries. The assessment aimed to determine water quality variables along various sites along the Mara River and its<br/>tributaries, assess habitat quality and diversity at the various sites, conduct a rapid assessment of invertrabrates communities and relate their composition to habitat diversity to water quality and assess the water quality and quantity status in relation to animal and human use.</p><p>As the team began the assessment up stream of the Amala Tributary at the Masese point, it became clear that the flow of the river had significantly reduced. Various tests including turbidity, pH and residual compositions tests showed that human and animal activity continues to ultimately control the quality of the water. According to Dr. Frank Masese of the research team, most of the pool samples carried out indicated a large amount of organic waste that reduced the oxygenation levels of the waters at all points. As the team progressed to midstream levels, local residents were curious to see what the initial findings for their water source would reveal.</p><h2>LOCAL RESIDENTS OBSERVATIONS</h2><p><embed alt="Story_mamase" embedtype="image" format="left" id="15"/>Conversations with the local residents about diminished flows and quality of the river, pointed out the prolonged dry spell the region is currently experiencing. Esther Chepchirchir, a resident of the village Kapkoliwa on the Amala River, confirmed that over the years she has seen the water levels steadily but gradually reduce. She could relate the gradual decline of the water quality and quantity to human activities such as deforestation, poor land use especially on riparian land.</p><p>Further downstream the Mara River at the Mara Bridge, the impact of the dry spell was more evident. Turbidity and residual organic matter had very high readings indicating heavy human and animal contamination. At every point where the team sampled, cattle was seeking water directly at the source. Other activities by the residents such as doing laundry, bathing, and washing of cars and motor cycles right at the banks of the river were also visible.</p><h2>MONITORING THE WATER LEVELS THROUGH LOW COST EQUIPMENT</h2><p><embed alt="story_mamase_2" embedtype="image" format="left" id="16"/>The MaMaSe Initiative addresses water quality monitoring from a management perspective of the entire basin. The Initiative is supporting the Water Resources Management Authority (<a href="http://www.wrma.or.ke/">WRMA)</a> in the operationalization of the water monitoring network. This is also done through experimental low cost technology (supported by UNESCO-IHE) which collects real-time data in order to guide stakeholders in the basin on relevant action, not only in the dry spell but also when the water level goes up and flooding occurrences increase.<br/></p><p>According to Patrick Meya of WRMA, with the data collected and analyzed the MaMaSe Initiative will record environmentally sustainable variables. This data using simulation can create forecasting models that will enable broad-based planning and interventions.</p><h2>WATER ALLOCATION PLAN</h2><p><embed alt="mamase_photo_2" embedtype="image" format="left" id="17"/>The MaMaSe Initiative will, amongst others, ensure the development of a sound water resources management strategy and capacity building of the Water Resources Management Authority (WRMA). In addition, the Initiative will work with WRMA to establish a comprehensive Water Allocation Plan for the Mara basin to ensure that those upstream have the same benefits of all natural resources as their counterparts downstream.<br/></p><p>Michael McClain, Professor of Ecohydroloy and project leader of MaMaSe: “MaMaSe is quite unusual for UNESCO-IHE, because it’s not strictly a capacity development project, a research project, or an educational project. It’s a large comprehensive programme that focuses on water safety and security, and we are working in many dimensions of the problem. One part of it is supporting government authorities that are responsible for resource management planning. We’re also working with the water users: helping small-scale farmers choose crops that are more economically profitable, so they not just produce more with the available water, but also earn more from what they produce. We’re also helping communities manage the range lands around the basin, to maximize the retention of water and the production of green vegetation, grass et cetera.”</p><p>Visit the <a href="http://mamase.unesco-ihe.org/">MaMaSe website</a> for more information.</p>	31	\N	\N
69	2015-08-25	<p><br/></p>	<p><b><embed alt="gis-training-mamase" embedtype="image" format="left" id="50"/>From 3 to 7 August, 26 participants from the Water Resources Management Authority, SNV, WWF, Mara Farming and Egerton University followed an intensive 5 day training on the processing of spatial data using open source software such as QGIS and GDAL. Dr. Hans van der Kwast, senior lecturer in ecohydrological modeling at UNESCO-IHE, guided the practical hands-on sessions on converting raw input data (e.g. GPS data, spreadsheets or scanned hardcopy maps) into GIS formats, geoprocessing and map design.</b><br/></p><p><br/></p><p><br/></p><p><br/></p><p>The participants were also introduced to the use of the <a href="http://maps.mamase.org/">MaMaSe GeoNode</a>, a Spatial Data Infrastructure (SDI) for up-and downloading data/documents, making online maps and integration with QGIS. This allows project partners and other stakeholders to share their information on the MaMaSe GeoNode which is part of the knowledge exchange centre developed in the project.</p><p>At the end of the training the participants acknowledged that with the acquired skills they are able to improve the data processing chain in their day-to-day work and learned how SDIs can be used to share data.</p><p>During the 5 training days, the amount of data layers in the MaMase GeoNode had increased from 13 to 135, thanks to the efforts of the participants.</p>	\N	\N	\N
7	2015-08-03	<p>Patrick Meya recently completed an online course on Environmental Flows from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area.<br/></p>	<p></p><p>The MaMaSe sustainable water initiative aims to improve the water safety and security in the Mara River Basin in Kenya. Patrick Meya (right) of the Mara Sub-regional Office of the Water Resource Management Authority (WRMA) receives his completion certificate from Michael McClain, project leader of MaMaSe and Professor of Ecohydrology at UNESCO-IHE.</p><p></p><p>Patrick Meya recently completed an <a href="http://www.unesco-ihe.org/node/5482">online course on Environmental Flows</a> from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area of water allocation planning within the Mara Basin under MaMaSe Sustainable Water Initiative.</p><p>His participation in the course was funded by GIZ, a MaMaSe Initiative partner whose role and key impact in the project is to strengthen the capacity of local water management systems. Similarly the Initiative derives leverages and synergies between partners within the basin in key impact result areas.</p><h2>Assessing the water quantity and quality of the Mara river</h2><p><embed alt="Mamase image" embedtype="image" format="left" id="14"/>The MaMaSe partners recently conducted a Rapid Assessment of the Mara River and its two main tributaries Nyangores and Amala. Patrick and his colleague Barnabas Kosgey from WRMA conducted the water quality tests of the Nyangores River and the Silibwet Bridge.The team was led by MaMaSe programme coordinator Ingrid de Loof.</p><p>The objective of this exercise was to determine the current water quantity and quality of the Mara River and its tributaries assess the habitat quality and invertebrate community and correlate this data and information to the recent prolonged drought in the region as well as to the human and animal use of the communities living within and around the river. </p><p>The MaMaSe Sustainable Water Initiative key objective is to improve water safety and security in the Mara River Basin through collection, sharing and deciphering of such data. <a href="http://mamase.unesco-ihe.org/">Read more here</a>.</p>	\N	\N	\N
\.


--
-- Data for Name: news_newspagetag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY news_newspagetag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Name: news_newspagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('news_newspagetag_id_seq', 1, false);


--
-- Data for Name: news_nocommentpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY news_nocommentpage (page_ptr_id, date, intro, body, category_id, link_document_id) FROM stdin;
63	2015-08-21	<p><b>Michael McClain is Professor of Ecohydrology at UNESCO-IHE. As project leader of MaMaSe, the Mau Mara Serengeti Sustainable Water Initiative, he shares developments and lessons-learned in this ambitious capacity development programme.</b></p>	<h5><b>Michael McClain is Professor of Ecohydrology at UNESCO-IHE. As project leader of MaMaSe, the Mau Mara Serengeti Sustainable Water Initiative, he shares developments and lessons-learned in this ambitious capacity development programme.</b></h5><p><b><br/></b></p><p><b>Working from knowledge generation to application</b></p><p>“MaMaSe is unusual for UNESCO-IHE, because it is not strictly a capacity development, research, or education project. It’s a large and knowledge-intensive development programme supported mainly by the Dutch Embassy in Kenya focusing on water safety and security at a basin scale. UNESCO-IHE is leading a consortium of Kenyan and international institutions working in all dimensions of the water sector. We are working with government water authorities to generate and apply the knowledge necessary for proper resource management. We are working with small-scale farmers to investigate and adopt water friendly and economically profitable crops, so farmers do not just produce more with the available water but also earn more from what they produce. We are working with pastoralist Maasai communities to improve management of their herds and rangelands to maximize the retention of soil water and the produce more grass. We are also working with financial institutions to introduce new financing mechanisms and Kenyan knowledge institutes to facilitate high levels of knowledge use and exchange.”</p><p></p><p><b>Different partners, different objectives</b></p><p>“MaMaSe is opening new forms of partnerships with the private sector. One of our key partners is a Dutch-owned commercial farm in the Mara that sells to European supermarket chains, and which also connects local small-scale farmers to European markets. They see a clear business advantage and we see a means of raising the standard of small farmer practice and profit.”</p><p></p><p><b>Different forms of capacity development</b></p><p>“MaMaSe is a very large project (more than 10 partners with a budget of €10 million), and there are different forms of capacity development happening inside it. Because we are working side-by-side with implementation partners, we are able to do a lot of on-the-job training. This also enables us to better identify the specific capacity needs of partners and organize group trainings in needed topics, including particular tools and techniques developed within the initiative itself. We are also involving Kenyan and European students as much as we can. This is a great experience for students and ensures their research outputs have maximal societal impact.”</p><p></p><p><b>Challenges and highlights</b></p><p>“Leading a major development initiative is a new role for us at UNESCO-IHE and has been an enormous learning experience requiring new ways of organizing our efforts and engaging with partners. We have found it challenging but we’ve also found that we are up to the task. In this role we are able to enhance our normal research and capacity development activities and have a much larger impact on the ground.”</p><p></p><p><b>Ensuring that progress is maintained</b></p><p>“Consideration of the long term impact of our efforts in MaMaSe is part of the entire strategy. It is really challenging to maintain the gains of an initiative like this once the funding ends and international partners move on. Our approach is to work with local partners to build improved capacity and practice into their daily operations and to be considerate of realistic long term funding levels. We are also trying to enhance future funding levels with new financial mechanisms such as water funds. In the end we consider capacity development to be among the wisest investments for long term change. This perspective is something special that UNESCO-IHE offers to development partners, and I hope we will be able to lead many more initiatives like MaMaSe in the future.”</p><p><br/></p>	\N	\N
65	2015-08-24	<p>None</p>	<p>The MaMaSe Sustainable Water Initiative is aimed at improving water safety and security in the Mara River Basin to support structural poverty reduction, sustainable economic growth and conservation of the basin’s ecosystems. In this four year programme the people and institutions in the basin will be supported in a process of structural change, promoting water-wise economic development that lifts people out of poverty and sets them on a sustainable path to improved well being and self-reliance.</p><p></p><p>The Initiative, which is financially supported by the Netherlands Embassy in Nairobi, Kenya, consists of a broad-based public private partnership including international and Kenyan government agencies, civil society, private sector, NGOs, and knowledge institutions. It is led by UNESCO-IHE together with WWF Kenya. The partners envision a basin where:</p><p></p><ul><li>Capable government institutions develop effective river basin management strategies for inclusive green growth through participatory processes. Water resources are regulated for the benefit of people and ecosystems. </li></ul><ul><li>Basin residents prosper from economic activities that are financially profitable, environmentally sustainable, and well aligned with the basin water management strategy. Innovative agricultural practices and sustainable tourism facilities are promoted.</li></ul><ul><li>Key forest and savannah ecosystems are protected or restored and wildlife has access to habitats and water resources needed at different times of the year and especially during drought years.</li></ul><ul><li>These interconnected public, private, and environmental elements of the basin serve as a model of sustainability for surrounding basins, with transferrable tools and approaches.</li></ul><p></p><p></p>	\N	\N
62	2015-08-21		<p></p><p></p><h4><b>Sustainable Rangeland – Wet Areas</b></h4><b><p><b><br/></b></p><img/>Importance</b><embed alt="Degraded spring area Enonkishu Conservancy" embedtype="image" format="right" id="35"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact                                                                                                                 </b>Controlled grazing in wet areas will store more water, lead to less erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i><br/></i></p><p><i>                                                                                                </i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i><br/></p><p><b>Rules for Wet Areas</b></p><embed alt="Wetland area" embedtype="image" format="right" id="37"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent ‘wet zones’   (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><br/></p><p><br/></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone’. These areas will provide important drought grazing areas.</i></p><p><i><a id="1" linktype="document">rangelands_grazing</a><br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt="Uncontrolled grazing area" embedtype="image" format="right" id="38"/><br/></b><p><b>Uncontrolled grazing</b></p><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact                                                                                                       </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><i><br/></i></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy<br/></i></p><p><b><embed alt="Controlled grazing area" embedtype="image" format="right" id="39"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i><br/></i></p><p><i>Figure 2. Controlled grazing using ‘bunched’ herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p><i><a id="2" linktype="document">rangeland wet areas</a><br/></i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt="Path erosion channels " embedtype="image" format="right" id="40"/><br/></b><p><b>Farmer Challenges                                             </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams  (Figure 1). Small roads and paths channel sediment directly to the streams.</p><p><br/></p><p><b>Fact                                                                               </b> Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><i><br/></i></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt="Drainage dip cut " embedtype="image" format="right" id="41"/>Farmer Solutions                                                                                     </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound’ technique at regular intervals (Figure 2).</p><p>Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><p><i><br/></i></p><p><i><a id="3" linktype="document">path erosion</a><br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland  </b><br/></h4><p><b><embed alt="A natural wetland" embedtype="image" format="right" id="42"/><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands?                         </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>                                                                                 Figure 1. A natural wetland.</i></p><p><b><embed alt="A Constructed Wetland " embedtype="image" format="right" id="43"/>How do CWs work?                                    </b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water.  The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water cannot be seen.<br/></i></p><p><b><embed alt=" Hand- on training for the constructed wetlands" embedtype="image" format="right" id="44"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.<br/></i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p><a id="4" linktype="document">constructed wetlands</a><br/></p><p></p><p></p><p></p><p></p><p></p><p></p>	\N	\N
\.


--
-- Data for Name: partners_partnerindexpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY partners_partnerindexpage (page_ptr_id, intro) FROM stdin;
35	<p>The Initiative, which is financially supported by the Netherlands Embassy in Nairobi, consists of a broad-based, basin-scale public private partnership including international and Kenyan government agencies, civil society, private sector, NGOs, and knowledge institutions. The consortium is led by UNESCO-IHE.<br/></p><p><br/></p><p><br/></p>
\.


--
-- Data for Name: partners_partnerlogo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY partners_partnerlogo (id, partner_logo, title, url) FROM stdin;
14	partners/mrwua-logo.png	mrwua	
11	partners/wwf-logo_2fl64K1.png	wwf	http://wwf.org/
4	partners/maasaimarauniversity-logo.png	maasai-mara-university	http://www.mmarau.ac.ke/
5	partners/snv-logo_TIWhlMy.png	snv	http://www.snvworld.org/
7	partners/hsbc-logo2.jpg	hsbc	https://www.thewaterhub.org/
9	partners/egerton-logo.png	egerton-university	http://www.egerton.ac.ke/
10	partners/deltares-logo2.jpg	deltares	https://www.deltares.nl/en/
8	partners/giz-logo_aFLyEgu.jpg	giz	https://www.giz.de/en/html/index.html
3	partners/wageningenur-logo.png	wagenigenur	http://www.wageningenur.nl/en.htm
15	partners/wrma-logo.png	wrma	http://www.wrma.or.ke/
2	partners/twente.png	university-of-twente	http://www.utwente.nl/en/
1	partners/unesco-ihe-logo.jpg	unesco	https://www.unesco-ihe.org
12	partners/kingdom-of-netherlands-logo_iKNkwLQ.jpg	kingdom-of-netherlands	http://unitedkingdom.nlembassy.org/
6	partners/brabantse-delta-logo.jpg	brabantse	http://www.brabantsedelta.nl/index.html/
13	partners/marafarming-logo_HJG09LG.png	mara farming	http://www.raakontwerp.nl/MARA-FARMING-EPZ-FRESH
\.


--
-- Name: partners_partnerlogo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('partners_partnerlogo_id_seq', 15, true);


--
-- Data for Name: partners_partnerpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY partners_partnerpage (page_ptr_id, bio, main_image_id, website) FROM stdin;
36	<p>HSBC has been our strategic partner since the inception of this project. They bring a wealth of experience assisting other conservation projects into the MaMaSe project. We look forward to working with them for a very long time.</p>	23	\N
41	<p>This center for academic excellence has been at the forefront assisting us get set up and interact with the community for the success of the project</p>	24	http://www.mmarau.ac.ke/
66		47	
59	<p>This is dummy text. It has been put here as a place holder and should be used to show the structure of the intented bio and not as a final text.</p>	32	http://www.snvworld.org/
47	<p>The World Wide fund is actively championing for the conservation of the enviroment and partnered with us so that we could do it together</p>	27	http://wwf.panda.org/
54	<p>GIZ has been assisting the MaMaSe team thought funding and mentorship. We look forward to their continued support</p>	29	http://www.giz.de/en/html/index.html
58	<p>Marafarming is assisting the MaMaSe team in the research. They have programs to encourage the community to switch to crop farming as opposed to the prefered nomardic hearding</p>	31	http://www.raakontwerp.nl/MARA-FARMING-EPZ-FRESH
43	<p>The Kindgom has assisted the MaMaSe project get set up and has also funded the project.</p>	26	http://unitedkingdom.nlembassy.org/
60	<p>This is dummy text. It has been put here as a place holder and should be used to show the structure of the intented bio and not as a final text</p>	33	http://www.brabantsedelta.nl/index.html
42	<p>We have been working with UNESCO to ensure the project is a success. They are key stakeholders in the conservation of the rangelands and assisting us.</p>	51	https://www.unesco-ihe.org/
68		49	
61	<p>This is dummy text. It has been put here as a place holder and should be used to show the structure of the intented bio and not as a final text</p>	34	http://www.wageningenur.nl/en/wageningen-university.htm
67		48	
57	<p>University of Twente is assisting the MaMaSe team in the research. We collect data together and analyze it to better conserve the environment</p>	30	http://www.utwente.nl/en/
52	<p>Deltares is focus on conservation and partners with MaMaSe because we share a common goal. They are providing funding and mentorship to the team on the ground</p>	28	https://www.deltares.nl/en/
\.


--
-- Data for Name: quiz_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quiz_category (id, category) FROM stdin;
\.


--
-- Name: quiz_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('quiz_category_id_seq', 1, false);


--
-- Data for Name: quiz_progress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quiz_progress (id, user_id, score) FROM stdin;
\.


--
-- Name: quiz_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('quiz_progress_id_seq', 1, false);


--
-- Data for Name: quiz_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quiz_question (id, category_id, sub_category_id, figure, content, explanation) FROM stdin;
\.


--
-- Name: quiz_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('quiz_question_id_seq', 1, false);


--
-- Data for Name: quiz_question_quiz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quiz_question_quiz (id, question_id, quiz_id) FROM stdin;
\.


--
-- Name: quiz_question_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('quiz_question_quiz_id_seq', 1, false);


--
-- Data for Name: quiz_quiz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quiz_quiz (id, title, description, url, category_id, random_order, max_questions, answers_at_end, exam_paper, single_attempt, pass_mark, success_text, fail_text, draft) FROM stdin;
\.


--
-- Name: quiz_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('quiz_quiz_id_seq', 1, false);


--
-- Data for Name: quiz_sitting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quiz_sitting (id, user_id, quiz_id, question_order, question_list, incorrect_questions, current_score, complete, user_answers, start, "end") FROM stdin;
\.


--
-- Name: quiz_sitting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('quiz_sitting_id_seq', 1, false);


--
-- Data for Name: quiz_subcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quiz_subcategory (id, sub_category, category_id) FROM stdin;
\.


--
-- Name: quiz_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('quiz_subcategory_id_seq', 1, false);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY taggit_tag (id, name, slug) FROM stdin;
1	awesome	awesome
2	random	random
3	nature	nature
4	image1	image1
5	chicks	chicks
6	chicks2	chicks2
7	Plateau	plateau
8	mamase	mamase
9	hsbc	hsbc
10	masaaimara	masaaimara
11	unesco	unesco
12	netherlands	netherlands
13	wwf	wwf
14	delta	delta
15	GIZ	giz
16	twente	twente
17	marafarming	marafarming
18	snv	snv
19	WaterschapBrabantseDelta	waterschapbrabantsedelta
20	Facts	facts
21	Spring	spring
22	Enonkishu	enonkishu
23	wetland	wetland
24	grazing	grazing
25	uncontrolled	uncontrolled
26	controlled	controlled
27	erosion	erosion
28	Drainage	drainage
29	UNESCO-IHE	unesco-ihe
30	WRMA	wrma
31	University	university
32	Egerton	egerton
33	Njoro	njoro
34	WRUA	wrua
35	training	training
36	gis	gis
37	rangeland	rangeland
38	rangeland-wetareas	rangeland-wetareas
39	path-erosion	path-erosion
40	constructedwetlands	constructedwetlands
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 40, true);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
1	1	2	1
2	1	2	2
3	1	2	3
4	2	2	4
5	3	2	5
6	6	2	6
7	13	2	7
8	14	2	8
9	15	2	8
10	16	2	8
11	17	2	8
12	23	2	9
13	24	2	10
14	25	2	11
15	26	2	12
16	27	2	13
17	28	2	14
18	29	2	15
19	30	2	16
20	31	2	17
21	32	2	18
22	33	2	19
26	35	2	20
27	35	2	21
28	35	2	22
29	37	2	24
30	37	2	23
33	38	2	24
34	38	2	25
35	39	2	24
36	39	2	26
37	39	2	22
38	40	2	27
39	41	2	28
40	42	2	23
41	43	2	23
42	44	2	23
43	45	2	11
44	46	2	29
45	47	2	30
46	48	2	32
47	48	2	33
48	48	2	31
49	49	2	34
50	50	2	8
51	50	2	35
52	50	2	36
53	51	2	29
54	1	5	37
55	2	5	38
56	3	5	39
57	4	5	40
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 57, true);


--
-- Data for Name: testapp_tpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testapp_tpage (page_ptr_id, author, body, date_created, date_modified) FROM stdin;
34	mamase	[{"type": "image_carousel", "value": [{"caption": "", "image": 18}, {"caption": "", "image": 19}, {"caption": "", "image": 20}, {"caption": "", "image": 21}, {"caption": "", "image": 22}]}]	2015-08-21	2015-08-25
\.


--
-- Data for Name: thingspeak_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY thingspeak_channel (id, data_id, name, description, latitide, longitude, created_at, updated_at, elevation, last_entry_id) FROM stdin;
\.


--
-- Name: thingspeak_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('thingspeak_channel_id_seq', 1, false);


--
-- Data for Name: thingspeak_channelfield; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY thingspeak_channelfield (id, field, added, channel_id, tag) FROM stdin;
\.


--
-- Name: thingspeak_channelfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('thingspeak_channelfield_id_seq', 1, false);


--
-- Data for Name: thingspeak_feed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY thingspeak_feed (id, entry_id, created_at, channel_id) FROM stdin;
\.


--
-- Name: thingspeak_feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('thingspeak_feed_id_seq', 1, false);


--
-- Data for Name: thingspeak_feedfield; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY thingspeak_feedfield (id, reading, added, "channelField_id", feed_id) FROM stdin;
\.


--
-- Name: thingspeak_feedfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('thingspeak_feedfield_id_seq', 1, false);


--
-- Data for Name: thingspeak_loggerdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY thingspeak_loggerdata (id, raw_data, added, active) FROM stdin;
\.


--
-- Name: thingspeak_loggerdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('thingspeak_loggerdata_id_seq', 1, false);


--
-- Data for Name: true_false_tf_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY true_false_tf_question (question_ptr_id, correct) FROM stdin;
\.


--
-- Data for Name: utils_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY utils_channel (id, data_id, name, description, latitide, longitude, created_at, updated_at, elevation, last_entry_id) FROM stdin;
\.


--
-- Name: utils_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utils_channel_id_seq', 1, false);


--
-- Data for Name: utils_channelfield; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY utils_channelfield (id, tag, field, added, channel_id) FROM stdin;
\.


--
-- Name: utils_channelfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utils_channelfield_id_seq', 1, false);


--
-- Data for Name: utils_emailrecipient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY utils_emailrecipient (id, role, name, email, active) FROM stdin;
\.


--
-- Name: utils_emailrecipient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utils_emailrecipient_id_seq', 1, false);


--
-- Data for Name: utils_feed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY utils_feed (id, entry_id, created_at, channel_id) FROM stdin;
\.


--
-- Name: utils_feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utils_feed_id_seq', 1, false);


--
-- Data for Name: utils_feedfield; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY utils_feedfield (id, reading, added, "channelField_id", feed_id) FROM stdin;
\.


--
-- Name: utils_feedfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utils_feedfield_id_seq', 1, false);


--
-- Data for Name: utils_loggerdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY utils_loggerdata (id, raw_data, added, active) FROM stdin;
\.


--
-- Name: utils_loggerdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utils_loggerdata_id_seq', 1, false);


--
-- Data for Name: video_embeddedvideoindexpage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY video_embeddedvideoindexpage (page_ptr_id, intro) FROM stdin;
14	<p>awesome videos from upande</p>
\.


--
-- Data for Name: video_embeddedvideoindexrelatedlink; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY video_embeddedvideoindexrelatedlink (id, sort_order, link_external, title, link_page_id, page_id) FROM stdin;
1	0	https://google.co.ke	google	\N	14
\.


--
-- Name: video_embeddedvideoindexrelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('video_embeddedvideoindexrelatedlink_id_seq', 1, true);


--
-- Data for Name: video_embeddedvideopage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY video_embeddedvideopage (page_ptr_id, video_link, description, category_id) FROM stdin;
15	https://www.youtube.com/embed/fjsTlrvAT3g	<p>Luchiri talks about Upande at the iHub bash</p>	12
16	https://www.youtube.com/embed/PmQLKBTKOxg	<p>Mau Mara Serengeti Sustainable Water Initiative<br/></p>	11
\.


--
-- Data for Name: video_embeddedvideopagetag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY video_embeddedvideopagetag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Name: video_embeddedvideopagetag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('video_embeddedvideopagetag_id_seq', 1, false);


--
-- Data for Name: visualization_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY visualization_channel (id, data_id, name, description, latitide, longitude, created_at, updated_at, elevation, last_entry_id) FROM stdin;
\.


--
-- Name: visualization_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('visualization_channel_id_seq', 1, false);


--
-- Data for Name: visualization_channelfield; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY visualization_channelfield (id, tag, field, added, channel_id) FROM stdin;
\.


--
-- Name: visualization_channelfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('visualization_channelfield_id_seq', 1, false);


--
-- Data for Name: visualization_feed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY visualization_feed (id, entry_id, created_at, channel_id) FROM stdin;
\.


--
-- Name: visualization_feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('visualization_feed_id_seq', 1, false);


--
-- Data for Name: visualization_feedfield; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY visualization_feedfield (id, reading, added, "channelField_id", feed_id) FROM stdin;
\.


--
-- Name: visualization_feedfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('visualization_feedfield_id_seq', 1, false);


--
-- Data for Name: visualization_loggerdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY visualization_loggerdata (id, raw_data, added, active) FROM stdin;
\.


--
-- Name: visualization_loggerdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('visualization_loggerdata_id_seq', 1, false);


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
\.


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at) FROM stdin;
37	000100010009	3	3	main_category	main_category	f	t	/home/main_category/		f		\N	\N	f	42	1	f	2015-08-21 11:17:20.337524+03	2015-08-21 11:17:20.352034+03
62	00010001000E	3	0	Factsheet series	material	t	f	/home/material/		f		\N	\N	f	85	1	f	2015-08-25 22:02:58.555973+03	2015-08-21 18:28:16.630255+03
14	000100010004	3	2	videos	videos	t	f	/home/videos/		f		\N	\N	f	35	1	f	2015-08-03 16:49:00.22572+03	2015-08-03 16:49:00.241131+03
38	0001000100090001	4	0	Newsletters	newsletters	t	f	/home/main_category/newsletters/		f		\N	\N	f	42	1	f	2015-08-21 11:41:38.598199+03	2015-08-21 11:33:34.43445+03
10	00010002	2	3	Tech	tech	f	t	/tech/		f		\N	\N	f	42	1	f	2015-08-03 16:39:19.37211+03	2015-08-03 16:39:19.386976+03
36	0001000100080001	4	0	HSBC	hsbc	t	f	/home/partners/hsbc/		f	HSBC is a mamase partner working with us to champion conservation	\N	\N	f	83	1	f	2015-08-21 12:14:59.828742+03	2015-08-21 10:53:31.702408+03
17	0001000100030001	4	0	Awesome upande event	awesome-upande-event	t	f	/home/events/awesome-upande-event/		f		\N	\N	f	38	1	f	2015-08-03 16:55:02.691614+03	2015-08-03 16:55:02.70645+03
6	000100010003	3	2	events	events	t	f	/home/events/		f		\N	\N	f	40	1	f	2015-08-03 16:30:59.259057+03	2015-08-03 16:30:59.275257+03
18	0001000100030002	4	0	another upande event	another-upande-event	t	f	/home/events/another-upande-event/		f		\N	\N	f	38	1	f	2015-08-03 16:55:21.193135+03	2015-08-03 16:55:02.70645+03
41	0001000100080002	4	0	Masaai Mara University	masaai-mara-university	t	f	/home/partners/masaai-mara-university/		f		\N	\N	f	83	1	f	2015-08-21 16:01:09.163412+03	2015-08-21 16:01:09.177424+03
34	000100010007	3	0	MaMaSe Photo Gallery	tgallery	t	f	/home/tgallery/	Gallery	f		\N	\N	f	75	1	f	2015-08-25 19:28:02.327212+03	2015-08-21 09:36:47.44127+03
31	000100020003	3	0	Test	test	f	t	/tech/test/		f		\N	\N	f	42	1	f	2015-08-10 13:27:48.717942+03	2015-08-10 13:27:48.740217+03
43	0001000100080004	4	0	Kingdom of The Netherlands	kingdom-netherlands	t	f	/home/partners/kingdom-netherlands/		f		\N	\N	f	83	1	f	2015-08-25 10:12:32.615913+03	2015-08-21 16:18:53.630226+03
1	0001	1	2	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N
42	0001000100080003	4	0	UNESCO-IHE	unesco-ihe	t	f	/home/partners/unesco-ihe/		f		\N	\N	f	83	1	f	2015-08-25 17:42:47.923509+03	2015-08-21 16:06:45.034811+03
47	0001000100080005	4	0	WWF	wwf	t	f	/home/partners/wwf/		f		\N	\N	f	83	1	f	2015-08-21 16:26:05.302373+03	2015-08-21 16:26:05.316167+03
54	0001000100080007	4	0	GIZ	giz	t	f	/home/partners/giz/		f		\N	\N	f	83	1	f	2015-08-21 16:52:30.228714+03	2015-08-21 16:52:30.2421+03
15	0001000100040001	4	0	iHub 5 year bash	ihub-5-year-bash	f	t	/home/videos/ihub-5-year-bash/		f		\N	\N	f	36	1	f	2015-08-03 16:49:52.334804+03	2015-08-03 16:49:52.350182+03
7	0001000100010001	4	0	MaMaSe initiative strengthens the capacity of the Water Resource Management Authority in Kenya	mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya	t	f	/home/news/mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya/		f		\N	\N	f	43	1	f	2015-08-12 18:22:30.381113+03	2015-08-03 16:32:34.202356+03
16	0001000100040002	4	0	MAMASE Mau Mara Serengeti Sustainable Water Initiative	mamase-mau-mara-serengeti-sustainable-water-initiative	t	f	/home/videos/mamase-mau-mara-serengeti-sustainable-water-initiative/		f		\N	\N	f	36	1	f	2015-08-10 14:49:16.218352+03	2015-08-03 16:51:46.043771+03
60	000100010008000B	4	0	Waterschap Brabantse Delta	waterschap-brabantse-delta	t	f	/home/partners/waterschap-brabantse-delta/		f		\N	\N	f	83	1	f	2015-08-21 17:10:16.456423+03	2015-08-21 17:10:16.470044+03
23	000100010005	3	1	Gallery	gallery	f	t	/home/gallery/		f		\N	\N	f	3	1	f	2015-08-13 16:40:29.930958+03	2015-08-06 15:40:10.802765+03
52	0001000100080006	4	0	Deltares	deltares	t	f	/home/partners/deltares/		f		\N	\N	f	83	1	f	2015-08-25 09:37:42.415424+03	2015-08-21 16:35:08.499067+03
30	0001000100050001	4	0	Communication/Images	images	t	f	/home/gallery/images/		f		\N	\N	f	33	1	f	2015-08-07 16:48:06.279811+03	2015-08-06 16:07:37.852259+03
63	00010001000F	3	0	Increasing our impact by taking a leading role in development initiatives	media	t	f	/home/media/		f		\N	\N	f	85	1	f	2015-08-22 20:41:43.475238+03	2015-08-21 18:30:42.922058+03
8	0001000100010002	4	0	WATER IS LIFE: THE CURRENT STATUS OF THE MARA RIVER IN KENYA	water-life-current-status-mara-river-kenya	t	f	/home/news/water-life-current-status-mara-river-kenya/		f		\N	\N	f	43	1	f	2015-08-12 10:14:41.466923+03	2015-08-03 16:32:34.202356+03
12	000100020002	3	0	Publicity	publicity	f	t	/tech/publicity/		f		\N	\N	f	42	1	f	2015-08-03 16:40:14.61701+03	2015-08-03 16:40:14.640668+03
11	000100020001	3	0	GIS	gis	f	t	/tech/gis/		f		\N	\N	f	42	1	f	2015-08-03 16:39:46.34096+03	2015-08-03 16:39:46.366498+03
67	000100010008000E	4	0	Egerton University	egerton-university	t	f	/home/partners/egerton-university/		f		\N	\N	f	83	1	f	2015-08-25 09:37:00.57231+03	2015-08-25 09:23:34.799296+03
58	0001000100080009	4	0	Mara Farming	mara-farming	t	f	/home/partners/mara-farming/		f		\N	\N	f	83	1	f	2015-08-21 17:04:04.580582+03	2015-08-21 17:04:04.593968+03
4	000100010001	3	3	News	news	t	f	/home/news/		f		\N	\N	f	45	1	f	2015-08-03 16:29:21.41197+03	2015-08-03 16:29:21.430493+03
32	000100010006	3	0	Gallery2	gallery2	f	t	/home/gallery2/		f		\N	\N	f	73	1	f	2015-08-13 16:42:10.464683+03	2015-08-13 16:42:10.478709+03
39	0001000100090002	4	0	Event Reports	event-reports	t	f	/home/main_category/event-reports/		f		\N	\N	f	42	1	f	2015-08-21 11:39:42.321497+03	2015-08-21 11:39:42.353063+03
3	00010001	2	9	MaMase	home	t	f	/home/		f		\N	\N	f	3	\N	f	2015-08-03 16:28:41.784306+03	2015-08-03 16:28:41.809938+03
40	0001000100090003	4	0	Updates	updates	t	f	/home/main_category/updates/		f		\N	\N	f	42	1	f	2015-08-21 11:40:22.133224+03	2015-08-21 11:40:22.14784+03
57	0001000100080008	4	0	University of Twente	university-twente	t	f	/home/partners/university-twente/		f		\N	\N	f	83	1	f	2015-08-25 09:37:26.789722+03	2015-08-21 16:59:53.960166+03
35	000100010008	3	15	partners	partners	t	f	/home/partners/		f		\N	\N	f	84	1	f	2015-08-25 17:27:17.112125+03	2015-08-21 10:25:06.115586+03
59	000100010008000A	4	0	SNV	snv	t	f	/home/partners/snv/		f		\N	\N	f	83	1	f	2015-08-25 09:38:01.345118+03	2015-08-21 17:07:21.793916+03
65	00010001000G	3	0	About Mamase	about-mamase	t	f	/home/about-mamase/		f		\N	\N	f	85	1	f	2015-08-24 23:46:09.215595+03	2015-08-24 19:15:46.763924+03
61	000100010008000C	4	0	Wageningen University	wageningen-university	t	f	/home/partners/wageningen-university/		f		\N	\N	f	83	1	f	2015-08-25 09:36:40.474328+03	2015-08-21 17:12:14.778341+03
68	000100010008000F	4	0	Mara River Water Resource Association	mara-river-water-resource-association	t	f	/home/partners/mara-river-water-resource-association/		f		\N	\N	f	83	1	f	2015-08-25 09:33:22.214231+03	2015-08-25 09:33:22.235803+03
66	000100010008000D	4	0	Water Resources Management Authority 	water-resources-management-authority	t	f	/home/partners/water-resources-management-authority/		f		\N	\N	f	83	1	f	2015-08-25 09:37:52.419564+03	2015-08-25 09:12:38.859883+03
69	0001000100010003	4	0	MaMaSe partners trained in processing and sharing of GIS data	mamase-partners-trained-processing-and-sharing-gis-data	t	f	/home/news/mamase-partners-trained-processing-and-sharing-gis-data/		f		\N	\N	f	43	1	f	2015-08-25 17:54:09.046345+03	2015-08-25 17:47:41.467243+03
\.


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_page_id_seq', 69, true);


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
5	f	2015-08-03 16:30:59.259057+03	{"search_description": "", "owner": 1, "intro": "<p>An awesome events index page</p>", "latest_revision_created_at": null, "go_live_at": null, "related_links": [{"link_page": null, "title": "google", "link_external": "https://www.google.co.ke", "sort_order": 0, "pk": 1, "page": 6}], "title": "events", "seo_title": "", "slug": "events", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 40, "show_in_menus": false, "path": "000100010003", "url_path": "/home/events/", "expired": false, "pk": 6, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	6	1
1	f	2015-08-03 16:18:35.528164+03	{"body": "", "locked": false, "latest_revision_created_at": null, "title": "MaMase", "numchild": 0, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 2, "first_published_at": null, "has_unpublished_changes": false, "content_type": 3, "path": "00010001", "owner": null, "pk": 3, "url_path": "/home/", "expired": false, "slug": "home", "expire_at": null, "go_live_at": null}	\N	3	1
2	f	2015-08-03 16:28:41.784306+03	{"body": "", "locked": false, "latest_revision_created_at": null, "title": "MaMase", "numchild": 0, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 2, "first_published_at": null, "has_unpublished_changes": false, "content_type": 3, "path": "00010001", "owner": null, "pk": 3, "url_path": "/home/", "expired": false, "slug": "home", "expire_at": null, "go_live_at": null}	\N	3	1
3	f	2015-08-03 16:29:21.41197+03	{"search_description": "", "owner": 1, "intro": "<p>An awesome news page</p>", "latest_revision_created_at": null, "go_live_at": null, "related_links": [{"link_page": null, "title": "google", "link_external": "https://www.google.co.ke", "sort_order": 0, "pk": 1, "page": 4}], "title": "News", "seo_title": "", "slug": "news", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 45, "show_in_menus": false, "path": "00010002", "url_path": "/news/", "expired": false, "pk": 4, "locked": false, "depth": 2, "first_published_at": null, "expire_at": null}	\N	4	1
48	f	2015-08-21 09:36:47.365707+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "first_published_at": null, "go_live_at": null, "title": "MaMaSe 1", "seo_title": "", "slug": "mamase-1", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"image_carousel\\", \\"value\\": [{\\"caption\\": \\"\\", \\"image\\": 18}, {\\"caption\\": \\"\\", \\"image\\": 19}, {\\"caption\\": \\"\\", \\"image\\": 20}, {\\"caption\\": \\"\\", \\"image\\": 21}, {\\"caption\\": \\"\\", \\"image\\": 22}]}]", "numchild": 0, "content_type": 75, "show_in_menus": false, "path": "000100010007", "url_path": "/home/mamase-1/", "expired": false, "pk": 34, "locked": false, "date_modified": "2015-08-21", "author": "mamase", "depth": 3, "date_created": "2015-08-21", "expire_at": null}	\N	34	1
10	f	2015-08-03 16:39:19.37211+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Tech", "seo_title": "", "slug": "tech", "live": true, "has_unpublished_changes": false, "description": "<p>Any content that is tech related</p>", "numchild": 0, "content_type": 42, "show_in_menus": false, "path": "00010002", "url_path": "/tech/", "expired": false, "pk": 10, "locked": false, "name": "Tech", "depth": 2, "first_published_at": null, "expire_at": null}	\N	10	1
12	f	2015-08-03 16:40:14.61701+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Publicity", "seo_title": "", "slug": "publicity", "live": true, "has_unpublished_changes": false, "description": "<p>publicity content</p>", "numchild": 0, "content_type": 42, "show_in_menus": false, "path": "000100020002", "url_path": "/tech/publicity/", "expired": false, "pk": 12, "locked": false, "name": "publicity", "depth": 3, "first_published_at": null, "expire_at": null}	\N	12	1
11	f	2015-08-03 16:39:46.34096+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "GIS", "seo_title": "", "slug": "gis", "live": true, "has_unpublished_changes": false, "description": "<p>GIS Content</p>", "numchild": 0, "content_type": 42, "show_in_menus": false, "path": "000100020001", "url_path": "/tech/gis/", "expired": false, "pk": 11, "locked": false, "name": "GIS", "depth": 3, "first_published_at": null, "expire_at": null}	\N	11	1
106	f	2015-08-21 18:35:43.609344+03	{"search_description": "", "owner": 1, "intro": "<p><b>Michael McClain is Professor of Ecohydrology at UNESCO-IHE. As project leader of MaMaSe, the Mau Mara Serengeti Sustainable Water Initiative, he shares developments and lessons-learned in this ambitious capacity development programme.</b></p>", "latest_revision_created_at": "2015-08-21T15:35:27.162Z", "go_live_at": null, "category": null, "title": "Increasing our impact by taking a leading role in development initiatives", "seo_title": "", "slug": "media", "live": true, "has_unpublished_changes": false, "body": "<p><b>Working from knowledge generation to application</b></p><p>\\u201cMaMaSe is unusual for UNESCO-IHE, because it is not strictly a capacity development, research, or education project. It\\u2019s a large and knowledge-intensive development programme supported mainly by the Dutch Embassy in Kenya focusing on water safety and security at a basin scale. UNESCO-IHE is leading a consortium of Kenyan and international institutions working in all dimensions of the water sector. We are working with government water authorities to generate and apply the knowledge necessary for proper resource management. We are working with small-scale farmers to investigate and adopt water friendly and economically profitable crops, so farmers do not just produce more with the available water but also earn more from what they produce. We are working with pastoralist Maasai communities to improve management of their herds and rangelands to maximize the retention of soil water and the produce more grass. We are also working with financial institutions to introduce new financing mechanisms and Kenyan knowledge institutes to facilitate high levels of knowledge use and exchange.\\u201d</p><p></p><p><b>Different partners, different objectives</b></p><p>\\u201cMaMaSe is opening new forms of partnerships with the private sector. One of our key partners is a Dutch-owned commercial farm in the Mara that sells to European supermarket chains, and which also connects local small-scale farmers to European markets. They see a clear business advantage and we see a means of raising the standard of small farmer practice and profit.\\u201d</p><p></p><p><b>Different forms of capacity development</b></p><p>\\u201cMaMaSe is a very large project (more than 10 partners with a budget of \\u20ac10 million), and there are different forms of capacity development happening inside it. Because we are working side-by-side with implementation partners, we are able to do a lot of on-the-job training. This also enables us to better identify the specific capacity needs of partners and organize group trainings in needed topics, including particular tools and techniques developed within the initiative itself. We are also involving Kenyan and European students as much as we can. This is a great experience for students and ensures their research outputs have maximal societal impact.\\u201d</p><p></p><p><b>Challenges and highlights</b></p><p>\\u201cLeading a major development initiative is a new role for us at UNESCO-IHE and has been an enormous learning experience requiring new ways of organizing our efforts and engaging with partners. We have found it challenging but we\\u2019ve also found that we are up to the task. In this role we are able to enhance our normal research and capacity development activities and have a much larger impact on the ground.\\u201d</p><p></p><p><b>Ensuring that progress is maintained</b></p><p>\\u201cConsideration of the long term impact of our efforts in MaMaSe is part of the entire strategy. It is really challenging to maintain the gains of an initiative like this once the funding ends and international partners move on. Our approach is to work with local partners to build improved capacity and practice into their daily operations and to be considerate of realistic long term funding levels. We are also trying to enhance future funding levels with new financial mechanisms such as water funds. In the end we consider capacity development to be among the wisest investments for long term change. This perspective is something special that UNESCO-IHE offers to development partners, and I hope we will be able to lead many more initiatives like MaMaSe in the future.\\u201d</p><p><br/></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000F", "url_path": "/home/media--/", "expired": false, "pk": 63, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:30:42.922Z", "expire_at": null}	\N	63	1
112	f	2015-08-22 20:41:43.475238+03	{"search_description": "", "owner": 1, "intro": "<p><b>Michael McClain is Professor of Ecohydrology at UNESCO-IHE. As project leader of MaMaSe, the Mau Mara Serengeti Sustainable Water Initiative, he shares developments and lessons-learned in this ambitious capacity development programme.</b></p>", "latest_revision_created_at": "2015-08-22T17:40:39.330Z", "go_live_at": null, "category": null, "title": "Increasing our impact by taking a leading role in development initiatives", "seo_title": "", "slug": "media", "live": true, "has_unpublished_changes": false, "body": "<h5><b>Michael McClain is Professor of Ecohydrology at UNESCO-IHE. As project leader of MaMaSe, the Mau Mara Serengeti Sustainable Water Initiative, he shares developments and lessons-learned in this ambitious capacity development programme.</b></h5><p><b><br/></b></p><p><b>Working from knowledge generation to application</b></p><p>\\u201cMaMaSe is unusual for UNESCO-IHE, because it is not strictly a capacity development, research, or education project. It\\u2019s a large and knowledge-intensive development programme supported mainly by the Dutch Embassy in Kenya focusing on water safety and security at a basin scale. UNESCO-IHE is leading a consortium of Kenyan and international institutions working in all dimensions of the water sector. We are working with government water authorities to generate and apply the knowledge necessary for proper resource management. We are working with small-scale farmers to investigate and adopt water friendly and economically profitable crops, so farmers do not just produce more with the available water but also earn more from what they produce. We are working with pastoralist Maasai communities to improve management of their herds and rangelands to maximize the retention of soil water and the produce more grass. We are also working with financial institutions to introduce new financing mechanisms and Kenyan knowledge institutes to facilitate high levels of knowledge use and exchange.\\u201d</p><p></p><p><b>Different partners, different objectives</b></p><p>\\u201cMaMaSe is opening new forms of partnerships with the private sector. One of our key partners is a Dutch-owned commercial farm in the Mara that sells to European supermarket chains, and which also connects local small-scale farmers to European markets. They see a clear business advantage and we see a means of raising the standard of small farmer practice and profit.\\u201d</p><p></p><p><b>Different forms of capacity development</b></p><p>\\u201cMaMaSe is a very large project (more than 10 partners with a budget of \\u20ac10 million), and there are different forms of capacity development happening inside it. Because we are working side-by-side with implementation partners, we are able to do a lot of on-the-job training. This also enables us to better identify the specific capacity needs of partners and organize group trainings in needed topics, including particular tools and techniques developed within the initiative itself. We are also involving Kenyan and European students as much as we can. This is a great experience for students and ensures their research outputs have maximal societal impact.\\u201d</p><p></p><p><b>Challenges and highlights</b></p><p>\\u201cLeading a major development initiative is a new role for us at UNESCO-IHE and has been an enormous learning experience requiring new ways of organizing our efforts and engaging with partners. We have found it challenging but we\\u2019ve also found that we are up to the task. In this role we are able to enhance our normal research and capacity development activities and have a much larger impact on the ground.\\u201d</p><p></p><p><b>Ensuring that progress is maintained</b></p><p>\\u201cConsideration of the long term impact of our efforts in MaMaSe is part of the entire strategy. It is really challenging to maintain the gains of an initiative like this once the funding ends and international partners move on. Our approach is to work with local partners to build improved capacity and practice into their daily operations and to be considerate of realistic long term funding levels. We are also trying to enhance future funding levels with new financial mechanisms such as water funds. In the end we consider capacity development to be among the wisest investments for long term change. This perspective is something special that UNESCO-IHE offers to development partners, and I hope we will be able to lead many more initiatives like MaMaSe in the future.\\u201d</p><p><br/></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000F", "url_path": "/home/media/", "expired": false, "pk": 63, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:30:42.922Z", "expire_at": null}	\N	63	1
103	f	2015-08-21 18:34:31.770845+03	{"search_description": "", "owner": 1, "intro": "<p><b>Michael McClain is Professor of Ecohydrology at UNESCO-IHE. As project leader of MaMaSe, the Mau Mara Serengeti Sustainable Water Initiative, he shares developments and lessons-learned in this ambitious capacity development programme.</b></p>", "latest_revision_created_at": "2015-08-21T15:30:42.907Z", "go_live_at": null, "category": null, "title": "Increasing our impact by taking a leading role in development initiatives", "seo_title": "", "slug": "media", "live": true, "has_unpublished_changes": false, "body": "<p><b>Working from knowledge generation to application</b></p><p>\\u201cMaMaSe is unusual for UNESCO-IHE, because it is not strictly a capacity development, research, or education project. It\\u2019s a large and knowledge-intensive development programme supported mainly by the Dutch Embassy in Kenya focusing on water safety and security at a basin scale. UNESCO-IHE is leading a consortium of Kenyan and international institutions working in all dimensions of the water sector. We are working with government water authorities to generate and apply the knowledge necessary for proper resource management. We are working with small-scale farmers to investigate and adopt water friendly and economically profitable crops, so farmers do not just produce more with the available water but also earn more from what they produce. We are working with pastoralist Maasai communities to improve management of their herds and rangelands to maximize the retention of soil water and the produce more grass. We are also working with financial institutions to introduce new financing mechanisms and Kenyan knowledge institutes to facilitate high levels of knowledge use and exchange.\\u201d</p><p></p><p><b>Different partners, different objectives</b></p><p>\\u201cMaMaSe is opening new forms of partnerships with the private sector. One of our key partners is a Dutch-owned commercial farm in the Mara that sells to European supermarket chains, and which also connects local small-scale farmers to European markets. They see a clear business advantage and we see a means of raising the standard of small farmer practice and profit.\\u201d</p><p></p><p><b>Different forms of capacity development</b></p><p>\\u201cMaMaSe is a very large project (more than 10 partners with a budget of \\u20ac10 million), and there are different forms of capacity development happening inside it. Because we are working side-by-side with implementation partners, we are able to do a lot of on-the-job training. This also enables us to better identify the specific capacity needs of partners and organize group trainings in needed topics, including particular tools and techniques developed within the initiative itself. We are also involving Kenyan and European students as much as we can. This is a great experience for students and ensures their research outputs have maximal societal impact.\\u201d</p><p></p><p><b>Challenges and highlights</b></p><p>\\u201cLeading a major development initiative is a new role for us at UNESCO-IHE and has been an enormous learning experience requiring new ways of organizing our efforts and engaging with partners. We have found it challenging but we\\u2019ve also found that we are up to the task. In this role we are able to enhance our normal research and capacity development activities and have a much larger impact on the ground.\\u201d</p><p></p><p><b>Ensuring that progress is maintained</b></p><p>\\u201cConsideration of the long term impact of our efforts in MaMaSe is part of the entire strategy. It is really challenging to maintain the gains of an initiative like this once the funding ends and international partners move on. Our approach is to work with local partners to build improved capacity and practice into their daily operations and to be considerate of realistic long term funding levels. We are also trying to enhance future funding levels with new financial mechanisms such as water funds. In the end we consider capacity development to be among the wisest investments for long term change. This perspective is something special that UNESCO-IHE offers to development partners, and I hope we will be able to lead many more initiatives like MaMaSe in the future.\\u201d</p><p><br/></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000F", "url_path": "/home/increasing-our-impact-taking-leading-role-development-initiatives/", "expired": false, "pk": 63, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:30:42.922Z", "expire_at": null}	\N	63	1
144	f	2015-08-25 09:37:00.57231+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-25T06:23:34.784Z", "go_live_at": null, "title": "Egerton University", "seo_title": "", "slug": "egerton-university", "live": true, "has_unpublished_changes": false, "website": "", "bio": "", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "000100010008000E", "url_path": "/home/partners/egerton-university/", "expired": false, "pk": 67, "main_image": 48, "locked": false, "depth": 4, "first_published_at": "2015-08-25T06:23:34.799Z", "expire_at": null}	\N	67	1
163	f	2015-08-25 22:02:58.555973+03	{"search_description": "", "owner": 1, "intro": "", "link_document": null, "latest_revision_created_at": "2015-08-25T19:00:15.306Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><p><b><br/></b></p><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i><br/></i></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i><br/></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><br/></p><p><br/></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><p><i><a id=\\"1\\" linktype=\\"document\\">rangelands_grazing</a><br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/><br/></b><p><b>Uncontrolled grazing</b></p><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><i><br/></i></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy<br/></i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i><br/></i></p><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p><i><a id=\\"2\\" linktype=\\"document\\">rangeland wet areas</a><br/></i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/><br/></b><p><b>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.</p><p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>\\u00a0Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><i><br/></i></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2).</p><p>Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><p><i><br/></i></p><p><i><a id=\\"3\\" linktype=\\"document\\">path erosion</a><br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water cannot be seen.<br/></i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.<br/></i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p><a id=\\"4\\" linktype=\\"document\\">constructed wetlands</a><br/></p><p></p><p></p><p></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
131	f	2015-08-23 16:20:30.917238+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-23T13:19:28.144Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><p><b><br/></b></p><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i><br/></i></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i><br/></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><br/></p><p><br/></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/><br/></b><p><b>Uncontrolled grazing</b></p><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><i><br/></i></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy<br/></i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i><br/></i></p><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/><br/></b><p><b>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.</p><p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>\\u00a0Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><i><br/></i></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water cannot be seen.<br/></i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.<br/></i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
129	f	2015-08-23 16:17:34.396459+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-23T13:15:32.791Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><p><b><br/></b></p><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i><br/></i></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i><br/></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><br/></p><p><br/></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/><br/></b><p><b>Uncontrolled grazing</b></p><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><i><br/></i></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy<br/></i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i><br/></i></p><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/><br/></b><p><b>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.</p><p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>\\u00a0Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><i><br/></i></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water cannot be seen.<br/></i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><i><br/></i></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.<br/></i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
127	f	2015-08-23 16:11:03.957824+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-23T13:05:29.927Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><p><b><br/></b></p><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i><br/></i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/><br/></b><p><b>Uncontrolled grazing</b></p><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><br/></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy</i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/><br/></b><p><b>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.</p><p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>\\u00a0Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b><br/></b></p><p><b><br/></b></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><br/></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water \\u00a0\\u00a0\\u00a0cannot be seen.</i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><br/></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.</i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
124	f	2015-08-23 15:59:12.44432+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-23T12:57:37.713Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><p><b><br/></b></p><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i><br/></i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/><br/></b><p><b>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><br/></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy</i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.<p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b><br/></b></p><p><b><br/></b></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water \\u00a0\\u00a0\\u00a0cannot be seen.</i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><br/></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.</i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p><p></p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
121	f	2015-08-22 22:36:34.439957+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-22T19:19:06.647Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i><br/></i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i></p><p><b>Rules for Wet Areas</b></p><ol><li><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><br/></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy</i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.<p><br/><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b><br/></b></p><p><b><br/></b></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water \\u00a0\\u00a0\\u00a0cannot be seen.</i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><br/></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.</i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
117	f	2015-08-22 22:05:13.210076+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-22T19:03:20.863Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><p></p><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for bo</p><p>th livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact</b></p><p>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i></p><p><b>Rules for Wet Areas</b></p><p></p><ol><li><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><p><br/></p><br/><hr/><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.</p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><b>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p></p><p></p><p></p><hr/><h4><b>Path Erosion</b><br/></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams.<b><br/></b><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><hr/><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p><b>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
94	f	2015-08-21 18:30:42.907299+03	{"search_description": "", "owner": 1, "intro": "<p><b>Michael McClain is Professor of Ecohydrology at UNESCO-IHE. As project leader of MaMaSe, the Mau Mara Serengeti Sustainable Water Initiative, he shares developments and lessons-learned in this ambitious capacity development programme.</b></p>", "latest_revision_created_at": null, "go_live_at": null, "category": null, "title": "Increasing our impact by taking a leading role in development initiatives", "seo_title": "", "slug": "increasing-our-impact-taking-leading-role-development-initiatives", "live": true, "has_unpublished_changes": false, "body": "<p><b>Working from knowledge generation to application</b></p><p>\\u201cMaMaSe is unusual for UNESCO-IHE, because it is not strictly a capacity development, research, or education project. It\\u2019s a large and knowledge-intensive development programme supported mainly by the Dutch Embassy in Kenya focusing on water safety and security at a basin scale. UNESCO-IHE is leading a consortium of Kenyan and international institutions working in all dimensions of the water sector. We are working with government water authorities to generate and apply the knowledge necessary for proper resource management. We are working with small-scale farmers to investigate and adopt water friendly and economically profitable crops, so farmers do not just produce more with the available water but also earn more from what they produce. We are working with pastoralist Maasai communities to improve management of their herds and rangelands to maximize the retention of soil water and the produce more grass. We are also working with financial institutions to introduce new financing mechanisms and Kenyan knowledge institutes to facilitate high levels of knowledge use and exchange.\\u201d</p><p></p><p><b>Different partners, different objectives</b></p><p>\\u201cMaMaSe is opening new forms of partnerships with the private sector. One of our key partners is a Dutch-owned commercial farm in the Mara that sells to European supermarket chains, and which also connects local small-scale farmers to European markets. They see a clear business advantage and we see a means of raising the standard of small farmer practice and profit.\\u201d</p><p></p><p><b>Different forms of capacity development</b></p><p>\\u201cMaMaSe is a very large project (more than 10 partners with a budget of \\u20ac10 million), and there are different forms of capacity development happening inside it. Because we are working side-by-side with implementation partners, we are able to do a lot of on-the-job training. This also enables us to better identify the specific capacity needs of partners and organize group trainings in needed topics, including particular tools and techniques developed within the initiative itself. We are also involving Kenyan and European students as much as we can. This is a great experience for students and ensures their research outputs have maximal societal impact.\\u201d</p><p></p><p><b>Challenges and highlights</b></p><p>\\u201cLeading a major development initiative is a new role for us at UNESCO-IHE and has been an enormous learning experience requiring new ways of organizing our efforts and engaging with partners. We have found it challenging but we\\u2019ve also found that we are up to the task. In this role we are able to enhance our normal research and capacity development activities and have a much larger impact on the ground.\\u201d</p><p></p><p><b>Ensuring that progress is maintained</b></p><p>\\u201cConsideration of the long term impact of our efforts in MaMaSe is part of the entire strategy. It is really challenging to maintain the gains of an initiative like this once the funding ends and international partners move on. Our approach is to work with local partners to build improved capacity and practice into their daily operations and to be considerate of realistic long term funding levels. We are also trying to enhance future funding levels with new financial mechanisms such as water funds. In the end we consider capacity development to be among the wisest investments for long term change. This perspective is something special that UNESCO-IHE offers to development partners, and I hope we will be able to lead many more initiatives like MaMaSe in the future.\\u201d</p><p><br/></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000F", "url_path": "/home/increasing-our-impact-taking-leading-role-development-initiatives/", "expired": false, "pk": 63, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	63	1
6	f	2015-08-03 16:32:34.182833+03	{"search_description": "", "owner": 1, "intro": "<p>Read all about it now.</p>", "latest_revision_created_at": null, "go_live_at": null, "category": null, "title": "Extra Extra", "seo_title": "", "slug": "extra-extra", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p>When Popeye walks out, he is seen with the ducks, quacking. To get the ducks, the Native Americans grab the arrows, which are bent, and shoot them. However, the arrows act like boomerangs, and hit the tribal members instead. Meanwhile, back at the cabin, Native Americans are closing in on the cabin. Olive Oyl blocks them by stretching her legs over the doors, while the tribal members try to invade. Olive screams for help. When Native Americans try to come out of the floorboards, Wimpy is sitting on a chair on the floorboards. The resulting gag depicts when the Indians stretch, Wimpy pours more food into his bowl. When the tribal members finally make it in, Wimpy is thrown out. To get even, Wimpy pulls back a cactus, releasing its thorns. However, Wimpy is met with arrows striking the cactus. Wimpy screams in fear, and runs to Popeye for help. While Popeye walks back to the log cabin, the ducks are seen following Popeye, attracted to the smoke from Popeye's corncob pipe. Wimpy tells Popeye the situation, and after seeing the ducks, he pulls out a fork and knife, sighing in pleasure. When the ducks see the fork and knife, they flee, with Wimpy chasing them from behind. Meanwhile, Olive Oyl is successfully fighting off dozens of the Indians piling into the cabin</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010001", "url_path": "/home/news/extra-extra/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	7	1
145	f	2015-08-25 09:37:26.789722+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-21T13:59:53.946Z", "go_live_at": null, "title": "University of Twente", "seo_title": "", "slug": "university-twente", "live": true, "has_unpublished_changes": false, "website": "http://www.utwente.nl/en/", "bio": "<p>University of Twente is assisting the MaMaSe team in the research. We collect data together and analyze it to better conserve the environment</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080008", "url_path": "/home/partners/university-twente/", "expired": false, "pk": 57, "main_image": 30, "locked": false, "depth": 4, "first_published_at": "2015-08-21T13:59:53.960Z", "expire_at": null}	\N	57	1
49	f	2015-08-21 09:42:54.581029+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-21T06:36:47.365Z", "first_published_at": "2015-08-21T06:36:47.441Z", "go_live_at": null, "title": "MaMaSe Gallery 1", "seo_title": "Gallery", "slug": "mamase-gallery-1", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"image_carousel\\", \\"value\\": [{\\"caption\\": \\"\\", \\"image\\": 18}, {\\"caption\\": \\"\\", \\"image\\": 19}, {\\"caption\\": \\"\\", \\"image\\": 20}, {\\"caption\\": \\"\\", \\"image\\": 21}, {\\"caption\\": \\"\\", \\"image\\": 22}]}]", "numchild": 0, "content_type": 75, "show_in_menus": false, "path": "000100010007", "url_path": "/home/mamase-1/", "expired": false, "pk": 34, "locked": false, "date_modified": "2015-08-21", "author": "mamase", "depth": 3, "date_created": "2015-08-21", "expire_at": null}	\N	34	1
156	f	2015-08-25 17:50:06.439249+03	{"search_description": "", "owner": 1, "intro": "<p><br/></p>", "latest_revision_created_at": "2015-08-25T14:48:23.376Z", "go_live_at": null, "category": null, "title": "MaMaSe partners trained in processing and sharing of GIS data", "seo_title": "", "slug": "mamase-partners-trained-processing-and-sharing-gis-data", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<embed alt=\\"gis-training-mamase\\" embedtype=\\"image\\" format=\\"left\\" id=\\"50\\"/><p><b>From 3 to 7 August, 26 participants from the Water Resources Management Authority, SNV, WWF, Mara Farming and Egerton University followed an intensive 5 day training on the processing of spatial data using open source software such as QGIS and GDAL. Dr. Hans van der Kwast, senior lecturer in ecohydrological modeling at UNESCO-IHE, guided the practical hands-on sessions on converting raw input data (e.g. GPS data, spreadsheets or scanned hardcopy maps) into GIS formats, geoprocessing and map design.</b></p><p><b><br/></b></p><p><b><br/></b></p><p><b><br/></b></p><p>The participants were also introduced to the use of the\\u00a0<a href=\\"http://maps.mamase.org/\\">MaMaSe GeoNode</a>, a Spatial Data Infrastructure (SDI) for up-and downloading data/documents, making online maps and integration with QGIS. This allows project partners and other stakeholders to share their information on the MaMaSe GeoNode which is part of the knowledge exchange centre developed in the project.</p><p>At the end of the training the participants acknowledged that with the acquired skills they are able to improve the data processing chain in their day-to-day work and learned how SDIs can be used to share data.</p><p>During the 5 training days, the amount of data layers in the MaMase GeoNode had increased from 13 to 135, thanks to the efforts of the participants.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-25", "path": "0001000100010003", "url_path": "/home/news/mamase-partners-trained-processing-and-sharing-gis-data/", "expired": false, "pk": 69, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-25T14:47:41.467Z", "expire_at": null}	\N	69	1
113	f	2015-08-22 21:57:08.907979+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-21T15:46:27.966Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"36\\"/>Importance</b><p></p><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><br/><p><b>Fact</b></p><p>Controlled grazing in wet areas will store more water, lead to less erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0<i>Figure 1. A degraded spring area on Enonkishu \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Conservancy where uncontrolled grazing is \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0occurring</i><i>.</i></p><p><b>Rules for Wet Areas</b></p><p></p><ol><li><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><i><br/></i><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 2. A wetland area where grazing has been \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 controlled and Livestock not allowed to enter the \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u2018wet zone\\u2019. These areas will provide important \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 drought grazing areas.</i></p><p><br/></p><br/><hr/><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.</p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><b>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p></p><p></p><p></p><hr/><h4><b>Path Erosion</b><br/></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams.<b><br/></b><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><hr/><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p><b>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
107	f	2015-08-21 18:36:19.542037+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-21T15:34:58.753Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p></p><p>Uncontrolled grazing leads to rangeland degradation. </p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season</p><p>(Figure 1). </p><br/><p><b>Fact</b></p><p>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><br/><p><b>Rules for Controlled Grazing </b></p><p>1. Grazing areas should be divided into blocks and grazing plans devised.<br/>2. Grazing committees need to be formed that decide how grazing is conducted. </p><p>3. Grazing plans should be devised for both wet and dry season grazing. </p><p>4. Livestock should be combined, cattle, sheep and goats.</p><p>5. Bunched herding allows for controlling direction &amp; speed (Figure 2).</p><p><br/></p><p><br/></p><p></p><p></p><h4><b>Path Erosion</b></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams. </p><br/><p><b>Fact</b></p><p>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><br/><p><b>Farmer Solutions</b></p><p>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) \\u2018dig &amp; mound\\u2019 technique at regular intervals (Figure 2).<br/><br/></p><p>Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><br/></p><h4><b>Constructed Wetland \\u00a0</b></h4><p><b><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b></p><p><b><br/></b></p><p><b>What are Constructed Wetlands?</b></p><p>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. \\u00a0There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.<br/><br/></p><p><b>How do CWs work?</b></p><p>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b><br/><br/></b></p><p><b>Advantages of these systems</b></p><ul><li><p>CWs provide up-to 90% efficiency in terms of wastewater treatment.</p></li><li><p>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.</p></li><li><p>No need for chemical/biological products. </p></li><li><p>Relatively low installation and maintenance cost compared to conventional systems.</p></li><li><p>Do not require technical expertise for maintenance.</p></li><li><p>Environmentally friendly and no smell.</p></li><li><p>Are easily tailored to fit different scenarios.</p></li><li><p>Treated water can be re-used.</p></li></ul><p><b><br/></b></p><p><b>MaMaSe offers:</b></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/materials/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
104	f	2015-08-21 18:34:58.753876+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-21T15:28:16.617Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "materials", "live": true, "has_unpublished_changes": false, "body": "<p></p><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p></p><p>Uncontrolled grazing leads to rangeland degradation. </p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season</p><p>(Figure 1). </p><br/><p><b>Fact</b></p><p>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><br/><p><b>Rules for Controlled Grazing </b></p><p>1. Grazing areas should be divided into blocks and grazing plans devised.<br/>2. Grazing committees need to be formed that decide how grazing is conducted. </p><p>3. Grazing plans should be devised for both wet and dry season grazing. </p><p>4. Livestock should be combined, cattle, sheep and goats.</p><p>5. Bunched herding allows for controlling direction &amp; speed (Figure 2).</p><p><br/></p><p><br/></p><p></p><p></p><h4><b>Path Erosion</b></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams. </p><br/><p><b>Fact</b></p><p>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><br/><p><b>Farmer Solutions</b></p><p>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) \\u2018dig &amp; mound\\u2019 technique at regular intervals (Figure 2).<br/><br/></p><p>Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><br/></p><h4><b>Constructed Wetland \\u00a0</b></h4><p><b><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b></p><p><b><br/></b></p><p><b>What are Constructed Wetlands?</b></p><p>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. \\u00a0There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.<br/><br/></p><p><b>How do CWs work?</b></p><p>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b><br/><br/></b></p><p><b>Advantages of these systems</b></p><ul><li><p>CWs provide up-to 90% efficiency in terms of wastewater treatment.</p></li><li><p>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.</p></li><li><p>No need for chemical/biological products. </p></li><li><p>Relatively low installation and maintenance cost compared to conventional systems.</p></li><li><p>Do not require technical expertise for maintenance.</p></li><li><p>Environmentally friendly and no smell.</p></li><li><p>Are easily tailored to fit different scenarios.</p></li><li><p>Treated water can be re-used.</p></li></ul><p><b><br/></b></p><p><b>MaMaSe offers:</b></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/materials/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
118	f	2015-08-22 22:05:57.264645+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-22T19:05:13.210Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><p></p><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for bo</p><p>th livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact</b></p><p>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i></p><p><b>Rules for Wet Areas</b></p><p></p><ol><li><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><p><br/></p><br/><hr/><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.</p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><b>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p></p><p></p><p></p><hr/><h4><b>Path Erosion</b><br/></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams.<b><br/></b><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><hr/><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p><b>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
122	f	2015-08-23 15:54:23.324542+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-22T19:36:34.439Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i><br/></i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><br/></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy</i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.<p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b><br/></b></p><p><b><br/></b></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water \\u00a0\\u00a0\\u00a0cannot be seen.</i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><br/></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.</i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
125	f	2015-08-23 16:00:24.015378+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-23T12:59:12.444Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i><br/></i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/><br/></b><p><b>Uncontrolled grazing</b></p><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><br/></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy</i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/><br/></b><p><b>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.<p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b><br/></b></p><p><b><br/></b></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water \\u00a0\\u00a0\\u00a0cannot be seen.</i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><br/></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.</i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p><p></p><p></p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
128	f	2015-08-23 16:15:32.791755+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-23T13:11:03.957Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><p><b><br/></b></p><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i><br/></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><br/></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/><br/></b><p><b>Uncontrolled grazing</b></p><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy<br/></i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/><br/></b><p><b>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.</p><p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>\\u00a0Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water cannot be seen.<br/></i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><i><br/></i></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.<br/></i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
130	f	2015-08-23 16:19:28.144971+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-23T13:17:34.396Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><p><b><br/></b></p><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i><br/></i></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i><br/></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><br/></p><p><br/></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/><br/></b><p><b>Uncontrolled grazing</b></p><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><i><br/></i></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy<br/></i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i><br/></i></p><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/><br/></b><p><b>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.</p><p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>\\u00a0Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><i><br/></i></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water cannot be seen.<br/></i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.<br/></i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
132	f	2015-08-23 17:31:22.557834+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-23T13:20:30.917Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><p><b><br/></b></p><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i><br/></i></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i><br/></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><br/></p><p><br/></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/><br/></b><p><b>Uncontrolled grazing</b></p><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><i><br/></i></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy<br/></i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i><br/></i></p><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/><br/></b><p><b>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.</p><p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>\\u00a0Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><i><br/></i></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2).</p><p>Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water cannot be seen.<br/></i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.<br/></i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
16	f	2015-08-03 16:49:00.22572+03	{"search_description": "", "video_related_links": [{"link_page": null, "title": "google", "link_external": "https://google.co.ke", "sort_order": 0, "pk": 1, "page": 14}], "owner": 1, "intro": "<p>awesome videos from upande</p>", "latest_revision_created_at": null, "go_live_at": null, "title": "videos", "seo_title": "", "slug": "videos", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 35, "show_in_menus": false, "path": "000100010004", "url_path": "/home/videos/", "expired": false, "pk": 14, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	14	1
105	f	2015-08-21 18:35:27.162789+03	{"search_description": "", "owner": 1, "intro": "<p><b>Michael McClain is Professor of Ecohydrology at UNESCO-IHE. As project leader of MaMaSe, the Mau Mara Serengeti Sustainable Water Initiative, he shares developments and lessons-learned in this ambitious capacity development programme.</b></p>", "latest_revision_created_at": "2015-08-21T15:34:31.770Z", "go_live_at": null, "category": null, "title": "Increasing our impact by taking a leading role in development initiatives", "seo_title": "", "slug": "media--", "live": true, "has_unpublished_changes": false, "body": "<p><b>Working from knowledge generation to application</b></p><p>\\u201cMaMaSe is unusual for UNESCO-IHE, because it is not strictly a capacity development, research, or education project. It\\u2019s a large and knowledge-intensive development programme supported mainly by the Dutch Embassy in Kenya focusing on water safety and security at a basin scale. UNESCO-IHE is leading a consortium of Kenyan and international institutions working in all dimensions of the water sector. We are working with government water authorities to generate and apply the knowledge necessary for proper resource management. We are working with small-scale farmers to investigate and adopt water friendly and economically profitable crops, so farmers do not just produce more with the available water but also earn more from what they produce. We are working with pastoralist Maasai communities to improve management of their herds and rangelands to maximize the retention of soil water and the produce more grass. We are also working with financial institutions to introduce new financing mechanisms and Kenyan knowledge institutes to facilitate high levels of knowledge use and exchange.\\u201d</p><p></p><p><b>Different partners, different objectives</b></p><p>\\u201cMaMaSe is opening new forms of partnerships with the private sector. One of our key partners is a Dutch-owned commercial farm in the Mara that sells to European supermarket chains, and which also connects local small-scale farmers to European markets. They see a clear business advantage and we see a means of raising the standard of small farmer practice and profit.\\u201d</p><p></p><p><b>Different forms of capacity development</b></p><p>\\u201cMaMaSe is a very large project (more than 10 partners with a budget of \\u20ac10 million), and there are different forms of capacity development happening inside it. Because we are working side-by-side with implementation partners, we are able to do a lot of on-the-job training. This also enables us to better identify the specific capacity needs of partners and organize group trainings in needed topics, including particular tools and techniques developed within the initiative itself. We are also involving Kenyan and European students as much as we can. This is a great experience for students and ensures their research outputs have maximal societal impact.\\u201d</p><p></p><p><b>Challenges and highlights</b></p><p>\\u201cLeading a major development initiative is a new role for us at UNESCO-IHE and has been an enormous learning experience requiring new ways of organizing our efforts and engaging with partners. We have found it challenging but we\\u2019ve also found that we are up to the task. In this role we are able to enhance our normal research and capacity development activities and have a much larger impact on the ground.\\u201d</p><p></p><p><b>Ensuring that progress is maintained</b></p><p>\\u201cConsideration of the long term impact of our efforts in MaMaSe is part of the entire strategy. It is really challenging to maintain the gains of an initiative like this once the funding ends and international partners move on. Our approach is to work with local partners to build improved capacity and practice into their daily operations and to be considerate of realistic long term funding levels. We are also trying to enhance future funding levels with new financial mechanisms such as water funds. In the end we consider capacity development to be among the wisest investments for long term change. This perspective is something special that UNESCO-IHE offers to development partners, and I hope we will be able to lead many more initiatives like MaMaSe in the future.\\u201d</p><p><br/></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000F", "url_path": "/home/media/", "expired": false, "pk": 63, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:30:42.922Z", "expire_at": null}	\N	63	1
50	f	2015-08-21 10:25:06.092559+03	{"locked": false, "latest_revision_created_at": null, "title": "partners", "numchild": 0, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 3, "intro": "<p>Here is a list of awesome organizations we have worked with</p>", "first_published_at": null, "has_unpublished_changes": false, "content_type": 84, "path": "000100010008", "owner": 1, "pk": 35, "url_path": "/home/partner/", "expired": false, "slug": "partner", "expire_at": null, "go_live_at": null}	\N	35	1
17	f	2015-08-03 16:49:52.334804+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "category": 12, "title": "iHub 5 year bash", "seo_title": "", "slug": "ihub-5-year-bash", "live": true, "video_link": "https://www.youtube.com/embed/fjsTlrvAT3g", "has_unpublished_changes": false, "description": "<p>Luchiri talks about Upande at the iHub bash</p>", "numchild": 0, "content_type": 36, "show_in_menus": false, "path": "0001000100040001", "url_path": "/home/videos/ihub-5-year-bash/", "expired": false, "pk": 15, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	15	1
24	f	2015-08-06 18:34:54.888172+03	{"image6_caption": "puppies", "search_description": "", "owner": 1, "image1_caption": "starfish", "image2": 3, "latest_revision_created_at": "2015-08-06T13:07:37.821Z", "go_live_at": null, "image4_caption": "tiger", "title": "Communication/Images", "image5_caption": "chicks 2", "seo_title": "", "slug": "images", "live": true, "has_unpublished_changes": false, "numchild": 0, "image2_caption": "chicks", "content_type": 33, "show_in_menus": false, "image3": 4, "path": "0001000100050001", "image1": 2, "url_path": "/home/gallery/communicationimages/", "expired": false, "pk": 30, "image5": 6, "image4": 5, "image6": 7, "locked": false, "image3_caption": "wolf", "depth": 4, "first_published_at": "2015-08-06T13:07:37.852Z", "expire_at": null}	\N	30	1
18	f	2015-08-03 16:51:46.029775+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "category": 11, "title": "More than a Map", "seo_title": "", "slug": "more-map", "live": true, "video_link": "https://www.youtube.com/embed/_JFRsdNTpSs", "has_unpublished_changes": false, "description": "<p>Mark and Bernadette talk to Google about GIS</p>", "numchild": 0, "content_type": 36, "show_in_menus": false, "path": "0001000100040002", "url_path": "/home/videos/more-map/", "expired": false, "pk": 16, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	16	1
146	f	2015-08-25 09:37:42.415424+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-21T13:38:59.032Z", "go_live_at": null, "title": "Deltares", "seo_title": "", "slug": "deltares", "live": true, "has_unpublished_changes": false, "website": "https://www.deltares.nl/en/", "bio": "<p>Deltares is focus on conservation and partners with MaMaSe because we share a common goal. They are providing funding and mentorship to the team on the ground</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080006", "url_path": "/home/partners/deltares/", "expired": false, "pk": 52, "main_image": 28, "locked": false, "depth": 4, "first_published_at": "2015-08-21T13:35:08.499Z", "expire_at": null}	\N	52	1
108	f	2015-08-21 18:37:40.714964+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-21T15:36:19.542Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p></p><p>Uncontrolled grazing leads to rangeland degradation. </p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season</p><p>(Figure 1). </p><br/><p><b>Fact</b></p><p>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><br/><p><b>Rules for Controlled Grazing </b></p><p>1. Grazing areas should be divided into blocks and grazing plans devised.<br/>2. Grazing committees need to be formed that decide how grazing is conducted. </p><p>3. Grazing plans should be devised for both wet and dry season grazing. </p><p>4. Livestock should be combined, cattle, sheep and goats.</p><p>5. Bunched herding allows for controlling direction &amp; speed (Figure 2).</p><p><br/></p><p><br/></p><p></p><p></p><h4><b>Path Erosion</b></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams. </p><br/><p><b>Fact</b></p><p>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><br/><p><b>Farmer Solutions</b></p><p>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) \\u2018dig &amp; mound\\u2019 technique at regular intervals (Figure 2).<br/><br/></p><p>Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><br/></p><h4><b>Constructed Wetland \\u00a0</b></h4><p><b><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b></p><p><b><br/></b></p><p><b>What are Constructed Wetlands?</b></p><p>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. \\u00a0There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.<br/><br/></p><p><b>How do CWs work?</b></p><p>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b><br/><br/></b></p><p><b>Advantages of these systems</b></p><ul><li><p>CWs provide up-to 90% efficiency in terms of wastewater treatment.</p></li><li><p>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.</p></li><li><p>No need for chemical/biological products. </p></li><li><p>Relatively low installation and maintenance cost compared to conventional systems.</p></li><li><p>Do not require technical expertise for maintenance.</p></li><li><p>Environmentally friendly and no smell.</p></li><li><p>Are easily tailored to fit different scenarios.</p></li><li><p>Treated water can be re-used.</p></li></ul><p><b><br/></b></p><p><b>MaMaSe offers:</b></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
114	f	2015-08-22 22:01:03.145123+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-22T18:57:08.907Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><p></p><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for bo</p><p>th livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p><p><b>Fact</b></p><p>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0Figure 1. A degraded spring area on Enonkishu \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Conservancy where uncontrolled grazing is \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0occurring<i>.</i></p><p><b>Rules for Wet Areas</b></p><p></p><ol><li><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><i><br/></i><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 2. A wetland area where grazing has been \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 controlled and Livestock not allowed to enter the \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u2018wet zone\\u2019. These areas will provide important \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 drought grazing areas.</i></p><p><br/></p><br/><hr/><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.</p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><b>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p></p><p></p><p></p><hr/><h4><b>Path Erosion</b><br/></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams.<b><br/></b><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><hr/><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p><b>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
119	f	2015-08-22 22:13:09.356312+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-22T19:05:57.264Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><p></p><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for bo</p><p>th livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact</b></p><p>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i></p><p><b>Rules for Wet Areas</b></p><p></p><ol><li><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.</p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><b>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p></p><p></p><p></p><hr/><h4><b>Path Erosion</b><br/></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams.<b><br/></b><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><hr/><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p><b>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
123	f	2015-08-23 15:57:37.713253+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-23T12:54:23.324Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i><br/></i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><br/></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy</i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.<p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b><br/></b></p><p><b><br/></b></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water \\u00a0\\u00a0\\u00a0cannot be seen.</i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><br/></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.</i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
126	f	2015-08-23 16:05:29.927242+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-23T13:00:24.015Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i><br/></i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/><br/></b><p><b>Uncontrolled grazing</b></p><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><br/></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy</i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/><br/></b><p><b>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.</p><p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b><br/></b></p><p><b><br/></b></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><br/></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water \\u00a0\\u00a0\\u00a0cannot be seen.</i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><br/></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.</i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
19	f	2015-08-03 16:55:02.691614+03	{"search_description": "", "owner": 1, "cost": 0, "latest_revision_created_at": null, "go_live_at": null, "category": null, "title": "Awesome upande event", "seo_title": "", "slug": "awesome-upande-event", "live": true, "location": "<p>United Bible Societies, Ngong Road, Kenya</p>", "has_unpublished_changes": false, "start_date": "2015-08-04T18:00:00Z", "body": "<p>Come and pick the brains of some of the brightest minds in GIS</p>", "end_date": "2015-08-10T18:00:00Z", "numchild": 0, "maps_url": "https://www.google.co.ke/maps/place/United+Bible+Societies/@-1.2972928,36.7766541,18z/data=!4m7!1m4!3m3!1s0x182f1a74a1656165:0xdbc32224ee89f89c!2sUnited+Bible+Societies!3b1!3m1!1s0x182f1a74a1656165:0x", "content_type": 38, "show_in_menus": false, "path": "0001000100030001", "url_path": "/home/events/awesome-upande-event/", "expired": false, "pk": 17, "main_image": 1, "locked": false, "tagged_items": [], "depth": 4, "first_published_at": null, "expire_at": null}	\N	17	1
20	f	2015-08-03 16:55:02.691614+03	{"seo_title": "", "owner": 1, "cost": 0, "latest_revision_created_at": null, "go_live_at": null, "category": null, "title": "Awesome upande event", "search_description": "", "live": true, "location": "<p>United Bible Societies, Ngong Road, Kenya</p>", "has_unpublished_changes": false, "start_date": "2015-08-04T18:00:00Z", "body": "<p>Come and pick the brains of some of the brightest minds in GIS</p>", "end_date": "2015-08-10T18:00:00Z", "numchild": 0, "main_image": 1, "content_type": 38, "show_in_menus": false, "path": "0001000100030001", "url_path": "/home/events/awesome-upande-event/", "expired": false, "slug": "awesome-upande-event", "maps_url": "https://www.google.co.ke/maps/place/United+Bible+Societies/@-1.2972928,36.7766541,18z/data=!4m7!1m4!3m3!1s0x182f1a74a1656165:0xdbc32224ee89f89c!2sUnited+Bible+Societies!3b1!3m1!1s0x182f1a74a1656165:0x", "locked": false, "pk": 18, "tagged_items": [], "depth": 4, "first_published_at": null, "expire_at": null}	\N	18	1
21	f	2015-08-03 16:55:21.193135+03	{"search_description": "", "owner": 1, "cost": 0, "latest_revision_created_at": "2015-08-03T13:55:02.691Z", "go_live_at": null, "category": null, "title": "another upande event", "seo_title": "", "slug": "another-upande-event", "live": true, "location": "<p>United Bible Societies, Ngong Road, Kenya</p>", "has_unpublished_changes": false, "start_date": "2015-08-04T18:00:00Z", "body": "<p>Come and pick the brains of some of the brightest minds in GIS</p>", "end_date": "2015-08-10T18:00:00Z", "numchild": 0, "maps_url": "https://www.google.co.ke/maps/place/United+Bible+Societies/@-1.2972928,36.7766541,18z/data=!4m7!1m4!3m3!1s0x182f1a74a1656165:0xdbc32224ee89f89c!2sUnited+Bible+Societies!3b1!3m1!1s0x182f1a74a1656165:0x", "content_type": 38, "show_in_menus": false, "path": "0001000100030002", "url_path": "/home/events/awesome-upande-event/", "expired": false, "pk": 18, "main_image": 1, "locked": false, "tagged_items": [], "depth": 4, "first_published_at": "2015-08-03T13:55:02.706Z", "expire_at": null}	\N	18	1
22	f	2015-08-06 15:40:10.759804+03	{"body": "", "locked": false, "latest_revision_created_at": null, "title": "Gallery", "numchild": 0, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 3, "first_published_at": null, "has_unpublished_changes": false, "content_type": 3, "path": "000100010005", "owner": 1, "pk": 23, "url_path": "/home/gallery/", "expired": false, "slug": "gallery", "expire_at": null, "go_live_at": null}	\N	23	1
27	f	2015-08-10 13:27:48.717942+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Test", "seo_title": "", "slug": "test", "live": true, "has_unpublished_changes": false, "description": "<p>Test test test</p>", "numchild": 0, "content_type": 42, "show_in_menus": false, "path": "000100020003", "url_path": "/tech/test/", "expired": false, "pk": 31, "locked": false, "name": "Test", "depth": 3, "first_published_at": null, "expire_at": null}	\N	31	1
51	f	2015-08-21 10:25:34.509596+03	{"locked": false, "latest_revision_created_at": "2015-08-21T07:25:06.092Z", "title": "partners", "numchild": 0, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 3, "intro": "<p>Here is a list of awesome organizations we have worked with</p>", "first_published_at": "2015-08-21T07:25:06.115Z", "has_unpublished_changes": false, "content_type": 84, "path": "000100010008", "owner": 1, "pk": 35, "url_path": "/home/partner/", "expired": false, "slug": "partners", "expire_at": null, "go_live_at": null}	\N	35	1
26	f	2015-08-07 16:48:06.279811+03	{"image6_caption": "Plateau", "search_description": "", "owner": 1, "image1_caption": "Deforestation in Mara Forest", "image2": 9, "latest_revision_created_at": "2015-08-07T13:45:01.966Z", "go_live_at": null, "image4_caption": "Wildebeest crossing", "title": "Communication/Images", "image5_caption": "Mara's River source", "seo_title": "", "slug": "images", "live": true, "has_unpublished_changes": false, "numchild": 0, "image2_caption": "Elephants crossing Mara River", "content_type": 33, "show_in_menus": false, "image3": 10, "path": "0001000100050001", "image1": 8, "url_path": "/home/gallery/images/", "expired": false, "pk": 30, "image5": 12, "image4": 11, "image6": 13, "locked": false, "image3_caption": "Charcoal burning in Mara Forest", "depth": 4, "first_published_at": "2015-08-06T13:07:37.852Z", "expire_at": null}	\N	30	1
23	f	2015-08-06 16:07:37.821989+03	{"image6_caption": "puppies", "search_description": "", "owner": 1, "image1_caption": "starfish", "image2": 3, "latest_revision_created_at": null, "go_live_at": null, "image4_caption": "tiger", "title": "Communication/Images", "image5_caption": "chicks 2", "seo_title": "", "slug": "communicationimages", "live": true, "has_unpublished_changes": false, "numchild": 0, "image2_caption": "chicks", "content_type": 33, "show_in_menus": false, "image3": 4, "path": "0001000100050001", "image1": 2, "url_path": "/home/gallery/communicationimages/", "expired": false, "pk": 30, "image5": 6, "image4": 5, "image6": 7, "locked": false, "image3_caption": "wolf", "depth": 4, "first_published_at": null, "expire_at": null}	\N	30	1
25	f	2015-08-07 16:45:01.96657+03	{"image6_caption": "puppies", "search_description": "", "owner": 1, "image1_caption": "Deforestation in Mara Forest", "image2": 3, "latest_revision_created_at": "2015-08-06T15:34:54.888Z", "go_live_at": null, "image4_caption": "tiger", "title": "Communication/Images", "image5_caption": "chicks 2", "seo_title": "", "slug": "images", "live": true, "has_unpublished_changes": false, "numchild": 0, "image2_caption": "chicks", "content_type": 33, "show_in_menus": false, "image3": 4, "path": "0001000100050001", "image1": 8, "url_path": "/home/gallery/images/", "expired": false, "pk": 30, "image5": 6, "image4": 5, "image6": 7, "locked": false, "image3_caption": "wolf", "depth": 4, "first_published_at": "2015-08-06T13:07:37.852Z", "expire_at": null}	\N	30	1
115	f	2015-08-22 22:02:04.568001+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-22T19:01:03.145Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><p></p><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for bo</p><p>th livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact</b></p><p>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Figure 1. A degraded spring area on Enonkishu \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Conservancy where uncontrolled grazing is \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0occurring<i>.</i></p><p><b>Rules for Wet Areas</b></p><p></p><ol><li><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><i><br/></i><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Figure 2. A wetland area where grazing has been \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 controlled and Livestock not allowed to enter the \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u2018wet zone\\u2019. These areas will provide important \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 drought grazing areas.</i></p><p><br/></p><br/><hr/><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.</p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><b>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p></p><p></p><p></p><hr/><h4><b>Path Erosion</b><br/></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams.<b><br/></b><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><hr/><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p><b>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
120	f	2015-08-22 22:19:06.647861+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-22T19:13:09.356Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><p></p><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for bo</p><p>th livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact</b></p><p>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i></p><p><b>Rules for Wet Areas</b></p><p></p><ol><li><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><hr/><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.</p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy<br/></i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p></p><p></p><p></p><hr/><h4><b>Path Erosion</b><br/></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams.<b><br/></b><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><hr/><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p><b>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
109	f	2015-08-21 18:45:11.617422+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-21T15:37:40.714Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b>Importance</b><p></p><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><br/><p><b>Fact</b></p><p>Controlled grazing in wet areas will store more water, lead to less erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><b><br/></b><p><b>Rules for Wet Areas</b></p><p>1. Bunched herding for controlled entry and exit to wet areas.</p><p>2. Livestock should exit as soon as finished drinking. </p><p>3. Livestock should never graze permanent \\u2018wet zones\\u2019 (Figure 1).</p><p>4. A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).</p><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.<p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><b>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p></p><p></p><p></p><h4><b>Path Erosion</b><br/></h4><b>Farmer Challenges</b></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams.<b><br/></b><br/><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p><b>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
7	f	2015-08-03 16:32:34.182833+03	{"seo_title": "", "owner": 1, "intro": "<p>Read all about it now.</p>", "latest_revision_created_at": null, "go_live_at": null, "category": null, "title": "Extra Extra", "search_description": "", "live": true, "has_unpublished_changes": false, "pk": 8, "tagged_items": [], "body": "<p>When Popeye walks out, he is seen with the ducks, quacking. To get the ducks, the Native Americans grab the arrows, which are bent, and shoot them. However, the arrows act like boomerangs, and hit the tribal members instead. Meanwhile, back at the cabin, Native Americans are closing in on the cabin. Olive Oyl blocks them by stretching her legs over the doors, while the tribal members try to invade. Olive screams for help. When Native Americans try to come out of the floorboards, Wimpy is sitting on a chair on the floorboards. The resulting gag depicts when the Indians stretch, Wimpy pours more food into his bowl. When the tribal members finally make it in, Wimpy is thrown out. To get even, Wimpy pulls back a cactus, releasing its thorns. However, Wimpy is met with arrows striking the cactus. Wimpy screams in fear, and runs to Popeye for help. While Popeye walks back to the log cabin, the ducks are seen following Popeye, attracted to the smoke from Popeye's corncob pipe. Wimpy tells Popeye the situation, and after seeing the ducks, he pulls out a fork and knife, sighing in pleasure. When the ducks see the fork and knife, they flee, with Wimpy chasing them from behind. Meanwhile, Olive Oyl is successfully fighting off dozens of the Indians piling into the cabin</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010001", "url_path": "/home/news/extra-extra/", "expired": false, "slug": "extra-extra", "main_image": null, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	8	1
133	f	2015-08-24 19:15:46.684787+03	{"search_description": "", "owner": 1, "intro": "<p>None</p>", "latest_revision_created_at": null, "go_live_at": null, "category": null, "title": "About Mamase", "seo_title": "", "slug": "about-mamase", "live": true, "has_unpublished_changes": false, "body": "<p>The MaMaSe Sustainable Water Initiative is aimed at improving water safety and security in the Mara River Basin to support structural poverty reduction, sustainable economic growth and conservation of the basin\\u2019s ecosystems. In this four year programme the people and institutions in the basin will be supported in a process of structural change, promoting water-wise economic development that lifts people out of poverty and sets them on a sustainable path to improved well being and self-reliance.</p><p><p>The Initiative, which is\\u00a0financially supported by the Netherlands Embassy in Nairobi, Kenya,\\u00a0consists of a broad-based public private partnership including international and Kenyan government agencies, civil society, private sector, NGOs, and knowledge institutions. It is led by UNESCO-IHE together with WWF Kenya. The partners envision a basin where:</p><p></p><ul><li>Capable government institutions develop effective river basin management strategies for inclusive green growth through participatory processes. Water resources are regulated for the benefit of people and ecosystems.\\u00a0</li></ul><ul><li>Basin residents prosper from economic activities that are financially profitable, environmentally sustainable, and well aligned with the basin water management strategy. Innovative agricultural practices and sustainable tourism facilities are promoted.</li></ul><ul><li>Key forest and savannah ecosystems are protected or restored and wildlife has access to habitats and water resources needed at different times of the year and especially during drought years.</li></ul><ul><li>These interconnected public, private, and environmental elements of the basin serve as a model of sustainability for surrounding basins, with transferrable tools and approaches.</li></ul><p></p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-24", "path": "00010001000G", "url_path": "/home/about-mamase/", "expired": false, "pk": 65, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	65	1
52	f	2015-08-21 10:53:31.675029+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "HSBC", "seo_title": "", "slug": "hsbc", "live": true, "has_unpublished_changes": false, "website": "https://www.hsbc.co.uk/1/2/", "bio": "<p>HSBC has been our strategic partner since the inception of this project. They bring a wealth of experience assisting other conservation projects into the MaMaSe project. We look forward to working with them for a very long time.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080001", "url_path": "/home/partners/hsbc/", "expired": false, "pk": 36, "main_image": 23, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	36	1
66	f	2015-08-21 16:26:05.302373+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "WWF", "seo_title": "", "slug": "wwf", "live": true, "has_unpublished_changes": false, "website": "http://wwf.panda.org/", "bio": "<p>The World Wide fund is actively championing for the conservation of the enviroment and partnered with us so that we could do it together</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080005", "url_path": "/home/partners/wwf/", "expired": false, "pk": 47, "main_image": 27, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	47	1
147	f	2015-08-25 09:37:52.419564+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-25T06:12:38.845Z", "go_live_at": null, "title": "Water Resources Management Authority ", "seo_title": "", "slug": "water-resources-management-authority", "live": true, "has_unpublished_changes": false, "website": "", "bio": "", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "000100010008000D", "url_path": "/home/partners/water-resources-management-authority/", "expired": false, "pk": 66, "main_image": 47, "locked": false, "depth": 4, "first_published_at": "2015-08-25T06:12:38.859Z", "expire_at": null}	\N	66	1
110	f	2015-08-21 18:46:27.966908+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-21T15:45:11.617Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b>Importance</b><p></p><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><br/><p><b>Fact</b></p><p>Controlled grazing in wet areas will store more water, lead to less erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><b><br/></b><p><b>Rules for Wet Areas</b></p><p></p><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.</p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><b>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p></p><p></p><p></p><h4><b>Path Erosion</b><br/></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams.<b><br/></b><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p><b>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
116	f	2015-08-22 22:03:20.8635+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": "2015-08-22T19:02:04.568Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><img/>Importance</b><p></p><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for bo</p><p>th livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact</b></p><p>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Figure 1. A degraded spring area on Enonkishu \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Conservancy where uncontrolled grazing is \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0occurring<i>.</i></p><p><b>Rules for Wet Areas</b></p><p></p><ol><li><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><i><br/></i></p><p><i>Figure 2. A wetland area where grazing has been \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 controlled and Livestock not allowed to enter the \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u2018wet zone\\u2019. These areas will provide important \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 drought grazing areas.</i></p><p><br/></p><br/><hr/><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p>Uncontrolled grazing leads to rangeland degradation.</p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><b>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p></p><p></p><p></p><hr/><h4><b>Path Erosion</b><br/></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams.<b><br/></b><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><b>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2). \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><hr/><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p><b>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
134	f	2015-08-24 23:46:09.215595+03	{"search_description": "", "owner": 1, "intro": "<p>None</p>", "latest_revision_created_at": "2015-08-24T16:15:46.684Z", "go_live_at": null, "category": null, "title": "About Mamase", "seo_title": "", "slug": "about-mamase", "live": true, "has_unpublished_changes": false, "body": "<p>The MaMaSe Sustainable Water Initiative is aimed at improving water safety and security in the Mara River Basin to support structural poverty reduction, sustainable economic growth and conservation of the basin\\u2019s ecosystems. In this four year programme the people and institutions in the basin will be supported in a process of structural change, promoting water-wise economic development that lifts people out of poverty and sets them on a sustainable path to improved well being and self-reliance.</p><p></p><p>The Initiative, which is\\u00a0financially supported by the Netherlands Embassy in Nairobi, Kenya,\\u00a0consists of a broad-based public private partnership including international and Kenyan government agencies, civil society, private sector, NGOs, and knowledge institutions. It is led by UNESCO-IHE together with WWF Kenya. The partners envision a basin where:</p><p></p><ul><li>Capable government institutions develop effective river basin management strategies for inclusive green growth through participatory processes. Water resources are regulated for the benefit of people and ecosystems.\\u00a0</li></ul><ul><li>Basin residents prosper from economic activities that are financially profitable, environmentally sustainable, and well aligned with the basin water management strategy. Innovative agricultural practices and sustainable tourism facilities are promoted.</li></ul><ul><li>Key forest and savannah ecosystems are protected or restored and wildlife has access to habitats and water resources needed at different times of the year and especially during drought years.</li></ul><ul><li>These interconnected public, private, and environmental elements of the basin serve as a model of sustainability for surrounding basins, with transferrable tools and approaches.</li></ul><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-24", "path": "00010001000G", "url_path": "/home/about-mamase/", "expired": false, "pk": 65, "locked": false, "depth": 3, "first_published_at": "2015-08-24T16:15:46.763Z", "expire_at": null}	\N	65	1
53	f	2015-08-21 11:17:20.337524+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "main_category", "seo_title": "", "slug": "main_category", "live": true, "has_unpublished_changes": false, "description": "<p>A header category. Meant to contain the other categories and not to be a category itself</p>", "numchild": 0, "content_type": 42, "show_in_menus": false, "path": "000100010009", "url_path": "/home/main_category/", "expired": false, "pk": 37, "locked": false, "name": "main_category", "depth": 3, "first_published_at": null, "expire_at": null}	\N	37	1
111	f	2015-08-22 20:40:39.330088+03	{"search_description": "", "owner": 1, "intro": "<p><b>Michael McClain is Professor of Ecohydrology at UNESCO-IHE. As project leader of MaMaSe, the Mau Mara Serengeti Sustainable Water Initiative, he shares developments and lessons-learned in this ambitious capacity development programme.</b></p>", "latest_revision_created_at": "2015-08-21T15:35:43.609Z", "go_live_at": null, "category": null, "title": "Increasing our impact by taking a leading role in development initiatives", "seo_title": "", "slug": "media", "live": true, "has_unpublished_changes": false, "body": "<h5><b>Michael McClain is Professor of Ecohydrology at UNESCO-IHE. As project leader of MaMaSe, the Mau Mara Serengeti Sustainable Water Initiative, he shares developments and lessons-learned in this ambitious capacity development programme.</b></h5><p><b>Working from knowledge generation to application</b></p><p>\\u201cMaMaSe is unusual for UNESCO-IHE, because it is not strictly a capacity development, research, or education project. It\\u2019s a large and knowledge-intensive development programme supported mainly by the Dutch Embassy in Kenya focusing on water safety and security at a basin scale. UNESCO-IHE is leading a consortium of Kenyan and international institutions working in all dimensions of the water sector. We are working with government water authorities to generate and apply the knowledge necessary for proper resource management. We are working with small-scale farmers to investigate and adopt water friendly and economically profitable crops, so farmers do not just produce more with the available water but also earn more from what they produce. We are working with pastoralist Maasai communities to improve management of their herds and rangelands to maximize the retention of soil water and the produce more grass. We are also working with financial institutions to introduce new financing mechanisms and Kenyan knowledge institutes to facilitate high levels of knowledge use and exchange.\\u201d</p><p></p><p><b>Different partners, different objectives</b></p><p>\\u201cMaMaSe is opening new forms of partnerships with the private sector. One of our key partners is a Dutch-owned commercial farm in the Mara that sells to European supermarket chains, and which also connects local small-scale farmers to European markets. They see a clear business advantage and we see a means of raising the standard of small farmer practice and profit.\\u201d</p><p></p><p><b>Different forms of capacity development</b></p><p>\\u201cMaMaSe is a very large project (more than 10 partners with a budget of \\u20ac10 million), and there are different forms of capacity development happening inside it. Because we are working side-by-side with implementation partners, we are able to do a lot of on-the-job training. This also enables us to better identify the specific capacity needs of partners and organize group trainings in needed topics, including particular tools and techniques developed within the initiative itself. We are also involving Kenyan and European students as much as we can. This is a great experience for students and ensures their research outputs have maximal societal impact.\\u201d</p><p></p><p><b>Challenges and highlights</b></p><p>\\u201cLeading a major development initiative is a new role for us at UNESCO-IHE and has been an enormous learning experience requiring new ways of organizing our efforts and engaging with partners. We have found it challenging but we\\u2019ve also found that we are up to the task. In this role we are able to enhance our normal research and capacity development activities and have a much larger impact on the ground.\\u201d</p><p></p><p><b>Ensuring that progress is maintained</b></p><p>\\u201cConsideration of the long term impact of our efforts in MaMaSe is part of the entire strategy. It is really challenging to maintain the gains of an initiative like this once the funding ends and international partners move on. Our approach is to work with local partners to build improved capacity and practice into their daily operations and to be considerate of realistic long term funding levels. We are also trying to enhance future funding levels with new financial mechanisms such as water funds. In the end we consider capacity development to be among the wisest investments for long term change. This perspective is something special that UNESCO-IHE offers to development partners, and I hope we will be able to lead many more initiatives like MaMaSe in the future.\\u201d</p><p><br/></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000F", "url_path": "/home/media/", "expired": false, "pk": 63, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:30:42.922Z", "expire_at": null}	\N	63	1
29	f	2015-08-10 14:20:18.269534+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-03T13:51:46.029Z", "go_live_at": null, "category": 11, "title": "MAMASE Mau Mara Serengeti Sustainable Water Initiative", "seo_title": "", "slug": "mamase-mau-mara-serengeti-sustainable-water-initiative", "live": true, "video_link": "https://www.youtube.com/embed/PmQLKBTKOxg", "has_unpublished_changes": false, "description": "<p>Mark and Bernadette talk to Google about GIS</p>", "numchild": 0, "content_type": 36, "show_in_menus": false, "path": "0001000100040002", "url_path": "/home/videos/more-map/", "expired": false, "pk": 16, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:51:46.043Z", "expire_at": null}	\N	16	1
30	f	2015-08-10 14:29:15.834993+03	{"search_description": "", "owner": 1, "intro": "<p>The on-going season has put a lot of stress on the Mara and other parts of the region. The Mara River and its two main tributaries, Amala and Nyangores, have recorded low discharge levels.<br/></p>", "latest_revision_created_at": "2015-08-10T10:29:11.623Z", "go_live_at": null, "category": 31, "title": "WATER IS LIFE: THE CURRENT STATUS OF THE MARA RIVER IN KENYA", "seo_title": "", "slug": "water-life-current-status-mara-river-kenya", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<h2>RAPID ASSESSMENT</h2><p><a href=\\"http://www.unesco-ihe.org/sites/default/files/styles/large/public/mamase-photo-2_0.png?itok=Nw8afbqx\\"><img src=\\"http://www.unesco-ihe.org/sites/default/files/styles/unesco_news_overview/public/mamase-photo-2_0.png?itok=o3f9Vkzw\\"/></a></p><p>The current low river flows have negative effects on water quality, quantity and the habitat available for fish and invertebrates community. The inefficient and poorly regulated uses of water for agriculture and other forms of development will be controlled and optimized through strategic planning, careful monitoring and regulation of the resources by water authorities.</p><p>In late March, the MaMaSe Initiative, through its partners in Mara River Basin, conducted a Rapid Assessment test along the Mara River and its tributaries. The assessment aimed to determine water quality variables along various sites along the Mara River and its<br/>tributaries, assess habitat quality and diversity at the various sites, conduct a rapid assessment of invertrabrates communities and relate their composition to habitat diversity to water quality and assess the water quality and quantity status in relation to animal and human use.</p><p>As the team began the assessment up stream of the Amala Tributary at the Masese point, it became clear that the flow of the river had significantly reduced. Various tests including turbidity, pH and residual compositions tests showed that human and animal activity continues to ultimately control the quality of the water. According to Dr. Frank Masese of the research team, most of the pool samples carried out indicated a large amount of organic waste that reduced the oxygenation levels of the waters at all points. As the team progressed to midstream levels, local residents were curious to see what the initial findings for their water source would reveal.</p><h2>LOCAL RESIDENTS OBSERVATIONS</h2><p><a href=\\"http://www.unesco-ihe.org/sites/default/files/styles/large/public/story_mamase.png?itok=XVG4RQVh\\"><img src=\\"http://www.unesco-ihe.org/sites/default/files/styles/unesco_news_overview/public/story_mamase.png?itok=5xQFiLyc\\"/></a></p><p>Conversations with the local residents about diminished flows and quality of the river, pointed out the prolonged dry spell the region is currently experiencing.\\u00a0Esther Chepchirchir, a resident of the village Kapkoliwa on the Amala River, confirmed that over the years she has seen the water levels steadily but gradually reduce. She could relate the gradual decline of the water quality and quantity to human activities such as deforestation, poor land use especially on riparian land.</p><p>Further downstream the Mara River at the Mara Bridge, the impact of the dry spell was more evident. Turbidity and residual organic matter had very high readings indicating heavy human and animal contamination. At every point where the team sampled, cattle was seeking water directly at the source. Other activities by the residents such as doing laundry, bathing, and washing of cars and motor cycles right at the banks of the river were also visible.</p><h2>MONITORING THE WATER LEVELS THROUGH LOW COST EQUIPMENT</h2><p><a href=\\"http://www.unesco-ihe.org/sites/default/files/styles/large/public/story_mamase_2.png?itok=Z6bGdzoC\\"><img src=\\"http://www.unesco-ihe.org/sites/default/files/styles/unesco_news_overview/public/story_mamase_2.png?itok=Iro-NqQX\\"/></a></p><p>The MaMaSe Initiative addresses water quality monitoring from a management perspective of the entire basin. The Initiative is supporting the Water Resources Management Authority (<a href=\\"http://www.wrma.or.ke/\\">WRMA)</a>\\u00a0in the operationalization of the water monitoring network. This is also done through experimental low cost technology (supported by UNESCO-IHE) which collects real-time data in order to guide stakeholders in the basin on relevant action, not only in the dry spell but also when the water level goes up and flooding occurrences increase.</p><p>According to Patrick Meya of WRMA, with the data collected and analyzed the MaMaSe Initiative will record environmentally sustainable variables. This data using simulation can create forecasting models that will enable broad-based planning and interventions.</p><h2>WATER ALLOCATION PLAN</h2><p><a href=\\"http://www.unesco-ihe.org/sites/default/files/styles/large/public/mamase-photo_2.png?itok=TAkivCW0\\"><img src=\\"http://www.unesco-ihe.org/sites/default/files/styles/unesco_news_overview/public/mamase-photo_2.png?itok=eocgztrf\\"/></a></p><p>The MaMaSe Initiative will, amongst others, ensure the development of a sound water resources management strategy and capacity building of the Water Resources Management Authority (WRMA). In addition, the Initiative will work with WRMA to establish a comprehensive Water Allocation Plan for the Mara basin to ensure that those upstream have the same benefits of all natural resources as their counterparts downstream.</p><p>Michael McClain, Professor of Ecohydroloy and project leader of MaMaSe: \\u201cMaMaSe is quite unusual for UNESCO-IHE, because it\\u2019s not strictly a capacity development project, a research project, or an educational project. It\\u2019s a large comprehensive programme that focuses on water safety and security, and we are working in many dimensions of the problem. One part of it is supporting government authorities that are responsible for resource management planning. We\\u2019re also working with the water users: helping small-scale farmers choose crops that are more economically profitable, so they not just produce more with the available water, but also earn more from what they produce. We\\u2019re also helping communities manage the range lands around the basin, to maximize the retention of water and the production of green vegetation, grass et cetera.\\u201d</p><p>Visit the\\u00a0<a href=\\"http://mamase.unesco-ihe.org/\\">MaMaSe website</a>\\u00a0for more information.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010002", "url_path": "/home/news/another-extra/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	8	1
148	f	2015-08-25 09:38:01.345118+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-24T21:02:52.660Z", "go_live_at": null, "title": "SNV", "seo_title": "", "slug": "snv", "live": true, "has_unpublished_changes": false, "website": "http://www.snvworld.org/", "bio": "<p>This is dummy text. It has been put here as a place holder and should be used to show the structure of the intented bio and not as a final text.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "000100010008000A", "url_path": "/home/partners/snv/", "expired": false, "pk": 59, "main_image": 32, "locked": false, "depth": 4, "first_published_at": "2015-08-21T14:07:21.793Z", "expire_at": null}	\N	59	1
8	f	2015-08-03 16:32:53.142464+03	{"search_description": "", "owner": 1, "intro": "<p>Read all about it now.</p>", "latest_revision_created_at": "2015-08-03T13:32:34.182Z", "go_live_at": null, "category": null, "title": "Another Extra", "seo_title": "", "slug": "another-extra", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p>When Popeye walks out, he is seen with the ducks, quacking. To get the ducks, the Native Americans grab the arrows, which are bent, and shoot them. However, the arrows act like boomerangs, and hit the tribal members instead. Meanwhile, back at the cabin, Native Americans are closing in on the cabin. Olive Oyl blocks them by stretching her legs over the doors, while the tribal members try to invade. Olive screams for help. When Native Americans try to come out of the floorboards, Wimpy is sitting on a chair on the floorboards. The resulting gag depicts when the Indians stretch, Wimpy pours more food into his bowl. When the tribal members finally make it in, Wimpy is thrown out. To get even, Wimpy pulls back a cactus, releasing its thorns. However, Wimpy is met with arrows striking the cactus. Wimpy screams in fear, and runs to Popeye for help. While Popeye walks back to the log cabin, the ducks are seen following Popeye, attracted to the smoke from Popeye's corncob pipe. Wimpy tells Popeye the situation, and after seeing the ducks, he pulls out a fork and knife, sighing in pleasure. When the ducks see the fork and knife, they flee, with Wimpy chasing them from behind. Meanwhile, Olive Oyl is successfully fighting off dozens of the Indians piling into the cabin</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010002", "url_path": "/home/news/extra-extra/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	8	1
54	f	2015-08-21 11:33:34.417926+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "newsletters", "seo_title": "", "slug": "newsletters", "live": true, "has_unpublished_changes": false, "description": "<p>News published after a stipulated period</p>", "numchild": 0, "content_type": 42, "show_in_menus": false, "path": "0001000100090001", "url_path": "/home/main_category/newsletters/", "expired": false, "pk": 38, "locked": false, "name": "newsletters", "depth": 4, "first_published_at": null, "expire_at": null}	\N	38	1
32	f	2015-08-10 14:49:16.218352+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-10T11:20:18.269Z", "go_live_at": null, "category": 11, "title": "MAMASE Mau Mara Serengeti Sustainable Water Initiative", "seo_title": "", "slug": "mamase-mau-mara-serengeti-sustainable-water-initiative", "live": true, "video_link": "https://www.youtube.com/embed/PmQLKBTKOxg", "has_unpublished_changes": false, "description": "<p>Mau Mara Serengeti Sustainable Water Initiative<br/></p>", "numchild": 0, "content_type": 36, "show_in_menus": false, "path": "0001000100040002", "url_path": "/home/videos/mamase-mau-mara-serengeti-sustainable-water-initiative/", "expired": false, "pk": 16, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:51:46.043Z", "expire_at": null}	\N	16	1
135	f	2015-08-24 23:58:27.353019+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-21T13:06:45.021Z", "go_live_at": null, "title": "UNESCO-IHE", "seo_title": "", "slug": "unesco-ihe", "live": true, "has_unpublished_changes": false, "website": "https://www.unesco-ihe.org/", "bio": "<p>We have been working with\\u00a0UNESCO to ensure the project is a success. They are key stakeholders in the conservation of the rangelands and assisting us.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080003", "url_path": "/home/partners/unesco/", "expired": false, "pk": 42, "main_image": 45, "locked": false, "depth": 4, "first_published_at": "2015-08-21T13:06:45.034Z", "expire_at": null}	\N	42	1
72	f	2015-08-21 16:35:08.485551+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "deltares", "seo_title": "", "slug": "deltares", "live": true, "has_unpublished_changes": false, "website": "https://www.deltares.nl/en/", "bio": "<p>Deltares is focus on conservation and partners with MaMaSe because we share a common goal. They are providing funding and mentorship to the team on the ground</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080006", "url_path": "/home/partners/deltares/", "expired": false, "pk": 52, "main_image": 28, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	52	1
86	f	2015-08-21 16:59:53.946951+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "University of Twente", "seo_title": "", "slug": "university-twente", "live": true, "has_unpublished_changes": false, "website": "http://www.utwente.nl/en/", "bio": "<p>University of Twente is assisting the MaMaSe team in the research. We collect data together and analyze it to better conserve the environment</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080008", "url_path": "/home/partners/university-twente/", "expired": false, "pk": 57, "main_image": 30, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	57	1
149	f	2015-08-25 09:38:12.961153+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-25T05:54:40.285Z", "go_live_at": null, "title": "UNESCO-IHE", "seo_title": "", "slug": "unesco-ihe", "live": true, "has_unpublished_changes": false, "website": "https://www.unesco-ihe.org/", "bio": "<p>We have been working with\\u00a0UNESCO to ensure the project is a success. They are key stakeholders in the conservation of the rangelands and assisting us.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080003", "url_path": "/home/partners/unesco-ihe/", "expired": false, "pk": 42, "main_image": 46, "locked": false, "depth": 4, "first_published_at": "2015-08-21T13:06:45.034Z", "expire_at": null}	\N	42	1
34	f	2015-08-12 10:05:58.41875+03	{"search_description": "", "owner": 1, "intro": "<p>Patrick Meya recently completed an\\u00a0online course on Environmental Flows\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area.<br/></p>", "latest_revision_created_at": "2015-08-10T11:32:40.903Z", "go_live_at": null, "category": null, "title": "MaMaSe initiative strengthens the capacity of the Water Resource Management Authority in Kenya", "seo_title": "", "slug": "mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p></p><p>The MaMaSe sustainable water initiative aims to improve the water safety and security in the Mara River Basin in Kenya. Patrick Meya (right) of the Mara Sub-regional Office of the Water Resource Management Authority (WRMA) receives his completion certificate from Michael McClain, project leader of MaMaSe and Professor of Ecohydrology at UNESCO-IHE.</p><p></p><p>Patrick Meya recently completed an\\u00a0<a href=\\"http://www.unesco-ihe.org/node/5482\\">online course on Environmental Flows</a>\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area of water allocation planning within the Mara Basin under MaMaSe Sustainable Water Initiative.</p><p>His participation in the course was funded by GIZ, a MaMaSe Initiative partner whose role and key impact in the project is to strengthen the capacity of local water management systems. Similarly the Initiative derives leverages and synergies between partners within the basin in key impact result areas.</p><h2>Assessing the water quantity and quality of the Mara river</h2><p><a href=\\"http://www.unesco-ihe.org/sites/default/files/styles/large/public/mamase-photo-2.png?itok=KB-oUTnk\\"><img src=\\"http://www.unesco-ihe.org/sites/default/files/styles/unesco_news_overview/public/mamase-photo-2.png?itok=ByzAH0Gf\\"/></a>The MaMaSe partners recently conducted a Rapid Assessment of the Mara River and its two main tributaries Nyangores and Amala. Patrick and his colleague Barnabas Kosgey from WRMA conducted the water quality tests of the Nyangores River and the Silibwet Bridge.The team was led by MaMaSe programme coordinator Ingrid de Loof.</p><p>The objective of this exercise was to determine the current water quantity and quality of the Mara River and its tributaries assess the habitat quality and invertebrate community and correlate this data and information to the recent prolonged drought in the region as well as to the human and animal use of the communities living within and around the river.\\u00a0</p><p>The MaMaSe Sustainable Water Initiative key objective is to improve water safety and security in the Mara River Basin through collection, sharing and deciphering of such data.<a href=\\"http://mamase.unesco-ihe.org/\\">Read more here</a>.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010001", "url_path": "/home/news/mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	7	1
33	f	2015-08-12 10:00:11.823216+03	{"search_description": "", "owner": 1, "intro": "<p>Patrick Meya recently completed an\\u00a0online course on Environmental Flows\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area.<br/></p>", "latest_revision_created_at": "2015-08-10T11:32:40.903Z", "go_live_at": null, "category": null, "title": "MaMaSe initiative strengthens the capacity of the Water Resource Management Authority in Kenya", "seo_title": "", "slug": "mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p></p><p>The MaMaSe sustainable water initiative aims to improve the water safety and security in the Mara River Basin in Kenya. Patrick Meya (right) of the Mara Sub-regional Office of the Water Resource Management Authority (WRMA) receives his completion certificate from Michael McClain, project leader of MaMaSe and Professor of Ecohydrology at UNESCO-IHE.</p><p></p><p>Patrick Meya recently completed an\\u00a0<a href=\\"http://www.unesco-ihe.org/node/5482\\">online course on Environmental Flows</a>\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area of water allocation planning within the Mara Basin under MaMaSe Sustainable Water Initiative.</p><p>His participation in the course was funded by GIZ, a MaMaSe Initiative partner whose role and key impact in the project is to strengthen the capacity of local water management systems. Similarly the Initiative derives leverages and synergies between partners within the basin in key impact result areas.</p><h2>Assessing the water quantity and quality of the Mara river</h2><p><a href=\\"http://www.unesco-ihe.org/sites/default/files/styles/large/public/mamase-photo-2.png?itok=KB-oUTnk\\"><img src=\\"http://www.unesco-ihe.org/sites/default/files/styles/unesco_news_overview/public/mamase-photo-2.png?itok=ByzAH0Gf\\"/></a>The MaMaSe partners recently conducted a Rapid Assessment of the Mara River and its two main tributaries Nyangores and Amala. Patrick and his colleague Barnabas Kosgey from WRMA conducted the water quality tests of the Nyangores River and the Silibwet Bridge.The team was led by MaMaSe programme coordinator Ingrid de Loof.</p><p>The objective of this exercise was to determine the current water quantity and quality of the Mara River and its tributaries assess the habitat quality and invertebrate community and correlate this data and information to the recent prolonged drought in the region as well as to the human and animal use of the communities living within and around the river.\\u00a0</p><p>The MaMaSe Sustainable Water Initiative key objective is to improve water safety and security in the Mara River Basin through collection, sharing and deciphering of such data.<a href=\\"http://mamase.unesco-ihe.org/\\">Read more here</a>.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010001", "url_path": "/home/news/mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	7	1
55	f	2015-08-21 11:39:42.321497+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Event Reports", "seo_title": "", "slug": "event-reports", "live": true, "has_unpublished_changes": false, "description": "<p>News items on upcoming and past events</p>", "numchild": 0, "content_type": 42, "show_in_menus": false, "path": "0001000100090002", "url_path": "/home/main_category/event-reports/", "expired": false, "pk": 39, "locked": false, "name": "Event Reports", "depth": 4, "first_published_at": null, "expire_at": null}	\N	39	1
73	f	2015-08-21 16:38:59.032588+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-21T13:35:08.485Z", "go_live_at": null, "title": "Deltares", "seo_title": "", "slug": "deltares", "live": true, "has_unpublished_changes": false, "website": "https://www.deltares.nl/en/", "bio": "<p>Deltares is focus on conservation and partners with MaMaSe because we share a common goal. They are providing funding and mentorship to the team on the ground</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080006", "url_path": "/home/partners/deltares/", "expired": false, "pk": 52, "main_image": 28, "locked": false, "depth": 4, "first_published_at": "2015-08-21T13:35:08.499Z", "expire_at": null}	\N	52	1
87	f	2015-08-21 17:04:04.580582+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Mara Farming", "seo_title": "", "slug": "mara-farming", "live": true, "has_unpublished_changes": false, "website": "http://www.raakontwerp.nl/MARA-FARMING-EPZ-FRESH", "bio": "<p>Marafarming is assisting the MaMaSe team in the research. They have programs to encourage the community to switch to crop farming as opposed to the prefered nomardic hearding</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080009", "url_path": "/home/partners/mara-farming/", "expired": false, "pk": 58, "main_image": 31, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	58	1
35	f	2015-08-12 10:09:52.21568+03	{"search_description": "", "owner": 1, "intro": "<p>Patrick Meya recently completed an\\u00a0online course on Environmental Flows\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area.<br/></p>", "latest_revision_created_at": "2015-08-12T07:05:58.418Z", "go_live_at": null, "category": null, "title": "MaMaSe initiative strengthens the capacity of the Water Resource Management Authority in Kenya", "seo_title": "", "slug": "mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p></p><p>The MaMaSe sustainable water initiative aims to improve the water safety and security in the Mara River Basin in Kenya. Patrick Meya (right) of the Mara Sub-regional Office of the Water Resource Management Authority (WRMA) receives his completion certificate from Michael McClain, project leader of MaMaSe and Professor of Ecohydrology at UNESCO-IHE.</p><p></p><p>Patrick Meya recently completed an\\u00a0<a href=\\"http://www.unesco-ihe.org/node/5482\\">online course on Environmental Flows</a>\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area of water allocation planning within the Mara Basin under MaMaSe Sustainable Water Initiative.</p><p>His participation in the course was funded by GIZ, a MaMaSe Initiative partner whose role and key impact in the project is to strengthen the capacity of local water management systems. Similarly the Initiative derives leverages and synergies between partners within the basin in key impact result areas.</p><h2>Assessing the water quantity and quality of the Mara river</h2><p><embed alt=\\"Mamase image\\" embedtype=\\"image\\" format=\\"left\\" id=\\"14\\"/>The MaMaSe partners recently conducted a Rapid Assessment of the Mara River and its two main tributaries Nyangores and Amala. Patrick and his colleague Barnabas Kosgey from WRMA conducted the water quality tests of the Nyangores River and the Silibwet Bridge.The team was led by MaMaSe programme coordinator Ingrid de Loof.</p><p>The objective of this exercise was to determine the current water quantity and quality of the Mara River and its tributaries assess the habitat quality and invertebrate community and correlate this data and information to the recent prolonged drought in the region as well as to the human and animal use of the communities living within and around the river.\\u00a0</p><p>The MaMaSe Sustainable Water Initiative key objective is to improve water safety and security in the Mara River Basin through collection, sharing and deciphering of such data.<a href=\\"http://mamase.unesco-ihe.org/\\">Read more here</a>.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010001", "url_path": "/home/news/mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	7	1
56	f	2015-08-21 11:40:22.133224+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Updates", "seo_title": "", "slug": "updates", "live": true, "has_unpublished_changes": false, "description": "<p>What is new?</p>", "numchild": 0, "content_type": 42, "show_in_menus": false, "path": "0001000100090003", "url_path": "/home/main_category/updates/", "expired": false, "pk": 40, "locked": false, "name": "Updates", "depth": 4, "first_published_at": null, "expire_at": null}	\N	40	1
136	f	2015-08-24 23:58:55.994726+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-21T13:18:53.595Z", "go_live_at": null, "title": "Kingdom of The NetherLands", "seo_title": "", "slug": "kingdom-netherlands", "live": true, "has_unpublished_changes": false, "website": "http://unitedkingdom.nlembassy.org/", "bio": "<p>The Kindgom has assisted the MaMaSe project get set up and has also funded the project.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080004", "url_path": "/home/partners/kingdom-netherlands/", "expired": false, "pk": 43, "main_image": 26, "locked": false, "depth": 4, "first_published_at": "2015-08-21T13:18:53.630Z", "expire_at": null}	\N	43	1
150	f	2015-08-25 09:38:21.625075+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-24T20:58:55.994Z", "go_live_at": null, "title": "Kingdom of The NetherLands", "seo_title": "", "slug": "kingdom-netherlands", "live": true, "has_unpublished_changes": false, "website": "http://unitedkingdom.nlembassy.org/", "bio": "<p>The Kindgom has assisted the MaMaSe project get set up and has also funded the project.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080004", "url_path": "/home/partners/kingdom-netherlands/", "expired": false, "pk": 43, "main_image": 26, "locked": false, "depth": 4, "first_published_at": "2015-08-21T13:18:53.630Z", "expire_at": null}	\N	43	1
155	f	2015-08-25 17:48:23.376547+03	{"search_description": "", "owner": 1, "intro": "<p><embed alt=\\"gis-training-mamase\\" embedtype=\\"image\\" format=\\"left\\" id=\\"50\\"/>From 3 to 7 August, 26 participants from the Water Resources Management Authority, SNV, WWF, Mara Farming and Egerton University followed an intensive 5 day training on the processing of spatial data using open source software such as QGIS and GDAL. Dr. Hans van der Kwast, senior lecturer in ecohydrological modeling at UNESCO-IHE, guided the practical hands-on sessions on converting raw input data (e.g. GPS data, spreadsheets or scanned hardcopy maps) into GIS formats, geoprocessing and map design.</p>", "latest_revision_created_at": "2015-08-25T14:47:41.442Z", "go_live_at": null, "category": null, "title": "MaMaSe partners trained in processing and sharing of GIS data", "seo_title": "", "slug": "mamase-partners-trained-processing-and-sharing-gis-data", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-25", "path": "0001000100010003", "url_path": "/home/news/mamase-partners-trained-processing-and-sharing-gis-data/", "expired": false, "pk": 69, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-25T14:47:41.467Z", "expire_at": null}	\N	69	1
137	f	2015-08-25 00:02:52.660282+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-21T14:07:21.781Z", "go_live_at": null, "title": "SNV", "seo_title": "", "slug": "snv", "live": true, "has_unpublished_changes": false, "website": "http://www.snvworld.org/", "bio": "<p>This is dummy text. It has been put here as a place holder and should be used to show the structure of the intented bio and not as a final text.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "000100010008000A", "url_path": "/home/partners/snv/", "expired": false, "pk": 59, "main_image": 32, "locked": false, "depth": 4, "first_published_at": "2015-08-21T14:07:21.793Z", "expire_at": null}	\N	59	1
37	f	2015-08-12 10:15:45.790402+03	{"search_description": "", "owner": 1, "intro": "<p>Patrick Meya recently completed an\\u00a0online course on Environmental Flows\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area.<br/></p>", "latest_revision_created_at": "2015-08-12T07:09:52.215Z", "go_live_at": null, "category": null, "title": "MaMaSe initiative strengthens the capacity of the Water Resource Management Authority in Kenya", "seo_title": "", "slug": "mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p></p><p>The MaMaSe sustainable water initiative aims to improve the water safety and security in the Mara River Basin in Kenya. Patrick Meya (right) of the Mara Sub-regional Office of the Water Resource Management Authority (WRMA) receives his completion certificate from Michael McClain, project leader of MaMaSe and Professor of Ecohydrology at UNESCO-IHE.</p><p></p><p>Patrick Meya recently completed an\\u00a0<a href=\\"http://www.unesco-ihe.org/node/5482\\">online course on Environmental Flows</a>\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area of water allocation planning within the Mara Basin under MaMaSe Sustainable Water Initiative.</p><p>His participation in the course was funded by GIZ, a MaMaSe Initiative partner whose role and key impact in the project is to strengthen the capacity of local water management systems. Similarly the Initiative derives leverages and synergies between partners within the basin in key impact result areas.</p><h2>Assessing the water quantity and quality of the Mara river</h2><p><embed alt=\\"Mamase image\\" embedtype=\\"image\\" format=\\"left\\" id=\\"14\\"/>The MaMaSe partners recently conducted a Rapid Assessment of the Mara River and its two main tributaries Nyangores and Amala. Patrick and his colleague Barnabas Kosgey from WRMA conducted the water quality tests of the Nyangores River and the Silibwet Bridge.The team was led by MaMaSe programme coordinator Ingrid de Loof.</p><p>The objective of this exercise was to determine the current water quantity and\\u00a0quality of the Mara River and its tributaries assess the habitat quality and invertebrate community and correlate this data and information to the recent prolonged drought in the region as well as to the human and animal use of the communities living within and around the river.\\u00a0</p><p>The MaMaSe Sustainable Water Initiative key objective is to improve water safety and security in the Mara River Basin through collection, sharing and deciphering of such data.<a href=\\"http://mamase.unesco-ihe.org/\\">Read more here</a>.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010001", "url_path": "/home/news/mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	7	1
28	f	2015-08-10 13:29:11.623035+03	{"search_description": "", "owner": 1, "intro": "<p>Read all about it now.</p>", "latest_revision_created_at": "2015-08-03T13:32:53.142Z", "go_live_at": null, "category": 31, "title": "Another Extra", "seo_title": "", "slug": "another-extra", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p>When Popeye walks out, he is seen with the ducks, quacking. To get the ducks, the Native Americans grab the arrows, which are bent, and shoot them. However, the arrows act like boomerangs, and hit the tribal members instead. Meanwhile, back at the cabin, Native Americans are closing in on the cabin. Olive Oyl blocks them by stretching her legs over the doors, while the tribal members try to invade. Olive screams for help. When Native Americans try to come out of the floorboards, Wimpy is sitting on a chair on the floorboards. The resulting gag depicts when the Indians stretch, Wimpy pours more food into his bowl. When the tribal members finally make it in, Wimpy is thrown out. To get even, Wimpy pulls back a cactus, releasing its thorns. However, Wimpy is met with arrows striking the cactus. Wimpy screams in fear, and runs to Popeye for help. While Popeye walks back to the log cabin, the ducks are seen following Popeye, attracted to the smoke from Popeye's corncob pipe. Wimpy tells Popeye the situation, and after seeing the ducks, he pulls out a fork and knife, sighing in pleasure. When the ducks see the fork and knife, they flee, with Wimpy chasing them from behind. Meanwhile, Olive Oyl is successfully fighting off dozens of the Indians piling into the cabin</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010002", "url_path": "/home/news/another-extra/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	8	1
36	f	2015-08-12 10:14:41.466923+03	{"search_description": "", "owner": 1, "intro": "<p>The on-going season has put a lot of stress on the Mara and other parts of the region. The Mara River and its two main tributaries, Amala and Nyangores, have recorded low discharge levels.<br/></p>", "latest_revision_created_at": "2015-08-10T11:29:15.834Z", "go_live_at": null, "category": 31, "title": "WATER IS LIFE: THE CURRENT STATUS OF THE MARA RIVER IN KENYA", "seo_title": "", "slug": "water-life-current-status-mara-river-kenya", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<h2>RAPID ASSESSMENT</h2><p><embed alt=\\"Mamase image\\" embedtype=\\"image\\" format=\\"left\\" id=\\"14\\"/>The current low river flows have negative effects on water quality, quantity and the habitat available for fish and invertebrates community. The inefficient and poorly regulated uses of water for agriculture and other forms of development will be controlled and optimized through strategic planning, careful monitoring and regulation of the resources by water authorities.</p><p>In late March, the MaMaSe Initiative, through its partners in Mara River Basin, conducted a Rapid Assessment test along the Mara River and its tributaries. The assessment aimed to determine water quality variables along various sites along the Mara River and its<br/>tributaries, assess habitat quality and diversity at the various sites, conduct a rapid assessment of invertrabrates communities and relate their composition to habitat diversity to water quality and assess the water quality and quantity status in relation to animal and human use.</p><p>As the team began the assessment up stream of the Amala Tributary at the Masese point, it became clear that the flow of the river had significantly reduced. Various tests including turbidity, pH and residual compositions tests showed that human and animal activity continues to ultimately control the quality of the water. According to Dr. Frank Masese of the research team, most of the pool samples carried out indicated a large amount of organic waste that reduced the oxygenation levels of the waters at all points. As the team progressed to midstream levels, local residents were curious to see what the initial findings for their water source would reveal.</p><h2>LOCAL RESIDENTS OBSERVATIONS</h2><p><embed alt=\\"Story_mamase\\" embedtype=\\"image\\" format=\\"left\\" id=\\"15\\"/>Conversations with the local residents about diminished flows and quality of the river, pointed out the prolonged dry spell the region is currently experiencing.\\u00a0Esther Chepchirchir, a resident of the village Kapkoliwa on the Amala River, confirmed that over the years she has seen the water levels steadily but gradually reduce. She could relate the gradual decline of the water quality and quantity to human activities such as deforestation, poor land use especially on riparian land.</p><p>Further downstream the Mara River at the Mara Bridge, the impact of the dry spell was more evident. Turbidity and residual organic matter had very high readings indicating heavy human and animal contamination. At every point where the team sampled, cattle was seeking water directly at the source. Other activities by the residents such as doing laundry, bathing, and washing of cars and motor cycles right at the banks of the river were also visible.</p><h2>MONITORING THE WATER LEVELS THROUGH LOW COST EQUIPMENT</h2><p><embed alt=\\"story_mamase_2\\" embedtype=\\"image\\" format=\\"left\\" id=\\"16\\"/>The MaMaSe Initiative addresses water quality monitoring from a management perspective of the entire basin. The Initiative is supporting the Water Resources Management Authority (<a href=\\"http://www.wrma.or.ke/\\">WRMA)</a>\\u00a0in the operationalization of the water monitoring network. This is also done through experimental low cost technology (supported by UNESCO-IHE) which collects real-time data in order to guide stakeholders in the basin on relevant action, not only in the dry spell but also when the water level goes up and flooding occurrences increase.<br/></p><p>According to Patrick Meya of WRMA, with the data collected and analyzed the MaMaSe Initiative will record environmentally sustainable variables. This data using simulation can create forecasting models that will enable broad-based planning and interventions.</p><h2>WATER ALLOCATION PLAN</h2><p><embed alt=\\"mamase_photo_2\\" embedtype=\\"image\\" format=\\"left\\" id=\\"17\\"/>The MaMaSe Initiative will, amongst others, ensure the development of a sound water resources management strategy and capacity building of the Water Resources Management Authority (WRMA). In addition, the Initiative will work with WRMA to establish a comprehensive Water Allocation Plan for the Mara basin to ensure that those upstream have the same benefits of all natural resources as their counterparts downstream.<br/></p><p>Michael McClain, Professor of Ecohydroloy and project leader of MaMaSe: \\u201cMaMaSe is quite unusual for UNESCO-IHE, because it\\u2019s not strictly a capacity development project, a research project, or an educational project. It\\u2019s a large comprehensive programme that focuses on water safety and security, and we are working in many dimensions of the problem. One part of it is supporting government authorities that are responsible for resource management planning. We\\u2019re also working with the water users: helping small-scale farmers choose crops that are more economically profitable, so they not just produce more with the available water, but also earn more from what they produce. We\\u2019re also helping communities manage the range lands around the basin, to maximize the retention of water and the production of green vegetation, grass et cetera.\\u201d</p><p>Visit the\\u00a0<a href=\\"http://mamase.unesco-ihe.org/\\">MaMaSe website</a>\\u00a0for more information.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010002", "url_path": "/home/news/water-life-current-status-mara-river-kenya/", "expired": false, "pk": 8, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	8	1
57	f	2015-08-21 11:41:38.598199+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-21T08:33:34.417Z", "go_live_at": null, "title": "Newsletters", "seo_title": "", "slug": "newsletters", "live": true, "has_unpublished_changes": false, "description": "<p>News published after a stipulated period</p>", "numchild": 0, "content_type": 42, "show_in_menus": false, "path": "0001000100090001", "url_path": "/home/main_category/newsletters/", "expired": false, "pk": 38, "locked": false, "name": "newsletters", "depth": 4, "first_published_at": "2015-08-21T08:33:34.434Z", "expire_at": null}	\N	38	1
138	f	2015-08-25 08:54:40.28595+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-24T20:58:27.353Z", "go_live_at": null, "title": "UNESCO-IHE", "seo_title": "", "slug": "unesco-ihe", "live": true, "has_unpublished_changes": false, "website": "https://www.unesco-ihe.org/", "bio": "<p>We have been working with\\u00a0UNESCO to ensure the project is a success. They are key stakeholders in the conservation of the rangelands and assisting us.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080003", "url_path": "/home/partners/unesco-ihe/", "expired": false, "pk": 42, "main_image": 46, "locked": false, "depth": 4, "first_published_at": "2015-08-21T13:06:45.034Z", "expire_at": null}	\N	42	1
151	f	2015-08-25 10:12:32.615913+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-25T06:38:21.625Z", "go_live_at": null, "title": "Kingdom of The Netherlands", "seo_title": "", "slug": "kingdom-netherlands", "live": true, "has_unpublished_changes": false, "website": "http://unitedkingdom.nlembassy.org/", "bio": "<p>The Kindgom has assisted the MaMaSe project get set up and has also funded the project.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080004", "url_path": "/home/partners/kingdom-netherlands/", "expired": false, "pk": 43, "main_image": 26, "locked": false, "depth": 4, "first_published_at": "2015-08-21T13:18:53.630Z", "expire_at": null}	\N	43	1
38	f	2015-08-12 10:16:32.903921+03	{"search_description": "", "owner": 1, "intro": "<p>Patrick Meya recently completed an\\u00a0online course on Environmental Flows\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area.<br/></p>", "latest_revision_created_at": "2015-08-12T07:15:45.790Z", "go_live_at": null, "category": null, "title": "MaMaSe initiative strengthens the capacity of the Water Resource Management Authority in Kenya", "seo_title": "", "slug": "mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p></p><p>The MaMaSe sustainable water initiative aims to improve the water safety and security in the Mara River Basin in Kenya. Patrick Meya (right) of the Mara Sub-regional Office of the Water Resource Management Authority (WRMA) receives his completion certificate from Michael McClain, project leader of MaMaSe and Professor of Ecohydrology at UNESCO-IHE.</p><p></p><p>Patrick Meya recently completed an\\u00a0<a href=\\"http://www.unesco-ihe.org/node/5482\\">online course on Environmental Flows</a>\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area of water allocation planning within the Mara Basin under MaMaSe Sustainable Water Initiative.</p><p>His participation in the course was funded by GIZ, a MaMaSe Initiative partner whose role and key impact in the project is to strengthen the capacity of local water management systems. Similarly the Initiative derives leverages and synergies between partners within the basin in key impact result areas.</p><h2>Assessing the water quantity and quality of the Mara river</h2><p><embed alt=\\"Mamase image\\" embedtype=\\"image\\" format=\\"left\\" id=\\"14\\"/>The MaMaSe partners recently conducted a Rapid Assessment of the Mara River and its two main tributaries Nyangores and Amala. Patrick and his colleague Barnabas Kosgey from WRMA conducted the water quality tests of the Nyangores River and the Silibwet Bridge.The team was led by MaMaSe programme coordinator Ingrid de Loof.</p><p>The objective of this exercise was to determine the current water quantity and\\u00a0quality of the Mara River and its tributaries assess the habitat quality and invertebrate community and correlate this data and information to the recent prolonged drought in the region as well as to the human and animal use of the communities living within and around the river.\\u00a0</p><p>The MaMaSe Sustainable Water Initiative key objective is to improve water safety and security in the Mara River Basin through collection, sharing and deciphering of such data.\\u00a0<a href=\\"http://mamase.unesco-ihe.org/\\">Read more here</a>.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010001", "url_path": "/home/news/mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	7	1
139	f	2015-08-25 09:10:37.452842+03	{"locked": false, "latest_revision_created_at": "2015-08-21T07:25:34.509Z", "title": "partners", "numchild": 12, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 3, "intro": "<p>The Initiative,\\u00a0which is\\u00a0financially supported by the Netherlands Embassy in Nairobi,\\u00a0consists of a broad-based, basin-scale public private partnership including international and Kenyan government agencies, civil society, private sector, NGOs, and knowledge institutions. The consortium is led by UNESCO-IHE in close cooperation with SNV Kenya.<br/></p>", "first_published_at": "2015-08-21T07:25:06.115Z", "has_unpublished_changes": false, "content_type": 84, "path": "000100010008", "owner": 1, "pk": 35, "url_path": "/home/partners/", "expired": false, "slug": "partners", "expire_at": null, "go_live_at": null}	\N	35	1
58	f	2015-08-21 12:14:59.828742+03	{"search_description": "HSBC is a mamase partner working with us to champion conservation", "owner": 1, "latest_revision_created_at": "2015-08-21T07:53:31.675Z", "go_live_at": null, "title": "HSBC", "seo_title": "", "slug": "hsbc", "live": true, "has_unpublished_changes": false, "website": "https://www.hsbc.co.uk/1/2/", "bio": "<p>HSBC has been our strategic partner since the inception of this project. They bring a wealth of experience assisting other conservation projects into the MaMaSe project. We look forward to working with them for a very long time.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080001", "url_path": "/home/partners/hsbc/", "expired": false, "pk": 36, "main_image": 23, "locked": false, "depth": 4, "first_published_at": "2015-08-21T07:53:31.702Z", "expire_at": null}	\N	36	1
88	f	2015-08-21 17:07:21.781026+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "SNV", "seo_title": "", "slug": "snv", "live": true, "has_unpublished_changes": false, "website": "http://www.snvworld.org/", "bio": "<p>This is dummy text. It has been put here as a place holder and should be used to show the structure of the intented bio and not as a final text</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "000100010008000A", "url_path": "/home/partners/snv/", "expired": false, "pk": 59, "main_image": 32, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	59	1
31	f	2015-08-10 14:32:40.903053+03	{"search_description": "", "owner": 1, "intro": "<p>Patrick Meya recently completed an\\u00a0online course on Environmental Flows\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area.<br/></p>", "latest_revision_created_at": "2015-08-03T13:32:34.182Z", "go_live_at": null, "category": null, "title": "MaMaSe initiative strengthens the capacity of the Water Resource Management Authority in Kenya", "seo_title": "", "slug": "mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p></p><p>The MaMaSe sustainable water initiative aims to improve the water safety and security in the Mara River Basin in Kenya. Patrick Meya (right) of the Mara Sub-regional Office of the Water Resource Management Authority (WRMA) receives his completion certificate from Michael McClain, project leader of MaMaSe and Professor of Ecohydrology at UNESCO-IHE.</p><p></p><p>Patrick Meya recently completed an\\u00a0<a href=\\"http://www.unesco-ihe.org/node/5482\\">online course on Environmental Flows</a>\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area of water allocation planning within the Mara Basin under MaMaSe Sustainable Water Initiative.</p><p>His participation in the course was funded by GIZ, a MaMaSe Initiative partner whose role and key impact in the project is to strengthen the capacity of local water management systems. Similarly the Initiative derives leverages and synergies between partners within the basin in key impact result areas.</p><h2>Assessing the water quantity and quality of the Mara river</h2><p><a href=\\"http://www.unesco-ihe.org/sites/default/files/styles/large/public/mamase-photo-2.png?itok=KB-oUTnk\\"><img src=\\"http://www.unesco-ihe.org/sites/default/files/styles/unesco_news_overview/public/mamase-photo-2.png?itok=ByzAH0Gf\\"/></a></p><p>The MaMaSe partners recently conducted a Rapid Assessment of the Mara River and its two main tributaries Nyangores and Amala. Patrick and his colleague Barnabas Kosgey from WRMA conducted the water quality tests of the Nyangores River and the Silibwet Bridge.The team was led by MaMaSe programme coordinator Ingrid de Loof.</p><p>The objective of this exercise was to determine the current water quantity and quality of the Mara River and its tributaries assess the habitat quality and invertebrate community and correlate this data and information to the recent prolonged drought in the region as well as to the human and animal use of the communities living within and around the river.\\u00a0</p><p>The MaMaSe Sustainable Water Initiative key objective is to improve water safety and security in the Mara River Basin through collection, sharing and deciphering of such data.<a href=\\"http://mamase.unesco-ihe.org/\\">Read more here</a>.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010001", "url_path": "/home/news/extra-extra/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	7	1
59	f	2015-08-21 16:01:09.163412+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Masaai Mara University", "seo_title": "", "slug": "masaai-mara-university", "live": true, "has_unpublished_changes": false, "website": "http://www.mmarau.ac.ke/", "bio": "<p>This center for academic excellence has been at the forefront assisting us get set up and interact with the community for the success of the project</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080002", "url_path": "/home/partners/masaai-mara-university/", "expired": false, "pk": 41, "main_image": 24, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	41	1
152	f	2015-08-25 17:27:17.112125+03	{"locked": false, "latest_revision_created_at": "2015-08-25T06:10:37.452Z", "title": "partners", "numchild": 15, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 3, "intro": "<p>The Initiative,\\u00a0which is\\u00a0financially supported by the Netherlands Embassy in Nairobi,\\u00a0consists of a broad-based, basin-scale public private partnership including international and Kenyan government agencies, civil society, private sector, NGOs, and knowledge institutions. The consortium is led by UNESCO-IHE.<br/></p><p><br/></p><p><br/></p>", "first_published_at": "2015-08-21T07:25:06.115Z", "has_unpublished_changes": false, "content_type": 84, "path": "000100010008", "owner": 1, "pk": 35, "url_path": "/home/partners/", "expired": false, "slug": "partners", "expire_at": null, "go_live_at": null}	\N	35	1
89	f	2015-08-21 17:10:16.456423+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Waterschap Brabantse Delta", "seo_title": "", "slug": "waterschap-brabantse-delta", "live": true, "has_unpublished_changes": false, "website": "http://www.brabantsedelta.nl/index.html", "bio": "<p>This is dummy text. It has been put here as a place holder and should be used to show the structure of the intented bio and not as a final text</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "000100010008000B", "url_path": "/home/partners/waterschap-brabantse-delta/", "expired": false, "pk": 60, "main_image": 33, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	60	1
140	f	2015-08-25 09:12:38.845043+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Water Resources Management Authority ", "seo_title": "", "slug": "water-resources-management-authority", "live": true, "has_unpublished_changes": false, "website": "", "bio": "", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "000100010008000D", "url_path": "/home/partners/water-resources-management-authority/", "expired": false, "pk": 66, "main_image": 47, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	66	1
90	f	2015-08-21 17:12:14.76483+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Wageningen University", "seo_title": "", "slug": "wageningen-university", "live": true, "has_unpublished_changes": false, "website": "http://www.wageningenur.nl/en/wageningen-university.htm", "bio": "<p>This is dummy text. It has been put here as a place holder and should be used to show the structure of the intented bio and not as a final text</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "000100010008000C", "url_path": "/home/partners/wageningen-university/", "expired": false, "pk": 61, "main_image": 34, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	61	1
39	f	2015-08-12 18:03:37.11055+03	{"search_description": "", "owner": 1, "intro": "<p>Patrick Meya recently completed an\\u00a0online course on Environmental Flows\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area.<br/></p>", "latest_revision_created_at": "2015-08-12T07:16:32.903Z", "go_live_at": null, "category": null, "title": "MaMaSe initiative strengthens the capacity of the Water Resource Management Authority in Kenya", "seo_title": "", "slug": "mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p></p><p>The MaMaSe sustainable water initiative aims to improve the water safety and security in the Mara River Basin in Kenya. Patrick Meya (right) of the Mara Sub-regional Office of the Water Resource Management Authority (WRMA) receives his completion certificate from Michael McClain, project leader of MaMaSe and Professor of Ecohydrology at UNESCO-IHE.</p><p></p><p>Patrick Meya recently completed an\\u00a0<a href=\\"http://www.unesco-ihe.org/node/5482\\">online course on Environmental Flows</a>\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area of water allocation planning within the Mara Basin under MaMaSe Sustainable Water Initiative.</p><p>His participation in the course was funded by GIZ, a MaMaSe Initiative partner whose role and key impact in the project is to strengthen the capacity of local water management systems. Similarly the Initiative derives leverages and synergies between partners within the basin in key impact result areas.</p><h2>Assessing the water quantity and quality of the Mara river</h2><p><embed alt=\\"Mamase image\\" embedtype=\\"image\\" format=\\"left\\" id=\\"14\\"/>The MaMaSe partners recently conducted a Rapid Assessment of the Mara River and its two main tributaries Nyangores and Amala. Patrick and his colleague Barnabas Kosgey from WRMA conducted the water quality tests of the Nyangores River and the Silibwet Bridge.The team was led by MaMaSe programme coordinator Ingrid de Loof.</p><p>The objective of this exercise was to determine the current water quantity and\\u00a0quality of the Mara River and its tributaries assess the habitat quality and invertebrate community and correlate this data and information to the recent prolonged drought in the region as well as to the human and animal use of the communities living within and around the river.\\u00a0</p><p>The MaMaSe Sustainable Water Initiative key objective is to improve water safety and security in the Mara River Basin through collection, sharing and deciphering of such data.\\u00a0<a href=\\"http://mamase.unesco-ihe.org/\\">Read more here</a>.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010001", "url_path": "/home/news/mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	7	1
60	f	2015-08-21 16:06:45.021313+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "UNESCO", "seo_title": "", "slug": "unesco", "live": true, "has_unpublished_changes": false, "website": "https://www.unesco-ihe.org/", "bio": "<p>We have been working with\\u00a0UNESCO to ensure the project is a success. They are key stakeholders in the conservation of the rangelands and assisting us.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080003", "url_path": "/home/partners/unesco/", "expired": false, "pk": 42, "main_image": 25, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	42	1
141	f	2015-08-25 09:23:34.784303+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Egerton University", "seo_title": "", "slug": "egerton-university", "live": true, "has_unpublished_changes": false, "website": "", "bio": "", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "000100010008000E", "url_path": "/home/partners/egerton-university/", "expired": false, "pk": 67, "main_image": 48, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	67	1
40	f	2015-08-12 18:04:17.699612+03	{"search_description": "", "owner": 1, "intro": "<p>Patrick Meya recently completed an\\u00a0online course on Environmental Flows\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area.<br/></p>", "latest_revision_created_at": "2015-08-12T15:03:37.110Z", "go_live_at": null, "category": null, "title": "MaMaSe initiative strengthens the capacity of the Water Resource Management Authority in Kenya", "seo_title": "", "slug": "mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p></p><p>The MaMaSe sustainable water initiative aims to improve the water safety and security in the Mara River Basin in Kenya. Patrick Meya (right) of the Mara Sub-regional Office of the Water Resource Management Authority (WRMA) receives his completion certificate from Michael McClain, project leader of MaMaSe and Professor of Ecohydrology at UNESCO-IHE.</p><p></p><p>Patrick Meya recently completed an\\u00a0<a href=\\"http://www.unesco-ihe.org/node/5482\\">online course on Environmental Flows</a>\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area of water allocation planning within the Mara Basin under MaMaSe Sustainable Water Initiative.</p><p>His participation in the course was funded by GIZ, a MaMaSe Initiative partner whose role and key impact in the project is to strengthen the capacity of local water management systems. Similarly the Initiative derives leverages and synergies between partners within the basin in key impact result areas.</p><h2>Assessing the water quantity and quality of the Mara river</h2><p><embed alt=\\"Mamase image\\" embedtype=\\"image\\" format=\\"left\\" id=\\"14\\"/><embed alt=\\"mamase_photo_2\\" embedtype=\\"image\\" format=\\"left\\" id=\\"17\\"/>The MaMaSe partners recently conducted a Rapid Assessment of the Mara River and its two main tributaries Nyangores and Amala. Patrick and his colleague Barnabas Kosgey from WRMA conducted the water quality tests of the Nyangores River and the Silibwet Bridge.The team was led by MaMaSe programme coordinator Ingrid de Loof.</p><p>The objective of this exercise was to determine the current water quantity and\\u00a0quality of the Mara River and its tributaries assess the habitat quality and invertebrate community and correlate this data and information to the recent prolonged drought in the region as well as to the human and animal use of the communities living within and around the river.\\u00a0</p><p>The MaMaSe Sustainable Water Initiative key objective is to improve water safety and security in the Mara River Basin through collection, sharing and deciphering of such data.\\u00a0<a href=\\"http://mamase.unesco-ihe.org/\\">Read more here</a>.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010001", "url_path": "/home/news/mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	7	1
61	f	2015-08-21 16:18:53.595974+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Kingdom of The NetherLands", "seo_title": "", "slug": "kingdom-netherlands", "live": true, "has_unpublished_changes": false, "website": "http://unitedkingdom.nlembassy.org/", "bio": "<p>The Kindgom has assisted the MaMaSe project get set up and has also funded the project</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080004", "url_path": "/home/partners/kingdom-netherlands/", "expired": false, "pk": 43, "main_image": 26, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	43	1
153	f	2015-08-25 17:42:47.923509+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-25T06:38:12.961Z", "go_live_at": null, "title": "UNESCO-IHE", "seo_title": "", "slug": "unesco-ihe", "live": true, "has_unpublished_changes": false, "website": "https://www.unesco-ihe.org/", "bio": "<p>We have been working with\\u00a0UNESCO to ensure the project is a success. They are key stakeholders in the conservation of the rangelands and assisting us.</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080003", "url_path": "/home/partners/unesco-ihe/", "expired": false, "pk": 42, "main_image": 51, "locked": false, "depth": 4, "first_published_at": "2015-08-21T13:06:45.034Z", "expire_at": null}	\N	42	1
142	f	2015-08-25 09:33:22.214231+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Mara River Water Resource Association", "seo_title": "", "slug": "mara-river-water-resource-association", "live": true, "has_unpublished_changes": false, "website": "", "bio": "", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "000100010008000F", "url_path": "/home/partners/mara-river-water-resource-association/", "expired": false, "pk": 68, "main_image": 49, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	68	1
41	f	2015-08-12 18:22:30.381113+03	{"search_description": "", "owner": 1, "intro": "<p>Patrick Meya recently completed an\\u00a0online course on Environmental Flows\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area.<br/></p>", "latest_revision_created_at": "2015-08-12T15:04:17.699Z", "go_live_at": null, "category": null, "title": "MaMaSe initiative strengthens the capacity of the Water Resource Management Authority in Kenya", "seo_title": "", "slug": "mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p></p><p>The MaMaSe sustainable water initiative aims to improve the water safety and security in the Mara River Basin in Kenya. Patrick Meya (right) of the Mara Sub-regional Office of the Water Resource Management Authority (WRMA) receives his completion certificate from Michael McClain, project leader of MaMaSe and Professor of Ecohydrology at UNESCO-IHE.</p><p></p><p>Patrick Meya recently completed an\\u00a0<a href=\\"http://www.unesco-ihe.org/node/5482\\">online course on Environmental Flows</a>\\u00a0from UNESCO-IHE. The monitoring of environmental flows and reserve settings is a major component of the result area of water allocation planning within the Mara Basin under MaMaSe Sustainable Water Initiative.</p><p>His participation in the course was funded by GIZ, a MaMaSe Initiative partner whose role and key impact in the project is to strengthen the capacity of local water management systems. Similarly the Initiative derives leverages and synergies between partners within the basin in key impact result areas.</p><h2>Assessing the water quantity and quality of the Mara river</h2><p><embed alt=\\"Mamase image\\" embedtype=\\"image\\" format=\\"left\\" id=\\"14\\"/>The MaMaSe partners recently conducted a Rapid Assessment of the Mara River and its two main tributaries Nyangores and Amala. Patrick and his colleague Barnabas Kosgey from WRMA conducted the water quality tests of the Nyangores River and the Silibwet Bridge.The team was led by MaMaSe programme coordinator Ingrid de Loof.</p><p>The objective of this exercise was to determine the current water quantity and\\u00a0quality of the Mara River and its tributaries assess the habitat quality and invertebrate community and correlate this data and information to the recent prolonged drought in the region as well as to the human and animal use of the communities living within and around the river.\\u00a0</p><p>The MaMaSe Sustainable Water Initiative key objective is to improve water safety and security in the Mara River Basin through collection, sharing and deciphering of such data.\\u00a0<a href=\\"http://mamase.unesco-ihe.org/\\">Read more here</a>.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-03", "path": "0001000100010001", "url_path": "/home/news/mamase-initiative-strengthens-capacity-water-resource-management-authority-kenya/", "expired": false, "pk": 7, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-03T13:32:34.202Z", "expire_at": null}	\N	7	1
42	f	2015-08-13 16:40:29.930958+03	{"body": "", "locked": false, "latest_revision_created_at": "2015-08-06T12:40:10.759Z", "title": "Gallery", "numchild": 1, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 3, "first_published_at": "2015-08-06T12:40:10.802Z", "has_unpublished_changes": false, "content_type": 3, "path": "000100010005", "owner": 1, "pk": 23, "url_path": "/home/gallery/", "expired": false, "slug": "gallery", "expire_at": null, "go_live_at": null}	\N	23	1
43	f	2015-08-13 16:42:10.464683+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "Gallery2", "page_ptr": 32, "seo_title": "", "slug": "gallery2", "live": true, "has_unpublished_changes": false, "description": "asdsdsda", "numchild": 0, "content_type": 73, "show_in_menus": false, "path": "000100010006", "url_path": "/home/gallery2/", "expired": false, "pk": "gallery2", "locked": false, "name": "gallery2", "depth": 3, "first_published_at": null, "expire_at": null}	\N	32	1
143	f	2015-08-25 09:36:40.474328+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-21T14:12:14.764Z", "go_live_at": null, "title": "Wageningen University", "seo_title": "", "slug": "wageningen-university", "live": true, "has_unpublished_changes": false, "website": "http://www.wageningenur.nl/en/wageningen-university.htm", "bio": "<p>This is dummy text. It has been put here as a place holder and should be used to show the structure of the intented bio and not as a final text</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "000100010008000C", "url_path": "/home/partners/wageningen-university/", "expired": false, "pk": 61, "main_image": 34, "locked": false, "depth": 4, "first_published_at": "2015-08-21T14:12:14.778Z", "expire_at": null}	\N	61	1
92	f	2015-08-21 18:28:16.617158+03	{"search_description": "", "owner": 1, "intro": "", "latest_revision_created_at": null, "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "materials", "live": true, "has_unpublished_changes": false, "body": "<p></p><h4><b>Sustainable Rangeland - Grazing</b></h4><b>Uncontrolled grazing</b><p></p><p>Uncontrolled grazing leads to rangeland degradation. </p><p>This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season</p><p>(Figure 1). </p><br/><p><b>Fact</b></p><p>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><br/><p><b>Rules for Controlled Grazing </b></p><p>1. Grazing areas should be divided into blocks and grazing plans devised.<br/>2. Grazing committees need to be formed that decide how grazing is conducted. </p><p>3. Grazing plans should be devised for both wet and dry season grazing. </p><p>4. Livestock should be combined, cattle, sheep and goats.</p><p>5. Bunched herding allows for controlling direction &amp; speed (Figure 2).</p><p><br/></p><p><br/></p><p></p><p></p><h4><b>Path Erosion</b></h4><b>Farmer Challenges</b><p></p><p>Erosion on paths and roads bordering farms is a major contributor of sediment to streams (Figure 1). Small roads and paths channel sediment directly to the streams. </p><br/><p><b>Fact</b></p><p>Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><br/><p><b>Farmer Solutions</b></p><p>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) \\u2018dig &amp; mound\\u2019 technique at regular intervals (Figure 2).<br/><br/></p><p>Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><br/></p><h4><b>Constructed Wetland \\u00a0</b></h4><p><b><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b></p><p><b><br/></b></p><p><b>What are Constructed Wetlands?</b></p><p>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. \\u00a0There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.<br/><br/></p><p><b>How do CWs work?</b></p><p>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.</p><p><b><br/><br/></b></p><p><b>Advantages of these systems</b></p><ul><li><p>CWs provide up-to 90% efficiency in terms of wastewater treatment.</p></li><li><p>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.</p></li><li><p>No need for chemical/biological products. </p></li><li><p>Relatively low installation and maintenance cost compared to conventional systems.</p></li><li><p>Do not require technical expertise for maintenance.</p></li><li><p>Environmentally friendly and no smell.</p></li><li><p>Are easily tailored to fit different scenarios.</p></li><li><p>Treated water can be re-used.</p></li></ul><p><b><br/></b></p><p><b>MaMaSe offers:</b></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><br/></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/materials/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	62	1
82	f	2015-08-21 16:52:30.228714+03	{"search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "GIZ", "seo_title": "", "slug": "giz", "live": true, "has_unpublished_changes": false, "website": "http://www.giz.de/en/html/index.html", "bio": "<p>GIZ has been assisting the MaMaSe team thought funding and mentorship. We look forward to their continued support</p>", "numchild": 0, "content_type": 83, "show_in_menus": false, "path": "0001000100080007", "url_path": "/home/partners/giz/", "expired": false, "pk": 54, "main_image": 29, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	54	1
160	f	2015-08-25 19:15:58.430043+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-21T06:42:54.581Z", "first_published_at": "2015-08-21T06:36:47.441Z", "go_live_at": null, "title": "MaMaSe Gallery 1", "seo_title": "Gallery", "slug": "tgallery", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"image_carousel\\", \\"value\\": [{\\"caption\\": \\"\\", \\"image\\": 18}, {\\"caption\\": \\"\\", \\"image\\": 19}, {\\"caption\\": \\"\\", \\"image\\": 20}, {\\"caption\\": \\"\\", \\"image\\": 21}, {\\"caption\\": \\"\\", \\"image\\": 22}]}]", "numchild": 0, "content_type": 75, "show_in_menus": false, "path": "000100010007", "url_path": "/home/mamase-gallery-1/", "expired": false, "pk": 34, "locked": false, "date_modified": "2015-08-21", "author": "mamase", "depth": 3, "date_created": "2015-08-21", "expire_at": null}	\N	34	1
161	f	2015-08-25 19:28:02.327212+03	{"search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-25T16:15:58.430Z", "first_published_at": "2015-08-21T06:36:47.441Z", "go_live_at": null, "title": "MaMaSe Photo Gallery", "seo_title": "Gallery", "slug": "tgallery", "live": true, "has_unpublished_changes": false, "body": "[{\\"type\\": \\"image_carousel\\", \\"value\\": [{\\"caption\\": \\"\\", \\"image\\": 18}, {\\"caption\\": \\"\\", \\"image\\": 19}, {\\"caption\\": \\"\\", \\"image\\": 20}, {\\"caption\\": \\"\\", \\"image\\": 21}, {\\"caption\\": \\"\\", \\"image\\": 22}]}]", "numchild": 0, "content_type": 75, "show_in_menus": false, "path": "000100010007", "url_path": "/home/tgallery/", "expired": false, "pk": 34, "locked": false, "date_modified": "2015-08-21", "author": "mamase", "depth": 3, "date_created": "2015-08-21", "expire_at": null}	\N	34	1
162	f	2015-08-25 22:00:15.306919+03	{"search_description": "", "owner": 1, "intro": "", "link_document": null, "latest_revision_created_at": "2015-08-23T14:31:22.557Z", "go_live_at": null, "category": null, "title": "Factsheet series", "seo_title": "", "slug": "material", "live": true, "has_unpublished_changes": false, "body": "<p></p><p></p><h4><b>Sustainable Rangeland \\u2013 Wet Areas</b></h4><b><p><b><br/></b></p><img/>Importance</b><embed alt=\\"Degraded spring area Enonkishu Conservancy\\" embedtype=\\"image\\" format=\\"right\\" id=\\"35\\"/><p>Springs, gullies, wetlands and river areas provide important watering areas for both livestock and wild animals. These areas can be easily degraded if grazing is not controlled (Figure 1).</p><p></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing in wet areas will store more water, lead to less\\u00a0erosion and provide water for livestock longer in the dry season than degraded wet areas.</p><p><i><br/></i></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0\\u00a0</i></p><p><i>Figure 1. A degraded spring area on Enonkishu Conservancy where uncontrolled grazing is occurring.</i><br/></p><p><b>Rules for Wet Areas</b></p><embed alt=\\"Wetland area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"37\\"/><ol><li>Bunched herding for controlled entry and exit to wet areas.<br/></li><li>Livestock should exit as soon as finished drinking.<br/></li><li>Livestock should never graze permanent \\u2018wet zones\\u2019 \\u00a0 (Figure 1).<br/></li><li>A buffer zone of at least 20 steps should occur with light grazing allowed. This leads to well managed wet areas (Figure 2).<br/></li></ol><p></p><br/><br/><p><br/></p><p><br/></p><p><i>Figure 2. A wetland area where grazing has been controlled and Livestock not allowed to enter the 'wet zone\\u2019. These areas will provide important drought grazing areas.</i></p><p><i><a id=\\"1\\" linktype=\\"document\\">rangelands_grazing</a><br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Sustainable Rangeland - Grazing</b></h4><b><embed alt=\\"Uncontrolled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"38\\"/><br/></b><p><b>Uncontrolled grazing</b></p><p>Uncontrolled grazing leads to rangeland degradation.This leads to less soil moisture retention, less grass, and increased erosion. Grass levels fail to sustain livestock through dry season(Figure 1).</p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Controlled grazing allows for good grass cover and stores up to 10 times more water in soil. This promotes grass growth longer into dry season.</p><p><i><br/></i></p><p><i>Figure 1. An uncontrolled grazing area at the end of the 2015 wet season on the border of Enonkishu Conservancy<br/></i></p><p><b><embed alt=\\"Controlled grazing area\\" embedtype=\\"image\\" format=\\"right\\" id=\\"39\\"/>Rules for Controlled Grazing </b></p><p></p><ol><li>Grazing areas should be divided into blocks and grazing plans devised.<br/></li><li>Grazing committees need to be formed that decide how grazing is conducted.<br/></li><li>Grazing plans should be devised for both wet and dry season grazing.<br/></li><li>Livestock should be combined, cattle, sheep and goats.<br/></li><li>Bunched herding allows for controlling direction &amp; speed (Figure 2).</li></ol><p><i><br/></i></p><p><i>Figure 2. Controlled grazing using \\u2018bunched\\u2019 herds and a grazing calendar under a holistic management plan on Enonkishu Conservancy at the end of the 2015 wet season.</i></p><p><i><a id=\\"2\\" linktype=\\"document\\">rangeland wet areas</a><br/></i></p><p></p><p></p><p></p><hr/><h4><b><br/></b></h4><h4><b>Path Erosion</b><br/></h4><b><embed alt=\\"Path erosion channels \\" embedtype=\\"image\\" format=\\"right\\" id=\\"40\\"/><br/></b><p><b>Farmer Challenges \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Erosion on paths and roads bordering farms is a major contributor of sediment to streams \\u00a0(Figure 1). Small roads and paths channel sediment directly to the streams.</p><p><br/></p><p><b>Fact \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>\\u00a0Local MaMaSe studies have shown that sediment loss on Mara River Basin (Nyangores Catchment) farm footpaths was 3 times higher than on Maize fields, and 6 times higher than Napier Grass plots.</p><p><i><br/></i></p><p><i>Figure 1. Path erosion channels sediment to the stream. Left untreated it can eventually form deep gullies.</i></p><p><b><embed alt=\\"Drainage dip cut \\" embedtype=\\"image\\" format=\\"right\\" id=\\"41\\"/>Farmer Solutions \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Control - Erosion Control can be easily done by farmers using simple farm tools (pick, shovel) with an angled (10x10) dig &amp; mound\\u2019 technique at regular intervals (Figure 2).</p><p>Store More Water - Water from paths and roads can be directed onto farms to increase soil moisture in fields, or directed into small reservoirs for later use.</p><p><br/></p><p><br/></p><p><i><br/></i></p><p><i><br/></i></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2.Drain to suitable area where water can soak in or flow away. Drainage dip cut at angle across path intercepts flow of water along path.<br/></i></p><p><i><br/></i></p><p><i><a id=\\"3\\" linktype=\\"document\\">path erosion</a><br/></i></p><hr/><h4><b><br/></b></h4><h4><b>Constructed Wetland \\u00a0</b><br/></h4><p><b><embed alt=\\"A natural wetland\\" embedtype=\\"image\\" format=\\"right\\" id=\\"42\\"/><br/></b></p><p><b>One of the objectives of the Mau Mara Serengeti Sustainable Water Initiative (MaMaSe) is improving the water quality in the Mara Basin. In line with this, MaMaSe is spearheading the implementation of Constructed Wetlands (CWs) within their activities.</b><br/></p><p><b>What are Constructed Wetlands? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 </b>Constructed wetlands are systems that mimic the wastewater treatment processes that take place in natural wetlands. There are different types of CWs based on the hydrological flow pattern. The recommended type of wetland in the basin is the subsurface system where the water flows below the surface.</p><p></p><p><i>\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Figure 1. A natural wetland.</i></p><p><b><embed alt=\\"A Constructed Wetland \\" embedtype=\\"image\\" format=\\"right\\" id=\\"43\\"/>How do CWs work? \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0</b>Constructed wetlands have three components: plants, substrate (gravel) and the waste water. \\u00a0The small gravel provides a surface on which bacteria start growing and decomposing the waste water. The plants help to take up the nutrients besides helping the growth of the bacteria.<br/></p><p><b><br/></b></p><p><br/></p><p><i><br/></i></p><p><i>Figure 2. A Constructed Wetland with horizontal subsurface flow. The waste water cannot be seen.<br/></i></p><p><b><embed alt=\\" Hand- on training for the constructed wetlands\\" embedtype=\\"image\\" format=\\"right\\" id=\\"44\\"/>Advantages of these systems</b></p><ul><li>CWs provide up-to 90% efficiency in terms of wastewater treatment.<br/></li><li>Minimal/no energy needed in the horizontal subsurface flow system as there is no pumping required.<br/></li><li>No need for chemical/biological products.<br/></li><li>Relatively low installation and maintenance cost compared to conventional systems.<br/></li><li>Do not require technical expertise for maintenance.<br/></li><li>Environmentally friendly and no smell.<br/></li><li>Are easily tailored to fit different scenarios.<br/></li><li>Treated water can be re-used.<br/></li></ul><p><i><br/></i></p><p><i><br/></i></p><p><i>Figure 3. Hand- on training for the constructed wetlands. During the training a demo site is put up.<br/></i></p><p><b>MaMaSe offers:</b><br/></p><p></p><ul><li>To build capacity among maintenance staff of touristic infrastructures on the design and construction of CWs.<br/></li><li>Provide technical support with regard to the design, construction and maintenance of CWs in the basin. The cost of construction will however be met by the hotels.<br/></li></ul><p><a id=\\"4\\" linktype=\\"document\\">constructed wetlands</a><br/></p><p></p><p></p><p></p><p></p><p></p><p></p>", "numchild": 0, "content_type": 85, "show_in_menus": false, "date": "2015-08-21", "path": "00010001000E", "url_path": "/home/material/", "expired": false, "pk": 62, "locked": false, "depth": 3, "first_published_at": "2015-08-21T15:28:16.630Z", "expire_at": null}	\N	62	1
157	f	2015-08-25 17:51:57.718383+03	{"search_description": "", "owner": 1, "intro": "<p><br/></p>", "latest_revision_created_at": "2015-08-25T14:50:06.439Z", "go_live_at": null, "category": null, "title": "MaMaSe partners trained in processing and sharing of GIS data", "seo_title": "", "slug": "mamase-partners-trained-processing-and-sharing-gis-data", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p><embed alt=\\"gis-training-mamase\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"50\\"/><br/></p><p><b>From 3 to 7 August, 26 participants from the Water Resources Management Authority, SNV, WWF, Mara Farming and Egerton University followed an intensive 5 day training on the processing of spatial data using open source software such as QGIS and GDAL. Dr. Hans van der Kwast, senior lecturer in ecohydrological modeling at UNESCO-IHE, guided the practical hands-on sessions on converting raw input data (e.g. GPS data, spreadsheets or scanned hardcopy maps) into GIS formats, geoprocessing and map design.</b></p><p>The participants were also introduced to the use of the\\u00a0<a href=\\"http://maps.mamase.org/\\">MaMaSe GeoNode</a>, a Spatial Data Infrastructure (SDI) for up-and downloading data/documents, making online maps and integration with QGIS. This allows project partners and other stakeholders to share their information on the MaMaSe GeoNode which is part of the knowledge exchange centre developed in the project.</p><p>At the end of the training the participants acknowledged that with the acquired skills they are able to improve the data processing chain in their day-to-day work and learned how SDIs can be used to share data.</p><p>During the 5 training days, the amount of data layers in the MaMase GeoNode had increased from 13 to 135, thanks to the efforts of the participants.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-25", "path": "0001000100010003", "url_path": "/home/news/mamase-partners-trained-processing-and-sharing-gis-data/", "expired": false, "pk": 69, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-25T14:47:41.467Z", "expire_at": null}	\N	69	1
158	f	2015-08-25 17:53:19.810621+03	{"search_description": "", "owner": 1, "intro": "<p><br/></p>", "latest_revision_created_at": "2015-08-25T14:51:57.718Z", "go_live_at": null, "category": null, "title": "MaMaSe partners trained in processing and sharing of GIS data", "seo_title": "", "slug": "mamase-partners-trained-processing-and-sharing-gis-data", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p><b><embed alt=\\"gis-training-mamase\\" embedtype=\\"image\\" format=\\"left\\" id=\\"50\\"/>From 3 to 7 August, 26 participants from the Water Resources Management Authority, SNV, WWF, Mara Farming and Egerton University followed an intensive 5 day training on the processing of spatial data using open source software such as QGIS and GDAL. Dr. Hans van der Kwast, senior lecturer in ecohydrological modeling at UNESCO-IHE, guided the practical hands-on sessions on converting raw input data (e.g. GPS data, spreadsheets or scanned hardcopy maps) into GIS formats, geoprocessing and map \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0design.</b><br/></p><p>The participants were also introduced to the use of the\\u00a0<a href=\\"http://maps.mamase.org/\\">MaMaSe GeoNode</a>, a Spatial Data Infrastructure (SDI) for up-and downloading data/documents, making online maps and integration with QGIS. This allows project partners and other stakeholders to share their information on the MaMaSe GeoNode which is part of the knowledge exchange centre developed in the project.</p><p>At the end of the training the participants acknowledged that with the acquired skills they are able to improve the data processing chain in their day-to-day work and learned how SDIs can be used to share data.</p><p>During the 5 training days, the amount of data layers in the MaMase GeoNode had increased from 13 to 135, thanks to the efforts of the participants.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-25", "path": "0001000100010003", "url_path": "/home/news/mamase-partners-trained-processing-and-sharing-gis-data/", "expired": false, "pk": 69, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-25T14:47:41.467Z", "expire_at": null}	\N	69	1
154	f	2015-08-25 17:47:41.442298+03	{"search_description": "", "owner": 1, "intro": "<p><embed alt=\\"gis-training-mamase\\" embedtype=\\"image\\" format=\\"left\\" id=\\"50\\"/>From 3 to 7 August, 26 participants from the Water Resources Management Authority, SNV, WWF, Mara Farming and Egerton University followed an intensive 5 day training on the processing of spatial data using open source software such as QGIS and GDAL. Dr. Hans van der Kwast, senior lecturer in ecohydrological modeling at UNESCO-IHE, guided the practical hands-on sessions on converting raw input data (e.g. GPS data, spreadsheets or scanned hardcopy maps) into GIS formats, geoprocessing and map design.</p>", "latest_revision_created_at": null, "go_live_at": null, "category": null, "title": "MaMaSe partners trained in processing and sharing of GIS data", "seo_title": "", "slug": "mamase-partners-trained-processing-and-sharing-gis-data", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-25", "path": "0001000100010003", "url_path": "/home/news/mamase-partners-trained-processing-and-sharing-gis-data/", "expired": false, "pk": 69, "main_image": null, "locked": false, "depth": 4, "first_published_at": null, "expire_at": null}	\N	69	1
159	f	2015-08-25 17:54:09.046345+03	{"search_description": "", "owner": 1, "intro": "<p><br/></p>", "latest_revision_created_at": "2015-08-25T14:53:19.810Z", "go_live_at": null, "category": null, "title": "MaMaSe partners trained in processing and sharing of GIS data", "seo_title": "", "slug": "mamase-partners-trained-processing-and-sharing-gis-data", "live": true, "has_unpublished_changes": false, "tagged_items": [], "body": "<p><b><embed alt=\\"gis-training-mamase\\" embedtype=\\"image\\" format=\\"left\\" id=\\"50\\"/>From 3 to 7 August, 26 participants from the Water Resources Management Authority, SNV, WWF, Mara Farming and Egerton University followed an intensive 5 day training on the processing of spatial data using open source software such as QGIS and GDAL. Dr. Hans van der Kwast, senior lecturer in ecohydrological modeling at UNESCO-IHE, guided the practical hands-on sessions on converting raw input data (e.g. GPS data, spreadsheets or scanned hardcopy maps) into GIS formats, geoprocessing and map design.</b><br/></p><p><br/></p><p><br/></p><p><br/></p><p>The participants were also introduced to the use of the\\u00a0<a href=\\"http://maps.mamase.org/\\">MaMaSe GeoNode</a>, a Spatial Data Infrastructure (SDI) for up-and downloading data/documents, making online maps and integration with QGIS. This allows project partners and other stakeholders to share their information on the MaMaSe GeoNode which is part of the knowledge exchange centre developed in the project.</p><p>At the end of the training the participants acknowledged that with the acquired skills they are able to improve the data processing chain in their day-to-day work and learned how SDIs can be used to share data.</p><p>During the 5 training days, the amount of data layers in the MaMase GeoNode had increased from 13 to 135, thanks to the efforts of the participants.</p>", "numchild": 0, "content_type": 43, "show_in_menus": false, "date": "2015-08-25", "path": "0001000100010003", "url_path": "/home/news/mamase-partners-trained-processing-and-sharing-gis-data/", "expired": false, "pk": 69, "main_image": null, "locked": false, "depth": 4, "first_published_at": "2015-08-25T14:47:41.467Z", "expire_at": null}	\N	69	1
\.


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_pagerevision_id_seq', 163, true);


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_pageviewrestriction (id, password, page_id) FROM stdin;
\.


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailcore_site (id, hostname, port, is_default_site, root_page_id) FROM stdin;
2	localhost	80	t	3
\.


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailcore_site_id_seq', 2, true);


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id) FROM stdin;
1	rangelands_grazing	documents/Rangelands_grazing.pdf	2015-08-25 21:48:13.722462+03	1
2	rangeland wet areas	documents/Rangelands_wet_areas.pdf	2015-08-25 21:56:48.161473+03	1
3	path erosion	documents/Path_erosion.pdf	2015-08-25 21:58:27.845446+03	1
4	constructed wetlands	documents/Constructed_wetland.pdf	2015-08-25 21:59:46.518656+03	1
\.


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtaildocs_document_id_seq', 4, true);


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailembeds_embed_id_seq', 1, false);


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
\.


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailforms_formsubmission_id_seq', 1, false);


--
-- Data for Name: wagtailimages_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailimages_filter (id, spec) FROM stdin;
1	max-130x100
2	max-165x165
3	max-1440x500
4	max-130x130
5	max-800x600
6	width-500
7	width-400
8	max-400x400
9	original
10	max-200x200
11	width-800
\.


--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailimages_filter_id_seq', 11, true);


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id) FROM stdin;
1	random image	original_images/WWW.YTS.TO.jpg	350	500	2015-08-03 16:54:13.753207+03	\N	\N	\N	\N	1
2	image 1	original_images/image1.jpg	381	132	2015-08-06 15:40:54.686446+03	\N	\N	\N	\N	1
3	image 2	original_images/image2.jpg	381	132	2015-08-06 15:41:23.471558+03	\N	\N	\N	\N	1
4	image 3	original_images/image3.jpg	381	132	2015-08-06 15:41:48.736389+03	\N	\N	\N	\N	1
5	image 4	original_images/image4.jpg	381	132	2015-08-06 15:42:16.275841+03	\N	\N	\N	\N	1
6	image 5	original_images/image2_fvCe7sc.jpg	381	132	2015-08-06 15:43:01.205581+03	\N	\N	\N	\N	1
7	image 6	original_images/image6.jpg	381	132	2015-08-06 15:43:28.212989+03	\N	\N	\N	\N	1
8	Mara Deforstation	original_images/Deforestation_in_the_Mara.jpg	190	142	2015-08-07 16:44:46.608014+03	\N	\N	\N	\N	1
9	Elephants Crossing	original_images/Elephants_crossing_the_Mara_River.jpg	190	142	2015-08-07 16:45:41.462511+03	\N	\N	\N	\N	1
10	Charcoal burning	original_images/Deforestation.jpg	190	142	2015-08-07 16:46:16.514839+03	\N	\N	\N	\N	1
11	Wildebeest crossing	original_images/DSC_1709.JPG	190	126	2015-08-07 16:46:57.169496+03	\N	\N	\N	\N	1
12	Mara's River Source	original_images/Source_of_the_Mara_River.JPG	190	126	2015-08-07 16:47:32.515766+03	\N	\N	\N	\N	1
13	Plateau	original_images/IMG_1901.JPG	739	493	2015-08-07 16:47:58.420985+03	\N	\N	\N	\N	1
14	Mamase image	original_images/mamase-photo-2.png	288	288	2015-08-12 10:09:09.68926+03	\N	\N	\N	\N	1
15	Story_mamase	original_images/story_mamase.png	288	288	2015-08-12 10:11:28.564729+03	\N	\N	\N	\N	1
16	story_mamase_2	original_images/story_mamase_2.png	288	288	2015-08-12 10:12:23.240282+03	\N	\N	\N	\N	1
17	mamase_photo_2	original_images/mamase-photo_2.png	288	288	2015-08-12 10:12:54.765118+03	\N	\N	\N	\N	1
18	meeting	original_images/GOPR0026.JPG	2592	1944	2015-08-21 09:34:54.13171+03	\N	\N	\N	\N	1
19	group photo	original_images/DSC_5203.JPG	2144	1424	2015-08-21 09:35:19.458242+03	\N	\N	\N	\N	1
20	seminar1	original_images/DSC_5187.JPG	2144	1424	2015-08-21 09:35:49.825623+03	\N	\N	\N	\N	1
21	seminar2	original_images/DSC_5184.JPG	2144	1424	2015-08-21 09:36:09.867432+03	\N	\N	\N	\N	1
22	seminar3	original_images/DSC_5172.JPG	2144	1424	2015-08-21 09:36:40.194593+03	\N	\N	\N	\N	1
23	HSBC	original_images/hsbc-premier-logo.jpg	1636	1088	2015-08-21 10:27:56.195986+03	\N	\N	\N	\N	1
24	Masaai Mara University	original_images/maasai_mara.png	250	250	2015-08-21 15:59:52.796863+03	\N	\N	\N	\N	1
25	UNESCO	original_images/UNESCO-logo-1024x777.jpg	1024	777	2015-08-21 16:05:22.935635+03	\N	\N	\N	\N	1
26	kingdom_netherlands	original_images/356px-Embassy_of_the_Kingdom_of_the_Netherlands_in_Slovenia_logo.svg.png	356	431	2015-08-21 16:18:09.507226+03	\N	\N	\N	\N	1
27	WWF	original_images/WWF_logo.svg.png	690	1023	2015-08-21 16:25:27.956075+03	\N	\N	\N	\N	1
28	deltares	original_images/Logo_Deltares_1.jpg	1600	934	2015-08-21 16:31:45.367837+03	\N	\N	\N	\N	1
29	GIZ	original_images/GIZ-logo.png	600	400	2015-08-21 16:52:27.501309+03	\N	\N	\N	\N	1
30	University of Twente	original_images/ITc_twente_logo_ITC.jpg	320	295	2015-08-21 16:56:22.740744+03	\N	\N	\N	\N	1
31	marafarming	original_images/marafarming.jpg	640	503	2015-08-21 17:00:21.281566+03	\N	\N	\N	\N	1
32	snv	original_images/snv.jpg	400	235	2015-08-21 17:07:12.629281+03	\N	\N	\N	\N	1
33	Waterschap Brabantse Delta	original_images/recente-projecten_WBD.png	448	238	2015-08-21 17:10:11.93824+03	\N	\N	\N	\N	1
34	wagenigin	original_images/_IMA_LOG_WUR.png	813	312	2015-08-21 17:11:44.795287+03	\N	\N	\N	\N	1
43	A Constructed Wetland 	original_images/Figure4.2.jpg	730	412	2015-08-22 21:49:15.783539+03	\N	\N	\N	\N	1
35	Degraded spring area Enonkishu Conservancy	original_images/Enonkishu_Conservancy.jpg	383	257	2015-08-22 21:20:05.438694+03	\N	\N	\N	\N	1
37	Wetland area	original_images/Figure2.jpg	380	252	2015-08-22 21:42:13.570804+03	\N	\N	\N	\N	1
38	Uncontrolled grazing area	original_images/Figure2.1.jpg	380	236	2015-08-22 21:43:21.254571+03	\N	\N	\N	\N	1
39	Controlled grazing area	original_images/Figure2.2.jpg	383	209	2015-08-22 21:44:40.636931+03	\N	\N	\N	\N	1
40	Path erosion channels 	original_images/Figure3.1.jpg	634	446	2015-08-22 21:46:55.839339+03	\N	\N	\N	\N	1
41	Drainage dip cut 	original_images/Figure3.2.jpg	412	379	2015-08-22 21:47:25.700324+03	\N	\N	\N	\N	1
42	A natural wetland	original_images/Figure4.1.jpg	768	512	2015-08-22 21:48:27.382276+03	\N	\N	\N	\N	1
44	 Hand- on training for the constructed wetlands	original_images/Figure4.3.jpg	717	538	2015-08-22 21:49:57.433774+03	\N	\N	\N	\N	1
45	UNESCO-ige	original_images/Logo-klein_1.png	230	54	2015-08-24 23:58:12.897191+03	\N	\N	\N	\N	1
46	UNESCO-IHE logo	original_images/unesco-ihe-logo.jpg	1106	251	2015-08-25 08:54:28.692674+03	\N	\N	\N	\N	1
47	Water Resources Management Authority 	original_images/wrma-logo.png	111	105	2015-08-25 09:12:33.805221+03	\N	\N	\N	\N	1
48	Egerton University	original_images/egerton-logo.jpeg	155	166	2015-08-25 09:23:27.061706+03	\N	\N	\N	\N	1
49	Mara River Water Users Association	original_images/wrua-mara.png	470	403	2015-08-25 09:33:13.339553+03	\N	\N	\N	\N	1
50	gis-training-mamase	original_images/gis-training-mamase_0.png	2560	1920	2015-08-25 17:08:46.205723+03	\N	\N	\N	\N	1
51	UNESCO-IHE	original_images/UNESCO-IHE_LOGO-RGB.jpg	1535	361	2015-08-25 17:42:44.234027+03	\N	\N	\N	\N	1
52	Water monitoring	original_images/MaMaSe-photo-2.png	630	421	2015-08-25 21:39:39.106039+03	\N	\N	\N	\N	1
53	Irrigated field	original_images/Irrigatedfield.png	2267	1702	2015-08-25 21:47:59.306617+03	\N	\N	\N	\N	1
54	River and cattle	original_images/Rivercarandcattle.png	1306	736	2015-08-25 21:50:48.679081+03	\N	\N	\N	\N	1
55	Session	original_images/IMG_8806.JPG	2074	1382	2015-08-25 21:54:13.965776+03	\N	\N	\N	\N	1
56	Instructions	original_images/IMG_8767.JPG	2074	1382	2015-08-25 21:57:00.188155+03	\N	\N	\N	\N	1
57	Cattle grazing	original_images/IMG_8739.JPG	2074	1382	2015-08-25 21:58:58.044928+03	\N	\N	\N	\N	1
58	Group	original_images/IMG_8744.JPG	2592	1728	2015-08-25 22:00:42.761216+03	\N	\N	\N	\N	1
59	Field trip	original_images/IMG_8719.JPG	2592	1728	2015-08-25 22:02:11.331483+03	\N	\N	\N	\N	1
60	Cattle inspection	original_images/IMG_8640.JPG	2592	1728	2015-08-25 22:04:18.935707+03	\N	\N	\N	\N	1
61	Bull	original_images/IMG_8638.JPG	2592	1728	2015-08-25 22:06:51.032562+03	\N	\N	\N	\N	1
62	Farmer	original_images/IMG_8614.JPG	2592	1728	2015-08-25 22:07:41.570676+03	\N	\N	\N	\N	1
63	Women	original_images/IMG_8591.JPG	2592	1728	2015-08-25 22:09:20.298925+03	\N	\N	\N	\N	1
64	Fence	original_images/IMG_8552.JPG	2592	1728	2015-08-25 22:11:21.001185+03	\N	\N	\N	\N	1
65	Landscape	original_images/GOPR0042.JPG	1296	972	2015-08-25 22:12:41.232793+03	\N	\N	\N	\N	1
66	Farming	original_images/Farming.png	960	1280	2015-08-25 22:15:09.448469+03	\N	\N	\N	\N	1
67	Women	original_images/DSC_5142.JPG	1072	712	2015-08-25 22:17:17.091987+03	\N	\N	\N	\N	1
68	Women	original_images/DSC_5101.JPG	1072	712	2015-08-25 22:18:23.612774+03	\N	\N	\N	\N	1
69	Listening men	original_images/DSC_5091.JPG	1072	712	2015-08-25 22:19:21.965528+03	\N	\N	\N	\N	1
70	MtKenya	original_images/_MG_8696.JPG	2592	1728	2015-08-25 22:21:31.255634+03	\N	\N	\N	\N	1
71	Kweli	original_images/DSC_5087.JPG	1072	712	2015-08-25 22:23:01.93524+03	\N	\N	\N	\N	1
\.


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailimages_image_id_seq', 71, true);


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailimages_rendition (id, file, width, height, focal_point_key, filter_id, image_id) FROM stdin;
1	images/WWW.YTS.TO.max-130x100.jpg	70	100		1	1
2	images/WWW.YTS.TO.max-165x165.jpg	115	165		2	1
3	images/image1.max-130x100.jpg	130	45		1	2
4	images/image1.max-165x165.jpg	165	57		2	2
5	images/image2.max-130x100.jpg	130	45		1	3
6	images/image2.max-165x165.jpg	165	57		2	3
7	images/image3.max-130x100.jpg	130	45		1	4
8	images/image3.max-165x165.jpg	165	57		2	4
9	images/image4.max-130x100.jpg	130	45		1	5
10	images/image4.max-165x165.jpg	165	57		2	5
11	images/image2_fvCe7sc.max-130x100.jpg	130	45		1	6
12	images/image2_fvCe7sc.max-165x165.jpg	165	57		2	6
13	images/image6.max-130x100.jpg	130	45		1	7
14	images/image6.max-165x165.jpg	165	57		2	7
15	images/image1.max-1440x500.jpg	381	132		3	2
16	images/image2.max-1440x500.jpg	381	132		3	3
17	images/image3.max-1440x500.jpg	381	132		3	4
18	images/image4.max-1440x500.jpg	381	132		3	5
19	images/image2_fvCe7sc.max-1440x500.jpg	381	132		3	6
20	images/image6.max-1440x500.jpg	381	132		3	7
21	images/image1.max-130x130.jpg	130	45		4	2
22	images/image2.max-130x130.jpg	130	45		4	3
23	images/image3.max-130x130.jpg	130	45		4	4
24	images/image4.max-130x130.jpg	130	45		4	5
25	images/image2_fvCe7sc.max-130x130.jpg	130	45		4	6
26	images/image6.max-130x130.jpg	130	45		4	7
27	images/Deforestation_in_the_Mara.max-130x100.jpg	130	97		1	8
28	images/Deforestation_in_the_Mara.max-130x130.jpg	130	97		4	8
29	images/Deforestation_in_the_Mara.max-165x165.jpg	165	123		2	8
30	images/Elephants_crossing_the_Mara_River.max-130x100.jpg	130	97		1	9
31	images/Elephants_crossing_the_Mara_River.max-165x165.jpg	165	123		2	9
32	images/Deforestation.max-130x100.jpg	130	97		1	10
33	images/Deforestation.max-165x165.jpg	165	123		2	10
34	images/DSC_1709.max-130x100.jpg	130	86		1	11
35	images/DSC_1709.max-165x165.jpg	165	109		2	11
36	images/Source_of_the_Mara_River.max-130x100.jpg	130	86		1	12
37	images/Source_of_the_Mara_River.max-165x165.jpg	165	109		2	12
38	images/IMG_1901.max-130x100.jpg	130	86		1	13
39	images/Deforestation_in_the_Mara.max-1440x500.jpg	190	142		3	8
40	images/Elephants_crossing_the_Mara_River.max-1440x500.jpg	190	142		3	9
41	images/Deforestation.max-1440x500.jpg	190	142		3	10
42	images/DSC_1709.max-1440x500.jpg	190	126		3	11
43	images/Source_of_the_Mara_River.max-1440x500.jpg	190	126		3	12
44	images/IMG_1901.max-1440x500.jpg	739	493		3	13
45	images/IMG_1901.max-165x165.jpg	165	110		2	13
46	images/mamase-photo-2.max-800x600.png	288	288		5	14
47	images/mamase-photo-2.width-500.png	288	288		6	14
48	images/mamase-photo-2.max-165x165.png	165	165		2	14
49	images/story_mamase.max-800x600.png	288	288		5	15
50	images/story_mamase.width-500.png	288	288		6	15
51	images/story_mamase.max-165x165.png	165	165		2	15
52	images/story_mamase_2.max-800x600.png	288	288		5	16
53	images/story_mamase_2.width-500.png	288	288		6	16
54	images/story_mamase_2.max-165x165.png	165	165		2	16
55	images/mamase-photo_2.max-800x600.png	288	288		5	17
56	images/mamase-photo_2.width-500.png	288	288		6	17
60	images/GOPR0026.max-130x100.jpg	130	97		1	18
58	images/mamase-photo_2.max-165x165.png	165	165		2	17
59	images/WWW.YTS.TO.width-400.jpg	350	500		7	1
61	images/GOPR0026.max-165x165.jpg	165	123		2	18
62	images/DSC_5203.max-130x100.jpg	130	86		1	19
63	images/DSC_5203.max-165x165.jpg	165	109		2	19
64	images/DSC_5187.max-130x100.jpg	130	86		1	20
65	images/DSC_5187.max-165x165.jpg	165	109		2	20
66	images/DSC_5184.max-130x100.jpg	130	86		1	21
67	images/DSC_5184.max-165x165.jpg	165	109		2	21
68	images/DSC_5172.max-130x100.jpg	130	86		1	22
69	images/GOPR0026.max-130x130.jpg	130	97		4	18
70	images/DSC_5203.max-130x130.jpg	130	86		4	19
71	images/DSC_5187.max-130x130.jpg	130	86		4	20
72	images/DSC_5184.max-130x130.jpg	130	86		4	21
73	images/DSC_5172.max-130x130.jpg	130	86		4	22
74	images/DSC_5172.max-165x165.jpg	165	109		2	22
75	images/hsbc-premier-logo.max-130x100.jpg	130	86		1	23
76	images/hsbc-premier-logo.max-165x165.jpg	165	109		2	23
77	images/hsbc-premier-logo.width-400.jpg	400	266		7	23
78	images/hsbc-premier-logo.max-130x130.jpg	130	86		4	23
79	images/maasai_mara.max-130x100.png	100	100		1	24
80	images/maasai_mara.width-400.png	250	250		7	24
81	images/maasai_mara.max-165x165.png	165	165		2	24
82	images/UNESCO-logo-1024x777.max-130x100.jpg	130	98		1	25
83	images/UNESCO-logo-1024x777.width-400.jpg	400	303		7	25
84	images/UNESCO-logo-1024x777.max-165x165.jpg	165	125		2	25
85	images/356px-Embassy_of_the_Kingdom_of_the_Netherla.max-130x100.png	82	100		1	26
86	images/356px-Embassy_of_the_Kingdom_of_the_Netherla.max-165x165.png	136	165		2	26
87	images/WWF_logo.svg.max-130x100.png	67	100		1	27
88	images/356px-Embassy_of_the_Kingdom_of_the_Netherland.width-400.png	356	431		7	26
89	images/WWF_logo.svg.width-400.png	400	593		7	27
90	images/hsbc-premier-logo.max-400x400.jpg	400	266		8	23
91	images/maasai_mara.max-400x400.png	250	250		8	24
92	images/UNESCO-logo-1024x777.max-400x400.jpg	400	303		8	25
93	images/356px-Embassy_of_the_Kingdom_of_the_Netherla.max-400x400.png	330	400		8	26
94	images/WWF_logo.svg.max-400x400.png	269	400		8	27
95	images/WWF_logo.svg.max-165x165.png	111	165		2	27
96	images/Logo_Deltares_1.max-130x100.jpg	130	75		1	28
97	images/Logo_Deltares_1.max-130x130.jpg	130	75		4	28
98	images/Logo_Deltares_1.max-165x165.jpg	165	96		2	28
99	images/Logo_Deltares_1.max-400x400.jpg	400	233		8	28
100	images/Logo_Deltares_1.width-400.jpg	400	233		7	28
101	images/GIZ-logo.max-130x100.png	130	86		1	29
102	images/GIZ-logo.max-165x165.png	165	110		2	29
103	images/ITc_twente_logo_ITC.max-130x100.jpg	108	100		1	30
104	images/ITc_twente_logo_ITC.max-165x165.jpg	165	152		2	30
105	images/marafarming.max-130x100.jpg	127	100		1	31
106	images/marafarming.max-165x165.jpg	165	129		2	31
107	images/snv.max-130x100.jpg	130	76		1	32
108	images/snv.max-165x165.jpg	165	96		2	32
109	images/recente-projecten_WBD.max-130x100.png	130	69		1	33
110	images/recente-projecten_WBD.max-165x165.png	165	87		2	33
111	images/_IMA_LOG_WUR.max-130x100.png	130	49		1	34
112	images/GIZ-logo.max-400x400.png	400	266		8	29
113	images/ITc_twente_logo_ITC.max-400x400.jpg	320	295		8	30
114	images/marafarming.max-400x400.jpg	400	314		8	31
115	images/snv.max-400x400.jpg	400	235		8	32
116	images/recente-projecten_WBD.max-400x400.png	400	212		8	33
117	images/_IMA_LOG_WUR.max-400x400.png	400	153		8	34
118	images/_IMA_LOG_WUR.width-400.png	400	153		7	34
119	images/_IMA_LOG_WUR.max-165x165.png	165	63		2	34
120	images/Enonkishu_Conservancy.max-800x600.jpg	383	257		5	35
122	images/Enonkishu_Conservancy.width-500.jpg	383	257		6	35
124	images/Enonkishu_Conservancy.max-165x165.jpg	165	110		2	35
127	images/Enonkishu_Conservancy.original.jpg	383	257		9	35
128	images/Figure2.2.max-165x165.jpg	165	90		2	39
129	images/Figure2.1.max-165x165.jpg	165	102		2	38
130	images/Figure2.max-165x165.jpg	165	109		2	37
131	images/Figure4.3.max-165x165.jpg	165	123		2	44
132	images/Figure4.2.max-165x165.jpg	165	93		2	43
133	images/Figure4.1.max-165x165.jpg	165	110		2	42
134	images/Figure3.2.max-165x165.jpg	165	151		2	41
135	images/Figure3.1.max-165x165.jpg	165	116		2	40
136	images/Figure2.max-800x600.jpg	380	252		5	37
137	images/Figure2.width-500.jpg	380	252		6	37
138	images/Figure2.1.max-800x600.jpg	380	236		5	38
139	images/Figure2.1.width-500.jpg	380	236		6	38
140	images/Figure2.2.max-800x600.jpg	383	209		5	39
141	images/Figure2.2.width-500.jpg	383	209		6	39
142	images/Figure3.1.max-800x600.jpg	634	446		5	40
143	images/Figure3.1.width-500.jpg	500	351		6	40
144	images/Figure3.2.max-800x600.jpg	412	379		5	41
145	images/Figure3.2.width-500.jpg	412	379		6	41
146	images/Figure4.1.max-800x600.jpg	768	512		5	42
147	images/Figure4.1.width-500.jpg	500	333		6	42
148	images/Figure4.2.max-800x600.jpg	730	412		5	43
149	images/Figure4.2.width-500.jpg	500	282		6	43
150	images/Figure4.3.max-800x600.jpg	717	538		5	44
151	images/Figure4.3.width-500.jpg	500	375		6	44
152	images/marafarming.width-400.jpg	400	314		7	31
153	images/GIZ-logo.width-400.png	400	266		7	29
154	images/ITc_twente_logo_ITC.width-400.jpg	320	295		7	30
155	images/UNESCO-logo-1024x777.max-130x130.jpg	130	98		4	25
156	images/Logo-klein_1.max-130x100.png	130	30		1	45
157	images/356px-Embassy_of_the_Kingdom_of_the_Netherla.max-130x130.png	107	130		4	26
158	images/snv.max-130x130.jpg	130	76		4	32
159	images/Logo-klein_1.max-400x400.png	230	54		8	45
160	images/Logo-klein_1.max-130x130.png	130	30		4	45
161	images/Logo-klein_1.max-165x165.png	165	38		2	45
162	images/unesco-ihe-logo.max-130x100.jpg	130	29		1	46
163	images/unesco-ihe-logo.max-400x400.jpg	400	90		8	46
164	images/unesco-ihe-logo.max-200x200.jpg	200	45		10	46
165	images/snv.max-200x200.jpg	200	117		10	32
166	images/356px-Embassy_of_the_Kingdom_of_the_Netherla.max-200x200.png	165	200		10	26
167	images/_IMA_LOG_WUR.max-200x200.png	200	76		10	34
168	images/recente-projecten_WBD.max-200x200.png	200	106		10	33
169	images/marafarming.max-200x200.jpg	200	157		10	31
170	images/ITc_twente_logo_ITC.max-200x200.jpg	200	184		10	30
171	images/GIZ-logo.max-200x200.png	200	133		10	29
172	images/Logo_Deltares_1.max-200x200.jpg	200	116		10	28
173	images/WWF_logo.svg.max-200x200.png	134	200		10	27
174	images/maasai_mara.max-200x200.png	200	200		10	24
175	images/hsbc-premier-logo.max-200x200.jpg	200	133		10	23
176	images/unesco-ihe-logo.max-165x165.jpg	165	37		2	46
177	images/wrma-logo.max-130x100.png	105	100		1	47
178	images/wrma-logo.max-200x200.png	111	105		10	47
179	images/wrma-logo.max-165x165.png	111	105		2	47
180	images/egerton-logo.max-130x100.jpg	93	100		1	48
181	images/egerton-logo.max-200x200.jpg	155	166		10	48
182	images/egerton-logo.max-165x165.jpg	154	165		2	48
183	images/wrua-mara.max-130x100.png	116	100		1	49
184	images/wrua-mara.max-165x165.png	165	141		2	49
185	images/wrua-mara.max-200x200.png	200	171		10	49
186	images/_IMA_LOG_WUR.max-130x130.png	130	49		4	34
187	images/egerton-logo.max-130x130.jpg	121	130		4	48
188	images/ITc_twente_logo_ITC.max-130x130.jpg	130	119		4	30
189	images/wrma-logo.max-130x130.png	111	105		4	47
190	images/unesco-ihe-logo.max-130x130.jpg	130	29		4	46
191	images/gis-training-mamase_0.max-165x165.png	165	123		2	50
192	images/UNESCO-IHE_LOGO-RGB.max-130x100.jpg	130	30		1	51
193	images/UNESCO-IHE_LOGO-RGB.max-200x200.jpg	200	47		10	51
194	images/UNESCO-IHE_LOGO-RGB.max-165x165.jpg	165	38		2	51
195	images/gis-training-mamase_0.max-130x100.png	130	97		1	50
196	images/gis-training-mamase_0.max-800x600.png	800	600		5	50
197	images/gis-training-mamase_0.width-500.png	500	375		6	50
198	images/gis-training-mamase_0.width-800.png	800	600		11	50
199	images/MaMaSe-photo-2.max-130x100.png	130	86		1	52
200	images/DSC_5172.original.jpg	2144	1424		9	22
201	images/DSC_5172.max-800x600.jpg	800	531		5	22
202	images/MaMaSe-photo-2.max-165x165.png	165	110		2	52
203	images/Irrigatedfield.max-130x100.png	130	97		1	53
204	images/Irrigatedfield.max-165x165.png	165	123		2	53
205	images/Irrigatedfield.original.png	2267	1702		9	53
206	images/Irrigatedfield.max-800x600.png	799	600		5	53
207	images/Rivercarandcattle.max-130x100.png	130	73		1	54
208	images/Rivercarandcattle.max-165x165.png	165	92		2	54
209	images/IMG_8806.max-130x100.jpg	130	86		1	55
210	images/IMG_8806.max-165x165.jpg	165	109		2	55
211	images/IMG_8767.max-130x100.jpg	130	86		1	56
212	images/IMG_8767.max-165x165.jpg	165	109		2	56
213	images/IMG_8739.max-130x100.jpg	130	86		1	57
214	images/IMG_8739.original.jpg	2074	1382		9	57
215	images/IMG_8739.max-800x600.jpg	800	533		5	57
216	images/IMG_8739.max-165x165.jpg	165	109		2	57
217	images/IMG_8744.max-130x100.jpg	130	86		1	58
218	images/IMG_8744.max-165x165.jpg	165	110		2	58
219	images/IMG_8719.max-130x100.jpg	130	86		1	59
220	images/IMG_8719.max-165x165.jpg	165	110		2	59
221	images/IMG_8640.max-130x100.jpg	130	86		1	60
222	images/IMG_8640.max-165x165.jpg	165	110		2	60
223	images/IMG_8638.max-130x100.jpg	130	86		1	61
224	images/IMG_8638.max-165x165.jpg	165	110		2	61
225	images/IMG_8614.max-130x100.jpg	130	86		1	62
226	images/IMG_8614.max-165x165.jpg	165	110		2	62
227	images/IMG_8591.max-130x100.jpg	130	86		1	63
228	images/IMG_8591.max-165x165.jpg	165	110		2	63
229	images/IMG_8552.max-130x100.jpg	130	86		1	64
230	images/IMG_8552.max-165x165.jpg	165	110		2	64
231	images/GOPR0042.max-130x100.jpg	130	97		1	65
232	images/GOPR0042.max-165x165.jpg	165	123		2	65
233	images/Farming.max-130x100.png	75	100		1	66
234	images/Farming.max-165x165.png	123	165		2	66
235	images/DSC_5142.max-130x100.jpg	130	86		1	67
236	images/DSC_5142.max-165x165.jpg	165	109		2	67
237	images/DSC_5101.max-130x100.jpg	130	86		1	68
238	images/DSC_5101.max-165x165.jpg	165	109		2	68
239	images/DSC_5091.max-130x100.jpg	130	86		1	69
240	images/DSC_5091.max-165x165.jpg	165	109		2	69
241	images/_MG_8696.max-130x100.jpg	130	86		1	70
242	images/_MG_8696.max-165x165.jpg	165	110		2	70
243	images/DSC_5087.max-130x100.jpg	130	86		1	71
\.


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailimages_rendition_id_seq', 243, true);


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailredirects_redirect_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_editorspick; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailsearch_editorspick (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailsearch_editorspick_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailsearch_query (id, query_string) FROM stdin;
1	fast
2	popeye
3	dry
4	mamase
5	hsbc
6	season
\.


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailsearch_query_id_seq', 6, true);


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
1	2015-08-08	1	1
2	2015-08-08	1	2
3	2015-08-12	1	3
4	2015-08-19	1	4
6	2015-08-21	1	6
5	2015-08-21	4	5
\.


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailsearch_querydailyhits_id_seq', 6, true);


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id) FROM stdin;
1	t	t	t	1
\.


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wagtailusers_userprofile_id_seq', 1, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_3ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_3ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_3e1b0d13_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_3e1b0d13_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_7ef9fce_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_7ef9fce_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: essay_essay_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY essay_essay_question
    ADD CONSTRAINT essay_essay_question_pkey PRIMARY KEY (question_ptr_id);


--
-- Name: event_eventindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_eventindexpage
    ADD CONSTRAINT event_eventindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: event_eventindexrelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_eventindexrelatedlink
    ADD CONSTRAINT event_eventindexrelatedlink_pkey PRIMARY KEY (id);


--
-- Name: event_eventpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_eventpage
    ADD CONSTRAINT event_eventpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: event_eventpagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_eventpagetag
    ADD CONSTRAINT event_eventpagetag_pkey PRIMARY KEY (id);


--
-- Name: filer_clipboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT filer_clipboard_pkey PRIMARY KEY (id);


--
-- Name: filer_clipboarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_pkey PRIMARY KEY (id);


--
-- Name: filer_file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_pkey PRIMARY KEY (id);


--
-- Name: filer_folder_parent_id_4d901e49_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_parent_id_4d901e49_uniq UNIQUE (parent_id, name);


--
-- Name: filer_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_pkey PRIMARY KEY (id);


--
-- Name: filer_folderpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_pkey PRIMARY KEY (id);


--
-- Name: filer_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT filer_image_pkey PRIMARY KEY (file_ptr_id);


--
-- Name: gallery_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY gallery_gallery
    ADD CONSTRAINT gallery_gallery_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: galleryapp_gallery_page_ptr_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY galleryapp_gallery
    ADD CONSTRAINT galleryapp_gallery_page_ptr_id_key UNIQUE (page_ptr_id);


--
-- Name: galleryapp_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY galleryapp_gallery
    ADD CONSTRAINT galleryapp_gallery_pkey PRIMARY KEY (gallery_slug);


--
-- Name: galleryapp_image_page_ptr_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY galleryapp_image
    ADD CONSTRAINT galleryapp_image_page_ptr_id_key UNIQUE (page_ptr_id);


--
-- Name: galleryapp_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY galleryapp_image
    ADD CONSTRAINT galleryapp_image_pkey PRIMARY KEY (image_slug);


--
-- Name: home_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY home_homepage
    ADD CONSTRAINT home_homepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: mamasemedia_mediapage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mamasemedia_mediapage
    ADD CONSTRAINT mamasemedia_mediapage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: mamasemedia_mediapagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mamasemedia_mediapagerelatedlink
    ADD CONSTRAINT mamasemedia_mediapagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: multichoice_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY multichoice_answer
    ADD CONSTRAINT multichoice_answer_pkey PRIMARY KEY (id);


--
-- Name: multichoice_mcquestion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY multichoice_mcquestion
    ADD CONSTRAINT multichoice_mcquestion_pkey PRIMARY KEY (question_ptr_id);


--
-- Name: news_categorypage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY news_categorypage
    ADD CONSTRAINT news_categorypage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: news_informationpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY news_informationpage
    ADD CONSTRAINT news_informationpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: news_newsindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY news_newsindexpage
    ADD CONSTRAINT news_newsindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: news_newsindexrelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY news_newsindexrelatedlink
    ADD CONSTRAINT news_newsindexrelatedlink_pkey PRIMARY KEY (id);


--
-- Name: news_newspage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY news_newspage
    ADD CONSTRAINT news_newspage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: news_newspagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY news_newspagetag
    ADD CONSTRAINT news_newspagetag_pkey PRIMARY KEY (id);


--
-- Name: news_nocommentpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY news_nocommentpage
    ADD CONSTRAINT news_nocommentpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: partners_partnerindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY partners_partnerindexpage
    ADD CONSTRAINT partners_partnerindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: partners_partnerlogo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY partners_partnerlogo
    ADD CONSTRAINT partners_partnerlogo_pkey PRIMARY KEY (id);


--
-- Name: partners_partnerpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY partners_partnerpage
    ADD CONSTRAINT partners_partnerpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: quiz_category_category_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_category
    ADD CONSTRAINT quiz_category_category_key UNIQUE (category);


--
-- Name: quiz_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_category
    ADD CONSTRAINT quiz_category_pkey PRIMARY KEY (id);


--
-- Name: quiz_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_progress
    ADD CONSTRAINT quiz_progress_pkey PRIMARY KEY (id);


--
-- Name: quiz_progress_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_progress
    ADD CONSTRAINT quiz_progress_user_id_key UNIQUE (user_id);


--
-- Name: quiz_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_question
    ADD CONSTRAINT quiz_question_pkey PRIMARY KEY (id);


--
-- Name: quiz_question_quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_question_quiz
    ADD CONSTRAINT quiz_question_quiz_pkey PRIMARY KEY (id);


--
-- Name: quiz_question_quiz_question_id_quiz_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_question_quiz
    ADD CONSTRAINT quiz_question_quiz_question_id_quiz_id_key UNIQUE (question_id, quiz_id);


--
-- Name: quiz_quiz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_quiz
    ADD CONSTRAINT quiz_quiz_pkey PRIMARY KEY (id);


--
-- Name: quiz_sitting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_sitting
    ADD CONSTRAINT quiz_sitting_pkey PRIMARY KEY (id);


--
-- Name: quiz_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_subcategory
    ADD CONSTRAINT quiz_subcategory_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: testapp_tpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY testapp_tpage
    ADD CONSTRAINT testapp_tpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: thingspeak_channel_data_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY thingspeak_channel
    ADD CONSTRAINT thingspeak_channel_data_id_key UNIQUE (data_id);


--
-- Name: thingspeak_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY thingspeak_channel
    ADD CONSTRAINT thingspeak_channel_pkey PRIMARY KEY (id);


--
-- Name: thingspeak_channelfield_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY thingspeak_channelfield
    ADD CONSTRAINT thingspeak_channelfield_pkey PRIMARY KEY (id);


--
-- Name: thingspeak_feed_entry_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY thingspeak_feed
    ADD CONSTRAINT thingspeak_feed_entry_id_key UNIQUE (entry_id);


--
-- Name: thingspeak_feed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY thingspeak_feed
    ADD CONSTRAINT thingspeak_feed_pkey PRIMARY KEY (id);


--
-- Name: thingspeak_feedfield_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY thingspeak_feedfield
    ADD CONSTRAINT thingspeak_feedfield_pkey PRIMARY KEY (id);


--
-- Name: thingspeak_loggerdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY thingspeak_loggerdata
    ADD CONSTRAINT thingspeak_loggerdata_pkey PRIMARY KEY (id);


--
-- Name: true_false_tf_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY true_false_tf_question
    ADD CONSTRAINT true_false_tf_question_pkey PRIMARY KEY (question_ptr_id);


--
-- Name: utils_channel_data_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utils_channel
    ADD CONSTRAINT utils_channel_data_id_key UNIQUE (data_id);


--
-- Name: utils_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utils_channel
    ADD CONSTRAINT utils_channel_pkey PRIMARY KEY (id);


--
-- Name: utils_channelfield_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utils_channelfield
    ADD CONSTRAINT utils_channelfield_pkey PRIMARY KEY (id);


--
-- Name: utils_emailrecipient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utils_emailrecipient
    ADD CONSTRAINT utils_emailrecipient_pkey PRIMARY KEY (id);


--
-- Name: utils_feed_entry_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utils_feed
    ADD CONSTRAINT utils_feed_entry_id_key UNIQUE (entry_id);


--
-- Name: utils_feed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utils_feed
    ADD CONSTRAINT utils_feed_pkey PRIMARY KEY (id);


--
-- Name: utils_feedfield_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utils_feedfield
    ADD CONSTRAINT utils_feedfield_pkey PRIMARY KEY (id);


--
-- Name: utils_loggerdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utils_loggerdata
    ADD CONSTRAINT utils_loggerdata_pkey PRIMARY KEY (id);


--
-- Name: video_embeddedvideoindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY video_embeddedvideoindexpage
    ADD CONSTRAINT video_embeddedvideoindexpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: video_embeddedvideoindexrelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY video_embeddedvideoindexrelatedlink
    ADD CONSTRAINT video_embeddedvideoindexrelatedlink_pkey PRIMARY KEY (id);


--
-- Name: video_embeddedvideopage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY video_embeddedvideopage
    ADD CONSTRAINT video_embeddedvideopage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: video_embeddedvideopagetag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY video_embeddedvideopagetag
    ADD CONSTRAINT video_embeddedvideopagetag_pkey PRIMARY KEY (id);


--
-- Name: visualization_channel_data_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY visualization_channel
    ADD CONSTRAINT visualization_channel_data_id_key UNIQUE (data_id);


--
-- Name: visualization_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY visualization_channel
    ADD CONSTRAINT visualization_channel_pkey PRIMARY KEY (id);


--
-- Name: visualization_channelfield_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY visualization_channelfield
    ADD CONSTRAINT visualization_channelfield_pkey PRIMARY KEY (id);


--
-- Name: visualization_feed_entry_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY visualization_feed
    ADD CONSTRAINT visualization_feed_entry_id_key UNIQUE (entry_id);


--
-- Name: visualization_feed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY visualization_feed
    ADD CONSTRAINT visualization_feed_pkey PRIMARY KEY (id);


--
-- Name: visualization_feedfield_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY visualization_feedfield
    ADD CONSTRAINT visualization_feedfield_pkey PRIMARY KEY (id);


--
-- Name: visualization_loggerdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY visualization_loggerdata
    ADD CONSTRAINT visualization_loggerdata_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission_group_id_5e8d9b00_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_group_id_5e8d9b00_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site_hostname_6b53fda_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_6b53fda_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_url_6d95b7ba_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_6d95b7ba_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_filter_spec_40fed7f8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_spec_40fed7f8_uniq UNIQUE (spec);


--
-- Name: wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition_image_id_119535f1_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_119535f1_uniq UNIQUE (image_id, filter_id, focal_point_key);


--
-- Name: wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect_old_path_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_key UNIQUE (old_path);


--
-- Name: wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits_query_id_6de34f37_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_6de34f37_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_331666e8_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_94b8aae_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_94b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_630ca218_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_b068931c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b068931c ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_b454e115; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b454e115 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_name_248dcfc0_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_248dcfc0_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_7b3a08dd_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_7b3a08dd_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_0afd9202; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_0afd9202 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_b068931c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b068931c ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_b454e115; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b454e115 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name_6cfd3956_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_6cfd3956_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_35a12fad_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_35a12fad_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: event_eventindexrelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX event_eventindexrelatedlink_1a63c800 ON event_eventindexrelatedlink USING btree (page_id);


--
-- Name: event_eventindexrelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX event_eventindexrelatedlink_5b76e141 ON event_eventindexrelatedlink USING btree (link_page_id);


--
-- Name: event_eventpage_36b62cbe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX event_eventpage_36b62cbe ON event_eventpage USING btree (main_image_id);


--
-- Name: event_eventpage_b583a629; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX event_eventpage_b583a629 ON event_eventpage USING btree (category_id);


--
-- Name: event_eventpagetag_09a80f33; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX event_eventpagetag_09a80f33 ON event_eventpagetag USING btree (content_object_id);


--
-- Name: event_eventpagetag_76f094bc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX event_eventpagetag_76f094bc ON event_eventpagetag USING btree (tag_id);


--
-- Name: filer_clipboard_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_clipboard_e8701ad4 ON filer_clipboard USING btree (user_id);


--
-- Name: filer_clipboarditem_2655b062; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_clipboarditem_2655b062 ON filer_clipboarditem USING btree (clipboard_id);


--
-- Name: filer_clipboarditem_814552b9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_clipboarditem_814552b9 ON filer_clipboarditem USING btree (file_id);


--
-- Name: filer_file_5e7b1936; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_file_5e7b1936 ON filer_file USING btree (owner_id);


--
-- Name: filer_file_a8a44dbb; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_file_a8a44dbb ON filer_file USING btree (folder_id);


--
-- Name: filer_file_d3e32c49; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_file_d3e32c49 ON filer_file USING btree (polymorphic_ctype_id);


--
-- Name: filer_folder_3cfbd988; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_folder_3cfbd988 ON filer_folder USING btree (rght);


--
-- Name: filer_folder_5e7b1936; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_folder_5e7b1936 ON filer_folder USING btree (owner_id);


--
-- Name: filer_folder_656442a0; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_folder_656442a0 ON filer_folder USING btree (tree_id);


--
-- Name: filer_folder_6be37982; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_folder_6be37982 ON filer_folder USING btree (parent_id);


--
-- Name: filer_folder_c9e9a848; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_folder_c9e9a848 ON filer_folder USING btree (level);


--
-- Name: filer_folder_caf7cc51; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_folder_caf7cc51 ON filer_folder USING btree (lft);


--
-- Name: filer_folderpermission_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_folderpermission_0e939a4f ON filer_folderpermission USING btree (group_id);


--
-- Name: filer_folderpermission_a8a44dbb; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_folderpermission_a8a44dbb ON filer_folderpermission USING btree (folder_id);


--
-- Name: filer_folderpermission_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filer_folderpermission_e8701ad4 ON filer_folderpermission USING btree (user_id);


--
-- Name: galleryapp_gallery_gallery_slug_719b0cd7_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX galleryapp_gallery_gallery_slug_719b0cd7_like ON galleryapp_gallery USING btree (gallery_slug varchar_pattern_ops);


--
-- Name: galleryapp_image_6d994cdb; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX galleryapp_image_6d994cdb ON galleryapp_image USING btree (gallery_id);


--
-- Name: galleryapp_image_gallery_id_5ea18ef6_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX galleryapp_image_gallery_id_5ea18ef6_like ON galleryapp_image USING btree (gallery_id varchar_pattern_ops);


--
-- Name: galleryapp_image_image_slug_74d5bf55_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX galleryapp_image_image_slug_74d5bf55_like ON galleryapp_image USING btree (image_slug varchar_pattern_ops);


--
-- Name: mamasemedia_mediapagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mamasemedia_mediapagerelatedlink_1a63c800 ON mamasemedia_mediapagerelatedlink USING btree (page_id);


--
-- Name: mamasemedia_mediapagerelatedlink_f33175e6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mamasemedia_mediapagerelatedlink_f33175e6 ON mamasemedia_mediapagerelatedlink USING btree (image_id);


--
-- Name: multichoice_answer_7aa0f6ee; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX multichoice_answer_7aa0f6ee ON multichoice_answer USING btree (question_id);


--
-- Name: news_newsindexrelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX news_newsindexrelatedlink_1a63c800 ON news_newsindexrelatedlink USING btree (page_id);


--
-- Name: news_newsindexrelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX news_newsindexrelatedlink_5b76e141 ON news_newsindexrelatedlink USING btree (link_page_id);


--
-- Name: news_newspage_121087a8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX news_newspage_121087a8 ON news_newspage USING btree (link_document_id);


--
-- Name: news_newspage_36b62cbe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX news_newspage_36b62cbe ON news_newspage USING btree (main_image_id);


--
-- Name: news_newspage_b583a629; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX news_newspage_b583a629 ON news_newspage USING btree (category_id);


--
-- Name: news_newspagetag_09a80f33; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX news_newspagetag_09a80f33 ON news_newspagetag USING btree (content_object_id);


--
-- Name: news_newspagetag_76f094bc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX news_newspagetag_76f094bc ON news_newspagetag USING btree (tag_id);


--
-- Name: news_nocommentpage_121087a8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX news_nocommentpage_121087a8 ON news_nocommentpage USING btree (link_document_id);


--
-- Name: news_nocommentpage_b583a629; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX news_nocommentpage_b583a629 ON news_nocommentpage USING btree (category_id);


--
-- Name: partners_partnerpage_36b62cbe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX partners_partnerpage_36b62cbe ON partners_partnerpage USING btree (main_image_id);


--
-- Name: quiz_category_category_4a2e9930_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quiz_category_category_4a2e9930_like ON quiz_category USING btree (category varchar_pattern_ops);


--
-- Name: quiz_question_b583a629; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quiz_question_b583a629 ON quiz_question USING btree (category_id);


--
-- Name: quiz_question_fa50d5d8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quiz_question_fa50d5d8 ON quiz_question USING btree (sub_category_id);


--
-- Name: quiz_question_quiz_7aa0f6ee; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quiz_question_quiz_7aa0f6ee ON quiz_question_quiz USING btree (question_id);


--
-- Name: quiz_question_quiz_baedd54c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quiz_question_quiz_baedd54c ON quiz_question_quiz USING btree (quiz_id);


--
-- Name: quiz_quiz_572d4e42; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quiz_quiz_572d4e42 ON quiz_quiz USING btree (url);


--
-- Name: quiz_quiz_b583a629; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quiz_quiz_b583a629 ON quiz_quiz USING btree (category_id);


--
-- Name: quiz_quiz_url_387d1881_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quiz_quiz_url_387d1881_like ON quiz_quiz USING btree (url varchar_pattern_ops);


--
-- Name: quiz_sitting_baedd54c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quiz_sitting_baedd54c ON quiz_sitting USING btree (quiz_id);


--
-- Name: quiz_sitting_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quiz_sitting_e8701ad4 ON quiz_sitting USING btree (user_id);


--
-- Name: quiz_subcategory_b583a629; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quiz_subcategory_b583a629 ON quiz_subcategory USING btree (category_id);


--
-- Name: taggit_tag_name_6b48d50f_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_tag_name_6b48d50f_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_cd922a7_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_tag_slug_cd922a7_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: thingspeak_channelfield_72eb6c85; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX thingspeak_channelfield_72eb6c85 ON thingspeak_channelfield USING btree (channel_id);


--
-- Name: thingspeak_feed_72eb6c85; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX thingspeak_feed_72eb6c85 ON thingspeak_feed USING btree (channel_id);


--
-- Name: thingspeak_feedfield_22b3ddb3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX thingspeak_feedfield_22b3ddb3 ON thingspeak_feedfield USING btree ("channelField_id");


--
-- Name: thingspeak_feedfield_c95a8e93; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX thingspeak_feedfield_c95a8e93 ON thingspeak_feedfield USING btree (feed_id);


--
-- Name: utils_channelfield_72eb6c85; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX utils_channelfield_72eb6c85 ON utils_channelfield USING btree (channel_id);


--
-- Name: utils_feed_72eb6c85; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX utils_feed_72eb6c85 ON utils_feed USING btree (channel_id);


--
-- Name: utils_feedfield_22b3ddb3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX utils_feedfield_22b3ddb3 ON utils_feedfield USING btree ("channelField_id");


--
-- Name: utils_feedfield_c95a8e93; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX utils_feedfield_c95a8e93 ON utils_feedfield USING btree (feed_id);


--
-- Name: video_embeddedvideoindexrelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX video_embeddedvideoindexrelatedlink_1a63c800 ON video_embeddedvideoindexrelatedlink USING btree (page_id);


--
-- Name: video_embeddedvideoindexrelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX video_embeddedvideoindexrelatedlink_5b76e141 ON video_embeddedvideoindexrelatedlink USING btree (link_page_id);


--
-- Name: video_embeddedvideopage_b583a629; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX video_embeddedvideopage_b583a629 ON video_embeddedvideopage USING btree (category_id);


--
-- Name: video_embeddedvideopagetag_09a80f33; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX video_embeddedvideopagetag_09a80f33 ON video_embeddedvideopagetag USING btree (content_object_id);


--
-- Name: video_embeddedvideopagetag_76f094bc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX video_embeddedvideopagetag_76f094bc ON video_embeddedvideopagetag USING btree (tag_id);


--
-- Name: visualization_channelfield_72eb6c85; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX visualization_channelfield_72eb6c85 ON visualization_channelfield USING btree (channel_id);


--
-- Name: visualization_feed_72eb6c85; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX visualization_feed_72eb6c85 ON visualization_feed USING btree (channel_id);


--
-- Name: visualization_feedfield_22b3ddb3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX visualization_feedfield_22b3ddb3 ON visualization_feedfield USING btree ("channelField_id");


--
-- Name: visualization_feedfield_c95a8e93; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX visualization_feedfield_c95a8e93 ON visualization_feedfield USING btree (feed_id);


--
-- Name: wagtailcore_grouppagepermission_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_0e939a4f ON wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_1a63c800 ON wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_2dbcba41; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_2dbcba41 ON wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_417f1b1c ON wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_5e7b1936; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_5e7b1936 ON wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_path_2a1ab75e_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_path_2a1ab75e_like ON wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_6c47d916_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_page_slug_6c47d916_like ON wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_1a63c800 ON wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_e8701ad4 ON wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pageviewrestriction_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_pageviewrestriction_1a63c800 ON wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_site_0897acf4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_site_0897acf4 ON wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_8372b497; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_site_8372b497 ON wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtailcore_site_hostname_5c8e8730_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailcore_site_hostname_5c8e8730_like ON wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtaildocs_document_ef01e2b6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtaildocs_document_ef01e2b6 ON wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailforms_formsubmission_1a63c800 ON wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_filter_b979c293; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_filter_b979c293 ON wagtailimages_filter USING btree (spec);


--
-- Name: wagtailimages_filter_spec_40fed7f8_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_filter_spec_40fed7f8_like ON wagtailimages_filter USING btree (spec varchar_pattern_ops);


--
-- Name: wagtailimages_image_ef01e2b6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_image_ef01e2b6 ON wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_0a317463; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_0a317463 ON wagtailimages_rendition USING btree (filter_id);


--
-- Name: wagtailimages_rendition_f33175e6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_f33175e6 ON wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailredirects_redirect_2fd79f37; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_2fd79f37 ON wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_9365d6e7 ON wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailredirects_redirect_old_path_1434daf4_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_old_path_1434daf4_like ON wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailsearch_editorspick_0bbeda9c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_0bbeda9c ON wagtailsearch_editorspick USING btree (query_id);


--
-- Name: wagtailsearch_editorspick_1a63c800; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_1a63c800 ON wagtailsearch_editorspick USING btree (page_id);


--
-- Name: wagtailsearch_query_query_string_1796bb04_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_query_query_string_1796bb04_like ON wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_0bbeda9c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX wagtailsearch_querydailyhits_0bbeda9c ON wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: D9d2399ada348796542332e121f12687; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY video_embeddedvideopagetag
    ADD CONSTRAINT "D9d2399ada348796542332e121f12687" FOREIGN KEY (content_object_id) REFERENCES video_embeddedvideopage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_23962d04_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_23962d04_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_58c48ba9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_58c48ba9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_51277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_51277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_30a071c9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_30a071c9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_24702650_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_24702650_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_3d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_3d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_5151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_5151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_1c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_1c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thum_thumbnail_id_314c3e84_fk_easy_thumbnails_thumbnail_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thum_thumbnail_id_314c3e84_fk_easy_thumbnails_thumbnail_id FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_source_id_7106e1b7_fk_easy_thumbnails_source_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_source_id_7106e1b7_fk_easy_thumbnails_source_id FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: essay_essay_questi_question_ptr_id_35415cdf_fk_quiz_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY essay_essay_question
    ADD CONSTRAINT essay_essay_questi_question_ptr_id_35415cdf_fk_quiz_question_id FOREIGN KEY (question_ptr_id) REFERENCES quiz_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_content_object_id_22c9c39b_fk_event_eventpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_eventpagetag
    ADD CONSTRAINT event_content_object_id_22c9c39b_fk_event_eventpage_page_ptr_id FOREIGN KEY (content_object_id) REFERENCES event_eventpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_eve_category_id_7a3c004d_fk_news_categorypage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_eventpage
    ADD CONSTRAINT event_eve_category_id_7a3c004d_fk_news_categorypage_page_ptr_id FOREIGN KEY (category_id) REFERENCES news_categorypage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_even_page_id_61642dec_fk_event_eventindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_eventindexrelatedlink
    ADD CONSTRAINT event_even_page_id_61642dec_fk_event_eventindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES event_eventindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_eventindexpag_page_ptr_id_6dbf9bce_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_eventindexpage
    ADD CONSTRAINT event_eventindexpag_page_ptr_id_6dbf9bce_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_eventindexre_link_page_id_708002ba_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_eventindexrelatedlink
    ADD CONSTRAINT event_eventindexre_link_page_id_708002ba_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_eventpag_main_image_id_723d701a_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_eventpage
    ADD CONSTRAINT event_eventpag_main_image_id_723d701a_fk_wagtailimages_image_id FOREIGN KEY (main_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_eventpage_page_ptr_id_6efdf3bd_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_eventpage
    ADD CONSTRAINT event_eventpage_page_ptr_id_6efdf3bd_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_eventpagetag_tag_id_271e971_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_eventpagetag
    ADD CONSTRAINT event_eventpagetag_tag_id_271e971_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboard_user_id_2cd235df_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT filer_clipboard_user_id_2cd235df_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboarditem_clipboard_id_1aea2cdc_fk_filer_clipboard_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_clipboard_id_1aea2cdc_fk_filer_clipboard_id FOREIGN KEY (clipboard_id) REFERENCES filer_clipboard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_clipboarditem_file_id_4a5c0d4f_fk_filer_file_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_file_id_4a5c0d4f_fk_filer_file_id FOREIGN KEY (file_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_f_polymorphic_ctype_id_3485cdc6_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_f_polymorphic_ctype_id_3485cdc6_fk_django_content_type_id FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file_folder_id_71f59785_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_folder_id_71f59785_fk_filer_folder_id FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_file_owner_id_3ea33283_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_owner_id_3ea33283_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folder_owner_id_3a76f3ed_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_owner_id_3a76f3ed_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folder_parent_id_3ce3d341_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_parent_id_3ce3d341_fk_filer_folder_id FOREIGN KEY (parent_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission_folder_id_11df6568_fk_filer_folder_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_folder_id_11df6568_fk_filer_folder_id FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission_group_id_7ebbde2_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_group_id_7ebbde2_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_folderpermission_user_id_785f0ea5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_user_id_785f0ea5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: filer_image_file_ptr_id_2bce39a6_fk_filer_file_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT filer_image_file_ptr_id_2bce39a6_fk_filer_file_id FOREIGN KEY (file_ptr_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_ga_image1_id_54f125343e39081e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gallery_gallery
    ADD CONSTRAINT gallery_ga_image1_id_54f125343e39081e_fk_wagtailimages_image_id FOREIGN KEY (image1_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_ga_image4_id_2e1c591d1b1f6221_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gallery_gallery
    ADD CONSTRAINT gallery_ga_image4_id_2e1c591d1b1f6221_fk_wagtailimages_image_id FOREIGN KEY (image4_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_ga_image5_id_47f581356bd05b2e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gallery_gallery
    ADD CONSTRAINT gallery_ga_image5_id_47f581356bd05b2e_fk_wagtailimages_image_id FOREIGN KEY (image5_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_ga_image6_id_4e889c745ac2adb5_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gallery_gallery
    ADD CONSTRAINT gallery_ga_image6_id_4e889c745ac2adb5_fk_wagtailimages_image_id FOREIGN KEY (image6_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_gal_image2_id_e55755092c1e757_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gallery_gallery
    ADD CONSTRAINT gallery_gal_image2_id_e55755092c1e757_fk_wagtailimages_image_id FOREIGN KEY (image2_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_gal_image3_id_2a19463bca5c3f0_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gallery_gallery
    ADD CONSTRAINT gallery_gal_image3_id_2a19463bca5c3f0_fk_wagtailimages_image_id FOREIGN KEY (image3_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallery_gal_page_ptr_id_4a6e566f3d8cf5d2_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gallery_gallery
    ADD CONSTRAINT gallery_gal_page_ptr_id_4a6e566f3d8cf5d2_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gallerya_gallery_id_5ea18ef6_fk_galleryapp_gallery_gallery_slug; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY galleryapp_image
    ADD CONSTRAINT gallerya_gallery_id_5ea18ef6_fk_galleryapp_gallery_gallery_slug FOREIGN KEY (gallery_id) REFERENCES galleryapp_gallery(gallery_slug) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: galleryapp_gallery_page_ptr_id_72b9df6a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY galleryapp_gallery
    ADD CONSTRAINT galleryapp_gallery_page_ptr_id_72b9df6a_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: galleryapp_image_page_ptr_id_5180ab85_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY galleryapp_image
    ADD CONSTRAINT galleryapp_image_page_ptr_id_5180ab85_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_homepage_page_ptr_id_594c536b_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY home_homepage
    ADD CONSTRAINT home_homepage_page_ptr_id_594c536b_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mamasemedi_page_id_c087c1a_fk_mamasemedia_mediapage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mamasemedia_mediapagerelatedlink
    ADD CONSTRAINT mamasemedi_page_id_c087c1a_fk_mamasemedia_mediapage_page_ptr_id FOREIGN KEY (page_id) REFERENCES mamasemedia_mediapage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mamasemedia_mediapa_image_id_157d1d23_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mamasemedia_mediapagerelatedlink
    ADD CONSTRAINT mamasemedia_mediapa_image_id_157d1d23_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mamasemedia_mediapa_page_ptr_id_217fa67d_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mamasemedia_mediapage
    ADD CONSTRAINT mamasemedia_mediapa_page_ptr_id_217fa67d_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: multichoice_mcques_question_ptr_id_4e7f345e_fk_quiz_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY multichoice_mcquestion
    ADD CONSTRAINT multichoice_mcques_question_ptr_id_4e7f345e_fk_quiz_question_id FOREIGN KEY (question_ptr_id) REFERENCES quiz_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_categorypage_page_ptr_id_4c0200_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_categorypage
    ADD CONSTRAINT news_categorypage_page_ptr_id_4c0200_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_informationpag_page_ptr_id_5dae1315_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_informationpage
    ADD CONSTRAINT news_informationpag_page_ptr_id_5dae1315_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_ne_content_object_id_5e1996e9_fk_news_newspage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_newspagetag
    ADD CONSTRAINT news_ne_content_object_id_5e1996e9_fk_news_newspage_page_ptr_id FOREIGN KEY (content_object_id) REFERENCES news_newspage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_news_category_id_2151b955_fk_news_categorypage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_newspage
    ADD CONSTRAINT news_news_category_id_2151b955_fk_news_categorypage_page_ptr_id FOREIGN KEY (category_id) REFERENCES news_categorypage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_newsind_page_id_361a7846_fk_news_newsindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_newsindexrelatedlink
    ADD CONSTRAINT news_newsind_page_id_361a7846_fk_news_newsindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES news_newsindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_newsindexpage_page_ptr_id_32a358d8_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_newsindexpage
    ADD CONSTRAINT news_newsindexpage_page_ptr_id_32a358d8_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_newsindexrela_link_page_id_484560ec_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_newsindexrelatedlink
    ADD CONSTRAINT news_newsindexrela_link_page_id_484560ec_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_newsp_link_document_id_1758121e_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_newspage
    ADD CONSTRAINT news_newsp_link_document_id_1758121e_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_newspage_main_image_id_3c88314_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_newspage
    ADD CONSTRAINT news_newspage_main_image_id_3c88314_fk_wagtailimages_image_id FOREIGN KEY (main_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_newspage_page_ptr_id_7e4920eb_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_newspage
    ADD CONSTRAINT news_newspage_page_ptr_id_7e4920eb_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_newspagetag_tag_id_544dcc6d_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_newspagetag
    ADD CONSTRAINT news_newspagetag_tag_id_544dcc6d_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_nocom_category_id_ed9c4cb_fk_news_categorypage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_nocommentpage
    ADD CONSTRAINT news_nocom_category_id_ed9c4cb_fk_news_categorypage_page_ptr_id FOREIGN KEY (category_id) REFERENCES news_categorypage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_nocom_link_document_id_4a6862b4_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_nocommentpage
    ADD CONSTRAINT news_nocom_link_document_id_4a6862b4_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_nocommentpage_page_ptr_id_189b74cb_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news_nocommentpage
    ADD CONSTRAINT news_nocommentpage_page_ptr_id_189b74cb_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partners_partne_main_image_id_cb9923e_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partners_partnerpage
    ADD CONSTRAINT partners_partne_main_image_id_cb9923e_fk_wagtailimages_image_id FOREIGN KEY (main_image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partners_partnerind_page_ptr_id_5f2db3a6_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partners_partnerindexpage
    ADD CONSTRAINT partners_partnerind_page_ptr_id_5f2db3a6_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partners_partnerpage_page_ptr_id_39189b5_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partners_partnerpage
    ADD CONSTRAINT partners_partnerpage_page_ptr_id_39189b5_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: question_id_443a8575_fk_multichoice_mcquestion_question_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY multichoice_answer
    ADD CONSTRAINT question_id_443a8575_fk_multichoice_mcquestion_question_ptr_id FOREIGN KEY (question_id) REFERENCES multichoice_mcquestion(question_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_progress_user_id_725757a5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_progress
    ADD CONSTRAINT quiz_progress_user_id_725757a5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_question_category_id_4b98276b_fk_quiz_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_question
    ADD CONSTRAINT quiz_question_category_id_4b98276b_fk_quiz_category_id FOREIGN KEY (category_id) REFERENCES quiz_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_question_quiz_question_id_18395d8e_fk_quiz_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_question_quiz
    ADD CONSTRAINT quiz_question_quiz_question_id_18395d8e_fk_quiz_question_id FOREIGN KEY (question_id) REFERENCES quiz_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_question_quiz_quiz_id_60b47589_fk_quiz_quiz_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_question_quiz
    ADD CONSTRAINT quiz_question_quiz_quiz_id_60b47589_fk_quiz_quiz_id FOREIGN KEY (quiz_id) REFERENCES quiz_quiz(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_question_sub_category_id_671a944_fk_quiz_subcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_question
    ADD CONSTRAINT quiz_question_sub_category_id_671a944_fk_quiz_subcategory_id FOREIGN KEY (sub_category_id) REFERENCES quiz_subcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_quiz_category_id_61d84a7a_fk_quiz_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_quiz
    ADD CONSTRAINT quiz_quiz_category_id_61d84a7a_fk_quiz_category_id FOREIGN KEY (category_id) REFERENCES quiz_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_sitting_quiz_id_6b3ba4ef_fk_quiz_quiz_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_sitting
    ADD CONSTRAINT quiz_sitting_quiz_id_6b3ba4ef_fk_quiz_quiz_id FOREIGN KEY (quiz_id) REFERENCES quiz_quiz(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_sitting_user_id_78227bed_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_sitting
    ADD CONSTRAINT quiz_sitting_user_id_78227bed_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: quiz_subcategory_category_id_63e7b2fe_fk_quiz_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_subcategory
    ADD CONSTRAINT quiz_subcategory_category_id_63e7b2fe_fk_quiz_category_id FOREIGN KEY (category_id) REFERENCES quiz_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_tagged_content_type_id_5c3ec8f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_tagged_content_type_id_5c3ec8f_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_d95e0d2_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_d95e0d2_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: testapp_tpage_page_ptr_id_8805b40_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY testapp_tpage
    ADD CONSTRAINT testapp_tpage_page_ptr_id_8805b40_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: thingspe_channelField_id_505b1b3e_fk_thingspeak_channelfield_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY thingspeak_feedfield
    ADD CONSTRAINT "thingspe_channelField_id_505b1b3e_fk_thingspeak_channelfield_id" FOREIGN KEY ("channelField_id") REFERENCES thingspeak_channelfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: thingspeak_channel_channel_id_337f9205_fk_thingspeak_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY thingspeak_channelfield
    ADD CONSTRAINT thingspeak_channel_channel_id_337f9205_fk_thingspeak_channel_id FOREIGN KEY (channel_id) REFERENCES thingspeak_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: thingspeak_feed_channel_id_6a2255da_fk_thingspeak_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY thingspeak_feed
    ADD CONSTRAINT thingspeak_feed_channel_id_6a2255da_fk_thingspeak_channel_id FOREIGN KEY (channel_id) REFERENCES thingspeak_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: thingspeak_feedfield_feed_id_32bffbb5_fk_thingspeak_feed_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY thingspeak_feedfield
    ADD CONSTRAINT thingspeak_feedfield_feed_id_32bffbb5_fk_thingspeak_feed_id FOREIGN KEY (feed_id) REFERENCES thingspeak_feed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: true_false_tf_ques_question_ptr_id_7ee2475d_fk_quiz_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY true_false_tf_question
    ADD CONSTRAINT true_false_tf_ques_question_ptr_id_7ee2475d_fk_quiz_question_id FOREIGN KEY (question_ptr_id) REFERENCES quiz_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: utils_channelfield_channel_id_19fe2053_fk_utils_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utils_channelfield
    ADD CONSTRAINT utils_channelfield_channel_id_19fe2053_fk_utils_channel_id FOREIGN KEY (channel_id) REFERENCES utils_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: utils_feed_channel_id_19627970_fk_utils_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utils_feed
    ADD CONSTRAINT utils_feed_channel_id_19627970_fk_utils_channel_id FOREIGN KEY (channel_id) REFERENCES utils_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: utils_feedfie_channelField_id_614a445c_fk_utils_channelfield_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utils_feedfield
    ADD CONSTRAINT "utils_feedfie_channelField_id_614a445c_fk_utils_channelfield_id" FOREIGN KEY ("channelField_id") REFERENCES utils_channelfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: utils_feedfield_feed_id_26a18023_fk_utils_feed_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utils_feedfield
    ADD CONSTRAINT utils_feedfield_feed_id_26a18023_fk_utils_feed_id FOREIGN KEY (feed_id) REFERENCES utils_feed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vi_page_id_1a481dbe_fk_video_embeddedvideoindexpage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY video_embeddedvideoindexrelatedlink
    ADD CONSTRAINT vi_page_id_1a481dbe_fk_video_embeddedvideoindexpage_page_ptr_id FOREIGN KEY (page_id) REFERENCES video_embeddedvideoindexpage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: video_emb_category_id_6f2bf7a7_fk_news_categorypage_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY video_embeddedvideopage
    ADD CONSTRAINT video_emb_category_id_6f2bf7a7_fk_news_categorypage_page_ptr_id FOREIGN KEY (category_id) REFERENCES news_categorypage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: video_embeddedvide_link_page_id_1f58f444_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY video_embeddedvideoindexrelatedlink
    ADD CONSTRAINT video_embeddedvide_link_page_id_1f58f444_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: video_embeddedvideoi_page_ptr_id_2df0e24_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY video_embeddedvideoindexpage
    ADD CONSTRAINT video_embeddedvideoi_page_ptr_id_2df0e24_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: video_embeddedvideop_page_ptr_id_1b2c411_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY video_embeddedvideopage
    ADD CONSTRAINT video_embeddedvideop_page_ptr_id_1b2c411_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: video_embeddedvideopagetag_tag_id_e6ad82f_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY video_embeddedvideopagetag
    ADD CONSTRAINT video_embeddedvideopagetag_tag_id_e6ad82f_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: visua_channelField_id_1d25e669_fk_visualization_channelfield_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visualization_feedfield
    ADD CONSTRAINT "visua_channelField_id_1d25e669_fk_visualization_channelfield_id" FOREIGN KEY ("channelField_id") REFERENCES visualization_channelfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: visualization_c_channel_id_1c42d4c6_fk_visualization_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visualization_channelfield
    ADD CONSTRAINT visualization_c_channel_id_1c42d4c6_fk_visualization_channel_id FOREIGN KEY (channel_id) REFERENCES visualization_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: visualization_f_channel_id_639ba0fb_fk_visualization_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visualization_feed
    ADD CONSTRAINT visualization_f_channel_id_639ba0fb_fk_visualization_channel_id FOREIGN KEY (channel_id) REFERENCES visualization_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: visualization_feedfie_feed_id_1cebad18_fk_visualization_feed_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visualization_feedfield
    ADD CONSTRAINT visualization_feedfie_feed_id_1cebad18_fk_visualization_feed_id FOREIGN KEY (feed_id) REFERENCES visualization_feed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore__content_type_id_534ebab2_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore__content_type_id_534ebab2_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppageper_page_id_579bb7c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppageper_page_id_579bb7c_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppagepermiss_group_id_46d04d93_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermiss_group_id_46d04d93_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_owner_id_767b30bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_767b30bc_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevisio_page_id_3676feba_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevisio_page_id_3676feba_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision_user_id_1a218402_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_1a218402_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageviewres_page_id_69258013_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewres_page_id_69258013_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site_root_page_id_1fc080d7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_1fc080d7_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_docume_uploaded_by_user_id_69f4ec20_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_docume_uploaded_by_user_id_69f4ec20_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsubmis_page_id_469192df_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmis_page_id_469192df_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_imag_uploaded_by_user_id_181967a6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_imag_uploaded_by_user_id_181967a6_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rend_filter_id_4fa1f7f_fk_wagtailimages_filter_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rend_filter_id_4fa1f7f_fk_wagtailimages_filter_id FOREIGN KEY (filter_id) REFERENCES wagtailimages_filter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rendi_image_id_4ebd24db_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendi_image_id_4ebd24db_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirec_redirect_page_id_195b3223_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirec_redirect_page_id_195b3223_fk_wagtailcore_page_id FOREIGN KEY (redirect_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_redire_site_id_40306d19_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redire_site_id_40306d19_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editor_query_id_c9e69bd_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editor_query_id_c9e69bd_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editorspi_page_id_50c44c9b_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspi_page_id_50c44c9b_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_query_query_id_4ca8351a_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_query_query_id_4ca8351a_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile_user_id_6672458f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_6672458f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

