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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO postgres;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: raw_data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.raw_data (
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner character varying(20) NOT NULL,
    opponent character varying(20) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.raw_data OWNER TO freecodecamp;

--
-- Name: raw_teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.raw_teams (
    raw_team character varying(20) NOT NULL
);


ALTER TABLE public.raw_teams OWNER TO freecodecamp;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (97, 2018, 'Final', 91, 76, 4, 2);
INSERT INTO public.games VALUES (98, 2018, 'Third Place', 78, 93, 2, 0);
INSERT INTO public.games VALUES (99, 2018, 'Semi-Final', 76, 93, 2, 1);
INSERT INTO public.games VALUES (100, 2018, 'Semi-Final', 91, 78, 1, 0);
INSERT INTO public.games VALUES (101, 2018, 'Quarter-Final', 76, 80, 3, 2);
INSERT INTO public.games VALUES (102, 2018, 'Quarter-Final', 93, 86, 2, 0);
INSERT INTO public.games VALUES (103, 2018, 'Quarter-Final', 78, 94, 2, 1);
INSERT INTO public.games VALUES (104, 2018, 'Quarter-Final', 91, 83, 2, 0);
INSERT INTO public.games VALUES (105, 2018, 'Eighth-Final', 93, 74, 2, 1);
INSERT INTO public.games VALUES (106, 2018, 'Eighth-Final', 86, 85, 1, 0);
INSERT INTO public.games VALUES (107, 2018, 'Eighth-Final', 78, 82, 3, 2);
INSERT INTO public.games VALUES (108, 2018, 'Eighth-Final', 94, 90, 2, 0);
INSERT INTO public.games VALUES (109, 2018, 'Eighth-Final', 76, 92, 2, 1);
INSERT INTO public.games VALUES (110, 2018, 'Eighth-Final', 80, 96, 2, 1);
INSERT INTO public.games VALUES (111, 2018, 'Eighth-Final', 83, 73, 2, 1);
INSERT INTO public.games VALUES (112, 2018, 'Eighth-Final', 91, 75, 4, 3);
INSERT INTO public.games VALUES (113, 2014, 'Final', 88, 75, 1, 0);
INSERT INTO public.games VALUES (114, 2014, 'Third Place', 95, 94, 3, 0);
INSERT INTO public.games VALUES (115, 2014, 'Semi-Final', 75, 95, 1, 0);
INSERT INTO public.games VALUES (116, 2014, 'Semi-Final', 88, 94, 7, 1);
INSERT INTO public.games VALUES (117, 2014, 'Quarter-Final', 95, 77, 1, 0);
INSERT INTO public.games VALUES (118, 2014, 'Quarter-Final', 75, 78, 1, 0);
INSERT INTO public.games VALUES (119, 2014, 'Quarter-Final', 94, 74, 2, 1);
INSERT INTO public.games VALUES (120, 2014, 'Quarter-Final', 88, 91, 1, 0);
INSERT INTO public.games VALUES (121, 2014, 'Eighth-Final', 94, 79, 2, 1);
INSERT INTO public.games VALUES (122, 2014, 'Eighth-Final', 74, 83, 2, 0);
INSERT INTO public.games VALUES (123, 2014, 'Eighth-Final', 91, 87, 2, 0);
INSERT INTO public.games VALUES (124, 2014, 'Eighth-Final', 88, 81, 2, 1);
INSERT INTO public.games VALUES (125, 2014, 'Eighth-Final', 95, 90, 2, 1);
INSERT INTO public.games VALUES (126, 2014, 'Eighth-Final', 77, 89, 2, 1);
INSERT INTO public.games VALUES (127, 2014, 'Eighth-Final', 75, 85, 1, 0);
INSERT INTO public.games VALUES (128, 2014, 'Eighth-Final', 78, 84, 2, 1);


--
-- Data for Name: raw_data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.raw_data VALUES (2018, 'Final', 'France', 'Croatia', 4, 2);
INSERT INTO public.raw_data VALUES (2018, 'Third Place', 'Belgium', 'England', 2, 0);
INSERT INTO public.raw_data VALUES (2018, 'Semi-Final', 'Croatia', 'England', 2, 1);
INSERT INTO public.raw_data VALUES (2018, 'Semi-Final', 'France', 'Belgium', 1, 0);
INSERT INTO public.raw_data VALUES (2018, 'Quarter-Final', 'Croatia', 'Russia', 3, 2);
INSERT INTO public.raw_data VALUES (2018, 'Quarter-Final', 'England', 'Sweden', 2, 0);
INSERT INTO public.raw_data VALUES (2018, 'Quarter-Final', 'Belgium', 'Brazil', 2, 1);
INSERT INTO public.raw_data VALUES (2018, 'Quarter-Final', 'France', 'Uruguay', 2, 0);
INSERT INTO public.raw_data VALUES (2018, 'Eighth-Final', 'England', 'Colombia', 2, 1);
INSERT INTO public.raw_data VALUES (2018, 'Eighth-Final', 'Sweden', 'Switzerland', 1, 0);
INSERT INTO public.raw_data VALUES (2018, 'Eighth-Final', 'Belgium', 'Japan', 3, 2);
INSERT INTO public.raw_data VALUES (2018, 'Eighth-Final', 'Brazil', 'Mexico', 2, 0);
INSERT INTO public.raw_data VALUES (2018, 'Eighth-Final', 'Croatia', 'Denmark', 2, 1);
INSERT INTO public.raw_data VALUES (2018, 'Eighth-Final', 'Russia', 'Spain', 2, 1);
INSERT INTO public.raw_data VALUES (2018, 'Eighth-Final', 'Uruguay', 'Portugal', 2, 1);
INSERT INTO public.raw_data VALUES (2018, 'Eighth-Final', 'France', 'Argentina', 4, 3);
INSERT INTO public.raw_data VALUES (2014, 'Final', 'Germany', 'Argentina', 1, 0);
INSERT INTO public.raw_data VALUES (2014, 'Third Place', 'Netherlands', 'Brazil', 3, 0);
INSERT INTO public.raw_data VALUES (2014, 'Semi-Final', 'Argentina', 'Netherlands', 1, 0);
INSERT INTO public.raw_data VALUES (2014, 'Semi-Final', 'Germany', 'Brazil', 7, 1);
INSERT INTO public.raw_data VALUES (2014, 'Quarter-Final', 'Netherlands', 'Costa Rica', 1, 0);
INSERT INTO public.raw_data VALUES (2014, 'Quarter-Final', 'Argentina', 'Belgium', 1, 0);
INSERT INTO public.raw_data VALUES (2014, 'Quarter-Final', 'Brazil', 'Colombia', 2, 1);
INSERT INTO public.raw_data VALUES (2014, 'Quarter-Final', 'Germany', 'France', 1, 0);
INSERT INTO public.raw_data VALUES (2014, 'Eighth-Final', 'Brazil', 'Chile', 2, 1);
INSERT INTO public.raw_data VALUES (2014, 'Eighth-Final', 'Colombia', 'Uruguay', 2, 0);
INSERT INTO public.raw_data VALUES (2014, 'Eighth-Final', 'France', 'Nigeria', 2, 0);
INSERT INTO public.raw_data VALUES (2014, 'Eighth-Final', 'Germany', 'Algeria', 2, 1);
INSERT INTO public.raw_data VALUES (2014, 'Eighth-Final', 'Netherlands', 'Mexico', 2, 1);
INSERT INTO public.raw_data VALUES (2014, 'Eighth-Final', 'Costa Rica', 'Greece', 2, 1);
INSERT INTO public.raw_data VALUES (2014, 'Eighth-Final', 'Argentina', 'Switzerland', 1, 0);
INSERT INTO public.raw_data VALUES (2014, 'Eighth-Final', 'Belgium', 'United States', 2, 1);


--
-- Data for Name: raw_teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (73, 'Portugal');
INSERT INTO public.teams VALUES (74, 'Colombia');
INSERT INTO public.teams VALUES (75, 'Argentina');
INSERT INTO public.teams VALUES (76, 'Croatia');
INSERT INTO public.teams VALUES (77, 'Costa Rica');
INSERT INTO public.teams VALUES (78, 'Belgium');
INSERT INTO public.teams VALUES (79, 'Chile');
INSERT INTO public.teams VALUES (80, 'Russia');
INSERT INTO public.teams VALUES (81, 'Algeria');
INSERT INTO public.teams VALUES (82, 'Japan');
INSERT INTO public.teams VALUES (83, 'Uruguay');
INSERT INTO public.teams VALUES (84, 'United States');
INSERT INTO public.teams VALUES (85, 'Switzerland');
INSERT INTO public.teams VALUES (86, 'Sweden');
INSERT INTO public.teams VALUES (87, 'Nigeria');
INSERT INTO public.teams VALUES (88, 'Germany');
INSERT INTO public.teams VALUES (89, 'Greece');
INSERT INTO public.teams VALUES (90, 'Mexico');
INSERT INTO public.teams VALUES (91, 'France');
INSERT INTO public.teams VALUES (92, 'Denmark');
INSERT INTO public.teams VALUES (93, 'England');
INSERT INTO public.teams VALUES (94, 'Brazil');
INSERT INTO public.teams VALUES (95, 'Netherlands');
INSERT INTO public.teams VALUES (96, 'Spain');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 128, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 96, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: raw_teams raw_teams_raw_team_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.raw_teams
    ADD CONSTRAINT raw_teams_raw_team_key UNIQUE (raw_team);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: raw_data fk_opponent; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.raw_data
    ADD CONSTRAINT fk_opponent FOREIGN KEY (opponent) REFERENCES public.teams(name);


--
-- Name: raw_data fk_winner; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.raw_data
    ADD CONSTRAINT fk_winner FOREIGN KEY (winner) REFERENCES public.teams(name);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

