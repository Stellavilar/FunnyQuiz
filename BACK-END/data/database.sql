BEGIN;

DROP TABLE IF EXISTS quiz;
CREATE TABLE quiz (
    id SERIAL PRIMARY KEY,
    langue text NULL default '',
    theme text NULL default '',
    question text NOT NULL default '',
    prop1 text NOT NULL default '',
    prop2 text NOT NULL default '',
    prop3 text NOT NULL default '',
    prop4 text NOT NULL default '',
    niveau int NULL,
    anecdote varchar(255) NOT NULL default '',
    wiki varchar(255) NOT NULL default '',
    tag_id int NOT NULL, 
    level_id int NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP

);

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username text NOT NULL,
    mail text NOT NULL,
    score int NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

DROP TABLE IF EXISTS tag;
CREATE TABLE tag (
    id int NOT NULL,
    title text NOT NULL,
    color text NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP

);

DROP TABLE IF EXISTS levels;
CREATE TABLE levels (
    id int NOT NULL,
    title text NOT NULL,
    color text NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP

);

DROP TABLE IF EXISTS subcategory;
CREATE TABLE subcategory (
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

DROP TABLE IF EXISTS quiz_has_subcategory;
CREATE TABLE quiz_has_subcategory (
    id int NOT NULL,
    subcategory_id int NOT NULL REFERENCES subcategory(id),
    quizzes_id int NOT NULL REFERENCES quiz(id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS answer;
CREATE TABLE answer (
    id int NOT NULL,
    title text NOT NULL,
    quiz_id int NOT NULL REFERENCES quiz(id),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

COMMIT;
