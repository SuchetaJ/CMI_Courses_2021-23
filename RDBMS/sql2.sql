use tutorial1;
select * from data;
select count(*) from data;
select count(distinct(job)) from data;
select sum(job) from data;
select count(distinct(job)) from data where commission>1000;
select sum(salary) as tot_salary from data;
select sum(salary) as tot_analyst_salary from data where job='analyst';
select sum(salary) as tot_salesman_salary from data where job='salesman';

#instead of repeatedly writing this

select sum(salary) from data group by job; #gives the sum of the salaries for each type of job
#this doesn't have the details about the job, so which salary corresponds to which job, no idea.



select avg(salary) from data;

select sum(salary) as tot_salary from data group by job order by tot_salary desc;
select sum(salary) as tot_salary from data group by job order by tot_salary desc limit 1;

select max(sum(salary)) from data;
select deptcode, count(empcode) from data group by deptcode;
select * from data where salary = (select max(salary) from data);

select * from data group by job order by count(empfname) descstudents;
select * from students;