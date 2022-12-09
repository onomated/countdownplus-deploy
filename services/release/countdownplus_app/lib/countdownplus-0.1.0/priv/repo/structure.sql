--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Homebrew)
-- Dumped by pg_dump version 14.6 (Homebrew)

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
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: account_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.account_type AS ENUM (
    'visitor',
    'user',
    'staff',
    'admin',
    'system'
);


--
-- Name: activity_entity; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.activity_entity AS ENUM (
    'event',
    'user',
    'group',
    'relationship'
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
-- Name: app_edition; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.app_edition AS ENUM (
    'lite',
    'full',
    'pro'
);


--
-- Name: article_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.article_type AS ENUM (
    'blog',
    'app'
);


--
-- Name: attachment_provider; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.attachment_provider AS ENUM (
    'uploads',
    'image_pack',
    'unsplash',
    'facebook',
    'giphy'
);


--
-- Name: attachment_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.attachment_type AS ENUM (
    'image',
    'video',
    'document'
);


--
-- Name: auth_method; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.auth_method AS ENUM (
    'email',
    'sms',
    'oauth2'
);


--
-- Name: auth_provider; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.auth_provider AS ENUM (
    'countdownplus',
    'facebook',
    'google',
    'apple'
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
    'ios',
    'web'
);


--
-- Name: event_access_mode; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.event_access_mode AS ENUM (
    'private',
    'public',
    'group'
);


--
-- Name: event_provider; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.event_provider AS ENUM (
    'calendar',
    'facebook',
    'tvdb',
    'tmdb',
    'js_date_holidays'
);


--
-- Name: event_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.event_type AS ENUM (
    'custom',
    'holiday',
    'concert',
    'education',
    'birthday',
    'travel',
    'sports',
    'movie',
    'tv_show',
    'wedding',
    'exact_age',
    'milestone',
    'family',
    'shopping',
    'work',
    'rememberance',
    'fundraiser',
    'charity',
    'contest',
    'party',
    'festival',
    'corporate'
);


--
-- Name: group_access_mode; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.group_access_mode AS ENUM (
    'private',
    'community',
    'public'
);


--
-- Name: group_membership_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.group_membership_status AS ENUM (
    'pending_approval',
    'active',
    'banned',
    'left'
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
-- Name: oban_job_state; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.oban_job_state AS ENUM (
    'available',
    'scheduled',
    'executing',
    'retryable',
    'completed',
    'discarded',
    'cancelled'
);


--
-- Name: privacy_mode; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.privacy_mode AS ENUM (
    'private',
    'contacts',
    'public'
);


--
-- Name: profile_attachment_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.profile_attachment_type AS ENUM (
    'avatar',
    'cover'
);


--
-- Name: pronoun; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pronoun AS ENUM (
    'male',
    'female',
    'neutral'
);


--
-- Name: purchase_model; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.purchase_model AS ENUM (
    'subscription',
    'consumable',
    'non_consumable'
);


--
-- Name: relationship_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.relationship_type AS ENUM (
    'mother',
    'father',
    'parent',
    'daughter',
    'son',
    'child',
    'sister',
    'brother',
    'sibling',
    'niece',
    'nephew',
    'sibling_child',
    'aunt',
    'uncle',
    'parent_sibling',
    'grandmother',
    'grandfather',
    'grandparent',
    'granddaugther',
    'grandson',
    'grandchild',
    'cousin',
    'stepsister',
    'stepbrother',
    'stepsibling',
    'stepmother',
    'stepfather',
    'stepparent',
    'stepdaughter',
    'stepson',
    'stepchild',
    'sister_in_law',
    'brother_in_law',
    'sibling_in_law',
    'mother_in_law',
    'father_in_law',
    'parent_in_law',
    'daughter_in_law',
    'son_in_law',
    'child_in_law',
    'colleague',
    'coworker',
    'friend',
    'classmate',
    'husband',
    'wife',
    'partner',
    'spouse',
    'girlfriend',
    'boyfriend',
    'teammate',
    'family_member',
    'best_friend',
    'close_friend',
    'neighbor',
    'acquaintance',
    'ancestor',
    'mentor',
    'mentee',
    'apprentice',
    'employer',
    'employee',
    'fiancee',
    'fiance',
    'pet',
    'other'
);


--
-- Name: countdownplus_counter_cache(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.countdownplus_counter_cache() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
  table_name text := quote_ident(TG_ARGV[0]);
  counter_name text := quote_ident(TG_ARGV[1]);
  fk_name text := quote_ident(TG_ARGV[2]);
  fk_changed boolean := false;
  fk_value uuid;
  record record;
BEGIN
  IF TG_OP = 'UPDATE' THEN
    record := NEW;
    EXECUTE 'SELECT ($1).' || fk_name || ' IS DISTINCT FROM ' || '($2).' || fk_name
    INTO fk_changed
    USING OLD, NEW;
  END IF;

  IF TG_OP = 'DELETE' OR fk_changed THEN
    record := OLD;
    EXECUTE 'SELECT ($1).' || fk_name INTO fk_value USING record;
    PERFORM countdownplus_increment_counter(table_name, counter_name, fk_value, -1);
  END IF;

  IF TG_OP = 'INSERT' OR fk_changed THEN
    record := NEW;
    EXECUTE 'SELECT ($1).' || fk_name INTO fk_value USING record;
    PERFORM countdownplus_increment_counter(table_name, counter_name, fk_value, 1);
  END IF;

  RETURN record;
END;
$_$;


--
-- Name: countdownplus_event_score(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.countdownplus_event_score(countdown_count integer, event_attachment_count integer) RETURNS bigint
    LANGUAGE plpgsql IMMUTABLE
    AS $$
  BEGIN
    RETURN (event_attachment_count * 5) -- pleasingly visual
    + countdown_count;
  END;
$$;


--
-- Name: countdownplus_group_score(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.countdownplus_group_score(member_count integer, event_count integer, group_attachment_count integer) RETURNS bigint
    LANGUAGE plpgsql IMMUTABLE
    AS $$
  BEGIN
    RETURN (group_attachment_count * 5) -- pleasingly visual
    + (member_count * 2) -- members indicate interesting group
    + event_count;
  END;
$$;


--
-- Name: countdownplus_increment_counter(text, text, uuid, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.countdownplus_increment_counter(table_name text, column_name text, id uuid, step integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
DECLARE
  table_name text := quote_ident(table_name);
  column_name text := quote_ident(column_name);
  conditions text := ' WHERE id = $1';
  updates text := column_name || '=' || column_name || '+' || step;
BEGIN
  EXECUTE 'UPDATE ' || table_name || ' SET ' || updates || conditions
  USING id;
END;
$_$;


--
-- Name: countdownplus_user_score(integer, integer, integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.countdownplus_user_score(countdown_count integer, event_count integer, follower_count integer, following_count integer, group_count integer, group_membership_count integer, user_attachment_count integer) RETURNS bigint
    LANGUAGE plpgsql IMMUTABLE
    AS $$
  BEGIN
    RETURN (user_attachment_count * 5) -- bothered to setup a profile
    + (group_count * 3) -- indicates interest in engaging community
    + (follower_count * 2) -- followers indicate interesting person
    + event_count -- combines with countdown count for weight of two
    + countdown_count
    + following_count
    + group_membership_count;
  END;
$$;


--
-- Name: oban_jobs_notify(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.oban_jobs_notify() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  channel text;
  notice json;
BEGIN
  IF NEW.state = 'available' THEN
    channel = 'public.oban_insert';
    notice = json_build_object('queue', NEW.queue);

    PERFORM pg_notify(channel, notice::text);
  END IF;

  RETURN NULL;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activities (
    id uuid NOT NULL,
    actor_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    object_type public.activity_entity NOT NULL,
    object_id uuid NOT NULL,
    activity_type public.activity_type NOT NULL,
    extended jsonb
);


--
-- Name: activity_entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activity_entries (
    user_id uuid NOT NULL,
    activity_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL
);


--
-- Name: article_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.article_attachments (
    article_id uuid NOT NULL,
    attachment_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    extended jsonb
);


--
-- Name: article_oembeds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.article_oembeds (
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    url text NOT NULL,
    oembed_type text NOT NULL,
    html text NOT NULL,
    extended jsonb,
    expires_at timestamp without time zone
);


--
-- Name: articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.articles (
    id uuid NOT NULL,
    author_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    published_at timestamp without time zone,
    featured_at timestamp without time zone,
    article_type public.article_type NOT NULL,
    title text NOT NULL,
    slug text NOT NULL,
    content text NOT NULL,
    excerpt text NOT NULL,
    tags text[],
    translations jsonb,
    extended jsonb
);


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attachments (
    id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    owner_id uuid,
    attachment_type public.attachment_type NOT NULL,
    attachment_provider public.attachment_provider NOT NULL,
    content_data jsonb NOT NULL,
    attached_count integer DEFAULT 0 NOT NULL
);


--
-- Name: auth_provider_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_provider_profiles (
    user_id uuid,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provider_id text NOT NULL,
    auth_provider public.auth_provider NOT NULL,
    first_name text,
    last_name text,
    extended jsonb,
    internal jsonb
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id uuid NOT NULL,
    owner_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    settings jsonb NOT NULL,
    countdown_count integer DEFAULT 0 NOT NULL
);


--
-- Name: countdown_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countdown_attachments (
    countdown_id uuid NOT NULL,
    attachment_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    extended jsonb
);


--
-- Name: countdowns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countdowns (
    id uuid NOT NULL,
    owner_id uuid NOT NULL,
    event_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    countdown_settings jsonb,
    extended jsonb,
    internal jsonb
);


--
-- Name: countdowns_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countdowns_categories (
    countdown_id uuid NOT NULL,
    category_id uuid NOT NULL
);


--
-- Name: credential_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credential_tokens (
    id uuid NOT NULL,
    credential_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    context text NOT NULL,
    token text NOT NULL,
    sent_to text
);


--
-- Name: credentials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credentials (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    confirmed_at timestamp without time zone,
    auth_method public.auth_method NOT NULL,
    auth_provider public.auth_provider NOT NULL,
    login public.citext NOT NULL,
    secret text,
    sign_in_count integer DEFAULT 0 NOT NULL,
    sign_in_at timestamp without time zone,
    sign_in_ip inet,
    internal jsonb
);


--
-- Name: device_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.device_addresses (
    id uuid NOT NULL,
    device_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    street text,
    street_others text[],
    city text,
    state text,
    state_code text,
    postal_code text,
    country_code text,
    extended jsonb,
    geometry public.geometry(Point,4326),
    CONSTRAINT country_code_is_uppercase CHECK ((upper(country_code) = country_code))
);


--
-- Name: devices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devices (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    last_seen_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    platform public.device_platform NOT NULL,
    fcm_token text,
    apns_token text,
    app_edition public.app_edition,
    app_version integer,
    model text,
    os_version text,
    timezone text,
    language_code text,
    locale text,
    country_code text,
    last_ip inet,
    details jsonb,
    CONSTRAINT country_code_is_uppercase CHECK ((upper(country_code) = country_code))
);


--
-- Name: event_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_addresses (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    street text,
    street_others text[],
    city text,
    state text,
    state_code text,
    postal_code text,
    country_code text,
    extended jsonb,
    geometry public.geometry(Point,4326),
    CONSTRAINT country_code_is_uppercase CHECK ((upper(country_code) = country_code))
);


--
-- Name: event_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_attachments (
    event_id uuid NOT NULL,
    attachment_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    extended jsonb
);


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events (
    id uuid NOT NULL,
    owner_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    access_mode public.event_access_mode NOT NULL,
    event_type public.event_type NOT NULL,
    title text NOT NULL,
    slug text NOT NULL,
    short_code text NOT NULL,
    highlights text,
    description text,
    date_range tstzrange NOT NULL,
    starts_at timestamp without time zone NOT NULL,
    duration bigint NOT NULL,
    timezone text,
    date_mask integer,
    country_code text,
    canonical_key text,
    tags text[],
    provider public.event_provider,
    provider_id text,
    recurrence jsonb,
    countdown_settings jsonb,
    translations jsonb,
    extended jsonb,
    internal jsonb,
    countdown_count integer DEFAULT 0 NOT NULL,
    group_count integer DEFAULT 0 NOT NULL,
    event_attachment_count integer DEFAULT 0 NOT NULL,
    score bigint GENERATED ALWAYS AS (public.countdownplus_event_score(countdown_count, event_attachment_count)) STORED,
    CONSTRAINT country_code_is_uppercase CHECK ((upper(country_code) = country_code)),
    CONSTRAINT provider_and_id_specified CHECK ((((provider IS NULL) AND (provider_id IS NULL)) OR ((provider IS NOT NULL) AND (provider_id IS NOT NULL))))
);


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    inserted_at timestamp without time zone NOT NULL,
    follower_id uuid NOT NULL,
    followed_id uuid NOT NULL,
    CONSTRAINT not_self CHECK ((follower_id <> followed_id))
);


--
-- Name: group_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_addresses (
    id uuid NOT NULL,
    group_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    street text,
    street_others text[],
    city text,
    state text,
    state_code text,
    postal_code text,
    country_code text,
    extended jsonb,
    geometry public.geometry(Point,4326),
    CONSTRAINT country_code_is_uppercase CHECK ((upper(country_code) = country_code))
);


--
-- Name: group_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_attachments (
    group_id uuid NOT NULL,
    attachment_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    profile_attachment_type public.profile_attachment_type NOT NULL,
    extended jsonb
);


--
-- Name: group_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_events (
    inserted_at timestamp without time zone NOT NULL,
    group_id uuid NOT NULL,
    event_id uuid NOT NULL
);


--
-- Name: group_members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_members (
    inserted_at timestamp without time zone NOT NULL,
    group_id uuid NOT NULL,
    user_id uuid NOT NULL,
    status public.group_membership_status NOT NULL,
    membership_type public.group_membership_type NOT NULL,
    settings jsonb
);


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id uuid NOT NULL,
    owner_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    access_mode public.group_access_mode NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    highlights text,
    description text,
    tags text[],
    settings jsonb,
    member_count integer DEFAULT 0 NOT NULL,
    event_count integer DEFAULT 0 NOT NULL,
    group_attachment_count integer DEFAULT 0 NOT NULL,
    score bigint GENERATED ALWAYS AS (public.countdownplus_group_score(member_count, event_count, group_attachment_count)) STORED
);


--
-- Name: key_values; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.key_values (
    id text NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    value jsonb
);


--
-- Name: oban_crons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oban_crons (
    name text NOT NULL,
    expression text NOT NULL,
    worker text NOT NULL,
    opts jsonb NOT NULL,
    paused boolean DEFAULT false NOT NULL,
    lock_version integer DEFAULT 1,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: oban_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oban_jobs (
    id bigint NOT NULL,
    state public.oban_job_state DEFAULT 'available'::public.oban_job_state NOT NULL,
    queue text DEFAULT 'default'::text NOT NULL,
    worker text NOT NULL,
    args jsonb DEFAULT '{}'::jsonb NOT NULL,
    errors jsonb[] DEFAULT ARRAY[]::jsonb[] NOT NULL,
    attempt integer DEFAULT 0 NOT NULL,
    max_attempts integer DEFAULT 20 NOT NULL,
    inserted_at timestamp without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    scheduled_at timestamp without time zone DEFAULT timezone('UTC'::text, now()) NOT NULL,
    attempted_at timestamp without time zone,
    completed_at timestamp without time zone,
    attempted_by text[],
    discarded_at timestamp without time zone,
    priority integer DEFAULT 0 NOT NULL,
    tags character varying(255)[] DEFAULT ARRAY[]::character varying[],
    meta jsonb DEFAULT '{}'::jsonb,
    cancelled_at timestamp without time zone,
    CONSTRAINT attempt_range CHECK (((attempt >= 0) AND (attempt <= max_attempts))),
    CONSTRAINT positive_max_attempts CHECK ((max_attempts > 0)),
    CONSTRAINT priority_range CHECK (((priority >= 0) AND (priority <= 3))),
    CONSTRAINT queue_length CHECK (((char_length(queue) > 0) AND (char_length(queue) < 128))),
    CONSTRAINT worker_length CHECK (((char_length(worker) > 0) AND (char_length(worker) < 128)))
);


--
-- Name: TABLE oban_jobs; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.oban_jobs IS '11';


--
-- Name: oban_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oban_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oban_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oban_jobs_id_seq OWNED BY public.oban_jobs.id;


--
-- Name: oban_peers; Type: TABLE; Schema: public; Owner: -
--

CREATE UNLOGGED TABLE public.oban_peers (
    name text NOT NULL,
    node text NOT NULL,
    started_at timestamp without time zone NOT NULL,
    expires_at timestamp without time zone NOT NULL
);


--
-- Name: oban_producers; Type: TABLE; Schema: public; Owner: -
--

CREATE UNLOGGED TABLE public.oban_producers (
    uuid uuid NOT NULL,
    name text NOT NULL,
    node text NOT NULL,
    queue text NOT NULL,
    meta jsonb DEFAULT '{}'::jsonb NOT NULL,
    running_ids bigint[] DEFAULT ARRAY[]::bigint[] NOT NULL,
    started_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id text NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title text NOT NULL,
    description text,
    purchase_model public.purchase_model NOT NULL,
    internal jsonb
);


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchases (
    id uuid NOT NULL,
    owner_id uuid NOT NULL,
    product_id text NOT NULL,
    receipt_id uuid,
    last_device_id uuid,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    purchased_at timestamp without time zone,
    verified_at timestamp without time zone,
    platform public.device_platform NOT NULL,
    transaction_id text NOT NULL,
    internal jsonb
);


--
-- Name: receipts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.receipts (
    id uuid NOT NULL,
    owner_id uuid NOT NULL,
    last_device_id uuid,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    verified_at timestamp without time zone,
    platform public.device_platform NOT NULL,
    internal jsonb
);


--
-- Name: relationships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.relationships (
    inserted_at timestamp without time zone NOT NULL,
    relater_id uuid NOT NULL,
    related_id uuid NOT NULL,
    relationship_type public.relationship_type NOT NULL,
    details jsonb,
    CONSTRAINT not_self CHECK ((relater_id <> related_id))
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: user_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_addresses (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    street text,
    street_others text[],
    city text,
    state text,
    state_code text,
    postal_code text,
    country_code text,
    extended jsonb,
    geometry public.geometry(Point,4326),
    CONSTRAINT country_code_is_uppercase CHECK ((upper(country_code) = country_code))
);


--
-- Name: user_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_attachments (
    user_id uuid NOT NULL,
    attachment_id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    profile_attachment_type public.profile_attachment_type NOT NULL,
    extended jsonb
);


--
-- Name: user_life_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_life_events (
    inserted_at timestamp without time zone NOT NULL,
    event_id uuid NOT NULL,
    user_id uuid NOT NULL,
    extended jsonb
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    last_seen_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    account_type public.account_type NOT NULL,
    username public.citext NOT NULL,
    email public.citext,
    first_name text,
    last_name text,
    pronoun public.pronoun,
    dob timestamp without time zone,
    dob_visibility_mask integer DEFAULT 96 NOT NULL,
    timezone text,
    language_code text,
    locale text,
    country_code text,
    settings jsonb,
    extended jsonb,
    internal jsonb,
    countdown_count integer DEFAULT 0 NOT NULL,
    event_count integer DEFAULT 0 NOT NULL,
    follower_count integer DEFAULT 0 NOT NULL,
    following_count integer DEFAULT 0 NOT NULL,
    group_count integer DEFAULT 0 NOT NULL,
    group_membership_count integer DEFAULT 0 NOT NULL,
    user_attachment_count integer DEFAULT 0 NOT NULL,
    score bigint GENERATED ALWAYS AS (public.countdownplus_user_score(countdown_count, event_count, follower_count, following_count, group_count, group_membership_count, user_attachment_count)) STORED,
    privacy_mode public.privacy_mode DEFAULT 'public'::public.privacy_mode NOT NULL,
    CONSTRAINT country_code_is_uppercase CHECK ((upper(country_code) = country_code))
);


--
-- Name: oban_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oban_jobs ALTER COLUMN id SET DEFAULT nextval('public.oban_jobs_id_seq'::regclass);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: activity_entries activity_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_entries
    ADD CONSTRAINT activity_entries_pkey PRIMARY KEY (user_id, activity_id);


--
-- Name: article_attachments article_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_attachments
    ADD CONSTRAINT article_attachments_pkey PRIMARY KEY (article_id, attachment_id);


--
-- Name: article_oembeds article_oembeds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_oembeds
    ADD CONSTRAINT article_oembeds_pkey PRIMARY KEY (url, oembed_type);


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
-- Name: auth_provider_profiles auth_provider_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_provider_profiles
    ADD CONSTRAINT auth_provider_profiles_pkey PRIMARY KEY (provider_id, auth_provider);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: countdown_attachments countdown_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countdown_attachments
    ADD CONSTRAINT countdown_attachments_pkey PRIMARY KEY (countdown_id, attachment_id);


--
-- Name: countdowns_categories countdowns_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countdowns_categories
    ADD CONSTRAINT countdowns_categories_pkey PRIMARY KEY (countdown_id, category_id);


--
-- Name: countdowns countdowns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countdowns
    ADD CONSTRAINT countdowns_pkey PRIMARY KEY (id);


--
-- Name: credential_tokens credential_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credential_tokens
    ADD CONSTRAINT credential_tokens_pkey PRIMARY KEY (id);


--
-- Name: credentials credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (id);


--
-- Name: device_addresses device_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.device_addresses
    ADD CONSTRAINT device_addresses_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: event_addresses event_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_addresses
    ADD CONSTRAINT event_addresses_pkey PRIMARY KEY (id);


--
-- Name: event_attachments event_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_attachments
    ADD CONSTRAINT event_attachments_pkey PRIMARY KEY (event_id, attachment_id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (follower_id, followed_id);


--
-- Name: group_addresses group_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_addresses
    ADD CONSTRAINT group_addresses_pkey PRIMARY KEY (id);


--
-- Name: group_attachments group_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_attachments
    ADD CONSTRAINT group_attachments_pkey PRIMARY KEY (group_id, attachment_id);


--
-- Name: group_events group_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_events
    ADD CONSTRAINT group_events_pkey PRIMARY KEY (group_id, event_id);


--
-- Name: group_members group_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_pkey PRIMARY KEY (group_id, user_id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: key_values key_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.key_values
    ADD CONSTRAINT key_values_pkey PRIMARY KEY (id);


--
-- Name: oban_crons oban_crons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oban_crons
    ADD CONSTRAINT oban_crons_pkey PRIMARY KEY (name);


--
-- Name: oban_jobs oban_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oban_jobs
    ADD CONSTRAINT oban_jobs_pkey PRIMARY KEY (id);


--
-- Name: oban_peers oban_peers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oban_peers
    ADD CONSTRAINT oban_peers_pkey PRIMARY KEY (name);


--
-- Name: oban_producers oban_producers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oban_producers
    ADD CONSTRAINT oban_producers_pkey PRIMARY KEY (uuid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: receipts receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_pkey PRIMARY KEY (id);


--
-- Name: relationships relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_pkey PRIMARY KEY (relater_id, related_id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: user_addresses user_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_pkey PRIMARY KEY (id);


--
-- Name: user_attachments user_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_attachments
    ADD CONSTRAINT user_attachments_pkey PRIMARY KEY (user_id, attachment_id);


--
-- Name: user_life_events user_life_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_life_events
    ADD CONSTRAINT user_life_events_pkey PRIMARY KEY (event_id, user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: activities_actor_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX activities_actor_id_index ON public.activities USING btree (actor_id);


--
-- Name: activities_object_id_object_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX activities_object_id_object_type_index ON public.activities USING btree (object_id, object_type);


--
-- Name: articles_article_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX articles_article_type_index ON public.articles USING btree (article_type);


--
-- Name: articles_author_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX articles_author_id_index ON public.articles USING btree (author_id);


--
-- Name: articles_published_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX articles_published_at_index ON public.articles USING btree (published_at);


--
-- Name: articles_slug_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX articles_slug_index ON public.articles USING btree (slug);


--
-- Name: articles_tags_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX articles_tags_index ON public.articles USING gin (tags);


--
-- Name: articles_title_excerpt_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX articles_title_excerpt_index ON public.articles USING gin ((((COALESCE(title, ''::text) || ' '::text) || COALESCE(excerpt, ''::text))) public.gin_trgm_ops);


--
-- Name: attachments_owner_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX attachments_owner_id_index ON public.attachments USING btree (owner_id) WHERE (owner_id IS NOT NULL);


--
-- Name: auth_provider_profiles_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_provider_profiles_user_id_index ON public.auth_provider_profiles USING btree (user_id);


--
-- Name: categories_owner_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX categories_owner_id_index ON public.categories USING btree (owner_id);


--
-- Name: countdowns_event_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX countdowns_event_id_index ON public.countdowns USING btree (event_id);


--
-- Name: countdowns_updated_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX countdowns_updated_at_index ON public.countdowns USING btree (updated_at);


--
-- Name: countdowns_user_id_event_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX countdowns_user_id_event_id_index ON public.countdowns USING btree (owner_id, event_id);


--
-- Name: credential_tokens_context_token_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX credential_tokens_context_token_index ON public.credential_tokens USING btree (context, token);


--
-- Name: credential_tokens_credential_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX credential_tokens_credential_id_index ON public.credential_tokens USING btree (credential_id);


--
-- Name: credentials_provider_login_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX credentials_provider_login_index ON public.credentials USING btree (auth_provider, login);


--
-- Name: credentials_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX credentials_user_id_index ON public.credentials USING btree (user_id);


--
-- Name: device_addresses_device_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX device_addresses_device_id_index ON public.device_addresses USING btree (device_id);


--
-- Name: devices_apns_token_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX devices_apns_token_index ON public.devices USING btree (apns_token) WHERE (apns_token IS NOT NULL);


--
-- Name: devices_fcm_token_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX devices_fcm_token_index ON public.devices USING btree (fcm_token) WHERE (fcm_token IS NOT NULL);


--
-- Name: devices_platform_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX devices_platform_index ON public.devices USING btree (platform);


--
-- Name: devices_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX devices_user_id_index ON public.devices USING btree (user_id);


--
-- Name: event_addresses_event_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX event_addresses_event_id_index ON public.event_addresses USING btree (event_id);


--
-- Name: events_access_mode_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_access_mode_index ON public.events USING btree (access_mode);


--
-- Name: events_canonical_key_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_canonical_key_index ON public.events USING btree (canonical_key) WHERE (canonical_key IS NOT NULL);


--
-- Name: events_date_range_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_date_range_index ON public.events USING gist (date_range);


--
-- Name: events_event_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_event_type_index ON public.events USING btree (event_type);


--
-- Name: events_owner_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_owner_id_index ON public.events USING btree (owner_id);


--
-- Name: events_provider_provider_id_owner_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX events_provider_provider_id_owner_id_index ON public.events USING btree (provider, provider_id) WHERE ((provider IS NOT NULL) AND (provider_id IS NOT NULL));


--
-- Name: events_score_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_score_index ON public.events USING btree (score);


--
-- Name: events_short_code_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX events_short_code_index ON public.events USING btree (short_code);


--
-- Name: events_slug_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX events_slug_index ON public.events USING btree (slug);


--
-- Name: events_starts_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_starts_at_index ON public.events USING btree (starts_at);


--
-- Name: events_title_highlights_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_title_highlights_index ON public.events USING gin ((((COALESCE(title, ''::text) || ' '::text) || COALESCE(highlights, ''::text))) public.gin_trgm_ops);


--
-- Name: events_updated_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX events_updated_at_index ON public.events USING btree (updated_at);


--
-- Name: group_addresses_group_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX group_addresses_group_id_index ON public.group_addresses USING btree (group_id);


--
-- Name: group_attachments_profile_attachment_type_group_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX group_attachments_profile_attachment_type_group_id_index ON public.group_attachments USING btree (profile_attachment_type, group_id);


--
-- Name: groups_name_highlights_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX groups_name_highlights_index ON public.groups USING gin ((((COALESCE(name, ''::text) || ' '::text) || COALESCE(highlights, ''::text))) public.gin_trgm_ops);


--
-- Name: groups_owner_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX groups_owner_id_index ON public.groups USING btree (owner_id);


--
-- Name: groups_score_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX groups_score_index ON public.groups USING btree (score);


--
-- Name: groups_slug_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX groups_slug_index ON public.groups USING btree (slug);


--
-- Name: groups_updated_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX groups_updated_at_index ON public.groups USING btree (updated_at);


--
-- Name: oban_jobs_args_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX oban_jobs_args_index ON public.oban_jobs USING gin (args);


--
-- Name: oban_jobs_meta_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX oban_jobs_meta_index ON public.oban_jobs USING gin (meta);


--
-- Name: oban_jobs_state_queue_priority_scheduled_at_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX oban_jobs_state_queue_priority_scheduled_at_id_index ON public.oban_jobs USING btree (state, queue, priority, scheduled_at, id);


--
-- Name: purchases_last_device_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX purchases_last_device_id_index ON public.purchases USING btree (last_device_id) WHERE (last_device_id IS NOT NULL);


--
-- Name: purchases_owner_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX purchases_owner_id_index ON public.purchases USING btree (owner_id);


--
-- Name: purchases_platform_transaction_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX purchases_platform_transaction_id_index ON public.purchases USING btree (platform, transaction_id);


--
-- Name: purchases_product_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX purchases_product_id_index ON public.purchases USING btree (product_id);


--
-- Name: receipts_last_device_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX receipts_last_device_id_index ON public.receipts USING btree (last_device_id) WHERE (last_device_id IS NOT NULL);


--
-- Name: receipts_owner_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX receipts_owner_id_index ON public.receipts USING btree (owner_id);


--
-- Name: user_addresses_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_addresses_user_id_index ON public.user_addresses USING btree (user_id);


--
-- Name: user_attachments_profile_attachment_type_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX user_attachments_profile_attachment_type_user_id_index ON public.user_attachments USING btree (profile_attachment_type, user_id);


--
-- Name: users_account_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_account_type_index ON public.users USING btree (account_type);


--
-- Name: users_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_email_index ON public.users USING btree (email) WHERE (email IS NOT NULL);


--
-- Name: users_last_seen_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_last_seen_at_index ON public.users USING btree (last_seen_at);


--
-- Name: users_privacy_mode_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_privacy_mode_index ON public.users USING btree (privacy_mode);


--
-- Name: users_score_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_score_index ON public.users USING btree (score);


--
-- Name: users_updated_at_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_updated_at_index ON public.users USING btree (updated_at);


--
-- Name: users_username_email_first_name_last_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_username_email_first_name_last_name_index ON public.users USING gin (((((((((COALESCE(username, ''::public.citext))::text || ' '::text) || (COALESCE(email, ''::public.citext))::text) || ' '::text) || COALESCE(first_name, ''::text)) || ' '::text) || COALESCE(last_name, ''::text))) public.gin_trgm_ops);


--
-- Name: users_username_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_username_index ON public.users USING btree (username);


--
-- Name: oban_jobs oban_notify; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER oban_notify AFTER INSERT ON public.oban_jobs FOR EACH ROW EXECUTE FUNCTION public.oban_jobs_notify();


--
-- Name: article_attachments update_attachments_attached_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_attachments_attached_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.article_attachments FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('attachments', 'attached_count', 'attachment_id');


--
-- Name: countdown_attachments update_attachments_attached_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_attachments_attached_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.countdown_attachments FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('attachments', 'attached_count', 'attachment_id');


--
-- Name: event_attachments update_attachments_attached_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_attachments_attached_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.event_attachments FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('attachments', 'attached_count', 'attachment_id');


--
-- Name: user_attachments update_attachments_attached_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_attachments_attached_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.user_attachments FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('attachments', 'attached_count', 'attachment_id');


--
-- Name: countdowns_categories update_categories_countdown_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_categories_countdown_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.countdowns_categories FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('categories', 'countdown_count', 'category_id');


--
-- Name: countdowns update_events_countdown_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_events_countdown_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.countdowns FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('events', 'countdown_count', 'event_id');


--
-- Name: event_attachments update_events_event_attachment_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_events_event_attachment_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.event_attachments FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('events', 'event_attachment_count', 'event_id');


--
-- Name: group_events update_events_group_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_events_group_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.group_events FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('events', 'group_count', 'event_id');


--
-- Name: group_events update_groups_event_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_groups_event_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.group_events FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('groups', 'event_count', 'group_id');


--
-- Name: group_attachments update_groups_group_attachment_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_groups_group_attachment_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.group_attachments FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('groups', 'group_attachment_count', 'group_id');


--
-- Name: group_members update_groups_member_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_groups_member_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.group_members FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('groups', 'member_count', 'group_id');


--
-- Name: countdowns update_users_countdown_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_users_countdown_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.countdowns FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('users', 'countdown_count', 'owner_id');


--
-- Name: events update_users_event_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_users_event_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.events FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('users', 'event_count', 'owner_id');


--
-- Name: follows update_users_follower_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_users_follower_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.follows FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('users', 'follower_count', 'followed_id');


--
-- Name: follows update_users_following_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_users_following_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.follows FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('users', 'following_count', 'follower_id');


--
-- Name: groups update_users_group_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_users_group_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.groups FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('users', 'group_count', 'owner_id');


--
-- Name: group_members update_users_group_membership_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_users_group_membership_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.group_members FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('users', 'group_membership_count', 'user_id');


--
-- Name: user_attachments update_users_user_attachment_count_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_users_user_attachment_count_trigger AFTER INSERT OR DELETE OR UPDATE ON public.user_attachments FOR EACH ROW EXECUTE FUNCTION public.countdownplus_counter_cache('users', 'user_attachment_count', 'user_id');


--
-- Name: activities activities_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: activity_entries activity_entries_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_entries
    ADD CONSTRAINT activity_entries_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.activities(id) ON DELETE CASCADE;


--
-- Name: activity_entries activity_entries_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_entries
    ADD CONSTRAINT activity_entries_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: article_attachments article_attachments_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_attachments
    ADD CONSTRAINT article_attachments_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: article_attachments article_attachments_attachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_attachments
    ADD CONSTRAINT article_attachments_attachment_id_fkey FOREIGN KEY (attachment_id) REFERENCES public.attachments(id) ON DELETE CASCADE;


--
-- Name: articles articles_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: attachments attachments_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: auth_provider_profiles auth_provider_profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_provider_profiles
    ADD CONSTRAINT auth_provider_profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: categories categories_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: countdown_attachments countdown_attachments_attachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countdown_attachments
    ADD CONSTRAINT countdown_attachments_attachment_id_fkey FOREIGN KEY (attachment_id) REFERENCES public.attachments(id) ON DELETE CASCADE;


--
-- Name: countdown_attachments countdown_attachments_countdown_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countdown_attachments
    ADD CONSTRAINT countdown_attachments_countdown_id_fkey FOREIGN KEY (countdown_id) REFERENCES public.countdowns(id) ON DELETE CASCADE;


--
-- Name: countdowns_categories countdowns_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countdowns_categories
    ADD CONSTRAINT countdowns_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: countdowns_categories countdowns_categories_countdown_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countdowns_categories
    ADD CONSTRAINT countdowns_categories_countdown_id_fkey FOREIGN KEY (countdown_id) REFERENCES public.countdowns(id) ON DELETE CASCADE;


--
-- Name: countdowns countdowns_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countdowns
    ADD CONSTRAINT countdowns_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: countdowns countdowns_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countdowns
    ADD CONSTRAINT countdowns_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: credential_tokens credential_tokens_credential_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credential_tokens
    ADD CONSTRAINT credential_tokens_credential_id_fkey FOREIGN KEY (credential_id) REFERENCES public.credentials(id) ON DELETE CASCADE;


--
-- Name: credentials credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: device_addresses device_addresses_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.device_addresses
    ADD CONSTRAINT device_addresses_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(id) ON DELETE CASCADE;


--
-- Name: devices devices_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: event_addresses event_addresses_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_addresses
    ADD CONSTRAINT event_addresses_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: event_attachments event_attachments_attachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_attachments
    ADD CONSTRAINT event_attachments_attachment_id_fkey FOREIGN KEY (attachment_id) REFERENCES public.attachments(id) ON DELETE CASCADE;


--
-- Name: event_attachments event_attachments_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_attachments
    ADD CONSTRAINT event_attachments_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: events events_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: follows follows_followed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_followed_id_fkey FOREIGN KEY (followed_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: follows follows_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: group_addresses group_addresses_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_addresses
    ADD CONSTRAINT group_addresses_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- Name: group_attachments group_attachments_attachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_attachments
    ADD CONSTRAINT group_attachments_attachment_id_fkey FOREIGN KEY (attachment_id) REFERENCES public.attachments(id) ON DELETE CASCADE;


--
-- Name: group_attachments group_attachments_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_attachments
    ADD CONSTRAINT group_attachments_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- Name: group_events group_events_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_events
    ADD CONSTRAINT group_events_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: group_events group_events_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_events
    ADD CONSTRAINT group_events_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- Name: group_members group_members_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE CASCADE;


--
-- Name: group_members group_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: groups groups_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: purchases purchases_last_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_last_device_id_fkey FOREIGN KEY (last_device_id) REFERENCES public.devices(id) ON DELETE SET NULL;


--
-- Name: purchases purchases_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: purchases purchases_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE RESTRICT;


--
-- Name: purchases purchases_receipt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_receipt_id_fkey FOREIGN KEY (receipt_id) REFERENCES public.receipts(id) ON DELETE SET NULL;


--
-- Name: receipts receipts_last_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_last_device_id_fkey FOREIGN KEY (last_device_id) REFERENCES public.devices(id) ON DELETE SET NULL;


--
-- Name: receipts receipts_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: relationships relationships_related_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_related_id_fkey FOREIGN KEY (related_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: relationships relationships_relater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_relater_id_fkey FOREIGN KEY (relater_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_addresses user_addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_attachments user_attachments_attachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_attachments
    ADD CONSTRAINT user_attachments_attachment_id_fkey FOREIGN KEY (attachment_id) REFERENCES public.attachments(id) ON DELETE CASCADE;


--
-- Name: user_attachments user_attachments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_attachments
    ADD CONSTRAINT user_attachments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_life_events user_life_events_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_life_events
    ADD CONSTRAINT user_life_events_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: user_life_events user_life_events_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_life_events
    ADD CONSTRAINT user_life_events_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

INSERT INTO public."schema_migrations" (version) VALUES (20200328030100);
INSERT INTO public."schema_migrations" (version) VALUES (20200328030200);
INSERT INTO public."schema_migrations" (version) VALUES (20200328030300);
INSERT INTO public."schema_migrations" (version) VALUES (20200328030803);
INSERT INTO public."schema_migrations" (version) VALUES (20201025181635);
INSERT INTO public."schema_migrations" (version) VALUES (20210422104739);
INSERT INTO public."schema_migrations" (version) VALUES (20210422110845);
INSERT INTO public."schema_migrations" (version) VALUES (20210607142850);
INSERT INTO public."schema_migrations" (version) VALUES (20210807100729);
INSERT INTO public."schema_migrations" (version) VALUES (20211023183216);
INSERT INTO public."schema_migrations" (version) VALUES (20211103004741);
INSERT INTO public."schema_migrations" (version) VALUES (20221204143537);
INSERT INTO public."schema_migrations" (version) VALUES (20221204143922);
