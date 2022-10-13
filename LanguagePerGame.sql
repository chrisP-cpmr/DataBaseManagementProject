SELECT  g.name as 'Game Name', sales.global_sales as 'Global Sales', sales.critic_score as 'Critic Score',
dev.Developer_name as 'Name of Developer', pub.publisher_name as 'Name of Publisher', plat.Platform_name as 'Name of Platform',
COUNT(str.id) as 'Number of Streams', l.iso_name as 'Most Popular Language', COUNT(l.iso_name) as 'Streams in most Popular Language', 
COUNT(DISTINCT l.language_code) as 'Number of Languages per Game'
FROM streams as str
JOIN games as g ON g.id = str.games_id
JOIN language as l ON l.id = str.language_id 
JOIN sales ON g.id = sales.games_id
JOIN developers as dev ON dev.id = sales.Developers_id
JOIN platforms as plat ON plat.id = sales.Platforms_id
JOIN publishers as pub ON pub.id = sales.Publishers_id
JOIN users as u ON str.users_id = u.id
group by g.name
order by g.name DESC