SELECT 
    brand_groups.name
FROM
    brand_groups
        INNER JOIN
    publishers ON publishers.id = brand_groups.publisher_id
        INNER JOIN
    indicia_publishers ON publishers.id = indicia_publishers.publisher_id
GROUP BY brand_groups.name
ORDER BY COUNT(*) DESC
LIMIT 10
