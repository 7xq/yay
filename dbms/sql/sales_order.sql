
drop table sales_order;
create table sales_order(
	Order_no varchar2(6) primary key check (Order_no like 'O%'),
	Order_date date,
	Client_no varchar2(6) references client_master(Client_no),
	Salesman_no varchar2(6) references salesman_master(Salesman_no),
	Delivery_type char(1) Default 'F' check(Delivery_type in('P','F')),
	Bill_y_n char(1),
	Delivery_date date,
	check (Order_date<=Delivery_date),
	Order_status varchar2(10) check(Order_status in('InProcess','Fullfilled','BackOrder','Cancelled'))
	);

desc sales_order;

insert into sales_order values(
	'O19001','12-Jan-96','C001','S001','F','N','20-Jan-96','InProcess');
insert into sales_order values(
	'O19002','25-Jan-96','C002','S002','P','N','27-Jan-96','BackOrder');
insert into sales_order values(
	'O46865','18-Feb-96','C003','S003','F','Y','20-Feb-96','Fullfilled');
insert into sales_order values(
	'O19003','03-Apr-96','C001','S001','F','Y','17-Apr-96','Fullfilled');
insert into sales_order values(
	'O46866','20-May-96','C004','S002','P','N','22-May-96','Cancelled');
insert into sales_order values(
	'O19008','24-May-96','C005','S004','F','N','26-May-96','InProcess');

select * from sales_order;

commit;