

create table Emp(
	EMPNO number(4,0) NOT NULL,
	ENAME varchar2(10),
	JOB varchar2(9),
	MGR number(4,0),
	HIREDATE date,
	SAL number(7,2),
	COMM number(7,2),
	DEPTNO number(2,0) NOT NULL
	);

desc Emp;

insert into Emp values(
	7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20);
insert into Emp values(
	7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30);
insert into Emp values(
	7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30);
insert into Emp values(
	7566,'JONES','MANAGER',7839,'02-APR-81',2975,NULL,20);
insert into Emp values(
	7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30);
insert into Emp values(
	7698,'BLAKE','MANAGER',7839,'01-MAY-81',2850,NULL,30);
insert into Emp values(
	7782,'CLARK','MANAGER',7839,'09-JUN-81',2450,NULL,10);
insert into Emp values(
	7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,NULL,20);
insert into Emp values(
	7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10);
insert into Emp values(
	7844,'TURNER','SALESMAN',7698,'08-SEP-81',1500,0,30);
insert into Emp values(
	7876,'ADAMS','CLERK',7788,'23-MAY-87',1100,NULL,20);
insert into Emp values(
	7900,'JAMES','CLERK',7698,'03-DEC-81',950,NULL,30);
insert into Emp values(
	7902,'FORD','ANALYST',7566,'03-DEC-81',3000,NULL,20);
insert into Emp values(
	7934,'MILLER','CLERK',7782,'23-JAN-82',1300,NULL,10);

select * from Emp;

commit;