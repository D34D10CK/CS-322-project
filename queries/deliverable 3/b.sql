SELECT 
    publishers.name
FROM
    publishers
        INNER JOIN
    series ON publishers.id = series.publisher_id
GROUP BY publisher_id
HAVING COUNT(DISTINCT series.publication_type_id) = (SELECT 
        COUNT(*)
    FROM
        series_publication_types)