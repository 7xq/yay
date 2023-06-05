select EMPNO,ENAME,DNAME,LOC from EMP,DEPT;
select EMPNO,ENAME,EMP.DEPTNO,DNAME,LOC from EMP,DEPT where EMP.DEPTNO=DEPT.DEPTNO;
select EMPNO,ENAME,DEPT.DEPTNO,DNAME,LOC from EMP,DEPT where EMP.DEPTNO(+)=DEPT.DEPTNO;
select e.ENAME,m.ENAME mgrname from EMP e,EMP m where e.MGR=m.EMPNO;
select ENAME from EMP where MGR is NULL;
select e.ENAME,e.HIREDATE,m.ENAME,m.HIREDATE from EMP e,EMP m where e.MGR=m.EMPNO and e.HIREDATE<m.HIREDATE;
select e.ENAME,e.JOB,e.SAL,m.ENAME,m.JOB,m.SAL from EMP e,EMP m where e.MGR=m.EMPNO;
select e.ENAME,e.SAL,m.ENAME,m.SAL from EMP e,EMP m where e.MGR=m.EMPNO and e.SAL>m.SAL;
select(select min(SAL) from EMP group by JOB having JOB=(select JOB from EMP where ENAME like 'BLAKE'))-SAL Result from EMP where ENAME like 'MILLER';//Topper Mahato
select(select MIN(SAL) from EMP where JOB=(select JOB from EMP where ENAME like 'BLAKE'))-SAL Result from EMP where ENAME like 'MILLER';//Mine
select e.ENAME||' works for '||m.ENAME as " Employees and Their Manager " from EMP e,EMP m where e.MGR=m.EMPNO and e.ENAME like '%A%';
select distinct JOB from EMP where DEPTNO=20 UNION select distinct JOB from EMP where DEPTNO=30;
select distinct JOB from EMP where DEPTNO=20 INTERSECT select distinct JOB from EMP where DEPTNO=30;
select distinct JOB from EMP where DEPTNO=20 MINUS select distinct JOB from EMP where DEPTNO in (10,30);
select ENAME,DEPTNO from EMP where DEPTNO=(select DEPTNO from EMP where ENAME like 'MILLER');
select * from EMP where SAL>(select AVG(SAL) from EMP where HIREDATE<'01-APR-81');
select JOB, avg_sal FROM ( select JOB,AVG(SAL) as avg_sal from EMP group by JOB) where avg_sal=(select max(avg_sal) from (select JOB,avg(SAL) as avg_sal from EMP group by JOB));//MINE_1
select JOB, MAX_SAL from (Select JOB,AVG(SAL) as MAX_SAL from EMP group by JOB order by AVG(SAL) desc) where rownum=1;//MINE_2
select * from EMP where MGR=7698;
select ENAME from EMP where SAL in (select MIN(SAL) from EMP group by DEPTNO);
select ENAME ,DEPTNO,SAL from EMP e where SAL>(select AVG(SAL) from EMP e2 where e2.DEPTNO=e.DEPTNO);//MINE_1_More_Accrate
select ENAME from EMP where SAL>ALL(select AVG(SAL) from EMP group by DEPTNO);//MINE_2_Less_Accurate
select ENAME from EMP where DEPTNO=(select DEPTNO from DEPT where LOC='DALLAS') and SAL>(select MIN(SAL) from EMP where DEPTNO=(select DEPTNO from DEPT where LOC='CHICAGO'));
