# Part 2: Simple Selects and Counts
# Directions: Write a sql query or sql queries that can answer the following questions
#
# What are all the types of pokemon that a pokemon can have?
SELECT name
from pokemon.types;
# What is the name of the pokemon with id 45?
SELECT name
from pokemon.pokemons
WHERE id = 45;
# How many pokemon are there?
SELECT COUNT(id)
from pokemon.pokemons;
# How many types are there?
SELECT COUNT(id)
from pokemon.types;
# How many pokemon have a secondary type?
SELECT COUNT(id)
from pokemon.pokemons
where secondary_type > 0;
# Part 3: Joins and Groups
# Directions: Write a sql query or sql queries that can answer the following questions
#
# What is each pokemon's primary type?
SELECT p.name, t.name
FROM pokemon.pokemons p
       JOIN pokemon.types t
            ON p.primary_type = t.id;
# What is Rufflet's secondary type?
SELECT p.name, t.name
FROM pokemon.pokemons p
       JOIN pokemon.types t
            ON p.name = 'Rufflet'
              AND p.secondary_type = t.id;
# What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT p.name
FROM pokemon.pokemons p
       JOIN pokemon.pokemon_trainer t
            ON t.trainerID = 303 AND p.id = t.pokemon_id;
# How many pokemon have a secondary type Poison
SELECT COUNT(p.id)
FROM pokemon.pokemons p
       JOIN pokemon.types t
WHERE p.secondary_type = t.id
  AND t.name = 'Poison';
# What are all the primary types and how many pokemon have that type?
SELECT t.name, COUNT(p.id)
FROM pokemon.types t
       INNER JOIN pokemon.pokemons p
WHERE t.id = p.primary_type
GROUP BY t.name;
# How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
SELECT t.trainerID, COUNT(t.trainerID)
FROM pokemon.pokemon_trainer t
WHERE t.pokelevel = 100
GROUP BY t.trainerID;
# How many pokemon only belong to one trainer and no other?
SELECT p.name
FROM pokemon.pokemons p
       JOIN pokemon.pokemon_trainer t
WHERE p.id = t.pokemon_id
GROUP BY p.name
HAVING COUNT(t.pokemon_id) = 1;
# Part 4: Final Report
# Trainers are sorted by the sum of the levels of the Pokemon they have
SELECT t.trainername, SUM(pt.pokelevel)
FROM pokemon.trainers t,
     pokemon.pokemon_trainer pt
WHERE t.trainerID = pt.trainerID
GROUP BY t.trainername
ORDER BY SUM(pt.pokelevel) DESC