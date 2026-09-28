SET SERVEROUTPUT ON

DECLARE
  CURSOR c_top IS
    SELECT ENAME, DEPTNO, BASIC_SAL
    FROM (
      SELECT ENAME, DEPTNO, BASIC_SAL
      FROM EMP
      ORDER BY BASIC_SAL DESC
    )
    WHERE ROWNUM <= 5;
BEGIN
  FOR r IN c_top LOOP
    DBMS_OUTPUT.PUT_LINE(
      c_top%ROWCOUNT || '. ' || r.ENAME ||
      ' | Dept=' || r.DEPTNO || ' | Basic Salary=' || r.BASIC_SAL
    );
  END LOOP;
END;
/
