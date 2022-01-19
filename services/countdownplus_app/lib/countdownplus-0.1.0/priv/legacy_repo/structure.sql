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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: access_mode; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.access_mode AS ENUM (
    'private',
    'public',
    'groups',
    'followers',
    'friends',
    'following'
);


--
-- Name: activity_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.activity_type AS ENUM (
    'accept',
    'add',
    'announce',
    'arrive',
    'block',
    'create',
    'delete',
    'dislike',
    'flag',
    'follow',
    'ignore',
    'invite',
    'join',
    'leave',
    'like',
    'listen',
    'move',
    'offer',
    'question',
    'reject',
    'read',
    'remove',
    'tentative_reject',
    'tentative_accept',
    'travel',
    'undo',
    'update',
    'view'
);


--
-- Name: count_unit; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.count_unit AS ENUM (
    'years',
    'months',
    'weeks',
    'days',
    'hours',
    'minutes',
    'seconds',
    'auto',
    'weekdays',
    'weekends',
    'custom'
);


--
-- Name: device_platform; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.device_platform AS ENUM (
    'android',
    'ios'
);


--
-- Name: dob_visibility; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.dob_visibility AS ENUM (
    'restrict_dob',
    'birthday_visible',
    'age_visible'
);


--
-- Name: event_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.event_type AS ENUM (
    'event',
    'anniversary',
    'baby',
    'birthday',
    'concert',
    'exact_age',
    'milestone',
    'movie',
    'school',
    'sports',
    'trip',
    'wedding'
);


--
-- Name: gender; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.gender AS ENUM (
    'unknown',
    'male',
    'female'
);


--
-- Name: group_membership_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.group_membership_type AS ENUM (
    'owner',
    'admin',
    'member'
);


--
-- Name: notification_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.notification_type AS ENUM (
    'message',
    'data'
);


--
-- Name: oauth_app_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.oauth_app_status AS ENUM (
    'basic',
    'privileged'
);


--
-- Name: provider; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.provider AS ENUM (
    'countdownplus',
    'facebook',
    'instagram',
    'google',
    'twitter'
);


--
-- Name: reminder_unit; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.reminder_unit AS ENUM (
    'auto',
    'none',
    'years',
    'months',
    'weeks',
    'days',
    'hours',
    'minutes'
);


--
-- Name: repeat_unit; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.repeat_unit AS ENUM (
    'no_repeat',
    'daily',
    'weekly',
    'monthly',
    'yearly'
);


--
-- Name: user_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_role AS ENUM (
    'subscriber',
    'editor',
    'admin'
);


