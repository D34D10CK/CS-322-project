SELECT 
    story_types.name
FROM
    story_types
WHERE
    id NOT IN (SELECT 
            story_types.id
        FROM
            stories
                INNER JOIN
            issues ON issues.id = stories.issue_id
                INNER JOIN
            series ON issues.series_id = series.id
                INNER JOIN
            languages ON series.language_id = languages.id
                INNER JOIN
            series_publication_types ON series.publication_type_id = series_publication_types.id
                INNER JOIN
            story_types ON story_types.id = stories.type_id
        WHERE
            languages.name = 'italian'
                AND series_publication_types.name = 'magazine')