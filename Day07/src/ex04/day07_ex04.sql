SELECT name, count(name) as count_of_visits
FROM person_visits
JOIN person p ON p.id = person_visits.person_id
GROUP BY name
HAVING count(name) > 3