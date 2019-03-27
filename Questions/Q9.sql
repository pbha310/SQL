insert into playlist (name) values ('Background Music');
insert into playlisttrack
select playlistid,trackid from track x, playlist y where y.name like '%Background Music%'
order by millisecond desc
limit 10;