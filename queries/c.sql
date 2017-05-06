SELECT 
    name
FROM
    series
WHERE
    country_id = (SELECT 
            id
        FROM
            countries
        WHERE
            name = 'switzerland')
        AND publication_type_id = (SELECT 
            id
        FROM
            series_publication_types
        WHERE
            name = 'magazine');
