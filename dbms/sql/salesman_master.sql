create table salesman_master(
	Salesman_no varchar2(6) primary key check (Salesman_no like 'S%' ),
	Salesman_name varchar2(30) not null,
	Address1 varchar2(30) not null,
	Address2 varchar2(30),
	City varchar2(20),
	Pincode number(8),
	State varchar2(20),
	Sal_amt number(8,2) not null check (Sal_amt>0 ));

desc salesman_master;

insert into salesman_master values(
	'S001','Kiran','A/14','Worli','Bombay',400002,'Maharastra',3000);
insert into salesman_master values(
	'S002','Manish','65','Nariman','Bombay',400002,'Maharastra',3000);
insert into salesman_master values(
	'S003','Ravi','P-7','Bandra','Bombay',400002,'Maharastra',3000);
insert into salesman_master values(
	'S004','Asish','A/5','Juhu','Bombay',400002,'Maharastra',3000);

select * from salesman_master;

commit;