select avg(series_length), indicia_publishers
from(
select  (series.year_ended-series.year_began) as series_length, indicia_publishers.id as indicia_publishers
from series
inner join indicia_publishers on indicia_publishers.publisher_id = series.publisher_id
)
group by indicia_publishers