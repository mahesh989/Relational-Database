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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter integer,
    distance_from_sun numeric(10,2),
    is_potentially_hazardous boolean DEFAULT false NOT NULL,
    composition text,
    star_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age numeric(10,2),
    size integer NOT NULL,
    description text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    moon_mass numeric(10,2),
    moon_radius integer,
    moon_distance_from_planet integer,
    moon_has_atmosphere boolean DEFAULT false NOT NULL,
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
    name character varying(255) NOT NULL,
    planet_mass numeric(10,2),
    planet_radius integer,
    planet_distance_from_star integer,
    planet_has_water boolean DEFAULT false NOT NULL,
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age numeric(10,2),
    distance_from_earth integer NOT NULL,
    is_visible boolean NOT NULL,
    description text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 2.77, false, 'Carbonaceous chondrite', 2);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 2.36, false, 'Basaltic', 2);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 550, 2.77, false, 'Carbonaceous chondrite', 2);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 430, 3.14, false, 'C-type', 2);
INSERT INTO public.asteroid VALUES (5, 'Psyche', 226, 2.92, false, 'Metal-rich', 2);
INSERT INTO public.asteroid VALUES (6, 'Bennu', 492, 1.27, true, 'Carbonaceous', 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 13.50, 220000, 'Spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 13.20, 120000, 'Barred spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 11.50, 28000, 'Spiral galaxy with a prominent dust lane');
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 12.20, 50000, 'Face-on spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 12.50, 60000, 'Spiral galaxy with a prominent ring');
INSERT INTO public.galaxy VALUES (6, 'Tadpole', 12.80, 60000, 'Interacting spiral galaxy');
INSERT INTO public.galaxy VALUES (7, 'Sunflower', 12.10, 30000, 'Spiral galaxy with a bright nucleus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 0.01, 1737, 384400, false, 1);
INSERT INTO public.moon VALUES (2, 'Moon 2', 0.03, 2400, 546000, true, 1);
INSERT INTO public.moon VALUES (3, 'Moon 3', 0.01, 1030, 377000, false, 2);
INSERT INTO public.moon VALUES (4, 'Moon 4', 0.05, 3200, 721000, true, 2);
INSERT INTO public.moon VALUES (5, 'Moon 5', 0.02, 1860, 661100, false, 2);
INSERT INTO public.moon VALUES (6, 'Moon 6', 0.03, 2280, 238900, true, 3);
INSERT INTO public.moon VALUES (7, 'Moon 7', 0.01, 1080, 181000, false, 3);
INSERT INTO public.moon VALUES (8, 'Moon 8', 0.04, 2800, 377400, true, 3);
INSERT INTO public.moon VALUES (9, 'Moon 9', 0.02, 1650, 238900, false, 3);
INSERT INTO public.moon VALUES (10, 'Moon 10', 0.03, 1980, 354800, true, 4);
INSERT INTO public.moon VALUES (11, 'Moon 11', 0.01, 1200, 181000, false, 4);
INSERT INTO public.moon VALUES (12, 'Moon 12', 0.03, 2200, 402000, true, 4);
INSERT INTO public.moon VALUES (13, 'Moon 13', 0.02, 1600, 301000, false, 4);
INSERT INTO public.moon VALUES (14, 'Moon 14', 0.03, 2200, 384400, true, 4);
INSERT INTO public.moon VALUES (15, 'Moon 15', 0.03, 2300, 377000, true, 5);
INSERT INTO public.moon VALUES (16, 'Moon 16', 0.00, 870, 181000, false, 5);
INSERT INTO public.moon VALUES (17, 'Moon 17', 0.02, 1550, 238900, false, 5);
INSERT INTO public.moon VALUES (18, 'Moon 18', 0.04, 2500, 546000, true, 6);
INSERT INTO public.moon VALUES (19, 'Moon 19', 0.01, 1320, 301000, false, 6);
INSERT INTO public.moon VALUES (20, 'Moon 20', 0.04, 2700, 721000, true, 6);
INSERT INTO public.moon VALUES (21, 'Moon 21', 0.01, 920, 181000, false, 7);
INSERT INTO public.moon VALUES (22, 'Moon 22', 0.03, 2100, 354800, true, 7);
INSERT INTO public.moon VALUES (23, 'Moon 23', 0.02, 1480, 238900, false, 7);
INSERT INTO public.moon VALUES (24, 'Moon 24', 0.04, 2600, 661100, true, 7);
INSERT INTO public.moon VALUES (25, 'Moon 25', 0.02, 1400, 238900, false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.33, 2439, 58, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4.87, 6052, 108, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 5.97, 6371, 150, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.64, 3390, 228, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898.00, 69911, 778, false, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 568.00, 58232, 1430, false, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 86.80, 25362, 2871, false, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 102.00, 24622, 4495, true, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.01, 1184, 5906, false, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-10b', 4.56, 1563, 0, true, 4);
INSERT INTO public.planet VALUES (11, 'Kepler-438b', 0.01, 3555, 0, false, 4);
INSERT INTO public.planet VALUES (12, 'Kepler-442b', 2.34, 6353, 0, true, 4);
INSERT INTO public.planet VALUES (13, 'Kepler-62f', 0.69, 3449, 1, true, 4);
INSERT INTO public.planet VALUES (14, 'Kepler-452b', 5.77, 8535, 1, true, 4);
INSERT INTO public.planet VALUES (15, 'GJ 1214 b', 6.55, 25252, 0, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 2, 4.60, 8, true, 'Our star');
INSERT INTO public.star VALUES (2, 'Sirius', 2, 2.37, 9, true, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 2, 6.09, 4, true, 'Closest star system to the Solar System');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 8.20, 640, true, 'Red supergiant star');
INSERT INTO public.star VALUES (5, 'Antares', 1, 12.40, 550, true, 'Red supergiant star');
INSERT INTO public.star VALUES (6, 'Vega', 2, 0.46, 25, true, 'Fifth-brightest star in the night sky');
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 2, 4.85, 4, true, 'Closest known star to the Solar System');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

