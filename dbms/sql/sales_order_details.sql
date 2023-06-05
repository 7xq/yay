create table sales_order_details(
	Order_no varchar2(6) references sales_order(Order_no),
	Product_no varchar2(6) references product_master(Product_no),
	Qty_ordered number(8),
	Qty_disp number(8),
	Product_rate number(10,2)
	);

desc sales_order;

insert into sales_order_details values(
	'O19001','P00001',4,4,525);
insert into sales_order_details values(
	'O19001','P07965',2,1,8400);
insert into sales_order_details values(
	'O19001','P07885',2,1,5250);
insert into sales_order_details values(
	'O19002','P00001',10,0,525);
insert into sales_order_details values(
	'O46865','P07868',3,3,3150);
insert into sales_order_details values(
	'O46865','P07885',3,1,5250);
insert into sales_order_details values(
	'O46865','P00001',10,10,525);
insert into sales_order_details values(
	'O46865','P03453',4,4,1050);
insert into sales_order_details values(
	'O19003','P03453',2,2,1050);
insert into sales_order_details values(
	'O19003','P06734',1,1,12000);
insert into sales_order_details values(
	'O46866','P07965',1,0,8400);
insert into sales_order_details values(
	'O46866','P07975',1,0,1050);
insert into sales_order_details values(
	'O19008','P00001',10,5,525);
insert into sales_order_details values(
	'O19008','P07975',5,3,1050);



select * from sales_order_details;

commit;