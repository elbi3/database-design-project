
-- speed up query to display thumbnails for browsing many patterns at once (if the user is doing a visual/picture search)
CREATE INDEX idx_thumbnails ON Patterns(pattern_thumbnail);
-- check:
EXPLAIN SELECT pattern_thumbnail
FROM vp.patterns;

-- speed up search query to narrow down pattern browsing for user. Example: "get me everything in 'easy to make''"
CREATE INDEX idx_categories ON Patterns(pattern_series);

-- send out email notifications to all users
CREATE INDEX idx_user_emails ON Users(email);

-- show users who submit alterations
CREATE VIEW active_users_alterations_view AS
SELECT users.username, alterations.alteration_content
FROM users
	JOIN alterations USING(user_id);

-- show users who comment 
CREATE VIEW active_users_comments_view AS
SELECT users.username, comments.comment_content
FROM users
	JOIN comments USING(user_id);