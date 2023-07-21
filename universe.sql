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
    name character varying(40) NOT NULL,
    distance integer,
    confirmed_life boolean,
    isgalaxy boolean
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
-- Name: junction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction (
    junction_id integer NOT NULL,
    key_two integer,
    name character varying NOT NULL
);


ALTER TABLE public.junction OWNER TO freecodecamp;

--
-- Name: junction_key_one_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.junction_key_one_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_key_one_seq OWNER TO freecodecamp;

--
-- Name: junction_key_one_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.junction_key_one_seq OWNED BY public.junction.junction_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    groups text,
    diameter integer,
    year integer,
    planet_id integer
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
    name character varying(40) NOT NULL,
    hasmoons boolean,
    howmanymoons integer,
    mass numeric(4,1),
    star_id integer
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
    name character varying(40),
    distance integer NOT NULL,
    constellation text,
    onlystarinsystem boolean,
    galaxy_id integer
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
-- Name: junction junction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction ALTER COLUMN junction_id SET DEFAULT nextval('public.junction_key_one_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 0, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 25, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Virgo Stellar Stream', 30, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sagittarius Dwarf Spheroidal Galaxy', 81, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 163, false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 197, false, NULL);


--
-- Data for Name: junction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction VALUES (1, 2, 'hi');
INSERT INTO public.junction VALUES (2, 3, 'hello');
INSERT INTO public.junction VALUES (3, 4, 'how are you');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'metis', 'inner', 43, 1979, 6);
INSERT INTO public.moon VALUES (2, 'adrastea', 'inner', 16, 1979, 6);
INSERT INTO public.moon VALUES (3, 'amalthea', 'inner', 167, 1892, 6);
INSERT INTO public.moon VALUES (4, 'thebe', 'inner', 98, 1979, 6);
INSERT INTO public.moon VALUES (5, 'io', 'galilean', 3643, 1610, 6);
INSERT INTO public.moon VALUES (6, 'europa', 'galilean', 3121, 1610, 6);
INSERT INTO public.moon VALUES (7, 'ganymede', 'galilean', 5268, 1610, 6);
INSERT INTO public.moon VALUES (8, 'Callisto', 'galilean', 4820, 1610, 6);
INSERT INTO public.moon VALUES (9, 'themisto', 'themisto', 9, 1975, 6);
INSERT INTO public.moon VALUES (10, 'leda', 'himalia', 13, 1974, 6);
INSERT INTO public.moon VALUES (11, 'ersa', 'himalia', 16, 2018, 6);
INSERT INTO public.moon VALUES (12, 'himalia', 'himalia', 140, 1904, 6);
INSERT INTO public.moon VALUES (13, 'pandia', 'himalia', 3, 2017, 6);
INSERT INTO public.moon VALUES (14, 'lysithea', 'himalia', 42, 1938, 6);
INSERT INTO public.moon VALUES (15, 'Elara', 'himalia', 80, 1905, 6);
INSERT INTO public.moon VALUES (16, 'Dia', 'himalia', 4, 2000, 6);
INSERT INTO public.moon VALUES (17, 'carpo', 'carpo', 3, 2003, 6);
INSERT INTO public.moon VALUES (18, 'valetudo', 'valetudo', 1, 2016, 6);
INSERT INTO public.moon VALUES (19, 'euporie', 'ananke', 2, 2001, 6);
INSERT INTO public.moon VALUES (20, 'eupheme', 'ananke', 2, 2003, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', false, 0, 0.1, 1);
INSERT INTO public.planet VALUES (2, 'venus', false, 0, 0.8, 1);
INSERT INTO public.planet VALUES (3, 'earth', true, 1, 1.0, 1);
INSERT INTO public.planet VALUES (4, 'mars', true, 2, 0.1, 1);
INSERT INTO public.planet VALUES (5, 'jupiter', true, 95, 317.8, 1);
INSERT INTO public.planet VALUES (6, 'saturn', true, 146, 95.2, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 27, 14.5, 1);
INSERT INTO public.planet VALUES (8, 'neptune', true, 14, 17.2, 1);
INSERT INTO public.planet VALUES (9, 'ceres', false, 0, 0.1, 1);
INSERT INTO public.planet VALUES (10, 'Orcus', true, 1, 0.1, 1);
INSERT INTO public.planet VALUES (11, 'pluto', true, 5, 0.1, 1);
INSERT INTO public.planet VALUES (12, 'haumea', true, 2, 0.1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 0, 'none', true, 1);
INSERT INTO public.star VALUES (2, 'proxima centauri', 4, 'centaurus', false, 1);
INSERT INTO public.star VALUES (3, 'rigil kentaurus', 4, 'centaurus', false, 1);
INSERT INTO public.star VALUES (4, 'toliman', 4, 'centaurus', false, 1);
INSERT INTO public.star VALUES (5, 'barnards star', 6, 'ophiucus', true, 1);
INSERT INTO public.star VALUES (6, 'A&', 7, 'Vela', false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: junction_key_one_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.junction_key_one_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: junction junction_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_name_key UNIQUE (name);


--
-- Name: junction junction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction
    ADD CONSTRAINT junction_pkey PRIMARY KEY (junction_id);


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

