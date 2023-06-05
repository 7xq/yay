create table Salgrade(
	grade number,
	losal number,
	hisal number);

desc Salgrade;

insert into Salgrade values(
	1,700,1200);
insert into Salgrade values(
	2,1201,1400);
insert into Salgrade values(
	3,1401,2000);
insert into Salgrade values(
	4,2001,3000);
insert into Salgrade values(
	5,3001,9999);
SELECT * FROM Salgrade;

commit;