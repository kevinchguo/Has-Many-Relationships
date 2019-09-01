DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(90),
    first_name VARCHAR(90) DEFAULT NULL,
    last_name VARCHAR(90) DEFAULT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

DROP TABLE IF EXISTS posts;

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(180) DEFAULT NULL,
    url VARCHAR(510) DEFAULT NULL,
    content TEXT DEFAULT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    user_id INT REFERENCES users(id)
);

DROP TABLE IF EXISTS comments;

CREATE TABLE comments
(
    id SERIAL PRIMARY KEY,
    body VARCHAR(510) DEFAULT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    user_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);