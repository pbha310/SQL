SELECT title AS Album, count(Trackid) AS Tracks, count(Trackid)*unitprice AS Price,
case 
when count(trackid )*unitprice > 40 then count(trackid )*unitprice*.9
else
'N/A'
end Discounted_Price 
FROM album a,track t
WHERE a.albumid= t.albumid 
group by (title)
having (Price) > 30.00
order by Price desc;