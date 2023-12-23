select * from customer--
select * from genre
select * from invoice
select * from invoice_line
select * from track
select * from playlist_track
select * from artist
select * from album

--name, email wise rock listner
select distinct email,first_name, last_name
from customer c 
inner join invoice i
on c.customer_id= i.customer_id
inner join invoice_line il
on i.invoice_id= il.invoice_id
inner join track t
on il.track_id= t.track_id
inner join genre g
on t.genre_id= g.genre_id
where g.name ilike '%Rock%'
order by 1 asc

-- top rock artist


select a.artist_id, a.name, count(t.track_id) from artist a
inner join album ab 
on ab.artist_id= a.artist_id
inner join track t
on ab.album_id= t.album_id
inner join genre g
on t.genre_id= g.genre_id
where g.name ilike '%Rock%'
group by 1
order by 3 desc
limit 10

--song longer than avg

select name, milliseconds from track
where milliseconds >
( select avg(milliseconds) as avg_lenght
	from track)
order by 2 desc
