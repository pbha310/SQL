/*1 */
Select "Prachi" as FirstName ,"Sethi" as LastName, "Female" as Gender, "Tutor" as Role,  "Friendly tutor and very approachable" as Short_Description;

/*2 */
select * 
from artist
where (artistID % 17) = 0;

/*3 */
select address|| ", " ||city|| ", "||country Full_Address
from customer
Order by length(Full_Address) desc ;

/*4 */
update employee
set phone ='+'  ||phone, fax = '+' ||fax
where fax not like '+%' and phone not Like '+%';

/*5 */
create Table Login(
Username Text Primary key,
Password Text Not Null,
LasteUpdate Text date default (datetime(current_timestamp)),
Status Text  check (status = 'active' or status= 'inactive'),
CustomerID Integer,
foreign key (CustomerID) references customer (CustomerID));

/*6 */
select name
from track
where name like "time %" or 
name like "% time"   or 
name like "% time %" or 
lower(name) = "time" or 
upper(name) = "time";

/*7 */
select title as Album, count(Trackid) as Tracks, count(Trackid)*unitprice as Price,
case 
when count(trackid )*unitprice > 40 then count(trackid )*unitprice*.9
else
'N/A'
end Discounted_Price 
from album a,track t
where a.albumid= t.albumid 
group by (title)
having (Price) > 30.00
order by Price desc;

/*8 */
select firstname as Name, round((julianday('now', 'localtime') - julianday(hiredate,'localtime'))/365) Year,
round((julianday('now','localtime') - julianday(birthdate,'localtime'))/365) Age
from employee
where title like  '%Manager%' 
order by birthdate
limit 1;

/*9 */
insert into playlist (name) values ('Background Music');
insert into playlisttrack
select playlistid,trackid from track x, playlist y where y.name like '%Background Music%'
order by millisecond desc
limit 10;

/*10 */
select Media, Tracks from(

select  m.name,count(m.mediatypeid) as 'Tracks', case
when lower(m.name) not like '%protected%' then 'non-Protected'
end Media
from track t, mediatype m 
where m.name not like '%Protected%' 
and m.mediatypeid= t.mediatypeid

union 

select m.name,count(m.mediatypeid) as 'Tracks', case
when lower(m.name) like '%protected%' then 'Protected'
end
from track t, mediatype m 
where m.name  like '%protected%' 
and m.mediatypeid= t.mediatypeid);

/*11 */
select x.title as "Album Name", group_concat(distinct y.Name) as "Playlist"
from Album x, playlist y, track z, playlisttrack pt
where x.AlbumID = z.AlbumID and z.TrackID = pt.TrackID and y.playlistID = pt.playlistID
group by x.AlbumID 
having count(distinct y.name) >= 5;

/*12 */
select distinct upper(Substr(email, instr(Email, '@') + 1, instr(substr(email, instr(Email, '@') + 2), '.'))) as Provider,
round((100*count(customerID)/(select cast (count(customerid) as real) from customer)),2) as Percentage
from customer 
group by Provider having percentage >= 5 Order by percentage desc

/*13 */
Create view CustomerView as 
select distinct country, count(*)-count(company) as 'Individual', 
count(company) as 'Company' 
from customer group by country 
order by country asc;

/*14 */
Create trigger UndeleteU2Track
after delete
on track when name like '%U2%'
begin
insert into track values (old.trackid,old.name,old.albumid,old.mediatypeid,old.genreid,old.composer,old.millisecond,old.byte,old.unitprice);
end;