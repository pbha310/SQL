select Media, Tracks from(

SELECT  m.name,count(m.mediatypeid) AS 'Tracks', case
when lower(m.name) not like '%protected%' then 'non-Protected'
end Media
FROM track t, mediatype m 
WHERE m.name not LIKE '%Protected%' 
AND m.mediatypeid= t.mediatypeid

UNION 

SELECT m.name,count(m.mediatypeid) AS 'Tracks', case
when lower(m.name) like '%protected%' then 'Protected'
end
FROM track t, mediatype m 
WHERE m.name  LIKE '%protected%' 
AND m.mediatypeid= t.mediatypeid);