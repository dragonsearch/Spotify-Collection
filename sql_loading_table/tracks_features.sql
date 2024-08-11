SET GLOBAL local_infile = true;
set unique_checks = 0;
CREATE DATABASE IF NOT EXISTS spotify;
USE spotify;

CREATE TABLE tracks (
    track_id varchar(255) PRIMARY KEY NOT NULL,
    track_name varchar(255) NOT NULL,
    album varchar(255) NOT NULL,
    album_id varchar(255) NOT NULL,
    track_number INT NOT NULL,
    disc_number INT NOT NULL,
    track_explicit BOOLEAN NOT NULL, 
    danceability double(5,4) NOT NULL,
    energy double(5,4) NOT NULL,
    kkey INT NOT NULL, 
    loudness double(5,4) NOT NULL,
    mode INT NOT NULL,
    speechiness double(5,4) NOT NULL,
    acousticness double(5,4) NOT NULL,
    instrumentalness double(5,4) NOT NULL,
    liveness double(5,4) NOT NULL,
    valence double(5,4) NOT NULL,
    tempo double(5,4) NOT NULL,
    duration_ms INT NOT NULL,
    time_signature INT NOT NULL,
    release_year INT NOT NULL,
    release_date DATE NOT NULL
);
    

SELECT * FROM tracks;
LOAD DATA LOCAL INFILE './data/tracks_features_¬.csv' INTO TABLE tracks
CHARACTER SET 'utf8mb4'
FIELDS TERMINATED BY '¬'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT release_year FROM tracks LIMIT 10;