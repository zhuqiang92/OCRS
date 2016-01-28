CREATE DATABASE ch04;

# -----------------------------------------------------------------------
# user
# -----------------------------------------------------------------------
drop table if exists user;

CREATE TABLE USER (
USERNAME   VARCHAR(20)  NOT NULL,
PASSWORD   VARCHAR(20)  NOT NULL,
REALNAME   VARCHAR(20)  NOT NULL,
ROLE       CHAR(1)      NOT NULL,
PRIMARY KEY (USERNAME) );

# -----------------------------------------------------------------------
# course
# -----------------------------------------------------------------------
drop table if exists course;

CREATE TABLE COURSE (
COURSE_ID   CHAR(6)     NOT NULL,
COURSE_NAME VARCHAR(40) NOT NULL,
TEACHER     VARCHAR(40) NOT NULL,
POINT       INT         NOT NULL,
TIME_1      CHAR(2)     NOT NULL,
TIME_2      CHAR(2)     NOT NULL,
LIMITED     INT         NOT NULL,
PRIMARY KEY (COURSE_ID) );

# -----------------------------------------------------------------------
# elective
# -----------------------------------------------------------------------
drop table if exists elective;

CREATE TABLE ELECTIVE (
USERNAME       VARCHAR(20)     NOT NULL,
COURSE_ID      CHAR(6)         NOT NULL,
PRIMARY KEY (USERNAME, COURSE_ID) );