--
-- Name: articles_tsvector_update_trigger(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.articles_tsvector_update_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            begin
              new.tsv :=
                 to_tsvector('pg_catalog.english', coalesce(new.title_translations->>'en','')) ||
to_tsvector('pg_catalog.french', coalesce(new.title_translations->>'fr','')) ||
to_tsvector('pg_catalog.german', coalesce(new.title_translations->>'de','')) ||
to_tsvector('pg_catalog.spanish', coalesce(new.title_translations->>'es','')) ||
to_tsvector('pg_catalog.english', coalesce(new.content_translations->>'en','')) ||
to_tsvector('pg_catalog.french', coalesce(new.content_translations->>'fr','')) ||
to_tsvector('pg_catalog.german', coalesce(new.content_translations->>'de','')) ||
to_tsvector('pg_catalog.spanish', coalesce(new.content_translations->>'es',''));
              return new;
            end
            $$;


--
-- Name: holidays_tsvector_update_trigger(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.holidays_tsvector_update_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            begin
              new.tsv :=
                 to_tsvector('pg_catalog.english', coalesce(new.name_translations->>'en','')) ||
to_tsvector('pg_catalog.french', coalesce(new.name_translations->>'fr','')) ||
to_tsvector('pg_catalog.german', coalesce(new.name_translations->>'de','')) ||
to_tsvector('pg_catalog.dutch', coalesce(new.name_translations->>'nl','')) ||
to_tsvector('pg_catalog.portuguese', coalesce(new.name_translations->>'pt',''));
              return new;
            end
            $$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activities (
    id bigint NOT NULL,
    actor_id uuid NOT NULL,
    object_type character varying,
    object_id uuid,
    target_type character varying,
    target_id uuid,
    activity_type public.activity_type NOT NULL,
    entries_count integer DEFAULT 0 NOT NULL,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- Name: activity_entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activity_entries (
    id bigint NOT NULL,
    user_id uuid NOT NULL,
    activity_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: activity_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.activity_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.activity_entries_id_seq OWNED BY public.activity_entries.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: article_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.article_categories (
    id bigint NOT NULL,
    name_translations jsonb NOT NULL,
    path public.ltree NOT NULL,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: article_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.article_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: article_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.article_categories_id_seq OWNED BY public.article_categories.id;


--
-- Name: article_oembeds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.article_oembeds (
    id bigint NOT NULL,
    url text,
    oembed_type character varying,
    html text,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    expires_at timestamp without time zone
);


--
-- Name: article_oembeds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.article_oembeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: article_oembeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.article_oembeds_id_seq OWNED BY public.article_oembeds.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.articles (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    author_id uuid NOT NULL,
    category_id bigint NOT NULL,
    title_translations jsonb NOT NULL,
    slug text,
    content_translations jsonb,
    tags text[] DEFAULT '{}'::text[],
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    published_at timestamp without time zone,
    featured_until timestamp without time zone,
    tsv tsvector
);


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attachments (
    id bigint NOT NULL,
    attachable_type character varying,
    attachable_id uuid,
    type character varying,
    title_translations jsonb NOT NULL,
    slug text,
    content_data text,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: civil_dates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.civil_dates (
    id bigint NOT NULL,
    holiday_id uuid NOT NULL,
    actual_id bigint,
    date timestamp without time zone NOT NULL
);


--
-- Name: civil_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.civil_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: civil_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.civil_dates_id_seq OWNED BY public.civil_dates.id;


--
-- Name: countdowns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countdowns (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    mongo_id text,
    sync_id text,
    user_id uuid NOT NULL,
    countdownable_type character varying NOT NULL,
    countdownable_id uuid NOT NULL,
    count_units public.count_unit[],
    reminder_unit public.reminder_unit DEFAULT 'auto'::public.reminder_unit NOT NULL,
    reminder_value integer,
    image_data text,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    user_updated_at timestamp without time zone
);


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id character varying NOT NULL,
    name_translations jsonb NOT NULL,
    slug text,
    iso_a3 character varying(3),
    formal_name_translations jsonb,
    locations_count integer DEFAULT 0 NOT NULL,
    users_count integer DEFAULT 0 NOT NULL,
    holidays_count integer DEFAULT 0 NOT NULL,
    geometry public.geography(Geometry,4326),
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: devices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devices (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    platform public.device_platform NOT NULL,
    device_id text NOT NULL,
    advertising_ids text[],
    push_id text,
    fcm_id text,
    app_version integer NOT NULL,
    last_seen_ip inet,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    last_seen_at timestamp without time zone,
    deleted_at timestamp without time zone
);


--
-- Name: event_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_groups (
    id bigint NOT NULL,
    event_id uuid NOT NULL,
    group_id uuid NOT NULL,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: event_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_groups_id_seq OWNED BY public.event_groups.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    mongo_id text,
    short_id text NOT NULL,
    sync_id text,
    owner_id uuid NOT NULL,
    event_type public.event_type DEFAULT 'event'::public.event_type NOT NULL,
    title text NOT NULL,
    slug text,
    starts_at timestamp without time zone NOT NULL,
    ends_at timestamp without time zone,
    ignore_time boolean DEFAULT false NOT NULL,
    repeat_unit public.repeat_unit DEFAULT 'no_repeat'::public.repeat_unit NOT NULL,
    repeat_value integer,
    access_mode public.access_mode DEFAULT 'private'::public.access_mode NOT NULL,
    source text,
    source_id text,
    notes text,
    score integer DEFAULT 0 NOT NULL,
    external_image_link text,
    image_data text,
    counters_count integer DEFAULT 0 NOT NULL,
    groups_count integer DEFAULT 0 NOT NULL,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    user_updated_at timestamp without time zone,
    published_at timestamp without time zone,
    tsv tsvector,
    tracked_user_id uuid
);


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    id bigint NOT NULL,
    follower_id uuid NOT NULL,
    followed_id uuid NOT NULL,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: group_memberships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_memberships (
    id bigint NOT NULL,
    user_id uuid NOT NULL,
    group_id uuid NOT NULL,
    membership_type public.group_membership_type DEFAULT 'member'::public.group_membership_type NOT NULL,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: group_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.group_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: group_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.group_memberships_id_seq OWNED BY public.group_memberships.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    owner_id uuid NOT NULL,
    name character varying NOT NULL,
    image_data text,
    members_count integer DEFAULT 0 NOT NULL,
    events_count integer DEFAULT 0 NOT NULL,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: holidays; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.holidays (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    mongo_id text,
    short_id text NOT NULL,
    canonical_id text,
    country_id character varying NOT NULL,
    years int4range NOT NULL,
    name_translations jsonb NOT NULL,
    slug text,
    tags text[],
    subregions text[],
    score integer DEFAULT 0 NOT NULL,
    external_image_link text,
    image_data text,
    counters_count integer DEFAULT 0 NOT NULL,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    tsv tsvector
);


--
-- Name: ios_receipts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ios_receipts (
    id bigint NOT NULL,
    user_id uuid NOT NULL,
    data text NOT NULL,
    extended jsonb,
    uploaded_at timestamp without time zone NOT NULL,
    verified_at timestamp without time zone
);


--
-- Name: ios_receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ios_receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ios_receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ios_receipts_id_seq OWNED BY public.ios_receipts.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    country_id character varying,
    locatable_type character varying NOT NULL,
    locatable_id uuid NOT NULL,
    name text,
    address text,
    city text,
    state text,
    state_code text,
    postal_code text,
    country_name text,
    formatted_entry text,
    geometry public.geography(Point,4326),
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: meta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meta (
    id character varying NOT NULL,
    value jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    activity_id bigint,
    notification_type public.notification_type NOT NULL,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    notify_at timestamp without time zone NOT NULL,
    attempted_at timestamp without time zone,
    notified_at timestamp without time zone
);


--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_grants (
    id bigint NOT NULL,
    resource_owner_id uuid NOT NULL,
    application_id bigint NOT NULL,
    token text NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes text
);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_tokens (
    id bigint NOT NULL,
    resource_owner_id uuid,
    application_id bigint NOT NULL,
    device_id uuid,
    is_visitor boolean DEFAULT false NOT NULL,
    token text NOT NULL,
    refresh_token text,
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes text,
    previous_refresh_token text DEFAULT ''::text NOT NULL
);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_applications (
    id bigint NOT NULL,
    name text NOT NULL,
    uid text NOT NULL,
    secret text NOT NULL,
    redirect_uri text NOT NULL,
    scopes text DEFAULT ''::text NOT NULL,
    status public.oauth_app_status DEFAULT 'basic'::public.oauth_app_status NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    confidential boolean DEFAULT true NOT NULL
);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;


--
-- Name: pghero_query_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pghero_query_stats (
    id bigint NOT NULL,
    database text,
    "user" text,
    query text,
    query_hash bigint,
    total_time double precision,
    calls bigint,
    captured_at timestamp without time zone
);


--
-- Name: pghero_query_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pghero_query_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pghero_query_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pghero_query_stats_id_seq OWNED BY public.pghero_query_stats.id;


--
-- Name: pghero_space_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pghero_space_stats (
    id bigint NOT NULL,
    database text,
    schema text,
    relation text,
    size bigint,
    captured_at timestamp without time zone
);


--
-- Name: pghero_space_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pghero_space_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pghero_space_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pghero_space_stats_id_seq OWNED BY public.pghero_space_stats.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id character varying NOT NULL,
    title_translations jsonb NOT NULL,
    description_translations jsonb,
    asset text,
    details jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiles (
    id bigint NOT NULL,
    mongo_id text,
    provider public.provider NOT NULL,
    provider_id text NOT NULL,
    user_id uuid,
    first_name text,
    last_name text,
    name text,
    username public.citext,
    gender public.gender DEFAULT 'unknown'::public.gender NOT NULL,
    external_image_link text,
    date_of_birth timestamp without time zone,
    email text,
    token text,
    refresh_token text,
    secret text,
    token_expires_at timestamp without time zone,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchases (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    product_id character varying NOT NULL,
    transaction_id text NOT NULL,
    platform public.device_platform NOT NULL,
    purchased_at timestamp without time zone,
    extended jsonb,
    uploaded_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    verified_at timestamp without time zone,
    ios_receipt_id bigint
);


--
-- Name: reserved_usernames; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reserved_usernames (
    id public.citext NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: subregions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subregions (
    id character varying NOT NULL,
    country_id character varying NOT NULL,
    name_translations jsonb NOT NULL,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    mongo_id text,
    country_id character varying,
    first_name text,
    last_name text,
    name text,
    username public.citext,
    gender public.gender DEFAULT 'unknown'::public.gender NOT NULL,
    date_of_birth timestamp without time zone,
    role public.user_role DEFAULT 'subscriber'::public.user_role NOT NULL,
    email public.citext NOT NULL,
    encrypted_password text NOT NULL,
    reset_password_token text,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    registration public.provider DEFAULT 'countdownplus'::public.provider NOT NULL,
    anonymous boolean DEFAULT false,
    valid_email boolean DEFAULT true,
    dob_visibility public.dob_visibility DEFAULT 'birthday_visible'::public.dob_visibility NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    external_image_link text,
    image_data text,
    cover_data text,
    counters_count integer DEFAULT 0 NOT NULL,
    countdowns_count integer DEFAULT 0 NOT NULL,
    events_count integer DEFAULT 0 NOT NULL,
    followers_count integer DEFAULT 0 NOT NULL,
    following_count integer DEFAULT 0 NOT NULL,
    groups_count integer DEFAULT 0 NOT NULL,
    profiles_count integer DEFAULT 0 NOT NULL,
    settings jsonb,
    extended jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    user_updated_at timestamp without time zone,
    last_seen_at timestamp without time zone,
    tsv tsvector,
    activities_count integer DEFAULT 0 NOT NULL,
    public_events_count integer DEFAULT 0 NOT NULL
);


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- Name: activity_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_entries ALTER COLUMN id SET DEFAULT nextval('public.activity_entries_id_seq'::regclass);


--
-- Name: article_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_categories ALTER COLUMN id SET DEFAULT nextval('public.article_categories_id_seq'::regclass);


--
-- Name: article_oembeds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_oembeds ALTER COLUMN id SET DEFAULT nextval('public.article_oembeds_id_seq'::regclass);


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: civil_dates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.civil_dates ALTER COLUMN id SET DEFAULT nextval('public.civil_dates_id_seq'::regclass);


--
-- Name: event_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_groups ALTER COLUMN id SET DEFAULT nextval('public.event_groups_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: group_memberships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_memberships ALTER COLUMN id SET DEFAULT nextval('public.group_memberships_id_seq'::regclass);


--
-- Name: ios_receipts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ios_receipts ALTER COLUMN id SET DEFAULT nextval('public.ios_receipts_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- Name: pghero_query_stats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pghero_query_stats ALTER COLUMN id SET DEFAULT nextval('public.pghero_query_stats_id_seq'::regclass);


--
-- Name: pghero_space_stats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pghero_space_stats ALTER COLUMN id SET DEFAULT nextval('public.pghero_space_stats_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: activity_entries activity_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_entries
    ADD CONSTRAINT activity_entries_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: article_categories article_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_categories
    ADD CONSTRAINT article_categories_pkey PRIMARY KEY (id);


--
-- Name: article_oembeds article_oembeds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_oembeds
    ADD CONSTRAINT article_oembeds_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: civil_dates civil_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.civil_dates
    ADD CONSTRAINT civil_dates_pkey PRIMARY KEY (id);


--
-- Name: countdowns countdowns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countdowns
    ADD CONSTRAINT countdowns_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: event_groups event_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_groups
    ADD CONSTRAINT event_groups_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: group_memberships group_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_memberships
    ADD CONSTRAINT group_memberships_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: holidays holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_pkey PRIMARY KEY (id);


--
-- Name: ios_receipts ios_receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ios_receipts
    ADD CONSTRAINT ios_receipts_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: meta meta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta
    ADD CONSTRAINT meta_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: pghero_query_stats pghero_query_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pghero_query_stats
    ADD CONSTRAINT pghero_query_stats_pkey PRIMARY KEY (id);


--
-- Name: pghero_space_stats pghero_space_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pghero_space_stats
    ADD CONSTRAINT pghero_space_stats_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: reserved_usernames reserved_usernames_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reserved_usernames
    ADD CONSTRAINT reserved_usernames_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: subregions subregions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subregions
    ADD CONSTRAINT subregions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: fk__activities_actor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__activities_actor_id ON public.activities USING btree (actor_id);


--
-- Name: fk__activities_object_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__activities_object_id ON public.activities USING btree (object_type, object_id);


--
-- Name: fk__activities_target_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__activities_target_id ON public.activities USING btree (target_type, target_id);


--
-- Name: fk__activity_entries_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__activity_entries_activity_id ON public.activity_entries USING btree (activity_id);


--
-- Name: fk__articles_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__articles_author_id ON public.articles USING btree (author_id);


--
-- Name: fk__articles_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__articles_category_id ON public.articles USING btree (category_id);


--
-- Name: fk__attachments_attachable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__attachments_attachable_id ON public.attachments USING btree (attachable_type, attachable_id);


--
-- Name: fk__civil_dates_actual_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX fk__civil_dates_actual_id ON public.civil_dates USING btree (actual_id);


--
-- Name: fk__civil_dates_holiday_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__civil_dates_holiday_id ON public.civil_dates USING btree (holiday_id);


--
-- Name: fk__countdowns_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__countdowns_user_id ON public.countdowns USING btree (user_id);


--
-- Name: fk__devices_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__devices_user_id ON public.devices USING btree (user_id);


--
-- Name: fk__event_groups_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__event_groups_event_id ON public.event_groups USING btree (event_id);


--
-- Name: fk__events_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__events_owner_id ON public.events USING btree (owner_id);


--
-- Name: fk__follows_followed_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__follows_followed_id ON public.follows USING btree (followed_id);


--
-- Name: fk__group_memberships_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__group_memberships_user_id ON public.group_memberships USING btree (user_id);


--
-- Name: fk__groups_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__groups_owner_id ON public.groups USING btree (owner_id);


--
-- Name: fk__holidays_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__holidays_country_id ON public.holidays USING btree (country_id);


--
-- Name: fk__ios_receipts_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__ios_receipts_user_id ON public.ios_receipts USING btree (user_id);


--
-- Name: fk__locations_locatable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__locations_locatable_id ON public.locations USING btree (locatable_type, locatable_id);


--
-- Name: fk__notifications_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__notifications_activity_id ON public.notifications USING btree (activity_id);


--
-- Name: fk__oauth_access_grants_resource_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__oauth_access_grants_resource_owner_id ON public.oauth_access_grants USING btree (resource_owner_id);


--
-- Name: fk__oauth_access_tokens_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__oauth_access_tokens_application_id ON public.oauth_access_tokens USING btree (application_id);


--
-- Name: fk__oauth_access_tokens_device_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__oauth_access_tokens_device_id ON public.oauth_access_tokens USING btree (device_id);


--
-- Name: fk__oauth_access_tokens_resource_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__oauth_access_tokens_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: fk__profiles_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__profiles_user_id ON public.profiles USING btree (user_id);


--
-- Name: fk__purchases_ios_receipt_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__purchases_ios_receipt_id ON public.purchases USING btree (ios_receipt_id);


--
-- Name: fk__purchases_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__purchases_product_id ON public.purchases USING btree (product_id);


--
-- Name: fk__purchases_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__purchases_user_id ON public.purchases USING btree (user_id);


--
-- Name: fk__subregions_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fk__subregions_country_id ON public.subregions USING btree (country_id);


--
-- Name: index_activity_entries_on_user_id_and_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_activity_entries_on_user_id_and_activity_id ON public.activity_entries USING btree (user_id, activity_id);


--
-- Name: index_article_categories_on_path; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_categories_on_path ON public.article_categories USING gist (path);


--
-- Name: index_article_oembeds_on_url_and_oembed_type; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_article_oembeds_on_url_and_oembed_type ON public.article_oembeds USING btree (url, oembed_type);


--
-- Name: index_articles_on_published_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_articles_on_published_at ON public.articles USING btree (published_at);


--
-- Name: index_articles_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_articles_on_slug ON public.articles USING btree (slug);


--
-- Name: index_articles_on_tags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_articles_on_tags ON public.articles USING gin (tags);


--
-- Name: index_articles_on_tsv; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_articles_on_tsv ON public.articles USING gin (tsv);


--
-- Name: index_attachments_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_attachments_on_slug ON public.attachments USING btree (slug);


--
-- Name: index_civil_dates_on_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_civil_dates_on_date ON public.civil_dates USING btree (date);


--
-- Name: index_countdowns_on_countdownable_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_countdowns_on_countdownable_and_user_id ON public.countdowns USING btree (countdownable_type, countdownable_id, user_id);


--
-- Name: index_countdowns_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_countdowns_on_deleted_at ON public.countdowns USING btree (deleted_at);


--
-- Name: index_countdowns_on_mongo_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_countdowns_on_mongo_id ON public.countdowns USING btree (mongo_id);


--
-- Name: index_countdowns_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_countdowns_on_updated_at ON public.countdowns USING btree (updated_at);


--
-- Name: index_countries_on_holidays_count; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_countries_on_holidays_count ON public.countries USING btree (holidays_count);


--
-- Name: index_countries_on_name_translations_en; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_countries_on_name_translations_en ON public.countries USING btree (((name_translations ->> 'en'::text)));


--
-- Name: index_countries_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_countries_on_slug ON public.countries USING btree (slug);


--
-- Name: index_countries_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_countries_on_updated_at ON public.countries USING btree (updated_at);


--
-- Name: index_devices_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_devices_on_deleted_at ON public.devices USING btree (deleted_at);


--
-- Name: index_devices_on_device_id_and_platform; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_devices_on_device_id_and_platform ON public.devices USING btree (device_id, platform);


--
-- Name: index_devices_on_fcm_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_devices_on_fcm_id ON public.devices USING btree (fcm_id);


--
-- Name: index_devices_on_push_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_devices_on_push_id ON public.devices USING btree (push_id);


--
-- Name: index_event_groups_on_group_id_and_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_event_groups_on_group_id_and_event_id ON public.event_groups USING btree (group_id, event_id);


--
-- Name: index_events_on_access_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_access_mode ON public.events USING btree (access_mode);


--
-- Name: index_events_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_deleted_at ON public.events USING btree (deleted_at);


--
-- Name: index_events_on_event_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_event_type ON public.events USING btree (event_type);


--
-- Name: index_events_on_mongo_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_events_on_mongo_id ON public.events USING btree (mongo_id);


--
-- Name: index_events_on_short_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_events_on_short_id ON public.events USING btree (short_id);


--
-- Name: index_events_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_events_on_slug ON public.events USING btree (slug);


--
-- Name: index_events_on_starts_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_starts_at ON public.events USING btree (starts_at);


--
-- Name: index_events_on_sync_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_sync_id ON public.events USING btree (sync_id);


--
-- Name: index_events_on_tracked_user_id_and_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_events_on_tracked_user_id_and_owner_id ON public.events USING btree (tracked_user_id, event_type, owner_id);


--
-- Name: index_events_on_tsv; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_tsv ON public.events USING gin (tsv);


--
-- Name: index_events_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_updated_at ON public.events USING btree (updated_at);


--
-- Name: index_follows_on_follower_id_and_followed_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_follows_on_follower_id_and_followed_id ON public.follows USING btree (follower_id, followed_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_group_memberships_on_group_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_group_memberships_on_group_id_and_user_id ON public.group_memberships USING btree (group_id, user_id);


--
-- Name: index_holidays_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_holidays_on_deleted_at ON public.holidays USING btree (deleted_at);


--
-- Name: index_holidays_on_mongo_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_holidays_on_mongo_id ON public.holidays USING btree (mongo_id);


--
-- Name: index_holidays_on_short_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_holidays_on_short_id ON public.holidays USING btree (short_id);


--
-- Name: index_holidays_on_slug_and_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_holidays_on_slug_and_country_id ON public.holidays USING btree (slug, country_id);


--
-- Name: index_ios_receipts_on_uploaded_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ios_receipts_on_uploaded_at ON public.ios_receipts USING btree (uploaded_at);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);


--
-- Name: index_pghero_query_stats_on_database_and_captured_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pghero_query_stats_on_database_and_captured_at ON public.pghero_query_stats USING btree (database, captured_at);


--
-- Name: index_pghero_space_stats_on_database_and_captured_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pghero_space_stats_on_database_and_captured_at ON public.pghero_space_stats USING btree (database, captured_at);


--
-- Name: index_profiles_on_mongo_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_profiles_on_mongo_id ON public.profiles USING btree (mongo_id);


--
-- Name: index_profiles_on_provider_and_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_profiles_on_provider_and_provider_id ON public.profiles USING btree (provider, provider_id);


--
-- Name: index_profiles_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiles_on_token ON public.profiles USING btree (token);


--
-- Name: index_purchases_on_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_deleted_at ON public.purchases USING btree (deleted_at);


--
-- Name: index_purchases_on_platform; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_purchases_on_platform ON public.purchases USING btree (platform);


--
-- Name: index_purchases_on_transaction_id_and_platform_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_purchases_on_transaction_id_and_platform_and_user_id ON public.purchases USING btree (transaction_id, platform, user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_last_seen_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_last_seen_at ON public.users USING btree (last_seen_at);


--
-- Name: index_users_on_mongo_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_mongo_id ON public.users USING btree (mongo_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_score; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_score ON public.users USING btree (score);


--
-- Name: index_users_on_tsv; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_tsv ON public.users USING gin (tsv);


--
-- Name: index_users_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_updated_at ON public.users USING btree (updated_at);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_username ON public.users USING btree (username);


--
-- Name: articles insert_tsvector_on_articles; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER insert_tsvector_on_articles BEFORE INSERT ON public.articles FOR EACH ROW EXECUTE FUNCTION public.articles_tsvector_update_trigger();


--
-- Name: events insert_tsvector_on_events; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER insert_tsvector_on_events BEFORE INSERT ON public.events FOR EACH ROW EXECUTE FUNCTION tsvector_update_trigger('tsv', 'pg_catalog.english', 'title');


--
-- Name: holidays insert_tsvector_on_holidays; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER insert_tsvector_on_holidays BEFORE INSERT ON public.holidays FOR EACH ROW EXECUTE FUNCTION public.holidays_tsvector_update_trigger();


--
-- Name: users insert_tsvector_on_users; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER insert_tsvector_on_users BEFORE INSERT ON public.users FOR EACH ROW WHEN ((new.anonymous = false)) EXECUTE FUNCTION tsvector_update_trigger('tsv', 'pg_catalog.english', 'first_name', 'last_name', 'username', 'email');


--
-- Name: articles update_tsvector_on_articles; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_tsvector_on_articles BEFORE UPDATE OF title_translations, content_translations ON public.articles FOR EACH ROW EXECUTE FUNCTION public.articles_tsvector_update_trigger();


--
-- Name: events update_tsvector_on_events; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_tsvector_on_events BEFORE UPDATE OF title ON public.events FOR EACH ROW EXECUTE FUNCTION tsvector_update_trigger('tsv', 'pg_catalog.english', 'title');


--
-- Name: holidays update_tsvector_on_holidays; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_tsvector_on_holidays BEFORE UPDATE OF name_translations ON public.holidays FOR EACH ROW EXECUTE FUNCTION public.holidays_tsvector_update_trigger();


--
-- Name: users update_tsvector_on_users; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_tsvector_on_users BEFORE UPDATE OF first_name, last_name, username, email ON public.users FOR EACH ROW WHEN ((new.anonymous = false)) EXECUTE FUNCTION tsvector_update_trigger('tsv', 'pg_catalog.english', 'first_name', 'last_name', 'username', 'email');


--
-- Name: activities fk_activities_actor_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT fk_activities_actor_id FOREIGN KEY (actor_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: activity_entries fk_activity_entries_activity_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_entries
    ADD CONSTRAINT fk_activity_entries_activity_id FOREIGN KEY (activity_id) REFERENCES public.activities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: activity_entries fk_activity_entries_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_entries
    ADD CONSTRAINT fk_activity_entries_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: articles fk_articles_author_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT fk_articles_author_id FOREIGN KEY (author_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: articles fk_articles_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT fk_articles_category_id FOREIGN KEY (category_id) REFERENCES public.article_categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: civil_dates fk_civil_dates_actual_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.civil_dates
    ADD CONSTRAINT fk_civil_dates_actual_id FOREIGN KEY (actual_id) REFERENCES public.civil_dates(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: civil_dates fk_civil_dates_holiday_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.civil_dates
    ADD CONSTRAINT fk_civil_dates_holiday_id FOREIGN KEY (holiday_id) REFERENCES public.holidays(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: countdowns fk_countdowns_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countdowns
    ADD CONSTRAINT fk_countdowns_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: devices fk_devices_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT fk_devices_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_groups fk_event_groups_event_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_groups
    ADD CONSTRAINT fk_event_groups_event_id FOREIGN KEY (event_id) REFERENCES public.events(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_groups fk_event_groups_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_groups
    ADD CONSTRAINT fk_event_groups_group_id FOREIGN KEY (group_id) REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: events fk_events_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_events_owner_id FOREIGN KEY (owner_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: events fk_events_tracked_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_events_tracked_user_id FOREIGN KEY (tracked_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: follows fk_follows_followed_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fk_follows_followed_id FOREIGN KEY (followed_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: follows fk_follows_follower_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fk_follows_follower_id FOREIGN KEY (follower_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: group_memberships fk_group_memberships_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_memberships
    ADD CONSTRAINT fk_group_memberships_group_id FOREIGN KEY (group_id) REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: group_memberships fk_group_memberships_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_memberships
    ADD CONSTRAINT fk_group_memberships_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: groups fk_groups_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT fk_groups_owner_id FOREIGN KEY (owner_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: holidays fk_holidays_country_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT fk_holidays_country_id FOREIGN KEY (country_id) REFERENCES public.countries(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ios_receipts fk_ios_receipts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ios_receipts
    ADD CONSTRAINT fk_ios_receipts_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: notifications fk_notifications_activity_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_notifications_activity_id FOREIGN KEY (activity_id) REFERENCES public.activities(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: oauth_access_grants fk_oauth_access_grants_application_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_oauth_access_grants_application_id FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: oauth_access_grants fk_oauth_access_grants_resource_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_oauth_access_grants_resource_owner_id FOREIGN KEY (resource_owner_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: oauth_access_tokens fk_oauth_access_tokens_application_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_oauth_access_tokens_application_id FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: oauth_access_tokens fk_oauth_access_tokens_device_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_oauth_access_tokens_device_id FOREIGN KEY (device_id) REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: oauth_access_tokens fk_oauth_access_tokens_resource_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_oauth_access_tokens_resource_owner_id FOREIGN KEY (resource_owner_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: profiles fk_profiles_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT fk_profiles_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: purchases fk_purchases_ios_receipt_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_purchases_ios_receipt_id FOREIGN KEY (ios_receipt_id) REFERENCES public.ios_receipts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: purchases fk_purchases_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_purchases_product_id FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: purchases fk_purchases_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_purchases_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: subregions fk_subregions_country_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subregions
    ADD CONSTRAINT fk_subregions_country_id FOREIGN KEY (country_id) REFERENCES public.countries(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

SET search_path TO public;

INSERT INTO "schema_migrations" (version) VALUES
('20170706234411'),
('20170707175557'),
('20180126224444'),
('20180201150750'),
('20180202141647'),
('20180213030411'),
('20180213033024'),
('20180226221015'),
('20180627131338'),
('20180627140155'),
('20180809095204'),
('20180810121046'),
('20180909110129'),
('20181013164740'),
('20181013164742'),
('20181108093802'),
('20190305100344'),
('20190316182330'),
('20190316182544'),
('20190317110820'),
('20190424091014'),
('20190607111650'),
('20200326122110');


