SELECT distinct(sp.product_code) FROM sales.products sp
inner join  sales.transactions st
on sp.product_code= st.product_code
inner join sales.markets sm
on st.market_code= sm.markets_code
where sm.markets_name= 'Mumbai';