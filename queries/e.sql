SELECT 
    table1.name, COUNT(id) AS count
FROM
    series
        INNER JOIN
    (SELECT 
        publisher_id, name
    FROM
        indicia_publishers
    WHERE
        name LIKE '%DC comics%') AS table1 ON series.publisher_id = table1.publisher_id