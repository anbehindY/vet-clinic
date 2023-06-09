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

create table owners (
	id int generated always as identity,
	full_name varchar,
	age int,
	primary key(id)
);

create table species (
	id int generated always as identity,
	name varchar,
	primary key(id)
);

alter table animals
drop column species;

alter table animals
add column species_id int
constraint fk_species_id
references species(id);

alter table animals
add column owner_id int
constraint fk_owner_id
references owners(id);

create table vets(
	id int generated always as identity,
	name varchar(20),
	age int,
	date_of_graduation date,
	primary key(id)
);

create table specializations (
	species_id int,
	vet_id int,
	primary key(species_id, vet_id),
	foreign key(species_id) references species(id),
	foreign key(vet_id) references vets(id)
);

create table visits (
	animal_id int,
	vet_id int,
	primary key(animal_id, vet_id),
	foreign key(animal_id) references animals(id),
	foreign key(vet_id) references vets(id)
);
