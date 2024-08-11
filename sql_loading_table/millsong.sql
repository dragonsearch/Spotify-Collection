SET GLOBAL local_infile = true;
CREATE DATABASE IF NOT EXISTS spotify;
USE spotify;
CREATE TABLE millsong(
    id INT,
    track_artist varchar(255) NOT NULL,
    track_name varchar(255) NOT NULL,
    link varchar(255) NOT NULL,
    lyrics varchar(8191) NOT NULL,
    PRIMARY KEY (track_artist, track_name)
);

SELECT * FROM millsong;
LOAD DATA LOCAL INFILE './data/spotify_millsongdata_%.csv' INTO TABLE millsong
FIELDS TERMINATED BY '%'
IGNORE 1 LINES;

SELECT track_artist FROM millsong LIMIT 10;