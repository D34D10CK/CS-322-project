SELECT DISTINCT
    stories_script.person_name
FROM
    stories_script
        INNER JOIN
    stories ON stories.id = stories_script.story_id
        INNER JOIN
    stories_genres ON stories.id = stories_genres.story_id
        INNER JOIN
    stories_pencils ON stories_script.story_id = stories_pencils.story_id
WHERE
    stories_genres.genre_name = 'nature'