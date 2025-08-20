CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    user_phone VARCHAR(255)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP
);

CREATE TABLE comments (
    comment_id INT PRIMARY KEY,
    comment_content TEXT NOT NULL,
    Submission_submission_id INT 
    Comment_comment_id INT 
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE submissions (
    submission_id INT PRIMARY KEY,
    submission_content TEXT NOT NULL,
    submission_date DATETIME 
    Comment_comment_id INT 
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE patterns (
    pattern_id INT PRIMARY KEY,
    pattern_name VARCHAR(255)
    pattern_subheading VARCHAR(255)
    pattern_company VARCHAR(100)
    pattern_number VARCHAR(15)
    pattern_thumbnail BLOB
    pattern_size VARCHAR(100)
);