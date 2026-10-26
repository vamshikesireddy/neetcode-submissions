-- Write your query below
select name
from customers
WHERE id NOT IN
(SELECT customer_id FROM orders);
