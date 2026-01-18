--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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
-- Name: _realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA _realtime;


ALTER SCHEMA _realtime OWNER TO supabase_admin;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_net; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_net IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA supabase_functions;


ALTER SCHEMA supabase_functions OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: address_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.address_type AS ENUM (
    'home',
    'work',
    'other'
);


ALTER TYPE public.address_type OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: assign_template_to_meal(uuid, text, text, date, date, integer); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.assign_template_to_meal(p_meal_plan_id uuid, p_template_code text, p_meal_slot text, p_start_date date, p_end_date date, p_day_of_week integer DEFAULT NULL::integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
DECLARE
    v_template_id UUID;
    v_vendor_id UUID;
    rows_affected INTEGER := 0;
    v_column_name TEXT;
    v_code_column TEXT;
BEGIN
    -- Get vendor_id from meal_plan
    SELECT vendor_id INTO v_vendor_id FROM meal_plans WHERE id = p_meal_plan_id;
    
    -- Get template_id
    SELECT id INTO v_template_id
    FROM meal_templates
    WHERE vendor_id = v_vendor_id AND template_code = p_template_code;
    
    IF v_template_id IS NULL THEN
        RAISE EXCEPTION 'Template % not found for this vendor', p_template_code;
    END IF;
    
    -- Determine column names
    v_column_name := p_meal_slot || '_template_id';
    v_code_column := p_meal_slot || '_template_code';
    
    -- Update calendar entries using dynamic SQL
    EXECUTE format('
        UPDATE meal_plan_calendar
        SET %I = $1, %I = $2
        WHERE meal_plan_id = $3
          AND menu_date BETWEEN $4 AND $5
          AND ($6 IS NULL OR EXTRACT(DOW FROM menu_date) = $6)
    ', v_column_name, v_code_column)
    USING v_template_id, p_template_code, p_meal_plan_id, p_start_date, p_end_date, p_day_of_week;
    
    GET DIAGNOSTICS rows_affected = ROW_COUNT;
    RETURN rows_affected;
END;
$_$;


ALTER FUNCTION public.assign_template_to_meal(p_meal_plan_id uuid, p_template_code text, p_meal_slot text, p_start_date date, p_end_date date, p_day_of_week integer) OWNER TO supabase_admin;

--
-- Name: ensure_single_default_address(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ensure_single_default_address() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- If setting this address as default, unset all other defaults for this user
    IF NEW.is_default = true THEN
        UPDATE user_addresses 
        SET is_default = false 
        WHERE user_id = NEW.user_id AND id != NEW.id;
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.ensure_single_default_address() OWNER TO postgres;

--
-- Name: generate_template_code(uuid); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.generate_template_code(p_vendor_id uuid) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    next_number INTEGER;
BEGIN
    SELECT COALESCE(
        MAX(CAST(SUBSTRING(template_code FROM 'GZ_([0-9]+)') AS INTEGER)),
        0
    ) + 1
    INTO next_number
    FROM meal_templates
    WHERE vendor_id = p_vendor_id;
    
    RETURN 'GZ_' || next_number;
END;
$$;


ALTER FUNCTION public.generate_template_code(p_vendor_id uuid) OWNER TO supabase_admin;

--
-- Name: get_user_default_address(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_user_default_address(input_user_id uuid) RETURNS TABLE(id uuid, type character varying, custom_tag character varying, house_number character varying, apartment_road character varying, complete_address text, latitude numeric, longitude numeric, phone character varying, display_type text, short_address text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        ua.id,
        ua.type,
        ua.custom_tag,
        ua.house_number,
        ua.apartment_road,
        ua.complete_address,
        ua.latitude,
        ua.longitude,
        ua.phone,
        uad.display_type,
        uad.short_address
    FROM public.user_addresses ua
    JOIN public.user_addresses_display uad ON ua.id = uad.id
    WHERE ua.user_id = input_user_id 
    AND ua.is_default = TRUE
    LIMIT 1;
END;
$$;


ALTER FUNCTION public.get_user_default_address(input_user_id uuid) OWNER TO postgres;

--
-- Name: set_template_code(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.set_template_code() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.template_code IS NULL OR NEW.template_code = '' THEN
        NEW.template_code := generate_template_code(NEW.vendor_id);
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.set_template_code() OWNER TO supabase_admin;

--
-- Name: update_cart_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_cart_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_cart_updated_at() OWNER TO postgres;

--
-- Name: update_updated_at(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.update_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at() OWNER TO supabase_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at_column() OWNER TO postgres;

--
-- Name: update_user_addresses_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_user_addresses_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc', NOW());
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_user_addresses_updated_at() OWNER TO postgres;

--
-- Name: upsert_otp_verification(text, text, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.upsert_otp_verification(p_phone text, p_otp text, p_expires_at timestamp with time zone) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  result_id UUID;
BEGIN
  -- Try to update existing record first
  UPDATE otp_verification 
  SET 
    otp = p_otp,
    expires_at = p_expires_at,
    verified = FALSE,
    attempts = 0,
    created_at = NOW(),
    verified_at = NULL
  WHERE phone = p_phone
  RETURNING id INTO result_id;
  
  -- If no record was updated, insert a new one
  IF NOT FOUND THEN
    INSERT INTO otp_verification (phone, otp, expires_at, verified, attempts, created_at)
    VALUES (p_phone, p_otp, p_expires_at, FALSE, 0, NOW())
    RETURNING id INTO result_id;
  END IF;
  
  RETURN result_id;
END;
$$;


ALTER FUNCTION public.upsert_otp_verification(p_phone text, p_otp text, p_expires_at timestamp with time zone) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


ALTER FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_update_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_level_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.prefixes_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
    DECLARE
      request_id bigint;
      payload jsonb;
      url text := TG_ARGV[0]::text;
      method text := TG_ARGV[1]::text;
      headers jsonb DEFAULT '{}'::jsonb;
      params jsonb DEFAULT '{}'::jsonb;
      timeout_ms integer DEFAULT 1000;
    BEGIN
      IF url IS NULL OR url = 'null' THEN
        RAISE EXCEPTION 'url argument is missing';
      END IF;

      IF method IS NULL OR method = 'null' THEN
        RAISE EXCEPTION 'method argument is missing';
      END IF;

      IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
        headers = '{"Content-Type": "application/json"}'::jsonb;
      ELSE
        headers = TG_ARGV[2]::jsonb;
      END IF;

      IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
        params = '{}'::jsonb;
      ELSE
        params = TG_ARGV[3]::jsonb;
      END IF;

      IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
        timeout_ms = 1000;
      ELSE
        timeout_ms = TG_ARGV[4]::integer;
      END IF;

      CASE
        WHEN method = 'GET' THEN
          SELECT http_get INTO request_id FROM net.http_get(
            url,
            params,
            headers,
            timeout_ms
          );
        WHEN method = 'POST' THEN
          payload = jsonb_build_object(
            'old_record', OLD,
            'record', NEW,
            'type', TG_OP,
            'table', TG_TABLE_NAME,
            'schema', TG_TABLE_SCHEMA
          );

          SELECT http_post INTO request_id FROM net.http_post(
            url,
            payload,
            params,
            headers,
            timeout_ms
          );
        ELSE
          RAISE EXCEPTION 'method argument % is invalid', method;
      END CASE;

      INSERT INTO supabase_functions.hooks
        (hook_table_id, hook_name, request_id)
      VALUES
        (TG_RELID, TG_NAME, request_id);

      RETURN NEW;
    END
  $$;


ALTER FUNCTION supabase_functions.http_request() OWNER TO supabase_functions_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extensions; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.extensions (
    id uuid NOT NULL,
    type text,
    settings jsonb,
    tenant_external_id text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _realtime.extensions OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: tenants; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.tenants (
    id uuid NOT NULL,
    name text,
    external_id text,
    jwt_secret text,
    max_concurrent_users integer DEFAULT 200 NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    max_events_per_second integer DEFAULT 100 NOT NULL,
    postgres_cdc_default text DEFAULT 'postgres_cdc_rls'::text,
    max_bytes_per_second integer DEFAULT 100000 NOT NULL,
    max_channels_per_client integer DEFAULT 100 NOT NULL,
    max_joins_per_second integer DEFAULT 500 NOT NULL,
    suspend boolean DEFAULT false,
    jwt_jwks jsonb,
    notify_private_alpha boolean DEFAULT false,
    private_only boolean DEFAULT false NOT NULL,
    migrations_ran integer DEFAULT 0,
    broadcast_adapter character varying(255) DEFAULT 'gen_rpc'::character varying,
    max_presence_events_per_second integer DEFAULT 1000,
    max_payload_size_in_kb integer DEFAULT 3000
);


ALTER TABLE _realtime.tenants OWNER TO supabase_admin;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: activity_logs; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.activity_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    action text NOT NULL,
    entity_type text,
    entity_id uuid,
    metadata jsonb DEFAULT '{}'::jsonb,
    device_type text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.activity_logs OWNER TO supabase_admin;

--
-- Name: TABLE activity_logs; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.activity_logs IS 'User activity tracking';


--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_phone character varying(15) NOT NULL,
    product_id uuid NOT NULL,
    vendor_id uuid NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    variant_id uuid,
    addons jsonb,
    special_instructions text,
    CONSTRAINT chk_quantity_positive CHECK ((quantity > 0))
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    image_url text,
    icon_name text,
    sort_order integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    banner_url text,
    parent_category_id uuid,
    slug text,
    is_featured boolean DEFAULT false
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: coupon_usage; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.coupon_usage (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    coupon_id uuid,
    user_id uuid,
    order_id uuid,
    discount_applied numeric(10,2) NOT NULL,
    used_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.coupon_usage OWNER TO supabase_admin;

--
-- Name: TABLE coupon_usage; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.coupon_usage IS 'Tracks which user used which coupon';


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.coupons (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    discount_type text NOT NULL,
    discount_value numeric(10,2) NOT NULL,
    minimum_order numeric(10,2) DEFAULT 0,
    maximum_discount numeric(10,2),
    usage_limit integer,
    usage_per_user integer DEFAULT 1,
    used_count integer DEFAULT 0,
    valid_from date DEFAULT CURRENT_DATE,
    valid_until date,
    is_active boolean DEFAULT true,
    vendor_id uuid,
    applicable_categories text[],
    first_order_only boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT coupons_discount_type_check CHECK ((discount_type = ANY (ARRAY['percentage'::text, 'fixed'::text])))
);


ALTER TABLE public.coupons OWNER TO supabase_admin;

--
-- Name: TABLE coupons; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.coupons IS 'Discount codes - platform-wide or vendor-specific';


--
-- Name: deliveries; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.deliveries (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    order_id uuid,
    partner_id text NOT NULL,
    external_order_id text,
    status text,
    rider_name text,
    rider_phone text,
    rider_coordinates jsonb,
    pickup_otp text,
    delivery_otp text,
    tracking_url text,
    meta_data jsonb DEFAULT '{}'::jsonb,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    courier_request_payload jsonb DEFAULT '{}'::jsonb,
    courier_response_payload jsonb DEFAULT '{}'::jsonb,
    history jsonb DEFAULT '[]'::jsonb,
    rider_id text,
    cancellation_reason text,
    cancelled_by text,
    CONSTRAINT deliveries_partner_id_check CHECK ((partner_id = 'shadowfax'::text))
);


ALTER TABLE public.deliveries OWNER TO supabase_admin;

--
-- Name: COLUMN deliveries.courier_request_payload; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.deliveries.courier_request_payload IS 'Full OrderCreationRequest sent to Shadowfax';


--
-- Name: COLUMN deliveries.courier_response_payload; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.deliveries.courier_response_payload IS 'Latest OrderCallbackRequest received via Webhook';


--
-- Name: COLUMN deliveries.rider_id; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.deliveries.rider_id IS 'Unique Rider ID from Shadowfax';


--
-- Name: delivery_zones; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.delivery_zones (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    city text DEFAULT 'Coimbatore'::text NOT NULL,
    state text DEFAULT 'Tamil Nadu'::text,
    center_lat numeric(10,8),
    center_lng numeric(11,8),
    radius_km numeric(5,2),
    polygon jsonb,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.delivery_zones OWNER TO supabase_admin;

--
-- Name: TABLE delivery_zones; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.delivery_zones IS 'Delivery zones in Coimbatore area';


--
-- Name: inventory_logs; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.inventory_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    product_id uuid,
    vendor_id uuid,
    change_type text,
    quantity_change integer NOT NULL,
    quantity_before integer,
    quantity_after integer,
    reason text,
    created_by text,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT inventory_logs_change_type_check CHECK ((change_type = ANY (ARRAY['restock'::text, 'sale'::text, 'waste'::text, 'adjustment'::text])))
);


ALTER TABLE public.inventory_logs OWNER TO supabase_admin;

--
-- Name: TABLE inventory_logs; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.inventory_logs IS 'Product stock changes';


--
-- Name: kv_store_6985f4e9; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kv_store_6985f4e9 (
    key text NOT NULL,
    value jsonb NOT NULL
);


ALTER TABLE public.kv_store_6985f4e9 OWNER TO postgres;

--
-- Name: meal_plan_calendar; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.meal_plan_calendar (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    meal_plan_id uuid NOT NULL,
    menu_date date NOT NULL,
    breakfast_template_id uuid,
    breakfast_template_code text,
    lunch_template_id uuid,
    lunch_template_code text,
    dinner_template_id uuid,
    dinner_template_code text,
    snack_template_id uuid,
    snack_template_code text,
    is_available boolean DEFAULT true,
    total_calories integer,
    notes text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.meal_plan_calendar OWNER TO supabase_admin;

--
-- Name: meal_plan_day_menu_backup; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.meal_plan_day_menu_backup (
    id uuid,
    meal_plan_id uuid,
    day_of_week integer,
    day_name text,
    day_theme text,
    breakfast_product_id uuid,
    breakfast_image text,
    lunch_product_id uuid,
    lunch_image text,
    dinner_product_id uuid,
    dinner_image text,
    snack_product_id uuid,
    snack_image text,
    total_calories integer,
    notes text,
    created_at timestamp with time zone,
    breakfast_item text,
    lunch_item text,
    dinner_item text,
    snack_item text
);


ALTER TABLE public.meal_plan_day_menu_backup OWNER TO supabase_admin;

--
-- Name: meal_plans; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.meal_plans (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    vendor_id uuid,
    title text NOT NULL,
    description text,
    thumbnail text,
    banner_url text,
    video_url text,
    price_display text NOT NULL,
    schedule text NOT NULL,
    features text[] DEFAULT '{}'::text[],
    plan_type text,
    dietary_type text,
    calories_per_day integer,
    includes_breakfast boolean DEFAULT false,
    includes_lunch boolean DEFAULT true,
    includes_dinner boolean DEFAULT true,
    includes_snacks boolean DEFAULT false,
    rating numeric(2,1) DEFAULT 4.5,
    review_count integer DEFAULT 0,
    min_duration_days integer DEFAULT 7,
    max_duration_days integer DEFAULT 90,
    terms_conditions text,
    is_active boolean DEFAULT true,
    is_featured boolean DEFAULT false,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    trust_text text DEFAULT ' 96% choose to continue'::text,
    vendor_name text,
    price_breakfast numeric(10,2) DEFAULT 89.00,
    price_lunch numeric(10,2) DEFAULT 129.00,
    price_dinner numeric(10,2) DEFAULT 129.00,
    price_snack numeric(10,2) DEFAULT 49.00,
    CONSTRAINT meal_plans_dietary_type_check CHECK ((dietary_type = ANY (ARRAY['veg'::text, 'non-veg'::text, 'vegan'::text, 'eggetarian'::text]))),
    CONSTRAINT meal_plans_plan_type_check CHECK ((plan_type = ANY (ARRAY['weight_loss'::text, 'muscle_gain'::text, 'balanced'::text, 'detox'::text, 'keto'::text, 'general'::text])))
);


ALTER TABLE public.meal_plans OWNER TO supabase_admin;

--
-- Name: TABLE meal_plans; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.meal_plans IS 'Weekly/Monthly meal plans like Protein Power, Balanced Diet';


--
-- Name: meal_templates; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.meal_templates (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    vendor_id uuid NOT NULL,
    template_code text NOT NULL,
    item_name text NOT NULL,
    item_description text,
    image_url text,
    product_id uuid,
    calories integer,
    protein_grams numeric(5,2),
    carbs_grams numeric(5,2),
    fat_grams numeric(5,2),
    meal_type text DEFAULT 'any'::text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT valid_meal_type CHECK ((meal_type = ANY (ARRAY['breakfast'::text, 'lunch'::text, 'dinner'::text, 'snack'::text, 'any'::text]))),
    CONSTRAINT valid_template_code CHECK ((template_code ~ '^GZ_[0-9]+$'::text))
);


ALTER TABLE public.meal_templates OWNER TO supabase_admin;

--
-- Name: vendors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendors (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    image text,
    rating numeric(2,1) DEFAULT 4.5,
    delivery_time text DEFAULT '25-30 mins'::text,
    minimum_order numeric(10,2) DEFAULT 0,
    delivery_fee numeric(10,2) DEFAULT 0,
    cuisine_type text,
    address text,
    phone text,
    is_active boolean DEFAULT true,
    is_featured boolean DEFAULT false,
    opening_hours jsonb,
    tags text[],
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    logo text,
    banner_url text,
    total_orders integer DEFAULT 0,
    total_reviews integer DEFAULT 0,
    whatsapp_number text,
    email text,
    is_open boolean DEFAULT true,
    is_verified boolean DEFAULT false,
    gst_number text,
    fssai_license text,
    bank_account jsonb,
    commission_rate numeric(5,2) DEFAULT 15,
    payout_frequency text DEFAULT 'weekly'::text,
    status text DEFAULT 'approved'::text,
    latitude double precision,
    longitude double precision,
    is_blacklisted boolean DEFAULT false,
    password text DEFAULT "substring"((gen_random_uuid())::text, 1, 8),
    otp text,
    otp_expires_at timestamp with time zone,
    pincode text,
    company_reg_no text,
    owner_aadhar_no text,
    pan_card_no text,
    bank_account_no text,
    ifsc_code text,
    bank_name text,
    account_holder_name text,
    owner_name text,
    company_type text,
    CONSTRAINT vendors_company_type_check CHECK ((company_type = ANY (ARRAY['Sole Proprietorship'::text, 'Partnership'::text, 'LLP'::text, 'Pvt Ltd'::text, 'OPC'::text])))
);


ALTER TABLE public.vendors OWNER TO postgres;

--
-- Name: COLUMN vendors.commission_rate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendors.commission_rate IS 'Platform commission percentage';


--
-- Name: COLUMN vendors.pincode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendors.pincode IS 'Postal code of the vendor location';


--
-- Name: COLUMN vendors.company_reg_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendors.company_reg_no IS 'Company Registration Number / CIN';


--
-- Name: COLUMN vendors.owner_aadhar_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendors.owner_aadhar_no IS 'Aadhar Number of the owner';


--
-- Name: COLUMN vendors.pan_card_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendors.pan_card_no IS 'PAN Card Number';


--
-- Name: COLUMN vendors.bank_account_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendors.bank_account_no IS 'Bank Account Number for payouts';


--
-- Name: COLUMN vendors.ifsc_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendors.ifsc_code IS 'IFSC Code for the bank account';


--
-- Name: COLUMN vendors.bank_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendors.bank_name IS 'Name of the Bank';


--
-- Name: COLUMN vendors.account_holder_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendors.account_holder_name IS 'Name of the account holder as per bank records';


--
-- Name: COLUMN vendors.owner_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendors.owner_name IS 'Full name of the business owner';


--
-- Name: COLUMN vendors.company_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vendors.company_type IS 'Type of company registration';


--
-- Name: meal_plan_menu_view; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.meal_plan_menu_view AS
 SELECT c.meal_plan_id,
    mp.title AS meal_plan_title,
    mp.vendor_id,
    v.name AS vendor_name,
    c.menu_date,
    (EXTRACT(dow FROM c.menu_date))::integer AS day_of_week,
    to_char((c.menu_date)::timestamp with time zone, 'Day'::text) AS day_name,
    c.is_available,
    c.breakfast_template_code,
    tb.item_name AS breakfast_item,
    tb.item_description AS breakfast_description,
    tb.image_url AS breakfast_image,
    tb.calories AS breakfast_calories,
    c.lunch_template_code,
    tl.item_name AS lunch_item,
    tl.item_description AS lunch_description,
    tl.image_url AS lunch_image,
    tl.calories AS lunch_calories,
    c.dinner_template_code,
    td.item_name AS dinner_item,
    td.item_description AS dinner_description,
    td.image_url AS dinner_image,
    td.calories AS dinner_calories,
    c.snack_template_code,
    ts.item_name AS snack_item,
    ts.item_description AS snack_description,
    ts.image_url AS snack_image,
    ts.calories AS snack_calories,
    (((COALESCE(tb.calories, 0) + COALESCE(tl.calories, 0)) + COALESCE(td.calories, 0)) + COALESCE(ts.calories, 0)) AS total_calories,
    c.notes
   FROM ((((((public.meal_plan_calendar c
     JOIN public.meal_plans mp ON ((c.meal_plan_id = mp.id)))
     JOIN public.vendors v ON ((mp.vendor_id = v.id)))
     LEFT JOIN public.meal_templates tb ON ((c.breakfast_template_id = tb.id)))
     LEFT JOIN public.meal_templates tl ON ((c.lunch_template_id = tl.id)))
     LEFT JOIN public.meal_templates td ON ((c.dinner_template_id = td.id)))
     LEFT JOIN public.meal_templates ts ON ((c.snack_template_id = ts.id)));


ALTER TABLE public.meal_plan_menu_view OWNER TO supabase_admin;

--
-- Name: meal_plan_subscriptions; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.meal_plan_subscriptions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    meal_plan_id uuid,
    chosen_meals text[] DEFAULT '{lunch,dinner}'::text[],
    chosen_days integer[] DEFAULT '{1,2,3,4,5,6}'::integer[],
    custom_times jsonb DEFAULT '{}'::jsonb,
    duration text NOT NULL,
    start_date date NOT NULL,
    end_date date,
    total_amount numeric(10,2) NOT NULL,
    delivery_address jsonb NOT NULL,
    status text DEFAULT 'active'::text,
    payment_id text,
    payment_status text DEFAULT 'pending'::text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT meal_plan_subscriptions_status_check CHECK ((status = ANY (ARRAY['active'::text, 'paused'::text, 'cancelled'::text, 'completed'::text])))
);


ALTER TABLE public.meal_plan_subscriptions OWNER TO supabase_admin;

--
-- Name: TABLE meal_plan_subscriptions; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.meal_plan_subscriptions IS 'User subscriptions to meal plans';


--
-- Name: notification_preferences; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.notification_preferences (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    order_updates boolean DEFAULT true,
    subscription_alerts boolean DEFAULT true,
    promotional boolean DEFAULT true,
    review_requests boolean DEFAULT true,
    channel text DEFAULT 'push'::text,
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT notification_preferences_channel_check CHECK ((channel = ANY (ARRAY['push'::text, 'sms'::text, 'email'::text, 'all'::text])))
);


ALTER TABLE public.notification_preferences OWNER TO supabase_admin;

--
-- Name: TABLE notification_preferences; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.notification_preferences IS 'User notification settings';


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.notifications (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    type text NOT NULL,
    title text NOT NULL,
    message text NOT NULL,
    data jsonb DEFAULT '{}'::jsonb,
    is_read boolean DEFAULT false,
    read_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT notifications_type_check CHECK ((type = ANY (ARRAY['order_placed'::text, 'order_confirmed'::text, 'order_preparing'::text, 'order_ready'::text, 'order_delivered'::text, 'order_cancelled'::text, 'subscription_reminder'::text, 'subscription_renewed'::text, 'subscription_paused'::text, 'payment_success'::text, 'payment_failed'::text, 'promo'::text, 'system'::text])))
);


ALTER TABLE public.notifications OWNER TO supabase_admin;

--
-- Name: TABLE notifications; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.notifications IS 'User notifications for orders, subscriptions, promos';


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    order_id uuid,
    product_id uuid,
    vendor_id uuid,
    product_name text NOT NULL,
    product_description text,
    product_image_url text,
    quantity integer DEFAULT 1 NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    total_price numeric(10,2) NOT NULL,
    special_instructions text,
    customizations jsonb,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    vendor_id uuid,
    order_number text NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    order_type text DEFAULT 'instant'::text NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    delivery_fee numeric(10,2) DEFAULT 0,
    packaging_fee numeric(10,2) DEFAULT 5,
    taxes numeric(10,2) DEFAULT 0,
    discount_amount numeric(10,2) DEFAULT 0,
    total_amount numeric(10,2) NOT NULL,
    delivery_address jsonb NOT NULL,
    delivery_phone text,
    estimated_delivery_time timestamp with time zone,
    actual_delivery_time timestamp with time zone,
    payment_id text,
    payment_method text,
    payment_status text DEFAULT 'pending'::text,
    special_instructions text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    platform_fee numeric DEFAULT 0,
    gst_items numeric DEFAULT 0,
    gst_fees numeric DEFAULT 0,
    rider_id uuid,
    tip_amount numeric(10,2) DEFAULT 0,
    cancelled_by text,
    cancellation_reason text,
    refund_status text,
    refund_amount numeric(10,2),
    rating integer,
    feedback text,
    feedback_at timestamp with time zone,
    invoice_number text,
    invoice_url text,
    order_source text DEFAULT 'app'::text,
    device_type text
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: otp_verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otp_verification (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    phone text NOT NULL,
    otp text NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    verified boolean DEFAULT false,
    attempts integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    verified_at timestamp with time zone
);


ALTER TABLE public.otp_verification OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.payments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    order_id uuid,
    subscription_id uuid,
    mode text,
    gateway text,
    transaction_id text,
    merchant_order_id text,
    amount numeric(10,2) NOT NULL,
    currency text DEFAULT 'INR'::text,
    status text DEFAULT 'pending'::text,
    gateway_response jsonb DEFAULT '{}'::jsonb,
    refund_id text,
    refunded_amount numeric(10,2),
    refunded_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT payments_gateway_check CHECK ((gateway = ANY (ARRAY['phonepe'::text, 'razorpay'::text, 'paytm'::text, 'manual'::text]))),
    CONSTRAINT payments_mode_check CHECK ((mode = ANY (ARRAY['upi'::text, 'card'::text, 'wallet'::text, 'netbanking'::text, 'cod'::text]))),
    CONSTRAINT payments_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'initiated'::text, 'success'::text, 'failed'::text, 'refunded'::text])))
);


ALTER TABLE public.payments OWNER TO supabase_admin;

--
-- Name: TABLE payments; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.payments IS 'Payment transactions for orders and subscriptions';


--
-- Name: product_addons; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.product_addons (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    product_id uuid,
    name text NOT NULL,
    price numeric(10,2) NOT NULL,
    image text,
    is_veg boolean DEFAULT true,
    max_quantity integer DEFAULT 1,
    is_available boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.product_addons OWNER TO supabase_admin;

--
-- Name: TABLE product_addons; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.product_addons IS 'Extra toppings and additions for products';


--
-- Name: product_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_subscriptions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    vendor_id uuid,
    subscription_name text NOT NULL,
    frequency text NOT NULL,
    duration_weeks integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    amount_per_delivery numeric(10,2) NOT NULL,
    status text DEFAULT 'active'::text NOT NULL,
    delivery_time text,
    delivery_days integer[],
    delivery_address jsonb NOT NULL,
    payment_id text,
    payment_method text,
    payment_status text DEFAULT 'pending'::text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    menu_ids uuid[],
    next_delivery_date date,
    per_delivery_amount numeric(10,2),
    auto_renew boolean DEFAULT false,
    pause_start_date date,
    pause_end_date date,
    pause_reason text,
    skip_dates date[]
);


ALTER TABLE public.product_subscriptions OWNER TO postgres;

--
-- Name: product_variants; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.product_variants (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    product_id uuid,
    name text NOT NULL,
    price numeric(10,2) NOT NULL,
    calories integer,
    image text,
    is_default boolean DEFAULT false,
    is_available boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.product_variants OWNER TO supabase_admin;

--
-- Name: TABLE product_variants; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.product_variants IS 'Product size options like Small, Medium, Large';


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    vendor_id uuid,
    name text NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    image_url text,
    category text NOT NULL,
    tags text[],
    is_available boolean DEFAULT true,
    preparation_time integer DEFAULT 15,
    nutritional_info jsonb,
    ingredients text[],
    allergens text[],
    portion_size text,
    spice_level text,
    is_featured boolean DEFAULT false,
    sort_order integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    thumbnail text,
    gallery_images text[],
    video_url text,
    type text DEFAULT 'veg'::text,
    discount_price numeric(10,2),
    discount_percent integer,
    is_bestseller boolean DEFAULT false,
    calories integer,
    serves integer DEFAULT 1,
    stock_quantity integer,
    max_order_qty integer DEFAULT 10,
    min_order_qty integer DEFAULT 1,
    available_days integer[],
    rating numeric(2,1),
    review_count integer DEFAULT 0,
    addon_ids uuid[] DEFAULT '{}'::uuid[],
    is_veg boolean DEFAULT true
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: COLUMN products.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.type IS 'veg, non-veg, or egg';


--
-- Name: COLUMN products.addon_ids; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.products.addon_ids IS 'List of product IDs that are addons for this product';


--
-- Name: promo_banners; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.promo_banners (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    subtitle text,
    image_url text NOT NULL,
    mobile_image_url text,
    link_type text,
    link_target_id uuid,
    link_url text,
    "position" text DEFAULT 'hero'::text,
    sort_order integer DEFAULT 0,
    start_date timestamp with time zone DEFAULT now(),
    end_date timestamp with time zone,
    is_active boolean DEFAULT true,
    clicks integer DEFAULT 0,
    impressions integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT promo_banners_link_type_check CHECK ((link_type = ANY (ARRAY['vendor'::text, 'product'::text, 'category'::text, 'meal_plan'::text, 'url'::text]))),
    CONSTRAINT promo_banners_position_check CHECK (("position" = ANY (ARRAY['hero'::text, 'middle'::text, 'bottom'::text])))
);


ALTER TABLE public.promo_banners OWNER TO supabase_admin;

--
-- Name: TABLE promo_banners; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.promo_banners IS 'Homepage promotional banners';


--
-- Name: referrals; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.referrals (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    referrer_id uuid,
    referee_id uuid,
    referral_code text NOT NULL,
    status text DEFAULT 'pending'::text,
    referrer_reward numeric(10,2) DEFAULT 50,
    referee_reward numeric(10,2) DEFAULT 50,
    first_order_id uuid,
    completed_at timestamp with time zone,
    expires_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT referrals_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'completed'::text, 'expired'::text])))
);


ALTER TABLE public.referrals OWNER TO supabase_admin;

--
-- Name: TABLE referrals; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.referrals IS 'User referral tracking';


--
-- Name: review_votes; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.review_votes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    review_id uuid,
    user_id uuid,
    is_helpful boolean NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.review_votes OWNER TO supabase_admin;

--
-- Name: TABLE review_votes; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.review_votes IS 'Helpful/Not helpful votes on reviews';


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.reviews (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    vendor_id uuid,
    product_id uuid,
    order_id uuid,
    rating integer NOT NULL,
    comment text,
    images text[] DEFAULT '{}'::text[],
    is_verified_purchase boolean DEFAULT false,
    status text DEFAULT 'published'::text,
    vendor_reply text,
    replied_at timestamp with time zone,
    helpful_count integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5))),
    CONSTRAINT reviews_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'published'::text, 'hidden'::text, 'removed'::text])))
);


