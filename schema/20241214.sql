DROP SCHEMA IF EXISTS obj CASCADE;
CREATE SCHEMA obj;

-- User database

DROP TABLE IF EXISTS obj.user CASCADE;
DROP TYPE IF EXISTS obj_user_source;

CREATE TYPE obj_user_source AS ENUM ('github', 'gitlab', 'azure');

CREATE TABLE obj.user (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    email_address VARCHAR(255) NOT NULL,
    data JSON
);

-- Session

DROP TABLE IF EXISTS obj.session;
CREATE TABLE obj.session (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES obj.user(id) ON DELETE CASCADE,
    ip_address INET NOT NULL,
    data JSON
);