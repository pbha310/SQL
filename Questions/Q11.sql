SELECT x.title AS "Album Name", GROUP_CONCAT(DISTINCT y.Name) AS "Playlist"
FROM Album x, playlist y, track z, playlisttrack pt
WHERE x.AlbumID = z.AlbumID AND z.TrackID = pt.TrackID AND y.playlistID = pt.playlistID
GROUP BY x.AlbumID 
HAVING COUNT(DISTINCT y.name) >= 5;