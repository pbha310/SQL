update employee
SET phone ='+'  ||phone, fax = '+' ||fax
where fax not like '+%' and phone not Like '+%';
