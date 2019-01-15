
-- Query all of the entries in the Genre table
SELECT * from Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT into Artist (ArtistName, YearEstablished)
VALUES ("John Mayer", "1992")

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT into Album
SELECT null, "Continumn", "12/4/2005", 12345, "Columbia", artist.artistid, genre.genreid
FROM Artist, Genre
WHERE artist.artistName = "John Mayer"
AND genre.Label = "blues"

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT into Song
SELECT null, "Gravity", 12324, "12/5/2005", Genre.GenreId, Artist.ArtistId,Album.AlbumId
FROM Artist, Genre, Album
WHERE Artist.ArtistName = "John Mayer"
AND Genre.Label = "Blues"
AND ALBUM.Title = "Continumn"

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT a.Title, s.Title, ar.ArtistName
FROM Artist ar
LEFT JOIN Album a , Song s
ON ar.ArtistId = a.ArtistId and ar.ArtistId =s.ArtistId
WHERE a.ArtistId = 28


-- Write a SELECT statement to display how many songs exist for each album.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select a.title, count() as "total songs"
from album a
join song s on s.albumid = a.albumid
group by s.albumid;
-- Write a SELECT statement to display how many songs exist for each artist.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT ar.ArtistName, count() as "total songs"
from Artist ar
join Song s on s.artistId = ar.artistId
group by s.artistId

-- Write a SELECT statement to display how many songs exist for each genre.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Label, count() as "total songs"
from Genre g
join Song s on s.genreId = g.genreId
group by s.genreId
-- Using MAX() function, write a select statement to find the album with the longest duration.
--  The result should display the album title and the duration.
select title, Max(AlbumLength)
from Album
-- Using MAX() function, write a select statement to find the song with the longest duration.
-- The result should display the song title and the duration.

select title, Max(songlength)
from Song

-- Modify the previous query to also display the title of the album.
select s.title, Max(s.songlength), a.title
from Song s
join Album a on s.albumId = a.albumId