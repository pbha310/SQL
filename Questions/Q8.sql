select firstname as Name, round((julianday('now', 'localtime') - julianday(hiredate,'localtime'))/365) Year,
round((julianday('now','localtime') - julianday(birthdate,'localtime'))/365) Age
from employee
where title like  '%Manager%' 
order by birthdate
limit 1;