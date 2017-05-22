SELECT DISTINCT
    stories_script.person_name
FROM
    stories_script
        INNER JOIN
    stories ON stories.id = stories_script.story_id
        INNER JOIN
    story_types ON story_types.id = stories.type_id
WHERE
    story_types.name = 'cartoon'
        AND stories_script.person_name IN (SELECT 
            *
        FROM
            (SELECT 
                stories_script.person_name
            FROM
                indicia_publishers
            INNER JOIN publishers ON indicia_publishers.publisher_id = publishers.id
            INNER JOIN series ON series.publisher_id = publishers.id
            INNER JOIN issues ON issues.series_id = series.id
            INNER JOIN stories ON stories.issue_id = issues.id
            INNER JOIN stories_script ON stories.id = stories_script.story_id
            GROUP BY stories_script.person_name , indicia_publishers.name) AS a
        GROUP BY person_name
        HAVING COUNT(*) > 1)