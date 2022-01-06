create database assignment2;
use assignment2;
show tables;
create table stock as (select * from icicibank);
select * from stock;

insert into stock (symbol,date,prev_close,open_price,high_price,low_price,close_price)
select symbol,date,`Prev Close`,`Open Price`,`High Price`,`Low Price`,`Close Price` from apollo;

insert into stock (symbol,date,prev_close,open_price,high_price,low_price,close_price)
select symbol,date,`Prev Close`,`Open Price`,`High Price`,`Low Price`,`Close Price` from reliance;

insert into stock (symbol,date,prev_close,open_price,high_price,low_price,close_price)
select symbol,date,prev_close,open_price,high_price,low_price,close_price from suntv;

insert into stock (symbol,date,prev_close,open_price,high_price,low_price,close_price)
select symbol,date,`Prev Close`,`Open Price`,`High Price`,`Low Price`,`Close Price` from indigo;

#Solution Task1
select symbol,count(symbol) from stock group by symbol;
select count(symbol) from stock;

select * from stock;

#Solution Task2

select symbol,highest_price,cost_price,round((highest_price/cost_price-1)*100,2) as percent_gain from (select a.symbol,max(a.high_price) as highest_price, 
b.low_price as cost_price from stock a,stock b where a.symbol=b.symbol and b.date='2-Nov-17' group by a.symbol) as diff;

select symbol,lowest_price,cost_price,round((lowest_price/cost_price-1)*100,2) as percent_loss from (select a.symbol,max(a.low_price) as lowest_price, 
b.high_price as cost_price from stock a,stock b where a.symbol=b.symbol group by a.symbol) as diff;


select symbol,max(high_price) as highest_price from stock group by symbol join (select symbol, low_price from stock where date ='2-Nov-17') where;
select symbol,high_price from stock where high_price=max(high_price);

select max(high_price) from 

 where b.date = '2-Nov-17'
create table new_tab as (select symbol,avg(Open_Price+ High_Price+ Low_Price+ Close_Price)/4 as avg_price from stock group by symbol order by symbol asc);
create table base_tab as (select symbol,(Open_Price+ High_Price+ Low_Price+ Close_Price)/4 as base_price from stock where date = '2-Nov-17' order by symbol asc);
select * from new_tab;
select new_tab.symbol, ((new_tab.avg_price/base_tab.base_price)-1)*100 as percent_change from new_tab,base_tab where new_tab.symbol = base_tab.symbol 
order by percent_change desc limit 1;
select new_tab.symbol, ((new_tab.avg_price/base_tab.base_price)-1)*100 as percent_change from new_tab,base_tab where new_tab.symbol = base_tab.symbol 
order by percent_change asc limit 1;

select * from stock;


#Solution Task3
select * from (select symbol,date,(Close_Price/Prev_Close-1)*100 as daily_gain,row_number() over 
(partition by symbol order by (Close_Price/Prev_Close-1)*100 desc) as stock_rank from stock) ranks where stock_rank<=5;

#Solution Task4
select symbol,date,prev_close,close_price, close_price-prev_close as diff from stock where close_price-prev_close>0;

select symbol,date,prev_close,close_price, close_price-prev_close as diff from stock where close_price-prev_close<0;

#Solution Task5


select a.symbol,a.date as first_date,a.low_price,b.date as last_date,b.high_price from stock a, stock b  where a.date in ('1-Jan-18','2-Jan-18','4-Jan-18','5-Jan-18') 
and b.date in ('24-Dec-18','26-Dec-18','27-Dec-18','28-Dec-18','31-Dec-18');

select symbol,first_date,last_date,max(diff) as max_profit from(select symbol,first_date,last_date,high_price - low_price as diff from (select a.symbol,a.date as first_date,a.low_price,b.date as last_date,b.high_price from stock a, stock b  where a.date in ('1-Jan-18','2-Jan-18','4-Jan-18','5-Jan-18') 
and b.date in ('24-Dec-18','26-Dec-18','27-Dec-18','28-Dec-18','31-Dec-18')) as tab) as diff_tab group by symbol order by max_profit desc;

select symbol,first_date,last_date,max(diff) as max_profit from(select symbol,first_date,last_date,high_price - low_price as diff from (select a.symbol,a.date as first_date,a.low_price,b.date as last_date,b.high_price from stock a, stock b  where a.date in ('1-Jan-18','2-Jan-18','4-Jan-18','5-Jan-18') 
and b.date in ('24-Dec-18','26-Dec-18','27-Dec-18','28-Dec-18','31-Dec-18')) as tab) as diff_tab;

