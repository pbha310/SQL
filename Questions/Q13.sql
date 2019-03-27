CREATE VIEW CustomerView AS 
select distinct country, count(*)-count(company) as 'Individual', 
count(company) as 'Company' 
from customer group by country 
order by country asc;