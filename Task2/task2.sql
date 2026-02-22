create database new_net;
use new_net;
show tables;
select * from netf;
select count(*) from netf;
describe netf;
select title from netf where type='Movie';
select title, release_year from netf where release_year>2018;
select title,release_year from netf order by release_year desc;
-- count Movies vs TV shows
select type, count(*) as total from netf group by type;
-- top 5 countries
select country, count(*) as total from netf group by country order by total desc limit 5;
-- countries with more than 100 titles
select country, count(*) as total from netf group by country having total>50 order by total desc;
select title,release_year from netf where release_year>(select avg (release_year) from netf);
SELECT country, total
FROM (
    SELECT country, COUNT(*) AS total
    FROM netf
    GROUP BY country
) AS country_count
WHERE total > (
    SELECT AVG(total_titles)
    FROM (
        SELECT COUNT(*) AS total_titles
        FROM netf
        GROUP BY country
    ) AS avg_table
);
create table ratings as select distinct rating from netf;
select n.title,n.rating from netf n join ratings r on n.rating=r.rating;
-- top 3 directors with most movies
select director, count(*) as total_movies from netf where type='Movie' and director is not null group by director order by total_movies desc limit 3;