\connect postgres

SET statement_timeout = 0;
SET default_transaction_read_only = off;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: hoge; Type: ROLE; Schema: -; Owner: -
--
CREATE ROLE hoge;
ALTER ROLE hoge WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION PASSWORD 'development';

--
-- Name: example; Type: DATABASE; Schema: -; Owner: hoge
--
CREATE DATABASE example WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ja_JP.UTF-8' LC_CTYPE = 'ja_JP.UTF-8';
ALTER DATABASE example OWNER TO hoge;
