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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth bigint,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: observation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observation (
    observation_id integer NOT NULL,
    observer_name character varying(100) NOT NULL,
    observation_date date NOT NULL,
    notes text,
    star_id integer,
    planet_id integer,
    moon_id integer,
    name character varying(100)
);


ALTER TABLE public.observation OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observation_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_observation_id_seq OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observation_observation_id_seq OWNED BY public.observation.observation_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth bigint,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: observation observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation ALTER COLUMN observation_id SET DEFAULT nextval('public.observation_observation_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy', true, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Neighboring galaxy', false, 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Part of Local Group', false, 9000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting with companion', false, 6000, 23000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Distinctive bulge shape', false, 1100, 29000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Prominent spiral structure', false, 7500, 210000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth’s only moon', false, true, 4600, 384400, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Moon of Mars', false, true, 4600, 93800000, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Moon of Mars', false, true, 4600, 93800000, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Moon of Jupiter', false, true, 4600, 628730000, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Moon of Jupiter', true, true, 4600, 628730000, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon of Jupiter', false, true, 4600, 628730000, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Moon of Jupiter', false, true, 4600, 628730000, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn', true, true, 4600, 1200000000, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Moon of Saturn', false, true, 4600, 1200000000, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Moon of Saturn', false, true, 4600, 1200000000, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'Moon of Saturn', false, true, 4600, 1200000000, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 'Moon of Saturn', false, true, 4600, 1200000000, 6);
INSERT INTO public.moon VALUES (13, 'Mimas', 'Small moon of Saturn', false, true, 4600, 1200000000, 6);
INSERT INTO public.moon VALUES (14, 'Oberon', 'Moon of Uranus', false, true, 4600, 2580000000, 7);
INSERT INTO public.moon VALUES (15, 'Titania', 'Largest moon of Uranus', false, true, 4600, 2580000000, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Moon of Uranus', false, true, 4600, 2580000000, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Moon of Uranus', false, true, 4600, 2580000000, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 'Largest moon of Neptune', true, true, 4600, 4300000000, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 'Moon of Neptune', false, true, 4600, 4300000000, 8);
INSERT INTO public.moon VALUES (20, 'Kepler-22b Moon', 'Hypothetical moon', false, true, 8000, 600000000, 9);


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observation VALUES (1, 'Dr. Smith', '2024-01-10', 'Observed Jupiter and its largest moons.', 1, 5, 6, 'Jupiter');
INSERT INTO public.observation VALUES (2, 'Dr. Brown', '2024-02-14', 'Noted unusual activity on Proxima b.', 6, 10, NULL, 'Proxima b');
INSERT INTO public.observation VALUES (3, 'Dr. Lee', '2024-03-20', 'Observed Titan''s surface patterns.', 1, 6, 8, 'Titan');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet', false, true, 4600, 9200000, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet', false, true, 4600, 6700000, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our planet', true, true, 4600, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet', false, true, 4600, 78000000, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet', false, true, 4600, 628730000, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Rings of Saturn', false, true, 4600, 1200000000, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Coldest planet', false, true, 4600, 2580000000, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Farthest planet', false, true, 4600, 4300000000, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 'Potentially habitable', true, true, 8000, 600000000, 2);
INSERT INTO public.planet VALUES (10, 'Proxima b', 'Closest exoplanet', true, true, 5000, 4100000, 6);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 'Potentially habitable', true, true, 7000, 20000000, 3);
INSERT INTO public.planet VALUES (12, 'WASP-12b', 'Close-in exoplanet', false, true, 4500, 80000000, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SUN', 'Star of the Solar System', true, true, 4600, 0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in sky', true, true, 240, 8100000, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant', true, true, 10000, 640000, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue supergiant', true, true, 8000, 860000, 3);
INSERT INTO public.star VALUES (5, 'Vega', 'Part of Lyra constellation', true, true, 455, 2500000, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Nearest star to the Sun', true, true, 5000, 4000000, 1);


--
-- Name: observation_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observation_observation_id_seq', 1, false);


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
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_id);


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
-- Name: observation unique_observation_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT unique_observation_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: observation fk_observation_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT fk_observation_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: observation fk_observation_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT fk_observation_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: observation fk_observation_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT fk_observation_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

