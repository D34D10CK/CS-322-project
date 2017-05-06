SELECT 
    brand_groups.name
FROM
    brand_groups
        INNER JOIN
    (SELECT 
        publisher_id
    FROM
        indicia_publishers
    WHERE
        country_id = (SELECT 
                id
            FROM
                countries
            WHERE
                name = 'belgium')
    GROUP BY publisher_id
    HAVING COUNT(*) = (SELECT 
            MAX(c)
        FROM
            (SELECT 
            COUNT(*) AS c, id
        FROM
            indicia_publishers
        WHERE
            country_id = (SELECT 
                    id
                FROM
                    countries
                WHERE
                    name = 'belgium')
        GROUP BY publisher_id) AS b)) AS a ON brand_groups.publisher_id = a.publisher_id;
    