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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    description text NOT NULL,
    age_in_millions_of_years integer,
    population integer,
    distance_from_earth numeric(15,2) NOT NULL,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    type character varying,
    galaxy_id integer NOT NULL,
    name character varying
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying,
    description text NOT NULL,
    age_in_millions_of_years integer,
    population integer,
    distance_from_earth numeric(15,2) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying,
    description text NOT NULL,
    age_in_millions_of_years integer,
    population integer,
    distance_from_earth numeric(15,2) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    description text NOT NULL,
    age_in_millions_of_years integer,
    population integer,
    distance_from_earth numeric(15,2) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'cool', 20, 345, 2323.56, true, false);
INSERT INTO public.galaxy VALUES (2, 'Cygnus A', 'happy', 20, 345, 2323.56, true, false);
INSERT INTO public.galaxy VALUES (3, 'Virgo A', 'lovely', 20, 345, 2323.56, true, false);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'beautiful', 20, 345, 2323.56, true, false);
INSERT INTO public.galaxy VALUES (5, 'Megellanic clouds', 'gold', 20, 345, 2323.56, true, false);
INSERT INTO public.galaxy VALUES (6, 'Canis major', 'small', 20, 345, 2323.56, true, false);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, NULL, 1, 'Group');
INSERT INTO public.galaxy_types VALUES (2, NULL, 2, 'Set');
INSERT INTO public.galaxy_types VALUES (3, NULL, 3, 'Map');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'bright', 20, 345, 2323.56, true, false, 1);
INSERT INTO public.moon VALUES (2, 'Luna', 'wolf', 20, 345, 2323.56, true, false, 2);
INSERT INTO public.moon VALUES (3, 'Luna', 'snow', 20, 345, 2323.56, true, false, 3);
INSERT INTO public.moon VALUES (4, 'Luna', 'hunter', 20, 345, 2323.56, true, false, 3);
INSERT INTO public.moon VALUES (5, 'Luna', 'worm', 20, 345, 2323.56, true, false, 4);
INSERT INTO public.moon VALUES (6, 'Luna', 'pink', 20, 345, 2323.56, true, false, 5);
INSERT INTO public.moon VALUES (8, 'Luna', 'flower', 20, 345, 2323.56, true, false, 7);
INSERT INTO public.moon VALUES (9, 'Luna', 'strawberry', 20, 345, 2323.56, true, false, 8);
INSERT INTO public.moon VALUES (10, 'Luna', 'buck', 20, 345, 2323.56, true, false, 8);
INSERT INTO public.moon VALUES (11, 'Luna', 'orange', 20, 345, 2323.56, true, false, 9);
INSERT INTO public.moon VALUES (12, 'Luna', 'sero', 20, 345, 2323.56, true, false, 10);
INSERT INTO public.moon VALUES (13, 'Luna', 'sero1', 20, 345, 2323.56, true, false, 10);
INSERT INTO public.moon VALUES (14, 'Luna', 'sero2', 20, 345, 2323.56, true, false, 10);
INSERT INTO public.moon VALUES (15, 'Luna', 'sero3', 20, 345, 2323.56, true, false, 10);
INSERT INTO public.moon VALUES (16, 'Luna', 'sero4', 20, 345, 2323.56, true, false, 10);
INSERT INTO public.moon VALUES (17, 'Luna', 'sero5', 20, 345, 2323.56, true, false, 10);
INSERT INTO public.moon VALUES (18, 'Luna', 'sero6', 20, 345, 2323.56, true, false, 11);
INSERT INTO public.moon VALUES (19, 'Luna', 'sero7', 20, 345, 2323.56, true, false, 12);
INSERT INTO public.moon VALUES (20, 'Luna', 'sero8', 20, 345, 2323.56, true, false, 12);
INSERT INTO public.moon VALUES (21, 'Luna', 'sero9', 20, 345, 2323.56, true, false, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'green', 20, 345, 2323.56, true, false, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'red', 20, 345, 2323.56, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'yellow', 20, 345, 2323.56, true, false, 1);
INSERT INTO public.planet VALUES (4, 'Venus1', 'yellow1', 20, 345, 2323.56, true, false, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 'yellow12', 20, 345, 2323.56, true, false, 2);
INSERT INTO public.planet VALUES (7, 'Mars-1', 'mellow12', 20, 345, 2323.56, true, false, 2);
INSERT INTO public.planet VALUES (8, 'Jupiter', 'brown', 20, 345, 2323.56, true, false, 3);
INSERT INTO public.planet VALUES (9, 'Jupiter-1', 'brownee', 20, 345, 2323.56, true, false, 3);
INSERT INTO public.planet VALUES (10, 'Jupiter-2', 'brownlee', 20, 345, 2323.56, true, false, 3);
INSERT INTO public.planet VALUES (11, 'Neptune', 'dj', 20, 345, 2323.56, true, false, 4);
INSERT INTO public.planet VALUES (12, 'Saturn', 'ring', 20, 345, 2323.56, true, false, 5);
INSERT INTO public.planet VALUES (13, 'Uranus', 'one piece', 20, 345, 2323.56, true, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'black', 20, 345, 2323.56, true, false, 1);
INSERT INTO public.star VALUES (2, 'Canopus', 'blue', 20, 345, 2323.56, true, false, 2);
INSERT INTO public.star VALUES (3, 'Vega', 'cute', 20, 345, 2323.56, true, false, 3);
INSERT INTO public.star VALUES (4, 'Rigel', 'smart', 20, 345, 2323.56, true, false, 4);
INSERT INTO public.star VALUES (5, 'Spica', 'smooth', 20, 345, 2323.56, true, false, 5);
INSERT INTO public.star VALUES (6, 'Deneb', 'gmooth', 20, 345, 2323.56, true, false, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_types galaxy_types_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
