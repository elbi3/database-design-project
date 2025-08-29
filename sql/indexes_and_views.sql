-- Indexes and Views

-- for queries about last login:
CREATE INDEX idx_users_last_login ON users(last_login);

-- optimize join and filtering by user
CREATE INDEX idx_patterns_user_id ON patterns(user_id);

-- If you search or filter by company, category, or size
CREATE INDEX idx_patterns_company ON patterns(pattern_company);
CREATE INDEX idx_patterns_category ON patterns(pattern_category);
CREATE INDEX idx_patterns_size ON patterns(pattern_size);

-- in case foriegn key is not automatically indexed
CREATE INDEX idx_comments_user_id ON comments(user_id);

-- If you often filter or sort by date
CREATE INDEX idx_comments_created_at ON comments(created_at);

-- Speed up lookups and joins
CREATE INDEX idx_pc_pattern_id ON patterns_comments(pattern_id);
CREATE INDEX idx_pc_comment_id ON patterns_comments(comment_id);

-- Index both parent and child for fast threading and joins
CREATE INDEX idx_nested_parent_comment ON nested_comments(parent_comment_id);
CREATE INDEX idx_nested_comment ON nested_comments(comment_id);

-- show each user with a count of their patterns and their last login
CREATE VIEW UserPatternsSummary AS
	SELECT users.user_id,
		users.username,
		users.email,
		users.last_login,
		COUNT(patterns.pattern_id) AS pattern_count
	FROM users 
		LEFT JOIN patterns  ON users.user_id = patterns.user_id
	GROUP BY users.user_id, users.username, users.email, users.last_login;

-- show each pattern and total number of comments received
CREATE VIEW PatternCommentsSummary AS
	SELECT 
		patterns.pattern_id,
		patterns.pattern_name,
		patterns.pattern_company,
		COUNT(patterns_comments.comment_id) AS total_comments
	FROM patterns 
	LEFT JOIN patterns_comments  ON patterns.pattern_id = patterns_comments.pattern_id
	GROUP BY patterns.pattern_id, patterns.pattern_name, patterns.pattern_company;

-- show parent comments and nested replies with user usernames
CREATE VIEW NestedCommentsDetailed AS
	SELECT parent.comment_id AS parent_comment_id,
		parent.comment_text AS parent_text,
		parent.user_id AS parent_user_id,
		parent.created_at AS parent_created_at,
		parent_user.username AS parent_username,
		reply.comment_id AS reply_comment_id,
		reply.comment_text AS reply_text,
		reply.user_id AS reply_user_id,
		reply.created_at AS reply_created_at,
		reply_user.username AS reply_username
	FROM nested_comments nc
		JOIN comments parent ON nc.parent_comment_id = parent.comment_id
		JOIN users parent_user ON parent.user_id = parent_user.user_id
		JOIN comments reply ON nc.comment_id = reply.comment_id
		JOIN users reply_user ON reply.user_id = reply_user.user_id;

-- show active users
CREATE VIEW ActiveUsers AS
	SELECT users.user_id,
		users.username,
		users.email,
		users.last_login,
		COUNT(DISTINCT patterns.pattern_id) AS patterns_created,
		COUNT(DISTINCT comments.comment_id) AS comments_made
	FROM users 
		LEFT JOIN patterns ON users.user_id = patterns.user_id
		LEFT JOIN comments ON users.user_id = comments.user_id
	WHERE users.last_login >= NOW() - INTERVAL 30 DAY
	GROUP BY users.user_id, users.username, users.email, users.last_login;
