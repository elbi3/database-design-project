-- Queries for App Scenarios
USE vp;

-- list users who joined the site after a particular timestamp:
SELECT username
FROM users
WHERE users.created_at > '2024-10-25 00:00:00';

-- Count how many users the app has:
SELECT COUNT(*)
FROM vp.users;