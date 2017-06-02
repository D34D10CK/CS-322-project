select table1.writer_number, issues.indicia_publisher_id
from 
(
select count(stories_script.person_name) as writer_number, stories_script.story_id, stories.issue_id
from stories_script as table1
inner join stories on stories_script.story_id = stories.id
group by story_id
)
inner join issues on issues.id = table1.issue_id
order by writer_number desc
limit 10