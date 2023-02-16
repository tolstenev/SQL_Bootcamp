SELECT name, count(name)
FROM person_visits
JOIN person p ON p.id = person_visits.person_id
GROUP BY name
HAVING count(name) > 3