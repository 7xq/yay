drop table product_master;
create table product_master(
	Product_no varchar2(6) primary key check (Product_no like 'P%' ),
	Description varchar2(40) not null,
	Profit_percent number(4,2) not null,
	Unit_measure varchar2(10) not null,
	Qty_on_hand number(8) not null,
	Reorder_level number(8) not null,
	Sell_price number(8,2) not null check (Sell_price >0 ),
	Cost_price number(8,2) not null check (Cost_price >0 ));

desc product_master;

insert into product_master values(
	'P00001','1.44 Floppies',5,'Piece',100,20,525,500);
insert into product_master values(
	'P03453','Monitors',6,'Piece',10,3,12000,11280);
insert into product_master values(
	'P06734','Mouse',5,'Piece',20,5,1050,1000);
insert into product_master values(
	'P07865','1.22 Floppies',5,'Piece',100,20,525,500);
insert into product_master values(
	'P07868','Keyboard',2,'Piece',10,3,3150,3050);
insert into product_master values(
	'P07885','CD Drive',2.5,'Piece',10,3,5250,5100);
insert into product_master values(
	'P07965','540 HDD',4,'Piece',10,3,8400,8000);
insert into product_master values(
	'P07975','1.44 Drive',5,'Piece',10,3,1050,900);
insert into product_master values(
	'P08865','1.22 Drive',5,'Piece',2,3,1025,850);

select * from product_master;

commit;