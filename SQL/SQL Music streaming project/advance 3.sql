--customer name, artist name, amount spent

select * from customer--
select * from genre
select * from invoice
select * from invoice_line
select * from track
select * from playlist_track
select * from artist
select * from album

--way 1 customer who spent most on single artist
select c.first_name, c.last_name, a.name, sum(il.unit_price * il.quantity) as total_costing
from customer c
inner join invoice i
on c.customer_id= i.customer_id
inner join invoice_line il
on i.invoice_id= il.invoice_id
inner join track t
on il.track_id= t.track_id
inner join album ab
on t.album_id= ab.album_id
inner join artist a
on ab.artist_id= a.artist_id
group by 1,2,3
order by 3 desc

--way 2
with my_table as (
select a.artist_id, a.name, sum(il.unit_price * il.quantity) as total_costing
from invoice_line il
inner join track t
on il.track_id= t.track_id
inner join album ab
on t.album_id= ab.album_id
inner join artist a
on ab.artist_id= a.artist_id
group by 1
order by 2 desc)
select c.customer_id, c.first_name, c.last_name, mt.name, sum(il.unit_price * il.quantity) amtt
from customer c 
inner join invoice i
on i.customer_id= c.customer_id
inner join invoice_line il 
on il.invoice_id= i.invoice_id
inner join track t
on il.track_id = t.track_id
inner join album ab
on ab.album_id = t.album_id
inner  join my_table mt 
on mt.artist_id= ab.artist_id
group by 1,2,3,4
order by 5 desc