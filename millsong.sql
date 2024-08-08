SET GLOBAL local_infile = true;
CREATE DATABASE IF NOT EXISTS spotify;
USE spotify;
CREATE TABLE millsong(
    id INT PRIMARY KEY,
    artist varchar(255),
    song varchar(255),
    link varchar(255),
    text varchar(8191)
);

SELECT * FROM millsong;
LOAD DATA LOCAL INFILE './data/spotify_millsongdata_%.csv' INTO TABLE millsong
FIELDS TERMINATED BY '%'
IGNORE 1 LINES;

DELETE FROM millsong 
WHERE artist IS NULL
OR song IS NULL
OR link IS NULL
OR text IS NULL;

SELECT artist FROM millsong
