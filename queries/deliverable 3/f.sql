SELECT 
    languages.name, COUNT(*) AS number
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
WHERE
    series_publication_types.name = 'magazine'
        AND stories.id NOT IN (SELECT 
            story_reprints.target_id
        FROM
            story_reprints)
GROUP BY languages.id
HAVING COUNT(*) > 10000