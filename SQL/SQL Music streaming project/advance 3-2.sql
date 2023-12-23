--most popular genre country wise

select * from customer--
select * from genre
select * from invoice
select * from invoice_line
select * from track
select * from playlist_track
select * from artist
select * from album

--country wise highest spent in which genre
with my_table as (
select i.billing_country,g.name,count(il.quantity),
DENSE_RANK() over(partition by i.billing_country order by count(il.quantity) desc) as rk
from invoice i
inner join invoice_line il
on i.invoice_id= il.invoice_id
inner join track t
on il.track_id= t.track_id
inner join genre g
on t.genre_id= g.genre_id
group by 1,2)
select billing_country,name
from my_table
where rk=1