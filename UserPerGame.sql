SELECT g.name as 'Game Name', u.id 'ID of User with most Views per Game', l.iso_name as 'Language of User', 
MAX(CAST(u.view_count as UNSIGNED)) as 'Views per User', brod.type_name as 'Broadcaster Type of User', t.team_name as 'Team of User'
FROM users as u
JOIN streams as str ON str.users_id = u.id
JOIN games as g ON g.id = str.games_id
JOIN language as l ON str.language_id = l.id
JOIN brodcaster_type as brod ON brod.id = u.brodcaster_type_id
JOIN users_has_teams as ut ON u.id = ut.users_id
JOIN teams as t ON t.id = ut.teams_id
GROUP BY g.name
ORDER BY g.name DESC