ALTER TABLE public.reviews OWNER TO supabase_admin;

--
-- Name: TABLE reviews; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.reviews IS 'User reviews for vendors and products';


--
-- Name: search_logs; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.search_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    query text NOT NULL,
    results_count integer DEFAULT 0,
    clicked_product_id uuid,
    clicked_vendor_id uuid,
    device_type text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.search_logs OWNER TO supabase_admin;

--
-- Name: TABLE search_logs; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.search_logs IS 'Search analytics';


--
-- Name: subscription_deliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription_deliveries (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    subscription_id uuid,
    order_id uuid,
    scheduled_date date NOT NULL,
    delivery_status text DEFAULT 'scheduled'::text,
    delivered_at timestamp with time zone,
    notes text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.subscription_deliveries OWNER TO postgres;

--
-- Name: subscription_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    subscription_id uuid,
    product_id uuid,
    product_name text NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.subscription_items OWNER TO postgres;

--
-- Name: support_tickets; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.support_tickets (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    order_id uuid,
    subject text NOT NULL,
    description text NOT NULL,
    category text,
    priority text DEFAULT 'medium'::text,
    status text DEFAULT 'open'::text,
    assigned_to text,
    attachments text[] DEFAULT '{}'::text[],
    resolution text,
    resolved_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT support_tickets_category_check CHECK ((category = ANY (ARRAY['order'::text, 'payment'::text, 'delivery'::text, 'refund'::text, 'other'::text]))),
    CONSTRAINT support_tickets_priority_check CHECK ((priority = ANY (ARRAY['low'::text, 'medium'::text, 'high'::text, 'urgent'::text]))),
    CONSTRAINT support_tickets_status_check CHECK ((status = ANY (ARRAY['open'::text, 'in_progress'::text, 'resolved'::text, 'closed'::text])))
);


ALTER TABLE public.support_tickets OWNER TO supabase_admin;

--
-- Name: TABLE support_tickets; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.support_tickets IS 'Customer support tickets';


--
-- Name: user_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_addresses (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    type public.address_type NOT NULL,
    label character varying(50),
    street character varying(200) NOT NULL,
    area character varying(100),
    landmark character varying(15),
    full_address text NOT NULL,
    city character varying(50) DEFAULT 'Coimbra'::character varying NOT NULL,
    state character varying(50) DEFAULT 'Coimbra'::character varying NOT NULL,
    country character varying(50) DEFAULT 'Portugal'::character varying NOT NULL,
    postal_code character varying(10),
    latitude numeric(10,8),
    longitude numeric(11,8),
    delivery_instructions text,
    is_default boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    custom_label text,
    zipcode text,
    delivery_notes text
);


ALTER TABLE public.user_addresses OWNER TO postgres;

--
-- Name: user_favorites; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.user_favorites (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    vendor_id uuid,
    product_id uuid,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.user_favorites OWNER TO supabase_admin;

--
-- Name: TABLE user_favorites; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.user_favorites IS 'User saved vendors and products';


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    phone text NOT NULL,
    name text,
    email text,
    verified boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    profile_image text,
    date_of_birth date,
    gender text,
    language_preference text DEFAULT 'en'::text,
    dietary_preference text[],
    allergies text[],
    health_goals text[],
    referral_code text,
    referred_by uuid,
    total_orders integer DEFAULT 0,
    total_spent numeric(12,2) DEFAULT 0,
    loyalty_points integer DEFAULT 0,
    membership_tier text DEFAULT 'bronze'::text,
    device_tokens text[],
    last_order_at timestamp with time zone,
    last_login_at timestamp with time zone,
    is_blocked boolean DEFAULT false,
    blocked_reason text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: COLUMN users.referral_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.referral_code IS 'User unique referral code for inviting friends';


--
-- Name: COLUMN users.loyalty_points; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.loyalty_points IS 'Points earned from orders';


--
-- Name: vendor_delivery_zones; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.vendor_delivery_zones (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    vendor_id uuid,
    zone_id uuid,
    delivery_fee numeric(10,2) DEFAULT 0,
    min_delivery_time integer DEFAULT 20,
    max_delivery_time integer DEFAULT 35,
    minimum_order numeric(10,2) DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.vendor_delivery_zones OWNER TO supabase_admin;

--
-- Name: TABLE vendor_delivery_zones; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.vendor_delivery_zones IS 'Vendor to zone mapping with custom fees';


--
-- Name: vendor_leads; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.vendor_leads (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    kitchen_name text NOT NULL,
    contact_name text NOT NULL,
    phone text NOT NULL,
    email text,
    city text NOT NULL,
    food_type text,
    status text DEFAULT 'open'::text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    remarks text,
    CONSTRAINT vendor_leads_status_check CHECK ((status = ANY (ARRAY['open'::text, 'in-progress'::text, 'approved'::text, 'rejected'::text])))
);


ALTER TABLE public.vendor_leads OWNER TO supabase_admin;

--
-- Name: TABLE vendor_leads; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.vendor_leads IS 'Stores potential vendor interest leads';


--
-- Name: COLUMN vendor_leads.status; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.vendor_leads.status IS 'Current status of the lead in the onboarding pipeline';


--
-- Name: vendor_payouts; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.vendor_payouts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    vendor_id uuid,
    period_start date NOT NULL,
    period_end date NOT NULL,
    gross_amount numeric(10,2) NOT NULL,
    commission numeric(10,2) NOT NULL,
    tax_deducted numeric(10,2) DEFAULT 0,
    net_amount numeric(10,2) NOT NULL,
    order_count integer DEFAULT 0,
    status text DEFAULT 'pending'::text,
    payment_reference text,
    paid_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT vendor_payouts_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'processing'::text, 'completed'::text, 'failed'::text])))
);


ALTER TABLE public.vendor_payouts OWNER TO supabase_admin;

--
-- Name: TABLE vendor_payouts; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.vendor_payouts IS 'Vendor payment settlements';


--
-- Name: vendor_schedules; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.vendor_schedules (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    vendor_id uuid,
    day_of_week integer NOT NULL,
    opening_time time without time zone,
    closing_time time without time zone,
    is_closed boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT vendor_schedules_day_of_week_check CHECK (((day_of_week >= 0) AND (day_of_week <= 6)))
);


ALTER TABLE public.vendor_schedules OWNER TO supabase_admin;

--
-- Name: TABLE vendor_schedules; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.vendor_schedules IS 'Vendor weekly operating hours';


