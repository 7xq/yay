select count(*) from sales_order;

select avg(sell_price) from product_master;

select count(*) from product_master where sell_price>=1500;

select max(sell_price) AS max_price,min(sell_price) AS min_price from product_master; 

select DEPTNO ,EMPNO,MGR from Emp;

select dname,loc from Dept;

select * from Emp where DEPTNO =20;

select ENAME,SAL from Emp where SAL>2500;

select * from Emp where HIREDATE < '31-JUL-81';

select ENAME from Emp where JOB != 'MANAGER';

select ENAME from Emp where ENAME like '%S';

select ENAME from Emp where LENGTH(ENAME)=5;

select ENAME from Emp where ENAME like '__R%';

select ENAME, SAL from Emp where SAL>=1500 AND SAL<=3500;

select ENAME,MGR from Emp where MGR =7902 OR MGR=7566 OR MGR =7789;

select ENAME from Emp where ENAME like 'J%' OR ENAME like 'T%';

select ENAME,JOB from Emp where JOB like '%M%' OR JOB like '%P%';

select DISTINCT(JOB) from Emp; 

select ENAME,JOB,DEPTNO from Emp where DEPTNO=10 OR DEPTNO=20;

select ENAME,SAL,((SAL*0.15)+SAL) AS RAISE_IN_SAL from Emp;

select min(SAL),max(SAL),avg(SAL) from emp;

select count(DISTINCT(JOB)) from Emp;

select max(SAL)-min(SAL) AS DIFF from Emp;

select sum(SAL) from Emp;

select ENAME from Emp where DEPTNO=20;

select ENAME from EMP where COMM IS NULL;

select count(DISTINCT(DEPTNO)) from Emp;

select ENAME,JOB from Emp where MGR IS NULL;

select ENAME,HIREDATE from Emp where sysdate-HIREDATE<38*365;