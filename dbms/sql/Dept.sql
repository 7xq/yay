create table Dept(
	deptno number(2,0) NOT NULL,
	dname varchar2(14) NOT NULL,
	loc varchar2(13) NOT NULL);

desc Dept;

insert into Dept values(
	10,'ACCOUNTING','NEW YORK');
insert into Dept values(
	20,'RESEARCH','DALLAS');
insert into Dept values(
	30,'SALES','CHICAGO');
insert into Dept values(
	40,'OPERATIONS','BOSTON');

SELECT * FROM Dept;

commit;