SET SERVEROUTPUT ON

BEGIN
  FOR r IN (
    SELECT EID, ENAME, DEPTNO, DEPTNAME, GENDER, AGE, BASIC_SAL
    FROM EMP
    WHERE UPPER(GENDER) = 'MALE'
      AND UPPER(DEPTNAME) = 'HR'
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(
      r.EID || ' | ' || r.ENAME || ' | ' || r.DEPTNO || ' | ' ||
      r.DEPTNAME || ' | ' || r.GENDER || ' | ' || r.AGE || ' | ' || r.BASIC_SAL
    );
  END LOOP;
END;
/
