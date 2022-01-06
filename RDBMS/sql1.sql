CREATE DATABASE tutorial1;
use tutorial1;
select concat(empfname,' ',emplname) as name from data where job='analyst';

update data set commission = commission+100;

select * from data;
delete from data where commission =200;
delete from data where commission ='300.05';
insert into data values(9122,'RON','JOSH','ANALYST',7751,'1981-05-22',2450,'300.05',10);
select * from data where commission ='300';

delete from data where commission ='300.05';
SET SQL_SAFE_UPDATES = 0;
update data set commission ='1600.05' where commission='1500';
delete from data where EmpFName='ron';
delete from data where salary = 2950;
