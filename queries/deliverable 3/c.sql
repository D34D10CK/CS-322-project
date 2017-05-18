SELECT 
    *
FROM
    stories
        INNER JOIN
    stories_script ON stories.id = stories_script.story_id
WHERE
    stories_script.person_name = 'Alan Moore'