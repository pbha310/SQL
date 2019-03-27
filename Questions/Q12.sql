SELECT DISTINCT UPPER(Substr(email, INSTR(Email, '@') + 1, INSTR(SUBSTR(email, INSTR(Email, '@') + 2), '.'))) AS Provider,
ROUND((100*COUNT(customerID)/(SELECT CAST (COUNT(customerid) AS REAL) FROM customer)),2) AS Percentage
FROM customer 
GROUP BY Provider HAVING percentage >= 5 ORDER BY percentage DESC