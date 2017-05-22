SELECT DISTINCT
    series.name, stories.title, stories.type_id, count(*)
FROM
    series
        INNER JOIN
    issues ON series.id = issues.series_id
        INNER JOIN
    stories ON stories.issue_id = issues.id
group by series.name, stories.title, stories.type_id 
  

#WHERE
 #   stories.type_id <> (SELECT 
  #          type_id
   #     FROM
    #        stories
     #   GROUP BY type_id
      #  HAVING COUNT(*) = (SELECT 
       #         MAX(c)
        #    FROM
         #       (SELECT 
          #          type_id, COUNT(*) AS c
           #     FROM
            #        stories
             #   GROUP BY type_id) AS a))