--
-- Name: vendor_special_hours; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.vendor_special_hours (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    vendor_id uuid,
    special_date date NOT NULL,
    opening_time time without time zone,
    closing_time time without time zone,
    is_closed boolean DEFAULT false,
    reason text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.vendor_special_hours OWNER TO supabase_admin;

--
-- Name: TABLE vendor_special_hours; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.vendor_special_hours IS 'Holiday closures and special hours';


--
-- Name: waitlist; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.waitlist (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    type text NOT NULL,
    target_id uuid NOT NULL,
    user_phone text,
    user_email text,
    notified boolean DEFAULT false,
    notified_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT waitlist_type_check CHECK ((type = ANY (ARRAY['product'::text, 'vendor'::text, 'zone'::text])))
);


ALTER TABLE public.waitlist OWNER TO supabase_admin;

--
-- Name: TABLE waitlist; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.waitlist IS 'Notify users when product/vendor becomes available';


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_2025_12_26; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_26 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_26 OWNER TO supabase_admin;

--
-- Name: messages_2025_12_27; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_27 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_27 OWNER TO supabase_admin;

--
-- Name: messages_2025_12_28; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_28 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_28 OWNER TO supabase_admin;

--
-- Name: messages_2025_12_29; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_29 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_29 OWNER TO supabase_admin;

--
-- Name: messages_2025_12_30; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_30 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_30 OWNER TO supabase_admin;

--
-- Name: messages_2025_12_31; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_31 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_31 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_01; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_01 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_01 OWNER TO supabase_admin;

--
-- Name: messages_2026_01_02; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2026_01_02 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2026_01_02 OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: iceberg_namespaces; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.iceberg_namespaces (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.iceberg_namespaces OWNER TO supabase_storage_admin;

--
-- Name: iceberg_tables; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.iceberg_tables (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    namespace_id uuid NOT NULL,
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    location text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.iceberg_tables OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


ALTER TABLE supabase_functions.hooks OWNER TO supabase_functions_admin;

--
-- Name: TABLE hooks; Type: COMMENT; Schema: supabase_functions; Owner: supabase_functions_admin
--

COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supabase_functions.hooks_id_seq OWNER TO supabase_functions_admin;

--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE supabase_functions.migrations OWNER TO supabase_functions_admin;

--
-- Name: messages_2025_12_26; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_26 FOR VALUES FROM ('2025-12-26 00:00:00') TO ('2025-12-27 00:00:00');


--
-- Name: messages_2025_12_27; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_27 FOR VALUES FROM ('2025-12-27 00:00:00') TO ('2025-12-28 00:00:00');


--
-- Name: messages_2025_12_28; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_28 FOR VALUES FROM ('2025-12-28 00:00:00') TO ('2025-12-29 00:00:00');


--
-- Name: messages_2025_12_29; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_29 FOR VALUES FROM ('2025-12-29 00:00:00') TO ('2025-12-30 00:00:00');


--
-- Name: messages_2025_12_30; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_30 FOR VALUES FROM ('2025-12-30 00:00:00') TO ('2025-12-31 00:00:00');


--
-- Name: messages_2025_12_31; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_31 FOR VALUES FROM ('2025-12-31 00:00:00') TO ('2026-01-01 00:00:00');


--
-- Name: messages_2026_01_01; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_01 FOR VALUES FROM ('2026-01-01 00:00:00') TO ('2026-01-02 00:00:00');


--
-- Name: messages_2026_01_02; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2026_01_02 FOR VALUES FROM ('2026-01-02 00:00:00') TO ('2026-01-03 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Data for Name: extensions; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.extensions (id, type, settings, tenant_external_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.schema_migrations (version, inserted_at) FROM stdin;
20210706140551	2025-11-13 14:03:52
20220329161857	2025-11-13 14:03:52
20220410212326	2025-11-13 14:03:52
20220506102948	2025-11-13 14:03:53
20220527210857	2025-11-13 14:03:53
20220815211129	2025-11-13 14:03:53
20220815215024	2025-11-13 14:03:53
20220818141501	2025-11-13 14:03:53
20221018173709	2025-11-13 14:03:53
20221102172703	2025-11-13 14:03:53
20221223010058	2025-11-13 14:03:53
20230110180046	2025-11-13 14:03:53
20230810220907	2025-11-13 14:03:53
20230810220924	2025-11-13 14:03:53
20231024094642	2025-11-13 14:03:53
20240306114423	2025-11-13 14:03:53
20240418082835	2025-11-13 14:03:53
20240625211759	2025-11-13 14:03:53
20240704172020	2025-11-13 14:03:53
20240902173232	2025-11-13 14:03:53
20241106103258	2025-11-13 14:03:53
20250424203323	2025-11-13 14:03:53
20250613072131	2025-11-13 14:03:53
20250711044927	2025-11-13 14:03:53
20250811121559	2025-11-13 14:03:53
20250926223044	2025-11-13 14:03:53
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.tenants (id, name, external_id, jwt_secret, max_concurrent_users, inserted_at, updated_at, max_events_per_second, postgres_cdc_default, max_bytes_per_second, max_channels_per_client, max_joins_per_second, suspend, jwt_jwks, notify_private_alpha, private_only, migrations_ran, broadcast_adapter, max_presence_events_per_second, max_payload_size_in_kb) FROM stdin;
\.


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: activity_logs; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.activity_logs (id, user_id, action, entity_type, entity_id, metadata, device_type, created_at) FROM stdin;
2bfc7a2c-f269-472c-aa3c-80740cebacbe	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 15:36:16.185545+00
b08f444a-aef5-4250-822b-0bccee88d9f3	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 15:36:21.100057+00
035d64ba-8d0d-4e1f-a94a-9cdc8d4c6ede	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 15:43:19.067573+00
df3544cc-b325-4fdb-a209-fc6339aca993	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 15:43:20.194886+00
ab9aa6cf-d3fd-478a-8286-00ba471d68ec	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 15:43:25.369123+00
1fefc980-256f-4d86-9cec-026f7acead75	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 15:56:13.142496+00
4c4cd238-ad53-43dd-9ec7-381b575b4f06	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 15:56:14.27635+00
f98a4b88-4524-489b-9f40-ed8c31c62144	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:05:24.704465+00
739c1864-416e-4ce7-ac41-22bb18a29cae	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:05:25.906444+00
ee5ccd31-3e9c-403c-a7e1-46e040a3ad49	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:08:25.260526+00
07bcff0f-5327-40c0-a925-249084922696	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:08:26.443082+00
8e9df357-cb8e-477c-8417-bed80b4dd0d7	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:11:44.39265+00
d54a9523-4a37-4b37-9526-af7b4304e4ac	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:14:36.496437+00
6fb9d1bc-a0df-47dc-8a0b-bfbcb5af3130	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:16:54.555532+00
3a4702ca-5e3f-4ab5-aac5-1d2d08b9e881	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:20:01.931449+00
9f03c643-991e-4c1e-a688-a84a0b89eaea	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:20:14.43316+00
468a289a-6c2e-453c-9859-f2aa814a4e1e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:25:33.182999+00
1e64591a-418d-411e-8890-c8fc23decb53	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:31:20.167167+00
8368d1e6-c3d9-4e2c-b9bb-1e02f8c03fcc	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:31:21.380501+00
fd0c994b-a6dd-46be-8c22-bc80e703cb19	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:42:36.315265+00
68c06c19-0571-4a42-bc07-8bc5df88c2b0	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:42:37.416962+00
add548f0-4a77-4b75-8ee2-37f22889ec5f	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:45:03.943308+00
f1c7a24b-18c6-463c-872f-da1e6502d6ae	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:49:41.364104+00
af880432-9f76-4d47-b733-6204d325543d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:49:42.60328+00
ea5f3ed8-9b47-4bcf-8760-80751bf9c476	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:58:18.493104+00
ee007db7-d537-42f0-80ab-5198ea68c87b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 16:58:19.722619+00
3ce0f454-5304-4b22-a1c8-d37ba920e992	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 17:07:59.884783+00
902c84d5-6588-4b54-a04c-0b0a695af4b7	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 17:08:01.77198+00
6410deaa-3b16-4d92-a8bd-9b50dbdc750e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 17:54:47.234499+00
072b914a-369b-4362-9799-0e8e961f7f8d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 17:54:48.590605+00
47cc7f6b-cf67-43fb-9869-233b78d859dd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 18:10:57.297113+00
1d25039d-ebd2-4314-96fc-78026e66f71f	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-04 18:20:46.407147+00
75a7c868-5eaa-42c7-adb1-a73e30e729c8	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-05 03:02:37.991217+00
9ac59df9-8244-47fb-bc79-f16820103759	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-05 03:03:31.49786+00
66cf67ed-4fa1-4e16-805f-8b58d67ba89d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 08:53:54.100958+00
e5bcb0d7-cbb8-40a5-952e-b4fd38c9ec77	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 08:58:03.887659+00
82e79c79-21b2-4147-bb0d-c1cfaef219fe	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 09:06:06.038319+00
2cda1f46-24f8-4fd5-ae88-5f113b5a0388	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 09:06:33.685182+00
0df378ce-7180-4658-85c4-6d881e405205	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 16:26:03.090176+00
be799e1a-40d3-47f1-b00a-35cf4900e463	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 16:26:09.075618+00
321b4180-aa61-407c-93ca-0fd528a04988	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 17:03:07.438895+00
0a23e16a-d7e0-4151-a5e1-6203fbc13797	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 17:03:08.535136+00
8e2a8e57-77c0-49d3-8b62-9624098b217c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 17:03:15.16066+00
be57d49c-1d4a-46c7-bfef-e1d5a0e70bbf	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 17:03:16.599339+00
9c234ec6-0e35-45f0-9d6b-0d7557aa107b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 18:15:13.343386+00
7c0c0d87-b8a7-468c-91bb-4fed6000782b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 18:27:36.760366+00
56ee6e6f-acef-41d0-b87d-ba21a747b345	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 18:27:38.006441+00
59e40465-7640-402b-bd58-261ef4f41f45	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 18:38:10.941677+00
1c4ea2bb-e009-4b99-a592-769adf40a27a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 20:52:20.573544+00
f6659f33-deb4-4c4f-880b-d05af0523b24	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 20:52:21.768194+00
6b2c6681-c43e-4778-a311-861b9da551cc	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 20:53:28.762592+00
e0e9fa4d-b54b-47b7-bca1-3efc3d522e2f	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-10 20:53:29.888709+00
c4a7ebaf-b626-466e-bb75-9619ab30491c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 05:49:48.664172+00
0e441209-18ee-47aa-8d7f-1aa32a5461d5	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 05:57:59.372066+00
dc30dd7a-8178-48b6-bae0-8d207b953f51	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 05:58:00.496693+00
c495d378-b4fc-4e16-8d24-7b1290d17453	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:24:19.617835+00
88e17db0-ff20-45d5-bdcc-fbfff6209cfa	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:24:20.854764+00
05c00ac0-e706-4c3c-8f83-2426bfb77b67	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:30:45.16528+00
56719108-904a-487f-aeaa-8baaefc07d9b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:32:28.480188+00
6a25e631-fc64-4fbb-86a1-46d6b7250e37	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:32:29.817117+00
a65e36e2-41b9-49e5-80da-5eeda50538a2	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:39:28.332052+00
95d246bd-991e-465c-8813-7aa3b7fae1e8	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:39:29.553184+00
499678a5-a040-4ea7-baec-05656db4555b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:43:22.925665+00
5e074bb7-0e02-45c1-aa32-800f06e15e16	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:55:53.621454+00
aa844b9c-0ef0-49ac-96a1-8fa6d9daa04a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:55:54.96167+00
a76566fa-73dc-4286-b9c6-077ac128fb28	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:59:30.109039+00
ade7d621-8b3c-4977-a323-1a1c3deecb17	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 06:59:31.442197+00
cb019963-f4bf-4eb6-b1fe-f1602c173f61	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:08:22.793453+00
21e048ba-87e1-4fd0-b4e6-358c7c8389a3	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:08:24.130032+00
d1453e34-b1a9-4e3a-8a07-745f42aad222	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:18:36.931556+00
dc01365b-2317-438d-861b-1ef625c2d4de	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:18:38.123427+00
3a48e191-da27-475b-9ee9-b89a19614476	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:28:41.67199+00
b4d82b8d-b260-476d-9f79-4846db9b92b9	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:28:42.816382+00
8d654910-9d79-4a30-a2f2-4c3a72ca204a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:34:53.390019+00
40c5f503-094b-470a-9554-ccb7b7cdf838	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:34:54.614671+00
687d02b2-9ce3-4ec4-bdb0-ad73083b7cf0	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:38:41.026272+00
7fc31f87-d2d2-46b9-a822-16f7a6b1ffeb	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:38:42.56354+00
40ea45b1-6870-42e7-9049-96ecdda1e340	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:57:23.972446+00
f106a886-a8af-49bc-af89-8bf44c6c2edd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 07:57:25.189907+00
4661be7e-483a-4d98-a483-192b85d450e9	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 08:29:08.310898+00
d14bc7bc-ce32-4651-b255-a39b6519093a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 08:29:09.532123+00
740bafeb-1ecc-4254-8d3f-321ccccdc3af	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 08:37:40.213986+00
132b2ea3-460f-43ca-8460-041b0bdf560f	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 08:37:42.055918+00
df722e5d-7b13-473d-942e-e2d8578f45f1	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 08:44:35.850065+00
71b7ae78-5913-4b27-bf99-678a6f2b7d07	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 08:44:37.079999+00
ddcfc824-19fd-45e7-b459-9e245aeeb4cb	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 08:54:57.1897+00
ba92400d-4996-4868-ba9f-5157c8eb59e8	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 08:54:58.551831+00
72852322-4d01-406e-9ffe-d44c678c3b17	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 08:59:40.232183+00
a6378ba8-51e1-439e-bc7f-a0f23ab95714	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 08:59:41.510684+00
7f7b6721-a55d-41eb-ad4c-d07782e28ff7	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 09:03:03.436758+00
3209271c-1a0f-493a-bb0c-b5dcaa03fa63	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 09:03:04.649783+00
9c8516dc-334d-46e1-a6da-c6ea2bdce4df	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 09:24:23.120023+00
7ba6093d-e2b1-4011-9492-1037de74664e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 09:59:00.80788+00
6bc9f6d4-37f7-4380-acd0-83ad5cbd5668	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 10:11:53.055204+00
d73a388e-b157-468e-9fa5-ddc6db9737dc	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 10:11:54.287231+00
72a0d7fa-c671-409d-821a-badc153fd3b7	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 10:18:01.394553+00
114118e1-66a4-4b51-bbf6-5a36a2e7f8dc	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 10:18:02.718065+00
73cd4fcc-5f9e-4e2f-aa36-e41227ce2831	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 11:17:06.297825+00
16656d95-cea8-411e-9a4c-6ff0caf55492	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 11:17:07.504655+00
18a050db-e8e1-49e2-9188-44650a5e597d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 11:24:09.217881+00
25563365-26b2-4876-b6c9-7647e9518d5e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 11:24:10.550035+00
fa326636-7b35-4211-8e8b-2d999a5648c7	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 12:36:55.519974+00
e8a8be72-1d52-4aaa-885a-13d247ced5e5	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 12:36:56.718785+00
ab59d6f3-f7a0-488f-b8c5-4eda785f4479	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 13:06:17.493957+00
c375e630-f409-4a88-a254-61869c38b124	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Special Masala Dosa"}	\N	2026-01-11 13:06:18.705602+00
f2d2a4ce-161f-4caa-a860-64b089770779	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 13:32:09.185452+00
f0a013f0-b38b-4754-bc7d-765c705580fd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 13:40:19.257847+00
d4728962-092b-4894-8a2d-722b98b49c88	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 13:43:10.808702+00
b6b33f6c-3396-4e56-bff1-b82726f8b71a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 13:52:26.523283+00
d9090b87-b3c5-47df-a469-1c018e8be9e4	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 13:56:19.477792+00
57d044f8-e37c-464c-a1c5-b8cd4ce4ebaa	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 13:56:19.792543+00
d2d1574a-a854-42e1-8a91-265100949488	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 14:00:39.323122+00
77d4ca52-156e-4de5-91f2-394276ef4122	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 14:08:09.665778+00
1ffb6018-37ed-423d-a04c-f90c4faea3c4	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 14:08:18.010782+00
da286dfb-ad8d-4bbd-894b-33a6cec83ae3	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 14:15:24.944583+00
e5d64fc7-7c28-4d4e-8979-a758cf015610	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 14:18:35.185202+00
c710600e-4d8f-460e-9a31-122d6217bc60	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-11 14:18:35.491522+00
cf2a8fbd-f6a9-402b-aebd-fa2f77553ecc	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 07:17:10.781603+00
34a9d4c5-670f-47bd-95ed-2dc1a3f2ba10	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 07:21:54.764079+00
4420b462-10d4-4bf5-a468-7cffe4af82e3	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 07:21:56.229178+00
0fac97bc-fc9d-4396-8c1e-3b873c776c35	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 08:16:59.538258+00
e647389f-ee3f-4fd8-8e16-abb846576cda	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 08:17:00.664908+00
006d23f0-c0e3-4423-a676-71d7dae0be91	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 09:00:55.607675+00
142428c8-6766-4c1a-96e4-e25aff147af6	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 09:04:13.159481+00
d344a378-bed2-4aab-ba91-bcb5329a19a2	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 09:04:14.309179+00
c1f2527a-db49-4884-b804-df2e5b6abbce	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 09:16:32.56155+00
8ddcc87b-181d-48ca-8437-2f6cedfac775	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 09:22:16.653407+00
bb692239-4f40-4ba2-954d-1ab2070a7129	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 09:30:21.986071+00
972cdca6-2143-475f-bfc3-01638adbacba	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 09:41:57.711712+00
133f7539-50b4-4498-b473-20e8756607e9	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 09:41:58.819686+00
74afa3af-37db-4525-9dfe-4054bccc5e3b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 09:47:29.321292+00
19a61914-06db-4c59-a289-94e20afa04d4	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 09:47:30.433537+00
a1c14ca6-689b-4bf8-b532-18c2c18528e4	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 10:06:07.893982+00
eee54afd-c132-4678-b5ef-bf2f064084c4	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 10:13:18.163015+00
20f1d9b8-3958-49f2-b3d7-1bc29d491833	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 10:13:19.291788+00
68a9c613-ddb5-4880-a7df-0f5b3fd221ba	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 10:58:29.840671+00
23b18db0-4552-49a1-9441-dd76ec96bc86	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 11:20:58.660426+00
65fe33d3-09a6-4859-b350-40da1cf0e3f3	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 11:20:59.994742+00
c8046f24-8135-4ad1-a3d2-70aa342a5bd5	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 11:34:54.678441+00
2649280c-cefd-4daf-8f96-ac97a793c283	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 11:48:36.345932+00
8b6887b9-08d6-45db-bb2a-e71e2219ad5a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 11:48:37.557994+00
df460be6-aa7a-4098-a7d0-c2b28fd51d84	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 12:08:32.6071+00
b5e8c14d-f072-4237-ad6c-b13f8cb7cd7b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 12:08:34.003394+00
0ebb0104-c92d-482b-8658-82d2a3b33120	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 12:30:33.346763+00
51968857-2abf-4afa-8778-2d0f7ce54173	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 16:35:20.837602+00
a257513d-cd51-404f-8e9f-8eaef3aa8aff	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-16 16:35:22.047998+00
8aa93e2d-15a5-4d27-a767-6aac0268fc48	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 03:20:03.400458+00
9255023c-f3c5-4ebe-9432-251a133530aa	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 03:52:26.238401+00
e0f3ecb2-2246-4f26-b69b-72cca46aed33	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 03:52:27.453062+00
47e89005-3d02-49fa-be21-2758805ff8c0	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 03:59:55.114494+00
faf1ed34-3424-408d-9388-37b62d2c3e34	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 04:00:34.152602+00
f7b2db18-c77d-42fa-a5b3-2c8bd89ea33c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 04:00:34.463964+00
3706dcc4-31fd-4dea-b559-262c782c4ea5	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 04:01:20.830946+00
4184bfff-df8c-4803-a101-80e34d2e2abd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 04:04:13.569426+00
00aecb6b-2cbb-4dd4-bd49-3accce546931	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 04:05:52.96271+00
abccfafa-6e54-4aaa-814d-551263b215dd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 04:20:08.10439+00
422eb735-a9c9-4e32-a261-2aeb65d07b4c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 04:20:58.185992+00
e44cddd6-71ea-43f9-9b23-256c5a180694	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 04:41:52.907558+00
e79cfa6c-ef4e-4a0e-8f77-b77e6d3f0d0e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 04:41:53.2781+00
64c6b8d4-bbe3-4a9f-b946-e10a08bddce6	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 05:31:49.130482+00
88ba2648-4970-4389-9d4b-efcc0ebb2ef2	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 09:01:34.861836+00
613beae5-10a4-4b67-92c6-4853f6a5d57b	d95651a4-be8c-4144-acd7-40c6acf5df35	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-18 06:19:12.198809+00
e26a8795-725c-49ba-b85c-403d6dc99525	d95651a4-be8c-4144-acd7-40c6acf5df35	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-18 06:20:24.009595+00
d6b12b4f-311d-44d3-8e3f-a15cbdcfa80b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-18 06:34:43.7385+00
2e21b375-500f-414a-89ba-a855e0661055	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-18 06:34:44.934425+00
878b4abe-f4d5-4cad-94cd-b878ca8d182c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-18 06:37:01.97173+00
1b75aa81-50ff-4a9f-a816-daa28b3e92c4	\N	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-17 09:04:28.349835+00
b11cc5b0-0c22-4c8d-aa98-5275ef8c1431	d95651a4-be8c-4144-acd7-40c6acf5df35	view_product	product	69430b40-976f-4428-a04c-3506b8158ab2	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50e", "product_name": "Gutzo Test"}	\N	2026-01-18 07:39:15.836542+00
740b65bb-f2bb-49a1-b361-0ae1db0009fa	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab2	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50e", "product_name": "Gutzo Test"}	\N	2026-01-18 07:40:42.540942+00
8c02943f-0e65-48c9-9a78-578890d9e607	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab3	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50f", "product_name": "Gutzo Test"}	\N	2026-01-18 07:45:49.651797+00
e7f648b8-e313-491c-ab6d-6d85f73337c4	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab3	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50f", "product_name": "Gutzo Test"}	\N	2026-01-18 07:45:50.867472+00
0ad36fd7-4983-4c02-aa4c-1ef25376e61d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab1	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50d", "product_name": "Gutzo Test"}	\N	2026-01-18 07:52:26.112978+00
450e2fd4-859e-4a54-be27-72f8434dd226	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab1	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50d", "product_name": "Gutzo Test"}	\N	2026-01-18 07:52:27.474876+00
d91c0249-89d8-4deb-8375-85c3da03d432	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-18 07:58:41.536327+00
7b774279-842e-42d3-b211-e8f129509675	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-18 07:58:42.852043+00
2d5e1f03-144a-44a2-a657-1151cf5a0777	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-18 08:06:06.059893+00
98e4ccc7-89fe-4e17-b01e-d301c5a87741	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	view_product	product	69430b40-976f-4428-a04c-3506b8158ab0	{"vendor_id": "3109c7d3-95e0-4a7a-86dd-9783e778d50c", "product_name": "Gutzo Test"}	\N	2026-01-18 08:06:07.532821+00
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, user_phone, product_id, vendor_id, quantity, created_at, updated_at, variant_id, addons, special_instructions) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, description, image_url, icon_name, sort_order, is_active, created_at, banner_url, parent_category_id, slug, is_featured) FROM stdin;
38c74be4-10cd-4cc8-b8f0-ca7cf386c730	Salads	\N	https://storage.googleapis.com/gutzo/category/salads.png	\N	1	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
594c03cb-653d-43c6-8cd5-165487ca9196	Smoothies	\N	https://storage.googleapis.com/gutzo/category/smoothies.png	\N	2	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
d84a30a7-8b90-4950-a23f-bbe4124261db	Bowls	\N	https://storage.googleapis.com/gutzo/category/bowls.png	\N	3	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
e49c0bc4-a3c1-40c3-bf93-7290dbbc4181	Protein	\N	https://storage.googleapis.com/gutzo/category/protein.png	\N	4	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
8ace91c9-bd51-4787-8c10-e5436a61bd83	Wraps	\N	https://storage.googleapis.com/gutzo/category/wraps.png	\N	5	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
a12862ff-cfdf-4d74-9f6a-afce7dd275a1	Juices	\N	https://storage.googleapis.com/gutzo/category/juices.png	\N	6	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
7d8c8c21-28f2-4f70-b53a-aa49d924da77	Oats	\N	https://storage.googleapis.com/gutzo/category/oats.png	\N	7	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
01c90458-aa88-496f-b2eb-3988e0640fec	Breakfast	\N	https://storage.googleapis.com/gutzo/category/breakfast.png	\N	8	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
d588e7c1-3348-4611-838e-fef0567ff832	Low-Cal	\N	https://storage.googleapis.com/gutzo/category/lowcal.png	\N	9	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
d25bf6b0-9df4-4407-a5b7-6090463a5138	Soups	\N	https://storage.googleapis.com/gutzo/category/soups.png	\N	10	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
34e60f82-0d35-4668-ad16-9d278209efa9	Snacks	\N	https://storage.googleapis.com/gutzo/category/snacks.png	\N	11	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
f0e86853-06e7-420d-b81a-43ef3f3dcd88	Fruits	\N	https://storage.googleapis.com/gutzo/category/fruits.png	\N	12	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
f58012be-0b22-45cd-9ac9-c520a25347b3	Detox	\N	https://storage.googleapis.com/gutzo/category/detox.png	\N	13	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
9616fc93-c646-4193-aa0b-f314876f9b08	Fit Meals	\N	https://storage.googleapis.com/gutzo/category/fitmeals.png	\N	14	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
f7358447-a096-4763-b99d-64bf2e813f7a	Keto	\N	https://storage.googleapis.com/gutzo/category/keto.png	\N	15	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
b779e062-ad63-448e-815e-707e387bf430	Vegan	\N	https://storage.googleapis.com/gutzo/category/vegan.png	\N	16	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
34764e6b-8cac-4786-9e49-f00d26fda0af	Specials	\N	https://storage.googleapis.com/gutzo/category/specials.png	\N	17	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
fff1c898-3b5d-42c9-b3b6-261f02ca4365	Combos	\N	https://storage.googleapis.com/gutzo/category/combos.png	\N	18	t	2025-12-21 17:39:28.482243+00	\N	\N	\N	f
\.


--
-- Data for Name: coupon_usage; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.coupon_usage (id, coupon_id, user_id, order_id, discount_applied, used_at) FROM stdin;
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.coupons (id, code, name, description, discount_type, discount_value, minimum_order, maximum_discount, usage_limit, usage_per_user, used_count, valid_from, valid_until, is_active, vendor_id, applicable_categories, first_order_only, created_at) FROM stdin;
\.


--
-- Data for Name: deliveries; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.deliveries (id, order_id, partner_id, external_order_id, status, rider_name, rider_phone, rider_coordinates, pickup_otp, delivery_otp, tracking_url, meta_data, created_at, updated_at, courier_request_payload, courier_response_payload, history, rider_id, cancellation_reason, cancelled_by) FROM stdin;
a4c1deab-0e44-4880-a19a-bf18caa15fc1	7ef2bc75-9612-4bb7-909a-a48944998cdd	shadowfax	725423668	searching_rider	\N	\N	\N	1414	4476	\N	{}	2026-01-18 07:39:21.731315+00	2026-01-18 07:39:21.731315+00	{}	{}	[]	\N	\N	\N
811a22fa-7fb9-49a5-9fc1-67a241fd30f3	e9471937-ed88-4fc2-8efb-b5682bbc37d8	shadowfax	725426296	searching_rider	\N	\N	\N	1305	2510	\N	{}	2026-01-18 07:40:49.983854+00	2026-01-18 07:40:49.983854+00	{}	{}	[]	\N	\N	\N
711d2488-9940-472f-8198-34a9278f4219	565aed50-124e-45e1-9bc8-a27c6ae60f31	shadowfax	725436919	searching_rider	\N	\N	\N	8051	6085	\N	{}	2026-01-18 07:45:56.810382+00	2026-01-18 07:45:56.810382+00	{}	{}	[]	\N	\N	\N
7575cd14-d0c8-4d1a-8726-30870ff4d864	bc2b9fec-4cfd-4624-bd99-3f385c0390d9	shadowfax	725451368	searching_rider	\N	\N	\N	1320	6353	\N	{}	2026-01-18 07:52:36.863363+00	2026-01-18 07:52:36.863363+00	{}	{}	[]	\N	\N	\N
e590056b-d9f8-4139-bd51-dc98d92b1f2c	2913c742-0455-43c4-a4b9-c198171e552b	shadowfax	725464663	searching_rider	\N	\N	\N	8362	6295	\N	{}	2026-01-18 07:58:50.144462+00	2026-01-18 07:58:50.144462+00	{}	{}	[]	\N	\N	\N
a6c83553-d9f4-4461-bd36-8674e02b5663	56724be7-1194-4176-a3e1-ee17841eff2b	shadowfax	725480783	searching_rider	\N	\N	\N	3117	8910	\N	{}	2026-01-18 08:06:18.653419+00	2026-01-18 08:06:18.653419+00	{}	{}	[]	\N	\N	\N
\.


--
-- Data for Name: delivery_zones; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.delivery_zones (id, name, city, state, center_lat, center_lng, radius_km, polygon, is_active, created_at) FROM stdin;
\.


--
-- Data for Name: inventory_logs; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.inventory_logs (id, product_id, vendor_id, change_type, quantity_change, quantity_before, quantity_after, reason, created_by, created_at) FROM stdin;
\.


--
-- Data for Name: kv_store_6985f4e9; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kv_store_6985f4e9 (key, value) FROM stdin;
\.


--
-- Data for Name: meal_plan_calendar; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.meal_plan_calendar (id, meal_plan_id, menu_date, breakfast_template_id, breakfast_template_code, lunch_template_id, lunch_template_code, dinner_template_id, dinner_template_code, snack_template_id, snack_template_code, is_available, total_calories, notes, created_at, updated_at) FROM stdin;
6e9b20bc-f3d8-40b4-a843-734d1e8725ac	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-19	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
8d2ca7c7-995f-41b5-9c6d-8090ab9059b9	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-20	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
7c3f0b92-15f6-4a0e-a880-baf1f5b4a9de	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-21	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
92f0ebca-794b-422a-9e52-22b63d88f42b	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-22	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
93e7fd88-e694-479c-9f70-14baa75dbef5	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-23	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
48dfe2df-ccff-4623-9418-189e2a2a4879	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-24	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
0052d539-a784-4861-a099-81d278cbea2f	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-26	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
3a581486-e167-4e1e-a607-90456b1c7e3a	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-27	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
f1bd49f9-7baf-46cd-bffc-7c826126410e	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-28	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
40cddfb3-f512-4c4c-8f56-912fa8d6c75e	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-29	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
8ce8e20a-fce5-402f-85df-8e25e11ebbd7	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-30	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
0651b91a-4d62-4365-8926-744b76bf0ac3	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-01-31	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
45a12f17-4c57-486f-9cab-6f74dad00d82	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-02	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
c6b01461-265c-48c2-a910-6c78569bd75c	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-03	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
9b1e3229-1731-441d-bcbd-cbc54c21f9f0	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-04	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
db036635-cfd6-4ba6-b099-1652fe90e07e	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-05	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
931c507a-80fb-48d4-98c4-f2fb6e8fb96b	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-06	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
8ff91154-22f5-4a34-8b4f-6224c7f6b15b	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-07	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
38586222-2f3f-4863-9004-724b2295676a	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-09	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
8b0f7ee1-9a2f-4c40-a398-91a24d5f8f03	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-10	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
da9f26c6-df89-45b8-9929-ec1db2c5a889	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-11	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
f980f9ce-9cef-4926-94f0-101f6eb05bb9	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-12	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
f426d1d8-5be6-4d92-bf1d-6c6c4d4b0942	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-13	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
657bd6d6-6960-4e85-ad09-c27c5a0fd139	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-14	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
06463c71-1463-4c6e-8884-e6a561a84dc9	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-16	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
8ccfb2e1-0c66-47c7-8e10-878af5592aee	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-17	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
968e4de2-4848-4336-b4c4-5fa62c51bbc6	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-18	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
70e22079-b748-4d17-b41b-02d779060727	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-19	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
c11ea0db-851e-4a18-bbca-175b806fe119	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-20	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
380c56b9-f85a-4883-bd08-3b7ebe2cd2f6	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-21	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
838a092b-d245-4ee9-b176-00f4fe8c7870	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-23	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
bdc11802-8247-480b-b482-a1d8d26a8922	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-24	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
03e5bc8d-dc8a-4cc4-a1af-4096c050af6e	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-25	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
92cbd135-fe1b-4c9c-ab5c-9d053fa9c4e1	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-26	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
33d9b401-56ba-41f8-8154-ed15144b81d0	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-27	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
2bc5dfb0-2cc4-49f1-8ca2-d3980938e26d	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-02-28	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
a7caf3e5-5a32-4f79-b4e5-d40e8c2ccfdf	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-02	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
2661ac10-7e2f-4e43-bc99-73bfedec336e	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-03	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
2513e311-3cf0-48db-befb-4a74132fc715	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-04	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
ecac4208-8980-4a90-a0b4-ca25cd7d95d6	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-05	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
6ba4bda4-30d9-4572-9128-add0c92d59c1	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-06	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
9276e2fb-c10a-4dcc-bf34-238ab60d38f1	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-07	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
05591682-7ca4-4215-9ed2-4aa55a604bd5	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-09	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
d3c0873a-afba-4e07-bcda-8234b29f3279	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-10	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
8c03866a-6804-40a5-91a9-69ccf559de39	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-11	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
07ef33bf-3dc5-448e-849f-b396bd009be4	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-12	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
ef787462-ce46-450a-9d40-38e433ce8001	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-13	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
5e219728-44d4-4279-82ea-7a8e5b80a850	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-14	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
b01e94dc-de72-4f5a-b081-9daad7051ded	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-16	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
9bde1acf-2723-42bf-aa44-d73318f20ddb	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-17	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
791d9528-949a-4639-9a1d-e7b9b3b1f6ba	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-18	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
468691a7-b31f-441b-a3d8-95a5a7d7d33c	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-19	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
eac8fc7e-ca46-4dfb-b778-090f0e77e404	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-20	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
d097dc16-64e5-4ff8-83f0-8ca0cde6b499	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-21	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
98978e5f-a806-4418-b267-b6d144938c24	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-23	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
dc6107a1-893b-4daa-baf6-6b8a17592b63	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-24	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
025cba20-84bd-4bf9-ad3c-0d13d8ab3649	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-25	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
8bc9bce9-c27b-45fc-8c19-158f735220b0	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-26	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
17624bd3-5526-40ec-9f9f-d6317fef5123	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-27	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
3839ac20-2cab-4555-b7db-532dd96b4189	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-28	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
990e5725-0832-4ecc-87fe-25acf99369f6	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-30	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
f0c3e49e-2bcc-4496-804e-63abd4830a2e	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-03-31	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
45be73ff-30c6-4327-946b-fcaa4439e3bc	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-01	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
3389e6f5-63d5-4d4e-a11c-54e4274c605f	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-02	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
2f4d9046-4d23-49c3-bdb3-2beff0e45825	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-03	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
18498be2-574a-4bc3-8318-8dde2864fe9d	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-04	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
fc16a212-0469-4eb2-902f-b494bced8d51	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-06	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
977b9c4a-85a3-46c8-be5a-16df198b8ad5	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-07	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
5e466280-5c4f-4345-861b-6891a8a5f6d5	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-08	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
285d8060-9ad7-4069-8d76-8a87a75ff81f	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-09	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
961785cd-9962-48ba-8bb2-813967ff0960	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-10	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
5d7c7a09-9882-4f33-a370-ba1e8765ccf3	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-11	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
96e27232-f73a-45ee-a33b-87ed0bdb99c3	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-13	c1d9ff65-32e9-400d-97fa-29f84e211b20	GZ_4	0df99228-114d-414f-bd25-0b84ca68f41d	GZ_9	b9ff51b7-39fb-4b6b-996a-49921cfa06cd	GZ_18	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
080b0efb-02b1-4e90-b44f-a8eab1a09d7a	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-14	dfa870a8-1896-401c-8df0-e504b7fd5170	GZ_1	1f425562-c06c-461a-999e-bffcbd0141ec	GZ_12	491e2628-53ad-4415-a8ee-d816b33506d7	GZ_15	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
e27eb6f0-5f07-47c5-9e42-2cc842570f8c	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-15	c5d6bb45-5a7a-4786-9976-971d8b35ba32	GZ_3	b621bc31-6481-4eb8-b5b1-1a540253f803	GZ_11	8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	GZ_14	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
4415ba05-0ee2-4f2e-adc0-7871a6385cab	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-16	c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	GZ_6	5679784a-9890-4062-a0c0-6c997c8c84c4	GZ_10	7a75a0fc-48af-4646-9f0b-62e7ac5db324	GZ_17	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
c98e6e06-91f5-40db-83a7-5c6445ee31f3	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-17	f36f5501-78f2-4980-8a4b-acca958e1d84	GZ_5	7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	GZ_7	57dd23cb-6058-41a5-b111-ce00b66565fb	GZ_16	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
a70c3122-0479-4c5c-915c-86d7d3c31d8d	096215ff-d15a-40ee-adc9-5f19c68b107f	2026-04-18	bd7ae0cd-32fe-4433-b4e5-7e86ea213733	GZ_2	368a135b-cc58-4383-a95e-a95485e88804	GZ_8	97f8f799-8670-4159-8634-8200e6733554	GZ_13	\N	\N	t	\N	\N	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
\.


--
-- Data for Name: meal_plan_day_menu_backup; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.meal_plan_day_menu_backup (id, meal_plan_id, day_of_week, day_name, day_theme, breakfast_product_id, breakfast_image, lunch_product_id, lunch_image, dinner_product_id, dinner_image, snack_product_id, snack_image, total_calories, notes, created_at, breakfast_item, lunch_item, dinner_item, snack_item) FROM stdin;
97e8e924-2cd8-4dc2-a4e3-2f7427b1a5c1	096215ff-d15a-40ee-adc9-5f19c68b107f	1	Monday	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	2026-01-18 08:53:49.298886+00	Protein Pancakes with Greek Yogurt	Grilled Chicken Breast with Quinoa & Veggies	Salmon with Sweet Potato & Broccoli	\N
058caf93-050f-4626-b05f-c1a7bd0cacc0	096215ff-d15a-40ee-adc9-5f19c68b107f	2	Tuesday	\N	\N	\N	\N	\N	\N	\N	\N	\N	1950	\N	2026-01-18 08:53:49.298886+00	Egg White Omelette with Spinach & Mushrooms	Turkey Meatballs with Brown Rice	Grilled Fish with Asparagus & Cauliflower Rice	\N
54ef37c7-96d4-46f7-97a2-5c57e73d4928	096215ff-d15a-40ee-adc9-5f19c68b107f	3	Wednesday	\N	\N	\N	\N	\N	\N	\N	\N	\N	2050	\N	2026-01-18 08:53:49.298886+00	Overnight Oats with Berries & Almonds	Lean Beef Stir-fry with Mixed Vegetables	Chicken Tikka with Cucumber Salad	\N
6b525ea5-aeb9-4f5b-9e28-850eca290a62	096215ff-d15a-40ee-adc9-5f19c68b107f	4	Thursday	\N	\N	\N	\N	\N	\N	\N	\N	\N	2100	\N	2026-01-18 08:53:49.298886+00	Smoothie Bowl with Protein Powder & Chia Seeds	Grilled Prawns with Zucchini Noodles	Lamb Chops with Roasted Brussels Sprouts	\N
51863bb3-9b83-412f-9e3f-67c40539f00d	096215ff-d15a-40ee-adc9-5f19c68b107f	5	Friday	\N	\N	\N	\N	\N	\N	\N	\N	\N	2020	\N	2026-01-18 08:53:49.298886+00	Scrambled Eggs with Avocado Toast	Chicken Caesar Salad (Low Carb)	Grilled Steak with Green Beans & Mushrooms	\N
49f0c7cd-5247-4cc3-be17-e4184d7ea2ba	096215ff-d15a-40ee-adc9-5f19c68b107f	6	Saturday	\N	\N	\N	\N	\N	\N	\N	\N	\N	1980	\N	2026-01-18 08:53:49.298886+00	Greek Yogurt Parfait with Granola	Fish Tacos with Cabbage Slaw	BBQ Chicken with Roasted Vegetables	\N
\.


--
-- Data for Name: meal_plan_subscriptions; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.meal_plan_subscriptions (id, user_id, meal_plan_id, chosen_meals, chosen_days, custom_times, duration, start_date, end_date, total_amount, delivery_address, status, payment_id, payment_status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: meal_plans; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.meal_plans (id, vendor_id, title, description, thumbnail, banner_url, video_url, price_display, schedule, features, plan_type, dietary_type, calories_per_day, includes_breakfast, includes_lunch, includes_dinner, includes_snacks, rating, review_count, min_duration_days, max_duration_days, terms_conditions, is_active, is_featured, sort_order, created_at, updated_at, trust_text, vendor_name, price_breakfast, price_lunch, price_dinner, price_snack) FROM stdin;
096215ff-d15a-40ee-adc9-5f19c68b107f	3109c7d3-95e0-4a7a-86dd-9783e778d50c	Daily Protein Power Meal Plan	High-protein balanced meals delivered fresh daily. Perfect for fitness enthusiasts and muscle building. Includes customizable meal options with 40g+ protein per meal.	https://storage.googleapis.com/gutzo/vendors/3109c7d3-95e0-4a7a-86dd-9783e778d50c/69430b40-976f-4428-a04c-3506b8158ab0/1768048583026.svg	https://example.com/protein-plan-banner.jpg	\N	Starting from ₹258/day	Daily delivery at your chosen time	{"High protein meals (40g+ per meal)","Fresh ingredients daily","Customizable delivery days","Pause/Resume anytime","Nutritionist approved","Track macros in app"}	muscle_gain	non-veg	2000	t	t	t	f	4.7	156	7	90	\N	t	t	0	2026-01-18 08:34:55.399724+00	2026-01-18 08:34:55.399724+00	🔥 96% choose to continue after first week	Coimbatore Cafe, Radisson Blu	89.00	129.00	129.00	49.00
\.


--
-- Data for Name: meal_templates; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.meal_templates (id, vendor_id, template_code, item_name, item_description, image_url, product_id, calories, protein_grams, carbs_grams, fat_grams, meal_type, is_active, created_at, updated_at) FROM stdin;
dfa870a8-1896-401c-8df0-e504b7fd5170	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_1	Egg White Omelette with Spinach & Mushrooms	\N	\N	\N	\N	\N	\N	\N	breakfast	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
bd7ae0cd-32fe-4433-b4e5-7e86ea213733	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_2	Greek Yogurt Parfait with Granola	\N	\N	\N	\N	\N	\N	\N	breakfast	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
c5d6bb45-5a7a-4786-9976-971d8b35ba32	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_3	Overnight Oats with Berries & Almonds	\N	\N	\N	\N	\N	\N	\N	breakfast	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
c1d9ff65-32e9-400d-97fa-29f84e211b20	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_4	Protein Pancakes with Greek Yogurt	\N	\N	\N	\N	\N	\N	\N	breakfast	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
f36f5501-78f2-4980-8a4b-acca958e1d84	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_5	Scrambled Eggs with Avocado Toast	\N	\N	\N	\N	\N	\N	\N	breakfast	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
c9a4ad59-89a2-45e3-90d2-e4abd93ad03d	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_6	Smoothie Bowl with Protein Powder & Chia Seeds	\N	\N	\N	\N	\N	\N	\N	breakfast	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
7fbf5a5e-f6e3-46ea-9f12-aad7b68373b5	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_7	Chicken Caesar Salad (Low Carb)	\N	\N	\N	\N	\N	\N	\N	lunch	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
368a135b-cc58-4383-a95e-a95485e88804	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_8	Fish Tacos with Cabbage Slaw	\N	\N	\N	\N	\N	\N	\N	lunch	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
0df99228-114d-414f-bd25-0b84ca68f41d	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_9	Grilled Chicken Breast with Quinoa & Veggies	\N	\N	\N	\N	\N	\N	\N	lunch	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
5679784a-9890-4062-a0c0-6c997c8c84c4	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_10	Grilled Prawns with Zucchini Noodles	\N	\N	\N	\N	\N	\N	\N	lunch	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
b621bc31-6481-4eb8-b5b1-1a540253f803	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_11	Lean Beef Stir-fry with Mixed Vegetables	\N	\N	\N	\N	\N	\N	\N	lunch	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
1f425562-c06c-461a-999e-bffcbd0141ec	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_12	Turkey Meatballs with Brown Rice	\N	\N	\N	\N	\N	\N	\N	lunch	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
97f8f799-8670-4159-8634-8200e6733554	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_13	BBQ Chicken with Roasted Vegetables	\N	\N	\N	\N	\N	\N	\N	dinner	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
8ea5d1f1-d253-4869-8c5a-a5fd9f98f943	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_14	Chicken Tikka with Cucumber Salad	\N	\N	\N	\N	\N	\N	\N	dinner	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
491e2628-53ad-4415-a8ee-d816b33506d7	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_15	Grilled Fish with Asparagus & Cauliflower Rice	\N	\N	\N	\N	\N	\N	\N	dinner	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
57dd23cb-6058-41a5-b111-ce00b66565fb	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_16	Grilled Steak with Green Beans & Mushrooms	\N	\N	\N	\N	\N	\N	\N	dinner	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
7a75a0fc-48af-4646-9f0b-62e7ac5db324	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_17	Lamb Chops with Roasted Brussels Sprouts	\N	\N	\N	\N	\N	\N	\N	dinner	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
b9ff51b7-39fb-4b6b-996a-49921cfa06cd	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ_18	Salmon with Sweet Potato & Broccoli	\N	\N	\N	\N	\N	\N	\N	dinner	t	2026-01-18 10:53:37.524248+00	2026-01-18 10:53:37.524248+00
\.


--
-- Data for Name: notification_preferences; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.notification_preferences (id, user_id, order_updates, subscription_alerts, promotional, review_requests, channel, updated_at) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.notifications (id, user_id, type, title, message, data, is_read, read_at, created_at) FROM stdin;
a5ef87f7-b744-4dd5-8f87-56149c04244a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601012326DS9N has been placed successfully.	{"order_id": "1051d5a4-87e3-4236-a456-3758c59a6981", "order_number": "GZ202601012326DS9N"}	f	\N	2026-01-01 17:56:54.576912+00
9fb35d38-b524-4da9-b61a-79328356df20	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment of ₹105.87 received for order #GZ202601012326DS9N	{"txn_id": "20260101211370000213628640270206555", "order_id": "GZ202601012326DS9N"}	f	\N	2026-01-01 17:57:09.135525+00
87ffe90f-103e-45fa-a1f0-177de58e95c4	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026010123346J5W has been placed successfully.	{"order_id": "ef07b016-d745-48ed-877c-4ecbb130315c", "order_number": "GZ2026010123346J5W"}	f	\N	2026-01-01 18:04:55.195099+00
a8d11cb3-0ebb-4dd0-8ae2-2d31f9d8c182	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment of ₹105.87 received for order #GZ2026010123346J5W	{"txn_id": "20260101211370000213630657076129012", "order_id": "GZ2026010123346J5W"}	f	\N	2026-01-01 18:05:21.453396+00
10b2efb5-ce72-46d2-a8ee-175f031549df	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601012340AKI9 has been placed successfully.	{"order_id": "98765c24-e4d0-48dc-b8e1-0423e9d42e36", "order_number": "GZ202601012340AKI9"}	f	\N	2026-01-01 18:10:25.950411+00
6dbe1830-c91c-47a6-b899-f0ffa541ad19	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment of ₹105.87 received for order #GZ202601012340AKI9	{"txn_id": "20260101211370000213632043549440605", "order_id": "GZ202601012340AKI9"}	f	\N	2026-01-01 18:10:55.838447+00
5fa99f88-ac19-4126-8db8-a546adf1fd34	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601012347S1Y7 has been placed successfully.	{"order_id": "3c348623-6a1f-4983-bd68-f59ab564a385", "order_number": "GZ202601012347S1Y7"}	f	\N	2026-01-01 18:17:22.566577+00
f7343487-5e9f-4aa1-b482-f5fd5c6947a4	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment of ₹105.87 received for order #GZ202601012347S1Y7	{"txn_id": "20260101211370000213633791823434164", "order_id": "GZ202601012347S1Y7"}	f	\N	2026-01-01 18:17:48.128435+00
3b799a52-1337-42ef-982b-280699ab9571	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601020403EMU5 has been placed successfully.	{"order_id": "7edc8cb9-0d67-455a-859d-f5f9784b9a6b", "order_number": "GZ202601020403EMU5"}	f	\N	2026-01-02 04:03:03.803389+00
2fefcf7b-1138-465b-beb8-2935da1c2b1f	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026010204032XZQ has been placed successfully.	{"order_id": "f1d49f08-4683-4f25-bafa-275441514239", "order_number": "GZ2026010204032XZQ"}	f	\N	2026-01-02 04:03:55.007217+00
38c30f02-3cac-473d-bbd1-11d7fbc0c372	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601020730K20F has been placed successfully.	{"order_id": "2a67cbd8-0cba-4998-a7a2-8b02bba254e2", "order_number": "GZ202601020730K20F"}	f	\N	2026-01-02 07:30:02.20242+00
09320dca-076c-43e7-992d-ce8036db1683	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026010216146WHI has been placed successfully.	{"order_id": "581b77fd-754f-4331-b5ee-f41270d9a0d6", "order_number": "GZ2026010216146WHI"}	f	\N	2026-01-02 16:14:44.83527+00
2f0cc465-d13c-44c4-9a6c-cd44f2939827	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601021617ESAN has been placed successfully.	{"order_id": "69e32fb0-6dbb-4205-8624-9a151e522f38", "order_number": "GZ202601021617ESAN"}	f	\N	2026-01-02 16:17:33.593918+00
010dd9d4-4946-4fa2-b175-a891932aa09d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601021619VPJI has been placed successfully.	{"order_id": "7763d9d0-d8bc-4e4b-ba3e-2f16c96895f7", "order_number": "GZ202601021619VPJI"}	f	\N	2026-01-02 16:19:57.273538+00
58036503-c43f-4bb9-be9d-b2643340bfbb	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601021620R6IW has been placed successfully.	{"order_id": "c1247322-510e-4ca3-890c-77d0cfbf2243", "order_number": "GZ202601021620R6IW"}	f	\N	2026-01-02 16:20:32.691741+00
deb46875-f31d-4478-a5f0-095d0f68a4b3	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601021620BU4A has been placed successfully.	{"order_id": "f6c6b919-835c-4f65-9610-651e9c20544d", "order_number": "GZ202601021620BU4A"}	f	\N	2026-01-02 16:20:38.311938+00
8c5c1c27-a7cf-43de-909f-11aeb8312d20	4adb1ec3-90bd-42cb-a070-0145e88c2a5c	order_placed	Order Placed!	Your order #GZ20260102162081SB has been placed successfully.	{"order_id": "540c235e-bdcc-475f-93f2-a12580c1cd55", "order_number": "GZ20260102162081SB"}	f	\N	2026-01-02 16:20:40.155404+00
4bc47e46-44b3-4711-9cf5-219114e111a5	4adb1ec3-90bd-42cb-a070-0145e88c2a5c	order_placed	Order Placed!	Your order #GZ20260102162095YI has been placed successfully.	{"order_id": "8f66c9e0-63ac-470c-a96b-2d2a14364923", "order_number": "GZ20260102162095YI"}	f	\N	2026-01-02 16:20:43.133824+00
3c7e50b3-18a6-4d3f-ab5c-19d3cf05532f	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601021620EKZN has been placed successfully.	{"order_id": "3f609d12-4510-423b-8bbd-e55bb6a9f4be", "order_number": "GZ202601021620EKZN"}	f	\N	2026-01-02 16:20:44.451297+00
33056f40-b2ae-45ce-acbe-5f47768c816f	4adb1ec3-90bd-42cb-a070-0145e88c2a5c	order_placed	Order Placed!	Your order #GZ202601021620SH2Y has been placed successfully.	{"order_id": "2f9b8908-3022-4271-aa4c-3388af886eb8", "order_number": "GZ202601021620SH2Y"}	f	\N	2026-01-02 16:20:48.806434+00
847db6eb-2e0d-4b5c-8792-092601738f5b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601041233T0C3 has been placed successfully.	{"order_id": "72b1b08d-8974-4bf6-bcf0-23715961daea", "order_number": "GZ202601041233T0C3"}	f	\N	2026-01-04 07:03:07.596105+00
fa9e8d54-d7aa-435e-aba5-7f05aa2751f5	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment of ₹105.87 received for order #GZ202601041233T0C3	{"txn_id": "20260104211400000214551277682443412", "order_id": "GZ202601041233T0C3"}	f	\N	2026-01-04 07:03:38.879968+00
8ed29342-e632-47f6-b5dc-88a3c756a29a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment of ₹100.00 received for order #TEST_SUCCESS_1767514884752	{"txn_id": "TXN_1767514885326", "order_id": "TEST_SUCCESS_1767514884752"}	f	\N	2026-01-04 08:21:27.083388+00
1c6cc354-6938-46ca-a9fb-d63c1ef6d246	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment of ₹100.00 received for order #TEST_FAIL_1767514890672	{"txn_id": "TXN_1767514891281", "order_id": "TEST_FAIL_1767514890672"}	f	\N	2026-01-04 08:21:32.714082+00
f75751c4-c0c9-4def-9022-a878887da761	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_cancelled	Order Cancelled	We could not find a delivery partner. Your refund has been initiated.	{"order_id": "TEST_FAIL_1767514890672"}	f	\N	2026-01-04 08:21:33.263006+00
7606753e-d01e-48b2-ac14-31dd1916ec5c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042051ANUV has been placed successfully.	{"order_id": "b55cdbcc-9c4c-435a-8bef-3d142b961d1a", "order_number": "GZ202601042051ANUV"}	f	\N	2026-01-04 15:21:29.711539+00
baab11b8-13a9-4c21-a759-9429d81ca402	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_cancelled	Order Cancelled	Payment successful but no delivery partner available. Refund initiated.	{"order_id": "GZ202601042051ANUV"}	f	\N	2026-01-04 15:21:55.913956+00
31c0aa5e-4585-480d-b803-cd6fc0f5cec8	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042106V1TG has been placed successfully.	{"order_id": "4de57d1f-46cf-4783-b1f7-ab3aad668301", "order_number": "GZ202601042106V1TG"}	f	\N	2026-01-04 15:36:39.018375+00
ea9396cf-be50-45f4-b481-b182504a99a8	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_cancelled	Order Cancelled	Payment successful but no delivery partner available. Refund initiated.	{"order_id": "GZ202601042106V1TG"}	f	\N	2026-01-04 15:37:09.512925+00
7f26e34f-b916-4df0-9a05-da03263e9d79	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042113MDBJ has been placed successfully.	{"order_id": "c61a2f99-445c-4286-b050-0659392ba3e5", "order_number": "GZ202601042113MDBJ"}	f	\N	2026-01-04 15:43:37.10612+00
08b46f24-27a5-48d0-bcc6-f26dba257f42	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_cancelled	Order Cancelled	Payment successful but no delivery partner available. Refund initiated.	{"order_id": "GZ202601042113MDBJ"}	f	\N	2026-01-04 15:43:53.113946+00
bddd937c-4e8b-4943-bc28-b7af4fb2fbb6	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042126J4T5 has been placed successfully.	{"order_id": "5f801b32-64ec-4bf4-a2da-d1e70f231f7f", "order_number": "GZ202601042126J4T5"}	f	\N	2026-01-04 15:56:26.973463+00
b84904ab-3fed-4bfd-b7a9-bb0a61e97247	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_cancelled	Order Cancelled	Payment successful but no delivery partner available. Refund initiated.	{"order_id": "GZ202601042126J4T5"}	f	\N	2026-01-04 15:56:44.451573+00
49ef096f-efbc-4835-a0e3-b90cc21466f1	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026010421354AZS has been placed successfully.	{"order_id": "78fc6e06-1b7d-4d49-a35e-dd9d040d9822", "order_number": "GZ2026010421354AZS"}	f	\N	2026-01-04 16:05:44.954049+00
6eb89847-1a27-4a37-a3fe-46c1dbb10e8c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_cancelled	Order Cancelled	Payment successful but no delivery partner available. Refund initiated.	{"order_id": "GZ2026010421354AZS"}	f	\N	2026-01-04 16:06:02.362376+00
2a034687-cde9-43a7-8ba2-94db0478c3aa	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026010421382B84 has been placed successfully.	{"order_id": "7174d24a-0c40-4f13-a5d5-632de7445ecb", "order_number": "GZ2026010421382B84"}	f	\N	2026-01-04 16:08:46.302038+00
294b9d3a-0036-4d4b-811a-e78bc1d86698	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_cancelled	Order Cancelled	Payment successful but no delivery partner available. Refund initiated.	{"order_id": "GZ2026010421382B84"}	f	\N	2026-01-04 16:09:10.080992+00
2f1adf03-2886-4b58-aa41-2b4a6950b5bd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042141VU5N has been placed successfully.	{"order_id": "05071aae-91f6-4a24-901d-6093df4c4456", "order_number": "GZ202601042141VU5N"}	f	\N	2026-01-04 16:11:58.882384+00
076a54fd-9529-48af-9786-bb51c91ab5d7	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_cancelled	Order Cancelled	Payment successful but no delivery partner available. Refund initiated.	{"order_id": "GZ202601042141VU5N"}	f	\N	2026-01-04 16:12:15.308084+00
175badd0-58ff-4964-b428-c816dd9d89ce	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042144XZQ2 has been placed successfully.	{"order_id": "39b20f95-3c2f-472d-b906-729fdcc9ec93", "order_number": "GZ202601042144XZQ2"}	f	\N	2026-01-04 16:14:58.163019+00
155a2b64-1eb3-4b0a-9384-866e117a2185	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211370000214690149749966913", "order_id": "GZ202601042144XZQ2"}	f	\N	2026-01-04 16:15:20.451399+00
7f114cc8-efbd-4a97-92c9-32e679b9c214	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042147QKN0 has been placed successfully.	{"order_id": "e962be3a-3ea1-4431-84c8-14862bc16b9d", "order_number": "GZ202601042147QKN0"}	f	\N	2026-01-04 16:17:12.265842+00
d75525cf-a833-404f-8c1f-c8c1ccfbf114	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211400000214690712625507027", "order_id": "GZ202601042147QKN0"}	f	\N	2026-01-04 16:17:31.424724+00
dc113baa-cf09-4969-8ad8-8f9d9113d85e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026010421502RUL has been placed successfully.	{"order_id": "40cf202a-3674-4592-ab69-f4e9d6198c6e", "order_number": "GZ2026010421502RUL"}	f	\N	2026-01-04 16:20:24.066298+00
a4cdb731-81c6-4a72-9b50-4da76eaca265	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211400000214691516530975168", "order_id": "GZ2026010421502RUL"}	f	\N	2026-01-04 16:20:48.928737+00
8fa8e88b-e04b-4a3d-9e28-6b7688576c6e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ20260104215565Y1 has been placed successfully.	{"order_id": "e8b5bf92-7bff-4687-a99d-5a61218290b7", "order_number": "GZ20260104215565Y1"}	f	\N	2026-01-04 16:25:44.988151+00
48e1fbcf-1d15-49e7-ad42-f4cca3eab61e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211400000214692863326177099", "order_id": "GZ20260104215565Y1"}	f	\N	2026-01-04 16:26:03.212934+00
1d5ba07c-5b4e-4109-a578-0687663d7a85	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042201TCOQ has been placed successfully.	{"order_id": "b6587471-0640-4d33-b075-2e26c157ba5a", "order_number": "GZ202601042201TCOQ"}	f	\N	2026-01-04 16:31:39.963373+00
8ccc2c4f-75e7-41fc-b8cc-dc2528c8ed83	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211370000214694352576795105", "order_id": "GZ202601042201TCOQ"}	f	\N	2026-01-04 16:32:01.581788+00
0c36f749-3e4f-42d2-bd60-0bcc0f5f4c40	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042212YWPE has been placed successfully.	{"order_id": "260cc7c1-a627-4710-8d05-96c6da0ad66a", "order_number": "GZ202601042212YWPE"}	f	\N	2026-01-04 16:42:44.496224+00
986ce008-05dd-40ba-aa70-ce4143940fc2	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211370000214697139117183523", "order_id": "GZ202601042212YWPE"}	f	\N	2026-01-04 16:44:06.035245+00
1ac4a225-afbd-450c-90ef-b685479707c2	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042215FSK2 has been placed successfully.	{"order_id": "0592b2de-f13f-486d-930f-ca44a332042e", "order_number": "GZ202601042215FSK2"}	f	\N	2026-01-04 16:45:11.706177+00
df504123-3abf-43c2-815a-5ab861a8e852	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211370000214697756887836759", "order_id": "GZ202601042215FSK2"}	f	\N	2026-01-04 16:45:33.140349+00
a7bf13ea-046e-4e41-80bd-ac11179c5fe0	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042220QTU1 has been placed successfully.	{"order_id": "3f8262b9-295d-4e10-a2da-e114736e8db1", "order_number": "GZ202601042220QTU1"}	f	\N	2026-01-04 16:50:15.360051+00
d0c40c49-d4c6-48b7-a142-6f15c4cf0caa	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211370000214699030697953116", "order_id": "GZ202601042220QTU1"}	f	\N	2026-01-04 16:50:30.667264+00
d242e849-5cd5-4c26-9acc-ffb2d40e4928	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042228FS1L has been placed successfully.	{"order_id": "d0488ea6-6367-4c72-ac53-b5db7d735ec2", "order_number": "GZ202601042228FS1L"}	f	\N	2026-01-04 16:58:27.526147+00
70bb1ebf-fb52-4526-bc69-a1612396b26c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211400000214701096245800003", "order_id": "GZ202601042228FS1L"}	f	\N	2026-01-04 16:58:58.346398+00
bc4c6d2e-e5aa-4de8-86a8-3f321a286ad9	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042238REFM has been placed successfully.	{"order_id": "dda7a50a-4295-41e3-9fc6-73f714419318", "order_number": "GZ202601042238REFM"}	f	\N	2026-01-04 17:08:07.728866+00
0f299828-205e-407d-8797-442d8616fb96	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211400000214703528082298734", "order_id": "GZ202601042238REFM"}	f	\N	2026-01-04 17:08:23.390148+00
e0e3c0f0-f129-4575-8bdb-2bab14233afe	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042341BVOJ has been placed successfully.	{"order_id": "f8056db7-750c-4166-af9f-0efcfdac8343", "order_number": "GZ202601042341BVOJ"}	f	\N	2026-01-04 18:11:42.240192+00
77776187-85ec-4953-9d34-5f0f568c0755	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211370000214719530140652916", "order_id": "GZ202601042341BVOJ"}	f	\N	2026-01-04 18:12:57.296727+00
82c19e27-331a-4f2f-9294-54ffcfbcb6e4	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601042350JX88 has been placed successfully.	{"order_id": "c9385e31-65da-4c5a-a962-adc82c30eb15", "order_number": "GZ202601042350JX88"}	f	\N	2026-01-04 18:21:00.222074+00
acfb4f9d-d7e0-49d9-b493-920a3403e6cf	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260104211370000214721868679044313", "order_id": "GZ202601042350JX88"}	f	\N	2026-01-04 18:21:17.633091+00
1500f4ed-5b88-4c7e-b55f-3dfe1f49a19c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601050302VNZE has been placed successfully.	{"order_id": "e06c18f0-f6a2-4c60-9d8e-1d95f8fd85e4", "order_number": "GZ202601050302VNZE"}	f	\N	2026-01-05 03:02:42.400602+00
1de7dcec-f4c6-4edd-bc25-46462b8515aa	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601050303GW7Y has been placed successfully.	{"order_id": "7f5de5bc-5475-4ad9-93ea-8f903ce79385", "order_number": "GZ202601050303GW7Y"}	f	\N	2026-01-05 03:03:36.147875+00
26abdd56-57c1-45d0-9c0c-aa9ef1aa6eac	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601101436CJVN has been placed successfully.	{"order_id": "c0173220-3005-42df-b252-58355f40a36a", "order_number": "GZ202601101436CJVN"}	f	\N	2026-01-10 09:06:45.148147+00
9944d4f2-d055-4e75-912d-a25645c896c6	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260110211400000216756715844943377", "order_id": "GZ202601101436CJVN"}	f	\N	2026-01-10 09:07:07.979986+00
dd5eea31-5b0d-42a3-8e7d-b5d046edb1f7	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011021566LU8 has been placed successfully.	{"order_id": "934558c4-b8bc-4736-bbd4-0942ad22c61c", "order_number": "GZ2026011021566LU8"}	f	\N	2026-01-10 16:26:21.906687+00
cdd827ed-d219-4bc3-b661-93bbd282e7b2	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260110211400000216867350779942173", "order_id": "GZ2026011021566LU8"}	f	\N	2026-01-10 16:26:45.144191+00
ccb3b7b3-0341-4197-8cdb-cac7a4cb8a1d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011022332ZGL has been placed successfully.	{"order_id": "3d2643b5-6a25-41da-a866-bf4c6030e505", "order_number": "GZ2026011022332ZGL"}	f	\N	2026-01-10 17:03:22.971774+00
aa2c7bdb-744c-4c76-9f60-fe6eccd2c6fb	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260110211380000216876660641807319", "order_id": "GZ2026011022332ZGL"}	f	\N	2026-01-10 17:03:40.963024+00
f74d7988-1551-492b-9a41-2690e7385b44	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601102345JIUF has been placed successfully.	{"order_id": "ee4ad14e-e542-4893-8c63-911a38a98cd9", "order_number": "GZ202601102345JIUF"}	f	\N	2026-01-10 18:15:59.911482+00
2144fe0d-1ebf-4252-9285-8347fca82504	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260110211380000216894935354355836", "order_id": "GZ202601102345JIUF"}	f	\N	2026-01-10 18:17:48.450287+00
7406e523-0ab2-434c-8195-c7c1714af222	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011023579DFK has been placed successfully.	{"order_id": "b8f8d4aa-c321-44d1-b7a3-8c5a2d67ef5a", "order_number": "GZ2026011023579DFK"}	f	\N	2026-01-10 18:27:49.939399+00
063f5d3b-3357-4680-bb36-359f6f490153	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260110211380000216897914321017203", "order_id": "GZ2026011023579DFK"}	f	\N	2026-01-10 18:28:05.707661+00
547f4749-5e8a-4e70-a409-60bb464f2737	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601110223UQQ8 has been placed successfully.	{"order_id": "c9ca9d09-dcc9-4840-aaef-4f1ac1582ff1", "order_number": "GZ202601110223UQQ8"}	f	\N	2026-01-10 20:53:37.569286+00
fdca7fec-dd40-4794-a07b-d08a92ba7524	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000216934604628448751", "order_id": "GZ202601110223UQQ8"}	f	\N	2026-01-10 20:53:53.650253+00
88d8f049-dc90-46d6-9dce-b1c9d18dda20	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111119MKI0 has been placed successfully.	{"order_id": "abeae918-3054-4b88-a2ca-ee7625b2358a", "order_number": "GZ202601111119MKI0"}	f	\N	2026-01-11 05:49:57.127529+00
0f667016-1e1f-4a24-8078-91bdd5e52e82	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217069576823655064", "order_id": "GZ202601111119MKI0"}	f	\N	2026-01-11 05:50:54.128132+00
ab96ccb3-ce42-4386-8c15-b3ab3dfc10fd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111128ZVEA has been placed successfully.	{"order_id": "7a1b2e27-1e4b-425c-8635-200a9c089c8c", "order_number": "GZ202601111128ZVEA"}	f	\N	2026-01-11 05:58:07.867282+00
7b08b87e-49e7-447c-bce9-cf3a82c6d1aa	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217071632485679319", "order_id": "GZ202601111128ZVEA"}	f	\N	2026-01-11 05:58:24.560406+00
45571a97-0185-43a2-a3e1-a7ef50dd1de1	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111154GQ4E has been placed successfully.	{"order_id": "d31bbcbc-29dd-4f67-b2b1-4f62021efee9", "order_number": "GZ202601111154GQ4E"}	f	\N	2026-01-11 06:24:46.306545+00
b7a4a9fa-4fa6-45a7-b2a8-4419cf653f44	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217078338158482971", "order_id": "GZ202601111154GQ4E"}	f	\N	2026-01-11 06:25:06.010169+00
f5b369f7-3a8d-46ac-9765-e10fa500194c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011112004XYB has been placed successfully.	{"order_id": "40cff9a1-e90b-4763-8f4b-749a0bd7a51e", "order_number": "GZ2026011112004XYB"}	f	\N	2026-01-11 06:30:59.708708+00
afda1bdb-92a8-403b-b42c-aacde312bcbf	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217079903753756199", "order_id": "GZ2026011112004XYB"}	f	\N	2026-01-11 06:31:18.568925+00
3ed44d16-d055-4b0c-a76f-50d9cf06e1e6	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ20260111120296L1 has been placed successfully.	{"order_id": "85657b52-b70e-4a41-b3f0-15367bba605e", "order_number": "GZ20260111120296L1"}	f	\N	2026-01-11 06:32:41.282994+00
a49b31f4-863c-44ac-9487-fd702f1b6304	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217080330272525664", "order_id": "GZ20260111120296L1"}	f	\N	2026-01-11 06:32:57.781231+00
211e91d5-f961-4b2b-945b-5761bd683002	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111209AJOI has been placed successfully.	{"order_id": "edeedf58-64c0-4269-9e9c-e3df384df918", "order_number": "GZ202601111209AJOI"}	f	\N	2026-01-11 06:39:42.460797+00
a28f4d58-a4bc-4c88-ae7f-c65000a764e5	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217082097425073384", "order_id": "GZ202601111209AJOI"}	f	\N	2026-01-11 06:40:05.296669+00
5188a63a-4b72-4906-a57a-b00297e585fd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111213GTGC has been placed successfully.	{"order_id": "f611867e-8a74-4acc-b790-240259a4d21d", "order_number": "GZ202601111213GTGC"}	f	\N	2026-01-11 06:43:34.9043+00
b148546e-8ab3-40c6-b9c4-94db5cfb47df	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217083070696546887", "order_id": "GZ202601111213GTGC"}	f	\N	2026-01-11 06:43:58.773912+00
3603ef71-9315-4cee-9c37-91cbcc36afba	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011112263BIF has been placed successfully.	{"order_id": "a1e68265-3906-4203-9018-150b7208bb6e", "order_number": "GZ2026011112263BIF"}	f	\N	2026-01-11 06:56:03.769504+00
00210d8f-d0a5-44d8-b3d6-efdc7e8ae8f6	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217086212918186732", "order_id": "GZ2026011112263BIF"}	f	\N	2026-01-11 06:56:26.811089+00
65ad52a0-bdc0-416e-99fa-c829cfaaa77f	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111229TPAU has been placed successfully.	{"order_id": "c1269dd8-7e37-4d69-b572-16d2334474c4", "order_number": "GZ202601111229TPAU"}	f	\N	2026-01-11 06:59:42.603714+00
beb47ee9-d55c-4dd1-b58c-d8197f150cd8	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217087130359186717", "order_id": "GZ202601111229TPAU"}	f	\N	2026-01-11 07:00:08.400258+00
f2db2754-392a-422b-96a2-2fcee3438f69	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011112388SX1 has been placed successfully.	{"order_id": "71a12d33-4a44-4d33-b25d-bb24a78c1fed", "order_number": "GZ2026011112388SX1"}	f	\N	2026-01-11 07:08:31.595529+00
8bec3afe-dbc5-4a7f-803e-5415244b5b30	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217089349741592107", "order_id": "GZ2026011112388SX1"}	f	\N	2026-01-11 07:08:50.54441+00
05505938-efe4-46cf-bf95-f5d68ff18308	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111248FUSI has been placed successfully.	{"order_id": "e94f2677-ce4a-43c5-9a95-87ce5f531a9d", "order_number": "GZ202601111248FUSI"}	f	\N	2026-01-11 07:18:49.693415+00
cc41edd2-6364-4679-a834-59817a99531d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217091941653779195", "order_id": "GZ202601111248FUSI"}	f	\N	2026-01-11 07:19:14.037995+00
8f5818d5-0750-4d81-ae38-18659997fd17	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011112584D99 has been placed successfully.	{"order_id": "8c8952a1-b084-47ca-9fa7-171c497d7bb0", "order_number": "GZ2026011112584D99"}	f	\N	2026-01-11 07:28:54.057079+00
faeb51eb-4e4b-4d05-a42d-5ee80eb110ea	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217094476976240401", "order_id": "GZ2026011112584D99"}	f	\N	2026-01-11 07:29:11.781875+00
5ec3ba5b-d182-45d3-9c15-dea012692fc2	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111304RQOM has been placed successfully.	{"order_id": "ac8e7f79-9910-48b5-a297-a2c14cae7640", "order_number": "GZ202601111304RQOM"}	f	\N	2026-01-11 07:35:00.861943+00
3f07380f-bc07-4619-a2e9-b6718bddbedd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217096016386479522", "order_id": "GZ202601111304RQOM"}	f	\N	2026-01-11 07:35:18.277311+00
4db31741-5b67-4262-8183-43ad3eb4352e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111308I59X has been placed successfully.	{"order_id": "14155709-2aa0-4bdc-8915-a680c31da986", "order_number": "GZ202601111308I59X"}	f	\N	2026-01-11 07:38:53.324139+00
959abb23-d10f-4638-bcde-0fe6f6e1fb4d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217096989041389344", "order_id": "GZ202601111308I59X"}	f	\N	2026-01-11 07:39:12.461325+00
31022190-e762-467f-955e-9845f837a5e5	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111327KTCJ has been placed successfully.	{"order_id": "0db1e17e-377f-4e72-be7d-2db233269353", "order_number": "GZ202601111327KTCJ"}	f	\N	2026-01-11 07:57:32.303773+00
f8fbe9ea-e3e8-46fa-b6e9-aeb802bb8b3c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217101685684581070", "order_id": "GZ202601111327KTCJ"}	f	\N	2026-01-11 07:57:52.681295+00
ed99756e-3047-4679-a3d6-ebbc9bda5072	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011113595D2B has been placed successfully.	{"order_id": "4210f25f-9be5-4dc5-a665-ca453e8cd8cf", "order_number": "GZ2026011113595D2B"}	f	\N	2026-01-11 08:29:17.117896+00
0378dc64-3842-45c5-8529-4e5a402987c1	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217109673778493984", "order_id": "GZ2026011113595D2B"}	f	\N	2026-01-11 08:29:34.931351+00
afe12440-c728-404a-917d-9bc14e3e0744	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011114077LY3 has been placed successfully.	{"order_id": "b1f5e5c0-bda3-4418-9426-be91757aa22b", "order_number": "GZ2026011114077LY3"}	f	\N	2026-01-11 08:37:50.143241+00
5a78fcdd-9bbc-4d1e-b56d-3b73d79c0830	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217111824399483220", "order_id": "GZ2026011114077LY3"}	f	\N	2026-01-11 08:38:12.665772+00
5ca75949-a741-4f58-bdd9-0a14d0619f34	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111414NA3E has been placed successfully.	{"order_id": "0bdfb46a-308f-4eae-9902-38a95400d4c9", "order_number": "GZ202601111414NA3E"}	f	\N	2026-01-11 08:44:53.51221+00
f1ff03df-6c0f-45ac-8898-14ac152c95dd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217113601312266326", "order_id": "GZ202601111414NA3E"}	f	\N	2026-01-11 08:45:16.184957+00
45084d50-caf8-4d09-9b22-36ce2b0a33ad	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111425JXDG has been placed successfully.	{"order_id": "5693220a-89a4-4733-874f-0a8b479be975", "order_number": "GZ202601111425JXDG"}	f	\N	2026-01-11 08:55:09.407956+00
9ec14ecb-dfa2-4b00-8b0c-2e30dcae439c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217116183501969714", "order_id": "GZ202601111425JXDG"}	f	\N	2026-01-11 08:55:27.234363+00
49907a08-be63-426e-990b-1f1d3fef31d9	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ20260111142900QO has been placed successfully.	{"order_id": "b75bdb88-c718-40ed-8a09-e0b0c1a10e84", "order_number": "GZ20260111142900QO"}	f	\N	2026-01-11 08:59:49.010765+00
58e6c418-6df3-43ab-8689-a2fa53480a7f	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217117357722537939", "order_id": "GZ20260111142900QO"}	f	\N	2026-01-11 09:00:10.335882+00
9584bd68-47fd-415a-a3b3-2af9b9c1e662	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111433DF5Z has been placed successfully.	{"order_id": "59b41baa-6a0a-438a-a0e6-a670c61ea7d2", "order_number": "GZ202601111433DF5Z"}	f	\N	2026-01-11 09:03:17.044185+00
88772596-ba07-4bf5-b7e9-9c3c0747ebac	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217118228086753003", "order_id": "GZ202601111433DF5Z"}	f	\N	2026-01-11 09:03:42.336221+00
1772b170-5b0c-438d-9a49-1f6910831bad	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111454GEEQ has been placed successfully.	{"order_id": "66d94cd2-4e58-44e1-8ee9-daab1dd5ec91", "order_number": "GZ202601111454GEEQ"}	f	\N	2026-01-11 09:24:29.971242+00
689f5151-fbb3-47b2-9b5f-4302694b67fd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217123567142069175", "order_id": "GZ202601111454GEEQ"}	f	\N	2026-01-11 09:24:50.84396+00
c4501bb6-4771-4acd-afde-df35ad117ad1	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011115298EK7 has been placed successfully.	{"order_id": "c77b256b-fe40-4f32-abf6-c9a545fdd58e", "order_number": "GZ2026011115298EK7"}	f	\N	2026-01-11 09:59:08.884977+00
0064512a-c9d5-4c3a-a4c4-f2b42fb302e6	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217132287783755935", "order_id": "GZ2026011115298EK7"}	f	\N	2026-01-11 09:59:34.529587+00
52ce6898-629d-4679-8158-a4ee7a83a28c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111542N4YI has been placed successfully.	{"order_id": "d1cf0b85-7747-4619-8f62-a6d2ff4681c2", "order_number": "GZ202601111542N4YI"}	f	\N	2026-01-11 10:12:05.120028+00
3d519729-f6b6-4927-be80-f232a2eba7f3	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217135543788472963", "order_id": "GZ202601111542N4YI"}	f	\N	2026-01-11 10:12:25.90504+00
78579544-cb37-479d-806a-ea215d225a3c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ20260111154825MV has been placed successfully.	{"order_id": "3c061edd-0ebe-45a6-a986-34a8ff0f4a53", "order_number": "GZ20260111154825MV"}	f	\N	2026-01-11 10:18:10.097231+00
d365e45d-f2fc-4d8f-a2be-0ada70ce8d7a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217137074319368593", "order_id": "GZ20260111154825MV"}	f	\N	2026-01-11 10:18:37.63133+00
7bd1d66a-4b60-432a-8193-060d4017fadf	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111647TEJT has been placed successfully.	{"order_id": "e8111ef8-ca00-4ee6-876d-93026522c5ee", "order_number": "GZ202601111647TEJT"}	f	\N	2026-01-11 11:17:20.133883+00
b0fc335c-92a1-471b-8040-7c447667963a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211400000217151963515477266", "order_id": "GZ202601111647TEJT"}	f	\N	2026-01-11 11:17:51.206231+00
abd35481-cf76-47b2-b2dc-2e8c2838caaa	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111654PDGG has been placed successfully.	{"order_id": "28a92f00-f4a9-4134-a72f-038445d16314", "order_number": "GZ202601111654PDGG"}	f	\N	2026-01-11 11:24:17.504954+00
b8dc2f44-514a-4545-83fd-5ca14c9e78df	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217153714582947667", "order_id": "GZ202601111654PDGG"}	f	\N	2026-01-11 11:24:38.919581+00
7dfa81e1-a8f4-4ab3-bfc9-fd314b9d7d45	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ20260111180702L0 has been placed successfully.	{"order_id": "62e9ba0d-bbad-4fe1-9454-365646a9dc79", "order_number": "GZ20260111180702L0"}	f	\N	2026-01-11 12:37:03.677003+00
28174833-d17c-41cd-a52e-c7f71d0eccb5	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217172031339206865", "order_id": "GZ20260111180702L0"}	f	\N	2026-01-11 12:37:31.111678+00
ee451114-bb78-4337-81e1-2d0e53d7ec0d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111836M0LM has been placed successfully.	{"order_id": "9669089b-cd2f-4166-a931-cbc34075eb44", "order_number": "GZ202601111836M0LM"}	f	\N	2026-01-11 13:06:28.866842+00
69975c76-e973-4619-8e95-60c296c1daf7	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260111211370000217179431181979369", "order_id": "GZ202601111836M0LM"}	f	\N	2026-01-11 13:06:45.457823+00
5f84119e-fabe-456f-a341-2f17be5a68a7	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111340GO4B has been placed successfully.	{"order_id": "d9fda487-b4d9-4d56-9eca-a61b42acb7a3", "order_number": "GZ202601111340GO4B"}	f	\N	2026-01-11 13:40:23.323057+00
28b24dd5-92dd-4cd3-b49b-1e8d7887a2e1	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111343NEN5 has been placed successfully.	{"order_id": "a4253693-1874-4872-b45c-9e35388bb464", "order_number": "GZ202601111343NEN5"}	f	\N	2026-01-11 13:43:16.949542+00
03a7f684-4888-49d5-a946-0d4d004b4371	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111352OIW7 has been placed successfully.	{"order_id": "33d7bbdc-a36f-4c34-bf50-04b5637c9c8b", "order_number": "GZ202601111352OIW7"}	f	\N	2026-01-11 13:52:30.416212+00
1d97aa94-d046-4521-a523-50dd549cb43d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111356L497 has been placed successfully.	{"order_id": "2bd0c39f-8b33-4c0c-8044-c3a71323a224", "order_number": "GZ202601111356L497"}	f	\N	2026-01-11 13:56:24.201341+00
b99e5ffc-3e1d-4837-852a-66b3a02d4120	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111400VDOB has been placed successfully.	{"order_id": "2d5d2da4-572d-4e29-8c75-ef309a5ec5ac", "order_number": "GZ202601111400VDOB"}	f	\N	2026-01-11 14:00:43.620155+00
6b3716d1-a054-43e3-9088-ad4f4b6bb0b3	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601111408WYZ8 has been placed successfully.	{"order_id": "7db234a3-1c0d-4bbe-8987-d4379b7b90f4", "order_number": "GZ202601111408WYZ8"}	f	\N	2026-01-11 14:08:21.818351+00
9295c6f5-fed0-4079-bb4d-743237774346	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011114158FK9 has been placed successfully.	{"order_id": "ae364144-89db-448a-85fc-edfb3c1d504c", "order_number": "GZ2026011114158FK9"}	f	\N	2026-01-11 14:15:31.305551+00
6eee053f-8cb1-4df3-ae96-871dd78d119b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011114185Z5D has been placed successfully.	{"order_id": "ab2eb63d-8b46-4f12-a067-93a482ab02ec", "order_number": "GZ2026011114185Z5D"}	f	\N	2026-01-11 14:18:40.734081+00
9fa925bf-5920-4cb7-9e91-e8fb47345c30	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161252YKYM has been placed successfully.	{"order_id": "adc0cc9f-7d76-4c2f-8b43-ce46e07b4c25", "order_number": "GZ202601161252YKYM"}	f	\N	2026-01-16 07:22:17.720954+00
2e16f319-7fb4-451b-bb2a-f342e1601a87	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218904754902654956", "order_id": "GZ202601161252YKYM"}	f	\N	2026-01-16 07:22:34.090671+00
0a2a9ba8-a802-4f5f-8b00-ecefe5f73363	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161431V054 has been placed successfully.	{"order_id": "ecf631f4-236b-4a93-a9bd-92769d0aa693", "order_number": "GZ202601161431V054"}	f	\N	2026-01-16 09:01:09.013967+00
711bc755-33e8-4ecb-9c7c-786ddccec1f6	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161434GPKA has been placed successfully.	{"order_id": "3ef748b0-ab28-40b9-9547-e5326fdb07bd", "order_number": "GZ202601161434GPKA"}	f	\N	2026-01-16 09:04:25.851915+00
ce77f2dd-797c-4294-b240-21a0c519b7ad	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218930455240365715", "order_id": "GZ202601161434GPKA"}	f	\N	2026-01-16 09:04:47.722554+00
6edc6709-1562-4312-9bfd-c9105e197c73	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161446JUA3 has been placed successfully.	{"order_id": "1f6f4d1a-01f9-41e7-a2e6-d5408d8073a5", "order_number": "GZ202601161446JUA3"}	f	\N	2026-01-16 09:16:41.362417+00
eb1eb50e-ce73-4916-b512-077577e738d2	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218933540255819906", "order_id": "GZ202601161446JUA3"}	f	\N	2026-01-16 09:16:58.301898+00
811802ff-058c-4976-a808-9736ad1de96f	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161452HONJ has been placed successfully.	{"order_id": "d5111ee0-e478-4a9e-8cc7-1395998d09bd", "order_number": "GZ202601161452HONJ"}	f	\N	2026-01-16 09:22:25.455239+00
0d49cd0d-060d-4677-b683-ae9a2d7b1415	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211400000218934984979666179", "order_id": "GZ202601161452HONJ"}	f	\N	2026-01-16 09:22:40.350183+00
0bdf21ce-4f3f-4ca9-b77d-baeb4e527604	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161500D9RX has been placed successfully.	{"order_id": "5b625c1f-ea63-4414-9327-10733183d0c3", "order_number": "GZ202601161500D9RX"}	f	\N	2026-01-16 09:30:29.293703+00
328d4896-d286-493c-a213-dbaa3d4fdb7b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218937012799787985", "order_id": "GZ202601161500D9RX"}	f	\N	2026-01-16 09:30:47.273972+00
95531465-d23e-48e0-9fed-2739f6d1be29	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161512X0CQ has been placed successfully.	{"order_id": "35083761-df90-4d22-8b39-78d2562be790", "order_number": "GZ202601161512X0CQ"}	f	\N	2026-01-16 09:42:08.903903+00
2154e470-98e9-4ba8-b748-b881a4b8b6a3	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211400000218939947160064763", "order_id": "GZ202601161512X0CQ"}	f	\N	2026-01-16 09:42:23.083972+00
87fc4d73-c433-4e5f-9890-e67b606de9f6	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161517OOS8 has been placed successfully.	{"order_id": "a8a1ce04-63c1-412e-8da1-ed167937809f", "order_number": "GZ202601161517OOS8"}	f	\N	2026-01-16 09:47:42.316404+00
353bf5ba-40dc-4cf8-869d-976d1ec9b39a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211400000218941345473907583", "order_id": "GZ202601161517OOS8"}	f	\N	2026-01-16 09:47:59.738188+00
9396868a-5436-4d7a-ad25-00310abaac23	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161536UDWT has been placed successfully.	{"order_id": "3f310b34-3570-43da-81d7-3f7d2fb96388", "order_number": "GZ202601161536UDWT"}	f	\N	2026-01-16 10:06:15.409002+00
c13c00d6-da5f-4f2e-9789-c629d77898f1	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218946014342408813", "order_id": "GZ202601161536UDWT"}	f	\N	2026-01-16 10:06:31.293125+00
465afd92-5bf8-43c4-9b8d-f54ae9c5ba5d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161543X2TO has been placed successfully.	{"order_id": "4bdfdaf2-a967-49e4-a88e-2cd0ae6301ed", "order_number": "GZ202601161543X2TO"}	f	\N	2026-01-16 10:13:26.487747+00
d43b93a9-c107-457c-83b9-36ace443e28a	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218947824176186872", "order_id": "GZ202601161543X2TO"}	f	\N	2026-01-16 10:13:43.506484+00
2710fae9-5355-4580-9fe0-d8777b2aa5a7	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011616281Z5X has been placed successfully.	{"order_id": "228e4e8b-a272-4ed5-a346-3ad957341ff3", "order_number": "GZ2026011616281Z5X"}	f	\N	2026-01-16 10:58:39.647531+00
3fe84b55-bca3-44f1-867f-9a73f6482949	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218959202408581577", "order_id": "GZ2026011616281Z5X"}	f	\N	2026-01-16 10:58:53.964687+00
a6bd7116-11f6-4a97-8a85-b695dbcb44a5	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161651CTM3 has been placed successfully.	{"order_id": "05fae180-8732-4ff7-a414-b8ac4b86fc4e", "order_number": "GZ202601161651CTM3"}	f	\N	2026-01-16 11:21:08.81577+00
28c8680a-9ee7-4b7e-8cce-f53c10a57a0c	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218964862122702632", "order_id": "GZ202601161651CTM3"}	f	\N	2026-01-16 11:21:27.989308+00
716f6764-614f-49cb-a967-e31c1bc0bacd	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161705CVJQ has been placed successfully.	{"order_id": "90003380-7361-451d-b405-bd35e5ec2a74", "order_number": "GZ202601161705CVJQ"}	f	\N	2026-01-16 11:35:18.217802+00
3832955c-2038-4089-8183-bcefc2991a71	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218968426777799349", "order_id": "GZ202601161705CVJQ"}	f	\N	2026-01-16 11:35:40.473405+00
2b5516ba-0ded-452d-bb70-db18a3adc65b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161718RZJG has been placed successfully.	{"order_id": "125a7148-b350-4532-977c-5304a3ce6e3a", "order_number": "GZ202601161718RZJG"}	f	\N	2026-01-16 11:48:43.811032+00
c7ac9734-312c-44e1-9b2b-41c193f5a28e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218971803419008066", "order_id": "GZ202601161718RZJG"}	f	\N	2026-01-16 11:48:59.231348+00
4615d187-2339-4c8b-a0f2-01f07061dfce	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161738AC6P has been placed successfully.	{"order_id": "1c3c341f-96aa-448c-b730-4a7e6b5120cf", "order_number": "GZ202601161738AC6P"}	f	\N	2026-01-16 12:08:50.921067+00
8b12e94c-9222-4538-a92c-1dee2bb72cff	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218976866996705399", "order_id": "GZ202601161738AC6P"}	f	\N	2026-01-16 12:09:06.71902+00
e2b9cc3b-08f0-4251-8911-4a4a0652df95	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601161800JJBG has been placed successfully.	{"order_id": "f3902eab-00e3-43a8-8ac6-1eff40363f2b", "order_number": "GZ202601161800JJBG"}	f	\N	2026-01-16 12:30:46.965032+00
7d6f4ad5-72c7-4c63-994e-5834b5afaff8	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211390000218982385748661308", "order_id": "GZ202601161800JJBG"}	f	\N	2026-01-16 12:31:52.215299+00
213dcb5f-8fde-4a4b-a94a-8630209aaa97	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011622058UZ1 has been placed successfully.	{"order_id": "9ab46d08-8512-4f22-accb-44f3aacb01c6", "order_number": "GZ2026011622058UZ1"}	f	\N	2026-01-16 16:35:41.149088+00
f915e536-7df8-4ca7-92f7-20b70bb96d85	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260116211400000219044019556999271", "order_id": "GZ2026011622058UZ1"}	f	\N	2026-01-16 16:35:57.989716+00
4dcbd7b8-f51c-4f7e-959a-ab1ca4551a75	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601170320NMF9 has been placed successfully.	{"order_id": "cb9705b4-25f9-49b7-bed7-505c9c1001d3", "order_number": "GZ202601170320NMF9"}	f	\N	2026-01-17 03:20:07.95028+00
51c2fc10-cfe4-4da1-8de7-b9d27bc37c97	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_failed	Payment Failed	Payment failed for order #GZ202601170320NMF9. Please try again.	{"txn_id": "20260117211400000219206204006482700", "order_id": "GZ202601170320NMF9"}	f	\N	2026-01-17 03:20:28.141822+00
250c176f-fafc-42c2-b42f-a225e7a40b8b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601170922GEX8 has been placed successfully.	{"order_id": "98ae894e-4dd9-429e-82d9-a8aee1a68030", "order_number": "GZ202601170922GEX8"}	f	\N	2026-01-17 03:52:37.810564+00
8c195443-84c9-4983-9baa-78ab2e62b2da	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_failed	Payment Failed	Payment failed for order #GZ202601170922GEX8. Please try again.	{"txn_id": "20260117211400000219214377681570728", "order_id": "GZ202601170922GEX8"}	f	\N	2026-01-17 03:52:52.454688+00
dae0543a-6a24-4286-a16a-452e1a896323	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601170359DL60 has been placed successfully.	{"order_id": "2f9f1874-d3f8-47bd-8097-b9b3cbd2f1b8", "order_number": "GZ202601170359DL60"}	f	\N	2026-01-17 03:59:58.644697+00
b05bb77e-6f62-4c42-ad1e-aac4168cffcf	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011704003G1A has been placed successfully.	{"order_id": "a63a4423-fb8b-4518-9ed1-ccd75f31ed9d", "order_number": "GZ2026011704003G1A"}	f	\N	2026-01-17 04:00:38.851992+00
9a36435b-e9a1-4964-be4c-e67a217550f7	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_failed	Payment Failed	Payment failed for order #GZ2026011704003G1A. Please try again.	{"txn_id": "20260117211400000219216392612632375", "order_id": "GZ2026011704003G1A"}	f	\N	2026-01-17 04:00:52.543051+00
090e7cf7-455b-4ddc-88fe-15c2d5928e15	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601170401OGC5 has been placed successfully.	{"order_id": "9b6c736f-fc0d-4637-a83d-241cd57c8055", "order_number": "GZ202601170401OGC5"}	f	\N	2026-01-17 04:01:25.885092+00
67607fdd-0cca-421e-800a-94c5cf9c05f3	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260117211400000219216590084654992", "order_id": "GZ202601170401OGC5"}	f	\N	2026-01-17 04:01:37.986418+00
479b7cbb-705d-49a0-9ff4-4a0e6e499911	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601170936EYC8 has been placed successfully.	{"order_id": "1a6909f0-b5ff-4d6d-a800-44cf010b1db4", "order_number": "GZ202601170936EYC8"}	f	\N	2026-01-17 04:06:02.785142+00
6f3ac22f-0e38-4d4f-b66c-a3a13d3f6179	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260117211400000219217753127406074", "order_id": "GZ202601170936EYC8"}	f	\N	2026-01-17 04:06:20.803686+00
0b84358f-e4a9-437b-b081-2d6e7bf620f2	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601170951RUJ9 has been placed successfully.	{"order_id": "d2cafa62-35d2-4dad-8eb0-0366a85aa2be", "order_number": "GZ202601170951RUJ9"}	f	\N	2026-01-17 04:21:06.882763+00
bf5b9379-0db3-48cc-9f66-e88af347dd23	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_failed	Payment Failed	Payment failed for order #GZ202601170951RUJ9. Please try again.	{"txn_id": "20260117211400000219221545386399496", "order_id": "GZ202601170951RUJ9"}	f	\N	2026-01-17 04:21:29.277098+00
e3631794-b2e4-4999-8ed6-13be58bf8e9d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601170442SGKR has been placed successfully.	{"order_id": "cd234a44-656c-4651-9e9b-e954a41e5bfe", "order_number": "GZ202601170442SGKR"}	f	\N	2026-01-17 04:42:01.935579+00
e90ede72-ca76-41f4-891c-e3951ae86e79	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260117211400000219226810806584126", "order_id": "GZ202601170442SGKR"}	f	\N	2026-01-17 04:42:15.568103+00
bfddb9ed-ba57-4dfc-8cc2-dd940506225e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601170901LBBS has been placed successfully.	{"order_id": "fcb5da7d-55bd-4a34-89e0-15de262367ab", "order_number": "GZ202601170901LBBS"}	f	\N	2026-01-17 09:01:39.866802+00
cba387d3-3b06-4327-a896-ec29d9ab4a21	d95651a4-be8c-4144-acd7-40c6acf5df35	order_placed	Order Placed!	Your order #GZ202601180620UGIM has been placed successfully.	{"order_id": "741f604c-9fd0-4a9c-acd6-8e74cd2261a2", "order_number": "GZ202601180620UGIM"}	f	\N	2026-01-18 06:20:27.417158+00
87edf332-965f-452b-ac5c-7cc800a98803	d95651a4-be8c-4144-acd7-40c6acf5df35	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260118211400000219613968809748972", "order_id": "GZ202601180620UGIM"}	f	\N	2026-01-18 06:20:44.617306+00
224f6ad3-45ee-4dca-bd62-ebf44f49021d	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601181207N83R has been placed successfully.	{"order_id": "0722f749-f716-4833-b47d-8fe38c7f9edf", "order_number": "GZ202601181207N83R"}	f	\N	2026-01-18 06:37:12.817479+00
ea370a0d-62cb-400e-b41e-92ab2eea829e	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260118211400000219618183120579693", "order_id": "GZ202601181207N83R"}	f	\N	2026-01-18 06:38:01.562081+00
75e95f9a-14e3-4a38-b7e9-3d9de8fa7841	d95651a4-be8c-4144-acd7-40c6acf5df35	order_placed	Order Placed!	Your order #GZ202601180739QLSG has been placed successfully.	{"order_id": "7ef2bc75-9612-4bb7-909a-a48944998cdd", "order_number": "GZ202601180739QLSG"}	f	\N	2026-01-18 07:39:21.767061+00
e787846f-ba2d-4544-a12b-566bacf79d81	d95651a4-be8c-4144-acd7-40c6acf5df35	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260118211390000219633822849766290", "order_id": "GZ202601180739QLSG"}	f	\N	2026-01-18 07:39:50.407299+00
09143a49-7da3-4e2a-bb50-f05a98d25069	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601181310BOZN has been placed successfully.	{"order_id": "e9471937-ed88-4fc2-8efb-b5682bbc37d8", "order_number": "GZ202601181310BOZN"}	f	\N	2026-01-18 07:40:51.241072+00
9c67e219-400c-4b5c-8fba-ca69e5715140	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260118211400000219634198663543468", "order_id": "GZ202601181310BOZN"}	f	\N	2026-01-18 07:41:10.168951+00
6ec7313e-a1ef-4009-8987-dd7a6095ed57	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601181315PSG7 has been placed successfully.	{"order_id": "565aed50-124e-45e1-9bc8-a27c6ae60f31", "order_number": "GZ202601181315PSG7"}	f	\N	2026-01-18 07:45:58.151408+00
3c7d2468-1f19-4082-92cb-95b44bccc41b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260118211390000219635486092634315", "order_id": "GZ202601181315PSG7"}	f	\N	2026-01-18 07:46:15.175716+00
15a41a33-414f-46ef-8ccc-ef86218dcfa1	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601181322GA8N has been placed successfully.	{"order_id": "bc2b9fec-4cfd-4624-bd99-3f385c0390d9", "order_number": "GZ202601181322GA8N"}	f	\N	2026-01-18 07:52:38.215576+00
f700e7a2-3409-427d-870b-8193a2d59fe4	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260118211390000219637165403870524", "order_id": "GZ202601181322GA8N"}	f	\N	2026-01-18 07:53:04.124695+00
cafd913b-21cf-4b19-9c83-e6b0ade394d9	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ202601181328CYVE has been placed successfully.	{"order_id": "2913c742-0455-43c4-a4b9-c198171e552b", "order_number": "GZ202601181328CYVE"}	f	\N	2026-01-18 07:58:51.441301+00
7462a4fe-1358-4d8e-980b-da36f63d72dc	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260118211390000219638731896725841", "order_id": "GZ202601181328CYVE"}	f	\N	2026-01-18 07:59:10.213305+00
c08e89c1-3216-46b8-891d-2b2b2cc1c1b9	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	order_placed	Order Placed!	Your order #GZ2026011813365B9L has been placed successfully.	{"order_id": "56724be7-1194-4176-a3e1-ee17841eff2b", "order_number": "GZ2026011813365B9L"}	f	\N	2026-01-18 08:06:20.191463+00
abe65514-ab84-4d50-a7d2-de1463d26d00	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	payment_success	Payment Successful!	Payment received. Searching for delivery partner...	{"txn_id": "20260118211390000219640612970765751", "order_id": "GZ2026011813365B9L"}	f	\N	2026-01-18 08:06:38.00686+00
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, product_id, vendor_id, product_name, product_description, product_image_url, quantity, unit_price, total_price, special_instructions, customizations, created_at) FROM stdin;
9ef129ac-2e9c-4a4f-a070-5b40b927765e	7ef2bc75-9612-4bb7-909a-a48944998cdd	69430b40-976f-4428-a04c-3506b8158ab2	3109c7d3-95e0-4a7a-86dd-9783e778d50e	Gutzo Test	\N	\N	1	1.00	1.00	\N	\N	2026-01-18 07:39:21.741238+00
04cedce6-1f05-48ce-8348-85fa1384f700	e9471937-ed88-4fc2-8efb-b5682bbc37d8	69430b40-976f-4428-a04c-3506b8158ab2	3109c7d3-95e0-4a7a-86dd-9783e778d50e	Gutzo Test	\N	\N	1	1.00	1.00	\N	\N	2026-01-18 07:40:50.291801+00
5f0666a1-5ee0-4459-b727-aa336e650976	565aed50-124e-45e1-9bc8-a27c6ae60f31	69430b40-976f-4428-a04c-3506b8158ab3	3109c7d3-95e0-4a7a-86dd-9783e778d50f	Gutzo Test	\N	\N	1	1.00	1.00	\N	\N	2026-01-18 07:45:57.122509+00
83c4c2a8-40ae-4b45-8f01-07b12cf5663c	bc2b9fec-4cfd-4624-bd99-3f385c0390d9	69430b40-976f-4428-a04c-3506b8158ab1	3109c7d3-95e0-4a7a-86dd-9783e778d50d	Gutzo Test	\N	\N	1	1.00	1.00	\N	\N	2026-01-18 07:52:37.172412+00
9482a232-3dbd-42b5-8825-6c5d7adddeb7	2913c742-0455-43c4-a4b9-c198171e552b	69430b40-976f-4428-a04c-3506b8158ab0	3109c7d3-95e0-4a7a-86dd-9783e778d50c	Gutzo Test	\N	\N	1	1.00	1.00	\N	\N	2026-01-18 07:58:50.447943+00
3ccde4b8-c17a-4304-998e-623d71181922	56724be7-1194-4176-a3e1-ee17841eff2b	69430b40-976f-4428-a04c-3506b8158ab0	3109c7d3-95e0-4a7a-86dd-9783e778d50c	Gutzo Test	\N	\N	1	1.00	1.00	\N	\N	2026-01-18 08:06:19.063147+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, vendor_id, order_number, status, order_type, subtotal, delivery_fee, packaging_fee, taxes, discount_amount, total_amount, delivery_address, delivery_phone, estimated_delivery_time, actual_delivery_time, payment_id, payment_method, payment_status, special_instructions, created_at, updated_at, platform_fee, gst_items, gst_fees, rider_id, tip_amount, cancelled_by, cancellation_reason, refund_status, refund_amount, rating, feedback, feedback_at, invoice_number, invoice_url, order_source, device_type) FROM stdin;
7ef2bc75-9612-4bb7-909a-a48944998cdd	d95651a4-be8c-4144-acd7-40c6acf5df35	3109c7d3-95e0-4a7a-86dd-9783e778d50e	GZ202601180739QLSG	searching_rider	instant	1.00	83.71	0.00	0.00	0.00	89.71	"{\\"id\\":\\"a5066eab-c7d6-4398-a53f-71df4e6dadcb\\",\\"user_id\\":\\"d95651a4-be8c-4144-acd7-40c6acf5df35\\",\\"type\\":\\"home\\",\\"label\\":\\"Home\\",\\"street\\":\\"3328+XVJ\\",\\"area\\":\\"Chinniyampalayam\\",\\"landmark\\":\\"\\",\\"full_address\\":\\"3328+XVJ, Teachers Colony, Chinniyampalayam, Coimbatore, Tamil Nadu 641062, India\\",\\"city\\":\\"Coimbatore\\",\\"state\\":\\"Tamil Nadu\\",\\"country\\":\\"Portugal\\",\\"postal_code\\":null,\\"latitude\\":11.0525166,\\"longitude\\":77.0671836,\\"delivery_instructions\\":null,\\"is_default\\":true,\\"created_at\\":\\"2026-01-18T06:20:18.172353+00:00\\",\\"updated_at\\":\\"2026-01-18T06:20:18.172353+00:00\\",\\"custom_label\\":null,\\"zipcode\\":\\"641062\\",\\"delivery_notes\\":null}"	+919003802398	\N	\N	20260118211390000219633822849766290	paytm	paid	\N	2026-01-18 07:39:21.720364+00	2026-01-18 07:39:48.97654+00	5	0	0	\N	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	app	\N
bc2b9fec-4cfd-4624-bd99-3f385c0390d9	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	3109c7d3-95e0-4a7a-86dd-9783e778d50d	GZ202601181322GA8N	searching_rider	instant	1.00	70.62	0.00	0.00	0.00	76.62	"{\\"id\\":\\"a40fad18-d28c-4e55-90a0-138027533ae5\\",\\"user_id\\":\\"c95f6a2b-fa44-414f-bee6-4f5f9d79c602\\",\\"type\\":\\"home\\",\\"label\\":\\"Home\\",\\"street\\":\\"3328+XVJ\\",\\"area\\":\\"Chinniyampalayam\\",\\"landmark\\":\\"\\",\\"full_address\\":\\"3328+XVJ, Teachers Colony, Chinniyampalayam, Coimbatore, Tamil Nadu 641062, India\\",\\"city\\":\\"Coimbatore\\",\\"state\\":\\"Tamil Nadu\\",\\"country\\":\\"Portugal\\",\\"postal_code\\":null,\\"latitude\\":11.0525207,\\"longitude\\":77.0671894,\\"delivery_instructions\\":null,\\"is_default\\":true,\\"created_at\\":\\"2026-01-17T04:03:50.236489+00:00\\",\\"updated_at\\":\\"2026-01-17T04:03:50.236489+00:00\\",\\"custom_label\\":null,\\"zipcode\\":\\"641062\\",\\"delivery_notes\\":null}"	+919944751745	\N	\N	20260118211390000219637165403870524	paytm	paid	\N	2026-01-18 07:52:36.552533+00	2026-01-18 07:53:01.212811+00	5	0	0	\N	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	app	\N
2913c742-0455-43c4-a4b9-c198171e552b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ202601181328CYVE	searching_rider	instant	1.00	146.15	0.00	0.00	0.00	152.15	"{\\"id\\":\\"a40fad18-d28c-4e55-90a0-138027533ae5\\",\\"user_id\\":\\"c95f6a2b-fa44-414f-bee6-4f5f9d79c602\\",\\"type\\":\\"home\\",\\"label\\":\\"Home\\",\\"street\\":\\"3328+XVJ\\",\\"area\\":\\"Chinniyampalayam\\",\\"landmark\\":\\"\\",\\"full_address\\":\\"3328+XVJ, Teachers Colony, Chinniyampalayam, Coimbatore, Tamil Nadu 641062, India\\",\\"city\\":\\"Coimbatore\\",\\"state\\":\\"Tamil Nadu\\",\\"country\\":\\"Portugal\\",\\"postal_code\\":null,\\"latitude\\":11.0525207,\\"longitude\\":77.0671894,\\"delivery_instructions\\":null,\\"is_default\\":true,\\"created_at\\":\\"2026-01-17T04:03:50.236489+00:00\\",\\"updated_at\\":\\"2026-01-17T04:03:50.236489+00:00\\",\\"custom_label\\":null,\\"zipcode\\":\\"641062\\",\\"delivery_notes\\":null}"	+919944751745	\N	\N	20260118211390000219638731896725841	paytm	paid	\N	2026-01-18 07:58:49.842693+00	2026-01-18 07:59:07.433053+00	5	0	0	\N	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	app	\N
e9471937-ed88-4fc2-8efb-b5682bbc37d8	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	3109c7d3-95e0-4a7a-86dd-9783e778d50e	GZ202601181310BOZN	searching_rider	instant	1.00	83.72	0.00	0.00	0.00	89.72	"{\\"id\\":\\"a40fad18-d28c-4e55-90a0-138027533ae5\\",\\"user_id\\":\\"c95f6a2b-fa44-414f-bee6-4f5f9d79c602\\",\\"type\\":\\"home\\",\\"label\\":\\"Home\\",\\"street\\":\\"3328+XVJ\\",\\"area\\":\\"Chinniyampalayam\\",\\"landmark\\":\\"\\",\\"full_address\\":\\"3328+XVJ, Teachers Colony, Chinniyampalayam, Coimbatore, Tamil Nadu 641062, India\\",\\"city\\":\\"Coimbatore\\",\\"state\\":\\"Tamil Nadu\\",\\"country\\":\\"Portugal\\",\\"postal_code\\":null,\\"latitude\\":11.0525207,\\"longitude\\":77.0671894,\\"delivery_instructions\\":null,\\"is_default\\":true,\\"created_at\\":\\"2026-01-17T04:03:50.236489+00:00\\",\\"updated_at\\":\\"2026-01-17T04:03:50.236489+00:00\\",\\"custom_label\\":null,\\"zipcode\\":\\"641062\\",\\"delivery_notes\\":null}"	+919944751745	\N	\N	20260118211400000219634198663543468	paytm	paid	\N	2026-01-18 07:40:49.699873+00	2026-01-18 07:41:07.383253+00	5	0	0	\N	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	app	\N
565aed50-124e-45e1-9bc8-a27c6ae60f31	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	3109c7d3-95e0-4a7a-86dd-9783e778d50f	GZ202601181315PSG7	searching_rider	instant	1.00	131.75	0.00	0.00	0.00	137.75	"{\\"id\\":\\"a40fad18-d28c-4e55-90a0-138027533ae5\\",\\"user_id\\":\\"c95f6a2b-fa44-414f-bee6-4f5f9d79c602\\",\\"type\\":\\"home\\",\\"label\\":\\"Home\\",\\"street\\":\\"3328+XVJ\\",\\"area\\":\\"Chinniyampalayam\\",\\"landmark\\":\\"\\",\\"full_address\\":\\"3328+XVJ, Teachers Colony, Chinniyampalayam, Coimbatore, Tamil Nadu 641062, India\\",\\"city\\":\\"Coimbatore\\",\\"state\\":\\"Tamil Nadu\\",\\"country\\":\\"Portugal\\",\\"postal_code\\":null,\\"latitude\\":11.0525207,\\"longitude\\":77.0671894,\\"delivery_instructions\\":null,\\"is_default\\":true,\\"created_at\\":\\"2026-01-17T04:03:50.236489+00:00\\",\\"updated_at\\":\\"2026-01-17T04:03:50.236489+00:00\\",\\"custom_label\\":null,\\"zipcode\\":\\"641062\\",\\"delivery_notes\\":null}"	+919944751745	\N	\N	20260118211390000219635486092634315	paytm	paid	\N	2026-01-18 07:45:56.400302+00	2026-01-18 07:46:11.739003+00	5	0	0	\N	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	app	\N
56724be7-1194-4176-a3e1-ee17841eff2b	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	3109c7d3-95e0-4a7a-86dd-9783e778d50c	GZ2026011813365B9L	searching_rider	instant	1.00	146.15	0.00	0.00	0.00	152.15	"{\\"id\\":\\"a40fad18-d28c-4e55-90a0-138027533ae5\\",\\"user_id\\":\\"c95f6a2b-fa44-414f-bee6-4f5f9d79c602\\",\\"type\\":\\"home\\",\\"label\\":\\"Home\\",\\"street\\":\\"3328+XVJ\\",\\"area\\":\\"Chinniyampalayam\\",\\"landmark\\":\\"\\",\\"full_address\\":\\"3328+XVJ, Teachers Colony, Chinniyampalayam, Coimbatore, Tamil Nadu 641062, India\\",\\"city\\":\\"Coimbatore\\",\\"state\\":\\"Tamil Nadu\\",\\"country\\":\\"Portugal\\",\\"postal_code\\":null,\\"latitude\\":11.0525207,\\"longitude\\":77.0671894,\\"delivery_instructions\\":null,\\"is_default\\":true,\\"created_at\\":\\"2026-01-17T04:03:50.236489+00:00\\",\\"updated_at\\":\\"2026-01-17T04:03:50.236489+00:00\\",\\"custom_label\\":null,\\"zipcode\\":\\"641062\\",\\"delivery_notes\\":null}"	+919944751745	\N	\N	20260118211390000219640612970765751	paytm	paid	\N	2026-01-18 08:06:18.246259+00	2026-01-18 08:06:34.734262+00	5	0	0	\N	0.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	app	\N
\.


--
-- Data for Name: otp_verification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.otp_verification (id, phone, otp, expires_at, verified, attempts, created_at, verified_at) FROM stdin;
fead5ef2-70ef-4924-904d-934b769849b3	+919003802398	876565	2026-01-18 06:23:07.48+00	t	0	2026-01-18 06:18:07.481+00	2026-01-18 06:18:23.684+00
f43623aa-c43b-4171-89be-f7122c38ab80	+919940890213	609992	2026-01-02 16:20:54.054+00	t	0	2026-01-02 16:15:54.054+00	2026-01-02 16:16:09.082+00
435c771f-ff69-4919-8931-c8231f2084d8	+919944751745	378467	2026-01-17 03:24:29.662+00	t	0	2026-01-17 03:19:29.663+00	2026-01-17 03:19:40.5+00
ae28f960-6662-4b51-a7d8-ce132674878c	+917904838530	634494	2026-01-17 09:09:13.524+00	t	0	2026-01-17 09:04:13.525+00	2026-01-17 09:04:21.594+00
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.payments (id, order_id, subscription_id, mode, gateway, transaction_id, merchant_order_id, amount, currency, status, gateway_response, refund_id, refunded_amount, refunded_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_addons; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.product_addons (id, product_id, name, price, image, is_veg, max_quantity, is_available, sort_order, created_at) FROM stdin;
\.


--
-- Data for Name: product_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_subscriptions (id, user_id, vendor_id, subscription_name, frequency, duration_weeks, start_date, end_date, total_amount, amount_per_delivery, status, delivery_time, delivery_days, delivery_address, payment_id, payment_method, payment_status, created_at, updated_at, menu_ids, next_delivery_date, per_delivery_amount, auto_renew, pause_start_date, pause_end_date, pause_reason, skip_dates) FROM stdin;
\.


--
-- Data for Name: product_variants; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.product_variants (id, product_id, name, price, calories, image, is_default, is_available, sort_order, created_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, vendor_id, name, description, price, image_url, category, tags, is_available, preparation_time, nutritional_info, ingredients, allergens, portion_size, spice_level, is_featured, sort_order, created_at, updated_at, thumbnail, gallery_images, video_url, type, discount_price, discount_percent, is_bestseller, calories, serves, stock_quantity, max_order_qty, min_order_qty, available_days, rating, review_count, addon_ids, is_veg) FROM stdin;
69430b40-976f-4428-a04c-3506b8158ab0	3109c7d3-95e0-4a7a-86dd-9783e778d50c	Gutzo Test	Crispy golden crepe made from fermented rice and lentil batter, filled with spiced potato masala and served with coconut chutney and sambar.	1.00	https://storage.googleapis.com/gutzo/vendors/3109c7d3-95e0-4a7a-86dd-9783e778d50c/69430b40-976f-4428-a04c-3506b8158ab0/1768048583026.svg	Specials	\N	t	15	\N	\N	\N	\N	\N	t	0	2025-12-31 18:47:53.005502+00	2026-01-11 13:31:57.405762+00	\N	\N	\N	veg	\N	\N	t	\N	1	\N	10	1	\N	\N	0	{}	t
69430b40-976f-4428-a04c-3506b8158ab1	3109c7d3-95e0-4a7a-86dd-9783e778d50d	Gutzo Test	Crispy golden crepe made from fermented rice and lentil batter, filled with spiced potato masala and served with coconut chutney and sambar.	1.00	https://storage.googleapis.com/gutzo/vendors/3109c7d3-95e0-4a7a-86dd-9783e778d50c/69430b40-976f-4428-a04c-3506b8158ab0/1768048583026.svg	Specials	\N	t	15	\N	\N	\N	\N	\N	t	0	2025-12-31 18:47:53.005502+00	2026-01-11 13:31:57.405762+00	\N	\N	\N	veg	\N	\N	t	\N	1	\N	10	1	\N	\N	0	{}	t
69430b40-976f-4428-a04c-3506b8158ab2	3109c7d3-95e0-4a7a-86dd-9783e778d50e	Gutzo Test	Crispy golden crepe made from fermented rice and lentil batter, filled with spiced potato masala and served with coconut chutney and sambar.	1.00	https://storage.googleapis.com/gutzo/vendors/3109c7d3-95e0-4a7a-86dd-9783e778d50c/69430b40-976f-4428-a04c-3506b8158ab0/1768048583026.svg	Specials	\N	t	15	\N	\N	\N	\N	\N	t	0	2025-12-31 18:47:53.005502+00	2026-01-11 13:31:57.405762+00	\N	\N	\N	veg	\N	\N	t	\N	1	\N	10	1	\N	\N	0	{}	t
69430b40-976f-4428-a04c-3506b8158ab3	3109c7d3-95e0-4a7a-86dd-9783e778d50f	Gutzo Test	Crispy golden crepe made from fermented rice and lentil batter, filled with spiced potato masala and served with coconut chutney and sambar.	1.00	https://storage.googleapis.com/gutzo/vendors/3109c7d3-95e0-4a7a-86dd-9783e778d50c/69430b40-976f-4428-a04c-3506b8158ab0/1768048583026.svg	Specials	\N	t	15	\N	\N	\N	\N	\N	t	0	2025-12-31 18:47:53.005502+00	2026-01-11 13:31:57.405762+00	\N	\N	\N	veg	\N	\N	t	\N	1	\N	10	1	\N	\N	0	{}	t
\.


--
-- Data for Name: promo_banners; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.promo_banners (id, title, subtitle, image_url, mobile_image_url, link_type, link_target_id, link_url, "position", sort_order, start_date, end_date, is_active, clicks, impressions, created_at) FROM stdin;
\.


--
-- Data for Name: referrals; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.referrals (id, referrer_id, referee_id, referral_code, status, referrer_reward, referee_reward, first_order_id, completed_at, expires_at, created_at) FROM stdin;
\.


--
-- Data for Name: review_votes; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.review_votes (id, review_id, user_id, is_helpful, created_at) FROM stdin;
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.reviews (id, user_id, vendor_id, product_id, order_id, rating, comment, images, is_verified_purchase, status, vendor_reply, replied_at, helpful_count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: search_logs; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.search_logs (id, user_id, query, results_count, clicked_product_id, clicked_vendor_id, device_type, created_at) FROM stdin;
\.


--
-- Data for Name: subscription_deliveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription_deliveries (id, subscription_id, order_id, scheduled_date, delivery_status, delivered_at, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: subscription_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription_items (id, subscription_id, product_id, product_name, quantity, unit_price, created_at) FROM stdin;
\.


--
-- Data for Name: support_tickets; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.support_tickets (id, user_id, order_id, subject, description, category, priority, status, assigned_to, attachments, resolution, resolved_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_addresses (id, user_id, type, label, street, area, landmark, full_address, city, state, country, postal_code, latitude, longitude, delivery_instructions, is_default, created_at, updated_at, custom_label, zipcode, delivery_notes) FROM stdin;
a40fad18-d28c-4e55-90a0-138027533ae5	c95f6a2b-fa44-414f-bee6-4f5f9d79c602	home	Home	3328+XVJ	Chinniyampalayam		3328+XVJ, Teachers Colony, Chinniyampalayam, Coimbatore, Tamil Nadu 641062, India	Coimbatore	Tamil Nadu	Portugal	\N	11.05252070	77.06718940	\N	t	2026-01-17 04:03:50.236489+00	2026-01-17 04:03:50.236489+00	\N	641062	\N
a5066eab-c7d6-4398-a53f-71df4e6dadcb	d95651a4-be8c-4144-acd7-40c6acf5df35	home	Home	3328+XVJ	Chinniyampalayam		3328+XVJ, Teachers Colony, Chinniyampalayam, Coimbatore, Tamil Nadu 641062, India	Coimbatore	Tamil Nadu	Portugal	\N	11.05251660	77.06718360	\N	t	2026-01-18 06:20:18.172353+00	2026-01-18 06:20:18.172353+00	\N	641062	\N
\.


--
-- Data for Name: user_favorites; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.user_favorites (id, user_id, vendor_id, product_id, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, phone, name, email, verified, created_at, updated_at, profile_image, date_of_birth, gender, language_preference, dietary_preference, allergies, health_goals, referral_code, referred_by, total_orders, total_spent, loyalty_points, membership_tier, device_tokens, last_order_at, last_login_at, is_blocked, blocked_reason) FROM stdin;
d95651a4-be8c-4144-acd7-40c6acf5df35	+919003802398	Maha	mahalakshmisundaram244@gmail.com	t	2026-01-18 06:18:23.711+00	2026-01-18 06:18:23.71444+00	\N	\N	\N	en	\N	\N	\N	GZ8023988QU	\N	2	241.86	0	bronze	\N	2026-01-18 07:39:21.756+00	2026-01-18 07:41:28.893+00	f	\N
c95f6a2b-fa44-414f-bee6-4f5f9d79c602	+919944751745	Gowtham Sundaram	goc@gmai.com	t	2026-01-01 17:53:29.626+00	2026-01-01 17:53:29.870604+00	\N	\N	\N	en	\N	\N	\N	GZ751745SJR	\N	110	11942.88	0	bronze	\N	2026-01-18 08:06:19.559+00	2026-01-18 11:11:05.683+00	f	\N
4adb1ec3-90bd-42cb-a070-0145e88c2a5c	+919940890213	VASANTHAN L	vasanthmail59@gmail.com	t	2026-01-02 16:16:09.098+00	2026-01-02 16:16:09.100174+00	\N	\N	\N	en	\N	\N	\N	GZ890213Y3X	\N	3	317.61	0	bronze	\N	2026-01-02 16:20:48.799+00	2026-01-02 16:22:24.22+00	f	\N
\.


--
-- Data for Name: vendor_delivery_zones; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.vendor_delivery_zones (id, vendor_id, zone_id, delivery_fee, min_delivery_time, max_delivery_time, minimum_order, is_active, created_at) FROM stdin;
\.


--
-- Data for Name: vendor_leads; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.vendor_leads (id, kitchen_name, contact_name, phone, email, city, food_type, status, created_at, updated_at, remarks) FROM stdin;
\.


--
-- Data for Name: vendor_payouts; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.vendor_payouts (id, vendor_id, period_start, period_end, gross_amount, commission, tax_deducted, net_amount, order_count, status, payment_reference, paid_at, created_at) FROM stdin;
\.


--
-- Data for Name: vendor_schedules; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.vendor_schedules (id, vendor_id, day_of_week, opening_time, closing_time, is_closed, created_at) FROM stdin;
\.


--
-- Data for Name: vendor_special_hours; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.vendor_special_hours (id, vendor_id, special_date, opening_time, closing_time, is_closed, reason, created_at) FROM stdin;
\.


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendors (id, name, description, image, rating, delivery_time, minimum_order, delivery_fee, cuisine_type, address, phone, is_active, is_featured, opening_hours, tags, created_at, updated_at, logo, banner_url, total_orders, total_reviews, whatsapp_number, email, is_open, is_verified, gst_number, fssai_license, bank_account, commission_rate, payout_frequency, status, latitude, longitude, is_blacklisted, password, otp, otp_expires_at, pincode, company_reg_no, owner_aadhar_no, pan_card_no, bank_account_no, ifsc_code, bank_name, account_holder_name, owner_name, company_type) FROM stdin;
3109c7d3-95e0-4a7a-86dd-9783e778d50f	Coimbatore Cafe, Peelamedu	Authentic South Indian vegetarian delicacies served with love.	https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=2670&auto=format&fit=crop	4.8		\N	\N	South Indian	164/165, Avinashi Rd, Coimbatore, Tamil Nadu 641004	9790312308	t	f	[{"day": "Monday", "open": "07:00", "close": "22:00"}, {"day": "Tuesday", "open": "07:00", "close": "22:00"}, {"day": "Wednesday", "open": "07:00", "close": "22:00"}, {"day": "Thursday", "open": "07:00", "close": "22:00"}, {"day": "Friday", "open": "07:00", "close": "22:00"}, {"day": "Saturday", "open": "07:00", "close": "22:00"}, {"day": "Sunday", "open": "07:00", "close": "22:00"}]	\N	2025-12-31 18:47:53.005502+00	2026-01-18 08:44:01.388842+00	\N	\N	0	0	\N	pichammal1967@gmail.com	t	f	\N	\N	\N	15.00	weekly	approved	11.024492091008764	77.00310586543303	t	qwe	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3109c7d3-95e0-4a7a-86dd-9783e778d50e	Coimbatore Cafe, SITRA	Authentic South Indian vegetarian delicacies served with love.	https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=2670&auto=format&fit=crop	4.8		\N	\N	South Indian	164/165, Avinashi Rd, Coimbatore, Tamil Nadu 641004	9790312308	t	f	[{"day": "Monday", "open": "07:00", "close": "22:00"}, {"day": "Tuesday", "open": "07:00", "close": "22:00"}, {"day": "Wednesday", "open": "07:00", "close": "22:00"}, {"day": "Thursday", "open": "07:00", "close": "22:00"}, {"day": "Friday", "open": "07:00", "close": "22:00"}, {"day": "Saturday", "open": "07:00", "close": "22:00"}, {"day": "Sunday", "open": "07:00", "close": "22:00"}]	\N	2025-12-31 18:47:53.005502+00	2026-01-18 08:43:58.949483+00	\N	\N	0	0	\N	pichammal1967@gmail.com	t	f	\N	\N	\N	15.00	weekly	approved	11.038335022716877	77.03816545123526	t	qwe	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3109c7d3-95e0-4a7a-86dd-9783e778d50c	Coimbatore Cafe, Radisson Blu	Authentic South Indian vegetarian delicacies served with love.	https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=2670&auto=format&fit=crop	4.8		\N	\N	South Indian	164/165, Avinashi Rd, Coimbatore, Tamil Nadu 641004	9790312308	t	f	[{"day": "Monday", "open": "07:00", "close": "22:00"}, {"day": "Tuesday", "open": "07:00", "close": "22:00"}, {"day": "Wednesday", "open": "07:00", "close": "22:00"}, {"day": "Thursday", "open": "07:00", "close": "22:00"}, {"day": "Friday", "open": "07:00", "close": "22:00"}, {"day": "Saturday", "open": "07:00", "close": "22:00"}, {"day": "Sunday", "open": "07:00", "close": "22:00"}]	\N	2025-12-31 18:47:53.005502+00	2026-01-18 08:51:28.205143+00	\N	\N	0	0	\N	pichammal1967@gmail.com	t	f	\N	\N	\N	15.00	weekly	approved	11.020672306760327	76.99276159257745	f	qwe	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3109c7d3-95e0-4a7a-86dd-9783e778d50d	Coimbatore Cafe, GK Nagar	Authentic South Indian vegetarian delicacies served with love.	https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=2670&auto=format&fit=crop	4.8		\N	\N	South Indian	164/165, Avinashi Rd, Coimbatore, Tamil Nadu 641004	9790312308	t	f	[{"day": "Monday", "open": "07:00", "close": "22:00"}, {"day": "Tuesday", "open": "07:00", "close": "22:00"}, {"day": "Wednesday", "open": "07:00", "close": "22:00"}, {"day": "Thursday", "open": "07:00", "close": "22:00"}, {"day": "Friday", "open": "07:00", "close": "22:00"}, {"day": "Saturday", "open": "07:00", "close": "22:00"}, {"day": "Sunday", "open": "07:00", "close": "22:00"}]	\N	2025-12-31 18:47:53.005502+00	2026-01-18 08:51:32.715864+00	\N	\N	0	0	\N	pichammal1967@gmail.com	t	f	\N	\N	\N	15.00	weekly	approved	11.046996185089585	77.05576557666393	t	qwe	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: waitlist; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.waitlist (id, user_id, type, target_id, user_phone, user_email, notified, notified_at, created_at) FROM stdin;
\.


--
-- Data for Name: messages_2025_12_26; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_12_26 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_12_27; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_12_27 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_12_28; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_12_28 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_12_29; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_12_29 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_12_30; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_12_30 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_12_31; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_12_31 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_01_01; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_01 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2026_01_02; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2026_01_02 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-11-13 14:03:59
20211116045059	2025-11-13 14:03:59
20211116050929	2025-11-13 14:04:00
20211116051442	2025-11-13 14:04:00
20211116212300	2025-11-13 14:04:00
20211116213355	2025-11-13 14:04:00
20211116213934	2025-11-13 14:04:00
20211116214523	2025-11-13 14:04:00
20211122062447	2025-11-13 14:04:00
20211124070109	2025-11-13 14:04:00
20211202204204	2025-11-13 14:04:00
20211202204605	2025-11-13 14:04:00
20211210212804	2025-11-13 14:04:00
20211228014915	2025-11-13 14:04:00
20220107221237	2025-11-13 14:04:00
20220228202821	2025-11-13 14:04:00
20220312004840	2025-11-13 14:04:00
20220603231003	2025-11-13 14:04:00
20220603232444	2025-11-13 14:04:00
20220615214548	2025-11-13 14:04:00
20220712093339	2025-11-13 14:04:00
20220908172859	2025-11-13 14:04:00
20220916233421	2025-11-13 14:04:00
20230119133233	2025-11-13 14:04:00
20230128025114	2025-11-13 14:04:00
20230128025212	2025-11-13 14:04:00
20230227211149	2025-11-13 14:04:00
20230228184745	2025-11-13 14:04:00
20230308225145	2025-11-13 14:04:00
20230328144023	2025-11-13 14:04:00
20231018144023	2025-11-13 14:04:00
20231204144023	2025-11-13 14:04:00
20231204144024	2025-11-13 14:04:00
20231204144025	2025-11-13 14:04:00
20240108234812	2025-11-13 14:04:00
20240109165339	2025-11-13 14:04:00
20240227174441	2025-11-13 14:04:00
20240311171622	2025-11-13 14:04:00
20240321100241	2025-11-13 14:04:00
20240401105812	2025-11-13 14:04:01
20240418121054	2025-11-13 14:04:01
20240523004032	2025-11-13 14:04:01
20240618124746	2025-11-13 14:04:01
20240801235015	2025-11-13 14:04:01
20240805133720	2025-11-13 14:04:01
20240827160934	2025-11-13 14:04:01
20240919163303	2025-11-13 14:04:01
20240919163305	2025-11-13 14:04:01
20241019105805	2025-11-13 14:04:01
20241030150047	2025-11-13 14:04:01
20241108114728	2025-11-13 14:04:01
20241121104152	2025-11-13 14:04:01
20241130184212	2025-11-13 14:04:01
20241220035512	2025-11-13 14:04:01
20241220123912	2025-11-13 14:04:01
20241224161212	2025-11-13 14:04:01
20250107150512	2025-11-13 14:04:01
20250110162412	2025-11-13 14:04:01
20250123174212	2025-11-13 14:04:01
20250128220012	2025-11-13 14:04:01
20250506224012	2025-11-13 14:04:01
20250523164012	2025-11-13 14:04:01
20250714121412	2025-11-13 14:04:01
20250905041441	2025-11-13 14:04:01
20251103001201	2025-11-13 14:04:01
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
Gutzo	Gutzo	\N	2025-11-01 13:24:10.778274+00	2025-11-01 13:24:10.778274+00	t	f	\N	\N	\N	STANDARD
vendor	vendor	\N	2025-12-21 15:53:43.994217+00	2025-12-21 15:53:43.994217+00	t	f	\N	\N	\N	STANDARD
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (id, type, format, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: iceberg_namespaces; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.iceberg_namespaces (id, bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: iceberg_tables; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.iceberg_tables (id, namespace_id, bucket_id, name, location, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-11-13 14:04:00.031263
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-11-13 14:04:00.046327
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-11-13 14:04:00.055363
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-11-13 14:04:00.097128
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-11-13 14:04:00.143705
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-11-13 14:04:00.152887
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-11-13 14:04:00.162207
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-11-13 14:04:00.177288
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-11-13 14:04:00.184733
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-11-13 14:04:00.192212
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-11-13 14:04:00.206439
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-11-13 14:04:00.219585
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-11-13 14:04:00.235383
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-11-13 14:04:00.249375
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-11-13 14:04:00.270523
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-11-13 14:04:00.316536
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-11-13 14:04:00.327865
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-11-13 14:04:00.33241
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-11-13 14:04:00.33712
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-11-13 14:04:00.346936
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-11-13 14:04:00.354282
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-11-13 14:04:00.36442
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-11-13 14:04:00.411989
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-11-13 14:04:00.466541
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-11-13 14:04:00.484814
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-11-13 14:04:00.494024
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-11-13 14:04:00.502071
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-11-13 14:04:00.545557
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-11-13 14:04:00.900192
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-11-13 14:04:00.908714
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-11-13 14:04:00.914958
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-11-13 14:04:00.997162
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-11-13 14:04:01.02426
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-11-13 14:04:01.045895
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-11-13 14:04:01.049951
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-11-13 14:04:01.063766
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-11-13 14:04:01.067982
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-11-13 14:04:01.085546
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-11-13 14:04:01.095566
39	add-search-v2-sort-support	39cf7d1e6bf515f4b02e41237aba845a7b492853	2025-11-13 14:04:01.143673
40	fix-prefix-race-conditions-optimized	fd02297e1c67df25a9fc110bf8c8a9af7fb06d1f	2025-11-13 14:04:01.150381
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2025-11-13 14:04:01.164999
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2025-11-13 14:04:01.17338
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2025-11-13 14:04:01.181468
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2025-11-13 14:04:01.185993
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2025-11-13 14:04:01.191344
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
c2e15ed8-6422-43a7-a210-cb0e7786f9ca	Gutzo	GUTZO11.svg	\N	2025-12-26 15:03:17.158508+00	2025-12-26 15:21:33.117187+00	2025-12-26 15:03:17.158508+00	{"eTag": "\\"43907dd14b38f348d62754e0a9025bd2\\"", "size": 3776, "mimetype": "image/svg+xml", "cacheControl": "max-age=3600", "lastModified": "2025-12-26T15:21:33.106Z", "contentLength": 3776, "httpStatusCode": 200}	8d3bfefb-2139-43df-8a8d-c7aa9f089ac6	\N	\N	1
0ac486d3-374f-4380-9785-bca28aeaa796	Gutzo	GUTZO.svg	\N	2025-12-10 08:10:48.688873+00	2025-12-26 15:21:39.072417+00	2025-12-10 08:10:48.688873+00	{"eTag": "\\"80a0ca7c26cab9f5f7f9b0ac0e2ecb42\\"", "size": 9099, "mimetype": "image/svg+xml", "cacheControl": "max-age=3600", "lastModified": "2025-12-26T15:21:39.068Z", "contentLength": 9099, "httpStatusCode": 200}	d760ca60-f08b-4a4b-8b1e-c35b55b7f9b8	\N	\N	1
60eebc6c-c821-474b-ba90-68e01e8ebbfe	Gutzo	GUTZO1.svg	\N	2025-11-13 18:16:06.056134+00	2025-12-10 08:11:17.189254+00	2025-11-13 18:16:06.056134+00	{"eTag": "\\"f2a8222fa3b7ecd65ca4b3128aa28334\\"", "size": 6837, "mimetype": "image/svg+xml", "cacheControl": "max-age=3600", "lastModified": "2025-12-10T08:11:17.182Z", "contentLength": 6837, "httpStatusCode": 200}	930eec41-9181-4dcd-8c5b-276051c070dc	\N	\N	1
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
vendor	Category	2025-12-21 15:58:37.05636+00	2025-12-21 15:58:37.05636+00
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
initial	2025-11-13 14:03:27.122288+00
20210809183423_update_grants	2025-11-13 14:03:27.122288+00
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 130, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1, false);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: activity_logs activity_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.activity_logs
    ADD CONSTRAINT activity_logs_pkey PRIMARY KEY (id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: cart cart_user_phone_product_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_phone_product_id_key UNIQUE (user_phone, product_id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: coupon_usage coupon_usage_coupon_id_user_id_order_id_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.coupon_usage
    ADD CONSTRAINT coupon_usage_coupon_id_user_id_order_id_key UNIQUE (coupon_id, user_id, order_id);


--
-- Name: coupon_usage coupon_usage_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.coupon_usage
    ADD CONSTRAINT coupon_usage_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_code_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_code_key UNIQUE (code);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: deliveries deliveries_order_id_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_order_id_key UNIQUE (order_id);


--
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);


--
-- Name: delivery_zones delivery_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.delivery_zones
    ADD CONSTRAINT delivery_zones_pkey PRIMARY KEY (id);


--
-- Name: inventory_logs inventory_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.inventory_logs
    ADD CONSTRAINT inventory_logs_pkey PRIMARY KEY (id);


--
-- Name: kv_store_6985f4e9 kv_store_6985f4e9_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kv_store_6985f4e9
    ADD CONSTRAINT kv_store_6985f4e9_pkey PRIMARY KEY (key);


--
-- Name: meal_plan_calendar meal_plan_calendar_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plan_calendar
    ADD CONSTRAINT meal_plan_calendar_pkey PRIMARY KEY (id);


--
-- Name: meal_plan_subscriptions meal_plan_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plan_subscriptions
    ADD CONSTRAINT meal_plan_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: meal_plans meal_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plans
    ADD CONSTRAINT meal_plans_pkey PRIMARY KEY (id);


--
-- Name: meal_templates meal_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_templates
    ADD CONSTRAINT meal_templates_pkey PRIMARY KEY (id);


--
-- Name: notification_preferences notification_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.notification_preferences
    ADD CONSTRAINT notification_preferences_pkey PRIMARY KEY (id);


--
-- Name: notification_preferences notification_preferences_user_id_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.notification_preferences
    ADD CONSTRAINT notification_preferences_user_id_key UNIQUE (user_id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_order_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_number_key UNIQUE (order_number);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: otp_verification otp_verification_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otp_verification
    ADD CONSTRAINT otp_verification_phone_key UNIQUE (phone);


--
-- Name: otp_verification otp_verification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otp_verification
    ADD CONSTRAINT otp_verification_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: payments payments_transaction_id_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_transaction_id_key UNIQUE (transaction_id);


--
-- Name: product_addons product_addons_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.product_addons
    ADD CONSTRAINT product_addons_pkey PRIMARY KEY (id);


--
-- Name: product_subscriptions product_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_subscriptions
    ADD CONSTRAINT product_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: product_variants product_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: promo_banners promo_banners_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.promo_banners
    ADD CONSTRAINT promo_banners_pkey PRIMARY KEY (id);


--
-- Name: referrals referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- Name: review_votes review_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.review_votes
    ADD CONSTRAINT review_votes_pkey PRIMARY KEY (id);


--
-- Name: review_votes review_votes_review_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.review_votes
    ADD CONSTRAINT review_votes_review_id_user_id_key UNIQUE (review_id, user_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_user_id_order_id_product_id_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_order_id_product_id_key UNIQUE (user_id, order_id, product_id);


--
-- Name: search_logs search_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.search_logs
    ADD CONSTRAINT search_logs_pkey PRIMARY KEY (id);


--
-- Name: subscription_deliveries subscription_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_deliveries
    ADD CONSTRAINT subscription_deliveries_pkey PRIMARY KEY (id);


--
-- Name: subscription_items subscription_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_items
    ADD CONSTRAINT subscription_items_pkey PRIMARY KEY (id);


--
-- Name: support_tickets support_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT support_tickets_pkey PRIMARY KEY (id);


--
-- Name: user_favorites unique_favorite; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT unique_favorite UNIQUE NULLS NOT DISTINCT (user_id, vendor_id, product_id);


--
-- Name: meal_plan_calendar unique_meal_plan_date; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plan_calendar
    ADD CONSTRAINT unique_meal_plan_date UNIQUE (meal_plan_id, menu_date);


--
-- Name: meal_templates unique_vendor_template_code; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_templates
    ADD CONSTRAINT unique_vendor_template_code UNIQUE (vendor_id, template_code);


--
-- Name: user_addresses user_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_pkey PRIMARY KEY (id);


--
-- Name: user_favorites user_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vendor_delivery_zones vendor_delivery_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_delivery_zones
    ADD CONSTRAINT vendor_delivery_zones_pkey PRIMARY KEY (id);


--
-- Name: vendor_delivery_zones vendor_delivery_zones_vendor_id_zone_id_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_delivery_zones
    ADD CONSTRAINT vendor_delivery_zones_vendor_id_zone_id_key UNIQUE (vendor_id, zone_id);


--
-- Name: vendor_leads vendor_leads_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_leads
    ADD CONSTRAINT vendor_leads_pkey PRIMARY KEY (id);


--
-- Name: vendor_payouts vendor_payouts_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_payouts
    ADD CONSTRAINT vendor_payouts_pkey PRIMARY KEY (id);


--
-- Name: vendor_schedules vendor_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_schedules
    ADD CONSTRAINT vendor_schedules_pkey PRIMARY KEY (id);


--
-- Name: vendor_schedules vendor_schedules_vendor_id_day_of_week_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_schedules
    ADD CONSTRAINT vendor_schedules_vendor_id_day_of_week_key UNIQUE (vendor_id, day_of_week);


--
-- Name: vendor_special_hours vendor_special_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_special_hours
    ADD CONSTRAINT vendor_special_hours_pkey PRIMARY KEY (id);


--
-- Name: vendor_special_hours vendor_special_hours_vendor_id_special_date_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_special_hours
    ADD CONSTRAINT vendor_special_hours_vendor_id_special_date_key UNIQUE (vendor_id, special_date);


--
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- Name: waitlist waitlist_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.waitlist
    ADD CONSTRAINT waitlist_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_12_26 messages_2025_12_26_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_26
    ADD CONSTRAINT messages_2025_12_26_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_12_27 messages_2025_12_27_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_27
    ADD CONSTRAINT messages_2025_12_27_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_12_28 messages_2025_12_28_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_28
    ADD CONSTRAINT messages_2025_12_28_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_12_29 messages_2025_12_29_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_29
    ADD CONSTRAINT messages_2025_12_29_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_12_30 messages_2025_12_30_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_30
    ADD CONSTRAINT messages_2025_12_30_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_12_31 messages_2025_12_31_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_31
    ADD CONSTRAINT messages_2025_12_31_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_01 messages_2026_01_01_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_01
    ADD CONSTRAINT messages_2026_01_01_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2026_01_02 messages_2026_01_02_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2026_01_02
    ADD CONSTRAINT messages_2026_01_02_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: iceberg_namespaces iceberg_namespaces_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_namespaces
    ADD CONSTRAINT iceberg_namespaces_pkey PRIMARY KEY (id);


--
-- Name: iceberg_tables iceberg_tables_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: extensions_tenant_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE INDEX extensions_tenant_external_id_index ON _realtime.extensions USING btree (tenant_external_id);


--
-- Name: extensions_tenant_external_id_type_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);


--
-- Name: tenants_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: idx_activity_logs_user; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_activity_logs_user ON public.activity_logs USING btree (user_id);


--
-- Name: idx_calendar_breakfast; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_calendar_breakfast ON public.meal_plan_calendar USING btree (breakfast_template_id);


--
-- Name: idx_calendar_date_range; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_calendar_date_range ON public.meal_plan_calendar USING btree (menu_date);


--
-- Name: idx_calendar_dinner; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_calendar_dinner ON public.meal_plan_calendar USING btree (dinner_template_id);


--
-- Name: idx_calendar_lunch; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_calendar_lunch ON public.meal_plan_calendar USING btree (lunch_template_id);


--
-- Name: idx_calendar_meal_plan; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_calendar_meal_plan ON public.meal_plan_calendar USING btree (meal_plan_id, menu_date);


--
-- Name: idx_calendar_snack; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_calendar_snack ON public.meal_plan_calendar USING btree (snack_template_id);


--
-- Name: idx_cart_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cart_created_at ON public.cart USING btree (created_at);


--
-- Name: idx_cart_user_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cart_user_phone ON public.cart USING btree (user_phone);


--
-- Name: idx_cart_vendor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cart_vendor_id ON public.cart USING btree (vendor_id);


--
-- Name: idx_coupon_usage_user; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_coupon_usage_user ON public.coupon_usage USING btree (user_id);


--
-- Name: idx_coupons_active; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_coupons_active ON public.coupons USING btree (is_active) WHERE (is_active = true);


--
-- Name: idx_coupons_code; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_coupons_code ON public.coupons USING btree (code);


--
-- Name: idx_delivery_zones_city; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_delivery_zones_city ON public.delivery_zones USING btree (city);


--
-- Name: idx_inventory_logs_product; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_inventory_logs_product ON public.inventory_logs USING btree (product_id);


--
-- Name: idx_meal_plan_subs_status; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_meal_plan_subs_status ON public.meal_plan_subscriptions USING btree (status);


--
-- Name: idx_meal_plan_subs_user; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_meal_plan_subs_user ON public.meal_plan_subscriptions USING btree (user_id);


--
-- Name: idx_meal_plans_active; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_meal_plans_active ON public.meal_plans USING btree (is_active) WHERE (is_active = true);


--
-- Name: idx_meal_plans_vendor; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_meal_plans_vendor ON public.meal_plans USING btree (vendor_id);


--
-- Name: idx_meal_templates_active; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_meal_templates_active ON public.meal_templates USING btree (vendor_id, is_active);


--
-- Name: idx_meal_templates_code; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_meal_templates_code ON public.meal_templates USING btree (vendor_id, template_code);


--
-- Name: idx_meal_templates_type; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_meal_templates_type ON public.meal_templates USING btree (vendor_id, meal_type);


--
-- Name: idx_meal_templates_vendor; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_meal_templates_vendor ON public.meal_templates USING btree (vendor_id);


--
-- Name: idx_notifications_unread; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_notifications_unread ON public.notifications USING btree (user_id) WHERE (is_read = false);


--
-- Name: idx_notifications_user; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_notifications_user ON public.notifications USING btree (user_id);


--
-- Name: idx_order_items_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_order_id ON public.order_items USING btree (order_id);


--
-- Name: idx_order_items_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_product_id ON public.order_items USING btree (product_id);


--
-- Name: idx_orders_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_created_at ON public.orders USING btree (created_at DESC);


--
-- Name: idx_orders_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_number ON public.orders USING btree (order_number);


--
-- Name: idx_orders_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_status ON public.orders USING btree (status);


--
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- Name: idx_orders_vendor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_vendor_id ON public.orders USING btree (vendor_id);


--
-- Name: idx_otp_verification_expires; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_otp_verification_expires ON public.otp_verification USING btree (expires_at);


--
-- Name: idx_otp_verification_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_otp_verification_phone ON public.otp_verification USING btree (phone);


--
-- Name: idx_payments_order; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_payments_order ON public.payments USING btree (order_id);


--
-- Name: idx_payments_status; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_payments_status ON public.payments USING btree (status);


--
-- Name: idx_payments_transaction; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_payments_transaction ON public.payments USING btree (transaction_id);


--
-- Name: idx_product_addons_product; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_product_addons_product ON public.product_addons USING btree (product_id);


--
-- Name: idx_product_variants_product; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_product_variants_product ON public.product_variants USING btree (product_id);


--
-- Name: idx_products_available; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_available ON public.products USING btree (is_available);


--
-- Name: idx_products_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_category ON public.products USING btree (category);


--
-- Name: idx_products_featured; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_featured ON public.products USING btree (vendor_id, is_featured);


--
-- Name: idx_products_vendor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_vendor_id ON public.products USING btree (vendor_id);


--
-- Name: idx_promo_banners_active; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_promo_banners_active ON public.promo_banners USING btree (is_active) WHERE (is_active = true);


--
-- Name: idx_referrals_code; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_referrals_code ON public.referrals USING btree (referral_code);


--
-- Name: idx_reviews_product; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_reviews_product ON public.reviews USING btree (product_id);


--
-- Name: idx_reviews_status; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_reviews_status ON public.reviews USING btree (status) WHERE (status = 'published'::text);


--
-- Name: idx_reviews_user; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_reviews_user ON public.reviews USING btree (user_id);


--
-- Name: idx_reviews_vendor; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_reviews_vendor ON public.reviews USING btree (vendor_id);


--
-- Name: idx_search_logs_query; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_search_logs_query ON public.search_logs USING btree (query);


--
-- Name: idx_subscriptions_active_dates; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_subscriptions_active_dates ON public.product_subscriptions USING btree (start_date, end_date) WHERE (status = 'active'::text);


--
-- Name: idx_subscriptions_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_subscriptions_status ON public.product_subscriptions USING btree (status);


--
-- Name: idx_subscriptions_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_subscriptions_user_id ON public.product_subscriptions USING btree (user_id);


--
-- Name: idx_subscriptions_vendor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_subscriptions_vendor_id ON public.product_subscriptions USING btree (vendor_id);


--
-- Name: idx_support_tickets_status; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_support_tickets_status ON public.support_tickets USING btree (status);


--
-- Name: idx_support_tickets_user; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_support_tickets_user ON public.support_tickets USING btree (user_id);


--
-- Name: idx_user_addresses_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_addresses_default ON public.user_addresses USING btree (is_default) WHERE (is_default = true);


--
-- Name: idx_user_addresses_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_addresses_type ON public.user_addresses USING btree (type);


--
-- Name: idx_user_addresses_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_addresses_user_id ON public.user_addresses USING btree (user_id);


--
-- Name: idx_user_favorites_user; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_user_favorites_user ON public.user_favorites USING btree (user_id);


--
-- Name: idx_users_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_phone ON public.users USING btree (phone);


--
-- Name: idx_users_verified; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_users_verified ON public.users USING btree (verified);


--
-- Name: idx_vendor_payouts_status; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_vendor_payouts_status ON public.vendor_payouts USING btree (status);


--
-- Name: idx_vendor_payouts_vendor; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_vendor_payouts_vendor ON public.vendor_payouts USING btree (vendor_id);


--
-- Name: idx_vendor_schedules_vendor; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_vendor_schedules_vendor ON public.vendor_schedules USING btree (vendor_id);


--
-- Name: idx_vendor_special_hours_date; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_vendor_special_hours_date ON public.vendor_special_hours USING btree (special_date);


--
-- Name: idx_vendor_special_hours_vendor; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_vendor_special_hours_vendor ON public.vendor_special_hours USING btree (vendor_id);


--
-- Name: idx_vendor_zones_vendor; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_vendor_zones_vendor ON public.vendor_delivery_zones USING btree (vendor_id);


--
-- Name: idx_vendors_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_vendors_active ON public.vendors USING btree (is_active);


--
-- Name: idx_vendors_cuisine; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_vendors_cuisine ON public.vendors USING btree (cuisine_type);


--
-- Name: idx_vendors_featured; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_vendors_featured ON public.vendors USING btree (is_featured);


--
-- Name: idx_waitlist_target; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX idx_waitlist_target ON public.waitlist USING btree (type, target_id);


--
-- Name: kv_store_6985f4e9_key_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx1 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx10; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx10 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx11; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx11 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx12; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx12 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx13; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx13 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx14; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx14 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx15 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx16; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx16 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx17; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx17 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx18 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx2 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx3 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx4 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx5 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx6 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx7 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx8 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: kv_store_6985f4e9_key_idx9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kv_store_6985f4e9_key_idx9 ON public.kv_store_6985f4e9 USING btree (key text_pattern_ops);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_12_26_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_26_inserted_at_topic_idx ON realtime.messages_2025_12_26 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_12_27_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_27_inserted_at_topic_idx ON realtime.messages_2025_12_27 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_12_28_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_28_inserted_at_topic_idx ON realtime.messages_2025_12_28 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_12_29_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_29_inserted_at_topic_idx ON realtime.messages_2025_12_29 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_12_30_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_30_inserted_at_topic_idx ON realtime.messages_2025_12_30 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2025_12_31_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_31_inserted_at_topic_idx ON realtime.messages_2025_12_31 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_01_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_01_inserted_at_topic_idx ON realtime.messages_2026_01_01 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: messages_2026_01_02_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2026_01_02_inserted_at_topic_idx ON realtime.messages_2026_01_02 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_iceberg_namespaces_bucket_id; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_iceberg_namespaces_bucket_id ON storage.iceberg_namespaces USING btree (bucket_id, name);


--
-- Name: idx_iceberg_tables_namespace_id; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_iceberg_tables_namespace_id ON storage.iceberg_tables USING btree (namespace_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: messages_2025_12_26_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_26_inserted_at_topic_idx;


--
-- Name: messages_2025_12_26_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_26_pkey;


--
-- Name: messages_2025_12_27_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_27_inserted_at_topic_idx;


--
-- Name: messages_2025_12_27_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_27_pkey;


--
-- Name: messages_2025_12_28_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_28_inserted_at_topic_idx;


--
-- Name: messages_2025_12_28_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_28_pkey;


--
-- Name: messages_2025_12_29_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_29_inserted_at_topic_idx;


--
-- Name: messages_2025_12_29_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_29_pkey;


--
-- Name: messages_2025_12_30_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_30_inserted_at_topic_idx;


--
-- Name: messages_2025_12_30_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_30_pkey;


--
-- Name: messages_2025_12_31_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_31_inserted_at_topic_idx;


--
-- Name: messages_2025_12_31_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_31_pkey;


--
-- Name: messages_2026_01_01_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_01_inserted_at_topic_idx;


--
-- Name: messages_2026_01_01_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_01_pkey;


--
-- Name: messages_2026_01_02_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2026_01_02_inserted_at_topic_idx;


--
-- Name: messages_2026_01_02_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2026_01_02_pkey;


--
-- Name: cart cart_updated_at_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER cart_updated_at_trigger BEFORE UPDATE ON public.cart FOR EACH ROW EXECUTE FUNCTION public.update_cart_updated_at();


--
-- Name: user_addresses ensure_single_default_address_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ensure_single_default_address_trigger BEFORE INSERT OR UPDATE ON public.user_addresses FOR EACH ROW EXECUTE FUNCTION public.ensure_single_default_address();


--
-- Name: meal_templates trigger_set_template_code; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER trigger_set_template_code BEFORE INSERT ON public.meal_templates FOR EACH ROW EXECUTE FUNCTION public.set_template_code();


--
-- Name: meal_plan_calendar trigger_update_meal_calendar_timestamp; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER trigger_update_meal_calendar_timestamp BEFORE UPDATE ON public.meal_plan_calendar FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: meal_templates trigger_update_meal_templates_timestamp; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER trigger_update_meal_templates_timestamp BEFORE UPDATE ON public.meal_templates FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();


--
-- Name: orders update_orders_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_orders_updated_at BEFORE UPDATE ON public.orders FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: products update_products_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: subscription_deliveries update_subscription_deliveries_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_subscription_deliveries_updated_at BEFORE UPDATE ON public.subscription_deliveries FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: product_subscriptions update_subscriptions_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_subscriptions_updated_at BEFORE UPDATE ON public.product_subscriptions FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: user_addresses update_user_addresses_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_user_addresses_updated_at BEFORE UPDATE ON public.user_addresses FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: vendors update_vendors_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_vendors_updated_at BEFORE UPDATE ON public.vendors FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: extensions extensions_tenant_external_id_fkey; Type: FK CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: activity_logs activity_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.activity_logs
    ADD CONSTRAINT activity_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: coupon_usage coupon_usage_coupon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.coupon_usage
    ADD CONSTRAINT coupon_usage_coupon_id_fkey FOREIGN KEY (coupon_id) REFERENCES public.coupons(id) ON DELETE CASCADE;


--
-- Name: coupon_usage coupon_usage_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.coupon_usage
    ADD CONSTRAINT coupon_usage_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE SET NULL;


--
-- Name: coupon_usage coupon_usage_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.coupon_usage
    ADD CONSTRAINT coupon_usage_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: coupons coupons_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: deliveries deliveries_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: cart fk_cart_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_cart_product FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: cart fk_cart_vendor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_cart_vendor FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: inventory_logs inventory_logs_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.inventory_logs
    ADD CONSTRAINT inventory_logs_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: inventory_logs inventory_logs_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.inventory_logs
    ADD CONSTRAINT inventory_logs_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: meal_plan_calendar meal_plan_calendar_breakfast_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plan_calendar
    ADD CONSTRAINT meal_plan_calendar_breakfast_template_id_fkey FOREIGN KEY (breakfast_template_id) REFERENCES public.meal_templates(id) ON DELETE SET NULL;


--
-- Name: meal_plan_calendar meal_plan_calendar_dinner_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plan_calendar
    ADD CONSTRAINT meal_plan_calendar_dinner_template_id_fkey FOREIGN KEY (dinner_template_id) REFERENCES public.meal_templates(id) ON DELETE SET NULL;


--
-- Name: meal_plan_calendar meal_plan_calendar_lunch_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plan_calendar
    ADD CONSTRAINT meal_plan_calendar_lunch_template_id_fkey FOREIGN KEY (lunch_template_id) REFERENCES public.meal_templates(id) ON DELETE SET NULL;


--
-- Name: meal_plan_calendar meal_plan_calendar_meal_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plan_calendar
    ADD CONSTRAINT meal_plan_calendar_meal_plan_id_fkey FOREIGN KEY (meal_plan_id) REFERENCES public.meal_plans(id) ON DELETE CASCADE;


--
-- Name: meal_plan_calendar meal_plan_calendar_snack_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plan_calendar
    ADD CONSTRAINT meal_plan_calendar_snack_template_id_fkey FOREIGN KEY (snack_template_id) REFERENCES public.meal_templates(id) ON DELETE SET NULL;


--
-- Name: meal_plan_subscriptions meal_plan_subscriptions_meal_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plan_subscriptions
    ADD CONSTRAINT meal_plan_subscriptions_meal_plan_id_fkey FOREIGN KEY (meal_plan_id) REFERENCES public.meal_plans(id) ON DELETE SET NULL;


--
-- Name: meal_plan_subscriptions meal_plan_subscriptions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plan_subscriptions
    ADD CONSTRAINT meal_plan_subscriptions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: meal_plans meal_plans_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_plans
    ADD CONSTRAINT meal_plans_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: meal_templates meal_templates_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_templates
    ADD CONSTRAINT meal_templates_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE SET NULL;


--
-- Name: meal_templates meal_templates_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.meal_templates
    ADD CONSTRAINT meal_templates_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: notification_preferences notification_preferences_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.notification_preferences
    ADD CONSTRAINT notification_preferences_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: order_items order_items_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id);


--
-- Name: orders orders_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id);


--
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE SET NULL;


--
-- Name: payments payments_subscription_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES public.product_subscriptions(id) ON DELETE SET NULL;


--
-- Name: product_addons product_addons_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.product_addons
    ADD CONSTRAINT product_addons_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: product_subscriptions product_subscriptions_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_subscriptions
    ADD CONSTRAINT product_subscriptions_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id);


--
-- Name: product_variants product_variants_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.product_variants
    ADD CONSTRAINT product_variants_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products products_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: referrals referrals_first_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_first_order_id_fkey FOREIGN KEY (first_order_id) REFERENCES public.orders(id) ON DELETE SET NULL;


--
-- Name: referrals referrals_referee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_referee_id_fkey FOREIGN KEY (referee_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: referrals referrals_referrer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_referrer_id_fkey FOREIGN KEY (referrer_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: review_votes review_votes_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.review_votes
    ADD CONSTRAINT review_votes_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(id) ON DELETE CASCADE;


--
-- Name: review_votes review_votes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.review_votes
    ADD CONSTRAINT review_votes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE SET NULL;


--
-- Name: reviews reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE SET NULL;


--
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: reviews reviews_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: search_logs search_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.search_logs
    ADD CONSTRAINT search_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: subscription_deliveries subscription_deliveries_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_deliveries
    ADD CONSTRAINT subscription_deliveries_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: subscription_deliveries subscription_deliveries_subscription_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_deliveries
    ADD CONSTRAINT subscription_deliveries_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES public.product_subscriptions(id) ON DELETE CASCADE;


--
-- Name: subscription_items subscription_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_items
    ADD CONSTRAINT subscription_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: subscription_items subscription_items_subscription_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_items
    ADD CONSTRAINT subscription_items_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES public.product_subscriptions(id) ON DELETE CASCADE;


--
-- Name: support_tickets support_tickets_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT support_tickets_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE SET NULL;


--
-- Name: support_tickets support_tickets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.support_tickets
    ADD CONSTRAINT support_tickets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_addresses user_addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT user_addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_favorites user_favorites_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: user_favorites user_favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_favorites user_favorites_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_favorites
    ADD CONSTRAINT user_favorites_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: vendor_delivery_zones vendor_delivery_zones_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_delivery_zones
    ADD CONSTRAINT vendor_delivery_zones_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: vendor_delivery_zones vendor_delivery_zones_zone_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_delivery_zones
    ADD CONSTRAINT vendor_delivery_zones_zone_id_fkey FOREIGN KEY (zone_id) REFERENCES public.delivery_zones(id) ON DELETE CASCADE;


--
-- Name: vendor_payouts vendor_payouts_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_payouts
    ADD CONSTRAINT vendor_payouts_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: vendor_schedules vendor_schedules_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_schedules
    ADD CONSTRAINT vendor_schedules_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: vendor_special_hours vendor_special_hours_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.vendor_special_hours
    ADD CONSTRAINT vendor_special_hours_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: waitlist waitlist_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.waitlist
    ADD CONSTRAINT waitlist_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: iceberg_namespaces iceberg_namespaces_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_namespaces
    ADD CONSTRAINT iceberg_namespaces_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_analytics(id) ON DELETE CASCADE;


--
-- Name: iceberg_tables iceberg_tables_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_analytics(id) ON DELETE CASCADE;


--
-- Name: iceberg_tables iceberg_tables_namespace_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.iceberg_tables
    ADD CONSTRAINT iceberg_tables_namespace_id_fkey FOREIGN KEY (namespace_id) REFERENCES storage.iceberg_namespaces(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: categories Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.categories FOR SELECT USING (true);


--
-- Name: promo_banners Public can view active banners; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Public can view active banners" ON public.promo_banners FOR SELECT USING ((is_active = true));


--
-- Name: coupons Public can view active coupons; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Public can view active coupons" ON public.coupons FOR SELECT USING ((is_active = true));


--
-- Name: meal_plans Public can view active meal plans; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Public can view active meal plans" ON public.meal_plans FOR SELECT USING ((is_active = true));


--
-- Name: vendors Public can view active vendors; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public can view active vendors" ON public.vendors FOR SELECT USING ((is_active = true));


--
-- Name: delivery_zones Public can view active zones; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Public can view active zones" ON public.delivery_zones FOR SELECT USING ((is_active = true));


--
-- Name: product_addons Public can view addons; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Public can view addons" ON public.product_addons FOR SELECT USING ((is_available = true));


--
-- Name: products Public can view available products; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public can view available products" ON public.products FOR SELECT USING ((is_available = true));


--
-- Name: categories Public can view categories; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public can view categories" ON public.categories FOR SELECT USING ((is_active = true));


--
-- Name: reviews Public can view published reviews; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Public can view published reviews" ON public.reviews FOR SELECT USING ((status = 'published'::text));


--
-- Name: vendor_schedules Public can view schedules; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Public can view schedules" ON public.vendor_schedules FOR SELECT USING (true);


--
-- Name: vendor_special_hours Public can view special hours; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Public can view special hours" ON public.vendor_special_hours FOR SELECT USING (true);


--
-- Name: product_variants Public can view variants; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Public can view variants" ON public.product_variants FOR SELECT USING ((is_available = true));


--
-- Name: vendor_delivery_zones Public can view vendor zones; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Public can view vendor zones" ON public.vendor_delivery_zones FOR SELECT USING ((is_active = true));


--
-- Name: cart Service role can access all cart items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Service role can access all cart items" ON public.cart USING ((auth.role() = 'service_role'::text));


--
-- Name: otp_verification Service role can manage OTP records; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Service role can manage OTP records" ON public.otp_verification USING ((auth.role() = 'service_role'::text));


--
-- Name: users Service role can manage users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Service role can manage users" ON public.users USING ((auth.role() = 'service_role'::text));


--
-- Name: orders Users can create orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can create orders" ON public.orders FOR INSERT WITH CHECK (((auth.uid())::text = (user_id)::text));


--
-- Name: user_addresses Users can delete own addresses; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can delete own addresses" ON public.user_addresses FOR DELETE USING ((auth.uid() = user_id));


--
-- Name: user_addresses Users can insert own addresses; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert own addresses" ON public.user_addresses FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: product_subscriptions Users can manage own subscriptions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage own subscriptions" ON public.product_subscriptions USING (((auth.uid())::text = (user_id)::text));


--
-- Name: cart Users can manage their own cart items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can manage their own cart items" ON public.cart USING (((user_phone)::text = current_setting('app.current_user_phone'::text, true)));


--
-- Name: user_addresses Users can update own addresses; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update own addresses" ON public.user_addresses FOR UPDATE USING ((auth.uid() = user_id));


--
-- Name: user_addresses Users can view own addresses; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own addresses" ON public.user_addresses FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: notifications Users can view own notifications; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Users can view own notifications" ON public.notifications FOR SELECT USING (true);


--
-- Name: order_items Users can view own order items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own order items" ON public.order_items FOR SELECT USING ((EXISTS ( SELECT 1
   FROM public.orders
  WHERE ((orders.id = order_items.order_id) AND ((orders.user_id)::text = (auth.uid())::text)))));


--
-- Name: orders Users can view own orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own orders" ON public.orders FOR SELECT USING (((auth.uid())::text = (user_id)::text));


--
-- Name: subscription_items Users can view own subscription items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view own subscription items" ON public.subscription_items FOR SELECT USING ((EXISTS ( SELECT 1
   FROM public.product_subscriptions
  WHERE ((product_subscriptions.id = subscription_items.subscription_id) AND ((product_subscriptions.user_id)::text = (auth.uid())::text)))));


--
-- Name: activity_logs; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.activity_logs ENABLE ROW LEVEL SECURITY;

--
-- Name: cart; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.cart ENABLE ROW LEVEL SECURITY;

--
-- Name: categories; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;

--
-- Name: coupon_usage; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.coupon_usage ENABLE ROW LEVEL SECURITY;

--
-- Name: coupons; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.coupons ENABLE ROW LEVEL SECURITY;

--
-- Name: delivery_zones; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.delivery_zones ENABLE ROW LEVEL SECURITY;

--
-- Name: inventory_logs; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.inventory_logs ENABLE ROW LEVEL SECURITY;

--
-- Name: kv_store_6985f4e9; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.kv_store_6985f4e9 ENABLE ROW LEVEL SECURITY;

--
-- Name: meal_plan_subscriptions; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.meal_plan_subscriptions ENABLE ROW LEVEL SECURITY;

--
-- Name: meal_plans; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.meal_plans ENABLE ROW LEVEL SECURITY;

--
-- Name: notification_preferences; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.notification_preferences ENABLE ROW LEVEL SECURITY;

--
-- Name: notifications; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

--
-- Name: order_items; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.order_items ENABLE ROW LEVEL SECURITY;

--
-- Name: orders; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;

--
-- Name: otp_verification; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.otp_verification ENABLE ROW LEVEL SECURITY;

--
-- Name: payments; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.payments ENABLE ROW LEVEL SECURITY;

--
-- Name: product_addons; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.product_addons ENABLE ROW LEVEL SECURITY;

--
-- Name: product_subscriptions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.product_subscriptions ENABLE ROW LEVEL SECURITY;

--
-- Name: product_variants; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.product_variants ENABLE ROW LEVEL SECURITY;

--
-- Name: promo_banners; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.promo_banners ENABLE ROW LEVEL SECURITY;

--
-- Name: referrals; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.referrals ENABLE ROW LEVEL SECURITY;

--
-- Name: review_votes; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.review_votes ENABLE ROW LEVEL SECURITY;

--
-- Name: reviews; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.reviews ENABLE ROW LEVEL SECURITY;

--
-- Name: search_logs; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.search_logs ENABLE ROW LEVEL SECURITY;

--
-- Name: subscription_deliveries; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.subscription_deliveries ENABLE ROW LEVEL SECURITY;

--
-- Name: subscription_items; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.subscription_items ENABLE ROW LEVEL SECURITY;

--
-- Name: support_tickets; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.support_tickets ENABLE ROW LEVEL SECURITY;

--
-- Name: user_addresses; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_addresses ENABLE ROW LEVEL SECURITY;

--
-- Name: user_favorites; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.user_favorites ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

--
-- Name: vendor_delivery_zones; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.vendor_delivery_zones ENABLE ROW LEVEL SECURITY;

--
-- Name: vendor_payouts; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.vendor_payouts ENABLE ROW LEVEL SECURITY;

--
-- Name: vendor_schedules; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.vendor_schedules ENABLE ROW LEVEL SECURITY;

--
-- Name: vendor_special_hours; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.vendor_special_hours ENABLE ROW LEVEL SECURITY;

--
-- Name: waitlist; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.waitlist ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: iceberg_namespaces; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.iceberg_namespaces ENABLE ROW LEVEL SECURITY;

--
-- Name: iceberg_tables; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.iceberg_tables ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime_messages_publication OWNER TO supabase_admin;

--
-- Name: supabase_realtime orders; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.orders;


--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: supabase_admin
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA net; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO postgres;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA supabase_functions; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;
SET SESSION AUTHORIZATION postgres;
GRANT USAGE ON SCHEMA vault TO service_role;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- Name: FUNCTION assign_template_to_meal(p_meal_plan_id uuid, p_template_code text, p_meal_slot text, p_start_date date, p_end_date date, p_day_of_week integer); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.assign_template_to_meal(p_meal_plan_id uuid, p_template_code text, p_meal_slot text, p_start_date date, p_end_date date, p_day_of_week integer) TO postgres;
GRANT ALL ON FUNCTION public.assign_template_to_meal(p_meal_plan_id uuid, p_template_code text, p_meal_slot text, p_start_date date, p_end_date date, p_day_of_week integer) TO anon;
GRANT ALL ON FUNCTION public.assign_template_to_meal(p_meal_plan_id uuid, p_template_code text, p_meal_slot text, p_start_date date, p_end_date date, p_day_of_week integer) TO authenticated;
GRANT ALL ON FUNCTION public.assign_template_to_meal(p_meal_plan_id uuid, p_template_code text, p_meal_slot text, p_start_date date, p_end_date date, p_day_of_week integer) TO service_role;


--
-- Name: FUNCTION ensure_single_default_address(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.ensure_single_default_address() TO anon;
GRANT ALL ON FUNCTION public.ensure_single_default_address() TO authenticated;
GRANT ALL ON FUNCTION public.ensure_single_default_address() TO service_role;


--
-- Name: FUNCTION generate_template_code(p_vendor_id uuid); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.generate_template_code(p_vendor_id uuid) TO postgres;
GRANT ALL ON FUNCTION public.generate_template_code(p_vendor_id uuid) TO anon;
GRANT ALL ON FUNCTION public.generate_template_code(p_vendor_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.generate_template_code(p_vendor_id uuid) TO service_role;


--
-- Name: FUNCTION get_user_default_address(input_user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_user_default_address(input_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.get_user_default_address(input_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_user_default_address(input_user_id uuid) TO service_role;


--
-- Name: FUNCTION set_template_code(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.set_template_code() TO postgres;
GRANT ALL ON FUNCTION public.set_template_code() TO anon;
GRANT ALL ON FUNCTION public.set_template_code() TO authenticated;
GRANT ALL ON FUNCTION public.set_template_code() TO service_role;


--
-- Name: FUNCTION update_cart_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_cart_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_cart_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_cart_updated_at() TO service_role;


--
-- Name: FUNCTION update_updated_at(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.update_updated_at() TO postgres;
GRANT ALL ON FUNCTION public.update_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_updated_at() TO service_role;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_updated_at_column() TO anon;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO authenticated;
GRANT ALL ON FUNCTION public.update_updated_at_column() TO service_role;


--
-- Name: FUNCTION update_user_addresses_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_user_addresses_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_user_addresses_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_user_addresses_updated_at() TO service_role;


--
-- Name: FUNCTION upsert_otp_verification(p_phone text, p_otp text, p_expires_at timestamp with time zone); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.upsert_otp_verification(p_phone text, p_otp text, p_expires_at timestamp with time zone) TO anon;
GRANT ALL ON FUNCTION public.upsert_otp_verification(p_phone text, p_otp text, p_expires_at timestamp with time zone) TO authenticated;
GRANT ALL ON FUNCTION public.upsert_otp_verification(p_phone text, p_otp text, p_expires_at timestamp with time zone) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION http_request(); Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;
RESET SESSION AUTHORIZATION;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;
SET SESSION AUTHORIZATION postgres;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.flow_state TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.identities TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.instances TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.saml_providers TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.sessions TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.sso_domains TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.sso_providers TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT ON TABLE auth.users TO dashboard_user;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;


--
-- Name: TABLE activity_logs; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.activity_logs TO postgres;
GRANT ALL ON TABLE public.activity_logs TO anon;
GRANT ALL ON TABLE public.activity_logs TO authenticated;
GRANT ALL ON TABLE public.activity_logs TO service_role;


--
-- Name: TABLE cart; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cart TO anon;
GRANT ALL ON TABLE public.cart TO authenticated;
GRANT ALL ON TABLE public.cart TO service_role;


--
-- Name: TABLE categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.categories TO anon;
GRANT ALL ON TABLE public.categories TO authenticated;
GRANT ALL ON TABLE public.categories TO service_role;


--
-- Name: TABLE coupon_usage; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.coupon_usage TO postgres;
GRANT ALL ON TABLE public.coupon_usage TO anon;
GRANT ALL ON TABLE public.coupon_usage TO authenticated;
GRANT ALL ON TABLE public.coupon_usage TO service_role;


--
-- Name: TABLE coupons; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.coupons TO postgres;
GRANT ALL ON TABLE public.coupons TO anon;
GRANT ALL ON TABLE public.coupons TO authenticated;
GRANT ALL ON TABLE public.coupons TO service_role;


--
-- Name: TABLE deliveries; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.deliveries TO postgres;
GRANT ALL ON TABLE public.deliveries TO anon;
GRANT ALL ON TABLE public.deliveries TO authenticated;
GRANT ALL ON TABLE public.deliveries TO service_role;


--
-- Name: TABLE delivery_zones; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.delivery_zones TO postgres;
GRANT ALL ON TABLE public.delivery_zones TO anon;
GRANT ALL ON TABLE public.delivery_zones TO authenticated;
GRANT ALL ON TABLE public.delivery_zones TO service_role;


--
-- Name: TABLE inventory_logs; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.inventory_logs TO postgres;
GRANT ALL ON TABLE public.inventory_logs TO anon;
GRANT ALL ON TABLE public.inventory_logs TO authenticated;
GRANT ALL ON TABLE public.inventory_logs TO service_role;


--
-- Name: TABLE kv_store_6985f4e9; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.kv_store_6985f4e9 TO anon;
GRANT ALL ON TABLE public.kv_store_6985f4e9 TO authenticated;
GRANT ALL ON TABLE public.kv_store_6985f4e9 TO service_role;


--
-- Name: TABLE meal_plan_calendar; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.meal_plan_calendar TO postgres;
GRANT ALL ON TABLE public.meal_plan_calendar TO anon;
GRANT ALL ON TABLE public.meal_plan_calendar TO authenticated;
GRANT ALL ON TABLE public.meal_plan_calendar TO service_role;


--
-- Name: TABLE meal_plan_day_menu_backup; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.meal_plan_day_menu_backup TO postgres;
GRANT ALL ON TABLE public.meal_plan_day_menu_backup TO anon;
GRANT ALL ON TABLE public.meal_plan_day_menu_backup TO authenticated;
GRANT ALL ON TABLE public.meal_plan_day_menu_backup TO service_role;


--
-- Name: TABLE meal_plans; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.meal_plans TO postgres;
GRANT ALL ON TABLE public.meal_plans TO anon;
GRANT ALL ON TABLE public.meal_plans TO authenticated;
GRANT ALL ON TABLE public.meal_plans TO service_role;


--
-- Name: TABLE meal_templates; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.meal_templates TO postgres;
GRANT ALL ON TABLE public.meal_templates TO anon;
GRANT ALL ON TABLE public.meal_templates TO authenticated;
GRANT ALL ON TABLE public.meal_templates TO service_role;


--
-- Name: TABLE vendors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.vendors TO anon;
GRANT ALL ON TABLE public.vendors TO authenticated;
GRANT ALL ON TABLE public.vendors TO service_role;


--
-- Name: TABLE meal_plan_menu_view; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.meal_plan_menu_view TO postgres;
GRANT ALL ON TABLE public.meal_plan_menu_view TO anon;
GRANT ALL ON TABLE public.meal_plan_menu_view TO authenticated;
GRANT ALL ON TABLE public.meal_plan_menu_view TO service_role;


--
-- Name: TABLE meal_plan_subscriptions; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.meal_plan_subscriptions TO postgres;
GRANT ALL ON TABLE public.meal_plan_subscriptions TO anon;
GRANT ALL ON TABLE public.meal_plan_subscriptions TO authenticated;
GRANT ALL ON TABLE public.meal_plan_subscriptions TO service_role;


--
-- Name: TABLE notification_preferences; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.notification_preferences TO postgres;
GRANT ALL ON TABLE public.notification_preferences TO anon;
GRANT ALL ON TABLE public.notification_preferences TO authenticated;
GRANT ALL ON TABLE public.notification_preferences TO service_role;


--
-- Name: TABLE notifications; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.notifications TO postgres;
GRANT ALL ON TABLE public.notifications TO anon;
GRANT ALL ON TABLE public.notifications TO authenticated;
GRANT ALL ON TABLE public.notifications TO service_role;


--
-- Name: TABLE order_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.order_items TO anon;
GRANT ALL ON TABLE public.order_items TO authenticated;
GRANT ALL ON TABLE public.order_items TO service_role;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.orders TO anon;
GRANT ALL ON TABLE public.orders TO authenticated;
GRANT ALL ON TABLE public.orders TO service_role;


--
-- Name: TABLE otp_verification; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.otp_verification TO anon;
GRANT ALL ON TABLE public.otp_verification TO authenticated;
GRANT ALL ON TABLE public.otp_verification TO service_role;


--
-- Name: TABLE payments; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.payments TO postgres;
GRANT ALL ON TABLE public.payments TO anon;
GRANT ALL ON TABLE public.payments TO authenticated;
GRANT ALL ON TABLE public.payments TO service_role;


--
-- Name: TABLE product_addons; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.product_addons TO postgres;
GRANT ALL ON TABLE public.product_addons TO anon;
GRANT ALL ON TABLE public.product_addons TO authenticated;
GRANT ALL ON TABLE public.product_addons TO service_role;


--
-- Name: TABLE product_subscriptions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.product_subscriptions TO anon;
GRANT ALL ON TABLE public.product_subscriptions TO authenticated;
GRANT ALL ON TABLE public.product_subscriptions TO service_role;


--
-- Name: TABLE product_variants; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.product_variants TO postgres;
GRANT ALL ON TABLE public.product_variants TO anon;
GRANT ALL ON TABLE public.product_variants TO authenticated;
GRANT ALL ON TABLE public.product_variants TO service_role;


--
-- Name: TABLE products; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.products TO anon;
GRANT ALL ON TABLE public.products TO authenticated;
GRANT ALL ON TABLE public.products TO service_role;


--
-- Name: TABLE promo_banners; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.promo_banners TO postgres;
GRANT ALL ON TABLE public.promo_banners TO anon;
GRANT ALL ON TABLE public.promo_banners TO authenticated;
GRANT ALL ON TABLE public.promo_banners TO service_role;


--
-- Name: TABLE referrals; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.referrals TO postgres;
GRANT ALL ON TABLE public.referrals TO anon;
GRANT ALL ON TABLE public.referrals TO authenticated;
GRANT ALL ON TABLE public.referrals TO service_role;


--
-- Name: TABLE review_votes; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.review_votes TO postgres;
GRANT ALL ON TABLE public.review_votes TO anon;
GRANT ALL ON TABLE public.review_votes TO authenticated;
GRANT ALL ON TABLE public.review_votes TO service_role;


--
-- Name: TABLE reviews; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.reviews TO postgres;
GRANT ALL ON TABLE public.reviews TO anon;
GRANT ALL ON TABLE public.reviews TO authenticated;
GRANT ALL ON TABLE public.reviews TO service_role;


--
-- Name: TABLE search_logs; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.search_logs TO postgres;
GRANT ALL ON TABLE public.search_logs TO anon;
GRANT ALL ON TABLE public.search_logs TO authenticated;
GRANT ALL ON TABLE public.search_logs TO service_role;


--
-- Name: TABLE subscription_deliveries; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subscription_deliveries TO anon;
GRANT ALL ON TABLE public.subscription_deliveries TO authenticated;
GRANT ALL ON TABLE public.subscription_deliveries TO service_role;


--
-- Name: TABLE subscription_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subscription_items TO anon;
GRANT ALL ON TABLE public.subscription_items TO authenticated;
GRANT ALL ON TABLE public.subscription_items TO service_role;


--
-- Name: TABLE support_tickets; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.support_tickets TO postgres;
GRANT ALL ON TABLE public.support_tickets TO anon;
GRANT ALL ON TABLE public.support_tickets TO authenticated;
GRANT ALL ON TABLE public.support_tickets TO service_role;


--
-- Name: TABLE user_addresses; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_addresses TO anon;
GRANT ALL ON TABLE public.user_addresses TO authenticated;
GRANT ALL ON TABLE public.user_addresses TO service_role;


--
-- Name: TABLE user_favorites; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.user_favorites TO postgres;
GRANT ALL ON TABLE public.user_favorites TO anon;
GRANT ALL ON TABLE public.user_favorites TO authenticated;
GRANT ALL ON TABLE public.user_favorites TO service_role;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO anon;
GRANT ALL ON TABLE public.users TO authenticated;
GRANT ALL ON TABLE public.users TO service_role;


--
-- Name: TABLE vendor_delivery_zones; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.vendor_delivery_zones TO postgres;
GRANT ALL ON TABLE public.vendor_delivery_zones TO anon;
GRANT ALL ON TABLE public.vendor_delivery_zones TO authenticated;
GRANT ALL ON TABLE public.vendor_delivery_zones TO service_role;


--
-- Name: TABLE vendor_leads; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.vendor_leads TO postgres;
GRANT ALL ON TABLE public.vendor_leads TO anon;
GRANT ALL ON TABLE public.vendor_leads TO authenticated;
GRANT ALL ON TABLE public.vendor_leads TO service_role;


--
-- Name: TABLE vendor_payouts; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.vendor_payouts TO postgres;
GRANT ALL ON TABLE public.vendor_payouts TO anon;
GRANT ALL ON TABLE public.vendor_payouts TO authenticated;
GRANT ALL ON TABLE public.vendor_payouts TO service_role;


--
-- Name: TABLE vendor_schedules; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.vendor_schedules TO postgres;
GRANT ALL ON TABLE public.vendor_schedules TO anon;
GRANT ALL ON TABLE public.vendor_schedules TO authenticated;
GRANT ALL ON TABLE public.vendor_schedules TO service_role;


--
-- Name: TABLE vendor_special_hours; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.vendor_special_hours TO postgres;
GRANT ALL ON TABLE public.vendor_special_hours TO anon;
GRANT ALL ON TABLE public.vendor_special_hours TO authenticated;
GRANT ALL ON TABLE public.vendor_special_hours TO service_role;


--
-- Name: TABLE waitlist; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.waitlist TO postgres;
GRANT ALL ON TABLE public.waitlist TO anon;
GRANT ALL ON TABLE public.waitlist TO authenticated;
GRANT ALL ON TABLE public.waitlist TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE messages_2025_12_26; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_26 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_26 TO dashboard_user;


--
-- Name: TABLE messages_2025_12_27; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_27 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_27 TO dashboard_user;


--
-- Name: TABLE messages_2025_12_28; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_28 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_28 TO dashboard_user;


--
-- Name: TABLE messages_2025_12_29; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_29 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_29 TO dashboard_user;


--
-- Name: TABLE messages_2025_12_30; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_30 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_30 TO dashboard_user;


--
-- Name: TABLE messages_2025_12_31; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_31 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_31 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_01; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_01 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_01 TO dashboard_user;


--
-- Name: TABLE messages_2026_01_02; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2026_01_02 TO postgres;
GRANT ALL ON TABLE realtime.messages_2026_01_02 TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- Name: TABLE iceberg_namespaces; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.iceberg_namespaces TO service_role;
GRANT SELECT ON TABLE storage.iceberg_namespaces TO authenticated;
GRANT SELECT ON TABLE storage.iceberg_namespaces TO anon;


--
-- Name: TABLE iceberg_tables; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.iceberg_tables TO service_role;
GRANT SELECT ON TABLE storage.iceberg_tables TO authenticated;
GRANT SELECT ON TABLE storage.iceberg_tables TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- Name: TABLE hooks; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;


--
-- Name: SEQUENCE hooks_id_seq; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;


--
-- Name: TABLE migrations; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;
RESET SESSION AUTHORIZATION;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;
SET SESSION AUTHORIZATION postgres;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;
RESET SESSION AUTHORIZATION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

