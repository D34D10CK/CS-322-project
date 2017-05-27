SELECT 
    series.name
FROM
    (SELECT 
        series_id
    FROM
        stories
    INNER JOIN issues ON issues.id = stories.issue_id
    WHERE
        stories.type_id <> (SELECT 
                stories.type_id
            FROM
                stories
            GROUP BY stories.type_id
            ORDER BY COUNT(*) DESC
            LIMIT 1)
    GROUP BY series_id
    HAVING COUNT(*) = (SELECT 
            MAX(c)
        FROM
            (SELECT 
            COUNT(*) AS c
        FROM
            (SELECT 
            stories.issue_id
        FROM
            stories
        WHERE
            stories.type_id <> (SELECT 
                    stories.type_id
                FROM
                    stories
                GROUP BY stories.type_id
                ORDER BY COUNT(*) DESC
                LIMIT 1)) AS a
        INNER JOIN issues ON issues.id = a.issue_id
        GROUP BY issues.series_id) AS b)) AS a
        INNER JOIN
    series ON series.id = a.series_id