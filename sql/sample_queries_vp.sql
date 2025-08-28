USE vp;
SELECT *
FROM vp.users;

SELECT *
FROM vp.patterns;

SELECT *
FROM vp.comments;

SELECT *
FROM vp.alterations;

SELECT users.username, comments.comment_content
FROM comments
	JOIN users USING(user_id);
    
SELECT users.username, alterations.alteration_content
FROM alterations
	JOIN users USING(user_id);
    
SELECT patterns.pattern_number, alterations.alteration_content
FROM alterations
	JOIN patterns USING(pattern_id);
    
-- SELECT patterns.pattern_number, comments.comment_content
-- FROM comments
-- 	JOIN patterns USING(pattern_id);
-- some indexes to speed up searches
        -- SELECT *
        -- FROM YourTable WITH (INDEX(YourIndexName))
        -- WHERE YourColumn = 'SomeValue';
		--  EXPLAIN SELECT * FROM your_table WHERE indexed_column = 'some_value';
