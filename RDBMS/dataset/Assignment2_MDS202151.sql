create database assignment2;   #creating a new database
use assignment2;
show tables;   #after importing all the tables show the tables
create table stock as (select * from icicibank);  #add rows from the icicibank table
select * from stock;  #look at table stock

insert into stock (symbol,date,prev_close,open_price,high_price,low_price,close_price)  #add rows from the apollo table
select symbol,date,`Prev Close`,`Open Price`,`High Price`,`Low Price`,`Close Price` from apollo;

insert into stock (symbol,date,prev_close,open_price,high_price,low_price,close_price)   #add rows from the reliance table
select symbol,date,`Prev Close`,`Open Price`,`High Price`,`Low Price`,`Close Price` from reliance;

insert into stock (symbol,date,prev_close,open_price,high_price,low_price,close_price)   #add rows from the suntv table
select symbol,date,prev_close,open_price,high_price,low_price,close_price from suntv;

insert into stock (symbol,date,prev_close,open_price,high_price,low_price,close_price)  #add rows from the indigo table
select symbol,date,`Prev Close`,`Open Price`,`High Price`,`Low Price`,`Close Price` from indigo;

select * from stock;
#Check that there are no null values in our table to avoid inconsistency
select count(*) from stock where Symbol is null;
select count(*) from stock where Date is null;
select count(*) from stock where Prev_Close is null; 
select count(*) from stock where Open_Price is null;
select count(*) from stock where High_Price is null;
select count(*) from stock where Low_Price is null;
select count(*) from stock where Close_Price is null;

#Solution Task1
select symbol,count(symbol) as frequency from stock group by symbol; #counts the number of rows in each company's data
select count(*) as total_rows from stock;   #count the total number of rows in table stock

#Solution Task2

#To find the highest gain we assume that the buyer buys shares at the lowest price on the 2nd of Nov,2017 and will sell it at the highest price on each day.
#So, we shall first find the maximum among all the values of high_price of each company and then compare it with the low_price of it's share on 2-Nov-2017.
select symbol,highest_price,cost_price,round((highest_price/cost_price-1)*100,2) as percent_gain from (select a.symbol,max(a.high_price) as highest_price, 
b.low_price as cost_price from stock a,stock b where a.symbol=b.symbol and b.date='2-Nov-17' group by a.symbol) as diff;  #finding the overall highest 
																									#possible percentage gain for each company

#To find the highest loss we assume that the buyer buys shares at the highest price on the 2nd of Nov,2017 and will sell it at the lowest price on each day.
#So, we shall first find the minimum among all the values of low_price of each company and then compare it with the _prighice of it's share on 2-Nov-2017.
select symbol,lowest_price,cost_price,round((1-lowest_price/cost_price)*100,2) as percent_loss from (select a.symbol,min(a.low_price) as lowest_price, 
b.high_price as cost_price from stock a,stock b where a.symbol=b.symbol and b.date='2-Nov-17' group by a.symbol) as diff; #finding the overall 
																								#highest possible percentage loss for each company

#Solution Task3

#we first rank each company as per their percentage gain each day and then take the top 5 ranked entries for each company
select * from (select symbol,date,(Close_Price/Prev_Close-1)*100 as daily_gain,row_number() over 
(partition by symbol order by (Close_Price/Prev_Close-1)*100 desc) as stock_rank from stock) ranks where stock_rank<=5;

#For Apollo the top fives Days were: 12-Sep-19,13-Aug-18,3-Jun-19,16-Aug-19,15-Nov-18
#For ICICI the top five days were: 22-Mar-19,29-Oct-18,20-Sep-19,23-Sep-19,8-May-2018
#For Indigo the top five days were: 14-Nov-18,25-Oct-18,20-Mar-19,30-Oct-19,16-Apr-19
#For Reliance the top five days were: 13-Aug-19,22-Mar-19,20-Sep-19,8-Oct-18,20-May-19
#For SunTV the top fives days were: 14-May-18,11-Feb-19,20-Sep-19,23-Sep-19,8-Feb-18

#Solution Task 4

#stocks closing higher than previous day's close must have the difference between the close_price and prev_close as positive
select date from stock where close_price-prev_close>0 and symbol='RELIANCE'
and date in (select date from stock where close_price-prev_close>0 and symbol='ICICIBANK')
and date in (select date from stock where close_price-prev_close>0 and symbol='APOLLOHOSP')
and date in (select date from stock where close_price-prev_close>0 and symbol='INDIGO')
and date in (select date from stock where close_price-prev_close>0 and symbol='SUNTV'); 


