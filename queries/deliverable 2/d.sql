SELECT 
    publication_date, COUNT(*) number
FROM
    issues
WHERE
    publication_date >= 1990
GROUP BY publication_date
ORDER BY publication_date ASC