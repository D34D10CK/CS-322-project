SELECT
    title
FROM
    stories
WHERE
    id IN (SELECT 
            origin_id
        FROM
            (SELECT DISTINCT
                origin_id, COUNT(origin_id)
            FROM
                story_reprints
            GROUP BY origin_id
            ORDER BY COUNT(origin_id) DESC
            LIMIT 10) as a)