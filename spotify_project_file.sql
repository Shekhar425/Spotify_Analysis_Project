use EmployeeInfo;

Select * from cleaned_Spotify

**Basic level Questions** 

----Top 5 energy levels

--Create index artist_indics on cleaned_spotify(Artist)

--SQL project Spotify_Analysis 


Select * from Cleaned_spotify

--1.Retrieve the names of all tracks that have more than 1 billion streams.
Select  top 100 track as TRACKS,stream from cleaned_Spotify where Stream >100000000

--2.List all albums along with their respective artists.
Select Album,Artist from Cleaned_Spotify Group by Album,Artist Order by Artist DESC

(14176 rows affected)

--Select Distinct Artist from Cleaned_Spotify
Select DISTINCT(artist) as Artist_Count from Cleaned_Spotify
nuumber of unique Artist-2074

--3.Get the total number of comments for tracks where licensed = TRUE.

Select Sum(Comments) as Comments_Count from Cleaned_Spotify where Licensed= 0

ans:Comments_Count
--------------
55859313

--4.Find all tracks that belong to the album type single.
Select track from Cleaned_spotify where Album_type='Single'

(4973 rows affected)

--5.Count the total number of tracks by each artist.
SELECT 
    artist AS Artist,
    COUNT(track) AS Total_Tracks
FROM Cleaned_spotify
GROUP BY artist
 

(2074 rows affected)

 **Medium Level Questions**

--6.Calculate the average danceability of tracks in each album.
Select  Album, Avg(Danceability) as Average_dance from Cleaned_spotify 
group by Album Order By 1 DESC

(11799 rows affected)
--7.Find the top 5 tracks with the highest energy values.
select Distinct(Track) from cleaned_spotify 
 (17546 rows affected)
 
Select  top 5 Track  As TRACK ,max(Energy) from cleaned_spotify group by track  Order by 2 DESC 
Output------------------------
Tracks 
Gentle Piano Melodies                                                                                                                                                                                                                                            1
Rain and  Thunderstorm, Pt. 3                                                                                                                                                                                                                              1
Rain and Thunderstorm, Pt. 33                                                                                                                                                                                                                                    1
Rain and Thunderstorm, Pt. 4                                                                                                                                                                                                                                     1
Rain and Thunderstorm, Pt. 6   
 
--8.List all tracks along with their views and likes where official_video = TRUE.
Select Track,Views,Likes,official_video from Cleaned_spotify where official_video='TRUE'

(15634 rows affected)

--9.For each album, calculate the total views of all associated tracks. 
Select album,track,SUM(views) from cleaned_Spotify group by Album,track order by Album DESC
 
(18666 rows affected)

--10.Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT * from(
 Select Track,
 Coalesce(Sum(CASE when most_playedon ='YOutube'
 then stream END),0) as streamedon_Youtube

 COALESCE(SUM( CASE when most_playedon='Spotify' then stream end),0) as streamedon_Spotify
  from cleaned_spotify
  Group by 1) As t1
where streamedon_Spotify>streamed0n_youtube
  and 
  streamedon_youtube <> 0




--To check Column_name and DataType
SELECT 
    COLUMN_NAME, 
    DATA_TYPE 
FROM  
    INFORMATION_SCHEMA.COLUMNS 
WHERE 
    TABLE_NAME = 'Cleaned_spotify';

**Advanced Level**

--11.Find the top 3 most-viewed tracks for each artist using window functions.
Query--

with ranking_artist
as
(SELECT Artist,track,SUM(views) as Total_views ,DENSE_RANK() over( Partition by ARTIST order by SUM(views) desc) as
 denserank
from cleaned_Spotify
group by artist,track 
 ) 
select * from ranking_artist 
where denserank <=3

--12.Write a query to find tracks where the liveness score is above the average.

Select track ,liveness from Cleaned_Spotify where liveness >(Select Avg(liveness) from Cleaned_spotify ) order by liveness desc

(6364 rows affected)

--13.Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

WITH cte
AS
(SELECT 
       album,
	MAX(energy) as highest_energy,
	MIN(energy) as lowest_energery
FROM cleaned_spotify
GROUP BY album
)
SELECT 
	album,
	highest_energy - lowest_energery as energy_diff
FROM cte
ORDER BY 2 DESC

(11798 rows affected)

--14.Find tracks where the energy-to-liveness ratio is greater than 1.2.

Select DISTINCT(track), Energy/liveness as Energy_ratio  from Cleaned_Spotify where (energy/Liveness) >1.2

(17109 rows affected) 

--15.Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

WITH ctee
AS
(SELECT 
      Distinct(Track),Album ,Row_Number() over( Order by Track DESC)
	  as Track_Number,Likes
	  from Cleaned_spotify

)
SELECT 
	Track,
	SUM(Likes) over( Order by Track_number )  as SumofLikes
FROM ctee
ORDER BY 2 DESC




--Query Optimization part
Query optimization on Artist column 

Before Query Optimization-

Select TOP 50 artist,track,views from 
Cleaned_Spotify where Artist='Gorillaz'
and most_playedon='Youtube' 



Create INDEX Artist_index on Cleaned_spotify(Artist)
Drop INDEX Artist_index on Cleaned_spotify;


After Query Optimization 

Select * from 
Cleaned_spotify where Artist='Gorillaz'
and most_playedon='Spotify'
