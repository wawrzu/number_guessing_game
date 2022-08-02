--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.games ALTER COLUMN game_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.games_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (48, 17, 231);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (49, 17, 272);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (50, 18, 691);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (51, 18, 891);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (52, 17, 314);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (53, 17, 368);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (54, 17, 615);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (55, 19, 932);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (56, 19, 655);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (57, 20, 696);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (58, 20, 317);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (59, 19, 625);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (60, 19, 5);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (61, 19, 935);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (62, 21, 200);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (63, 21, 23);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (64, 22, 965);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (65, 22, 225);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (66, 21, 604);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (67, 21, 389);
INSERT INTO public.games OVERRIDING SYSTEM VALUE VALUES (68, 21, 606);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (17, 'user_1659435427345');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (18, 'user_1659435427344');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (19, 'user_1659435456239');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (20, 'user_1659435456238');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (21, 'user_1659435463160');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (22, 'user_1659435463159');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 68, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games fk_games_user_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_games_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

