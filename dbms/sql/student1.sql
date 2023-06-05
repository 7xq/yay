drop table student;

create table student(
	id varchar(10),
	name varchar(50),
	address varchar(100),
	ph_no number(10),
	mail_id varchar(50),
	marks number(5,2),
	DOB Date,
	primary key(ph_no,id));

desc student;


