--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: fictional_universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.fictional_universe (
    name character varying(100),
    fictional_universe_id integer NOT NULL,
    invented_by character varying(100) NOT NULL,
    contains_aliens boolean NOT NULL
);


ALTER TABLE public.fictional_universe OWNER TO freecodecamp;

--
-- Name: fictional_universe_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.fictional_universe_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fictional_universe_universe_id_seq OWNER TO freecodecamp;

--
-- Name: fictional_universe_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.fictional_universe_universe_id_seq OWNED BY public.fictional_universe.fictional_universe_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    contains_life boolean NOT NULL,
    distance_from_milkyway_milionlightyears integer,
    part_of_local_group boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_index_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_index_seq OWNER TO freecodecamp;

--
-- Name: galaxy_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_index_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100),
    planet_id integer NOT NULL,
    planet text NOT NULL,
    distance_from_planet_km numeric NOT NULL
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
    name character varying(100),
    star_id integer NOT NULL,
    supports_life boolean NOT NULL,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_index_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_index_seq OWNER TO freecodecamp;

--
-- Name: planet_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_index_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_billions numeric NOT NULL,
    name character varying(100),
    star_type text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_index_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_index_seq OWNER TO freecodecamp;

--
-- Name: star_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_index_seq OWNED BY public.star.star_id;


--
-- Name: fictional_universe fictional_universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fictional_universe ALTER COLUMN fictional_universe_id SET DEFAULT nextval('public.fictional_universe_universe_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_index_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_index_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_index_seq'::regclass);


--
-- Data for Name: fictional_universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.fictional_universe VALUES ('The Star Wars galaxy', 1, 'George Lucas', true);
INSERT INTO public.fictional_universe VALUES ('A Song of Ice and Fire', 2, 'George R.R. Martin', false);
INSERT INTO public.fictional_universe VALUES ('Middle Earth', 3, 'Tolkien', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy (M31)', false, 3, true);
INSERT INTO public.galaxy VALUES (2, 'Triangulum Galaxy (M33)', false, 3, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud (LMC)', false, 0, true);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud (SMC)', false, 0, true);
INSERT INTO public.galaxy VALUES (5, 'Bootes I', false, 0, true);
INSERT INTO public.galaxy VALUES (6, 'Milkyway', true, 0, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth', 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Mars', 9378);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Mars', 23460);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Jupiter', 421700);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Jupiter', 671034);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Jupiter', 1070412);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Jupiter', 1882709);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Saturn', 1221870);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 'Saturn', 527108);
INSERT INTO public.moon VALUES (10, 'Iapetis', 6, 'Saturn', 3560821);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Saturn', 377396);
INSERT INTO public.moon VALUES (12, 'Miranda', 7, 'Uranus', 129390);
INSERT INTO public.moon VALUES (13, 'Ariel', 7, 'Uranus', 191020);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, 'Uranus', 266000);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 'Uranus', 435910);
INSERT INTO public.moon VALUES (16, 'Triton', 8, 'Neptune', 354759);
INSERT INTO public.moon VALUES (17, 'Proteus', 8, 'Neptune', 117647);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 'Neptune', 5513818);
INSERT INTO public.moon VALUES (19, 'Larissa', 8, 'Neptune', 73548);
INSERT INTO public.moon VALUES (20, 'Charon', 9, 'Dwarf Planet Pluto', 19570);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 9, false, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 9, false, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 9, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 9, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 9, false, 80);
INSERT INTO public.planet VALUES (6, 'Saturn', 9, false, 83);
INSERT INTO public.planet VALUES (7, 'Uranus', 9, false, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 9, false, 14);
INSERT INTO public.planet VALUES (9, 'Dwarf Planet Pluto', 9, false, 5);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 1, false, 0);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri Bb', 2, false, 0);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Ab', 2, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 6, 4.85, 'Proxima Centauri', 'Red Dwarf');
INSERT INTO public.star VALUES (2, 6, 2, 'Alpha Centauri A', 'G2V star');
INSERT INTO public.star VALUES (3, 6, 10, 'Barnards Star', 'Red Dwarf');
INSERT INTO public.star VALUES (4, 6, 0.3, 'Wolf 359', 'Red Dwarf');
INSERT INTO public.star VALUES (5, 6, 7, 'Lalande 21185', 'Red Dwarf');
INSERT INTO public.star VALUES (6, 6, 0.25, 'Sirius A', 'Main-sequence star');
INSERT INTO public.star VALUES (7, 6, 0.25, 'Sirius B', 'White Dwarf');
INSERT INTO public.star VALUES (8, 6, 6.5, 'Luyten 726-8', 'Binary system of red dwarfs');
INSERT INTO public.star VALUES (9, 6, 4.6, 'Sun', 'G2V');


--
-- Name: fictional_universe_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.fictional_universe_universe_id_seq', 3, true);


--
-- Name: galaxy_index_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_index_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_index_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_index_seq', 12, true);


--
-- Name: star_index_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_index_seq', 9, true);


--
-- Name: fictional_universe fictional_universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fictional_universe
    ADD CONSTRAINT fictional_universe_name_key UNIQUE (name);


--
-- Name: fictional_universe fictional_universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.fictional_universe
    ADD CONSTRAINT fictional_universe_pkey PRIMARY KEY (fictional_universe_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star galaxy_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_key FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_key FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_key; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_key FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
