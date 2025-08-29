USE vp;
-- users
-- Count how many users the app has:
SELECT COUNT(*)
FROM vp.users;

-- users who joined the site after a particular timestamp:
SELECT username AS Username, created_at AS `Joined (after 2024-10-25)`
FROM users
WHERE users.created_at > '2024-10-25 00:00:00';

-- summary of user activity
SELECT 'After 2024-10-25' AS login_date, -- don't use backticks
		COUNT(*) AS number_of_users
FROM users
WHERE users.last_login > '2024-10-25';

-- get users who have not submitted a pattern
SELECT users.user_id, users.username, users.email
FROM users 
LEFT JOIN patterns ON users.user_id = patterns.user_id
WHERE patterns.user_id IS NULL;

-- get users who have submitted more than one pattern
SELECT users.user_id, users.username, users.email, COUNT(patterns.pattern_id) AS pattern_count
FROM users
JOIN patterns ON users.user_id = patterns.user_id
GROUP BY users.user_id, users.username, users.email
HAVING COUNT(patterns.pattern_id) > 1;

-- patterns
-- get all pattern companies and total the patterns we have for each company
SELECT pattern_company AS Company, COUNT(pattern_company) AS `Total Patterns in DB`
FROM patterns
GROUP BY pattern_company;

-- comments
-- get the top commenters
SELECT users.user_id, users.username, COUNT(comments.comment_id) AS total_comments
FROM users 
	JOIN comments ON users.user_id = comments.user_id
GROUP BY users.user_id, users.username
ORDER BY total_comments DESC
LIMIT 10;  

-- show the most commented patterns
SELECT patterns.pattern_id,
		patterns.pattern_name,
		COUNT(patterns_comments.comment_id) AS total_comments
FROM patterns 
	JOIN patterns_comments ON patterns.pattern_id = patterns_comments.pattern_id
GROUP BY patterns.pattern_id, patterns.pattern_name
ORDER BY total_comments DESC
LIMIT 10; 

-- see comments that have nested replies:
SELECT comments.comment_id,
    comments.comment_text,
    comments.user_id,
    comments.created_at,
    COUNT(nested.comment_id) AS reply_count
FROM comments 
	JOIN nested_comments nested ON comments.comment_id = nested.parent_comment_id
GROUP BY comments.comment_id, comments.comment_text, comments.user_id, comments.created_at
HAVING COUNT(nested.comment_id) > 0
ORDER BY reply_count DESC;
    
-- view parent comment and nested reply
SELECT parent.comment_id AS parent_comment_id,
    parent.comment_text AS parent_comment_text,
    parent.user_id AS parent_user_id,
    parent.created_at AS parent_created_at,
    reply.comment_id AS reply_comment_id,
    reply.comment_text AS reply_comment_text,
    reply.user_id AS reply_user_id,
    reply.created_at AS reply_created_at
FROM nested_comments 
	JOIN comments parent ON nested_comments.parent_comment_id = parent.comment_id
	JOIN comments reply ON nested_comments.comment_id = reply.comment_id
ORDER BY parent.created_at, reply.created_at;
