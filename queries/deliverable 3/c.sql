SELECT 
    stories_characters.character_name
FROM
    stories
        INNER JOIN
    stories_script ON stories.id = stories_script.story_id
        INNER JOIN
    stories_characters ON stories.id = stories_characters.story_id
        INNER JOIN
    story_reprints ON story_reprints.origin_id = stories.id
WHERE
    stories_script.person_name = 'Alan Moore'
GROUP BY stories_characters.character_name
ORDER BY COUNT(*) DESC
LIMIT 10