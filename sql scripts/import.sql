load data infile 'brand_group.txt'
ignore 
into table brand_groups
character set utf8
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

load data infile 'characters.txt'
ignore 
into table characters
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'country.txt'
ignore 
into table countries
character set utf8
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

load data infile 'editing.txt'
ignore 
into table editors
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'genre.txt'
ignore 
into table genres
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'indicia_publisher.txt'
ignore 
into table indicia_publishers
character set utf8
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

load data infile 'issue_reprint.txt'
ignore 
into table issue_reprints
character set utf8
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

load data infile 'issue.txt'
ignore 
into table issues
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'language.txt'
ignore 
into table languages
character set utf8
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

load data infile 'people.txt'
ignore 
into table people
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'publisher.txt'
ignore 
into table publishers
character set utf8
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

load data infile 'series.txt'
ignore 
into table series
character set utf8
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

load data infile 'series_publication_type.txt'
ignore 
into table series_publication_types
character set utf8
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

load data infile 'story.txt'
ignore 
into table stories
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'story-characters.txt'
ignore 
into table stories_characters
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'stories_colors.txt'
ignore 
into table stories_colors
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'stories_editing.txt'
ignore 
into table stories_editors
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'feature-characters.txt'
ignore 
into table stories_feature
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'stories_genre.txt'
ignore 
into table stories_genres
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'stories_inks.txt'
ignore 
into table stories_inks
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'stories_letters.txt'
ignore 
into table stories_letters
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'stories_pencils.txt'
ignore 
into table stories_pencils
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

load data infile 'stories_script.txt'
ignore 
into table stories_script
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;


load data infile 'story_reprint.txt'
ignore 
into table story_reprints
character set utf8
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

load data infile 'story_type.txt'
ignore 
into table story_types
character set utf8
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines;

load data infile 'issue_editing.txt'
ignore 
into table issues_editors
character set utf8
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;
