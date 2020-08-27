DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

PRAGMA foreign_keys = ON;

/* USERS TABLE */
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


/* QUESTIONS TABLE */
CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    associated_author_id INTEGER NOT NULL,

    FOREIGN KEY (associated_author_id) REFERENCES users(id)
);


/* QUESTION FOLLOWS TABLE */
CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    users_id INTEGER,
    questions_id INTEGER,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);


/* REPLIES TABLE */
CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    users_id INTEGER,
    questions_id INTEGER,
    parent_reply_id INTEGER,

    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

/* QUESTION LIKES TABLE */
CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    users_id INTEGER,
    questions_id INTEGER,
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

/* SEEDING THE DATABASE */
INSERT INTO
    users(fname, lname)
VALUES
    ("Brandon", "Leong"),
    ("Nate", "Oh");

INSERT INTO
    questions(title, body, associated_author_id) 
VALUES
    ('SQL?', 'How do?!', (SELECT id FROM users WHERE lname = "Leong")),
    ("CSS?", "Frog?!", (SELECT id FROM users WHERE lname = "Oh"));

INSERT INTO
    question_follows(users_id, questions_id)
VALUES
    ((SELECT id FROM users WHERE lname = 'Oh'), (SELECT id FROM questions WHERE title = 'SQL?')),
    ((SELECT id FROM users WHERE lname = 'Leong'),( SELECT id FROM questions WHERE body = 'Frog?!'));

INSERT INTO
    replies(body, users_id, questions_id)
VALUES
    ('Just do it', (SELECT id FROM users WHERE lname = 'Oh'), (SELECT id FROM questions WHERE title = 'SQL?'));

INSERT INTO 
    question_likes(users_id, questions_id)
VALUES
    ((SELECT id FROM users WHERE lname = 'Leong'), ( SELECT id FROM questions WHERE title = 'CSS?'));