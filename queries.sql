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
