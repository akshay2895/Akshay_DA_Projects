SELECT sum(st.sales_amount) from sales.transactions st
inner join sales.date sd
on st.order_date= sd.date
inner join sales.markets sm
on st.market_code= sm.markets_code
where sd.year= 2020 and sm.markets_code= 'Mark001'




