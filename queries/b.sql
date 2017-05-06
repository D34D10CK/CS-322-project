SELECT DISTINCT
    publishers.id, publishers.name
FROM
    publishers
        INNER JOIN
    (SELECT 
        publisher_id
    FROM
        series
    WHERE
        country_id = (SELECT 
                id
            FROM
                countries
            WHERE
                name = 'denmark')) AS table_2 ON publishers.id = table_2.publisher_id