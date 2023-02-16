SELECT person.name, count(*) as count_of_visits
FROM person_visits
JOIN person ON person.id = person_visits.person_id
GROUP BY person.name
ORDER BY count_of_visits DESC
LIMIT 4