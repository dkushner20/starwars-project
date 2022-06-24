-- noinspection SqlNoDataSourceInspectionForFile

CREATE EXTENSION  IF NOT EXISTS LTREE;

CREATE TABLE if NOT EXISTS characters (
    name varchar(255),
    height varchar(255),
    mass varchar(255),
    hair_color varchar(255),
    skin_color varchar(255),
    eye_color varchar(255),
    birth_year varchar(255),
    gender varchar(255),
    homeworld varchar(255),
    species varchar(255)
);

CREATE TABLE if NOT EXISTS planets (
    name varchar(255),
    rotation_period varchar(255),
    orbital_period varchar(255),
    diameter varchar(255),
    climate varchar(255),
    gravity varchar(255),
    terrain varchar(255),
    surface_water varchar(255),
    population varchar(255)
);

CREATE TABLE if NOT EXISTS species (
    name varchar(255),
    classification varchar(255),
    designation varchar(255),
    average_height varchar(255),
    skin_colors varchar(255),
    hair_colors varchar(255),
    eye_colors varchar(255),
    average_lifespan varchar(255),
    language varchar(255),
    homeworld varchar(255)
);

CREATE TABLE if NOT EXISTS starships (
    name varchar(255),
    model varchar(255),
    manufacturer varchar(255),
    cost_in_credits varchar(255),
    length varchar(255),
    max_atmosphering_speed varchar(255),
    crew varchar(255),
    passengers varchar(255),
    cargo_capacity varchar(255),
    consumables varchar(255),
    hyperdrive_rating varchar(255),
    MGLT varchar(255),
    starship_class varchar(255)
);

CREATE TABLE if NOT EXISTS vehicles (
    name varchar(255),
    model varchar(255),
    manufacturer varchar(255),
    cost_in_credits varchar(255),
    length varchar(255),
    max_atmosphering_speed varchar(255),
    crew varchar(255),
    passengers varchar(255),
    cargo_capacity varchar(255),
    consumables varchar(255),
    vehicle_class varchar(255)
);