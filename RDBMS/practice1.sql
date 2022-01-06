create database practice1;
show databases;
use practice1;
create table students(rull_num int, f_name varchar(20), grade varchar(2), result varchar(4));
show tables;
insert into students values('01','Harry Potter','AB','pass');
insert into students values(002,'Ginny Weasley','A','pass');
insert into students values(3,'Fred Weasley','F','fail');
select * from students;