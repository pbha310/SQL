select name
from track
where name LIKE "time %" or 
name LIKE "% time"   or 
name LIKE "% time %" or 
lower(name) = "time" or 
upper(name) = "time";