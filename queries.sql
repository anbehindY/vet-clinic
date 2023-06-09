select * from animals where RIGHT(nam
e,3) = 'mon';

select name from animals
where date_of_birth >= '2016-01-01' and date_of_birth < '2019-12-31';

select name from animals
where neutered = true and escape_attempts < 3;

select date_of_birth from animals
where name = 'Agumon' or name='Pikachu';

select name and escape_attempts from animals
where weight_kg > 10.5;

select * from animals
where neutered = true;

select * from animals
where name != 'Gabumon';

select * from animals
where weight_kg >= 10.4 and weight_kg <= 17.3;



begin transaction;
update animals
set species = 'unspecified';
select * from animals;
rollback;

begin transaction;
update animals
set species = 'digimon' where RIGHT(name,3)= 'mon';
update animals
set species = 'pokemon' where species is null;
select * from animals;
commit transaction;
select * from animals;

begin transaction;
delete from animals;
select * from animals;
rollback;
select * from animals;

begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint del;

update animals
set weight_kg = (weight_kg * -1);

rollback to savepoint del;

update animals
set weight_kg= (weight_kg * -1) where weight_kg < 0;
end;

/* To get the total number of animals */
select count(name) from animals;

/* Numbers of animals tried to escape */
select count(escape_attempts)
from animals
where escape_attempts = 0;

/* Average weight of animals */
select avg(weight_kg) from animals;

/* To classify most escaping whether neutered or not */
select neutered, count(escape_attempts) as total_escape_attempts
from animals
group by neutered;

/* Minimal and maximal weight of each type */
select neutered, min(weight_kg) as min_weight, max(weight_kg) as max_weight
from animals
group by neutered;

/* Average number of escape attempts */
select neutered, avg(escape_attempts) as avg_attempts
from animals
where date_of_birth > '1990-01-01' and date_of_birth <= '2000-12-31'
group by neutered;

select full_name, animals.name
from animals
join owners on animals.owner_id= owners.id
where full_name = 'Melody Pond';

select animals.name
from animals
join species on animals.species_id= species.id
where species_id = 1;

select full_name, animals.name
from animals
right join owners on animals.owner_id=owners.id;

select
count(case when animals.species_id=1 then animals.name end)
as total_pokemon,
count(case when animals.species_id=2 then animals.name end)
as total_digimon
from animals
join owners on animals.owner_id=owners.id
join species on animals.species_id = species.id;

select animals.name
from animals
join owners on animals.owner_id=owners.id
join species on animals.species_id = species.id
where owners.full_name='Jennifer Orwell' and species.name='Digimon';

select animals.name
from animals
join owners on animals.owner_id=owners.id
where owners.full_name='Dean Winchester' and animals.escape_attempts=0;

select owners.full_name, count(animals.id) as total_animals
from animals
join owners on animals.owner_id=owners.id
group by owners.full_name;


