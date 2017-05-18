SELECT DISTINCT
    name
FROM
    series
        INNER JOIN
    issues ON series.id = issues.series_id
        INNER JOIN
    stories ON stories.issue_id = issues.id
WHERE
    stories.type_id <> (SELECT 
            type_id
        FROM
            stories
        GROUP BY type_id
        HAVING COUNT(*) = (SELECT 
                MAX(c)
            FROM
                (SELECT 
                    type_id, COUNT(*) AS c
                FROM
                    stories
                GROUP BY type_id) AS a))