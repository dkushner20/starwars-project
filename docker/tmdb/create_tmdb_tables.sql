-- noinspection SqlNoDataSourceInspectionForFile

CREATE EXTENSION  IF NOT EXISTS LTREE;

CREATE TABLE if NOT EXISTS tv_series_ids (
    id varchar(255),
    original_name varchar(255),
    popularity varchar(255)
);

CREATE TABLE if NOT EXISTS tv_network_ids (
     id varchar(255),
     name varchar(255)
);

CREATE TABLE if NOT EXISTS production_company_ids (
    id varchar(255),
    name varchar(255)
);

CREATE TABLE if NOT EXISTS keyword_ids (
    id varchar(255),
    name varchar(255)
);

CREATE TABLE if NOT EXISTS collection_ids (
    id varchar(255),
    name varchar(255)
);

CREATE TABLE if NOT EXISTS movie_ids (
    adult bool,
    id varchar(255),
    original_title varchar(255),
    popularity varchar(255),
    video bool
);

CREATE TABLE if NOT EXISTS person_ids (
    adult bool,
    id varchar(255),
    name varchar(255),
    popularity varchar(255)
);