SELECT 
    title
FROM
    stories
        INNER JOIN
    stories_feature
WHERE
    stories_feature.character_id <> 'batman'
        AND character_id IN (SELECT 
            stories_characters.character_name
        FROM
            stories_characters
        WHERE
            stories_characters.character_name = 'batman')
        AND story_id NOT IN (SELECT 
            origin_id
        FROM
            story_reprints)