WITH casted AS (
    SELECT address, age::numeric
    FROM person),
     calculated_columns AS (
         SELECT address,
                ROUND(MAX(casted.age) - MIN(casted.age) / MAX(casted.age), 2) AS formula,
                ROUND(AVG(casted.age), 2)                                     AS average
         FROM casted
         GROUP BY address
     )

SELECT address, formula, average, formula > average AS comparison
FROM calculated_columns
ORDER BY address;