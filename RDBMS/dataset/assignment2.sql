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