select symbol,first_date,last_date,high_price,low_price,max(diff) from(select symbol,first_date,last_date,low_price,high_price,
(high_price - low_price )as diff from (select a.symbol,a.date as first_date,a.low_price,b.date as last_date,b.high_price 
from stock a, stock b  where a.date in ('1-Jan-18','2-Jan-18','4-Jan-18','5-Jan-18') 
and b.date in ('24-Dec-18','26-Dec-18','27-Dec-18','28-Dec-18','31-Dec-18')) as tab) as diff_tab;


select first/second from open_price as first where date = '2-Nov-17', high_price as second where date = '7-Nov-17' from stock;

select symbol,avg(Open_Price+ High_Price+ Low_Price+ Close_Price)/4 from stock group by symbol order by symbol asc;


select (Open_Price+ High_Price+ Low_Price+ Close_Price)/4 from stock where date = '2-Nov-17' order by symbol asc;

select symbol, date,(Open_Price+ High_Price+ Low_Price+ Close_Price)/4 as Avg_price from stock order by Avg_price desc limit 1;

select symbol,avg((Open_Price+ High_Price+ Low_Price+ Close_Price)/4)- (select (Open_Price+ High_Price+ Low_Price+ Close_Price)/4 from stock where date = '2-Nov-17' order by symbol asc) 
as Avg_price from stock group by symbol order by symbol asc;

select (avg(Open_Price+ High_Price+ Low_Price+ Close_Price)/4 from stock group by symbol order by symbol asc)/(select (Open_Price+ High_Price+ Low_Price+ Close_Price)/4 from stock where date = '2-Nov-17' order by symbol asc)



select symbol,date,(Open_Price+ High_Price+ Low_Price+ Close_Price)/4 - (select (Open_Price+ High_Price+ Low_Price+ Close_Price)/4 from stock where date = '2-Nov-17') from stock group by symbol;


select (Open_Price+ High_Price+ Low_Price+ Close_Price)/4 from stock where date = '2-Nov-17';

select * from stock order by symbol desc;




#Solution Task5

select * from stock;

#Shows the entries with profit in descending order.
select symbol,first_date,low_price,last_date,high_price,high_price-low_price as diff from (select a.symbol,a.date as first_date,a.low_price,b.date as last_date,b.high_price 
from stock a, stock b  where a.date in ('1-Jan-18','2-Jan-18','4-Jan-18','5-Jan-18') 
and b.date in ('24-Jan-18','25-Jan-18','29-Jan-18','30-Jan-18','31-Jan-18')) as t1 order by diff desc;
#From the table it is prominent that the top entries are of icicibank, indicating higher profits from the shares of icicibank.
#Also, the selling dates of the top 5 entries are same that is 25th of January,2018.

#Now let's look at the entry having the maximum profit per share.
select symbol,first_date,low_price,last_date,high_price,high_price-low_price as diff from (select a.symbol,a.date as first_date,a.low_price,b.date as last_date,b.high_price 
from stock a, stock b  where a.date in ('1-Jan-18','2-Jan-18','4-Jan-18','5-Jan-18') 
and b.date in ('24-Jan-18','25-Jan-18','29-Jan-18','30-Jan-18','31-Jan-18')) as t1 order by diff desc limit 1;
#We get that icicibank has the maximum possible profit when investment is made on the 2nd of January, 2018 and the shares are sold on
#the 25th of January, 2018. So the best day to invest in the first week of 2018 is 2-Jan-2021 and best day to sell in the last week is 
#25-Jan-2018. The stock that would have given the maximum profit is icicibank of Rs.971.5 per share.

select max(high_price) from stock where date in ('24-Jan-18','25-Jan-18','29-Jan-18','30-Jan-18','31-Jan-18');

#we shall find the profit earned on investing rs.2000.
select symbol,first_date,low_price,last_date,high_price,high_price-low_price as diff, floor(2000/low_price) as number_of_shares,
floor(2000/low_price)*(high_price-low_price) as profit  from (select a.symbol,a.date as first_date,a.low_price,b.date as last_date,b.high_price 
from stock a, stock b  where a.date in ('1-Jan-18','2-Jan-18','4-Jan-18','5-Jan-18') 
and b.date in ('24-Jan-18','25-Jan-18','29-Jan-18','30-Jan-18','30-Jan-18','31-Jan-18')) as t1 order by diff desc limit 1;
#We can see on investing rs.2000 we are able to buy 6 shares of icicibank which gives us a profit of Rs.5829 total
#if we buy it on 2-Jan-2018 and sell it on 25-Jan-2018.

drop table stock;


drop database assignment2;