SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT p_pattern CHAR PROMPT 'Enter LIKE pattern (example: A%): '

BEGIN
  FOR r IN (
    SELECT EID, ENAME, DEPTNO, BASIC_SAL
    FROM EMP
    WHERE ENAME LIKE '&p_pattern'
    ORDER BY ENAME
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(r.EID || ' | ' || r.ENAME || ' | ' || r.DEPTNO || ' | ' || r.BASIC_SAL);
  END LOOP;
END;
/
