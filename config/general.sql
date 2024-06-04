CREATE ROLE authenticator LOGIN NOINHERIT NOCREATEDB NOCREATEROLE NOSUPERUSER;
CREATE ROLE anonymous NOLOGIN;
CREATE ROLE webuser NOLOGIN;

CREATE SCHEMA api;

COMMENT ON SCHEMA api IS 'Default Schema 1.0.1';

ALTER SCHEMA api OWNER TO postgres;


CREATE TYPE basic_auth.jwt_token AS (
	token text
);


ALTER TYPE basic_auth.jwt_token OWNER TO postgres;

CREATE FUNCTION api.login(email text, pass text) RETURNS basic_auth.jwt_token
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
  _role name;
  result basic_auth.jwt_token;
begin
  -- check email and password
  select basic_auth.user_role(email, pass) into _role;
  if _role is null then
    raise invalid_password using message = 'invalid user or password';
  end if;

  select sign(
      row_to_json(r), current_setting('pgrst.jwt_secret', false)
      
    ) as token
    from (
      select _role as role, login.email as email,
         extract(epoch from now())::integer + 60*60 as exp
    ) r
    into result;
  return result;
end;
$$;


ALTER FUNCTION api.login(email text, pass text) OWNER TO postgres;