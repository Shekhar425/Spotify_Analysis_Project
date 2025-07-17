# Spotify_Analysis_Project
Project Dataset- https://www.kaggle.com/datasets/sanjanchaudhari/spotify-dataset

![Alt text](https://github.com/Shekhar425/Spotify_Analysis_Project/blob/8967acc4a03dcac929f18b43f98817adb1e26b26/spotify_image.png)
 DROP TABLE IF EXISTS spotify;
 
``` CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);
```

Check for final Check
