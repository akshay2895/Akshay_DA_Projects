-- country with highest num of invoice
select billing_country, count(invoice_id) from invoice
group by 1
order by 2 desc

--highest 3 invoice
select invoice_id, total from invoice
order by 2 desc
limit 3

select * from customer
select * from invoice

--highest paying city
select billing_city, sum(total)
from invoice
group by 1
order by 2 desc

--highest paying customer
select c.customer_id,c.first_name, c.last_name, sum(i.total)
from customer c
inner join invoice i
on c.customer_id= i.customer_id
group by 1,2
order by 3 desc
limit 2