#stocks closing lower than previous day's close must have the difference between the close_price and prev_close as negative
select date from stock where close_price-prev_close<0 and symbol='RELIANCE'
and date in (select date from stock where close_price-prev_close<0 and symbol='ICICIBANK')
and date in (select date from stock where close_price-prev_close<0 and symbol='APOLLOHOSP')
and date in (select date from stock where close_price-prev_close<0 and symbol='INDIGO')
and date in (select date from stock where close_price-prev_close<0 and symbol='SUNTV');

#solution task 5

select * from stock;

# let's look at INDIGO

#we shall find the minimum possible price at which indigo share can be bought during the first week of January.
select date, @go:= min(low_price) as min from stock where date regexp'[0-7]-Jan-18' and date not regexp'[0-9][0-9]-Jan-18' and Symbol ='INDIGO'; 
#We shall find the maximum possible price at which indigo share can be sold during the last week of January.
select date, @ind:= max(high_price) as max from stock where date regexp'[2-3][1, 4-9]-Jan-18' and Symbol ='INDIGO'; 

select (floor(2000/@go)*(@ind - @go)) as profit; #displays the mximum possible profit earned
#The profit earned on Rs.2000 from indigo is Rs.101

# let'look at RELIANCE

#we shall find the minimum possible price at which reliance share can be bought during the first week of January.
select date, @go:= min(low_price) as min from stock where date regexp'[0-7]-Jan-18' and date not regexp'[0-9][0-9]-Jan-18' and Symbol ='RELIANCE';
#We shall find the maximum possible price at which reliance share can be sold during the last week of January.
select date, @ind:= max(high_price) as max from stock where date regexp'[2-3][1, 4-9]-Jan-18' and Symbol ='RELIANCE';

select (floor(2000/@go))*(@ind - @go) as profit; #displays the mximum possible profit earned
#The profit earned on Rs.2000 from reliance is Rs.150.70000000000005

# let's look at 'APOLLOHOSP'

#we shall find the minimum possible price at which apollo share can be bought during the first week of January.
select date, @go:= min(low_price) as min from stock where date regexp'[0-7]-Jan-18' and date not regexp'[0-9][0-9]-Jan-18' and Symbol ='APOLLOHOSP';
#We shall find the maximum possible price at which apollo share can be sold during the last week of January.
select date, @ind:= max(high_price) as max from stock where date regexp'[2-3][1, 4-9]-Jan-18' and Symbol ='APOLLOHOSP';

select (floor(2000/@go))*(@ind - @go) as profit; #displays the mximum possible profit earned
#The profit earned on Rs.2000 from apollohosp is rs.17.09999999999991

## let's look at 'ICICIBANK'

#we shall find the minimum possible price at which icicibank share can be bought during the first week of January.
select date, @go:= min(low_price) as min from stock where date regexp'[0-7]-Jan-18' and date not regexp'[0-9][0-9]-Jan-18' and Symbol ='ICICIBANK';
#We shall find the maximum possible price at which icicibank share can be sold during the last week of January.
select date, @ind:= max(high_price) as max from stock where date regexp'[2-3][1, 4-9]-Jan-18' and Symbol ='ICICIBANK';

select (floor(2000/@go))*(@ind - @go) as profit; #displays the mximum possible profit earned
#The profit earned on Rs.2000 from icicibank is Rs.349.19999999999993

## let's look at 'SUNTV'

#we shall find the minimum possible price at which suntv share can be bought during the first week of January.
select date, @go:= min(low_price) as min from stock where date regexp'[0-7]-Jan-18' and date not regexp'[0-9][0-9]-Jan-18' and Symbol ='SUNTV';
#We shall find the maximum possible price at which suntv share can be sold during the last week of January.
select date, @ind:= max(high_price) as max from stock where date regexp'[2-3][1, 4-9]-Jan-18' and Symbol ='SUNTV';

select (floor(2000/@go))*(@ind - @go) as profit; #displays the mximum possible profit earned
#The profit earned on Rs.2000 from suntv is Rs.139.70000000000027

# so we will purchase ICICIBANK with Rs.2000 as ICICI BANk is giving the maximum profit

#we shall find the minimum possible price at which icicibank share can be bought during the first week of January.
select date, @go:= min(low_price) as min from stock where date regexp'[0-7]-Jan-18' and date not regexp'[0-9][0-9]-Jan-18' and Symbol ='ICICIBANK';
#The best day to buy a share is 1 Jan, 2018.
#We shall find the maximum possible price at which icicibank share can be sold during the last week of January.
select date, @ind:= max(high_price) as max from stock where date regexp'[2-3][1, 4-9]-Jan-18' and Symbol ='ICICIBANK';
#The best day to sell the share is 24 Jan,2018.
select (floor(2000/@go))*(@ind - @go) as profit; #Profit earned on ICICI bank

#We gain maximum profit on Rs.2000 if we buy shares of icicbank on 1 Jan, 2018 and sell them on 24 Jan,2018 and the prfit
#earned is Rs. 349.19999999999993.