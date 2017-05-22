SELECT 
    publishers.name
FROM
    publishers
        INNER JOIN
    series ON publishers.id = series.publisher_id
WHERE
    series.name IN (SELECT 
            name
        FROM
            (SELECT DISTINCT
                series.name, series.publication_type_id
            FROM
                series
            WHERE
                publication_type_id IS NOT NULL
            GROUP BY series.name , series.publication_type_id) AS a
        GROUP BY name
        HAVING COUNT(*) = (SELECT 
                COUNT(*)
            FROM
                series_publication_types))
GROUP BY publishers.id
HAVING COUNT(*) > 1