/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int generated always as identity primary key,
    name varchar(20),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

alter table animals
add column species varchar;
