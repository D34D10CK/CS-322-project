SELECT DISTINCT
    people.name
FROM
    stories
        INNER JOIN
    stories_script ON stories.id = stories_script.story_id
        INNER JOIN
    stories_pencils ON stories.id = stories_pencils.story_id
        INNER JOIN
    stories_colors ON stories.id = stories_colors.story_id
        INNER JOIN
    people ON people.name = stories_script.person_name
        AND people.name = stories_pencils.person_name
        AND people.name = stories_colors.person_name
 
