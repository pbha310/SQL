select address|| ", " ||city|| ", "||country Full_Address
from customer
ORDER by length(Full_Address) desc ;
