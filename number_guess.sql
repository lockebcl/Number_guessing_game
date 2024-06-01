--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    player_id integer NOT NULL,
    guesses integer,
    final_number integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: player; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player (
    player_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.player OWNER TO freecodecamp;

--
-- Name: player_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_player_id_seq OWNER TO freecodecamp;

--
-- Name: player_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_player_id_seq OWNED BY public.player.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: player player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player ALTER COLUMN player_id SET DEFAULT nextval('public.player_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 7, 858, 857);
INSERT INTO public.games VALUES (2, 7, 758, 757);
INSERT INTO public.games VALUES (3, 8, 20, 19);
INSERT INTO public.games VALUES (4, 8, 172, 171);
INSERT INTO public.games VALUES (5, 7, 764, 761);
INSERT INTO public.games VALUES (6, 7, 504, 502);
INSERT INTO public.games VALUES (7, 7, 197, 196);
INSERT INTO public.games VALUES (8, 9, 758, 757);
INSERT INTO public.games VALUES (9, 9, 545, 544);
INSERT INTO public.games VALUES (10, 10, 479, 478);
INSERT INTO public.games VALUES (11, 10, 319, 318);
INSERT INTO public.games VALUES (12, 9, 607, 604);
INSERT INTO public.games VALUES (13, 9, 589, 587);
INSERT INTO public.games VALUES (14, 9, 939, 938);


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player VALUES (1, 'user_1717254105967');
INSERT INTO public.player VALUES (2, 'user_1717254105966');
INSERT INTO public.player VALUES (3, 'user_1717254170378');
INSERT INTO public.player VALUES (4, 'user_1717254170377');
INSERT INTO public.player VALUES (5, 'user_1717254198336');
INSERT INTO public.player VALUES (6, 'user_1717254198335');
INSERT INTO public.player VALUES (7, 'user_1717254245642');
INSERT INTO public.player VALUES (8, 'user_1717254245641');
INSERT INTO public.player VALUES (9, 'user_1717254265179');
INSERT INTO public.player VALUES (10, 'user_1717254265178');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 14, true);


--
-- Name: player_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_player_id_seq', 10, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (player_id);


--
-- Name: player player_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_username_key UNIQUE (username);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(player_id);


--
-- PostgreSQL database dump complete
--

