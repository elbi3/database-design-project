CREATE TABLE users (	
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
	user_phone VARCHAR(255),
    created_at TIMESTAMP,
    last_login TIMESTAMP
);

CREATE TABLE patterns (
	pattern_id INT PRIMARY KEY AUTO_INCREMENT,
	pattern_number VARCHAR(15),
    pattern_series VARCHAR(255),
    pattern_company VARCHAR(100),
    pattern_thumbnail VARCHAR(250)
);

CREATE TABLE comments (
	comment_id INT PRIMARY KEY AUTO_INCREMENT,
    comment_content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Alteration_alteration_id INT, 
    Comment_comment_id INT, 
    Pattern_pattern_id INT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE alterations (
    alteration_id INT PRIMARY KEY,
    alteration_content TEXT NOT NULL,
    alteration_picture VARCHAR(255),
    alteration_date DATETIME, 
	user_id INT,
	pattern_id INT, 
    comment_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (pattern_id) REFERENCES Patterns(pattern_id),
    FOREIGN KEY (comment_id) REFERENCES Comments(comment_id)
);
            document.getElementById("hidden-button").hidden = false;
