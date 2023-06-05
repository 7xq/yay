drop table client_master;
create table client_master(
	Client_no varchar2(6) primary key check(Client_no like 'C%'),
	Name varchar2(30) not null,
	Address1 varchar2(30),
	Address2 varchar2(30),
	City varchar2(15),
	State varchar2(15),
	Pincode number(6),
	Balance_due number(10,2));

desc client_master;

insert into client_master values(
	'C001','Ivan Bayross','P-76','Worli','Bombay','Maharastra',400054,15000);
insert into client_master values(
	'C002','VandanaSatiwal','128','Admas Street','Madras','TamilNadu',780001,0);
insert into client_master values(
	'C003','PramadaJaguste','157','Gopalpur','Kolkata','West Bengal',700058,5000);
insert into client_master values(
	'C004','BasuNavindgi','A/12','Nariman','Bombay','Maharastra',400056,0);
insert into client_master values(
	'C005','Ravi Sreedharan','B/34','Rajnagar','Delhi','Delhi',100001,2000);
insert into client_master values(
	'C006','Rukmini','Q-12','Bandra','Bombay','Maharastra',400050,0);

select * from client_master;
commit;