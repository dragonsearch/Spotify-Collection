SET GLOBAL local_infile = true;
CREATE DATABASE IF NOT EXISTS spotify;
USE spotify;
set unique_checks = 0;
CREATE TABLE t_artists (
    num INT PRIMARY KEY NOT NULL,
    track_id varchar(255) NOT NULL,
    track_artist varchar(255) NOT NULL,
    track_artist_id varchar(255) NOT NULL
    FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);

SELECT * FROM t_artists;
LOAD DATA LOCAL INFILE './data/spotify_artists_¬.csv' INTO TABLE t_artists
FIELDS TERMINATED BY '¬'

IGNORE 1 LINES;

SELECT track_artist, track_id, track_artist_id FROM t_artists LIMIT 10;

SELECT T.*,T2.* from tracks as T
JOIN t_artists as T2 ON T2.track_id = T.track_id  LIMIT 10;

SELECT COUNT(*) from tracks as T JOIN t_artists as T2 ON T2.track_id = T.track_id  LIMIT 10;