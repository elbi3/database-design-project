CREATE TABLE Users (
	user_id INT NOT NULL,
	username VARCHAR(75) NOT NULL,
	email VARCHAR(75) NOT NULL,
	user_phone INT(15) NOT NULL,
	password_hash VARCHAR(250) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	last_login TIMESTAMP NOT NULL,
	attr1 VARCHAR(255) NOT NULL,	-- added default type
	PRIMARY KEY (user_id)
);
CREATE TABLE Patterns (
	pattern_id INT NOT NULL,
	user_id user id NOT NULL,	-- unknown type
	pattern_number VARCHAR(50) NOT NULL,
	pattern_name VARCHAR(255) NOT NULL,
	pattern_subheading VARCHAR(255) NOT NULL,
	pattern_company VARCHAR(100) NOT NULL,
	pattern_size VARCHAR(100) NOT NULL,
	pattern_category VARCHAR(100) NOT NULL,
	pattern_thumbnail BLOB NOT NULL,
	user_text CLOB NOT NULL,	-- type mapped from: TEXT
	photo_url VARCHAR(255) NOT NULL,
	PRIMARY KEY (pattern_id, user_id)
);
CREATE TABLE Comments (
	comment_id INT NOT NULL,
	user_id user id NOT NULL,	-- unknown type
	comment_text CLOB NOT NULL,	-- type mapped from: TEXT
	created_at TIMESTAMP NOT NULL,
	PRIMARY KEY (comment_id, user_id)
);
CREATE TABLE Patterns_Comments (
	pattern_comment_id INT NOT NULL,
	pattern_id pattern id NOT NULL,	-- unknown type
	comment_id comment id NOT NULL,	-- unknown type
	PRIMARY KEY (pattern_comment_id, pattern_id, comment_id)
);
CREATE TABLE Nested_Comments (
	nested_comment_id INT NOT NULL,
	parent_comment_id comment id NOT NULL,	-- unknown type
	comment_id comment id NOT NULL,	-- unknown type
	PRIMARY KEY (nested_comment_id, parent_comment_id, comment_id)
);
