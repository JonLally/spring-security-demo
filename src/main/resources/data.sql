INSERT INTO users (name)
VALUES ('James'),
    ('Mary'),
    ('Silvia');

INSERT INTO roles
VALUES ('ROLE_ADMIN'),
    ('ROLE_DRIVER');

INSERT INTO user_roles
VALUES ((SELECT id FROM users WHERE name = 'James'), 'ROLE_DRIVER'),
    ((SELECT id FROM users WHERE name = 'Mary'), 'ROLE_DRIVER'),
    ((SELECT id FROM users WHERE name = 'Silvia'), 'ROLE_ADMIN');

INSERT INTO job_queue (creation_date, user_id, completed)
VALUES ({ts '2020-09-17 18:47:52.69'}, (SELECT id FROM users WHERE name = 'James'), true),
    ({ts '2020-09-18 22:12:34.182'}, (SELECT id FROM users WHERE name = 'Mary'), true),
    ({ts '2020-09-18 23:32:11.543'}, (SELECT id FROM users WHERE name = 'Mary'), true),
    ({ts '2020-09-19 14:05:28.973'}, (SELECT id FROM users WHERE name = 'James'), true);