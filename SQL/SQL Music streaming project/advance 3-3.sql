select * from customer--
select * from genre
select * from invoice
select * from invoice_line
select * from track
select * from playlist_track
select * from artist
select * from album

with my_table as (
select c.first_name, c.last_name, c.country, sum(il.unit_price * il.quantity)as total_spent,
DENSE_RANK() over (partition by c.country order by sum(il.unit_price * il.quantity) desc) as rkk
from customer c 
inner join invoice i
on c.customer_id= i.customer_id
inner join invoice_line il
on i.invoice_id= il.invoice_id
	group by 1,2,3
)
select first_name, last_name, country, total_spent
from my_table
where rkk=1