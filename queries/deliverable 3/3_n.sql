select count(issues.id) as issue_number, series.id as series
from issues
inner join series on issues.series_id = series.id
group by series
order by issue_number
limit 5