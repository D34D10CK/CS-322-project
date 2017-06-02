select indicia_publisher_id
from
   (
   select count(id) as issue_number, indicia_publisher_id, series_id
   from (
           select issues.series_id, issues.indicia_publisher_id, issues.id
           from issues
           inner join series on issues.series_id = series.id
           )
   group by series_id
   )
group by indicia_publisher_id
having count(issue_number) =1
order by count(series_id) desc
limit 10