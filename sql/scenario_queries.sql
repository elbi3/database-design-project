-- Queries for App Scenarios
USE vp;

-- users who joined the siteafter a particular timestamp:
SELECT username AS Username, created_at AS `Joined (after 2024-10-25)`
FROM users
WHERE users.created_at > '2024-10-25 00:00:00';

-- Count how many users the app has:
SELECT COUNT(*)
FROM vp.users;

-- list user's usernames joined with their comments from comment table
SELECT users.username, comments.comment_content
FROM comments
	JOIN users USING(user_id);

-- list user's usernames joined with the alteration content they submitted
SELECT users.username, alterations.alteration_content
FROM alterations
	JOIN users USING(user_id);

-- show alterations made for particular patterns using a join to show alteration content with applicable pattern number
SELECT patterns.pattern_number, alterations.alteration_content
FROM alterations
	JOIN patterns USING(pattern_id);

-- get all pattern companies and total the patterns we have for each company
SELECT pattern_company AS Company, COUNT(pattern_company) AS `Total Patterns in DB`
FROM patterns
GROUP BY pattern_company;

-- summary of user activity
SELECT 'After 2024-10-25' AS login_date, -- don't use backticks
		COUNT(*) AS number_of_users
FROM users
WHERE users.last_login > '2024-10-25';

-- get alteration submission by a particular user on a particular day
SELECT alteration_content, alteration_picture, alteration_date, users.username
FROM alterations
	JOIN users USING(user_id)
WHERE alteration_date = '2025-06-23';