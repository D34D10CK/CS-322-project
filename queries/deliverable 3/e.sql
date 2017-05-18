
SELECT 
    publishers.name,
    SUBSTRING_INDEX(GROUP_CONCAT(DISTINCT languages.name
                SEPARATOR ', '),
            ',',
            3) AS languages
FROM
    publishers
        INNER JOIN
    (SELECT 
        publishers.id AS pid
    FROM
        publishers
    INNER JOIN series ON series.publisher_id = publishers.id
    GROUP BY publisher_id
    ORDER BY COUNT(*) DESC
    LIMIT 10) AS a ON a.pid = publishers.id
        INNER JOIN
    series ON series.publisher_id = publishers.id
        INNER JOIN
    languages ON languages.id = series.language_id
GROUP BY publisher_id