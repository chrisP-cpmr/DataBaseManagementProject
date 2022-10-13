select g.name as 'Game Name', sales.critic_score, sales.na_sales, sales.pal_sales, sales.jp_sales, sales.other_sales, sales.global_sales, 
plat.Platform_name, dev.Developer_name, pub.publisher_name, COUNT(str.id) as 'Number of Streams per Games'
from games as g
join sales on sales.games_id = g.id
join platforms as plat on sales.Platforms_id = plat.id
join developers as dev on sales.Developers_id = dev.id
join publishers as pub on sales.Publishers_id = pub.id
join streams as str on g.id = str.games_id
Group by g.name
order by g.name DESC