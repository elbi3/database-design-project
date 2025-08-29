/*****************************************************************
-- This script creates the VP database for the Vintage Patterns App
******************************************************************/
SHOW DATABASES;
-- create the database
DROP DATABASE IF EXISTS vp;
CREATE DATABASE vp;
-- select the database
USE vp;

-- create the tables
CREATE TABLE users (	
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
	user_phone VARCHAR(255),
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP,
    last_login TIMESTAMP
);

CREATE TABLE patterns (
	pattern_id INT PRIMARY KEY AUTO_INCREMENT,
	pattern_number VARCHAR(50),
    pattern_name VARCHAR(100),
    pattern_subheading VARCHAR(100),
	pattern_company VARCHAR(100),
    pattern_size VARCHAR(100),
	pattern_category VARCHAR(100),
    pattern_thumbnail BLOB,
    user_text TEXT,
    photo_url VARCHAR(255),
    user_id INT,
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE comments (
	comment_id INT PRIMARY KEY AUTO_INCREMENT,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE patterns_comments (
	pattern_comment_id INT PRIMARY KEY AUTO_INCREMENT,
    pattern_id INT,
    comment_id INT,
    FOREIGN KEY(pattern_id) REFERENCES Patterns(pattern_id),
    FOREIGN KEY(comment_id) REFERENCES Comments(comment_id)
);

CREATE TABLE nested_comments (
	nested_comment_id INT PRIMARY KEY AUTO_INCREMENT,
	parent_comment_id INT,
    comment_id INT,
    FOREIGN KEY(parent_comment_id) REFERENCES Comments(comment_id), 
    FOREIGN KEY(comment_id) REFERENCES Comments(comment_id)
);

DESC users;

DESC patterns;

DESC comments;

DESC patterns_comments;

DESC nested_comments;


-- insert rows into the tables

INSERT INTO users (username, email, user_phone, password_hash, created_at, last_login) VALUES
('jdoe92', 'jdoe92@example.com', '+1-202-555-0134', '$2y$10$abcd1234abcd1234abcd12', '2025-06-01 14:23:11', '2025-08-28 10:15:00'),
('samantha_w', 'samantha.w@example.com', '+1-415-555-0199', '$2y$10$efgh5678efgh5678efgh56', '2025-05-15 09:10:45', '2025-08-27 16:42:18'),
('tech_guru', 'tech.guru@example.com', NULL, '$2y$10$ijkl9012ijkl9012ijkl90', '2025-01-12 20:05:33', '2025-08-28 21:03:07'),
('alex_king', 'alex.king@example.net', '+44 7700 900123', '$2y$10$mnop3456mnop3456mnop34', '2025-03-20 11:30:00', '2025-08-29 08:50:10'),
('laura.mendez', 'laura.mendez@example.org', '+61 412 345 678', '$2y$10$qrst7890qrst7890qrst78', '2025-04-03 08:45:21', '2025-08-29 07:15:30'),
('benny23', 'benny23@example.com', NULL, '$2y$10$uvwx1234uvwx1234uvwx12', '2025-06-30 17:12:00', '2025-08-28 22:20:45'),
('natalie_r', 'natalie.r@example.co.uk', '+1-312-555-0168', '$2y$10$yzab5678yzab5678yzab56', '2025-02-14 12:00:00', '2025-08-27 14:02:05'),
('d_chen', 'd.chen@example.com', '+1-646-555-0147', '$2y$10$cdef9012cdef9012cdef90', '2025-07-01 07:05:59', '2025-08-29 05:05:15'),
('mario.rossi', 'mario.rossi@example.it', '+39 347 123 4567', '$2y$10$ghij3456ghij3456ghij34', '2025-03-10 18:40:00', '2025-08-28 19:01:22'),
('aisha_k', 'aisha.k@example.ca', '+1-604-555-0191', '$2y$10$klmn7890klmn7890klmn78', '2025-05-25 13:30:33', '2025-08-29 09:45:50'),
('emily_raines', 'emily.raines@example.com', '+1-303-555-0180', '$2y$10$8k2hGslk28ghSLKeuio098', '2025-04-22 09:45:21', '2025-08-28 18:12:34'),
('tom_hudson', 'tom.hudson@example.net', '+1-646-555-0112', '$2y$10$7Jd8hskg93lsJE893Jd29f', '2025-02-18 11:15:55', '2025-08-27 21:47:00'),
('hana_lee', 'hana.lee@example.org', NULL, '$2y$10$aXk9zG8Kf8Erh8SLp91Vse', '2025-01-05 17:30:12', '2025-08-29 06:55:12'),
('rashid_ali', 'rashid.ali@example.com', '+971 50 123 4567', '$2y$10$kP4mNlsoK83paS9vJd28sl', '2025-03-10 10:22:09', '2025-08-28 20:44:39'),
('isabelle.v', 'isabelle.v@example.fr', '+33 6 12 34 56 78', '$2y$10$plW8Kd93fjSLf82JaKlsjd', '2025-06-17 08:12:00', '2025-08-29 08:03:18'),
('mattc1989', 'mattc1989@example.com', '+1-505-555-0190', '$2y$10$wX19DlK9sYuefJd7Fgl1Po', '2025-07-11 14:30:41', '2025-08-28 22:10:50'),
('noor_ahmed', 'noor.ahmed@example.pk', '+92 300 1234567', '$2y$10$1pLo8kdPf8We7d3lsUoPse', '2025-02-22 12:00:00', '2025-08-29 09:35:00'),
('kristen_ly', 'kristen.ly@example.com', NULL, '$2y$10$uK91NplQk8sPwlOaK82Jse', '2025-03-19 16:22:19', '2025-08-27 15:24:03'),
('javier.m', 'javier.m@example.es', '+34 612 345 678', '$2y$10$Ls81Pkf3Ndo28slJs93Asd', '2025-01-25 09:18:25', '2025-08-28 17:13:45'),
('sophie_d', 'sophie.d@example.ca', '+1-416-555-0123', '$2y$10$Nv7saPo92kEfs8OplW93ld', '2025-05-14 08:45:55', '2025-08-29 07:00:00'),
('lucas_j', 'lucas.j@example.de', '+49 1512 3456789', '$2y$10$8Sk29Wldk72jdfKslV90aj', '2025-02-05 13:34:12', '2025-08-28 19:42:10'),
('tina_olson', 'tina.olson@example.com', NULL, '$2y$10$Mso9sdpWlF8slK2jPkslQs', '2025-06-01 10:25:50', '2025-08-27 11:01:03'),
('rahul_s', 'rahul.s@example.in', '+91 98765 43210', '$2y$10$Plo28sWkd9PaLso2KsjS1w', '2025-03-03 11:40:00', '2025-08-28 23:15:05'),
('oliver_ray', 'oliver.ray@example.com', '+1-718-555-0171', '$2y$10$Zpl39smKeL9qwOplKqpsU7', '2025-07-08 07:58:45', '2025-08-29 05:20:15'),
('marie_k', 'marie.k@example.be', '+32 470 123 456', '$2y$10$Hskl28dlPwnsoFlK2pqoZx', '2025-04-26 12:31:19', '2025-08-29 06:12:10'),
('dan_choi', 'dan.choi@example.kr', '+82 10-1234-5678', '$2y$10$Qpk19slf82slDnpKwos88s', '2025-02-16 14:44:00', '2025-08-28 13:47:22'),
('grace.w', 'grace.w@example.com', '+1-206-555-0193', '$2y$10$Lp28Wskf9oHslK38skd2Qp', '2025-03-28 15:55:45', '2025-08-29 08:48:30'),
('adam_nash', 'adam.nash@example.net', NULL, '$2y$10$Apk9sld29sjLpKso39djdK', '2025-01-19 09:10:00', '2025-08-27 20:18:20'),
('tamara_b', 'tamara.b@example.com', '+1-917-555-0150', '$2y$10$Wpk28sod7QWoslKslKqo23', '2025-06-10 18:22:37', '2025-08-28 12:33:11'),
('yuuto.t', 'yuuto.t@example.jp', '+81 90-1234-5678', '$2y$10$Dpl38shWslPwKqp28snO8w', '2025-05-01 07:05:33', '2025-08-29 07:30:00');

INSERT INTO patterns (
    pattern_number, pattern_name, pattern_subheading, pattern_company,
    pattern_size, pattern_category, pattern_thumbnail, user_text,
    photo_url, user_id
) VALUES
('M1234', 'Summer Wrap Dress', 'Easy-to-sew pattern for beginners', 'McCall\'s', 'XS-XL', 'Dresses', NULL, 'Loved making this — super flowy and comfy!', 'https://example.com/photos/pattern1.jpg', 1),
('V5678', 'Classic Blazer', 'Structured and tailored fit', 'Vogue Patterns', 'S-L', 'Jackets', NULL, 'Challenging but rewarding. Perfect for fall.', 'https://example.com/photos/pattern2.jpg', 2),
('B4321', 'Kids Hoodie', 'Cozy pullover hoodie for kids', 'BurdaStyle', '2T-6T', 'Children', NULL, 'Great pattern for quick weekend project.', 'https://example.com/photos/pattern3.jpg', 4),
('M2345', 'Maxi Skirt', 'Stretch waistband and pockets', 'McCall\'s', 'S-XL', 'Bottoms', NULL, 'Made this in linen — a summer favorite.', 'https://example.com/photos/pattern4.jpg', 2),
('S6789', 'Button-Up Shirt', 'Classic fit with collar and cuffs', 'Simplicity', 'M-XXL', 'Tops', NULL, NULL, 'https://example.com/photos/pattern5.jpg', 5),
('I1010', 'Yoga Pants', 'Comfortable knit pants for lounging', 'IndieSew', 'XS-XXL', 'Activewear', NULL, 'Perfect stretch fit. Love this fabric.', 'https://example.com/photos/pattern6.jpg', 6),
('K7777', 'Dog Coat', 'Small pet coat with hood', 'Kwik Sew', 'XS-M', 'Pets', NULL, NULL, 'https://example.com/photos/pattern7.jpg', 1),
('M3210', 'Wrap Top', 'Tie-front top with variations', 'McCall\'s', 'S-L', 'Tops', NULL, 'Easy beginner make, took about 2 hours.', 'https://example.com/photos/pattern8.jpg', 7),
('V4321', 'Evening Gown', 'Floor-length with slit', 'Vogue Patterns', '4-14', 'Dresses', NULL, 'Sewed this for a wedding. Glamorous!', 'https://example.com/photos/pattern9.jpg', 3),
('S1111', 'Toddler Romper', 'Snap-bottom and shoulder straps', 'Simplicity', '12M-3T', 'Children', NULL, 'Adorable on my niece!', 'https://example.com/photos/pattern10.jpg', 8),
('B5678', 'Culottes', 'High-waisted and flared', 'BurdaStyle', '6-16', 'Bottoms', NULL, NULL, 'https://example.com/photos/pattern11.jpg', 4),
('M9999', 'Simple Tank Top', 'Great for layering', 'McCall\'s', 'XS-XL', 'Tops', NULL, NULL, 'https://example.com/photos/pattern12.jpg', 6),
('V8080', 'Lapel Coat', 'Fully lined with pockets', 'Vogue Patterns', 'S-XXL', 'Outerwear', NULL, 'Took 3 days but so worth it.', 'https://example.com/photos/pattern13.jpg', 9),
('S2222', 'Pajama Set', 'Top and pants combo', 'Simplicity', 'XS-XL', 'Loungewear', NULL, 'Sewed matching sets for the family.', 'https://example.com/photos/pattern14.jpg', 10),
('I3030', 'Athletic Shorts', 'With side pockets and elastic waist', 'IndieSew', 'S-XL', 'Activewear', NULL, NULL, 'https://example.com/photos/pattern15.jpg', 6),
('K5050', 'Baby Blanket', 'Soft flannel reversible blanket', 'Kwik Sew', 'One Size', 'Accessories', NULL, NULL, 'https://example.com/photos/pattern16.jpg', 11),
('B9090', 'Denim Skirt', 'Button-front with frayed hem', 'BurdaStyle', '4-12', 'Bottoms', NULL, 'Used recycled denim — love the outcome.', 'https://example.com/photos/pattern17.jpg', 12),
('V3033', 'Evening Blouse', 'Sheer fabric with bell sleeves', 'Vogue Patterns', 'S-M', 'Tops', NULL, NULL, 'https://example.com/photos/pattern18.jpg', 2),
('M1357', 'Wrap Jumpsuit', 'V-neckline and tie waist', 'McCall\'s', '6-18', 'Jumpsuits', NULL, 'Wore it to a brunch. So comfy!', 'https://example.com/photos/pattern19.jpg', 3),
('S5051', 'Holiday Apron', 'Festive kitchen wear', 'Simplicity', 'One Size', 'Accessories', NULL, NULL, 'https://example.com/photos/pattern20.jpg', 10),
('B1212', 'Men\'s Bomber Jacket', 'Ribbed cuffs and zipper', 'BurdaStyle', 'M-XL', 'Menswear', NULL, 'Made this for my brother!', 'https://example.com/photos/pattern21.jpg', 13),
('K6060', 'Cat Hoodie', 'Yes, for cats!', 'Kwik Sew', 'S-M', 'Pets', NULL, NULL, 'https://example.com/photos/pattern22.jpg', 1),
('I4040', 'Bike Shorts', 'With compression waistband', 'IndieSew', 'XS-XXL', 'Activewear', NULL, 'Surprisingly easy to sew!', 'https://example.com/photos/pattern23.jpg', 14),
('M7777', 'Vintage Dress', '1950s style flared skirt', 'McCall\'s', '4-14', 'Dresses', NULL, 'Retro vibes! Loved this make.', 'https://example.com/photos/pattern24.jpg', 15),
('S8080', 'Simple Skirt', 'Elastic waist and pockets', 'Simplicity', 'XS-L', 'Bottoms', NULL, NULL, 'https://example.com/photos/pattern25.jpg', 4),
('B3030', 'Cape Coat', 'Swing-style with buttons', 'BurdaStyle', 'One Size', 'Outerwear', NULL, NULL, 'https://example.com/photos/pattern26.jpg', 2),
('V6767', 'Floor-Length Dress', 'Formal event wear', 'Vogue Patterns', '6-20', 'Dresses', NULL, 'Wore this to a gala.', 'https://example.com/photos/pattern27.jpg', 6),
('M2468', 'Joggers', 'Elastic waist and ankle cuffs', 'McCall\'s', 'XS-XL', 'Loungewear', NULL, NULL, 'https://example.com/photos/pattern28.jpg', 6),
('S1313', 'Unisex Hoodie', 'Casual pullover', 'Simplicity', 'S-XL', 'Tops', NULL, 'Gifted this to 3 people already.', 'https://example.com/photos/pattern29.jpg', 2),
('K9898', 'Stuffed Animals', 'Various plush toys', 'Kwik Sew', 'One Size', 'Toys', NULL, NULL, 'https://example.com/photos/pattern30.jpg', 11);

-- Insert into comments
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (1, 'Do you think this works with stretch fabric?', '2025-07-23 00:00:00', 8);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (2, 'Thanks for sharing, planning to make this next weekend!', '2025-08-29 00:00:00', 9);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (3, 'Love this pattern! I’ve made it three times.', '2025-06-16 00:00:00', 16);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (4, 'Do you think this works with stretch fabric?', '2025-07-20 00:00:00', 29);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (5, 'Just finished mine—fits perfectly!', '2025-08-21 00:00:00', 1);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (6, 'The instructions were super easy to follow.', '2025-08-10 00:00:00', 17);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (7, 'I had trouble with the sleeves—any tips?', '2025-07-31 00:00:00', 25);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (8, 'So stylish! Definitely adding this to my queue.', '2025-07-02 00:00:00', 9);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (9, 'Thanks for sharing, planning to make this next weekend!', '2025-08-03 00:00:00', 12);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (10, 'Do you think this works with stretch fabric?', '2025-08-09 00:00:00', 25);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (11, 'I love the fabric choice. Where did you get it?', '2025-05-26 00:00:00', 5);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (12, 'Love this pattern! I’ve made it three times.', '2025-07-05 00:00:00', 13);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (13, 'So stylish! Definitely adding this to my queue.', '2025-07-13 00:00:00', 13);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (14, 'The instructions were super easy to follow.', '2025-07-06 00:00:00', 27);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (15, 'Just finished mine—fits perfectly!', '2025-07-14 00:00:00', 23);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (16, 'Reply: The instructions were super easy to follow.', '2025-05-26 00:00:00', 6);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (17, 'Reply: I love the fabric choice. Where did you get it?', '2025-08-25 00:00:00', 24);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (18, 'Reply: I love the fabric choice. Where did you get it?', '2025-06-16 00:00:00', 11);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (19, 'Reply: Thanks for sharing, planning to make this next weekend!', '2025-08-20 00:00:00', 22);
INSERT INTO comments (comment_id, comment_text, created_at, user_id) VALUES (20, 'Reply: Do you think this works with stretch fabric?', '2025-07-10 00:00:00', 21);

-- Insert into patterns_comments
INSERT INTO patterns_comments (pattern_comment_id, pattern_id, comment_id) VALUES (1, 19, 4);
INSERT INTO patterns_comments (pattern_comment_id, pattern_id, comment_id) VALUES (2, 24, 14);
INSERT INTO patterns_comments (pattern_comment_id, pattern_id, comment_id) VALUES (3, 2, 6);
INSERT INTO patterns_comments (pattern_comment_id, pattern_id, comment_id) VALUES (4, 21, 12);
INSERT INTO patterns_comments (pattern_comment_id, pattern_id, comment_id) VALUES (5, 20, 1);
INSERT INTO patterns_comments (pattern_comment_id, pattern_id, comment_id) VALUES (6, 27, 9);
INSERT INTO patterns_comments (pattern_comment_id, pattern_id, comment_id) VALUES (7, 1, 3);
INSERT INTO patterns_comments (pattern_comment_id, pattern_id, comment_id) VALUES (8, 21, 8);
INSERT INTO patterns_comments (pattern_comment_id, pattern_id, comment_id) VALUES (9, 11, 2);
INSERT INTO patterns_comments (pattern_comment_id, pattern_id, comment_id) VALUES (10, 11, 5);

-- Insert into nested_comments
INSERT INTO nested_comments (nested_comment_id, parent_comment_id, comment_id) VALUES (1, 9, 16);
INSERT INTO nested_comments (nested_comment_id, parent_comment_id, comment_id) VALUES (2, 2, 17);
INSERT INTO nested_comments (nested_comment_id, parent_comment_id, comment_id) VALUES (3, 13, 18);
INSERT INTO nested_comments (nested_comment_id, parent_comment_id, comment_id) VALUES (4, 14, 19);
INSERT INTO nested_comments (nested_comment_id, parent_comment_id, comment_id) VALUES (5, 1, 20);

