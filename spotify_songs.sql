SET GLOBAL local_infile = true;
CREATE DATABASE IF NOT EXISTS spotify;
USE spotify;

CREATE TABLE songs (
    id INT PRIMARY KEY NOT NULL,
    track_id varchar(255) NOT NULL,
    track_artist varchar(255) NOT NULL,
    track_popularity INT NOT NULL,
    track_album_id varchar(255) NOT NULL,
    track_album_name varchar(255) NOT NULL,
    track_album_release_date varchar(255) NOT NULL,
    playlist_name varchar(255) NOT NULL,
    playlist_id varchar(255) NOT NULL,
    playlist_genre varchar(255) NOT NULL,
    playlist_subgenre varchar(255) NOT NULL,
    danceability double(5,4) NOT NULL,
    energy double(5,4) NOT NULL,
    loudness double(5,4) NOT NULL,
    mode INT NOT NULL,
    kkey int not null,
    speechiness double(5,4) NOT NULL,
    acousticness double(5,4) NOT NULL,
    instrumentalness double(5,4) NOT NULL,
    liveness double(5,4) NOT NULL,
    valence double(5,4) NOT NULL,
    tempo double(5,4) NOT NULL,
    duration_ms INT NOT NULL



);

SELECT * FROM songs;
LOAD DATA LOCAL INFILE './data/spotify_songs_·.csv' INTO TABLE songs
FIELDS TERMINATED BY '·'
IGNORE 1 LINES;

SELECT track_artist FROM songs LIMIT 10;